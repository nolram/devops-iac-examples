import random

from django.shortcuts import render
from django.http import HttpResponse
from .forms import DrawForm

# Create your views here.


def index(request):
    if request.method == "POST":
        form = DrawForm(request.POST)

        if form.is_valid():
            participants = form.cleaned_data["participants"].splitlines()
            quantity = form.cleaned_data["quantity"]
            winners = random.sample(participants, k=quantity)
            # TODO: Salvar os vencedores no banco
            return render(
                request,
                "app_draw/winners.html",
                {"form": form, "winners": winners},
            )

    else:
        form = DrawForm()
    return render(request, "app_draw/index.html", {"form": form})

import random

from django.shortcuts import render
from django.http import HttpResponse
from .forms import SorteioForm

# Create your views here.


def index(request):
    if request.method == "POST":
        form = SorteioForm(request.POST)

        if form.is_valid():
            participantes = form.cleaned_data["participantes"].splitlines()
            quantidade = form.cleaned_data["quantidade"]
            vencedores = random.sample(participantes, k=quantidade)
            # TODO: Salvar os vencedores no banco
            return render(
                request,
                "app_sorteio/winners.html",
                {"form": form, "winners": vencedores},
            )

    else:
        form = SorteioForm()
    return render(request, "app_sorteio/index.html", {"form": form})

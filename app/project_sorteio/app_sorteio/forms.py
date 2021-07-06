from django import forms


class SorteioForm(forms.Form):
    sorteio_nome = forms.CharField(
        label="Nome do Sorteio",
        max_length=200,
        widget=forms.TextInput(attrs={"class": "form-control"}),
    )
    participantes = forms.CharField(
        widget=forms.Textarea(attrs={"class": "form-control", "rows": 20})
    )
    quantidade = forms.IntegerField(
        widget=forms.NumberInput(attrs={"class": "form-control"}), initial=1
    )
    # Quantidade de Sorteados (Ganhadores)

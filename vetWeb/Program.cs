using vetWeb.Components;
using vetWeb.Services;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddScoped<VeterinarianService>();
builder.Services.AddScoped<AppointmentService>();
builder.Services.AddScoped<AnimalService>();
builder.Services.AddScoped<DiagnosisService>();
builder.Services.AddScoped<DiseaseService>();
builder.Services.AddScoped<InvoiceService>();
builder.Services.AddScoped<InvoiceItemService>();
builder.Services.AddScoped<OwnerService>();
builder.Services.AddScoped<TreatmentService>();



builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseAntiforgery();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();

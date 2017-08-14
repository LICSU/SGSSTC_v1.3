<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SGSSTC.source.sistema.MenuPrincipal.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>    

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    

    <div class="container" style="width:100%;">
        
        <!-- porcentaje fases-->
        <div class="row">

                <div class="col-md-12 col-sm-12">
                  <div class="box box-solid"> 
                      <div class="box-header with-border">
                          <h4 class="box-title">Porcentaje de Cumplimiento de las Fases</h4><br />
                      </div>
                  </div>
                </div> 
                
                <div class="col-md-4 col-sm-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3><asp:label runat="server" text="0" id="evaini"/></h3>
                            <p>Evaluación Inicial</p>
                        </div>
                        
                        <div class="icon">
                            <i class="fa fa-file-text-o"></i>
                        </div>
                        <a href="#" class="small-box-footer">Mas información<i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                
                <div class="col-md-4 col-sm-6">
                      <!-- small box -->
                      <div class="small-box bg-purple">
                        <div class="inner">
                          <h3><asp:label runat="server" text="0" id="lbTrabajadores"/></h3>
                          <p>Planear</p>
                        </div>
                        <div class="icon">
                          <i class="fa fa-fw fa-calendar"></i>
                        </div>
                        <a href="#" class="small-box-footer">Mas información<i class="fa fa-arrow-circle-right"></i></a>
                      </div>
                    </div>

                <div class="col-md-4 col-sm-4">
                      <!-- small box -->
                      <div class="small-box bg-green">
                        <div class="inner">
                          <h3><asp:label runat="server" text="0" id="hacer"/><sup style="font-size: 20px">%</sup></h3>
                          <p>Hacer</p>
                        </div>
                        <div class="icon">
                          <i class="fa fa-tasks"></i>
                        </div>
                        <a href="#" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i></a>
                      </div>
                    </div>
                
                <div class="col-md-4 col-md-offset-2 col-sm-4">
                      <!-- small box -->
                      <div class="small-box bg-yellow">
                        <div class="inner">
                          <h3><asp:label runat="server" text="0" id="lbEstMatRie"/><sup style="font-size: 20px">%</sup></h3>
                          <p>Verificar</p>
                        </div>
                        <div class="icon">
                          <i class="fa fa-search"></i>
                        </div>
                        <a href="#" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i></a>
                      </div>
                    </div>
                
                <div class="col-md-4 col-sm-4">
                      <!-- small box -->
                      <div class="small-box bg-red">
                        <div class="inner">
                          <h3><asp:label runat="server" text="0" id="actuar"/></h3>
                          <p>Actuar</p>
                        </div>
                        <div class="icon">
                          <i class="fa fa-cogs"></i>
                        </div>
                        <a href="#" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i></a>
                      </div>
                    </div>

            </div>
        
        <!-- actividades pendientes y finalizadas-->
        <div class="row">
                <div class="col-md-6">
                  <div class="box">

                    <div class="box-header label-primary">
                      <h3 class="box-title">Actividades pendientes</h3>
                    </div>

                    <div class="box-body table-responsive no-padding">
                      <table class="table table-hover">
                        <tbody>
                            <tr>
                              <th>Actividad</th>
                              <th>Fase</th>
                              <th>Link</th>
                            </tr>

                            <asp:Panel runat="server" id="pActPend"></asp:Panel>

                        </tbody>
                      </table>
                    </div>

                  </div>
                </div>
            
                <div class="col-md-6">
                  <div class="box">

                    <div class="box-header label-success">
                      <h3 class="box-title">Actividades finalizadas</h3>
                    </div>

                    <div class="box-body table-responsive no-padding">
                      <table class="table table-hover">
                        <tbody>
                            <tr>
                              <th>Actividad</th>
                              <th>Fase</th>
                              <th>Link</th>
                            </tr>
                            
                            <asp:Panel runat="server" id="pActFin"></asp:Panel>


                        </tbody>
                      </table>
                    </div>

                  </div>
                </div>
            </div>
        
        <!-- calendario
            <div class="row">
                <div class="col-md-4">
                  <div class="box">

                    <div class="box-header label-primary">
                      <h3 class="box-title">Alarmas del Dia</h3>
                    </div>

                    <div class="box-body table-responsive no-padding">
                      <table class="table table-hover">
                        <tbody>
                            <tr>
                              <th>Alarma</th>
                              <th>Fecha</th>
                              <th>Prioridad</th>
                            </tr>
                            <asp:Panel runat="server" id="pAlarmas"></asp:Panel>

                        </tbody>
                      </table>
                    </div>

                  </div>
                </div>

                <div class="col-md-8">
                    <asp:Calendar id="PrettyCalendar" 
                                class="table table-bordered table-hover dataTable"
                        FirstDayOfWeek="Monday"
                        Runat="server" 
                        OnDayRender="PrettyCalendar_OnDayRender">
                        <TodayDayStyle  BackColor="#5ac594"></TodayDayStyle>
                                        
                        <DayStyle Font-Bold="True" HorizontalAlign="Left" Height="90px" BorderWidth="1px" 
                            BorderStyle="Solid" BorderColor="Black" Width="200px" VerticalAlign="Top"></DayStyle>
                    
                        <NextPrevStyle ForeColor="Black"/>
                    
                        <DayHeaderStyle Font-Size="Large" Font-Bold="True" BorderWidth="1px" ForeColor="Black" 
                            BorderStyle="Solid" BorderColor="Black" Width="100px" BackColor="#00c0ef"></DayHeaderStyle>
                    
                        <TitleStyle Font-Size="Large" Font-Bold="True" BorderWidth="1px" BorderStyle="Solid" 
                            BorderColor="Black" BackColor="#3c8dbc"></TitleStyle>
                    
                        <WeekendDayStyle BackColor="#d2d6de"></WeekendDayStyle>

                    </asp:Calendar>
                </div>
            </div>
        -->
        
        <!-- trabajadores-->
        <div class="row">
                <div class="col-md-12">

                  <div class="box box-danger">
                    <div class="box-header with-border">
                      <h3 class="box-title">Ultimos Trabajadores Ingresados</h3>

                      <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>
                        </button>
                      </div>
                    </div>

                    <div class="box-body no-padding">
                        <asp:Panel runat="server" id="pTrabajadores"></asp:Panel>
                    </div>

                    <div class="box-footer text-center">
                      <a href="../GestionDatos/index_Trabajador.aspx" class="uppercase">Ver todos los trabajadores</a>
                    </div>
                  </div>

                </div>
            </div>
    </div>

</asp:Content>
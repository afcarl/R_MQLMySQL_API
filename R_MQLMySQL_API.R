
# -- ----------------------------------------------------------------------------------------- -- #
# -- Initial Developer: FranciscoME ---------------------------------------------------------- -- #
# -- GitHub Repossitory: http://bit.ly/GitHubRTradingPalAPI ---------------------------------- -- #
# -- License: GNU General Public License ----------------------------------------------------- -- #
# -- ----------------------------------------------------------------------------------------- -- #

library("RMySQL")

Host <- "tradingpal-rds.ckbeoqes1l1a.us-west-1.rds.amazonaws.com"
User <- "RDS_Master"
Password <- "Tecnologia1."
Database <- "Initial_DataBase"
Port <- 3306

# -- -------------------------------------------------------------------------- RDS_Connection -- #
# -- -------------------------------------------------------------------------------------------- #

RDS_Connection <- function(User, Password, Host, Database)  {
  Conexion <- dbConnect(MySQL(), user=User, password=Password, host=Host, dbname=Database)
  return(Conexion)
}

# -- ------------------------------------------------------------------------- RDS_INSERT_INTO -- #
# -- -------------------------------------------------------------------------------------------- #

RDS_INSERT_INTO <- function(P0_Tabla, P1_Columnas, P2_Valores){
  
  # -- Comprobar si tabla existe
  # -- Comprobar si tiene todas las columnas
  # -- Comprobar si las columnas == valores
  # -- Comprobar los tipos de valores para el tipo de columna
  
  return(Query_RDS)
}


SQL_Insert_Senal <- function(Tabla, Columnas, Senal_ID, Senal_TimeStamp, Senal_Accion, Senal_In,
                             Senal_TP, Senal_SL, Senal_LT, Senal_OR)
{

  Q_Valores <- paste("(",paste(paste("'",Senal_ID,"'",sep=""),paste("'",Senal_TimeStamp,"'",sep=""), 
                         paste("'",Senal_Accion,"'",sep=""), paste("'",Senal_In,"'",sep=""),
                         paste("'",Senal_TP,"'",sep=""), 
                         paste("'",Senal_SL,"'",sep=""), paste("'",Senal_LT,"'",sep=""),
                         paste("'",Senal_OR,"'",sep=""), sep=", "), ")",
                     sep="")
  
  Query_txt <- paste(paste("INSERT INTO", Tabla, Columnas, "VALUES", Q_Valores), ";", sep="")
  
  return(Query_txt)

}


Q_ID <- as.numeric(Sys.time())
Q_TimeStamp <- '2016-12-14 10:03:06'
Q_Accion <- "buy"
Q_IN <- "eurusd"
Q_TP <- "1.10203"
Q_SL <- "1.30405"
Q_LT <- "1"
Q_OR <- "R_MachineTrader"

Q_Tabla    <- "Tabla_Senales"
Q_Columnas <- "(ID_Senal,TimeStamp_Senal,Accion,Instrumento,TakeProfit,StopLoss,Lotes,Originador)"
txt_query <- SQL_Insert_Senal(Q_Tabla, Q_Columnas, Q_ID, Q_TimeStamp, Q_Accion, Q_IN,
                              Q_TP, Q_SL, Q_LT, Q_OR)

res_query <- dbGetQuery(conn = DB_Con, statement = txt_query)

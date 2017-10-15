//
//  ViewController.swift
//  SimonDice
//
//  Created by Jorge MR on 30/08/17.
//  Copyright © 2017 Lab Informatica Biomedica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botonAmarillo: UIButton!
    @IBOutlet weak var botonRojo: UIButton!
    @IBOutlet weak var botonAzul: UIButton!
    @IBOutlet weak var botonVerde: UIButton!
    @IBOutlet weak var puntuacion: UILabel!
    @IBOutlet weak var puntuacionMaximaLabel: UILabel!
    
    var secuenciaSimon : [Int] = [1]
    var secuenciaJugador : [Int] = []
    var contadorTapsJugador = 0
    var puntuacionMaxima = 0
    var rondasGanadas = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func colorApretado(_ sender: UIButton) {
        let color = sender.tag
        UIView.animate(withDuration: 0.3) {
        switch color {
        case 1:
            self.secuenciaJugador.append(1)
            self.botonAzul.alpha = 0.3
            self.botonAmarillo.alpha = 1.0
            self.botonVerde.alpha = 0.3
            self.botonRojo.alpha = 0.3
            break;
        case 2:
            self.secuenciaJugador.append(2)
            self.botonAzul.alpha = 0.3
            self.botonAmarillo.alpha = 0.3
            self.botonVerde.alpha = 0.3
            self.botonRojo.alpha = 1.0
            break;
        case 3:
            self.secuenciaJugador.append(3)
            self.botonAzul.alpha = 1.0
            self.botonAmarillo.alpha = 0.3
            self.botonVerde.alpha = 0.3
            self.botonRojo.alpha = 0.3
            break;
        case 4:
            self.secuenciaJugador.append(4)
            self.botonAzul.alpha = 0.3
            self.botonAmarillo.alpha = 0.3
            self.botonVerde.alpha = 1.0
            self.botonRojo.alpha = 0.3
            break;
        default:
            break
        }
        }
        contadorTapsJugador += 1
        if contadorTapsJugador == secuenciaSimon.count {
            if secuenciaJugador == secuenciaSimon {
                print("Continua y sumale a la puntuacion maxima")
                contadorTapsJugador = 0
                rondasGanadas += 1
                secuenciaJugador.removeAll()
                llamaTimer()
            }else{
                print("perdiste")
                if(rondasGanadas>puntuacionMaxima){
                    puntuacionMaxima = rondasGanadas
                    puntuacionMaximaLabel.text = "Puntuación Máxima: \(puntuacionMaxima)"
                }
                rondasGanadas = 0
                contadorTapsJugador = 0
                secuenciaJugador.removeAll()
                secuenciaSimon = [1]
            }
        }
        
    }

    @IBAction func jugar(_ sender: UIButton) {
        //Muestra La Secuencia De Simon
        llamaTimer()
       
    }
    
    func llamaTimer(){
        let siguienteNumero = Int(arc4random_uniform(4)+1)
        secuenciaSimon.append(siguienteNumero)
        print("siguiente numero \(siguienteNumero)")
        print("secuencia count \(secuenciaSimon.count-1)")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(muestraSecuenciaSimon), userInfo: nil, repeats: true)
    }
    
    var elemento = 0
    func muestraSecuenciaSimon(){
        print("tiempo \(elemento)")
        UIView.animate(withDuration: 0.5) {
            switch self.secuenciaSimon[self.elemento] {
            case 1:
                self.botonAzul.alpha = 0.3
                self.botonAmarillo.alpha = 1.0
                self.botonVerde.alpha = 0.3
                self.botonRojo.alpha = 0.3
                break
            case 2:
                self.botonAzul.alpha = 0.3
                self.botonAmarillo.alpha = 0.3
                self.botonVerde.alpha = 0.3
                self.botonRojo.alpha = 1.0
                break
            case 3:
                self.botonAzul.alpha = 1.0
                self.botonAmarillo.alpha = 0.3
                self.botonVerde.alpha = 0.3
                self.botonRojo.alpha = 0.3
                break
            case 4:
                self.botonAzul.alpha = 0.3
                self.botonAmarillo.alpha = 0.3
                self.botonVerde.alpha = 1.0
                self.botonRojo.alpha = 0.3
                break
            default:
                print("entro al default")
                break
            }
        }
        if elemento == secuenciaSimon.count-1 {
            timer.invalidate()
            elemento = 0
        }else{
            elemento+=1
        }
        

}
}


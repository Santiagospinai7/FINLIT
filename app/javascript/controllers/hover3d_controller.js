import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="hover3d"
// export default class extends Controller {
//   static target = [ "3dcard" ]

//   connect() {
//     console.log("HELLO 3D!");
//   }
// }

// Connects to data-controller="hover3d"
export default class extends Controller {
  static targets = ["card"]
  static classes = ["hovered"]

  connect() {
    this.cardTarget.addEventListener("mousemove", this.moveCard.bind(this))
    this.cardTarget.addEventListener("mouseleave", this.resetCard.bind(this))
  }

  disconnect() {
    this.cardTarget.removeEventListener("mousemove", this.moveCard)
    this.cardTarget.removeEventListener("mouseleave", this.resetCard)
  }

  moveCard(event) {
    const rect = this.cardTarget.getBoundingClientRect()
    const x = event.clientX - rect.left
    const y = event.clientY - rect.top
    const centerX = rect.width / 2
    const centerY = rect.height / 2

    // Calculate the rotation amount based on the mouse position
    const distanceX = x - centerX
    const distanceY = y - centerY
    const distance = Math.sqrt(distanceX * distanceX + distanceY * distanceY)
    const maxDistance = Math.sqrt(centerX * centerX + centerY * centerY)
    const rotationX = ((centerY - y) / centerY) * (distance / maxDistance) * 10 // adjust the rotation amount here
    const rotationY = ((x - centerX) / centerX) * (distance / maxDistance) * 10 // adjust the rotation amount here

    // Adjust the perspective based on the mouse position
    const perspective = Math.min(Math.max(rect.width * 2, 600), 1200) // adjust the perspective range here
    const rotateZ = ((centerY - y) / centerY) * (distance / maxDistance) * 10 // adjust the rotation amount here

    this.cardTarget.style.transform = `perspective(${perspective}px) rotateX(${rotationX}deg) rotateY(${rotationY}deg) rotateZ(${rotateZ}deg) scale(1.05)`
    this.cardTarget.classList.add(this.hoveredClass)
  }

  resetCard() {
    this.cardTarget.style.transform = "perspective(600px) rotateX(0) rotateY(0) rotateZ(0) scale(1)"
    this.cardTarget.classList.remove(this.hoveredClass)
  }
}


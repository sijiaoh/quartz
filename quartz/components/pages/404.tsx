import { QuartzComponentConstructor } from "../types"

function NotFound() {
  return (
    <article class="popover-hint">
      <h1>404</h1>
      <p>ページが見つかりませんでした。</p>
    </article>
  )
}

export default (() => NotFound) satisfies QuartzComponentConstructor

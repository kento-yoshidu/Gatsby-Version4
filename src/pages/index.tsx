import * as React from "react"
import { Link, graphql } from "gatsby"

import Layout from "../components/layout"
import Seo from "../components/seo"

import * as Styles from "../styles/index.module.scss"
import Item01 from "../items/01"

const BlogIndex = ({ data, location }) => (
  <Layout
    location={location}
  >
    <>
      <h1>TOP</h1>
      <div className={Styles.wrapper}>
        <Item01 />

        <Item01 />

        <Item01 />

        <Item01 />

        <Item01 />

        <Item01 />

        <Item01 />
      </div>
    </>
  </Layout>
)

export default BlogIndex

/*
export const pageQuery = graphql`
  query {
    site {
      siteMetadata {
        title
      }
    }
    allMarkdownRemark(sort: { fields: [frontmatter___date], order: DESC }) {
      nodes {
        excerpt
        fields {
          slug
        }
        frontmatter {
          date(formatString: "MMMM DD, YYYY")
          title
          description
        }
      }
    }
  }
`
*/

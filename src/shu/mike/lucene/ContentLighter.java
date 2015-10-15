package shu.mike.lucene;

import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;
import org.apache.lucene.search.vectorhighlight.BaseFragmentsBuilder;
import org.apache.lucene.search.vectorhighlight.FastVectorHighlighter;
import org.apache.lucene.search.vectorhighlight.FieldQuery;
import org.apache.lucene.search.vectorhighlight.FragListBuilder;
import org.apache.lucene.search.vectorhighlight.FragmentsBuilder;
import org.apache.lucene.search.vectorhighlight.ScoreOrderFragmentsBuilder;
import org.apache.lucene.search.vectorhighlight.SimpleFragListBuilder;

public class ContentLighter {
	public static String lighter(Analyzer a, Query query, String txt,
			String fieldName) throws IOException, InvalidTokenOffsetsException {
		if (txt == null)
			return "";
		String str = null;
		QueryScorer scorer = new QueryScorer(query);
		Fragmenter fragmenter = new SimpleSpanFragmenter(scorer);
		Formatter formatter = new SimpleHTMLFormatter("<span>", "</span>");
		Highlighter highlighter = new Highlighter(formatter, scorer);
		highlighter.setTextFragmenter(fragmenter);
		str = highlighter.getBestFragment(a, fieldName, txt);
		if (str == null)
			return txt + "...";
		else {

			return str + "...";
		}
	}

	public static String fastLighter(String str, Query query,
			IndexReader reader, int docId, String fieldName) throws IOException {
		FastVectorHighlighter highlighter = getHighlighter();
		FieldQuery fieldQuery = highlighter.getFieldQuery(query);
		String string = highlighter.getBestFragment(fieldQuery, reader, docId,
				fieldName, 80);
		if (string == null)
			return str;
		else {
			return string;
		}
	}

	static FastVectorHighlighter getHighlighter() {
		FragListBuilder fragListBuilder = new SimpleFragListBuilder();
		FragmentsBuilder fragmentsBuilder = new ScoreOrderFragmentsBuilder(
				BaseFragmentsBuilder.COLORED_PRE_TAGS,
				BaseFragmentsBuilder.COLORED_POST_TAGS);
		return new FastVectorHighlighter(true, true, fragListBuilder,
				fragmentsBuilder);
	}

}

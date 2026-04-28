Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBeoIH3o8Gn2awEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 19:03:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6DE4898C5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 19:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296550.1572940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHlq6-0005VL-WD; Tue, 28 Apr 2026 17:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296550.1572940; Tue, 28 Apr 2026 17:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHlq6-0005Sk-T0; Tue, 28 Apr 2026 17:03:14 +0000
Received: by outflank-mailman (input) for mailman id 1296550;
 Tue, 28 Apr 2026 17:03:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wHlq5-0005Sb-4V
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 17:03:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHlq4-009ilz-DV
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 19:03:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69f0e844-bab6-0a2a0a5309dd-0a2a45038596-34
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 19:03:12 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69f0e84f-672d-0a2a45030019-a06583088560-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 19:03:11 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id ED4804289E8D;
 Tue, 28 Apr 2026 13:02:20 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs: Add modern Sphinx design with bright and dark mode
Date: Tue, 28 Apr 2026 18:02:39 +0100
Message-Id: <4e74ef79b0f1b60cc9b04d769f7a69333292c0e0.1777395235.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1777395792-2A567938-21A5DA1F/0/0
X-purgate-type: clean
X-purgate-size: 34009
X-Rspamd-Queue-Id: EE6DE4898C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid];
	NEURAL_SPAM(0.00)[0.996];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[]

Add a modern Sphinx design with bright and dark mode using a
lightweight theme with a clean design and a modern look and feel:
https://sphinx-book-theme.readthedocs.io

Use the current logos from xenproject.org, and
add two addons to enhance documentation work:

- Add support for Mermaid diagrams to render state diagrams, flowcharts,
  sequence diagrams, relationship/requirement diagrams, block diagrams,
  packet diagrams etc. for design documentation: https://mermaid.js.org
  (The NUMA design docs are a good example of using Mermaid diagrams, see b=
elow)

- Add support for using sphinx-autobuild: Auto-Renders the docs site
  on each change and refreshes the web browser:

  https://github.com/sphinx-doc/sphinx-autobuild#readme

Example use:

$ make -C docs sphinx-autobuild # Rebuilds and refreshes the browser:
...
Serving on http://127.0.0.1:8000

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
Preview:
https://bernhard-xen.readthedocs.io/en/modern-sphinx-theme

Example Mermaid diagram documenting the proposed NUMA claims hypercall desi=
gn:
https://bernhard-xen.readthedocs.io/en/claim-sets-v3-design/guest-guide/dom=
/DOMCTL_claim_memory.html
---
 .readthedocs.yaml                  |   9 +--
 docs/.gitignore                    |   1 +
 docs/Makefile                      |  16 ++++-
 docs/_static/favicon-xen-32x32.png | Bin 0 -> 1841 bytes
 docs/_static/logo-xen-reverse.svg  |  57 ++++++++++++++++
 docs/_static/logo-xen.svg          |  61 +++++++++++++++++
 docs/conf.py                       | 102 ++++++++++++++++++++++++++---
 docs/requirements.txt              |   3 +
 8 files changed, 236 insertions(+), 13 deletions(-)
 create mode 100644 docs/_static/favicon-xen-32x32.png
 create mode 100644 docs/_static/logo-xen-reverse.svg
 create mode 100644 docs/_static/logo-xen.svg
 create mode 100644 docs/requirements.txt

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index d3aff7662ebf..edf79dc3d4a1 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -9,10 +9,11 @@ build:
   tools:
     python: "latest"
=20
-  jobs:
-    post_install:
-      # Instead of needing a separate requirements.txt
-      - python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme
+python:
+  install:
+    # Avoids fragmentation of the dependencies across multiple files,
+    # and makes it easier to maintain the dependencies in one place.
+    - requirements: docs/requirements.txt
=20
 sphinx:
   configuration: docs/conf.py
diff --git a/docs/.gitignore b/docs/.gitignore
index c3ce50335ae6..80c3d14ede69 100644
--- a/docs/.gitignore
+++ b/docs/.gitignore
@@ -1,3 +1,4 @@
+/.sphinx/
 /figs/*.png
 /html/
 /man/xl.cfg.5.pod
diff --git a/docs/Makefile b/docs/Makefile
index 8e68300e3b44..797694c85af8 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -55,6 +55,20 @@ build: html txt pdf man-pages figs
 sphinx-html:
 	sphinx-build -b html . sphinx/html
=20
+.PHONY: .sphinx
+.sphinx:
+	if [ ! -d .sphinx ]; then python -m venv .sphinx; fi
+	. .sphinx/bin/activate && pip install -r requirements.txt
+
+.PHONY: sphinx-build
+sphinx-build: .sphinx
+	. .sphinx/bin/activate && $(MAKE) sphinx-html
+
+.PHONY: sphinx-autobuild
+sphinx-autobuild: .sphinx
+	. .sphinx/bin/activate && sphinx-autobuild \
+		--re-ignore '(html|man[0-9]?|pdf|txt|Makefile)' . sphinx/html
+
 .PHONY: html
 html: $(DOC_HTML) html/index.html
=20
@@ -76,7 +90,7 @@ pdf: $(DOC_PDF)
 clean: clean-man-pages
 	$(MAKE) -C figs clean
 	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
-	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
+	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core .sphinx
 	rm -rf html txt pdf sphinx/html
=20
 .PHONY: distclean
diff --git a/docs/_static/favicon-xen-32x32.png b/docs/_static/favicon-xen-=
32x32.png
new file mode 100644
index 0000000000000000000000000000000000000000..a89c3082bbe7b3bf541cd576def=
b34bf0e1b377a
GIT binary patch
literal 1841
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

literal 0
HcmV?d00001

diff --git a/docs/_static/logo-xen-reverse.svg b/docs/_static/logo-xen-reve=
rse.svg
new file mode 100644
index 000000000000..562ca82ba0cd
--- /dev/null
+++ b/docs/_static/logo-xen-reverse.svg
@@ -0,0 +1,57 @@
+<svg xmlns=3D"http://www.w3.org/2000/svg" viewBox=3D"0 0 166 64" fill=3D"n=
one">
+  <g>
+    <path
+      d=3D"M117.049 21.5311C111.908 21.5311 107.752 24.1761 105.561 25.922=
8L106.19 22.5652H93.4495L88.9616 43.3506H102.279L104.553 31.2559C105.663 29=
.8406 107.513 28.0209 109.661 28.0209C113.171 28.0209 112.412 30.8217 112.1=
2 33.0325L110.32 43.0291L123.307 43.0556C123.307 43.0556 124.821 35.0875 12=
5.004 34.2124C126.823 25.4886 124.715 21.5344 117.042 21.5344L117.049 21.53=
11Z"
+      fill=3D"white" />
+    <path
+      d=3D"M88.6766 34.6499C88.6766 34.6499 93.7445 21.4781 75.0705 21.478=
1C56.3965 21.4781 54.948 34.6499 54.948 34.6499C54.948 34.6499 52.6312 44.2=
322 70.7252 44.2322C88.8191 44.2322 88.0965 37.1557 88.0965 37.1557H74.7788=
C74.7788 37.1557 73.7646 39.9565 71.0135 39.9565C68.2625 39.9565 66.5257 38=
.9257 67.2482 34.6499H88.6733H88.6766ZM73.622 26.2476C78.2524 26.2476 76.80=
73 30.5234 76.8073 30.5234H68.8458C68.8458 30.5234 68.9917 26.2476 73.6254 =
26.2476H73.622Z"
+      fill=3D"white" />
+    <path
+      d=3D"M88.6501 45.2564H95.1664C96.121 45.2564 96.9662 45.3757 97.702 =
45.6143C98.4378 45.853 99.0344 46.201 99.4985 46.6584C99.9592 47.1158 100.2=
74 47.676 100.443 48.3422C100.609 49.0084 100.612 49.7608 100.45 50.6027L10=
0.44 50.6458C100.264 51.544 99.9493 52.3329 99.4918 53.0124C99.0344 53.6918=
 98.471 54.2652 97.8014 54.7293C97.1319 55.1933 96.3729 55.5413 95.5244 55.=
77C94.6759 56.002 93.7809 56.1181 92.8396 56.1181H90.7548L89.9096 60.4601H8=
5.6968L88.6534 45.2564H88.6501ZM93.3931 52.8135C94.1455 52.8135 94.772 52.6=
345 95.2658 52.2798C95.763 51.9219 96.0713 51.438 96.1906 50.8281L96.2005 5=
0.785C96.3265 50.1287 96.2105 49.6315 95.8492 49.2901C95.4879 48.9488 94.92=
44 48.7764 94.1588 48.7764H92.1833L91.3978 52.8168H93.3964L93.3931 52.8135Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M102.356 48.7101H106.505L106.045 51.0767C106.532 50.2812 107.11=
2 49.6448 107.785 49.1642C108.458 48.6869 109.28 48.4682 110.257 48.5112L10=
9.412 52.8566H109.064C107.977 52.8566 107.082 53.1748 106.379 53.8112C105.6=
77 54.4475 105.193 55.4485 104.928 56.8075L104.218 60.4568H100.069L102.352 =
48.7068L102.356 48.7101Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M115.305 60.7418C114.364 60.7418 113.529 60.5827 112.803 60.264=
5C112.077 59.9463 111.477 59.5088 111.006 58.952C110.536 58.3952 110.211 57=
.7455 110.039 57.0097C109.863 56.2705 109.856 55.4817 110.022 54.6431L110.0=
32 54.6C110.194 53.7615 110.513 52.9693 110.983 52.2235C111.454 51.4778 112=
.034 50.8281 112.72 50.268C113.406 49.7111 114.182 49.2703 115.04 48.9422C1=
15.899 48.6173 116.8 48.4516 117.742 48.4516C118.683 48.4516 119.515 48.614=
 120.241 48.9422C120.967 49.267 121.567 49.7045 122.037 50.2547C122.508 50.=
8049 122.833 51.4479 123.008 52.1871C123.184 52.9262 123.187 53.7151 123.02=
5 54.5536L123.018 54.5967C122.856 55.4386 122.538 56.2308 122.067 56.9765C1=
21.596 57.7223 121.016 58.3753 120.33 58.9321C119.644 59.4889 118.869 59.92=
98 118.01 60.2579C117.152 60.5827 116.25 60.7451 115.309 60.7451L115.305 60=
.7418ZM116.031 57.2251C116.409 57.2251 116.76 57.1555 117.092 57.0196C117.4=
23 56.8837 117.715 56.6981 117.974 56.4595C118.229 56.2241 118.444 55.9457 =
118.623 55.6308C118.799 55.316 118.922 54.9845 118.991 54.6398L119.001 54.5=
967C119.071 54.2387 119.074 53.9007 119.014 53.5858C118.951 53.2709 118.832=
 52.9925 118.653 52.7572C118.474 52.5218 118.249 52.3296 117.97 52.1871C117=
.695 52.0445 117.374 51.9716 117.012 51.9716C116.651 51.9716 116.283 52.041=
2 115.952 52.1771C115.62 52.313 115.329 52.5019 115.07 52.7373C114.815 52.9=
726 114.596 53.251 114.42 53.5659C114.241 53.8808 114.122 54.2122 114.053 5=
4.5569L114.043 54.6C113.973 54.9613 113.97 55.2961 114.029 55.6143C114.092 =
55.9291 114.212 56.2076 114.391 56.4429C114.57 56.6782 114.795 56.8705 115.=
073 57.013C115.348 57.1555 115.667 57.2284 116.031 57.2284V57.2251Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M122.949 64C122.614 64 122.316 63.9801 122.047 63.947C121.779 6=
3.9105 121.523 63.8773 121.285 63.8475L121.815 61.1097C121.898 61.123 121.9=
87 61.1329 122.084 61.1329H122.355C122.76 61.1329 123.085 61.0302 123.327 6=
0.828C123.568 60.6258 123.738 60.2712 123.837 59.764L125.985 48.7101H130.13=
5L127.954 59.9397C127.811 60.6788 127.592 61.3086 127.304 61.829C127.012 62=
.3494 126.658 62.7703 126.24 63.0885C125.822 63.4067 125.335 63.6387 124.78=
5 63.7845C124.231 63.9304 123.622 64.0033 122.952 64.0033L122.949 64ZM126.6=
97 44.6068H131.02L130.43 47.6462H126.107L126.697 44.6068Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M135.938 60.7418C135.01 60.7418 134.192 60.5927 133.482 60.2977=
C132.773 60.0027 132.19 59.5884 131.735 59.0613C131.281 58.5343 130.97 57.8=
913 130.807 57.1389C130.642 56.3865 130.648 55.5546 130.827 54.6431L130.837=
 54.6C131.003 53.7449 131.305 52.9461 131.739 52.2003C132.173 51.4545 132.7=
1 50.8049 133.346 50.2447C133.983 49.6879 134.695 49.2504 135.481 48.9322C1=
36.266 48.614 137.095 48.4549 137.963 48.4549C138.978 48.4549 139.823 48.62=
72 140.502 48.9753C141.179 49.3233 141.706 49.7906 142.077 50.3773C142.448 =
50.964 142.677 51.6435 142.766 52.4191C142.856 53.1947 142.813 54.0167 142.=
644 54.8851C142.617 55.0143 142.591 55.1535 142.564 55.2994C142.534 55.4452=
 142.501 55.591 142.458 55.7336H134.596C134.629 56.3865 134.835 56.8704 135=
.216 57.1886C135.597 57.5068 136.111 57.6659 136.764 57.6659C137.254 57.665=
9 137.728 57.5731 138.176 57.3842C138.623 57.1953 139.1 56.8937 139.601 56.=
4727L141.513 58.362C140.807 59.0879 139.995 59.6646 139.08 60.0988C138.162 =
60.533 137.118 60.7484 135.945 60.7484L135.938 60.7418ZM139.017 53.6189C139=
.071 52.9693 138.954 52.4489 138.666 52.0644C138.378 51.6799 137.954 51.487=
7 137.387 51.4877C136.82 51.4877 136.353 51.6799 135.928 52.0644C135.507 52=
.4489 135.173 52.966 134.931 53.6189H139.014H139.017Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M148.925 60.7418C148.043 60.7418 147.254 60.5794 146.565 60.254=
6C145.875 59.9297 145.312 59.4922 144.878 58.942C144.443 58.3918 144.142 57=
.7455 143.973 56.9964C143.807 56.2506 143.804 55.4651 143.963 54.6398L143.9=
73 54.5967C144.132 53.7714 144.44 52.9858 144.897 52.2401C145.355 51.4943 1=
45.912 50.8447 146.571 50.2845C147.231 49.7277 147.977 49.2868 148.815 48.9=
587C149.654 48.6339 150.535 48.4715 151.463 48.4715C152.68 48.4715 153.648 =
48.7101 154.364 49.1874C155.083 49.6647 155.617 50.3011 155.968 51.0999L152=
.763 53.1847C152.547 52.7936 152.299 52.4887 152.007 52.2732C151.715 52.054=
5 151.318 51.9484 150.811 51.9484C150.479 51.9484 150.158 52.018 149.846 52=
.1539C149.538 52.2931 149.256 52.4787 149.007 52.7174C148.759 52.956 148.54=
7 53.2311 148.368 53.5427C148.192 53.8542 148.069 54.189 147.996 54.5536L14=
7.987 54.5967C147.914 54.9745 147.904 55.3259 147.957 55.6507C148.01 55.975=
5 148.112 56.2573 148.272 56.4959C148.427 56.7346 148.636 56.9235 148.901 5=
7.0594C149.163 57.1986 149.468 57.2649 149.816 57.2649C150.31 57.2649 150.7=
48 57.1555 151.129 56.9401C151.51 56.7213 151.904 56.4263 152.312 56.0485L1=
54.682 58.0471C153.973 58.8592 153.16 59.5088 152.239 60.0027C151.318 60.49=
32 150.214 60.7418 148.925 60.7418Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M160.313 60.6987C159.06 60.6987 158.146 60.4004 157.562 59.8071=
C156.979 59.2138 156.823 58.2128 157.098 56.8108L158.026 52.0313H156.637L15=
7.284 48.7068H158.673L159.253 45.7304H163.402L162.822 48.7068H165.56L164.91=
4 52.0313H162.179L161.407 56.0054C161.324 56.4263 161.361 56.7246 161.513 5=
6.9069C161.666 57.0892 161.931 57.1787 162.309 57.1787C162.584 57.1787 162.=
859 57.1423 163.134 57.0693C163.409 56.9964 163.681 56.9036 163.949 56.7876=
L163.319 60.0226C162.905 60.2248 162.444 60.3872 161.944 60.5098C161.443 60=
.6324 160.9 60.6954 160.323 60.6954L160.313 60.6987Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M70.2081 13.868H49.0747L37.1027 23.0359L30.1091 13.868H13.1719L=
26.4101 31.2261L0 51.4579H21.1367L34.2025 41.448L41.8358 51.4579H58.773L44.=
8951 33.2579L70.2081 13.868Z"
+      fill=3D"white" />
+    <path
+      d=3D"M21.6537 51.0601C18.0078 48.677 15.0678 45.3128 13.2083 41.3387=
L6.77819 46.264C7.77254 48.1135 8.94588 49.8536 10.275 51.4579H21.1334L21.6=
504 51.0601H21.6537Z"
+      fill=3D"white" />
+    <path d=3D"M15.7638 17.262C16.6985 16.029 17.7526 14.8921 18.9093 13.8=
68H13.1752L15.7638 17.262Z" fill=3D"white" />
+    <path
+      d=3D"M46.6551 51.4579H58.6537C58.6736 51.4314 58.6968 51.4082 58.716=
7 51.385L53.7084 44.8189C51.8457 47.4904 49.4426 49.7575 46.6551 51.4579Z"
+      fill=3D"white" />
+    <path
+      d=3D"M34.4643 54.8685C30.056 54.8685 25.9328 53.6488 22.4094 51.5341=
L21.6438 52.1208L21.4184 52.2931H11.0009C16.7549 58.7531 25.1307 62.8267 34=
.4643 62.8267C43.798 62.8267 52.1738 58.7531 57.9278 52.2931H45.147C41.9419=
 53.9371 38.3125 54.8685 34.4643 54.8685Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M56.771 24.1595L63.3736 19.1016C62.588 17.2587 61.6334 15.5053 =
60.5264 13.8646H50.0227C53.1085 16.6024 55.4684 20.1423 56.7744 24.1595H56.=
771Z"
+      fill=3D"#ffffff" />
+    <path
+      d=3D"M11.0075 31.415C11.0075 26.4134 12.5786 21.7797 15.2468 17.9713=
L12.5057 14.3751L11.4782 13.0294H19.907C23.9076 9.85737 28.9622 7.95815 34.=
461 7.95815C39.9598 7.95815 45.0178 9.85737 49.0151 13.0294H59.9231C54.2222=
 5.1375 44.9449 0 34.4643 0C17.1162 0 3.04935 14.0635 3.04935 31.415C3.0493=
5 36.4829 4.25584 41.269 6.39039 45.505L12.857 40.5531C11.6671 37.7457 11.0=
108 34.6566 11.0108 31.415H11.0075Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M62.2566 23.4403C63.0156 23.0259 63.7812 22.6746 64.5436 22.382=
9C64.2917 21.5443 64.0099 20.719 63.6918 19.9136L57.0263 25.0213C57.2251 25=
.724 57.3909 26.4399 57.5234 27.1658C58.7531 25.7704 60.3574 24.481 62.2533=
 23.4436L62.2566 23.4403Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M56.0286 40.6293C55.5115 41.8325 54.905 42.9893 54.2023 44.0797=
L59.2503 50.7021C60.765 48.7565 62.0478 46.622 63.0786 44.3482C60.1021 43.6=
721 57.6063 42.3197 56.0286 40.6293Z"
+      fill=3D"#85C241" />
+  </g>
+
+</svg>
\ No newline at end of file
diff --git a/docs/_static/logo-xen.svg b/docs/_static/logo-xen.svg
new file mode 100644
index 000000000000..8e04555c257b
--- /dev/null
+++ b/docs/_static/logo-xen.svg
@@ -0,0 +1,61 @@
+<svg xmlns=3D"http://www.w3.org/2000/svg" viewBox=3D"0 0 166 64" fill=3D"n=
one">
+  <g clip-path=3D"url(#clip0_125_42723)">
+    <path
+      d=3D"M117.049 21.5311C111.908 21.5311 107.752 24.1761 105.561 25.922=
8L106.19 22.5652H93.4495L88.9616 43.3506H102.279L104.553 31.2559C105.663 29=
.8406 107.513 28.0209 109.661 28.0209C113.171 28.0209 112.412 30.8217 112.1=
2 33.0325L110.32 43.0291L123.307 43.0556C123.307 43.0556 124.821 35.0875 12=
5.004 34.2124C126.823 25.4886 124.715 21.5344 117.042 21.5344L117.049 21.53=
11Z"
+      fill=3D"black" />
+    <path
+      d=3D"M88.6766 34.6499C88.6766 34.6499 93.7445 21.4781 75.0705 21.478=
1C56.3965 21.4781 54.948 34.6499 54.948 34.6499C54.948 34.6499 52.6312 44.2=
322 70.7252 44.2322C88.8191 44.2322 88.0965 37.1557 88.0965 37.1557H74.7788=
C74.7788 37.1557 73.7646 39.9565 71.0135 39.9565C68.2625 39.9565 66.5257 38=
.9257 67.2482 34.6499H88.6733H88.6766ZM73.622 26.2476C78.2524 26.2476 76.80=
73 30.5234 76.8073 30.5234H68.8458C68.8458 30.5234 68.9917 26.2476 73.6254 =
26.2476H73.622Z"
+      fill=3D"black" />
+    <path
+      d=3D"M88.6501 45.2564H95.1664C96.121 45.2564 96.9662 45.3757 97.702 =
45.6143C98.4378 45.853 99.0344 46.201 99.4985 46.6584C99.9592 47.1158 100.2=
74 47.676 100.443 48.3422C100.609 49.0084 100.612 49.7608 100.45 50.6027L10=
0.44 50.6458C100.264 51.544 99.9493 52.3329 99.4918 53.0124C99.0344 53.6918=
 98.471 54.2652 97.8014 54.7293C97.1319 55.1933 96.3729 55.5413 95.5244 55.=
77C94.6759 56.002 93.7809 56.1181 92.8396 56.1181H90.7548L89.9096 60.4601H8=
5.6968L88.6534 45.2564H88.6501ZM93.3931 52.8135C94.1455 52.8135 94.772 52.6=
345 95.2658 52.2798C95.763 51.9219 96.0713 51.438 96.1906 50.8281L96.2005 5=
0.785C96.3265 50.1287 96.2105 49.6315 95.8492 49.2901C95.4879 48.9488 94.92=
44 48.7764 94.1588 48.7764H92.1833L91.3978 52.8168H93.3964L93.3931 52.8135Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M102.356 48.7101H106.505L106.045 51.0767C106.532 50.2812 107.11=
2 49.6448 107.785 49.1642C108.458 48.6869 109.28 48.4682 110.257 48.5112L10=
9.412 52.8566H109.064C107.977 52.8566 107.082 53.1748 106.379 53.8112C105.6=
77 54.4475 105.193 55.4485 104.928 56.8075L104.218 60.4568H100.069L102.352 =
48.7068L102.356 48.7101Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M115.305 60.7418C114.364 60.7418 113.529 60.5827 112.803 60.264=
5C112.077 59.9463 111.477 59.5088 111.006 58.952C110.536 58.3952 110.211 57=
.7455 110.039 57.0097C109.863 56.2705 109.856 55.4817 110.022 54.6431L110.0=
32 54.6C110.194 53.7615 110.513 52.9693 110.983 52.2235C111.454 51.4778 112=
.034 50.8281 112.72 50.268C113.406 49.7111 114.182 49.2703 115.04 48.9422C1=
15.899 48.6173 116.8 48.4516 117.742 48.4516C118.683 48.4516 119.515 48.614=
 120.241 48.9422C120.967 49.267 121.567 49.7045 122.037 50.2547C122.508 50.=
8049 122.833 51.4479 123.008 52.1871C123.184 52.9262 123.187 53.7151 123.02=
5 54.5536L123.018 54.5967C122.856 55.4386 122.538 56.2308 122.067 56.9765C1=
21.596 57.7223 121.016 58.3753 120.33 58.9321C119.644 59.4889 118.869 59.92=
98 118.01 60.2579C117.152 60.5827 116.25 60.7451 115.309 60.7451L115.305 60=
.7418ZM116.031 57.2251C116.409 57.2251 116.76 57.1555 117.092 57.0196C117.4=
23 56.8837 117.715 56.6981 117.974 56.4595C118.229 56.2241 118.444 55.9457 =
118.623 55.6308C118.799 55.316 118.922 54.9845 118.991 54.6398L119.001 54.5=
967C119.071 54.2387 119.074 53.9007 119.014 53.5858C118.951 53.2709 118.832=
 52.9925 118.653 52.7572C118.474 52.5218 118.249 52.3296 117.97 52.1871C117=
.695 52.0445 117.374 51.9716 117.012 51.9716C116.651 51.9716 116.283 52.041=
2 115.952 52.1771C115.62 52.313 115.329 52.5019 115.07 52.7373C114.815 52.9=
726 114.596 53.251 114.42 53.5659C114.241 53.8808 114.122 54.2122 114.053 5=
4.5569L114.043 54.6C113.973 54.9613 113.97 55.2961 114.029 55.6143C114.092 =
55.9291 114.212 56.2076 114.391 56.4429C114.57 56.6782 114.795 56.8705 115.=
073 57.013C115.348 57.1555 115.667 57.2284 116.031 57.2284V57.2251Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M122.949 64C122.614 64 122.316 63.9801 122.047 63.947C121.779 6=
3.9105 121.523 63.8773 121.285 63.8475L121.815 61.1097C121.898 61.123 121.9=
87 61.1329 122.084 61.1329H122.355C122.76 61.1329 123.085 61.0302 123.327 6=
0.828C123.568 60.6258 123.738 60.2712 123.837 59.764L125.985 48.7101H130.13=
5L127.954 59.9397C127.811 60.6788 127.592 61.3086 127.304 61.829C127.012 62=
.3494 126.658 62.7703 126.24 63.0885C125.822 63.4067 125.335 63.6387 124.78=
5 63.7845C124.231 63.9304 123.622 64.0033 122.952 64.0033L122.949 64ZM126.6=
97 44.6068H131.02L130.43 47.6462H126.107L126.697 44.6068Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M135.938 60.7418C135.01 60.7418 134.192 60.5927 133.482 60.2977=
C132.773 60.0027 132.19 59.5884 131.735 59.0613C131.281 58.5343 130.97 57.8=
913 130.807 57.1389C130.642 56.3865 130.648 55.5546 130.827 54.6431L130.837=
 54.6C131.003 53.7449 131.305 52.9461 131.739 52.2003C132.173 51.4545 132.7=
1 50.8049 133.346 50.2447C133.983 49.6879 134.695 49.2504 135.481 48.9322C1=
36.266 48.614 137.095 48.4549 137.963 48.4549C138.978 48.4549 139.823 48.62=
72 140.502 48.9753C141.179 49.3233 141.706 49.7906 142.077 50.3773C142.448 =
50.964 142.677 51.6435 142.766 52.4191C142.856 53.1947 142.813 54.0167 142.=
644 54.8851C142.617 55.0143 142.591 55.1535 142.564 55.2994C142.534 55.4452=
 142.501 55.591 142.458 55.7336H134.596C134.629 56.3865 134.835 56.8704 135=
.216 57.1886C135.597 57.5068 136.111 57.6659 136.764 57.6659C137.254 57.665=
9 137.728 57.5731 138.176 57.3842C138.623 57.1953 139.1 56.8937 139.601 56.=
4727L141.513 58.362C140.807 59.0879 139.995 59.6646 139.08 60.0988C138.162 =
60.533 137.118 60.7484 135.945 60.7484L135.938 60.7418ZM139.017 53.6189C139=
.071 52.9693 138.954 52.4489 138.666 52.0644C138.378 51.6799 137.954 51.487=
7 137.387 51.4877C136.82 51.4877 136.353 51.6799 135.928 52.0644C135.507 52=
.4489 135.173 52.966 134.931 53.6189H139.014H139.017Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M148.925 60.7418C148.043 60.7418 147.254 60.5794 146.565 60.254=
6C145.875 59.9297 145.312 59.4922 144.878 58.942C144.443 58.3918 144.142 57=
.7455 143.973 56.9964C143.807 56.2506 143.804 55.4651 143.963 54.6398L143.9=
73 54.5967C144.132 53.7714 144.44 52.9858 144.897 52.2401C145.355 51.4943 1=
45.912 50.8447 146.571 50.2845C147.231 49.7277 147.977 49.2868 148.815 48.9=
587C149.654 48.6339 150.535 48.4715 151.463 48.4715C152.68 48.4715 153.648 =
48.7101 154.364 49.1874C155.083 49.6647 155.617 50.3011 155.968 51.0999L152=
.763 53.1847C152.547 52.7936 152.299 52.4887 152.007 52.2732C151.715 52.054=
5 151.318 51.9484 150.811 51.9484C150.479 51.9484 150.158 52.018 149.846 52=
.1539C149.538 52.2931 149.256 52.4787 149.007 52.7174C148.759 52.956 148.54=
7 53.2311 148.368 53.5427C148.192 53.8542 148.069 54.189 147.996 54.5536L14=
7.987 54.5967C147.914 54.9745 147.904 55.3259 147.957 55.6507C148.01 55.975=
5 148.112 56.2573 148.272 56.4959C148.427 56.7346 148.636 56.9235 148.901 5=
7.0594C149.163 57.1986 149.468 57.2649 149.816 57.2649C150.31 57.2649 150.7=
48 57.1555 151.129 56.9401C151.51 56.7213 151.904 56.4263 152.312 56.0485L1=
54.682 58.0471C153.973 58.8592 153.16 59.5088 152.239 60.0027C151.318 60.49=
32 150.214 60.7418 148.925 60.7418Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M160.313 60.6987C159.06 60.6987 158.146 60.4004 157.562 59.8071=
C156.979 59.2138 156.823 58.2128 157.098 56.8108L158.026 52.0313H156.637L15=
7.284 48.7068H158.673L159.253 45.7304H163.402L162.822 48.7068H165.56L164.91=
4 52.0313H162.179L161.407 56.0054C161.324 56.4263 161.361 56.7246 161.513 5=
6.9069C161.666 57.0892 161.931 57.1787 162.309 57.1787C162.584 57.1787 162.=
859 57.1423 163.134 57.0693C163.409 56.9964 163.681 56.9036 163.949 56.7876=
L163.319 60.0226C162.905 60.2248 162.444 60.3872 161.944 60.5098C161.443 60=
.6324 160.9 60.6954 160.323 60.6954L160.313 60.6987Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M70.2081 13.868H49.0747L37.1027 23.0359L30.1091 13.868H13.1719L=
26.4101 31.2261L0 51.4579H21.1367L34.2025 41.448L41.8358 51.4579H58.773L44.=
8951 33.2579L70.2081 13.868Z"
+      fill=3D"black" />
+    <path
+      d=3D"M21.6537 51.0601C18.0078 48.677 15.0678 45.3128 13.2083 41.3387=
L6.77819 46.264C7.77254 48.1135 8.94588 49.8536 10.275 51.4579H21.1334L21.6=
504 51.0601H21.6537Z"
+      fill=3D"black" />
+    <path d=3D"M15.7638 17.262C16.6985 16.029 17.7526 14.8921 18.9093 13.8=
68H13.1752L15.7638 17.262Z" fill=3D"black" />
+    <path
+      d=3D"M46.6551 51.4579H58.6537C58.6736 51.4314 58.6968 51.4082 58.716=
7 51.385L53.7084 44.8189C51.8457 47.4904 49.4426 49.7575 46.6551 51.4579Z"
+      fill=3D"black" />
+    <path
+      d=3D"M34.4643 54.8685C30.056 54.8685 25.9328 53.6488 22.4094 51.5341=
L21.6438 52.1208L21.4184 52.2931H11.0009C16.7549 58.7531 25.1307 62.8267 34=
.4643 62.8267C43.798 62.8267 52.1738 58.7531 57.9278 52.2931H45.147C41.9419=
 53.9371 38.3125 54.8685 34.4643 54.8685Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M56.771 24.1595L63.3736 19.1016C62.588 17.2587 61.6334 15.5053 =
60.5264 13.8646H50.0227C53.1085 16.6024 55.4684 20.1423 56.7744 24.1595H56.=
771Z"
+      fill=3D"black" />
+    <path
+      d=3D"M11.0075 31.415C11.0075 26.4134 12.5786 21.7797 15.2468 17.9713=
L12.5057 14.3751L11.4782 13.0294H19.907C23.9076 9.85737 28.9622 7.95815 34.=
461 7.95815C39.9598 7.95815 45.0178 9.85737 49.0151 13.0294H59.9231C54.2222=
 5.1375 44.9449 0 34.4643 0C17.1162 0 3.04935 14.0635 3.04935 31.415C3.0493=
5 36.4829 4.25584 41.269 6.39039 45.505L12.857 40.5531C11.6671 37.7457 11.0=
108 34.6566 11.0108 31.415H11.0075Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M62.2566 23.4403C63.0156 23.0259 63.7812 22.6746 64.5436 22.382=
9C64.2917 21.5443 64.0099 20.719 63.6918 19.9136L57.0263 25.0213C57.2251 25=
.724 57.3909 26.4399 57.5234 27.1658C58.7531 25.7704 60.3574 24.481 62.2533=
 23.4436L62.2566 23.4403Z"
+      fill=3D"#85C241" />
+    <path
+      d=3D"M56.0286 40.6293C55.5115 41.8325 54.905 42.9893 54.2023 44.0797=
L59.2503 50.7021C60.765 48.7565 62.0478 46.622 63.0786 44.3482C60.1021 43.6=
721 57.6063 42.3197 56.0286 40.6293Z"
+      fill=3D"#85C241" />
+  </g>
+  <defs>
+    <clipPath id=3D"clip0_125_42723">
+      <rect width=3D"165.553" height=3D"64" fill=3D"white" />
+    </clipPath>
+  </defs>
+</svg>
\ No newline at end of file
diff --git a/docs/conf.py b/docs/conf.py
index 2fb8bafe6589..fbcffa5efa79 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -56,12 +56,75 @@ finally:
=20
 # If your documentation needs a minimal Sphinx version, state it here.
 #
-needs_sphinx =3D '1.4'
+needs_sphinx =3D "7.0"
=20
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions =3D []
+extensions =3D ["sphinx.ext.autosectionlabel"]
+
+try:
+    import sphinxcontrib.mermaid
+
+    extensions.append("sphinxcontrib.mermaid")
+except ImportError:
+    pass
+
+
+def on_build_finished(app, exception):
+    if exception:
+        return
+
+    common_install =3D """
+        Alternatively, you can use pipx to install sphinx and the needed
+        extras in an isolated environment with:\n
+            pipx install sphinx
+            pipx runpip sphinx install -r docs/requirements.txt\n
+        Or, use `make -C docs sphinx-env-build` to build the documentation
+        in a suitable Python environment with all dependencies.\n"""
+
+    # See https://sphinx-book-theme.readthedocs.io for more info:
+    if not sys.modules.get("sphinx_book_theme"):
+        sys.stderr.write("""
+        To fix rendering the HTML theme, install `sphinx_book_theme` in
+        your Python venv. On Debian-based systems, you can install it with=
:\n
+            sudo apt install python3-sphinx-book-theme""" + common_install)
+
+    # See https://sphinxcontrib-mermaid-demo.readthedocs.io
+    # or  https://github.com/mgaitan/sphinxcontrib-mermaid for more info:
+    if not sys.modules.get("sphinxcontrib.mermaid"):
+        sys.stderr.write("""
+        To fix rendering mermaid diagrams, install `sphinxcontrib.mermaid`=
 in
+        your Python venv. On Debian-based systems, you can install it with=
:\n
+            sudo apt install python3-sphinxcontrib-mermaid""" + common_ins=
tall)
+
+    # See https://github.com/sphinx-doc/sphinx-autobuild#readme for more i=
nfo:
+    try:
+        import sphinx_autobuild
+    except ImportError:
+        print("The generated documentation is available at:")
+        print(f"file://{app.outdir}/index.html")
+        print("You can also serve it locally with:")
+        print(f"  (cd {app.outdir}; python -m http.server)")
+        print("To auto-rebuild and auto-refresh on changes, install")
+        print("`sphinx-autobuild` in your Python venv and run:")
+        print(" sphinx-autobuild docs docs/sphinx/html")
+        print("Or simply use `make -C docs sphinx-autobuild` to build & se=
rve")
+
+
+def setup(app):
+    app.connect("build-finished", on_build_finished)
+
+
+# Extension options
+
+# sphinxcontrib.mermaid
+mermaid_init_js =3D """
+mermaid.initialize({ startOnLoad: true });
+"""
+
+# sphinx.ext.autosectionlabel
+autosectionlabel_prefix_document =3D True
=20
 # Add any paths that contain templates here, relative to this directory.
 templates_path =3D ['_templates']
@@ -82,7 +145,7 @@ language =3D 'en'
 # List of patterns, relative to source directory, that match files and
 # directories to ignore when looking for source files.
 # This pattern also affects html_static_path and html_extra_path.
-exclude_patterns =3D [u'sphinx/output', 'Thumbs.db', '.DS_Store']
+exclude_patterns =3D [u'sphinx/output', 'Thumbs.db', '.DS_Store', '.sphinx=
']
=20
 # The name of the Pygments (syntax highlighting) style to use.
 pygments_style =3D None
@@ -93,15 +156,38 @@ highlight_language =3D 'none'
 # -- Options for HTML output ---------------------------------------------=
----
 # https://www.sphinx-doc.org/en/master/usage/configuration.html#options-fo=
r-html-output
=20
+html_title =3D f"Xen Hypervisor {version} Documentation"
+html_logo =3D "_static/logo-xen.svg"
+html_favicon =3D "_static/favicon-xen-32x32.png"
+
 # The theme to use for HTML and HTML Help pages.  See the documentation for
 # a list of builtin themes.
 #
 try:
-    import sphinx_rtd_theme
-    html_theme =3D 'sphinx_rtd_theme'
-    html_theme_path =3D [sphinx_rtd_theme.get_html_theme_path()]
+    import sphinx_book_theme
+
+    html_theme =3D 'sphinx_book_theme'
+    # Theme options are theme-specific and customize the look and feel
+    # of a theme further. For a list of options available for each theme,
+    # see the documentation of that theme. e.g. for sphinx_book_theme, see
+    # https://sphinx-book-theme.readthedocs.io/en/latest/configure.html#op=
tions
+    html_theme_options =3D {
+        "logo": {
+            "text": f"Xen Hypervisor {version}",
+            "image_light": html_logo,
+            "image_dark": "_static/logo-xen-reverse.svg",
+        },
+        "home_page_in_toc": False,
+        # Depth of the table of contents tree to show in the right sidebar
+        "show_toc_level": 3,
+        "repository_url": "https://github.com/xen-project/xen",
+        "use_repository_button": True,
+    }
 except ImportError:
-    sys.stderr.write('Warning: The Sphinx \'sphinx_rtd_theme\' HTML theme =
was not found. Make sure you have the theme installed to produce pretty HTM=
L output. Falling back to the default theme.\n')
+    sys.stderr.write(
+        "sphinx_book_theme was not found, falling back to the default them=
e.\n"
+    )
+
=20
 # Theme options are theme-specific and customize the look and feel of a th=
eme
 # further.  For a list of options available for each theme, see the
@@ -112,7 +198,7 @@ except ImportError:
 # Add any paths that contain custom static files (such as style sheets) he=
re,
 # relative to this directory. They are copied after the builtin static fil=
es,
 # so a file named "default.css" will overwrite the builtin "default.css".
-html_static_path =3D []
+html_static_path =3D ["_static"]
=20
 # Custom sidebar templates, must be a dictionary that maps document names
 # to template names.
diff --git a/docs/requirements.txt b/docs/requirements.txt
new file mode 100644
index 000000000000..0cec13235162
--- /dev/null
+++ b/docs/requirements.txt
@@ -0,0 +1,3 @@
+sphinx-book-theme=3D=3D1.2.0
+sphinxcontrib-mermaid=3D=3D2.0.1
+sphinx-autobuild=3D=3D2025.08.25
--=20
2.39.5



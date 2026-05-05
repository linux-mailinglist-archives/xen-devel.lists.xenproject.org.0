Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHzTL78x+mlXKgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 20:06:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 789614D27F1
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 20:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300955.1575368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKKAT-0006BN-1P; Tue, 05 May 2026 18:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300955.1575368; Tue, 05 May 2026 18:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKKAS-00069H-U4; Tue, 05 May 2026 18:06:48 +0000
Received: by outflank-mailman (input) for mailman id 1300955;
 Tue, 05 May 2026 18:06:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wKKAQ-00068o-To
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 18:06:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKKAQ-00HQem-Ah
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 20:06:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa31ad-5cb7-0a2a0a5109dd-0a2a4503b9ba-20
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:06:46 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fa31b5-672d-0a2a45030019-a06583098e58-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 20:06:46 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 27A5081E0C2D;
 Tue,  5 May 2026 14:05:41 -0400 (EDT)
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
Subject: [PATCH 2/3] Sphinx docs: Enable autosectionlabels and Mermaid support
Date: Tue,  5 May 2026 19:03:11 +0100
Message-Id: <1d0e98b9002dcb12765a51ae43a55d00e7cc1691.1778004073.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1778004073.git.bernhard.kaindl@citrix.com>
References: <cover.1778004073.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1778004406-A2378938-B9FDAE60/0/0
X-purgate-type: clean
X-purgate-size: 2055
X-Rspamd-Queue-Id: 789614D27F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.694];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]

Enable sphinx.ext.autosectionlabel which allows referencing sections
using their title, without needing to add explicit labels to each section
and enable support for Mermaid diagrams for design documents.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 .readthedocs.yaml |  2 +-
 docs/conf.py      | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index d3aff7662ebf..c61d5eb74107 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -12,7 +12,7 @@ build:
   jobs:
     post_install:
       # Instead of needing a separate requirements.txt
-      - python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme
+      - python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme sphinxcontrib-mermaid
 
 sphinx:
   configuration: docs/conf.py
diff --git a/docs/conf.py b/docs/conf.py
index 2fb8bafe6589..8aeab17a1a83 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -63,6 +63,27 @@ needs_sphinx = '1.4'
 # ones.
 extensions = []
 
+
+# autosectionlabel allows referencing sections using their title, without
+# needing to add explicit labels to each section. Used by design documents.
+extensions.append("sphinx.ext.autosectionlabel")
+# Setting autosectionlabel_prefix_document to True allows disambiguating
+# between sections with the same title in different documents by prefixing
+# the label with the document path.
+autosectionlabel_prefix_document = True
+
+
+# Mermaid diagrams are used in the design documents, so we try to
+# load the extension if it's available, but don't fail if it's not:
+try:
+    import sphinxcontrib.mermaid
+
+    extensions.append("sphinxcontrib.mermaid")
+    # For included Mermaid diagram files, init the extension explicitly.
+    mermaid_init_js = "mermaid.initialize({ startOnLoad: true });"
+except ImportError:
+    pass
+
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
 
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNqICuf98GnubgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 20:35:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C233548AB38
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 20:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296760.1573030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHnGn-0005Ce-U1; Tue, 28 Apr 2026 18:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296760.1573030; Tue, 28 Apr 2026 18:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHnGn-00059k-RL; Tue, 28 Apr 2026 18:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1296760;
 Tue, 28 Apr 2026 18:34:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wHnGm-00059e-Fq
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 18:34:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHnGl-009D8Q-JV
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 20:34:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69f0fdc3-e002-0a2a0a5209dd-0a2a4507c9a2-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 20:34:51 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69f0fdca-229c-0a2a45070019-a0658309d5fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 20:34:51 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id A25EA81995B5;
 Tue, 28 Apr 2026 14:33:49 -0400 (EDT)
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
Subject: [PATCH] docs: Format (void *) to fix reStructuredText emphasis warnings
Date: Tue, 28 Apr 2026 19:34:28 +0100
Message-Id: <05b61bdfce381176a6c4b8844db1fba3fa0982ce.1777401225.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1777401291-AE16DC48-9705ED87/0/0
X-purgate-type: clean
X-purgate-size: 2724
X-Rspamd-Queue-Id: C233548AB38
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
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:email,bernhard-xen.readthedocs.io:url]

Fix warnings when rendering the Sphinx documentation because
with reStructuredText, in the character sequence of '(void *)',
the characters *) are seen as an emphasis start-string:

WARNING: Inline emphasis start-string without end-string. [docutils]

Fix this by formatting it with ``(void *)`` as an inline literal
which can be used for monospaced code snippets like these that
can contain any characters without any markup interpretation.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
Preview based on the new theme and design docs arrangement just submitted:
https://bernhard-xen.readthedocs.io/en/void/misra/rules.html
https://bernhard-xen.readthedocs.io/en/void/misra/deviations.html
---
 docs/misra/deviations.rst | 4 ++--
 docs/misra/rules.rst      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index b04830959694..c972d5b2ad49 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -366,13 +366,13 @@ Deviations related to MISRA C:2012 Rules:
      - Tagged as `safe` for ECLAIR.
 
    * - R11.1
-     - The conversion from a function pointer to unsigned long or '(void *)' does
+     - The conversion from a function pointer to unsigned long or ``(void *)`` does
        not lose any information, provided that the target type has enough bits
        to store it.
      - Tagged as `safe` for ECLAIR.
 
    * - R11.1
-     - Conversion from unsigned long or '(void *)' to a function pointer can
+     - Conversion from unsigned long or ``(void *)`` to a function pointer can
        restore full information, provided that the source type has enough bits
        to restore it.
      - Tagged as `safe` for ECLAIR.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index b3e929307d51..fc6fdfd313d0 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -430,9 +430,9 @@ maintainers if you want to suggest a change.
        and any other type
      - All conversions to integer types are permitted if the destination
        type has enough bits to hold the entire value. Conversions to bool
-       and void* are permitted. Conversions from 'void noreturn (*)(...)'
-       to 'void (*)(...)' are permitted. Conversions from unsigned long or
-       '(void *)' to a function pointer are permitted.
+       and ``void *`` are permitted. Conversions from ``void noreturn (*)(...)``
+       to ``void (*)(...)`` are permitted. Conversions from unsigned long or
+       ``(void *)`` to a function pointer are permitted.
        Example::
 
            unsigned long func_addr = (unsigned long)&some_function;
-- 
2.39.5



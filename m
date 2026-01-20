Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL8+H7LQb2mgMQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 20:00:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30BE49EF8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 20:00:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209299.1521361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viGwq-0005Mr-0s; Tue, 20 Jan 2026 18:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209299.1521361; Tue, 20 Jan 2026 18:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viGwp-0005Jm-U2; Tue, 20 Jan 2026 18:59:27 +0000
Received: by outflank-mailman (input) for mailman id 1209299;
 Tue, 20 Jan 2026 18:59:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1viGwo-0005Jg-Cb
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 18:59:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1viGwo-00Crcn-0t;
 Tue, 20 Jan 2026 18:59:25 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1viGwn-00BwMN-1f;
 Tue, 20 Jan 2026 18:59:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From; bh=ZkHW951EcvlKRgwnk8lLtbogl+mge00JxhboUAq9tIk=; b=HGNt8b
	1wr9mfy6GAzqmpXnpL0af7qlLBz5U+Nf9/LCYCXOkQpVTMgdsbwiPlY+l2hOb3lGuo9Au3LAd9IAI
	4FhCTGxpaMQYfpuNNIdZ8n7FPl/vGQWVyNoYDpiyc5pPmY4Rk7WooIKRWZ8bmwoJCUHUBFlURA/79
	mzuAiSDtP8Y=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v4] INSTALL: remove unsupported XEN_CONFIG_EXPERT from documentation
Date: Tue, 20 Jan 2026 10:59:05 -0800
Message-ID: <20260120185904.979992-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E30BE49EF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Denis Mukhin <dmukhin@ford.com> 

Remove XEN_CONFIG_EXPERT explanation and also correct information in
the entire "Xen Hypervisor" section.

Amends: 37339ba9ef46 ("automation: Remove XEN_CONFIG_EXPERT leftovers")
Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- text correction suggested by Jan
- Link to v3: https://lore.kernel.org/xen-devel/20260120071654.640873-3-dmukhin@ford.com/
---
 INSTALL | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/INSTALL b/INSTALL
index c2e756bf4b2b..fb9efe884fb1 100644
--- a/INSTALL
+++ b/INSTALL
@@ -25,19 +25,12 @@ Xen Hypervisor
 Xen itself is configured via a `kconfig' system borrowed from Linux.
 See https://www.kernel.org/doc/html/v5.4/kbuild/.
 
-Note that unlike with Linux, and contrary to that document, you cannot
-look at Kconfig files, or the default or generated config files etc.,
-to find available configuration options.  This is because it is only
-supported (and security supported) by the Xen Project, to change a
-small subset of the options.  Attempts to change other options will be
-silently overridden.  The only way to find which configuration options
-are available is to run `make menuconfig' or the like.
-
-You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
-in your environment.  However, doing this is not supported and the
-resulting configurations do not receive security support.  If you set
-this variable there is nothing stopping you setting dangerously
-experimental combinations of features - not even any warnings.
+Only a subset of options is supported or security-supported by Xen
+Project. You can explore all available options, including unsupported
+ones and those recommended only for expert users, e.g. by using `make
+menuconfig` and enabling `CONFIG_UNSUPPORTED` and/or `CONFIG_EXPERT`.
+However, enabling these options is not supported, and configurations
+resulting from them do not receive security support.
 
 Options recognized by configure
 ===============================
-- 
2.52.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N3zSD9llHWroaAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 12:58:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC7761DFE6
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 12:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323793.1589465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0LD-00063r-8y; Mon, 01 Jun 2026 10:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323793.1589465; Mon, 01 Jun 2026 10:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU0LD-0005yn-4p; Mon, 01 Jun 2026 10:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1323793;
 Mon, 01 Jun 2026 10:39:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <eduardomarinho@em-4.local>) id 1wU03r-0003b1-EO
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 10:39:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU03n-003t1N-4R
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 12:39:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <eduardomarinho@em-4.local>)
 id 6a1d6179-e002-0a2a0a5209dd-0a2a45088ece-6
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 12:39:54 +0200
Received: from [179.190.196.82] (helo=EM-4.local)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <eduardomarinho@em-4.local>)
 id 6a1d6179-63b5-0a2a45080019-b3bec452ccc6-1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 12:39:54 +0200
Received: by EM-4.local (Postfix, from userid 501)
 id 8CBE544A44A5; Mon,  1 Jun 2026 07:39:52 -0300 (-03)
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
From: Eduardo Marinho <eduardomarinho@pm.me>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	Eduardo Marinho <eduardomarinho@pm.me>
Subject: [PATCH 2/3] docs/admin-guide: drop duplicated word in microcode-loading.rst
Date: Mon,  1 Jun 2026 07:39:04 -0300
Message-ID: <20260601103905.20982-3-eduardomarinho@pm.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260601103905.20982-1-eduardomarinho@pm.me>
References: <20260601103905.20982-1-eduardomarinho@pm.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1780310394-B6169DB1-8A1E5B38/0/0
X-purgate-type: clean
X-purgate-size: 908
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pm.me : SPF not aligned (strict), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:eduardomarinho@pm.me,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[eduardomarinho@pm.me,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eduardomarinho@pm.me,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.360];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: BCC7761DFE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the duplicated word "contains" in the microcode loading documentation.

Signed-off-by: Eduardo Marinho <eduardomarinho@pm.me>
---
 docs/admin-guide/microcode-loading.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/admin-guide/microcode-loading.rst b/docs/admin-guide/microcode-loading.rst
index 148bc8559b..cd8ebeb564 100644
--- a/docs/admin-guide/microcode-loading.rst
+++ b/docs/admin-guide/microcode-loading.rst
@@ -97,7 +97,7 @@ appropriate distro package, and add ``ucode=scan`` to Xen's command line.
 
 Xen is compatible with the Linux initrd microcode protocol.  The initrd is
 expected to be generated with an uncompressed CPIO archive at the beginning
-which contains contains one of these two files::
+which contains one of these two files::
 
   kernel/x86/microcode/GenuineIntel.bin
   kernel/x86/microcode/AuthenticAMD.bin
-- 
2.52.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIV+D6fQw2lBuQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 13:10:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015D1324835
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 13:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262134.1554786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5N3Q-0001QS-0W; Wed, 25 Mar 2026 12:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262134.1554786; Wed, 25 Mar 2026 12:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5N3P-0001LL-Rv; Wed, 25 Mar 2026 12:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1262134;
 Wed, 25 Mar 2026 12:03:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhaoguohan@kylinos.cn>) id 1w5Mww-0000e6-0Y
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 12:03:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5Mwv-004h1T-Cs
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:03:01 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhaoguohan@kylinos.cn>)
 id 69c3cef4-bab6-0a2a0a5309dd-0a2a4501a90a-8
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:03:00 +0100
Received: from [124.126.103.232] (helo=mailgw.kylinos.cn)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <zhaoguohan@kylinos.cn>)
 id 69c3ceef-6400-0a2a45010019-7c7e67e8c0b0-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:03:00 +0100
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <zhaoguohan@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 1348781306; Wed, 25 Mar 2026 20:02:48 +0800
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
X-UUID: 8ade3388284211f1a21c59e7364eecb8-20260325
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:140d25ea-eb09-4808-8438-de17a524f1a1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:ab8db2c8cd2d23d717ed6e4592da157a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8ade3388284211f1a21c59e7364eecb8-20260325
X-User: zhaoguohan@kylinos.cn
From: GuoHan Zhao <zhaoguohan@kylinos.cn>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	GuoHan Zhao <zhaoguohan@kylinos.cn>
Subject: [PATCH] xen/privcmd: unregister xenstore notifier on module exit
Date: Wed, 25 Mar 2026 20:02:46 +0800
Message-ID: <20260325120246.252899-1-zhaoguohan@kylinos.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774440180-22EE2DF3-3651D3B0/0/0
X-purgate-type: clean
X-purgate-size: 1111
X-Spamd-Result: default: False [1.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[kylinos.cn];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:zhaoguohan@kylinos.cn,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[zhaoguohan@kylinos.cn,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[zhaoguohan@kylinos.cn,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,kylinos.cn:email,kylinos.cn:mid]
X-Rspamd-Queue-Id: 015D1324835
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 453b8fb68f36 ("xen/privcmd: restrict usage in
unprivileged domU") added a xenstore notifier to defer setting the
restriction target until Xenstore is ready.

XEN_PRIVCMD can be built as a module, but privcmd_exit() leaves that
notifier behind. Balance the notifier lifecycle by unregistering it on
module exit.

This is harmless even if xenstore was already ready at registration
time and the notifier was never queued on the chain.

Fixes: 453b8fb68f3641fe ("xen/privcmd: restrict usage in unprivileged domU")
Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
---
 drivers/xen/privcmd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index bbf9ee21306c..15ba592236e8 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -1765,6 +1765,9 @@ static int __init privcmd_init(void)
 
 static void __exit privcmd_exit(void)
 {
+	if (!xen_initial_domain())
+		unregister_xenstore_notifier(&xenstore_notifier);
+
 	privcmd_ioeventfd_exit();
 	privcmd_irqfd_exit();
 	misc_deregister(&privcmd_dev);
-- 
2.43.0



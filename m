Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJVkGFAwcmmadwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:12:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7F867BC5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 15:12:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211096.1522631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivQ6-0002j1-Cf; Thu, 22 Jan 2026 14:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211096.1522631; Thu, 22 Jan 2026 14:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivQ6-0002hW-9u; Thu, 22 Jan 2026 14:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1211096;
 Thu, 22 Jan 2026 14:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DCSd=73=bitdefender.com=mdontu@srs-se1.protection.inumbo.net>)
 id 1vivQ4-0002hQ-Sl
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:12:20 +0000
Received: from mx-robo01.bitdefender.com (mx-robo.bitdefender.com
 [195.189.155.117]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ccc64b5-f79c-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 15:12:19 +0100 (CET)
Received: from mdontu-l.bitdefender.biz (unknown [10.22.91.150])
 by mx-robo01.bitdefender.com (Postfix) with ESMTP id 7F11CA4;
 Thu, 22 Jan 2026 16:12:18 +0200 (EET)
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
X-Inumbo-ID: 5ccc64b5-f79c-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bitdefender.com;
	s=mx-robo; t=1769091138;
	bh=Kk50ChF+yX2UTCKAMx8cwaUVuymeyydjBUGzAqwieV4=;
	h=From:To:Cc:Subject:Date:From;
	b=BidChGXg9fNijGEH5osx1WXCHtvpfuPPtROFgxxH4PhozYXKuhc64d6Mb2olqFhRh
	 av4KlJt4oaOjAmpaFF9UrAFmT+bZWGN5bgHkf0BSLtySl1tOFvlvXPB6FvUxhoO4y8
	 gTAtZTKAImHc3RuYS0BYa/kiEcFrRGTGWH37eGjY=
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
To: xen-devel@lists.xenproject.org
Cc: alexandru.isaila@gmail.com,
	petrepircalabu@yahoo.com,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: remove Alexandru Isaila and Petre Pircalabu as vm_event reviewers
Date: Thu, 22 Jan 2026 16:11:54 +0200
Message-ID: <43ab3051082a2f9a0291752ace7104738c1156fb.1769089923.git.mdontu@bitdefender.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[bitdefender.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[bitdefender.com:s=mx-robo];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[mdontu@bitdefender.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alexandru.isaila@gmail.com,m:petrepircalabu@yahoo.com,m:mdontu@bitdefender.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alexandruisaila@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mdontu@bitdefender.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,yahoo.com,bitdefender.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DKIM_TRACE(0.00)[bitdefender.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB7F867BC5
X-Rspamd-Action: no action

Alexandru and Petre are no longer with Bitdefender.

Signed-off-by: Mihai Donțu <mdontu@bitdefender.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf00be928c..0ceb4bba21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -569,8 +569,6 @@ F:	tools/
 
 VM EVENT, MEM ACCESS and MONITOR
 M:	Tamas K Lengyel <tamas@tklengyel.com>
-R:	Alexandru Isaila <aisaila@bitdefender.com>
-R:	Petre Pircalabu <ppircalabu@bitdefender.com>
 S:	Supported
 F:	tools/misc/xen-access.c
 F:	xen/arch/*/*/mem_access.c
-- 
2.52.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMr9DFXHEWpApwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2026 17:27:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2FB5BFA69
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2026 17:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317800.1586491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQoF2-0008UO-UY; Sat, 23 May 2026 15:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317800.1586491; Sat, 23 May 2026 15:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQoF2-0008RO-Mv; Sat, 23 May 2026 15:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1317800;
 Sat, 23 May 2026 13:28:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <len.bao@gmx.us>) id 1wQmPD-0008L3-US
 for xen-devel@lists.xenproject.org; Sat, 23 May 2026 13:28:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQmPD-000qFj-8b
 for xen-devel@lists.xenproject.org; Sat, 23 May 2026 15:28:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <len.bao@gmx.us>)
 id 6a11ab6c-5cb7-0a2a0a5109dd-0a2a4504cfde-40
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2026 15:28:43 +0200
Received: from [212.227.15.18] (helo=mout.gmx.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <len.bao@gmx.us>)
 id 6a11ab8a-1dec-0a2a45040019-d4e30f12a199-3
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2026 15:28:43 +0200
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MKKZ3-1wm0z323ot-00P9O2; Sat, 23
 May 2026 15:28:39 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=s31663417 header.d=gmx.us header.i="len.bao@gmx.us" header.h="X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1779542919; x=1780147719; i=len.bao@gmx.us;
	bh=ymS8BeFp8INvhwUWa1jSmToOQIBb3M3ID9W/KRAJHKM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hSQEtUOPwLQst/oC9wyCMHg5DjcZlosaIfMFYG4jgXByyKcSi4ydOWNkpPN01yo3
	 AHQwDGreV1UiBrUU6vcf3o9SUHwVcEyWNWSEVvXETHZvZUMmIg4HPU18QG5iqyHH2
	 EBwTTsK86P1wJm+Z+EITylurVpKAghQdjPNwjunFplPz/338OuW6lv7ZSkkPY7kUE
	 9V1gbu8LJl2OPouj3w11rG5Ygu3tLnoG//ZfK70ciidYlVdT/A3af4X9PnHqwXg1Z
	 mV/nGZ2Y15Xi7LWlBl6fRryooXXtNgMc6wmPJNGOwiBrvnaXNuzrq2KFmpaUNgUMi
	 DfrAeP5RfQYHXua5/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
From: Len Bao <len.bao@gmx.us>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Len Bao <len.bao@gmx.us>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/mcelog: mark g_physinfo, ncpus and xen_mce_chrdev_device as __ro_after_init
Date: Sat, 23 May 2026 13:28:01 +0000
Message-ID: <20260523132802.25391-1-len.bao@gmx.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t7HjXaVCf2PlNLs94VZfYdtPXzzuo4fK3guIR0L3wY679Op9eoQ
 5/J6G3ykESB15DT8uCb+CiSJqN6FB/mdE00NIYT7TdmkMIoZDOst6YHU36Yqa8Yz+JMlMvc
 NX1Q1Or+JAoreVI1zc4a+dJg9OrGYKbcgcFqkG9MDlQ8bcayWlSiMZrT58b8A7UBXBmZLEl
 xwt/CzWVhGW6oAZ9ND6YQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:klaenqraX2c=;D6n+U22RkmtIkymFINMLU5fU5lp
 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
 3fkVaz1Hfyfn2YPpY0uGQu+HirlhAthro3Ekamc
X-purgate-ID: tlsNG-ebf023/1779542923-41F7D3FF-3989A3A0/0/0
X-purgate-type: clean
X-purgate-size: 1408
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.us,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmx.us:s=s31663417];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.us,lists.xenproject.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[len.bao@gmx.us,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmx.us];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:len.bao@gmx.us,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmx.us:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.us:email,gmx.us:mid,gmx.us:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[len.bao@gmx.us,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8C2FB5BFA69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 'g_physinfo' and 'ncpus' variables are initialized only during the
init phase in the 'bind_virq_for_mce' function and never changed. So,
mark them as __ro_after_init.

The 'xen_mce_chrdev_device' variable is initialized only in the
declaration and never changed. So, this variable could be 'const', but
using the 'misc_register' and 'misc_deregister' functions discards the
'const' qualifier. Therefore, as an alternative, mark it as
__ro_after_init.

Signed-off-by: Len Bao <len.bao@gmx.us>
=2D--
 drivers/xen/mcelog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/mcelog.c b/drivers/xen/mcelog.c
index 53a8720f5..32ab419bb 100644
=2D-- a/drivers/xen/mcelog.c
+++ b/drivers/xen/mcelog.c
@@ -54,8 +54,8 @@
 #include <asm/xen/hypervisor.h>
=20
 static struct mc_info g_mi;
-static struct mcinfo_logical_cpu *g_physinfo;
-static uint32_t ncpus;
+static struct mcinfo_logical_cpu *g_physinfo __ro_after_init;
+static uint32_t ncpus __ro_after_init;
=20
 static DEFINE_MUTEX(mcelog_lock);
=20
@@ -182,7 +182,7 @@ static const struct file_operations xen_mce_chrdev_ops=
 =3D {
 	.unlocked_ioctl		=3D xen_mce_chrdev_ioctl,
 };
=20
-static struct miscdevice xen_mce_chrdev_device =3D {
+static struct miscdevice xen_mce_chrdev_device __ro_after_init =3D {
 	MISC_MCELOG_MINOR,
 	"mcelog",
 	&xen_mce_chrdev_ops,
=2D-=20
2.43.0



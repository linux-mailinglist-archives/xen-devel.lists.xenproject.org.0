Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPQiHOyJsmneNQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C402926FB9C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251870.1548718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW1-0002uI-6l; Thu, 12 Mar 2026 09:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251870.1548718; Thu, 12 Mar 2026 09:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW1-0002mP-3a; Thu, 12 Mar 2026 09:39:37 +0000
Received: by outflank-mailman (input) for mailman id 1251870;
 Thu, 12 Mar 2026 09:39:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOdu=BM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1w0cVz-0002bV-Ly
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 09:39:35 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60b2235c-1df7-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 10:39:34 +0100 (CET)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI0PR03MB11417.eurprd03.prod.outlook.com
 (2603:10a6:800:33f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Thu, 12 Mar
 2026 09:39:30 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::4d2f:ff40:d0ba:e581]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::4d2f:ff40:d0ba:e581%5]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 09:39:30 +0000
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
X-Inumbo-ID: 60b2235c-1df7-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcyGktX6VvhueymwO+cddSSUmfwgEk0lJakSCdPKRZNUoiYS0A9rIGA1bkOEvaKqnuMiv8qumNtav/oPWKsan6bFTv5Q7KcACrrm0QCP4+R/pmqLJ1OFvx4yfbqwTxw2tZQo50DAWGvQR+QLA6YoS2gyqHE45AxZ6BYORl4FjHfnpUPy0mEqh0/Nb9d4HL9MR/4mvu8GbNA/2GjeFfODbGGEtXUgooD2nZ31swT0UI6qSS9PHVqFirXuUm7eJdASzpypnriRhtZecw74WUkiAqsqrFM1TwgXoNWELLnZKlN5pdQ5vVrAV7C6iuQKVZZjVOGK+9rzVf8uaX3CS2lNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMN7VI+QZDaKn6WMXOoMrSaujSAxE6taeos15THt+X4=;
 b=hzapEPCIvEgu1d0gtUZcUlaEHzjkE+3iChlq2yagn2HdyHDmzGqlugBAG9lTHlKjIHsqQ8k8GxxpRWgrokTWSjk0mzWME1ezZDROjSqFZDqiCnNE3C/70SX73Rod6fhswY1JFirWgRg4ehIDMX1/MUGZtVmHnod5vhlRG4V3Dtbk1JimbXypeO/7nqlOJAqEjoUOHLWRxpmpBCn7clmYZ56ij/N3dVkAsMPAr6uXirqDa9spSr6VwnvFS8rcWm1yQj5pAwgDVodzsXiRRJuB32DCi+jhzIZRgtbkGJU4FJQFr5k/IwLeWKs8xd7EDawnbZSz3Sp8WW7MMOwq9l41Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMN7VI+QZDaKn6WMXOoMrSaujSAxE6taeos15THt+X4=;
 b=ETkDP465SoW93Rn6P99VAk6uz+oYu7SpccqxyaSa3HztVsZC0UMWtzZ2bFXE9oYACQbuH8ZUF/9GBYw/r/9qqWiAlvJW3b77h245XYrdSpw3R66NcO9OPLiwCiAS5xazh9B1FOlqmMyCKSvRPt72TKPOnQUVD6wVSi92+DXRPJ/H/qxVtbnRiw8mAXGrdUKLcWZp+ls8sL+DtBMdcstWkLurRpFAjlprYrYOoNQZVD5dms3tt24/hYXfVgIlOFA84k74t/Ag5PKR/fWYQKBImeyRQUizXN0/5tY1akDUQmIscQYn32EB0ONPI46H87QmNMClRSryC/aFaTzgmAbTZQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 2/5] arm/irq: Migrate IRQs during CPU up/down operations
Thread-Topic: [PATCH v6 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHcsgQg4Qmkqem0lEKqev7qUPQ9gg==
Date: Thu, 12 Mar 2026 09:39:30 +0000
Message-ID:
 <4e35d2a56d9ab1497dd1a706b80695a38ee90f60.1773307749.git.mykyta_poturai@epam.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1773307749.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI0PR03MB11417:EE_
x-ms-office365-filtering-correlation-id: 179761ec-2de6-4ec2-6ae1-08de801b4298
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 yLN/PvqWqtClp1lo++54VxeMDMYeJ661qIisAaZ977KNWvrFLqcQzBrh1VUdByDQQDO1paGBEPbMbTP9HhHy3n9A2Srs6bozEJmRYpii16ty569uESHDUdQ1x1Yw8SYpcdh8ZXt0gd34likUqJERvh26NBToelaw8Z/ZH2ISBbwwUgmlNK0h/PKsoI8HCu6GgQAGqdheqauTvxEUjAc14mWnKcJ1vePsv3dC7aUw0rcDXPSTQj2bwBar3kKDqDGpz+XRwhTw54uUpxD+r0fBiyRszZU6IM7f0c0HekuZfygm6Tu7JcoSkYMEtMXEx/lhBf8Z+IM+zGYwrrW4OZlAcNQifclOrsMOkl49NzaEh4HKBxef2mGQyhw+KS1lrzCUl++PieCaMp70YzX0W0KFAMtSp2tpRFVogcpPB6ll2WfoHQzpdi+S61RLPXF61HR2eBbx//ZKezcabmXC2KuUhb/ja9P+VqCUEsDLupZKYOh1gjCspwDfmWLFZU8tCZII0N2GWMSXK5b81DTKGUucPr+3lVtO4xQmEsQIMBPBEgDo5SpDDFvgk4cL7Iehd5uNJ+2IlikPK3jgEkSgNTA/MO7aYpRA9WIBxy+yexIdJvnxyRjlUfu5Qukv4zYpQRNU8B7cNphvXID+yj2ydSQb4KxOQkbZCMYHcjnxh+bKUwz6UuilpVJPyA3tcpS746icAcDaf3xC1lnNNFz5/U15+C9RqYjiQEMWjNvzRiEQdvU60A1JqoZmu6/cnJPmbNGWEHOZSpge5RHD6KAuZ8tzFgofW63zCysASfiVrZuYEeY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?B//bPBrXG6j5wckcZXOtpJTOG2FN5CEdFAb/eA/6IZq/cFMcp63OiHWUu6?=
 =?iso-8859-1?Q?DFf5+TCiYyP+cuTi/UxDorRVfNBrAAvG3aAxnONhUFSd025wnNobHGTVfS?=
 =?iso-8859-1?Q?KhemYT6lqwR2yjQ4+Cpp+XpEOHu6ihsZk5BEUGsnDjzXs1LYR3Ed1Q2vnO?=
 =?iso-8859-1?Q?HX0kIcdgkkNBgou0/ZxnRkC2WJT448FWljZBysBHQB0UsPu6rjfyYQ/Wzs?=
 =?iso-8859-1?Q?PoYxZA9bsHNpsVtTsas5P+8vtNTOpfup0PgDPIho8GT43gX46Awkr2U33R?=
 =?iso-8859-1?Q?KL29qnIzCA4q4qPCsz2eK44037IfzksUXy8vkRi2WAmV239kz/UUEDXKKY?=
 =?iso-8859-1?Q?ZJVadUO6UlnACvWy5J+JST53L9XXAQEPOi2h6k/20Jz8VVMsCMok6U3gjX?=
 =?iso-8859-1?Q?BnL9aaWEglPBkwxuUgLmBs2g9tMZqWX/8LSMnoGxLNJXEFuDIkYM9NCeuP?=
 =?iso-8859-1?Q?u/CUZb/nrG1y4qNxFeXQh5GyhMR+SSWVLRKf7u470W0Kyatsqt7cD/ojRq?=
 =?iso-8859-1?Q?UXy4cwK23lkAdpgGWKHyyjPWvndqCrGJsR/996F6j2zrtd9llFq7OuVZ9b?=
 =?iso-8859-1?Q?6lomDQSf/VwUNoXnFjt7FA3RgXCYvLOOYJ+Yydm8OWBenHo013RoU17b+G?=
 =?iso-8859-1?Q?SBptpvqTRW0zfD5wahwYoSmUcPd98DqGIjCAK1iV2fbuhEpfbq6aXId9mR?=
 =?iso-8859-1?Q?by1W1eWaoKJSvST5qCxS7nBHpb9moX8oRXP84/QKAf+zzrFI/HYZzjlYci?=
 =?iso-8859-1?Q?Ta8wUXOp1AckBGGnWVp+zPUi9TuKGd9eNm6CvEMWxDmUDpwSPbiOFbcRs9?=
 =?iso-8859-1?Q?DOVojTyEJ24K94+32veKObAp+srqTzvAp0hO60oWHr1qFo7eRF7SrsS4de?=
 =?iso-8859-1?Q?D6mK7OMvPLAs0LbFQMpBfpTJo8yAA6fm2sLvYIFzKBuOnP3H9DJ8T/vIBG?=
 =?iso-8859-1?Q?aQc+gx/CZQl5oVPP7bcNB3VfAzaPm00zu0HipSxHgE9fJcZTWODSfiFnMq?=
 =?iso-8859-1?Q?Vloffc5Jpqh2L4VkFrtMeNQO/h4uBXFpvmJFxbqn7qB+wGk5yRKknNxhVC?=
 =?iso-8859-1?Q?Qmn90dGjXGRTgBRZ5A3DGtcSb0TBGbAQ6fjCsEH9VisqcLhg94G3JgB2V9?=
 =?iso-8859-1?Q?AOEoSqB/gVhgBBYxlfvBepZOo+DHPyD5rcXlWyCwpEKv0bFtd06vUbZtFI?=
 =?iso-8859-1?Q?xuYJy8QVnccsy3fX78MishV6xnXhFaLR9Mc8MN3yBikw+M5r6WUlgV2Rdb?=
 =?iso-8859-1?Q?CjKeSX7RzE8qs3HbML62DgoEyCSls57VNUWsNfMWAyzkSvy6SRzQgqcdbB?=
 =?iso-8859-1?Q?ubU/V1GFMYRQxhk77BxEwXh5Ktpc3/oETnm5yd6DD6CWqZOTEQmj28U70F?=
 =?iso-8859-1?Q?HFyEL6YgiIEPHI9kC6NQ6X+5IkjY14GwVkzbd2NfaCeGkF68Hk7QtKlDtR?=
 =?iso-8859-1?Q?wT0k5s/68dJe24oiw7k6MPCJjatlfC1DdrkbKeQhMbyKhtgdvP0xyKdQLA?=
 =?iso-8859-1?Q?KxFQS4wspgHFPBFKzTp8awJcpmYobsZ6uGdgemi83uHOd0ePXajKq0o96C?=
 =?iso-8859-1?Q?eW7XJrKtwRiqRmTyG+zBcmx7V6zTxa1K33O14xN3UOZT/fzyR0L9EKPo98?=
 =?iso-8859-1?Q?k5b4MANXIn3VMqGczS9ajVks0mCUQoSIvmMN/NBUohFNcVXmfgP6wG1cDU?=
 =?iso-8859-1?Q?9yfNndYUPHl9KfTC9X7ambwaVHIIHNxfPRheFASpDjWjEqaWYRgy7c2JhE?=
 =?iso-8859-1?Q?DmMOv5n4Lq/2T8oHva+5LoTi5dK6whTnhpkMGKyw0In1bZtgYTw4ZdIXvh?=
 =?iso-8859-1?Q?NIpEGIKdqcp7yHVQgmJU6ypX4UVZ+hI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179761ec-2de6-4ec2-6ae1-08de801b4298
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 09:39:30.2870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d58vJETzhF8xgpbPwfvM7cmAUI18UWWhfrRmPusDy2qF7gecrssqPSe28E+km2jBOyuREnHfJ/YjvHqKxkFsQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11417
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C402926FB9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move IRQs from dying CPU to the online ones when a CPU is getting
offlined. When onlining, rebalance all IRQs in a round-robin fashion.
Guest-bound IRQs are already handled by scheduler in the process of
moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
itself.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v5->v6:
* don't do any balancing on boot
* only do balancing when cpu hotplug is enabled

v4->v5:
* handle CPU onlining as well
* more comments
* fix crash when ESPI is disabled
* don't assume CPU 0 is a boot CPU
* use insigned int for irq number
* remove assumption that all irqs a bound to CPU 0 by default from the
  commit message

v3->v4:
* patch introduced
---
 xen/arch/arm/include/asm/irq.h |  4 +++
 xen/arch/arm/irq.c             | 60 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/smpboot.c         |  8 +++++
 3 files changed, 72 insertions(+)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index 09788dbfeb..a3897ec62d 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -126,6 +126,10 @@ bool irq_type_set_by_domain(const struct domain *d);
 void irq_end_none(struct irq_desc *irq);
 #define irq_end_none irq_end_none
=20
+#ifdef CONFIG_CPU_HOTPLUG
+void rebalance_irqs(unsigned int from, bool up);
+#endif
+
 #endif /* _ASM_HW_IRQ_H */
 /*
  * Local variables:
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 7204bc2b68..d428d3118b 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -158,6 +158,60 @@ static int init_local_irq_data(unsigned int cpu)
     return 0;
 }
=20
+#ifdef CONFIG_CPU_HOTPLUG
+static int cpu_next;
+
+static void balance_irq(int irq, unsigned int from, bool up)
+{
+    struct irq_desc *desc =3D irq_to_desc(irq);
+    unsigned long flags;
+
+    ASSERT(!cpumask_empty(&cpu_online_map));
+
+    spin_lock_irqsave(&desc->lock, flags);
+    if ( likely(!desc->action) )
+        goto out;
+
+    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
+                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
+        goto out;
+
+    /*
+     * Setting affinity to a mask of multiple CPUs causes the GIC drivers =
to
+     * select one CPU from that mask. If the dying CPU was included in the=
 IRQ's
+     * affinity mask, we cannot determine exactly which CPU the interrupt =
is
+     * currently routed to, as GIC drivers lack a concrete get_affinity AP=
I. So
+     * to be safe we must reroute it to a new, definitely online, CPU. In =
the
+     * case of CPU going down, we move only the interrupt that could resid=
e on
+     * it. Otherwise, we rearrange all interrupts in a round-robin fashion=
.
+     */
+    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
+        goto out;
+
+    cpu_next =3D cpumask_cycle(cpu_next, &cpu_online_map);
+    irq_set_affinity(desc, cpumask_of(cpu_next));
+
+out:
+    spin_unlock_irqrestore(&desc->lock, flags);
+}
+
+void rebalance_irqs(unsigned int from, bool up)
+{
+    int irq;
+
+    if ( cpumask_empty(&cpu_online_map) )
+        return;
+
+    for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
+        balance_irq(irq, from, up);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( irq =3D ESPI_BASE_INTID; irq < ESPI_MAX_INTID; irq++ )
+        balance_irq(irq, from, up);
+#endif
+}
+#endif /* CONFIG_CPU_HOTPLUG */
+
 static int cpu_callback(struct notifier_block *nfb, unsigned long action,
                         void *hcpu)
 {
@@ -172,6 +226,12 @@ static int cpu_callback(struct notifier_block *nfb, un=
signed long action,
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
                    cpu);
         break;
+    case CPU_ONLINE:
+#ifdef CONFIG_CPU_HOTPLUG
+        if ( system_state >=3D SYS_STATE_active )
+            rebalance_irqs(cpu, true);
+#endif
+        break;
     }
=20
     return notifier_from_errno(rc);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..f17e88e678 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -425,6 +425,14 @@ void __cpu_disable(void)
=20
     smp_mb();
=20
+    /*
+     * Now that the interrupts are cleared and the CPU marked as offline,
+     * move interrupts out of it
+     */
+#ifdef CONFIG_CPU_HOTPLUG
+    rebalance_irqs(cpu, false);
+#endif
+
     /* Return to caller; eventually the IPI mechanism will unwind and the=
=20
      * scheduler will drop to the idle loop, which will call stop_cpu(). *=
/
 }
--=20
2.51.2


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI4HJPCV6GmENAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:33:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6244408E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290084.1569790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTxP-0001KS-RU; Wed, 22 Apr 2026 09:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290084.1569790; Wed, 22 Apr 2026 09:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTxP-0001Cm-KP; Wed, 22 Apr 2026 09:33:19 +0000
Received: by outflank-mailman (input) for mailman id 1290084;
 Wed, 22 Apr 2026 09:33:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFTxN-0000r0-0y
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:33:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFTxM-00HYU2-Dn
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:33:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e895d9-5cb7-0a2a0a5109dd-0a2a450abbdc-22
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:33:16 +0200
Received: from [52.101.72.72]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e895db-56b3-0a2a450a0019-346548484ad9-7
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:33:16 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB7710.eurprd03.prod.outlook.com (2603:10a6:20b:41f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 09:33:15 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 09:33:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDk0OVqKEV2XzJ8TjXkuBQn6iKAkuNQwhx2wlRxIDH72B6P6w/rpgGHa+5MaJ0Apg9EgzM0osMvRoBXC5YsopDK4nq96ykKDibNcArzppbbNBBgaGXc6/P4H3sbWMOdKVHKSsrFyXMzLTacprgyxm0tsmNcRRAOdhyuppSx0AZ+MnXuKkbUKNVQ1UwqH0mDQCKxI2Vlh9ESm8cShANXG2frckxfAsVglFGgDHDiF2OZKAE4dbdyYtFpaYWt/GvZyb9MwG5nFsZ1hSpqYhz4ML2bbcXzBWUyqPQyNoamFXk9XddKMWbwZhHVDRXcaSvJYbTc/TcQ35zuidOYfclRbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sua2lHyPv7A2Nh5zyXGRUWTpGAlugF2OyFrgHX3AWNk=;
 b=ZA4BkVc+0/c7uurY0Q4b1JqrKWCnadDCOU0NCEfZ8eSlOZ3DBMWuQ0c+ZmVpyDCeldOQSFk04BgEafGv6RFfRjCn/9daa0kT6ifrZS2MMtLrxe2TT/9eOuerNyVqUz4c76K8DWcB+O9VRk97pUZxQ3iBGAt2Qakp1Q7mqfmOyI9KceucIRSjqpnZviWY+ANRKV9ZabxFa1I2QJ31cwO5qX8r/hRoXUxqVS+zySJO/HStamu3yN0fNXV0Amyg1O5nfbQeIqo52TW+Ua93UYheyAJnhtgw2DBW4GRWA3hoxmxbSwGypel6UFvpm0pde2Jhz5kE46vpnqERMYigD9/1xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sua2lHyPv7A2Nh5zyXGRUWTpGAlugF2OyFrgHX3AWNk=;
 b=POxJHVEWZHi1reuW7uIDqKDFYt8W2FodhYcsxXqU2CjtPTFIUu0W/VdcXFykH6S7VOmrw/FYMgn/ZkR5szXhIq7prmvEXqIPUN9Ss0h0axxyR7E95/0qobApl3HLTStFwVnGAlLBkH1pL/iZNh69qmoexEiHQrPb7PwgFjsPsARiBPsr4BuokJpxpY3z+/5H8ROu9bBpDs2UgQ2dYVlJUt9EgOGwJpz+mJ6tRQ53zAAbDfVa+aEv2XbHv3lFwZvUwE+9XOSKubYw8DetaSixMlsnArV4j1lmfrc+2GzbXDJ2N6mME0QNJg0eUSCu1Oqa7I6uJRkYTJZfhq09fAfTXw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v3 4/4] xen/drivers/char: fix exynos4210 IRQ registration
 failure propagation
Thread-Topic: [PATCH v3 4/4] xen/drivers/char: fix exynos4210 IRQ registration
 failure propagation
Thread-Index: AQHc0jsL+9q0JLBsskmBWrh+PQuj8g==
Date: Wed, 22 Apr 2026 09:33:14 +0000
Message-ID:
 <e15f6ef27470724fd987f0c5d248315abb1d2c55.1776850201.git.oleksii_moisieiev@epam.com>
References: <cover.1776850201.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1776850201.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB7710:EE_
x-ms-office365-filtering-correlation-id: 1bcbeea7-831e-4d47-c909-08dea0522dd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 de6vCvQ10fYkyHkdmnzvkwqy35JQAzD/I3UWPdYX32TJm1ExLejcqcQq+kqj+GPyliKAsCRrTcrWnaOKRSDqFUbXDASFlffQbMfEi8p0MXykruJaKipZLjznyQtBI9TwriLHt2ckPN10sim0EeVbMpMOLoXnf2CpgqPY+ffaaFxZmDc910UqpMGanTvmYEDTw0LfqkRFoCZCmQ+9/8zHw3A6jrgxzWslfEif8BSO6dwSmNWRM1Y7XXZRgzDARmdl5n9/hCm/HSN/eWnmYJg+e577cZYYwKP6jBwgj5tHj77O6urTTBvPh0QsGS1XPtyxXYwONo2c/zL9LuBOc6060dL9SrhAV80/y8rlOCKVVFflqvYY4k53GNDdAjoBQAOXBmMnSCn5W8RZh81Is6+GyfaxGbvxtXf+z9fg4KXqL6EYXGmZfYFcCzKV0ZMya8aIDnStvVONw2JBdAI//TY6d8piGQJrRh1SEHARpqvJvP1/EPDHZLZLA28Qp2bog7q3Unc5ORxuaDB01BbwgCaYJb6iqkgd2BrMm3enSMilnSkHJf55osoDpDtQ03YeVbW9vBAt/Lm6vynd2XsCeDDXH85lAUjfyWTNsHp1iV45cIjmQzVrxMBwzqCWRZZOWX7I9oG+Q75kgQi8q3LtUCZpDULWSRVyhQRvdkqrOvbQaExou7o7rAE53KuTN92BUBO/P04iwAue/xpydlOCPRbBegXKScSkaY+DVJO1TltIr8u/lCSEle0HxqKx04cRBilBVwk1r3EiORBqnHwBJ4n8Bd9hWdCc7m1IHVSiV3/zl0k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GLgMjNWzlL3W5zZngGfXzUeDEI0zB64PTI6Oj5s26Ax9Hq8K0GG6LHZcEX?=
 =?iso-8859-1?Q?rOZEq3Xqy4rJjHUKWACeT2UK2ph2c3UcNd8Tw7Fo7dpUlC1NsL30Zer9Xf?=
 =?iso-8859-1?Q?YKkp/sspz+Oz7Ca4eAL8ttEgIJCI0pBbR5cIUkpLkl5AIPQY4FS0fI4jZ5?=
 =?iso-8859-1?Q?dTbllJodhFCoKd3tHbJU0iFtlXMNvmFYv0Ky5S4K+zLku1OHcAyIkBeGj/?=
 =?iso-8859-1?Q?XjlDkLYE9HKMHuuGOx9r0byF4Wd1dYORVjQGhlQfP78GntMNzv6a4suyiL?=
 =?iso-8859-1?Q?gXmCTLFDUIGusVeGceclH7R9zdfbWAFVUM2DyTUUz8YX+4edR7vitw7JoK?=
 =?iso-8859-1?Q?10vdehb/T77r/hmvC40cw7vqTrCZX3zhlu9XOllAQfeav16YEbWR3VA0LY?=
 =?iso-8859-1?Q?JnKHnNjn1EyU1UPFxockX1g2tfGUSmArbn/dUDewLwS0LVGCNUs0pk32P2?=
 =?iso-8859-1?Q?9puXeY6pMf1lxviKNwfPYrWM/o59iPeTeyLhQacUrVC4ahdsBd3vzrTnly?=
 =?iso-8859-1?Q?eUCVXJPUWgipAMv12aeGvkzBsnflkQXGpXsWxVnllL4Qbgfxl85ta8N5Tj?=
 =?iso-8859-1?Q?14gnIQvzbzVwFNVlg0Y6dzyQpP7tCvWPO/Adh/P/hWSj+796BYQHzts2of?=
 =?iso-8859-1?Q?QQEZ1NvoyirQYXQuwWPxfs7yE83oRnmiaCMZUtjWaUdpd2zFHXYe4Ox80+?=
 =?iso-8859-1?Q?4SCn8fRhTwhoOqa9kyucWcFgooIRBXjyISk/1UagGqo/YwK8HLsrhOFikr?=
 =?iso-8859-1?Q?jZdEr+mVeWlLvx6Y4LbxdWQsZMdJN0uLMU+rz+zOIVpFZ4zXJjc3lvI+hX?=
 =?iso-8859-1?Q?yq4dIcCWDKNhtYzzmRlomQKu5W6pDLM/UQ4qCDLHKxt4grk2fMMYHGsHRp?=
 =?iso-8859-1?Q?9snBZbb5KTWENW/yY7NGUKaBxdv1zHIIQaPAOaJhDIQkdavhATzSwTz7f+?=
 =?iso-8859-1?Q?wdkvZTPkdlwrNJ1V8wcwsCltP4A/Q5TSuM7V2+F3uoWiaQLJ5bLKd7HzZ1?=
 =?iso-8859-1?Q?mQv8jh3B7peA43sBcxc5LoILvHETdD01XZWtQZ4ChOUKZkoqwncyozuHBu?=
 =?iso-8859-1?Q?LkZWp0Kv6KdoE0oTUSpO/W9WUpvuvQT1Jbi9ZNfrZVDtclqFXgjFDeMlPi?=
 =?iso-8859-1?Q?gt0711Lv+cvCWnjjpv4RfQ6e2vHiuAXAYJI3vJ5C/jMFHtZOSowhwYSwoN?=
 =?iso-8859-1?Q?3Sncu/w8u5dpCWqhp8JSxO1ttCndwkaiQzCRqYCMplXQbZJp/eJ3oW7sLW?=
 =?iso-8859-1?Q?PfAVxGM1/yg3wFIRkp8kEB5/xadNKEQw9DB7PQ2fjKO3r0Spzi6mUBIFmW?=
 =?iso-8859-1?Q?xBEYM4/GH1ctlZskWWIuVTCjuZ4aF/o0YeUfoYPD/j2JDMrAsJVfGhoVS8?=
 =?iso-8859-1?Q?Rn5OtfT6ydl+B7slXrtCNfqHnkAvvdeW03EEKFhpFq2baMkswunJlzTHtz?=
 =?iso-8859-1?Q?hRMLmdx7R+Af1ogQ1y6wVSSExH4Rl9fUUkhAYaX1U+MjWLKT/aL94+2Fk1?=
 =?iso-8859-1?Q?PNNHngZ6sgeQFJkYsZzDI9vnWaEcamM/9MfTMOdBkG5ITm5mxXgbo5JDju?=
 =?iso-8859-1?Q?OPTOQsqMzXfmiKi3p7lWZiuAIRxPjPQtt/cEsiPYNKuw0ztJ0mofpferyU?=
 =?iso-8859-1?Q?OSf6EJwCN4vgs8mFnsUwb3Vloxja+oiA2wwAqwXPPR+B5/sq2Iopof3tue?=
 =?iso-8859-1?Q?8lk62Zqf/1OmyzORWjGQz83Qz6jEOt5X5s+z7Au/MhiUF6+CIZKajGPmZx?=
 =?iso-8859-1?Q?Bpx3o/wDm35Thk/iceXfEXFGdY8y319MZLKF3kOfvl0Rc1LTQGfw09ztH+?=
 =?iso-8859-1?Q?3/OyDrdBTL/oHfEsCCjrZehwSZjh7fw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcbeea7-831e-4d47-c909-08dea0522dd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 09:33:14.9617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SBCvcigsaohM8T65ZEV56R3NvDn/wOKJdpsTXihQCyeVlKOPlU/UhkeJFDZETaygCcXZ48MAGQ8wNYjfleKQbzbQoTWWY1hOQTbp440QFUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7710
X-purgate-ID: tlsNG-4011c0/1776850396-473738B7-89EAAD5C/0/0
X-purgate-type: clean
X-purgate-size: 1655
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3DB6244408E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In exynos4210_uart_init_postirq(), when setup_irq() returns an error
the failure was only logged via dprintk() and execution continued,
unconditionally clearing UINTM and setting UMCON_INT_EN. This enabled
receive and transmit interrupt lines with no handler registered. On
platforms where the GIC receives these asserted lines, the result is
either repeated spurious-interrupt warnings or an unhandled interrupt
fault.

Add an early return in the setup_irq() error branch so that the
interrupt-enable writes to UINTM and UMCON are skipped when IRQ
registration fails.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v3:
- skip clearing pending interrupts if setup_irq was failed because
according to the 13.4.1.13 of the RM: it must be cleared after
cleaning interrupt pending in INTC.

 xen/drivers/char/exynos4210-uart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos42=
10-uart.c
index 58901df554..2e5860ea2b 100644
--- a/xen/drivers/char/exynos4210-uart.c
+++ b/xen/drivers/char/exynos4210-uart.c
@@ -199,8 +199,12 @@ static void __init exynos4210_uart_init_postirq(struct=
 serial_port *port)
     uart->irqaction.dev_id  =3D port;
=20
     if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
+    {
         dprintk(XENLOG_ERR, "Failed to allocated exynos4210_uart IRQ %d\n"=
,
                 uart->irq);
+        /* Don't enable interrupts if irq setup was failed */
+        return;
+    }
=20
     /* Unmask interrupts */
     exynos4210_write(uart, UINTM, ~UINTM_ALLI);
--=20
2.43.0


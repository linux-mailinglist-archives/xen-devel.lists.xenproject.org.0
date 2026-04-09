Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOfLEs+u12kMRQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:51:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F299D3CB90F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 15:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277416.1562639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApmC-0000hC-Uh; Thu, 09 Apr 2026 13:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277416.1562639; Thu, 09 Apr 2026 13:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApmC-0000Zo-OD; Thu, 09 Apr 2026 13:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1277416;
 Thu, 09 Apr 2026 13:50:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wApmA-00007h-Lj
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:50:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApmA-005hLD-1m
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:50:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7ae9a-bab6-0a2a0a5309dd-0a2a4508a406-34
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:50:30 +0200
Received: from [52.101.65.135]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d7aea3-fab6-0a2a45080019-34654187b92d-7
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 15:50:29 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM0PR03MB6132.eurprd03.prod.outlook.com (2603:10a6:20b:145::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 13:50:27 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Thu, 9 Apr 2026
 13:50:27 +0000
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
 b=BcKRM+P9oMVXFy3WKaA1/GSsutKdusNeW7iAL6lnL8YOw1GBGINqhf0MSo3ZE9rzAt4ivtra/DITzWXqtN99CctI0qQZZOlahBckEFtf05XCuAbughxibt8EULXrxmMtW3dOFTKEzetv7yMyCy8/LQrEIF3IJvdZhCgSRBNz5nBkcZTtuqKfA1ZGIIyxqYMy7xV7xo6tcUatHKZ4771bWh2WxP+UZvrnX7oThb1MBhHX0fbHiaPnwYtTwY9y013vY/uADvz732bs8imGRe1VwF0lWSW24LZSfrsJHTF/KgO5FBOmYLjzaa5FWFeWVfyhVWjK8ccKd7DjBVsKpJdtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHTUPc+0Yn1eQpeQBKN/rncMUFe7rtRQF5uHYfz3Cvs=;
 b=g05rZbdPBwmdNTxDpkV+mmWjgMo15ZxhtG9sSjDMyt6+5nFz2GSqcEoDKIMr5jHkDY0iMzgDX8aWyVnjKGsl5iWI2zfzxThWxvJVmTar+2OJw2bdPjTtGDuM1ugFwzbuZwl9eODC9r3H7fHvfi7KHKHH1KIMRSczaCbZ++ChpjuvqBdDfnt6+FikjpxBgAmlekt2N1gM/XDIxhBWxCf5HM3nSJANlFhOJ1F2JCruytoYu3d2l689pHZnQf0tVbLinHKRCM4gpRZJc+/Ir7sTAkp2UOvtre99Y6e39R8FxSPeA6OpKHuMIWjcupx2mfDi8AtHyqXMkG9zQDyl0RBB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHTUPc+0Yn1eQpeQBKN/rncMUFe7rtRQF5uHYfz3Cvs=;
 b=nexaRASvtgArsh3DTWMFf4YGozkkWQ/dpP1eba7XKdfxJO7eLtHEOsYHoZNHxu6z4YBOP/AOOdJs0ZpBgbODThx90KA5239QSlci7SSmBfu0Azn3hIo59tEyjyqOlC/SUkmY+gdyxgyaDfsVloL1DZZ3qUxOnR6y1wctL3FPAwB+jAhA+N/NarFybIV+1Rs7vMqsyxPqBdxlBWloS2oZvijM+hYGvx4Vs/cMYtnWUIEgRgKvi6X21bOpezMYksZu4o8Yfy6jkjeqREQo+sLLZ9TBjtJ5HQ5FAxVokfjw6yfbS+qT0b1TFVyRIKfFTGfFJs6TDEeMcOf2TGkb5z7lgw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2 4/4] xen/drivers/char: fix exynos4210 IRQ registration
 failure propagation
Thread-Topic: [PATCH v2 4/4] xen/drivers/char: fix exynos4210 IRQ registration
 failure propagation
Thread-Index: AQHcyCfSPi7W/0ovn0ufnBNUSA+61g==
Date: Thu, 9 Apr 2026 13:50:27 +0000
Message-ID:
 <043b73edeee02b477f210cfd82f0b2940de2ef21.1775742562.git.oleksii_moisieiev@epam.com>
References: <cover.1775742562.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1775742562.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM0PR03MB6132:EE_
x-ms-office365-filtering-correlation-id: f7fe5ff6-5a33-4375-4c6e-08de963ef4dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 b8RsrXgJbzOn84cba5UZX6I2brJhrYycwDAj52g43yr3jf9sd+LbJCl6H/l91IISkzmu9h1vw5DiqrNLvROKlqD+PDKW1BDaCiU42G197mz1OCsOZ5rVbXiL6epU4DcLORply4Lfkgisj6Gu9tpKFqfU6+ZTuaU5NXA5UBVvPVmBzFMzGnrCknafRwmJi0EdMTllYCBouGdUoq3LaW0NM5DmjG7QrPpv5XxoHo0EAJDDCpuAD3qUkVtiBLT4LU2J7+W8ASsw7ajztRMjO6+Oo0wnpVwJyPgDcI3ah8EzEARWIAJpGEySh4RFVgyrJDBkD4t348189VoFpH4v31URdj9CKh9a9/j47HJ5jCIi+r8/UK4VEh+aEaNGllRG1PDYOQLkJZgVYDF/9Kc7cqBSzFhyHlBm8rxpRQJUhJrdv5QK1hs0VutTdC6TyNihjMPMupUdHpuTi98NNfLGyxRDNpqYzEpMTKyPcWYQSqcJZmI1YO4q377NBic6AWz7H0YUiHyrJOiPtuMdQjvGGt1BG1SgXWRFRt78qcI5q8a2vR+irYidPrae/aFjEfsdIioZp6p9+wGfBI8ggTBxNsEALJ3XXjFhOfI6hZwCpqNpLV77y5CQo/o7nxRnsN7CrD9YYj34/0V3iLmOM67mxIN3UeW6nlA9ngaDng2VnnbyYPLHfBiG4kAC2VFZHeRKqW84qgeq6XTyWLYA+QELV+to4juIZC8t0TssopvoAQAdNRRm+wXYA1qQuSALhcKyASWXHswzwRi1erCDnvOORfbKxB8aWYuLz/selBXUK8y/TUw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GWgOb9fvA5tdLryWjCV8g3A0WNHo3WkvrJ0uNH3s9TSDqtfFkpCt5om41x?=
 =?iso-8859-1?Q?JMYOej7utaLYCxJdmEMHT3UtYljY8NRGEgXeBF/eOEz7mfCV1vBXrMD5TF?=
 =?iso-8859-1?Q?k8nONeIsvYMma+CCe6zdn1c7+daQ727ViUt/4Dl8yi/zzlk72Xe/d9h9b6?=
 =?iso-8859-1?Q?kjpG6CK2N473QFDfaLUOvznNvZSYz1toGq3hL/nph0v69RUKrLkJDTLROb?=
 =?iso-8859-1?Q?7PqSmKrQjA8JvVwH6DtWQhFiTJhhO9OZkz8AvvqTl5Y5D7V8sCuE8HatQX?=
 =?iso-8859-1?Q?sJ26LK5YlT7d8oKg6tFqbjmmA4NVBOMKcOE8XhRgS2PqswCF1JHPPxeZIo?=
 =?iso-8859-1?Q?U/nkvSvSIDTbWECgeXpsAb2M1UvqjuqT03e/6adIGFMO94FgQYQPsTbW5p?=
 =?iso-8859-1?Q?kcFX3/+UVN14KuCHJy8Aq96gXgAHnfo8AE/jiaGwDBx11P+7for534jKOk?=
 =?iso-8859-1?Q?Q0owhQlVvRPR+b1VH/lc5LulBdIkOwFMJkhpChtlex7szPG3vn80DrFveZ?=
 =?iso-8859-1?Q?plDI6PEcuNMV5VeIUv9XCXqdZ45HMFvUgw1x9WCs1OQH8LM6KqC9zHlXPf?=
 =?iso-8859-1?Q?6vQ9FaU3dOBE0P0o/0DMiTiejBPxzRn4qim8PSrMdRIyfReifVYn7P3/WN?=
 =?iso-8859-1?Q?qPFUn64D5J/blHZoIA45/0bqPFhwrjCDd0Enrj8OVc6zdW51wYk3MYFUjJ?=
 =?iso-8859-1?Q?avXR/gFsgv+lMEzEN/jL8BbbHTFcmBObDEm51mQLONLySo0URSIEmxL4qt?=
 =?iso-8859-1?Q?T7tKBGMpuoOajIoOddcLQ5Ue8Kci+08tnwESefRAhQsrZVQHXk1okPwC6A?=
 =?iso-8859-1?Q?jX/XYj6oguKZrpimBx2bGFexsjj/lbBQvOT6eiCEuXmp6YHQN/Rb1LywON?=
 =?iso-8859-1?Q?/s3fZ+KpKewyHK7w3LzFYX2GKuerlZ3bwURjn0Wj3J1ISbwyuzlXVMQh+v?=
 =?iso-8859-1?Q?68s3dbyQvIBL9+XJyzMimnqQYoMY/YUCeutDW/Pq6A5zcET6U9vmLJN6nB?=
 =?iso-8859-1?Q?JtZA2mUWWQMy6lv/eBGhNVpaF5N+XZJortYObvaOV0L5wH9I3vS6IAYdki?=
 =?iso-8859-1?Q?NIHXqDsqgYcakpRwFpz9l+JBJBDAcCLr2RytRDWpT8M8TDsbngN9NIu/cx?=
 =?iso-8859-1?Q?tpbvmzsDfW0y9fLZv8RK+zfKyTVmXEORcdzTtbYkolY3cHilpZHm+KyjLA?=
 =?iso-8859-1?Q?BeNeKXJdqstxHGG53flCazd+yidgAv+ysdW/0Z88R5T0AKy7gFvjqhPvBY?=
 =?iso-8859-1?Q?HS/8ByxSawUZiWSc5kHtpagxcJhSOl00NMPEltSz3bbAsnMqv/hGKy4wCv?=
 =?iso-8859-1?Q?OulZH3iXX90vuVQAyNAYeNOKyJopxWhoUiV2pv8mds5qiEsNU2RQk1bbnT?=
 =?iso-8859-1?Q?LrTClku99Thulv6CInqGaPulhez6yOZp+DzIOGWFB6ioh8CsWDePkq3Xa+?=
 =?iso-8859-1?Q?Kr5t32MuhSw6sefG2jag3a2UtlRuK4OwPA7WvchGILZAWgVcgyJQ+TTj14?=
 =?iso-8859-1?Q?t4XrRF4PRlnAWhmCfZzyu16s3TIKiDkUTeFu/J8WfNXVdJdGOhMwRBS/dS?=
 =?iso-8859-1?Q?4CAbfMvG1DGSdmmOY3OxgOwpn3BGH+pssjiB6u3Q8aUGQgXSGIK9/1mkEm?=
 =?iso-8859-1?Q?8PH16W+c1eUupHFPhUvaIiL/vvjeKo4fMTF2GA+X42NDPOJ0XOVuJPyGkB?=
 =?iso-8859-1?Q?p4J25uztxqINVFKwsckhDRs5CjLAe/rq8o+imkA7GIhOKFbZeoyPU2q1js?=
 =?iso-8859-1?Q?VRvB+gsOgLLmZoFBQOTL2CYkJFRG3ME3jgH541BOzt+XGTk+KI5AyKZ6L8?=
 =?iso-8859-1?Q?UcrTUlcuFf6qrDEFc4+a9xXy5CR0Wlo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fe5ff6-5a33-4375-4c6e-08de963ef4dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 13:50:27.3167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NTdgNFySvviM6r2x80ywyNq7qBgyjqw2w+GXnnJHc7oo7wEbv0O7pzRMtVI4eFgNxDUQNYxW5XOC0Vp9UFFZn+v+yeSyXRc2swI0CIENuwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6132
X-purgate-ID: tlsNG-c1860d/1775742629-75358497-AF44ED15/0/0
X-purgate-type: clean
X-purgate-size: 1472
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F299D3CB90F
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


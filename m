Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DNGJtNE6mkhxgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:12:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22491454B8D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292399.1570872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFweZ-0000GM-Bp; Thu, 23 Apr 2026 16:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292399.1570872; Thu, 23 Apr 2026 16:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFweZ-0000DZ-8Q; Thu, 23 Apr 2026 16:11:47 +0000
Received: by outflank-mailman (input) for mailman id 1292399;
 Thu, 23 Apr 2026 16:11:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFweX-0000Cu-Vj
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:11:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFweX-004X3T-C8
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 18:11:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ea44be-5cb7-0a2a0a5109dd-0a2a450bafd8-10
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:45 +0200
Received: from [40.107.159.119]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ea44bf-212f-0a2a450b0019-286b9f772e5a-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:45 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by PA4PR03MB6752.eurprd03.prod.outlook.com (2603:10a6:102:ea::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 16:11:41 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 16:11:41 +0000
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
 b=YCVqLJ0g1Z4zt+rn+mdQQoradt6iOp83gAelJK9YsN/hRMt8INfcOprG58yqOascraz1De6DJNAc66+HXrmppxbEj3IK8HPQnYBI5QDG6jl1rWreJnN7egedQigcT7HEptdAaUlXF1ZclQCAsev1ZVM4sRcoKmzHNeP0UXBGoFV9+lkdKwYmlhMMpMiFRKAgDGFjkKcwtDsDGipkXvrymnuBVrB/ZKR0rjVcTrlol93n5SQW04eZaRD53o1crBoczd4n0OoSNxqx0XC/VTlg3dBG3+yIQK0haIdZ8SQo1NGgNcq62+SALrOmQ5z0tApFVtEY9ijJrxYkFmoXg+IA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdFX/zBEaG+DaolzH0Zg3jjNCZaaPAZS//IhlyXHsTs=;
 b=MeyFW5yadQofvdkwrRr8xQ9CfwEi+XM1DQzT3LzFoykEAe2JKigz08MRdd5JrxJv3rBr2zZ9wacU3bGpqTpj5Sy/g02MLQ+jb5HjR1PtGjEvbYBPXLIkWeC+KHv1K9Tzu5WL5sxWZHGNVC7zHD+dwU318viRGmOC5/ikSNLorJF6eMtmf0fKwzbinlo4V/F5rctoJ6gNRzfBlxzQdm1ZeIQjsjaQ9t1KJJZzBNY7qlQrhNQcsW+vaaeSOl6qc4W4WYcDNG3ODfkU3/yo+bWbw7WoD6CeKFy6Jckk6ofsFKDRsyAi1cRhP2X+4LX8k78O5dAiImXFpgJGnq0kwBgMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdFX/zBEaG+DaolzH0Zg3jjNCZaaPAZS//IhlyXHsTs=;
 b=SgYprN+IotvEYrjNf96VKIKhTk3K4GwHUKUFa5vqP/VPgj61ciFF0kVdH4q84YwmIWHFdmzQnJt7jxNjXuC6hNvfxycZl1lNHQsBrjQWolslr3uFzxtEVEuoKY1sn+UTpeSra5IlbndEuEB+leaXOH4mXKB6YI3VCrZHW6H2xl6f66mnoAlWnAL+Og7rQ9PIGlnAH21+ZL4quVLIDKen7VPXuq2VQqz+9k+r6iS1kQ+IMubQgQ3tvdssWjA/T7g8qdyUHr/f6280Gb3RJFO2q/0Uzl/ireXjlTigZUAfJGUbr+RkwRMT/upL2W7NNdD+h3UTBuiwOGUCnwtLvfriAA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v4 0/4] xen/drivers/char: fix IRQ registration failure
 propagation
Thread-Topic: [PATCH v4 0/4] xen/drivers/char: fix IRQ registration failure
 propagation
Thread-Index: AQHc0zve7DTkuijUTUqUcS5tLdJONg==
Date: Thu, 23 Apr 2026 16:11:40 +0000
Message-ID: <cover.1776960679.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|PA4PR03MB6752:EE_
x-ms-office365-filtering-correlation-id: 5910da64-d40a-494e-bc72-08dea1530161
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 51pFzK3zuvDY+hk2/LkJMKiwmYGFjQfFb6kB5uYNi2KASOyFpR9JZ8BnuGeO2aJ1riKglVr2KgP+KAXqndyD3zA83Mb+gK2KX1C3JzZ5LsnczRzHHGN1+GoyE6xtvWwI6HD1G1k/Tlu4+DQ90zXy6hDEldx0yKLAoyuk2UVm5lCbrh0HEr9ip3TEjNU/WgzQY+pXLccZ/+4toRE2s6i1pd/eF3a+i3JH+y9ZAbafqHcDQgmQ3L+7D9xVTiDn+FjdT5di/85vLrTfsFvjWrsHtnaJsvAv6Ik5smfEyrURFjfeaP+ybHgevnSr0IvAJ289DAh/b+Y3OLT26sMZ/3oYOE7VgBJGtOkkyIunKQtJq3Lqq7pcmiw2w0lomRaVEZwtThmL2th3TnwWRPobUv5VuOjlPp4NIq1S/pTvz0HNJGbdyKv7tvUeW98vHOLRlihhDRME60/C5BjnplCypeFXaBl2uQ9FJ5KCFEs+fiGPn9B4mglc5/5B9IWCtkbEjO11P80NFQHI3dzQPDJCjwJqbQpcTE6RJZsdnjtU347EzVfNt50GY+xl0sPKqdqbnGusGSmUwdo2/Re4wLeDbHnTyQleguhg2AnlasJq9uriS62eAWmnKaMbrcebZgAnemBAa+YwjFOPIPZefpTaWuJeD9+McMIJe3/+CQEb37dfXfQ97LJ1gU3E3c2p4g0ftU/sbILIMkyHHeFIn1Z/GtCi84HuS1SmOaawB/lbOp//Ck13/xOSxXYAB+K8JS6+fghDu0dXcHdx2pOIUmlzxRHmFtMCTr2n5SaeKSswpzNv1e4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(38070700021)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9fJBl7EBfL0+UBORu2gvYJz0aOJf4nxbPzZrvRbPd/xuak+nLUa/HTlTA+?=
 =?iso-8859-1?Q?kEsby5GMsTV45/hJNiLF/9FNBOdAeSa0NtCRdZr6jZOqz9yn/BOgTOcBSx?=
 =?iso-8859-1?Q?kM7FEwDEzTsNBDRUb4r2XoDf97PoHxJOkkz8HDZKwQEKx2hRI3+zCf5s7E?=
 =?iso-8859-1?Q?pJp0dtpT/5ULLjIvD3jbK/CwecneFjizXooqO9KZVDiRrqfPGwuT4wmeSi?=
 =?iso-8859-1?Q?S/UtjazxUf9Erb6Z3ynPgBDXYtdiDdeITiCo1RpCgJW0U4F8zUc4wmlyVP?=
 =?iso-8859-1?Q?G7uQVgO7fbEie+h+XVp3HVLTxfy/1d0ZjkEk1Lb8AOTDVSYjTaHOOhW3Eo?=
 =?iso-8859-1?Q?q+zhI4u5n6t1fCazgU/XQUsRnR0fD4s+1L4roq57tRl4qVjQb62uKwZ1N9?=
 =?iso-8859-1?Q?a0HqczM4a/mkTu1hwSZ0471WPyv9b9LZVpSbNGQJre5qdsanYnojQPIOT2?=
 =?iso-8859-1?Q?gFTqIvN30mrj8n5dKnUrLDsoOvnoI+6nczHHbzZgod3nr3d2n8gs6Jtehc?=
 =?iso-8859-1?Q?mT4i1gKwAuPZxWTj+0rbxZNAQtOzbvWvTfVkHO7ulqvd5ZzfBxDRps5w9l?=
 =?iso-8859-1?Q?kYGEf7KfbcDUksDW6iAo3I+TNYLMQkv5LrISi3f/RaP/V+fvtDDflrFWHP?=
 =?iso-8859-1?Q?f/CDfMiy6RzJTihcmEmCIviFXHVmg49rItTDUtCwE4zR8pHN3TCJAf/mAA?=
 =?iso-8859-1?Q?1xVS7yG7RQrudJSFU7OUyzRjbblUq21IDIDQB0AJ0NdP4tf4Rf2/EagdLC?=
 =?iso-8859-1?Q?wy+xZ8JfYoiJ55yr+otcAV4x9CWndyNSpHkotRDT0kIf8YgYt+J0NOie5L?=
 =?iso-8859-1?Q?4sUmMQjacgSaBrpAeTuKp88HpBjw/D064XxbYTgyi+3vKlADArZUacUaT8?=
 =?iso-8859-1?Q?VbO1bIK6yQ8EeW+qDI6XYcQIZTPxsZqCDFpbYFEqJ9y1CK7rxAGGzP6YUU?=
 =?iso-8859-1?Q?+w5Op43T2xpM4TB77bd9o7Ph3imoZfDuZBicFUxW5NFsKPE/jifwjTgIzZ?=
 =?iso-8859-1?Q?pmNhJF8Yh2JEJQh1JoCv7jEFLX8LWHIT2pjEKmy+Ic2/QBWS0VoZ+5+OdZ?=
 =?iso-8859-1?Q?QIuaPUN7N3dcgCGgbN0nsmjGh/UBo3Y9Y4p5b8c17fNLPXpwXKa82bN8q+?=
 =?iso-8859-1?Q?gg2+KQfdxEoCA0QMHeGRW77FJhgHSA7QDw+5Zd2zGruEs0BlcB4NQK+VyJ?=
 =?iso-8859-1?Q?DkeTL6Vt3bNMYZ5cnuZ5tVB5DybVe6S/3/Yb5OMKq7wOKqUnCPV7S8JVOT?=
 =?iso-8859-1?Q?GMJf0VBg/KGGBp4bzhlchGEvTRtqRtWhGKn8KNEcHWirlQCTurYUd5aiDR?=
 =?iso-8859-1?Q?qhRE7PtNK14CHjfFPuKEvqmcVVKJ1EZy125lTEiho2hecKSanBDMkAAoIw?=
 =?iso-8859-1?Q?T2LdMf/U4jki//T8RX0y7bp2JzqFCsu9B2imEk4j++0TewHmmrxXwJ+y2v?=
 =?iso-8859-1?Q?Bt8wqnmylJaNej35qPF+AhwWt2BKXRb8ymX3QT/w3Pa+TeMq9FNusZLCh+?=
 =?iso-8859-1?Q?umIFAtDQpBvgMbgXXw8ZS6T3/ENKSHzU3NuH1G6wdxjoeMWvhFF8bYDHs5?=
 =?iso-8859-1?Q?/yqumjYcsOA3VT4HxvPT2LsdmTpTvnJZ1tiCvm4GhFkRROds02E2WeQ3ZI?=
 =?iso-8859-1?Q?7ksHKgsLKZgFJIuLPqjgxgqZiS5ATZonsuL8JS5cEdbzadesmBNaNxbFZd?=
 =?iso-8859-1?Q?ZeqKoNEApGXkMRcBBqR9npMtTXr2goCh8GIO0VrRtTB0xxaqbSIvMqaI2A?=
 =?iso-8859-1?Q?ucslM87ihhtrvKFtRuAGjn3SLZ16Iw6LaibM+zAQaepp1q5RF4a2cEaaVA?=
 =?iso-8859-1?Q?tTDqwZ4wumNelgclF3BF1N5piwF/jWM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5910da64-d40a-494e-bc72-08dea1530161
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 16:11:41.0640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0kNf7Kr0nte2/Oa7exV9hEqVI06snm+PTCOzTeJoRZmIp0hgWsfKKOh3OvBGZ0FemFD59weZp6+NWOdZX6yBwpr/4nmIUbeQuMqXyzHVrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6752
X-purgate-ID: tlsNG-42698a/1776960705-7E971F3B-C2EEDB92/0/0
X-purgate-type: clean
X-purgate-size: 2596
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
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
X-Rspamd-Queue-Id: 22491454B8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a common bug pattern found in several Xen UART drivers:
when setup_irq() fails during post-IRQ initialization, drivers log the
error but continue executing and unconditionally unmask hardware
interrupt lines with no handler registered. On platforms where the GIC
receives these asserted lines, the result is either repeated
spurious-interrupt warnings or an unhandled interrupt fault.

Patch 1, originally submitted as a standalone fix in v1, addresses
the issue in the SCIF driver and moves the hardware error-flag clearing
sequence to before the setup_irq() call so that stale error bits are
cleared unconditionally. Patches 2-4 apply the same early-return fix to
the pl011, cadence-uart, and exynos4210-uart drivers.

The pl011 and cadence-uart drivers additionally had a positive-condition
IRQ guard (if uart->irq > 0) that could fall through to the interrupt
unmask even when no valid IRQ was provided. Both are restructured to
use the early-return idiom.

Changes in v4:
- update comment for setup_irq
- add R-b
- change %d to %u in printk since irq is unsigned
- fix uart->irq <=3D 0 to uart->irq =3D=3D 0 since it's unsigned
- update %d to %u in printk since irq is unsigned
- add r-b
- fix %d to %u since irq is unsigned in cadence uart
- add R-b
- update comment on setup_irq
- change %d to %u since irq is unsigned in exynos
- add r-b

Changes in v3:
- clear pending error interrupts before setup_irq for pl011
- clear pending error interrupts before setup_irq call for cadence uart
- change uart->irq <=3D 0 to uart->irq =3D=3D 0 since irq is unsigned
- skip clearing pending interrupts if setup_irq was failed because
according to the 13.4.1.13 of the RM: it must be cleared after
cleaning interrupt pending in INTC.

Changes in v2:
- Extend fix to pl011, cadence-uart and exynos4210
- fix typo in patch 1 description

Oleksii Moisieiev (4):
  xen/drivers/char: fix SCIF IRQ registration failure propagation
  xen/drivers/char/pl011: fix IRQ registration failure propagation
  xen/drivers/char/cadence-uart: fix IRQ registration failure
    propagation
  xen/drivers/char: fix exynos4210 IRQ registration failure propagation

 xen/drivers/char/cadence-uart.c    | 22 ++++++++++++++--------
 xen/drivers/char/exynos4210-uart.c |  6 +++++-
 xen/drivers/char/pl011.c           | 22 ++++++++++++++--------
 xen/drivers/char/scif-uart.c       | 12 ++++++++----
 4 files changed, 41 insertions(+), 21 deletions(-)

--=20
2.43.0

base-commit: 077dcf9841ad7df4e63c718249d8ac95f8a709ff
branch: amoi_dfmea_scifv4=


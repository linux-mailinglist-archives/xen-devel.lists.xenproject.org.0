Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPhHAvKV6GmENAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:33:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BB84440AA
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:33:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290080.1569767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTxO-0000tv-KI; Wed, 22 Apr 2026 09:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290080.1569767; Wed, 22 Apr 2026 09:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTxO-0000rC-FN; Wed, 22 Apr 2026 09:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1290080;
 Wed, 22 Apr 2026 09:33:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFTxM-0000qi-69
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:33:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFTxL-00HYU2-Ix
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:33:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e895d9-5cb7-0a2a0a5109dd-0a2a450abbdc-12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:33:15 +0200
Received: from [52.101.72.72]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e895db-56b3-0a2a450a0019-346548484ad9-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:33:15 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB7710.eurprd03.prod.outlook.com (2603:10a6:20b:41f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 09:33:13 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 09:33:13 +0000
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
 b=DOb1vgAfDHNtV4HEBB4NP7onTlbomv8gRM+Fxldc0NjcG0y8LLx0medXfzSZYprdMOsAMBqhdH0nZasSLcmblbkPB06PXHPfG3En2bkkJT7GH9FeolkbXBUdY7WgR2PmBCZP4nm+byV5OYwuRQscFQG3dJH4XDcG7GggF33Pj6JnRb2CAqg/dnjuPBjaraTdHv/+BxdUnOSZdQYZ7Ocl/vyon2eq7YCfSOkXuYDmYb5dJZE1LwfaI9Rv2sSoa7kproQZJdGNNHajjf2V9CM4fZxtHORYS0RPoIQjT9C/xZRtt+6Kga8dw36hTDaaJ0VSoE3ynt3qBnajgmGRCOlUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cD6oYWPhNvkMVdavA9thDpcJ99Ili6JHLMWkKlDCncY=;
 b=SiqVIF3V9Q5yWH4avJxj+oY+2oD+4PPZHC2MNJjBEDK4h+13QVrMzJfV95yIKLtSo84gHau7yW2rGmGSsTYzQb8lftGiLshk1qFsg1eMPISGk4s5lzj238gHIPppA+Wzdfsodq0w/utaMiCTB4jlnq9SNRXe2MdS3dAr5gxdM/mRdq8zU3qj/mlIvqHHcNFWNRF+C4Ckx8EVuk79V2MP5C2G1nlKMkUHGcbVGLSAfbbMsBJa/gNuxJM6Q9CkT9zRqFHeleOQLf9ZEAD98hANfqo6eNLhP1j8npubAHpwu2LbDO7nL8xLx18pL92yaxbCN03TkNYX6jRd5A+o7PtKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cD6oYWPhNvkMVdavA9thDpcJ99Ili6JHLMWkKlDCncY=;
 b=u80AFmYawfm22rXF8YndzZiuFYeM8AOhwwXdWLGWaEVnZnzoEUiJJJJKAAK9RjPNnBsJA/usoF/+GEY4/pqigZeOWW4F/85un0U+413E0I0oFFfICtN2PRm6CV2LuCVoVlXB+3IPOnJOUKghsGB/7plZtZYHhCz+DKZuP2XEkSZ949TQTzZ8qFQUSJ7zQ/IOi+P6sFDUmpvGhSZ9E/UewtReagGViT1Gn0Vrv28GMxMUDtF3mQNnrMA/lv0EInAQZGbfKXEGs23VW13kJvZ/5vBt5Osk0bdiPo6dsfNQHod82qHa0ZBaTtSJ2b/tQHdHgUpoMxCtskRkMkHT2e/OqQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v3 0/4] xen/drivers/char: fix IRQ registration failure
 propagation
Thread-Topic: [PATCH v3 0/4] xen/drivers/char: fix IRQ registration failure
 propagation
Thread-Index: AQHc0jsKINuSTAnYQkaUPLk67EYWSw==
Date: Wed, 22 Apr 2026 09:33:13 +0000
Message-ID: <cover.1776850201.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB7710:EE_
x-ms-office365-filtering-correlation-id: 5000c751-deae-45db-07c0-08dea0522cc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 95LvC5K4lEEvlF16Ko/zr/2ouqSMx/qaq0Dx3SzB7O09xg+G0jzwYo2uy8LOOc83YneP68wDcyWfwqT+znqdTy6qsQmz46v66I5lY82IAeWI4mgukUN8gHzu1FZO05LNlGGEumsd8FuGRO6VMNp7G/UPq6DDYvFiYxGGTKxOFgwpibqyqnXl7P9Ld7jL6eevf6O3uzxg31y2rpYKbab1E2d3Qo+zy5i3MbXJ8LlXUGAvBYkcx10wVhSTxQXsuaP8rdgd/Qn6dNYCVnV10qSoPQGT0bUry3dm8QFhA4d3XO0PzbYHenzSBHyCeF4cjp4jEHdA4eoDTkv4ciLHj2R8GWFo1S5KnDc2ecoGD1o+4WnJ8W/vsH5kZ9yz8lh6mqPfRFueK2rTcVPXyH08zerCfCXquQFvTlrgD3p80Gw8nz+DjKB+LQ/BWUW6XYvVSLz4QQkdodLxoV0PwURaHls3k5JADFATjkukNeupTgpDuBvgBKcgMv8qOZtOu5JZiakonvyokRXUGH/i6iBPTyxc6torl8yKX4PLlvLNqByIy99Duq3kxTiAR/AKlLx2FJRXEa1Lmyk/8VOHt8WcHQXgZPJSGDoH2ugxkL39yKDnn5fg4o/Ir6Xk67vMSWl7m+fZVMR+QcZUrcb9SgoGGlpuTv/aLu4pM4eJqr+BHI/ddPEvNg6Pw7O4fDEQH4t6cIFJEh3qLwYFi8h88Ov/XDBo+WGmqjeVHZNG7WNmV2FG6Bu/7eaLCPUjW/z0gKmqPAX9lYr9xjru8cBZyLT8xt8wcHx2MGa/4O9tx973fc6GlOg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7bb04ywxXl7xVQWC/UVpGP2K458AZdXYzmNrkVWbGh5SEKgeVPcxMpodw2?=
 =?iso-8859-1?Q?BCZGN4KAn5NXYG1OzL6homfxlB8WuGYJFi5CgTQ9UioPz3+wtqqKWuhc/e?=
 =?iso-8859-1?Q?11o2lzgh7YQ/WvKy+/Xdh4crKdh0wj+EByAxWZZgq17I8PqgcdpADLRohp?=
 =?iso-8859-1?Q?Bv09hjR3zDDPoG33b6/UL39kIMo76BkFE+KdU+rxgsLMQD1vjSDanCpAMt?=
 =?iso-8859-1?Q?nKuVZCUDQzU6rfupojhBBNzNS42THKYKWBbNIAxTEt+FQEmcan++5ku58E?=
 =?iso-8859-1?Q?GJMvWnUs5VtJ0JWQkbJ6G09OVFUdM+k0HgWFEBvzSUhxdC+2qUPoCdIxqC?=
 =?iso-8859-1?Q?uMwEEROc8EZroD1MM/S6K6vSKzV3RWGzoH33VNmVMStAcJf3EYVpeIOIvp?=
 =?iso-8859-1?Q?fYmznBH8pyQzSZdZNVCyLR4ogP0+DgkVxhQ4fE+bVj9WVWZTZ4kLReS23I?=
 =?iso-8859-1?Q?cCLQKqS6EBNAhcEgarYcXlrTumvWRQAkVdc6Gsd1DwHny8c3oSI+a78M/A?=
 =?iso-8859-1?Q?KpIlCZpF8qumgWvaEa1YR8HqQ/CQwkvcaBmQ16qOiG81i6ELY54WKEANOL?=
 =?iso-8859-1?Q?RmicBTOZJljbwJoAeN5V/qw1dKHiuVqXfVkc1fdFJDq5u1d5hE7riHCwlA?=
 =?iso-8859-1?Q?9KCCUxo6aogJQZURyWYCCmqnfoByRGLD9bFDR7fqAS9lA1wdQ5281b6J4W?=
 =?iso-8859-1?Q?gGqgZl85txUqlNP0534I6wLG6ib/DdBgHDBP3WdS1Uj63wU1BVu/WQJ7UZ?=
 =?iso-8859-1?Q?Wf5nfwOSMDAhe4Z9l1gCVmlnxp+6xBywyYoyFCNjl5RSvsfh4JV0Z3NrI8?=
 =?iso-8859-1?Q?qyYXSA9/QPC9FT4OH49TCQ4v8B5sDkIefV4Go9fzJPwpNjVVwhvMwqe3aA?=
 =?iso-8859-1?Q?q6YWtUYHOtmky+p1B5iIWeGDhhkwQaNjx1LTkRLkEPEwDwNV6FBeOpjprR?=
 =?iso-8859-1?Q?MfWfDkD+XRlvRIzrkFak4xzwcwCNO9yhw/EFMZSVBgvZJPMrKbZ5iZzo3s?=
 =?iso-8859-1?Q?GiBTalk1I12M4Afi0xVxWPFQa5hKXxxRh4FY8L6rZOx3Mq9XbEWuySJYTz?=
 =?iso-8859-1?Q?M/PyqNGSc5Ke/iMzFstR8I1Tg0NZuSUkriWx7jrZlWgF9X0SpqGsjF40pv?=
 =?iso-8859-1?Q?/ELjC3fmrCUyQzDJZkFtYziJH/BkZtvwldEFueheVdu5kjA2Znx6cE2xwL?=
 =?iso-8859-1?Q?8vb2fG9ndrYM74ilDLfqu0HJeQrJL81U6mNZQ40NcPTzTpVPauGU3wxa5B?=
 =?iso-8859-1?Q?xOtTtJ/w1I722C2y+jH4Vj1MkqBiSH/wxmFAuKMIz6/1ZFGoyGlPMqDfVH?=
 =?iso-8859-1?Q?Z81BbWt7R1X6y/qxqfb/w64srDxjehKqu34kHVMxO89kqJvXPvnQ7vzDLb?=
 =?iso-8859-1?Q?yona07owDlx9DPmuc8IMdU67TU2BEXe70TQ9n1ybp+bFxfvgTBPLb/IL33?=
 =?iso-8859-1?Q?6gSXCEj7A8CT6Zjd0KnAiuoI9lViIViuViojqzNwi6owOHLRV+EKkifOPi?=
 =?iso-8859-1?Q?Lr0lvLjzYpqnqp1QBUb0rJAiTuD1fK0nYz5NaiF8fR+xuMAIEAUe2ugqin?=
 =?iso-8859-1?Q?ZyWkW6XXEAxj4TejaWDa7ADwwNCPWF1bSPJFR+kTg3EKtIhTNwuzu6XVfq?=
 =?iso-8859-1?Q?ptp4TEGK6gzR6LOZKaeA89TRlO7Xjk3qxZNS+kwTfGs9xaeDIv43uZ88DV?=
 =?iso-8859-1?Q?pXi3+kkUnPli0aLSDLfUSXsnfsK6E0kE+1OanJlm6TaE+qHTSe2Mjk3YCE?=
 =?iso-8859-1?Q?0Dyi3DFhP7FoZA50OKvkPKW2TtmdF0uxZ/gsQ5OGJAp/9drOnxHsj8VS+5?=
 =?iso-8859-1?Q?PQeqTKyxuzqKuBlCcgAVIcACg9vPmJ8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5000c751-deae-45db-07c0-08dea0522cc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 09:33:13.1405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bzWcpDqqkLCIwq0n7AKvo0EGQAly5kOZ3XU7ITyzU7nclt+YbScIy6+2tclJyIZYSCZaUE3kKQSMu2L3stLnbBv2Gtq0TwsWpReTV9nA10E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7710
X-purgate-ID: tlsNG-4011c0/1776850395-CF97E8B7-BB155827/0/0
X-purgate-type: clean
X-purgate-size: 2200
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
X-Rspamd-Queue-Id: B0BB84440AA
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
 xen/drivers/char/exynos4210-uart.c |  4 ++++
 xen/drivers/char/pl011.c           | 22 ++++++++++++++--------
 xen/drivers/char/scif-uart.c       | 16 ++++++++++++----
 4 files changed, 44 insertions(+), 20 deletions(-)

--=20
2.43.0

base-commit: 077dcf9841ad7df4e63c718249d8ac95f8a709ff
branch: amoi_dfmea_scifv3=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGxcEmWK1mmwFwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 19:03:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4F83BF3E1
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 19:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276362.1561864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWJI-00014G-6y; Wed, 08 Apr 2026 17:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276362.1561864; Wed, 08 Apr 2026 17:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWJI-00012J-4L; Wed, 08 Apr 2026 17:03:24 +0000
Received: by outflank-mailman (input) for mailman id 1276362;
 Wed, 08 Apr 2026 17:03:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wAWJG-00012D-4h
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 17:03:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAWJF-00Akeh-Ah
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 19:03:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d68a3f-5cb7-0a2a0a5109dd-0a2a4501c6e2-32
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:03:21 +0200
Received: from [52.101.84.136]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69d68a58-6fc9-0a2a45010019-34655488f7a1-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:03:21 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by DB9PR03MB7657.eurprd03.prod.outlook.com (2603:10a6:10:2bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Wed, 8 Apr
 2026 17:03:18 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 17:03:18 +0000
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
 b=y656UfJtKELFVM8VyflpHsNtWC1sA/ZgbdZ4cN7sv4GU04bOOohSJTUg5elSy/D6hour/JfdgjlY8wm79KStHJ+/LCYGNSPQsJBwZXBpNnAI63bVI7yTqNseVl83jTXV7prDJsPUqSfUykPxeCp+IQsQrS83Ph6h+QA8gnl2JYA+GZzD94Br5/AijIgfuu2Nr/6WzKeGiRMWx7VAeYYSgwe8U+0CwHfdL+VbnhYkNP185fFEMIBhtUsQB1eUfhjEZXHP5cM3Uaqd6GzVXxpavN6MqeGvSMLqKxIOcRLZT2EYQ9urSkH4zEbayyAHzF5AuRo00HK7OouQ2pIsaOZqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l3SYLGzohrpshVbgik0hQjtxJpN+1rqXO7JzQpHF44=;
 b=WSGZ+n+ySKRItrjF4G4WVxDj4iLM3uIkDVV2bRifqAgWnHrryiAHu8ByDFfS+NET2fQNVy9nzf/hREACyvPAy4eYxBme0916yISIyeFntPmQuGmkpVkmfTojfZaqMQOvJFm+s0zwtEqSbU/im9OglNKnwP5uWcv97HiFsnykDfOjoN0KiXxzefABkh/VklfHaFWz9bfg30RmTScSQHhs67jvvZD44+tPfjKFORgvTz9FYcZiCqOHGyn4E3bGpWieDv2iCiqZW6iWl9y/dzSS4s4Eaxc2dTIwS25MLocWVsrT+DJWVkDHiP042YuaJtEUmezbfxfbSOj3UAPVmd4FJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/l3SYLGzohrpshVbgik0hQjtxJpN+1rqXO7JzQpHF44=;
 b=BmWMkw7NUFeaokswofx/pjNqB6nicc/LterXyyFxFp8W8/PDvGMe2lmwZT4nmW8l672Po16u+x8I325ZZt7213LXfgb8cU6jf2cVVJ+LCcLCQABrljfhAwo5mBpyWc7wySWPeQqXAlFoJVcY+gGGRTCLDcIm5hAPeAjfAuMJJgsBqKi/u8nj+TQAyxx0xqwtDzlkOTmsUcKqA7Ui6DS5pZhQZCexYCK9te4WOilff/IZjOno7prRWUyqOGX0nI8nfdVTVDw87YF8KkX0AeEwQvhlJGv+qAZuMDGADI5us+APbcghuSJig2HDYDna+yScVlYEBpqnYeTpF2MOcghjUw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH] xen/drivers/char: fix SCIF IRQ registration failure
 propagation
Thread-Topic: [PATCH] xen/drivers/char: fix SCIF IRQ registration failure
 propagation
Thread-Index: AQHcx3mY/W4PalxaQEGlXgb8zysT1A==
Date: Wed, 8 Apr 2026 17:03:18 +0000
Message-ID:
 <6d1996b3d36e4d21e58c0e60876a1976db9a6208.1775667739.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|DB9PR03MB7657:EE_
x-ms-office365-filtering-correlation-id: da4f20a2-a374-4e51-eaeb-08de9590bb52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 0nvg+3mdiMVsTCUfAS7Dz3tfCBWc7PA/SQSZ88DyL0jhVCUbh9TprPNopz8LJiiDG8fOOdpwkMo8a89z1zui5jrL0JqyE6SeAZFfG1/bRt7KFjK6YjgGNmrqRTlepnqLEwT/8WYWKpY8ceMkazOGUtMjcRE/kFM5RvNGgXCmMM1m4Zxlo0xxr4W+BZxw9oVzbtkgCTJCAS2GaEyWG/k5F168MAgh43Nx97gLv1RV0f6ECrCcGbL0DUxHb5eMGWug9kJglVi/kczRaCDpdfYAQXuIO/FGg6VmfVJSbURIOo8qTWN06Hnz48V3wr5RnIXSxlh/dIMzTrUJtSeTql9NfonTnI387ES/X18yzsJdY4SOyytdpW9lLU0ybZDI8rb832CHy887A2LR4rLZmTsnG8Y/2Eo0dL62HZqvyWEvluc5MKDZ6Qnj7ZrxmIkT7OiwnugE7wsNJNzg84fEgLFxfYnqsLP407yce9L9xUzq2IGY/v5eTYgl0p/t2Ayuh9oVewBsjZ8WEUJGL6H+c9kZAlfadZJNYS+Qlvyw36CakNDHndlW1qqtSL83FHAziPEiXGNfJIMQEj8dAW2GNBxqi5fKFCGQxsc6lNMTM2r1j/dp0cy1URxmnTK3ex3qXL0vx0WO+EQaa5s5Rhapr8i6MpNKx0LnOOjWUWTHSrJlvUqGXDEYI+f/TgmanoUJYNYcv2p5pEFadX6iLIzoIl1dgzHQMhQmw6MIDaHsRYTNO75G84TInKJsLhDyCGEBKzbkcmeYknkVj+BA/+6IwOIbGAIBkiOT2OnZekTrbEemk4s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cnbsnrgBPSWE8Hb1cxxdHD+GuM7rW/TxrRCf+pILuc3t/t+BMNi4RvtK1P?=
 =?iso-8859-1?Q?UfVC8KQDIOlXuBOi9AoDaAchsBNHQE89+cn7pkiJh6ENWZUjmE/vzkMd7G?=
 =?iso-8859-1?Q?XGq6hGgoIcmBbaE07FMszhiqffN0AocEhoknjRrnhQH012gkrU8MVZu5Dr?=
 =?iso-8859-1?Q?i4fJnyj89qoXr3uaSdr0A5onLn7jMNndr8NdBLq3nM4ewTynUWpycEE5Pu?=
 =?iso-8859-1?Q?I7LUmFMhB8tx5Jy5R2Mcm2RZhOfaRC5wuCyNJ2/Cm7QoerQ2wxB1PAyUt3?=
 =?iso-8859-1?Q?zTzfaTG9XjQ4PR7uUdWoK2j4Ogjbe2uY6BLh8biSnkUQIIc09ZKjqQ/ULa?=
 =?iso-8859-1?Q?n7C8V5agp5flLxM6K8ra36oUbbqwtsCu4b9pkkzbQrY25/eqacL3rvi9Zj?=
 =?iso-8859-1?Q?yCmX9VixKJs4y7iSPWIPl2MmxJ7ox2iFz97X483IxPtl6jkzsXrzN0fpdC?=
 =?iso-8859-1?Q?AVwtJ1vTEMEVvdmSXWv98Qq9Ck5H5WZCGaG2W5tAst7tqiA0WgKfL/dnPm?=
 =?iso-8859-1?Q?FPf2XZqUXE4GgtS0jQNIgmOUCqCyXogu0+2HbhN752hUM4KTePSA4RDvrC?=
 =?iso-8859-1?Q?/SIPOGH+SOtkb690Yu9t7WwoAM2d7iDtOQlo7niKdtxTqEZMyK2O+zTtid?=
 =?iso-8859-1?Q?hrN9mY+DqPgVADR5EvIVt95RP3mw5m+bgJuficPrtDWEymfeu9MfqswSQ6?=
 =?iso-8859-1?Q?udguZ7YMYlua91utMMKxoWdYfjjMZvJ1IK5LJ2MexE7r2DAwKN0matL5bF?=
 =?iso-8859-1?Q?Qr2RGunM1JgO79NQDty9GmHfKjWO+0qewSnyRAahEA9n+rCZIRuoKei+TD?=
 =?iso-8859-1?Q?JzsOtyw+PQBzlQz+iqYgQEzMFClUg/pxpsqIWwKbQelzh7VbYTyARlDVNM?=
 =?iso-8859-1?Q?6suQ3M+I8EmXiNw7Kl5YhSTiUvKyMFL98hAMu8EA+G5rF05ARRe7pyJ/JO?=
 =?iso-8859-1?Q?c5YZ3I71QQw8yaiNnturd2CnPYRWG7GdHnEa83U+8kURp9yTjYe6gmcuXH?=
 =?iso-8859-1?Q?LZZ7KXIaxj0Kz4rBttz1Mhq+pRr7g1ZjsAOYfXQmZw57frrItMdConX6Nj?=
 =?iso-8859-1?Q?uQKye62hlI8K+zhZc3XOxasjme1rRWSvS+omqQgOrnOlU6XKseQsPGoTuZ?=
 =?iso-8859-1?Q?zLC+JfB66SSMEzkjzuLh8fL7JfJEZ4at7Hkx47rUvvwumPNlnOipa4pbHx?=
 =?iso-8859-1?Q?98ocHYwlvJLx1xLFp+OOeQ0+ywKOtv/SD/f2GeZD3AgiDnSQGTELQA6IoE?=
 =?iso-8859-1?Q?x0rXt1Bkh0hChVHwKuwzxR0B5i11Hn00GhjN98ohtHtx+dd83jp117CCrs?=
 =?iso-8859-1?Q?kXlQfCM7aFxWil1UWexf9topDy6taP2rsTPhF/vthmlA+CXW+1X2eFEBaR?=
 =?iso-8859-1?Q?ohIZVsg/6AFIs90vdPvd+3jKpoU0raCsFHK5mvAykhM7qH0EjX6QYGk2F/?=
 =?iso-8859-1?Q?Wde3QhXJxtx98k7PHfdmik5VrUIBH/gHqtNrkyvYsZkuw6LEPdCyJoE7Ti?=
 =?iso-8859-1?Q?5asjH+u7q4hSJjzKDnSU0fPQHBp5CeWj+VgXpu7zCrOKbLYPa2IuO3IPIs?=
 =?iso-8859-1?Q?2RYhIRc9nN7iR+NMxdlY9URCXOWqYBnw+ijNcpoGxG09NGQtAKXN2rMnbN?=
 =?iso-8859-1?Q?giSOXKqFn+fG1FqAXD88rdxhU8qkr14u+pvnv722ORMHKrGc6j6H4Xjfx6?=
 =?iso-8859-1?Q?g4da69O+zvTb7EiMxUTKBthAi7SBcBaTLhrhEO2CXVJOabHFo3mLd0wqWA?=
 =?iso-8859-1?Q?s5nCAgM8OtUoW+bgv8kZCdCzHopXapIAWlRjAWnLcVKF4tCi0WSUvYTAnV?=
 =?iso-8859-1?Q?rPQb0TK22BoWfApMrxycLc5nA/E33+o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4f20a2-a374-4e51-eaeb-08de9590bb52
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 17:03:18.2615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aKtsO1I2IQ4qez60gJsT5SvoCAMNRV0S+uw5CXSFw+jJNc1BVHWwFiFHMabOt/5Ufe4+JXbkr936iOFVmjIEA7Iy/PWFCFuiViHx1piZw9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7657
X-purgate-ID: tlsNG-d62444/1775667801-B62E9185-27CF83AC/0/0
X-purgate-type: clean
X-purgate-size: 2951
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: AC4F83BF3E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In scif_uart_init_postirq(), when setup_irq() returns an error the
failure was only logged via dprintk() and execution continued,
unconditionally writing TIE|RIE|REIE into the Serial Control Register
(SCSCR). This armed all three hardware interrupt lines (TX FIFO empty,
RX data ready, receive error) with no handler registered to service
them. On platforms where the GIC receives these asserted lines, the
result is either repeated spurious-interrupt warnings or an unhandled
interrupt fault.

The fix adds an early return inside the error branch. The
interrupt-enable write to SCSCR is skipped entirely when no handler is
registered.

SCIF TX continues to operate correctly after this change. The Xen
serial framework never calls serial_async_transmit() for SCIF, so
port->txbuf is always NULL. This causes __serial_putc() to take the
synchronous finite-capacity path, which polls the SCFSR_TDFE hardware
flag directly and does not depend on the interrupt mechanism.

As a secondary clean-up, the hardware error-flag clearing sequence is
moved to before the setup_irq() call so that error bits accumulated
since init_preirq() are cleared unconditionally, regardless of whether
IRQ registration succeeds.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

 xen/drivers/char/scif-uart.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index 888821a3b8..673a2d3800 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -187,16 +187,24 @@ static void __init scif_uart_init_postirq(struct seri=
al_port *port)
     uart->irqaction.name    =3D "scif_uart";
     uart->irqaction.dev_id  =3D port;
=20
-    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
-        dprintk(XENLOG_ERR, "Failed to allocated scif_uart IRQ %d\n",
-                uart->irq);
-
     /* Clear all errors */
     if ( scif_readw(uart, params->status_reg) & params->error_mask )
         scif_writew(uart, params->status_reg, ~params->error_mask);
     if ( scif_readw(uart, params->overrun_reg) & params->overrun_mask )
         scif_writew(uart, params->overrun_reg, ~params->overrun_mask);
=20
+    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
+    {
+        dprintk(XENLOG_ERR, "Failed to allocated scif_uart IRQ %d\n",
+                uart->irq);
+        /*
+         * If the IRQ handler could not be installed (setup_irq failed),
+         * do not enable TX/RX or error interrupts. Serial transmit will
+         * fall back to polling mode.
+         */
+        return;
+    }
+
     /* Enable TX/RX and Error Interrupts  */
     scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) |
                 params->irq_flags);
--=20
2.43.0

base-commit: 599e3daf63ee2a83bb7096c452aa05b4aea84f2f
branch: amoi_dfmea_scif=


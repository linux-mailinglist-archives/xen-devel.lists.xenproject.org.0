Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF3WCxdG5mk+uAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:28:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D52E42E33A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286233.1567342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqXi-0004Lu-Uq; Mon, 20 Apr 2026 15:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286233.1567342; Mon, 20 Apr 2026 15:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqXi-0004JY-Oj; Mon, 20 Apr 2026 15:28:10 +0000
Received: by outflank-mailman (input) for mailman id 1286233;
 Mon, 20 Apr 2026 15:28:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wEqXh-0004JM-9w
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:28:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqXg-008zaY-Mj
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:28:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e645f3-e002-0a2a0a5209dd-0a2a450bb430-42
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:28:08 +0200
Received: from [40.107.162.9]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e64608-212f-0a2a450b0019-286ba209af14-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:28:08 +0200
Received: from DUZP191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::6) by
 AS2PR08MB9152.eurprd08.prod.outlook.com (2603:10a6:20b:578::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.32; Mon, 20 Apr 2026 15:28:05 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::5a) by DUZP191CA0012.outlook.office365.com
 (2603:10a6:10:4f9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 15:28:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 15:28:05 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS2PR08MB9761.eurprd08.prod.outlook.com (2603:10a6:20b:606::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 15:27:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 15:27:00 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fpxFAVUznBpebz756pT/PySIo+Rxhxcjk2Gvs+eIaWIdYmAIk4LQ8rZu8z2OcMoU/FiVp17dYtpJ2+//NF+kLfFYnWsPC9LulFf+zb2jx0nvuOKt6oEkNUbtqwOmPdFWv7QWqvwjDP3cULIG+OcBR2gct3riBaBotr4JynmsTIJQXWta6pEUOw14WTRSmSimZc1vplwRbTtdMuxo0MP2H2Nq1f6UfjxHIXHZO3hMKwSA0Hd0aCZ13Zlyc+FAkp3LcLZY2ZdbXzpr2DJoB4K29HuTNUlgxCieSeIrpWqy917ZF/P8HJTaKstxcO6yQgI+VATwRu7WBiioBdv8qDaC0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSCDnZyrFgAUNIywPQiELxv9+3IMXVr0iZg/F3/mV/M=;
 b=v0Q3FiPFY4vyVZcgEVrfPSYAqBzIhvax60bQ2yuixlFWhPeHj3xRM8/jFCC+gllrmhoab4Fy/YJP+E0glgYpS5IZ1BbQJHL9ZoJAHFpWe5ToIdMmI9V1i7tn6lBCOJNEVDCSunDiOeR/riWdYkLmqRpCh4EnEeLl9pAwWpVwuHSoTNjgR6SJL/KhWEAWYo+BBexEwJp4RtvLYQSxVl/LR3RVVrwemmY+3mstnQ3TzzZy64mISQ67Uo8Tle2+bp5HNxXBLZzc3FqvEmBErBQVFF8POvMl73AdFC6BrojbgDhygc3HBVWjK+x4EjpqcgNG37JgaftqVL4mFMxN32Z4Cw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vates.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSCDnZyrFgAUNIywPQiELxv9+3IMXVr0iZg/F3/mV/M=;
 b=WxIM5QaV7CxwuykKzANZrcGeGgwjGvxRHdsAIPPrrCe+lifdVrIiFhOl2vmTwKxslkBXPIIrkY+fFIsTKohrgo58tBvmY6Em+2iXwnE4gzJqxyFjhnaUrPw1cVI6lyUmf5fVgiCcUoKywg4T1hyxVMOBuHsZe63ipr8baIuLQlU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrKN5hCpPNOCGArclOpevfHEQ+BKWLGciePRHikXukFhUblSaTf0QRcFLit0g32i5VO0VifAN0bFvyukqIubYz35KunbWyMM8OiomBPi/jZFDxQxyijBkY3A177u9xtrhnWcMe/Q7jtqnwwEWqsfxy5BcSxAOG2voSZgbn6gZQUy3QwFM0ueEc/eV+TWYetSFpm3AatLvbWCMOnNxVg9lMNirLIG7AoBS6NMEwYweIJ8JTqoZxmGsRu00bYUIBeGdxN1RAsf454fBcJg4Xdl2MZAz628cfSNUZ+u1LtRwi98UeL96KaHlVUGDW1U5vhjuj/K75HlhBmsoYOB/cBUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSCDnZyrFgAUNIywPQiELxv9+3IMXVr0iZg/F3/mV/M=;
 b=x8NQsTLugvGhkRct0KsaLmVvpxEU2lWHx+hPrkBacGiCESkTnWU/04CVToF+xF2ILNWrlPqHotPk3Scy3g2R/AU3wRHaAev8CnzoeQqutcPsqJfO7mn88lxQPWyUpoljwGtVrUuFHr4DLu1QKgd83uWT9TMq7Jiwsgk/0fmIP0ZQ2KuerH+ny7wwJ9JFZu+sxU4kj5zTmXRq16egWzSGYe90oLKllj+0/k5xO+wstSdg19cup3eFMRWikrbOU1xM187qtAzi7A5Nk1HUj0nbgmwd7eTRjHdKrFHQShOSt3ouv83v1y+lPw0ZdrIMd8Fy9vQSWBRAVtzvZdlcxjMC9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSCDnZyrFgAUNIywPQiELxv9+3IMXVr0iZg/F3/mV/M=;
 b=WxIM5QaV7CxwuykKzANZrcGeGgwjGvxRHdsAIPPrrCe+lifdVrIiFhOl2vmTwKxslkBXPIIrkY+fFIsTKohrgo58tBvmY6Em+2iXwnE4gzJqxyFjhnaUrPw1cVI6lyUmf5fVgiCcUoKywg4T1hyxVMOBuHsZe63ipr8baIuLQlU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Yann Sionneau <yann.sionneau@vates.tech>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>, Hari Limaye
	<Hari.Limaye@arm.com>, Harry Ramsey <Harry.Ramsey@arm.com>
Subject: Re: [PATCH 1/8] xen/arm: Implement p2m_set_entry for MPU systems
Thread-Topic: [PATCH 1/8] xen/arm: Implement p2m_set_entry for MPU systems
Thread-Index: AQHc0NGaAJmAtEy3fU6jl6CvofRliLXoEamAgAAA0wA=
Date: Mon, 20 Apr 2026 15:27:00 +0000
Message-ID: <9D8E2C9A-FAA4-49C4-BABB-968B61314B90@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
 <20260420142524.1804073-2-luca.fancellu@arm.com>
 <758d9182-aa50-4c60-9834-bf8136c4ef3d@vates.tech>
In-Reply-To: <758d9182-aa50-4c60-9834-bf8136c4ef3d@vates.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS2PR08MB9761:EE_|DB3PEPF0000885E:EE_|AS2PR08MB9152:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb032b9-1e63-4a86-1af5-08de9ef16b48
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 kP1dIy5HGiHwM5jQHwcOgBZ+NBC88rrNPH2pKa1yV2UXHhMZ8CWIXRgvhgzo3cFm9a/z9b0wV2qAXMLiHa8hIHN8tvinHfdDN02PQSCgC2/9CRbfB2meTHm+iZyY1vIUbJjUs/V5AfpT915DZUxYCbFeTfHR9efsW/gN/VPNX6dWcL1lWzQ/ch312hHpuVbOZckMgoa/Ey0WXPHc9ulADeziluwb20gTEzBvlacyzvO8Z3bm1/QyfRhkL7mcYJmEXW4dj5Xm9Rf4VWbYC5yAy6UHeDKaerPbXw2M8q9xX0zk6IbuweGwwvmL/0s5i6WuwER863pUDlalkq0boOybIhFjM3wfHc+OhHzCDZDPyCG1g8tlN0FvcIe3gjqwWjp0zk3xjZxAMYRknxYjYM2dtaA9HyU2LrdakysYmPH3dM4dT/dOLZxGGPt28bFoqkBAZrpDpoNv8t8TQIKvgfLGX2IiqkK7xSd9HVjkww2I7awoARoZ9+r7G9kO8X/gvmRy8wodV1gg1OETLy/WC1IdSkx4AhPRf/fM997ALXMi+5JaKgCXYnTVfsGA39X7K3twMddQDu0yZPWy8uzes6euwqDLlRJevpdKcz5GebgJBfIbiVyMuJqyuev5AUtYCveF9CIJkbw94OT3z95+4dHyIwaiznKP77CupITnmjihFkcz8YGEGeW16GSSicmvfKUJz8+EjNH79UFwvUHwfhD8mCDfq3fnU9ZH66ibDE7BWYf0LvL7yHPaieNR6zXRKoDcco1H79Fl0xAmn5XAAdkJwt4r52IGKTVpT3uTBMt1Vck=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <030426270C759A46A77FC461B444590B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 vti2SLKO5qG8fA1EoHiCK+ANRrJAryufnLOmyg1vIaM+x63LkMvdyopFNhfX9e2JtT2yWaLGv37oFb5/6oiEiQ480qhuWJGl5BD1j8RyGkB4Z+Jw30efK9fQU32HR/GdVbWHpZdouatMP6giPP7HrxGEPyarzs6uJ4iDOT83j/8HhHlN53Mo0ZBpHtqgJPff0qX2pwucZ5sMuamtB3QRp/46yElHmbr+WjM3KbrZxKFKDAa9rQyL0+T2RH7mB/fERC8Duhsg73UevSXK5XJ3JvbVKEvItADUBgG1nunYiYazdvglZpKxizwK5OLlDA9Stz0ZO6r/HpxczYdFBS1U0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9761
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9994dbd2-fca1-4464-24f2-08de9ef14477
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|35042699022|82310400026|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qjzy3PUH6+yl5WPcIuhgjd2CvoUIj13KMSTrT8WaVpRjHMBoyS3Fbq15WxFjDDtZSCtIWB0elvjmK0R8zloA6z98R4zwM8YSgdttIBa3K5S2/urJEf/ZWopVjPZQOKdvl0vC377uRWndCrtofdNskNZMx3BlJmOg/UruO5qgZZeaP0Mixy8Ad9meJqiw+53G4NbiAiK/yuk2qU5PhpOrbME+zNx3SGr9maIdCXPIxKAljoAaNLNpokRSSXINbNZWabH4oFUxBubacwe9CvTWfyhUpZAQ+OwX5Yv5OqoDnNEncjAmgeY0b2POqEtl9WgyEjZ0UdegV02yviTSsSv6gG67ON6+/xS42u6sN8qOlsoU+jzlKphJxQGv5ZfJ6EbWM/irfZGQtGa/R4IJwDsxBoBouLwDgoy9FYQHa3dXQFF6NLbV6gpM4SVrQZ1eEtcbIWClCDxlGCj2gOI1Zh8UV1cd+qZxgfeW/qjZK9nr3jt8+DIMdALmePRXREXgiPjaXrRqDAhcB3yeLR197Po8xXKPoPyiNE6cDNA0JyqQYGLKZO6/qx2mZ/4pLqcY5RdVHiLfBeV6HDP/H97qohrAVksgbllaaZdDp+5p7HGRGAau90Oum6GAdDnfSnKTTQcwnvvcSOrqfDkOAuOasWZXn/E0ixa4qhGx8e+VPrSM7gXJZOHzZWJH0qNz05IM8LViRQkE0y6eu/XU/2MRIdWsIOkJsBX7Cw83jN2PShH1NO/kAmf4BN8ImWlR+d6iwga84M4ax41RFqUtrvjjjqos/A==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(35042699022)(82310400026)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rxtvl3x++PpgU3eTheYpVzr2xHBHlCBGLM5l12SGp5v4XCva9CK4cEKJqQuclMzjkU6Ct0eKKyOrafkGPNLqn2R2TYQgkHcv3K8SHnulDblMWr5W/HFjKMcXTxoEJawWVKWXRqKIS+YMJWKetm2KAszLNfQd1De8AiLukaA7x5XJW1A/bJz3rzVOxL6Yu9a8RmXTV56X4RuoYGxiJHTRpDNHMxR0hdgJDNMw7ayevmNXeCf/3MGEDVoiztJRL2tX47fqQbHO1RkC0Ae8vghEL9E5cOzXfAsSEwkakameh7z4AfnwOM/BsD6uyAgb5raamfHDURFFuTx+XooDZfznYGxCZME7P3CIXmncLLvueu0ToZgCVdQORj1k/qk/Xeeqfer+sp1ys5U3RLtKFbSK/rdFyxtdpTvQYsujRWU9OdQvwh6nuAsKMJRKnxxgq9hV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 15:28:05.6311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb032b9-1e63-4a86-1af5-08de9ef16b48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9152
X-purgate-ID: tlsNG-42698a/1776698888-7D969F3B-17539C11/0/0
X-purgate-type: clean
X-purgate-size: 936
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yann.sionneau@vates.tech,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Wei.Chen@arm.com,m:Hari.Limaye@arm.com,m:Harry.Ramsey@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.961];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 6D52E42E33A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgWWFubiwNCg0KPiBPbiAyMCBBcHIgMjAyNiwgYXQgMTY6MjMsIFlhbm4gU2lvbm5lYXUgPHlh
bm4uc2lvbm5lYXVAdmF0ZXMudGVjaD4gd3JvdGU6DQo+IA0KPiBPbiA0LzIwLzI2IDE2OjI3LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gRnJvbTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFy
bS5jb20+DQo+PiANCj4+IEltcGxlbWVudCB0aGUgZnVuY3Rpb24gYHAybV9zZXRfZW50cnlgLCB3
aGljaCBpcyByZXNwb25zaWJsZSBmb3INCj4+IGluc2VydGluZyBhIG5ldyBlbnRyeSBpbnRvIHRo
ZSBwMm0gdGFibGVzLCBmb3IgTVBVIHN5c3RlbXMuDQo+PiANCj4gSGVsbG8gTHVjYSwNCj4gDQo+
IEl0IHNlZW1zIHRoaXMgcGF0Y2ggZG9lcyBub3QgYXBwbHkgb24gbWFzdGVyIGlmIEknbSBub3Qg
bWlzdGFrZW4uDQoNClRoaXMgc2VyaWUgYXBwbGllcyBvbiB0b3Agb2YgdGhlc2UgcGF0Y2hlczoN
Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvbGlzdC8/c2Vy
aWVzPTEwODMzNzENCg0KSW4gdGhlIGNvdmVyIGxldHRlciBJIHdyb3RlOiANCg0KYGBgDQpb4oCm
XQ0KVGhlIHNlcmllIGlzIGJhc2VkIG9uIGFub3RoZXIgc2VyaWUgaW4gdGhlIG1haWxpbmcgbGlz
dDogIkZpZnRoIE1QVSBTZXJpZXMiLg0KW+KApl0NCmBgYA0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K


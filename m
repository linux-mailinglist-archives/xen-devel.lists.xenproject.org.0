Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CASEAfl0zmk6nwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 15:54:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BF38A14D
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 15:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271956.1559908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8IUV-0000qZ-F4; Thu, 02 Apr 2026 13:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271956.1559908; Thu, 02 Apr 2026 13:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8IUV-0000o7-Bn; Thu, 02 Apr 2026 13:53:47 +0000
Received: by outflank-mailman (input) for mailman id 1271956;
 Thu, 02 Apr 2026 13:53:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1w8IUT-0000o1-Og
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 13:53:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8IUT-006cnS-4X
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 15:53:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ce74df-e002-0a2a0a5209dd-0a2a4504df60-14
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 15:53:44 +0200
Received: from [40.107.130.20]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ce74e7-bb33-0a2a45040019-286b8214f44b-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 15:53:44 +0200
Received: from AS9PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:20b:46a::10)
 by DU4PR08MB11032.eurprd08.prod.outlook.com (2603:10a6:10:570::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 2 Apr
 2026 13:53:36 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:46a:cafe::61) by AS9PR04CA0031.outlook.office365.com
 (2603:10a6:20b:46a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Thu,
 2 Apr 2026 13:53:36 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 2 Apr 2026 13:53:36 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB9PR08MB11498.eurprd08.prod.outlook.com (2603:10a6:10:60e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 13:52:34 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 13:52:34 +0000
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
 b=Fznp38IiYihEhsiUIK/mTxsHj6u1fw9aBea03SEAaBGAq5KE+naLSsu1gYHu+5CAV3XQ6LaY3E8O9evc2Wbc/NCMiUZw5IZTNf8ZpsVj6lFaDJhMe9CAnhupkI6zkpREjPNkydBBWeTLitsunY0UxoY/LeoSkO0LYayGhvDS+aFLFsza8hCmATDGTtTQB2s1CttqE2/UlREiQqfUczrlX8zkuZOMrgaHwUNxCpvucJuNSyNlQIVzNFWbY3t1KENaK8L+Mf9FPhpqCXuUvmZ3fHovUWloO6dDMZZT7UvpnlLaO4RZjJHlCDjZlCjJUsywRO4sHE/ojTZVSyjh45caIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guZ76xgGdbjnIGMb4dvq5+mcx2b3gMQVs8akOL7JWVs=;
 b=TL8uyYUEiu2GClRss+G+wbh/cRuYNY2UlcyjiJQfxPgfllU0cx0PAoM+/QcPdBt6Hzt0aMZ3IOffCEnT/v+kXWVo1iXOVW2b20qDDIRjkGyIGwkUKYvRWbVM4wvpU58zQZZvmVdV1yMKuwjbQmN6toj/OFCqbC9/1OJyagxPzo56kivwcCNZ6B+gjJSMcvBUdHsiks5hTARM3i+X5azOlK7/hzWKoVlKkAwqWNElJ6TgSlEccnER6TJfH60d2fY1ulBKx93kWwyXrq4VSNy5SVakriySm7KJZnrEi8KXnFLkUinzYTPszfg+uSD/ASiTqvA7A7EvNKQeVSz+HmCRvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guZ76xgGdbjnIGMb4dvq5+mcx2b3gMQVs8akOL7JWVs=;
 b=WTqkAoELHnO6J/9NzohmvOw4braxEzm5mMM+K8wkaUKlxOPqMCHpq8ssa5KMczFPu66+1AJl3u0uylpBxZzxG+PDtUKFwA8tTE0tWfngWQNXJoJIQqQ5s3mhy+06qn+Cle0pR6yqdjM2IVk2P29Yhmgx4BcO2X10b3wRjwu31pU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKcJFd1hC0zayjPgfo8XuP5E6lfm/0cK8jie/B2cHsY2UN9d9gf80DJ0VGgmailooNxvNBCE2OTm5tZjg3ewiW9YYO1UplZCGHtGJBeFO8e6Am2xMUrQrgXBcPsaov67WbgXRzHXNiI4fao0MMLRC3XfhVGqPI22lMGYK0Uip3qsuwFgp9B6iBLAxwepYaLVuAnkmrc254UgggncpBcP3y+c91AqUx3q+a/20TU1gGdk7Wnrjj1v/lMJ5v/IZvo4ivVzTDFX65jh4JvNOEt5prsUXRYebyu61QdmMM1dOmNVA/wr3hC8d2RX3PS1DEHx1qSSQwVHzuVdO0DMLrIq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guZ76xgGdbjnIGMb4dvq5+mcx2b3gMQVs8akOL7JWVs=;
 b=NtYDFBNCPUPtjJRRLNzDfteg7mfClholAQblOml4mEt7oKM9IPpEVjNwFP5sek5KJhXl4d0P4v/M9h/OAL4R9f+AVwrvLbrQiHQ86Z7cCcB0u2jcnkBU+vQmpTCqMGp5UGCunenspZlS+Ebbrk6eCf90YmASeZM+mlrZ1I/Z78XITGb5zQ02+bOzthDjF2+OqLYTsehVcbrOq9KGEw3+bxFFRw1A+bp6G6dgFA7QRQOo8MMrKraExKSW1vFZxi3GQ/t6gERX2dSZnOkNEwTASsatX+QCJUgqigv5upqEwzDFmaq04Tymq0aDH6oym1ZoUa0YTPj0Hb7uolI15X/hXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guZ76xgGdbjnIGMb4dvq5+mcx2b3gMQVs8akOL7JWVs=;
 b=WTqkAoELHnO6J/9NzohmvOw4braxEzm5mMM+K8wkaUKlxOPqMCHpq8ssa5KMczFPu66+1AJl3u0uylpBxZzxG+PDtUKFwA8tTE0tWfngWQNXJoJIQqQ5s3mhy+06qn+Cle0pR6yqdjM2IVk2P29Yhmgx4BcO2X10b3wRjwu31pU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: vpci: Move content of xen/arch/arm/vpci.h to
 arch header
Thread-Topic: [PATCH 3/3] xen/arm: vpci: Move content of xen/arch/arm/vpci.h
 to arch header
Thread-Index: AQHcwqf1UiwmSRu720SQ2OCjFIvjkQ==
Date: Thu, 2 Apr 2026 13:52:34 +0000
Message-ID: <7BEC5356-37E4-4A53-B508-5748A2C8C935@arm.com>
References: <20260401145816.169557-1-michal.orzel@amd.com>
 <20260401145816.169557-4-michal.orzel@amd.com>
In-Reply-To: <20260401145816.169557-4-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB9PR08MB11498:EE_|AMS0EPF000001B1:EE_|DU4PR08MB11032:EE_
X-MS-Office365-Filtering-Correlation-Id: b45e3a85-bd63-4e50-2c96-08de90bf3ced
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 G7739GMp/yFHtUamiPxwUM2EXlBancaXzDrzgdwoev0S6ntCAl4nC74D/RrX1yPuCBmuGy7dFTNQxnk9vWvES9YydDlC6ki+voYjKdC/M4DmtXg61+eMKwq9P5FJ9+07ML0ny9FQANrll7vUFdVzBwv2IaY2K8ALhKnTEOjIdk5qRfoVLlAWgNpYecgTlcVPifVHulrLvvln3iex/q7vmHiT1ksJuu/YA9MW9OAcbXWKK2mlaf5aL0gFEOcoZ12zuzSS0WZs5ezfDi1w3ZSiGSTRNU4eCRt0VGgFI9sbOq++dNaLESod+/HvgHqaRq+EjD2hp5UpjZmDtQtGuowZk0QGHfr7lnr4wNIo5qjP2ceUNhQ3pbu1vpeKpECAMrVQR83Y0YQwauAXXnQUOWOIlY5kIXcMEj9i6bOYeNsScnNwwgcTNQHewuxmcxTuTI1xp7mKRLd4+x7npgc2TJuImjP9ME3buARVxBgX8hvQd8ifuxmXjXoojwBIPj95jqnjSrzw6oz3mcoO5d7O5V221gMtn56JMc3fF6M7bGyGuvT+YE+AyOHTthUr5zvb6BU17whNYih0gC765u5qyVQhTvsfEv54LWIg8QE+6bWIfxBMdxLcJ1FaScX/CNtb7BI//xodJAgRI76o6o53Cq/zsG8L6eO1pgcvf24WMEERjGCs5p5TM0Bg0gado0RX9+2OepZOZmiZo/8fbvg+n126tWBWjdDn3I7eMH/Z3XWUd9Bh15oqkzPdhlniuHJIQhLrK6XjbpFqFlWofiLxy5Fx+HpYGXhRb72B2mA1ZZPApJ8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB8076081A664D41A9D8DF0BFB4B57E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 oD8i+k1nOtemhGivJE28JuPNQHiggTE4A/ywTdlZi2nldBVvZA2XRVKJcXEO3bXfc2cLEvxRW+x0DS5BALe27Gv4b20f6rvXEd+qE0WjgCKWqyuK5pcc92Jm30HyZoH3LazcRUNk0drAPlnQ+xVjrklrWOpI2e+pIQT52J+GI0ypchfTPxdoeBiUAxionFNphlTkUQSYljYxTapCfiSiZUJkG3abPppM44o8a9x29iJpvCoCZuKmWIlgaWTrZITuSTYqF0l9S5Qm74MyQKkASVFW6loWzj5xIzoHq3mhgFUEdJfFeo7/qqhYSYNxSZbmNoNWTL/F9OkYKsYLjkfqZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11498
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fe2e974-dcd5-40e9-8d0f-08de90bf17a1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|14060799003|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iJ3tu9qLpS9oCp91ag6qk2Pxmk2TbrFXCNHtsfydbZiXhmqo6AC58u+/lerEdN7v6nhj+czDnLa+UBELhGHBb+xEcxK2mcen/Y9NoIEgxEIPzyHwOec5tVI04d+gcpNV2nly74LvxABoAVwDQZnfTxML7QH/Z2k8sABBSNqQ6up6j8VU5aZRJmjcIpX7b4h8y5oTIgWuInIyo0UIy3hYg6AfEhvyZD03Jf/TuDc+pzhkBBRCXYy1z5F9JVbz2vz//nRz/J+553Jr/7dgBWQFqLyfs03Yh8gMZPRQRCZR0c1t8w6vMnO2UylDISL5DZnp978VbUsdw6FQeXXZxrKpIOZKJv6qszMHnF5QFp5LaTHXbyFh2vUh41TdT/vFJyp7QMnoKOUo6UUczKo2E6j6wXHpysSFxWW/HvY6GdrVkMoaP6zyT/92PMBP7KDHfy4EJ22B1rrk3MqBZNyJ4/65WpTR8vTQWaU/KVnKhtrMmxUhN3h5N4Ej4NH6pW8IDLhCXybpaCAD6/6r8+DaKhXRlJufFOLUkMxyZaoHwf/20tFeDpNaBAcTIsMnJvWORMhPUttX4Gj3FEKhjFa27PZ4ESzZWW0+IJZ25aNB6JnCpK+ed0YF62vcFsUCnIrUxmfymbLGqPfQMY3bZKgrTVqs8vqTy0keMkFjloDYWewU6vFDKY1JFTYhXnsUvbFof3fPBFnsE1gRJWRuKtAhtrwjLDmzZYNPR0XKlF920pgcjVsn/p/IX1CBVAoNwXfAEF1BWaUXXBZSCqGty+I41WNX8g==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(14060799003)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wba5a/vvS1QNApwuIN/loge0EOLtB7/tnQVkCAA5/xZjVenSbXCTDc8iozef3wIi04U/V9VeX4J1WcZR0vZziTocXKMQg0lgTUKSUSVFg8tMQX43dcqXcpc4VlorkBvORmVt2yuoSTdxFZbmiK83WOL/Y/xugPdoVYP3GCS7kCDEiV/WTxcxh0HNZ8jMch5begmE2H1k2K+/Si2hW1AIfJakmG8Ul+EELotcPolsfahk599qPg9PbX516zKy0A1QZ/ZzFFcZlMwLUtxkZj0+mwFQb9NCROz4Roqr3WWwuMiJpBeu0I8ldCNIYQU3CPPWw73+kk7qR0xv7RerTtVOQh8Jkjm+woLcm+7SwlkotghYmboBhTpmhABu5oQbfmR0d1O2emD3CYZDpbOMcfeER2yJ/8uQqfsb5/RWA/7UNPbJf0VsNVIAV5U1kXIVIKtI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:53:36.7605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b45e3a85-bd63-4e50-2c96-08de90bf3ced
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11032
X-purgate-ID: tlsNG-ebf023/1775138024-31D2751B-FE03D212/0/0
X-purgate-type: clean
X-purgate-size: 1722
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:email,arm.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 471BF38A14D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWljaGFsLA0KDQo+IE9uIDEgQXByIDIwMjYsIGF0IDE1OjU4LCBNaWNoYWwgT3J6ZWwgPG1p
Y2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IE1vdmUgZG9tYWluX3ZwY2lfaW5pdCgp
IGFuZCBkb21haW5fdnBjaV9nZXRfbnVtX21taW9faGFuZGxlcnMoKQ0KPiBkZWNsYXJhdGlvbnMg
ZnJvbSB0aGUgcHJpdmF0ZSB4ZW4vYXJjaC9hcm0vdnBjaS5oIGludG8gdGhlIHB1YmxpYw0KPiB4
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vdnBjaS5oLCBhbmQgcmVtb3ZlIHRoZSBub3cgcmVkdW5k
YW50DQo+IHByaXZhdGUgaGVhZGVyLg0KPiANCj4gVXBkYXRlIGRvbWFpbi5jIHRvIGluY2x1ZGUg
PGFzbS92cGNpLmg+IGluc3RlYWQgb2YgdGhlIHJlbW92ZWQgcHJpdmF0ZQ0KPiBoZWFkZXIuDQo+
IA0KPiBUaGlzIGVuc3VyZXMgdGhlIGRlY2xhcmF0aW9ucyBhcmUgdmlzaWJsZSB3aGVyZSB0aGUg
ZnVuY3Rpb25zIGFyZQ0KPiBkZWZpbmVkLCByZXNvbHZpbmcgYSBNSVNSQSBDIFJ1bGUgOC40IHZp
b2xhdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVs
QGFtZC5jb20+DQo+IC0tLQ0KPiBJJ20gbW92aW5nIGEgZmlsZSB3aXRoIEdQTDIrIGxpY2Vuc2Ug
dG8gYSBmaWxlIHdpdGggR1BMMi1vbmx5LiBJIGNvbnNpZGVyIHRoaXMNCj4gb2sgaW4gdGhpcyBj
YXNlIGJlY2FzZSB0aGUgY29weXJpZ2h0IG9uIGEgZmlsZSB3aXRoIGp1c3QgcHJvdG90eXBlcyBk
b2VzIG5vdA0KPiBtYWtlIGFueSBzZW5zZSBhbmQgYSBsaWNlbnNlIHRleHQgd2FzIG1vc3QgbGlr
ZWx5IGJsaW5kbHkgY29weS1wYXN0ZWQgbGlrZSBmb3INCj4gbW9zdCBvZiB0aGUgZmlsZXMgaW4g
dGhhdCBlcmEuDQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICAgIHwgIDIg
Ky0NCj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3ZwY2kuaCB8IDE4ICsrKysrKysrKysrKysr
DQo+IHhlbi9hcmNoL2FybS92cGNpLmggICAgICAgICAgICAgfCA0MiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA0
MyBkZWxldGlvbnMoLSkNCj4gZGVsZXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS92cGNpLmgN
Cg0KSeKAmW0gb2sgZm9yIHRoZSBtb3ZlLCB5b3UgbmVlZCB0byBjaGFzZSBFUEFNIGFwcHJvdmFs
DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoN
Cg0K


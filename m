Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL9mAgJ472mZBgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 16:51:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B626474B4E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 16:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294993.1571696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNIp-0006SB-Br; Mon, 27 Apr 2026 14:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294993.1571696; Mon, 27 Apr 2026 14:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHNIp-0006PU-8n; Mon, 27 Apr 2026 14:51:15 +0000
Received: by outflank-mailman (input) for mailman id 1294993;
 Mon, 27 Apr 2026 14:51:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wHNIo-0006PO-7x
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 14:51:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHNIn-0090wQ-6G
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 16:51:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ef77d9-5cb7-0a2a0a5109dd-0a2a4505e23c-24
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 16:51:12 +0200
Received: from [40.107.159.31]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ef77e0-aaa8-0a2a45050019-286b9f1f66b3-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 16:51:12 +0200
Received: from AS4P189CA0062.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::9)
 by AS8PR08MB8802.eurprd08.prod.outlook.com (2603:10a6:20b:5bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 14:51:07 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::38) by AS4P189CA0062.outlook.office365.com
 (2603:10a6:20b:659::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 14:51:06 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 14:51:06 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM0PR08MB5521.eurprd08.prod.outlook.com (2603:10a6:208:18a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 14:50:03 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 14:50:03 +0000
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
 b=nuXJkp2BQRN1uV9VZnZWaBeZtnwuT15LJyDp+khBk8h3dcZSbh/amXMc+8F4noebaYMU9AOq2E4rraUBwdC0pS9g+2s7qhGUppVZbjFveeA8NrFRIS9Epa1Ej8RcjEE1U8VwKm1PKbQh8bkDCV9O4OyxdWtGUWch39MVCHjD71/CMxRBie6jOpd7nJ70MLnjPFGYbHozWnSX63LhWvJEyZNchcJxbiby8ed4uYPrhxlpiSqGW9XNLskzi+uP5HDdZs2W7TfYwQcwGmM35HA0dDEDwPsgwuU6GcUUIG+6R69R71GRuJX21DV51AzSpFZXhU6sS147fzJvN7/vtMvAkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Id1XX/7OPoW70pEXSKEcjuXma5hQPyIU4q01hyPib7A=;
 b=Fe/YBAYly0hfJwvuhzDJPldSgPPlalaTWCC5q5h7nhyIAIUpgap8SpSErzjFlpw8WGjgLvhEYMG5B2aOeXVN1dUYpueY2GAKG39aGTonR24hfpYkRoy0jAYFttA5mgeqAlj6QoRMVfk8TSKZksCdRE2fdqmgJHzyZ3W/XjMWPq1cur3VT76OPt5Btiv3orSlWsFgemloNVYukSoUb3RMHTjrZAjPM0EEZaOXSmzX6sZa3X+WXc5ohBTkDzpdck+IYDpmNtqsPRBHeaR0AI3G2w1GHphwePq31k0pc5Mf1TrqqtdaKHbd6dT1Yl3w6itBKq8ctRWXhXtoMS7EpguIJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id1XX/7OPoW70pEXSKEcjuXma5hQPyIU4q01hyPib7A=;
 b=BOtjwP0cU7Wqu9q0JpGVqr7808JxRq2fj56RCFgL6nlSBq9qKzNMwNxtX/l5pKMuQK9Dblq4DYkcgHVcEJiSmTm2V+q2d0zsXjRDMEb1LrBluFdJaRNXVBtcV/0TMTuUbmQtrhvqHLK6TLPpS0RZ0Aojrga0/AWh1JmhaTbPdBQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROW3C6f/JCzNYIrFvJOlGh1aCtFM2IDR7Oc7vSHzOFU1Y9E6kR9fp9iMbEsd43OuOZ5j1V0id86Kz7a2VB97hA1beCvuFEJv5QqhakY1RwlJcjpbPteMSQGyISTrtik3WTe02vrIpNs0gb93FlREnKMSuua8z0FPHG4gIk88YIoMmlMeSIuVSjgsg4svgFU3TM174o25D+xfX0I9le03kPvNCr005JvlvG6hps8hhtFiKLG8q3SK9rFeqljyhh1VaqW1H1DTfXJlwKY09rubSgclcN+JQPumX3dnHpHvqZ5GKGJ0seWiKgODKlYA3quRZm1GXhZlq1+mCe+jK8r7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Id1XX/7OPoW70pEXSKEcjuXma5hQPyIU4q01hyPib7A=;
 b=B607JLDunv2du3vaIakznLbLgd9jkpZfBhA803MpReBb+sBqVQsny+LH2qUCmgZ9sbKo2RZlzRLO1MxMBXTccFfv53cuDY6hryft20mX3FGNsLDEo377m5c0vaWSNBWDFsnHsMqRaMwa/EX6LG7a/7tDAulVqkPwbkFhdxO3vuON6duUsTMqBuk5P5TA6oA+H2cTkrelRqi8CwlaBW9UcGQcpVjxE93CeA4nnzJRvCs8iJXD8CXdvEe/67NFN5CMpGOf7cZYDbowOctHkAFI4UZlzG84SPj+JCl020RHclHTxX58Hewgj3ryWJ+BtwdfvR4Ht+DTN0gSp/Q06rh8fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id1XX/7OPoW70pEXSKEcjuXma5hQPyIU4q01hyPib7A=;
 b=BOtjwP0cU7Wqu9q0JpGVqr7808JxRq2fj56RCFgL6nlSBq9qKzNMwNxtX/l5pKMuQK9Dblq4DYkcgHVcEJiSmTm2V+q2d0zsXjRDMEb1LrBluFdJaRNXVBtcV/0TMTuUbmQtrhvqHLK6TLPpS0RZ0Aojrga0/AWh1JmhaTbPdBQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
Thread-Topic: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
Thread-Index: AQHc1lUhIk7A8CPopkGFdHGIM/WlPw==
Date: Mon, 27 Apr 2026 14:50:03 +0000
Message-ID: <ECDA0BD5-C2C8-4726-9377-AE4AFBE972AD@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <02b55a02f329d09c9f8b15d97ca9176b3c33017a.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <02b55a02f329d09c9f8b15d97ca9176b3c33017a.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM0PR08MB5521:EE_|AMS0EPF000001B5:EE_|AS8PR08MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 91bda931-9214-4788-2eba-08dea46c6990
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 W/Ho2isQ67V3Jck7hGMEzd+iJDIDgbobYxCLDV/PHjh4J0uvzrsCNKN6zMYsNYfDlogcAdW14ZEE6MfckVJhTYFOGRX3L8SUyoLLPie7jsRZ5WD50wAxPd0msw8ckfcnN/iPoOBafUBR4uXseqBPE7FLGzw/rW2oR+hZuiA//JG6cXOVpWbi3TAQFD658EG+ltq8IxNkz29b1YuEh5VwNb9wPiklkoB3ynBufsOgNGrL3WzEVJOmNinIvtIY3I+CuevAihCq2bC4LpSpi4zg0kxrk1klUIMUHPznLrXhpzaIKGQjU7H1fTzY9BRbkHdlbs5W79V6oTleczQEJ789BCaaR1ZjKFyw8wG0+isGrqCXQEwJrarljnm68yZ7amiU7n2AyP3jdNInw4atYQryHC13CllPE0QqEXDFGjsw7n3crpSDBorUAzzfDncy/cPArgQGl7tsgCER1DiTH+6apeg9O+FMRZwf6WjL8EdiZv6a/InNaAPSFYJrSF0B3jA5XrGeoo/ymv7eWKVDzZOJZ8zD+lhgEW1suHivsbnmLoyeScW41nxWARZIXq1JI1dw4+gjRqTrqQVOk8iHoHIMWjJLwSOpbR+Cdy8PNQXBZETwRLrrsXBg8DOuCSFIzFhZLSfQGHjsl8AcGbJoKRLqiERQU0St57LH4z05Z3DT1cFl7TkmblVbd0q+5SnQmYi5V8DG/KSrn3si8iTqQ3f3+ule76stDxG6R56bjvKv9/5+3MpVcrjOy4S5Pt0HkO+CslcTXg5PNCpo031Lo3kZopJrHSEtcEjabC280/79qWI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0A63FE7F65CEA4B872554045157FCF2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 BiSDVaGUQn2wvaSWS/K/N6Khxe6hogWUhTSkkTSRhnvB1EHGfvVGCSpIVKAijgl/Cl7pLge5bU3gFq57ZpMnycVuq8iScu0Ls+kt+jIcEsw0XKBMnLIpk5Z/4JOZyhqHD0HZVAI/OrMV6plaenenN0cgX4rJu5Zbtg8Uag2fjVgBPoQ5GaPLSaa7PLPoUq/eqB2iih7XMeKIoU8RrlDoW27vxquBlqedrjCXL/2xMcZm5FZdJS3RxPKfMg6FVpCPVj31+OTytXxQtEcOMrCSqUnUjjLrC5/J2ae+8fJH7oDMSuS6wPD1Bm/8qPKQXzQxDcDKfe9IBdPaF7Nk5+HTug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5521
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef72c2cf-8617-493b-162a-08dea46c43f7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|35042699022|376014|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aWy0vRJI/FfddGoi7TU+M7xFqkbzVgJF7Curs51zVTqO81OFuZjy1QozRRYaB9jzOw+OXsntc5+0oNxSwmA6jPP+k2Pxqs1+Qyf5uD7KoSymRQci0GpNhfnSNOr8k7bJG0B/UbbDA9tp0Vsvt7Wgzkd3Vring6qVNSykTD1oqDjQxrdA3erE5g3SvQwtzOTuPj9aMSo113KEVBFH9FvnCHcBC5EvApQ0szPd4bfS/EeqQ8UtvOOwJ+r7wwUv73/eGytcKUb5n+z7cWybuRvwTjCIJcv0z3i0QxoqwDcKv5c08PWjPhoTSYcBgKBhFlF81GXX3ZoBK3weJckdPoV6WrOpUIwlHLFmjNcfKI7RI3rEoIem/xVNOcg8uRg1YbzJ4GxRGSWwWwKC5TvgQQf8XwzuXOFryYUpzo77MqC5yF64yXlrv+z0WuYwW39jzyZFiRsUyekBUpJ3bP/PPlq9T3jYMlRUxGrOMnFbQSzjRHUnJKK/2eVZGmBI7wpmBDgPEoBxMul1YvUojCRHQLdsmfsPHOAfjUEIHIlxvZl0596DlS6zbRQit4K7FzXJvxXps7d50ZkFPV167mCrLi/Av416kfEb+0tcNW5AJE97VGno9PKdtMskwtFsq4MVJm3nRBe04Nn6nOh/NwhCTzoOz9zEg9F3draiWqkJ0PrpIh2NgmF6PV16xrkpVl74+CuHXFWYC4J2jYhBduz2Wgs1OK1YqIutvB+lqGmHV6ZWVb1CyBZ+HknEzZccM+zyMF+FotXNkieK1byZg/Idhl6KrQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(35042699022)(376014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZOY8u76KkCGWgaBns/mF+qoq7rTLmIwPUnRZ5hQhJtRkjkmmsHsxF09Y6IsKtngc5k46SHaecS9yz59CjZngbKV0XofwJJm0hqZRa3fQeRZgcvhHuEFAuS4dHYPjgsBiGsmNHFAOzzGumZt83Mkoh8dh5zpUfNOr0BG+jQBpsQbII35LgwNyhDQ3SCA28S8KpaFe3mPd4OdWt1oG/zwfdJebCiQRaMdJzJ2Bgb/slVDcqknAdg+QMIOjNh+S+At9b4rUQ7MPnsNQUdJoeJ1QqSbYBRN+azOy+IzDEn2DUu5nDwEXLEgKastUK0k7zuyETZoqpRLeeHq8l6WQ/E1PuMU7c7896e1K3nagGexPxPQSog7CWILJVxgFYNvjm1I3s8g4nQvoAbdlCafCCUG3ICOKV4yalNURmyMe77+YHUCZ2lfsySgFQIb7fxaWrYQo
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 14:51:06.6733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bda931-9214-4788-2eba-08dea46c6990
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8802
X-purgate-ID: tlsNG-c201ff/1777301472-E3961443-665E5965/0/0
X-purgate-type: clean
X-purgate-size: 3212
X-Rspamd-Queue-Id: 3B626474B4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]

SGkgTXlrb2xhLA0KDQo+IE9uIDIgQXByIDIwMjYsIGF0IDExOjQ1LCBNeWtvbGEgS3ZhY2ggPHhh
a2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gRnJvbTogTWlyZWxhIFNpbW9ub3Zp
YyA8bWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPg0KPiANCj4gVGhlIE1NVSBtdXN0IGJlIGVu
YWJsZWQgZHVyaW5nIHRoZSByZXN1bWUgcGF0aCBiZWZvcmUgcmVzdG9yaW5nIGNvbnRleHQsDQo+
IGFzIHZpcnR1YWwgYWRkcmVzc2VzIGFyZSB1c2VkIHRvIGFjY2VzcyB0aGUgc2F2ZWQgY29udGV4
dCBkYXRhLg0KPiANCj4gVGhpcyBwYXRjaCBhZGRzIE1NVSBzZXR1cCBkdXJpbmcgcmVzdW1lIGJ5
IHJldXNpbmcgdGhlIGV4aXN0aW5nDQo+IGVuYWJsZV9zZWNvbmRhcnlfY3B1X21tIGZ1bmN0aW9u
LCB3aGljaCBlbmFibGVzIGRhdGEgY2FjaGUgYW5kIHRoZSBNTVUuDQoNCkkgZG9u4oCZdCB1bmRl
cnN0YW5kIHdoZXJlIHRoaXMgbGFzdCBwYXJ0IGhhcHBlbiBpbiB0aGlzIGNvbW1pdDoNCg0KPiBC
ZWZvcmUgdGhlIE1NVSBpcyBlbmFibGVkLCB0aGUgY29udGVudCBvZiBUVEJSMF9FTDIgaXMgY2hh
bmdlZCB0byBwb2ludA0KPiB0byBpbml0X3R0YnIgKHBhZ2UgdGFibGVzIHVzZWQgYXQgcnVudGlt
ZSkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaXJlbGEgU2ltb25vdmljIDxtaXJlbGEuc2ltb25v
dmljQGFnZ2lvcy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNhZWVkIE5vd3NoYWRpIDxzYWVlZC5u
b3dzaGFkaUB4aWxpbnguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNeWt5dGEgUG90dXJhaSA8bXlr
eXRhX3BvdHVyYWlAZXBhbS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE15a29sYSBLdmFjaCA8bXlr
b2xhX2t2YWNoQGVwYW0uY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2NzoNCj4gLSBubyBmdW5j
dGlvbmFsIGNoYW5nZXMsIGp1c3QgbW92ZWQgY29tbWl0DQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrDQo+IDEgZmlsZSBjaGFu
Z2VkLCAyNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Fy
bTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMNCj4gaW5kZXggNzJjN2IyNDQ5
OC4uNTk2ZTk2MDE1MiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0K
PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+IEBAIC01NjEsNiArNTYxLDMwIEBA
IEVORChlZmlfeGVuX3N0YXJ0KQ0KPiANCj4gI2VuZGlmIC8qIENPTkZJR19BUk1fRUZJICovDQo+
IA0KPiArI2lmZGVmIENPTkZJR19TWVNURU1fU1VTUEVORA0KPiArDQo+ICtGVU5DKGh5cF9yZXN1
bWUpDQoNCkkgdGhpbmsgd2Ugc2hvdWxkIG1hc2sgYWxsIGV4Y2VwdGlvbnMgaGVyZToNCm1zciBE
QUlGU2V0LCAweGYNCg0KdW50aWwgd2UgcmVzdW1lIGNvcnJlY3RseSB0aGUgc3RhdHVzIChWQkFS
X0VMMiwgZXRjKS4NCg0KPiArICAgICAgICAvKiBJbml0aWFsaXplIHRoZSBVQVJUIGlmIGVhcmx5
cHJpbnRrIGhhcyBiZWVuIGVuYWJsZWQuICovDQo+ICsjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5U
Sw0KPiArICAgICAgICBibCAgICBpbml0X3VhcnQNCj4gKyNlbmRpZg0KPiArICAgICAgICBQUklO
VF9JRCgiLSBYZW4gcmVzdW1pbmcgLVxyXG4iKQ0KPiArDQo+ICsgICAgICAgIGJsICAgIGNoZWNr
X2NwdV9tb2RlDQo+ICsgICAgICAgIGJsICAgIGNwdV9pbml0DQo+ICsNCj4gKyAgICAgICAgbGRy
ICAgeDAsID1zdGFydA0KPiArICAgICAgICBhZHIgICB4MjAsIHN0YXJ0ICAgICAgICAgICAgIC8q
IHgyMCA6PSBwYWRkciAoc3RhcnQpICovDQo+ICsgICAgICAgIHN1YiAgIHgyMCwgeDIwLCB4MCAg
ICAgICAgICAgLyogeDIwIDo9IHBoeXMtb2Zmc2V0ICovDQo+ICsgICAgICAgIGxkciAgIGxyLCA9
bW11X3Jlc3VtZWQNCj4gKyAgICAgICAgYiAgICAgZW5hYmxlX3NlY29uZGFyeV9jcHVfbW0NCj4g
Kw0KPiArbW11X3Jlc3VtZWQ6DQo+ICsgICAgICAgIGIgLg0KPiArRU5EKGh5cF9yZXN1bWUpDQo+
ICsNCj4gKyNlbmRpZiAvKiBDT05GSUdfU1lTVEVNX1NVU1BFTkQgKi8NCj4gKw0KPiAvKg0KPiAg
KiBMb2NhbCB2YXJpYWJsZXM6DQo+ICAqIG1vZGU6IEFTTQ0KPiANCg0KVGhpcyBpcyBtb3JlIGEg
dHJhbXBvbGluZSBmb3IgdGhlIGNvcmUgcmVzdW1pbmcsIG5vdCBzdXJlIGlmIGl0IGNvdWxkIGJl
IGJldHRlciB0byBzcXVhc2ggdGhpcw0KaW50byB0aGUgZm9sbG93aW5nIHBhdGNoLCB0aGUgbWFp
bnRhaW5lciBjb3VsZCBwcm92aWRlIHRoZWlyIHByZWZlcmVuY2UuDQoNCkNoZWVycywNCkx1Y2EN
Cg0KDQoNCg==


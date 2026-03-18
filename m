Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGYaCeheumnFUgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 09:14:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6112B7A6C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 09:14:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256371.1551049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2m2f-0004vo-O1; Wed, 18 Mar 2026 08:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256371.1551049; Wed, 18 Mar 2026 08:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2m2f-0004sr-Km; Wed, 18 Mar 2026 08:14:13 +0000
Received: by outflank-mailman (input) for mailman id 1256371;
 Wed, 18 Mar 2026 08:14:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cC/N=BS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1w2m2d-0004sl-Fe
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 08:14:11 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e6116d4-22a2-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Mar 2026 09:14:05 +0100 (CET)
Received: from AS9PR06CA0567.eurprd06.prod.outlook.com (2603:10a6:20b:485::35)
 by DB9PR08MB7607.eurprd08.prod.outlook.com (2603:10a6:10:30a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Wed, 18 Mar
 2026 08:13:58 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:20b:485:cafe::e5) by AS9PR06CA0567.outlook.office365.com
 (2603:10a6:20b:485::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 08:13:36 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Wed, 18 Mar 2026 08:13:56 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB7742.eurprd08.prod.outlook.com (2603:10a6:20b:50a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Wed, 18 Mar
 2026 08:12:51 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:12:51 +0000
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
X-Inumbo-ID: 6e6116d4-22a2-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uiT2R5ZIi1O5Dc816utQ3d6aKj+P/1bPnJGn7eLQai07UIn7Oix0+LjuslDbdKKTIryjl3pxLrOdQVIK/WUb5PrWQr+t9ctVcdaV+ueL2whgON/tN0jB7p63NeA1mUwUbSjnU1q/4XD+gPBwhko7PNcWuUSWMp5d6FExgRUwjqJB+YcEVtriNXTEHfy9aRorkgDs/6Gi0ObOSf5ZCoVMrNFYDDbqhkiuvuiR6BiBb7p9FUoKsJVp8ww5mD4ZS8vQukb1oAyjkDWne0xv6fT9fTOutejC7XKEq/CmSV6lK0jolvDtyeOGYcc0kx0wVWANhB7AnHllmeoncrHgqKH3jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8ca9/rqyVn1q82sLTToHf+MDI+kOURQrnhg38Kx8R8=;
 b=O3ppodTt1BjvIGbG7W4cXFcTA0u+yj/tNjeLMo9KufYGEYTRtmeI+FQOzvVHUsM/4JKbr/HjSwyHxaB0UZkoOHAmu7y5FO2Gd9iXNs4XJsKmDRDl4pX3udVpJGbNpRJu0pI9X1naZP5JKhEgr219XGA8YA7k6ZPJGiUR64OKLvp2UL+z5Dz6y7HD/esUScLyMaQjmcy/6v9uMNAfLlY2MpTCsPRpSLwimhw8lOlmdLnO0I6rUgi+GJ8le0RGikKxhiomOw0k5pnqJyZyLGzP1h7sIJtdzNXM2+IKOciYnu1aNuBwtYu+UJ/bxlGtwYk5ElOCVaCqCy+1J1m5kFQJLg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8ca9/rqyVn1q82sLTToHf+MDI+kOURQrnhg38Kx8R8=;
 b=YXSVfmX4Dpti2eir8h/SU+y9VQwwPIPdQfYFO6bT2+6ZXM4Yz3X2+oe3oNWzH7DWeAKm2bdxtngSkX+B+UvgmeYZM4Ye2VkVKqFwbaBYr2H3YkWbMij/XjPu6PM2J20sP1WV14mzAjJEgfT4QWs2rH4UzDfKb09d0Nlq8nafnUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5LBaGhSjtLjJzVpL/GeITO4m8rnHg5vAotR2mh2amg+KqfJnYkvzlDPlwyLf24uEEddM/FgkesS4lSBPV/JwLgP45zat7zYRcjeegItgKDEHhxKpWwlOesUmEwvKLmALjdauVg/Yye5xOMz/tu3FZAtg7cpVHlQXHbCT9tLQc1b8yGBBJnfq7YynedMq3hgCkhKxUoytw6g4veIw842zHtYFQQnIc4pkqMhfIQIOVkNyIzp0fv6TNyGJ1GQR65avT/AJrT3qxERRzzidwW6wL6xUIiuXiKqEKKKAKGTpDHkY9wQyF9Dg6mRzUoYQM1nBY4ow6F2QkYb0gHmYobPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8ca9/rqyVn1q82sLTToHf+MDI+kOURQrnhg38Kx8R8=;
 b=nqw4tbqsFv6BwxWS7IB+P7RakeAHj3USwlVi8aITB5v9px/o+foL192fL1VgS3SFmJn21Nz+a9NIXhFuuwLNonV/IGoRx2WIUR6Do0ryEXBoY+0XrLtJRHpMAhTv7opBz5uZ2PXJ8JcYnUNHrIHddfuo96AAsqtrPPNEwshVos6XE+wqt18NuxJtNe2jtBItYiyOYhtJ7kvuA64fwSEuOsfElfTlIZYWUkhwJ/y/qru1e7ctOs+8Ow4uVbscQjaAUnSOtAu5EyXQgyBcUNrb/+kXpySc2QrPSukZVZuKfSfhkfpI/gtsZco+xXHkn2D/M3RY8vFAHCx0aQbqKAF8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8ca9/rqyVn1q82sLTToHf+MDI+kOURQrnhg38Kx8R8=;
 b=YXSVfmX4Dpti2eir8h/SU+y9VQwwPIPdQfYFO6bT2+6ZXM4Yz3X2+oe3oNWzH7DWeAKm2bdxtngSkX+B+UvgmeYZM4Ye2VkVKqFwbaBYr2H3YkWbMij/XjPu6PM2J20sP1WV14mzAjJEgfT4QWs2rH4UzDfKb09d0Nlq8nafnUY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Topic: [PATCH v6 2/5] arm/irq: Migrate IRQs during CPU up/down
 operations
Thread-Index: AQHcsgQkvTQo5LmM30WarGXZRjK5SbWz+fKA
Date: Wed, 18 Mar 2026 08:12:51 +0000
Message-ID: <E21F47AB-6848-442F-876D-34AE6AE06662@arm.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
 <4e35d2a56d9ab1497dd1a706b80695a38ee90f60.1773307749.git.mykyta_poturai@epam.com>
In-Reply-To:
 <4e35d2a56d9ab1497dd1a706b80695a38ee90f60.1773307749.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB7742:EE_|AMS0EPF000001B3:EE_|DB9PR08MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: 555f05a7-663f-480d-4b92-08de84c64d6e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 Bltc6LD3jnBi6wUdZeXpiSkwZmdrhvpLVqc4sfHUAlCqXl60Rx4bXyrUIFhUQ1g5fvx4kEnJsu6SZkIlYCzES4EXql0CYhmu/cZphHfun5xODltl1SDiWEXe/A5I5B/nwp0HSHe8okPyy5Bk2ZS6u0ru2uYc74FJ8jExFYC9nbLhtTkVdZDt4S250rPvnzwyJVEr07FG9uTFQZ9OUh2Zg02vkElKjHZqj+NtSXVH/VYlJb3jndGZemF82GylX+6VK25VNu3LPJQH1LYataH5eoRLzZSq/jwwUUk5dxQy58DIBAPa2gjzdtd//nwPvWrVifzSktT2SOA5B7+TF3PnILvrRxlBpsM0AzjtpS3zKiQzURoe3BZMaWTV8/yY+QXUPD5kKlslruK2rIbnxYsnU8OXF+8JYe0lcsPDs6kXdcGmw6oF1rJeXb2RMcLehflqjWYHLoQm93JbdL5ZY7jIJq5fcY6O/tM3V+4X+3pr7kvzhIacZFeVLUbOX4d0o8cz3TR7ttlaUHDUd0QlaeaVRmZ7jX8K7ZRAmlyCKnGg4V3axPQi/w+mUWqhhDebEJyDLQUowguCjW5h38xeDO1RlU3xZyeQHnCC+y8lRbmm76fWe17M9vnaeqYPfb3prTKQLLMYSbk04+vHnhlxMfu0kVBQSd5LCrLMTjiVRgUCY3HkA0MPBjNU1TFSY9xHx46kCAnnfRFaIFzvSTiVpG6bNCBAihrbY7sZeByu0Sl1tzp1/0toXgMCz4j83yM2nJ13XI1tf35XdfDcZqE3zB/kcGlyeTirNA0P1sKQOutFyjU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7CCEAFCFE0A0C8478B1A6F93C9F537C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 u8D+BJud1qvNRu0o/MWcdVIrxPI3MJfeE3i2Ob4E2OGN7gV3j9nb8MO7c9OIJCMLUUiTO6cHyDioPSJCYAI5JHngeuhb9xiBczFcd4g1X2/zwdLgsyL0i1/iWEltgb4dSNxr9P/pahIBbHdUNjgP0gMlgfzZAFU2m4sOlwO6CWfA8eELPV/Vm0bSvMovShYZ1AS7rtfg0kS3WNu5WeVsIwIEHKf7x9qkRXIS+6NX2s3xhdJp64yrZo6hNtjkxnyEvoFvFEcDn70AXQE4ZQi+7RBYqHG8uZMgCIJ/IOn/IHv78dbpwrJxseUAl4jCPM6GdF90W2PCRB51wsCbZJ/q6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7742
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	996de40b-9b0c-4936-ce6d-08de84c62653
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|14060799003|82310400026|35042699022|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/jupCfgwwrsU2AlqhMScfAtQpDho7oVPtaAhdR3ia7i1T7/2Le9AWRTgEts68DTG4NyUQOshpJ4avsC8zzCSeLwK25aoi661DqbuyaqqQkSCcE+qRBJjIlpwNo3btBhPP4y+PLMThGo/bHlgWJplMmg2TF0i3zW387usGvWhFLtbQeYO93fAne74NR+wOcnLRItXabUHrT4cIbYcDvgcdKaK5p7uKeb7YPyFefqG686wevGEyK9RVUW2ktdIsSVfNDU17dSINx563v9Py8+dbUMXsscDBMla/iseBAiSZnx/ajub33PDcE09SWogPDmbGzWb1O9990GYIhomjabtBgFSJkdQJAIdAi0soZUGIdtW7X3bT3btX1LL2JGyNWUV/Y+iNXxvxGL0OE+Hxa+/IYILgtSVIg/L3dGq9X0IrTBA3K35If0qI81Akq6ytSEZrdwb0jqY1vnpPEcUPKE62TVJ+Jv4eGRQQQIVxgTNgj7FKG3sXOpfTjA64usBW7/VVhZ+KBH+U1JeNv5qErJJvOvtQgIS59AHvUV++6c4NqV4ZbrxWu+CXOBLIV6ZQhS9npwLdb9J1JKx9zfDjLmRgOApwoUfOHCcsXtCY2b2TRmFRBOjAIXuD6ZzlTSaIEv8nHIARKjePs1h5qethEqgOymRi5r7H61GYqXfQeMowAjwwrx65ru+66Hc3D0IvApWO41se1yK8mBq5s2rjfK57BOkBPTtTmsFH1DyqgWQOUPiAG4Ozf6G9R647bdaK67jhyHGlZEsSZoe4HdsNqI+Yg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(14060799003)(82310400026)(35042699022)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3PSY8DO/YXAO3WyvyrLYaotHrCxecZuuOUo0uPPtHMb20QrrC7z72PgxSqUunH3GmWqRVA5EtoZ3i3JLEltIGBsbx2VEe8mchy2Laj4I+wS6WYoHQaZHIqm9XjTVoLjnuJE5Ne19UiN/EBl5j57K7+TzhPgxbN6LUfUBPo1sgEsWy3hrlEVkEHut4NoBEPeoTnrmJEFv5CQ69SrpVNTmMra0x6SgS95biMzGunlF2v+GR4bm/kNnmCcsWk1mvd4UNW2K6gZIi4+2tkKbkA1KypHMRMgXH9FqmbkbvAd2q6TaPuyOfHCX087/bH/gUX3Tw6LGTkX9GGHvWMNKIil4jPJm38bTc3hDcS5tMQ2KDeJlO+7pB4ENK51PXzmXOLI5q23DA0/6KhJZT+pDadE5xbCzLzGzC3UCy6a8pZnBt224dwINcbmU6q6bKKFApd+z
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:13:56.9514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 555f05a7-663f-480d-4b92-08de84c64d6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7607
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 6D6112B7A6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykyta,

> On 12 Mar 2026, at 10:39, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
>=20
> Move IRQs from dying CPU to the online ones when a CPU is getting
> offlined. When onlining, rebalance all IRQs in a round-robin fashion.
> Guest-bound IRQs are already handled by scheduler in the process of
> moving vCPUs to active pCPUs, so we only need to handle IRQs used by Xen
> itself.
>=20
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v5->v6:
> * don't do any balancing on boot
> * only do balancing when cpu hotplug is enabled
>=20
> v4->v5:
> * handle CPU onlining as well
> * more comments
> * fix crash when ESPI is disabled
> * don't assume CPU 0 is a boot CPU
> * use insigned int for irq number
> * remove assumption that all irqs a bound to CPU 0 by default from the
>  commit message
>=20
> v3->v4:
> * patch introduced
> ---
> xen/arch/arm/include/asm/irq.h |  4 +++
> xen/arch/arm/irq.c             | 60 ++++++++++++++++++++++++++++++++++
> xen/arch/arm/smpboot.c         |  8 +++++
> 3 files changed, 72 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index 09788dbfeb..a3897ec62d 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -126,6 +126,10 @@ bool irq_type_set_by_domain(const struct domain *d);
> void irq_end_none(struct irq_desc *irq);
> #define irq_end_none irq_end_none
>=20
> +#ifdef CONFIG_CPU_HOTPLUG
> +void rebalance_irqs(unsigned int from, bool up);
> +#endif

Could you make here something like:
#else
static inline void rebalance_irqs(unsigned int from, bool up) {}
#endif

so that ...

> +
> #endif /* _ASM_HW_IRQ_H */
> /*
>  * Local variables:
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 7204bc2b68..d428d3118b 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -158,6 +158,60 @@ static int init_local_irq_data(unsigned int cpu)
>     return 0;
> }
>=20
> +#ifdef CONFIG_CPU_HOTPLUG
> +static int cpu_next;
> +
> +static void balance_irq(int irq, unsigned int from, bool up)
> +{
> +    struct irq_desc *desc =3D irq_to_desc(irq);
> +    unsigned long flags;
> +
> +    ASSERT(!cpumask_empty(&cpu_online_map));
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +    if ( likely(!desc->action) )
> +        goto out;
> +
> +    if ( likely(test_bit(_IRQ_GUEST, &desc->status) ||
> +                test_bit(_IRQ_MOVE_PENDING, &desc->status)) )
> +        goto out;
> +
> +    /*
> +     * Setting affinity to a mask of multiple CPUs causes the GIC driver=
s to
> +     * select one CPU from that mask. If the dying CPU was included in t=
he IRQ's
> +     * affinity mask, we cannot determine exactly which CPU the interrup=
t is
> +     * currently routed to, as GIC drivers lack a concrete get_affinity =
API. So
> +     * to be safe we must reroute it to a new, definitely online, CPU. I=
n the
> +     * case of CPU going down, we move only the interrupt that could res=
ide on
> +     * it. Otherwise, we rearrange all interrupts in a round-robin fashi=
on.
> +     */
> +    if ( !up && !cpumask_test_cpu(from, desc->affinity) )
> +        goto out;
> +
> +    cpu_next =3D cpumask_cycle(cpu_next, &cpu_online_map);
> +    irq_set_affinity(desc, cpumask_of(cpu_next));
> +
> +out:
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +}
> +
> +void rebalance_irqs(unsigned int from, bool up)
> +{
> +    int irq;
> +
> +    if ( cpumask_empty(&cpu_online_map) )
> +        return;
> +
> +    for ( irq =3D NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
> +        balance_irq(irq, from, up);
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( irq =3D ESPI_BASE_INTID; irq < ESPI_MAX_INTID; irq++ )
> +        balance_irq(irq, from, up);
> +#endif
> +}
> +#endif /* CONFIG_CPU_HOTPLUG */
> +
> static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>                         void *hcpu)
> {
> @@ -172,6 +226,12 @@ static int cpu_callback(struct notifier_block *nfb, =
unsigned long action,
>             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
>                    cpu);
>         break;
> +    case CPU_ONLINE:
> +#ifdef CONFIG_CPU_HOTPLUG
> +        if ( system_state >=3D SYS_STATE_active )
> +            rebalance_irqs(cpu, true);
> +#endif
> +        break;

This ifdef could be switched to if IS_ENABLED

>     }
>=20
>     return notifier_from_errno(rc);
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7f3cfa812e..f17e88e678 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -425,6 +425,14 @@ void __cpu_disable(void)
>=20
>     smp_mb();
>=20
> +    /*
> +     * Now that the interrupts are cleared and the CPU marked as offline=
,
> +     * move interrupts out of it
> +     */
> +#ifdef CONFIG_CPU_HOTPLUG
> +    rebalance_irqs(cpu, false);
> +#endif

and this one to.

Doing it without the static inline will end up in an error and i think it i=
s clearer
to have IS_ENABLED here so that it is clear from the code that nothing is d=
one
if the config is not enabled.

But happy to remove the IS_ENABLED part if other think differently.

Cheers
Bertrand

> +
>     /* Return to caller; eventually the IPI mechanism will unwind and the=
=20
>      * scheduler will drop to the idle loop, which will call stop_cpu(). =
*/
> }
> --=20
> 2.51.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEosJxnI2Gm0iAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:51:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ACA3D53CB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 11:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278598.1563377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8Vs-0003eR-R4; Fri, 10 Apr 2026 09:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278598.1563377; Fri, 10 Apr 2026 09:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8Vs-0003bR-Nz; Fri, 10 Apr 2026 09:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1278598;
 Fri, 10 Apr 2026 09:50:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wB8Vq-0003bL-T9
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:50:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB8Vq-008J6M-4p
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 11:50:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8c7f4-e002-0a2a0a5209dd-0a2a450b8d84-46
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:50:53 +0200
Received: from [52.101.70.32]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8c7fc-bca8-0a2a450b0019-3465462056bf-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 11:50:53 +0200
Received: from CWLP265CA0528.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::17)
 by GVXPR08MB10613.eurprd08.prod.outlook.com (2603:10a6:150:14e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 10 Apr
 2026 09:50:46 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:400:18c:cafe::70) by CWLP265CA0528.outlook.office365.com
 (2603:10a6:400:18c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 09:50:46 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 10 Apr 2026 09:50:46 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU4PR08MB11719.eurprd08.prod.outlook.com (2603:10a6:10:645::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:49:44 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 09:49:44 +0000
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
 b=wWe67Ae4MJVZQDKJ0aeEMXtm8Hk6mvbMsK0hUwKxEuqtQxxx1BDQUfm6Rl0/uHFquAHekPQ2xNONOPq29k5rhCnH7daOiyliqo9zPp/+Fa5SSOwZkO4UhNDVD4oNoJa6yqDe9XzpS/wOFdahyf3enmf9cVgnLmFt9nW9PWXwJfyRNLgEl2rZRKJ33cSRPHl2Z0/whAGzeOw/2HpnoLQqBU3OcK66/ZEHejcaUbzvhdvOxZw139hnAs+XoeT1GrhwJY9nQB6fTNptmRoveQ/MmXy4/iUswhxBE16Zb7LDzcbKiZjKuJkIAkKkD59vogyLjV7JmKBXTiGypsQJzkHabQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVgyjBTtCX07ZpKFHLpzvdKbsO7kkUaRqgnNl2EMaXY=;
 b=F3gQ7r07xl0x04BclqLOvLSO4oIXK3TFb9VqWY7v15lsmze2hRLWlOU993qG/xdBXI9Cfiib6RhOv+HrfLLIV1fJdGHdVh3bBzwyGxuLagkXQiJyoF2taj1U3AFNs17PRcnf7+2LDgrIIKnhMmo0yRpsgQ3vRKbr8haVdeIccbXQZ2zelckrQmpPSzHkGAVL+sChDWrv28FhbSpVjrPDg6ZyOdWlxTgUBFBSf9y9hqhDT7+fujSkddL1HmstxvHuQPPXkaFU0hioXGq7vuH5nb39wSMiLcQ4Q3NXw3LGgkfyprp+oJBdQXBEPPvazYqZOHfj3a47NUf1WCye0eLuww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVgyjBTtCX07ZpKFHLpzvdKbsO7kkUaRqgnNl2EMaXY=;
 b=NK0ElfVwWT8e3xjEdftyVbkXRIt90YogTGgq41Vz5fsKNQJ/GUJ94NB0+wQkgkVDbml1XLhSOSXWc5AwYMeyyRNrbh4c7n2pILO+HzkaAQu8OXowykRjutnBvm7NForc9vhWywDmvj2T0FH5EkTPkCginU60kGz130io2oirrSA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnD7LxKTGAAyKaShcN57+W8wfjdLDtKOoUjH7HAenWRKA9RbJbRUMaVQ09JHZuXaMbfXLYX4UBFhKxvDVXXRGS5rBTlPG7RjUx4ne4WiN1w/h5AJipZ8Io7AVyI21MONDr2mlT1UcBcRSA+1LpGc+dPM00oJn/wKACpN9XNvzaUemwsxNK+ClCQihBfrB5/f3iMKrKcHam9Adzvp7tvyDacR7GnNcoA23+GhMf59R2tGSHXL+mondXVWMAQyn/rjoSz1N0/VVQe2Z/vJhagcqkud0Dy0IXhjKPcK+i5pq3sl9xqB4YgK9LKHeinDbMk57ixXKoZXW+XBtk5NF8IGEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVgyjBTtCX07ZpKFHLpzvdKbsO7kkUaRqgnNl2EMaXY=;
 b=bxA2mPPLmogw7Cpz66iOaf7ojBj3uoQLZ2nmNQ25sLlOQTbr3P3S0CUNC9IlKJsOwux9WT/rfBqD//ks9cDzAxLh/i4VFc3izQ0q6uIlQUA6w+XOS6nu+ueTuxEVEVfteMRZrETT597oCqkvBmykghhplBmFYCA+xXOqxNeg7Y0gLBm/jmLPxysWCUTl4jR0qcsLv+d3Xq88uWiFb/Tf0HN2u//zN0+smKwVgJKcjpKIwSdqaALSvgiy6Ktb3q7oQA2+iABC/k2nD4/A7K2zW2CiG1lm3UBA+OCUWEN6rq4y7JnaWb1yAajkGDCXqI3TS3a7hVtKx6fdMwa/9UL8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVgyjBTtCX07ZpKFHLpzvdKbsO7kkUaRqgnNl2EMaXY=;
 b=NK0ElfVwWT8e3xjEdftyVbkXRIt90YogTGgq41Vz5fsKNQJ/GUJ94NB0+wQkgkVDbml1XLhSOSXWc5AwYMeyyRNrbh4c7n2pILO+HzkaAQu8OXowykRjutnBvm7NForc9vhWywDmvj2T0FH5EkTPkCginU60kGz130io2oirrSA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Thread-Topic: [PATCH v3 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Thread-Index: AQHcyM9b450W5XzxrEi9kyX2pw4Gzg==
Date: Fri, 10 Apr 2026 09:49:44 +0000
Message-ID: <D20F71C9-C43A-4F22-9B44-84C0105914B6@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <baa5aa0db3d8d2cbc5f46a60241330c4c7055d11.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <baa5aa0db3d8d2cbc5f46a60241330c4c7055d11.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU4PR08MB11719:EE_|AMS0EPF000001A2:EE_|GVXPR08MB10613:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f022b1-68e8-4b3a-f50b-08de96e6a373
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 kWgOUXw7aYb3UKTSpBniR/8X30lUsb1X8s8R2GH4fAPnK6oi1wZtyLKVNPwBuYBLGDr2aAIY/TzznPaNJf/BAFkVaDX7LavHBYjrKPxd1MAFK8j5J0iczvqV6lOYAl8QCBeAbpoHsTL4oHDPnKX/JT3MlO2qc6OV19J1CySFHLgjVGy6A2Gp2GIIL0xGOlaERl4Ab/sowN9AUSjlYzcR0i/jnKip4VlLQO6eBEay0TMdby4NmbydU0g/dE1aELgneUDTCeLh1TvN9cT1tWNno0wt6Gj9PUEoiTxGgoazDRwouev+Fk4OOYwUc65i4dAkLubzE1j9E5Pywf2EFeevlmcakkxCGLAs+VoZUfCM2sRghpkGg1O8I+HD/k1y3YN1DauhTbiFqeU9VBv47Yuf19RQ91Co3M7QlVXYbLysUu5n5D5oFy+Ib1o3ptJB/jyNJLtZ73GnQqtedokochXRer1ir5MX7TE/oiQa9korLnLX7hS1C442gPbOu24QAivUawPv9TW6k67vlowRo7qDreJKIoCXMV0j3fFtPBT1uHfqX72kkhdIIIl6kWqFNqMCoJj+7I72VDecckhaJJ79hm01Vz19DvMIi5eTAkAAOGbDcX7C+ajyc+CtPxAy2qRmFNuDoEM9/q1UDUOSLrctXypRPMARTqw94xyMW3z0S7szry1YZTD5oboDORtPJY3iCreiBp58RT1EW+SYAAZGLzRvgf9qsidUcVFVOK/Ljmowy1wNwMUOfq+5YOC3w8a8qIdF83PdlIM2q9ukRMKKT5I/o2F/41ebDpC9cA62z8s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBD766F2F369174E8186679440090312@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 TlfO2jSVkVx/Jb2d16qr3ckdRoYMu6JrL2hTr9PJAEiVCfCUKAa1RMpIvvwwEc0FHm2pvgD965PvtMBA4kxG0NCc/2e9T4Kv2bjpLZ6WwadYRHAO8CUCEO4Ns7FJ7mGPU3p9iWEK0rJ1WFMFKx9GOOzgMIov4bA9gdu0fUslwOJ5fFXh108Yp5ZZad/IRC3Pdk60qYbUOsHi74WHCnLtr/flyg/t6rf9O8YXrXqXMH3VaXeeFIF7G9cXrxmAuU2px7scI7W6atowS/tZ0pQltFoeaFFoXVN91adEcb48iEcLsdc9ls62703kZIdGvxoRan+efkO7oK3Y27c0ggsWng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11719
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	029ffc76-a5d3-48aa-c8fa-08de96e67e67
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LwrXhoS8ANvG0qERsydnWRqBqyZH1kuaXJS9aDm9MXY2DtkqDylJbZoRejnsgRanXsKUQ6xM5in+ZePAqQJJrRp25zfR/VR1MYXy7Zu1FQy+ZwC9f+dFpV49Ni3b+/7Fj+bVLYLHk9TVoh/Q/Y0we5yPfEutLYZb6JRfTxEkQCWlb2+4k98095zRYhZ6K+jJTBXaYWpTjaqRIXNElZcl7nnvhQQsOmDTOYGhH/AZ7+BqvzulcbyinWzmmVFDeNLEOvAMV9jOE+k94p3dbcWwx3TM13GzIOeVgmRe1GHdKGJQOzzEfHs6j9zesdHTFR0/ss+SlVpojTjDjdXaUl/lmaBAghuc3l0Hp4/74FKi/e0RZmgm4BTe55ywW5CiDgS6zDtA69IwxieBPL9o9UJ05uVC1n0TQb2rYmGOONV73VJr5CDDGvKMcTjS7lP9fsG2ERmOb8o/q5H2eSb2PdzN4TSmw7qrenb3wD3boLg6MsHc9TQ+wakR00+nQSW7PZJdOXW4iG5EBkkO9tX3d59/84Yw/eH4ZeqG7nMhtlP5HNqr6yk/rn2AlJedYtHPMyQTYc756LALVFUPDOBqNQlaCduUarNmWmZYkIMXdsldmo8Wi88me7W3+0Fftc8W81RzFbTmOzwjItESnpBvVJIYy1GwyYMJbcogrTxNtqhm6KUN1M7jZxqC8vKkS2rOCKEi5yxOFOdjq1ZNT61IDXWZLoyAuGukPreQG1FnnCPrWAFD/tq2D3iU/JWBdMlCmePE93YECCh4OibYYkxbeGp5Ng==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KcSYlqjdHqiIiATV1bCeqTmU0KguPQ+hwaQ4Eo/pIMwESLEie3q7M6mtaMULhLyA08bGfJNHq8NeCMxz2GNJeD5i+ckrdoXF5Gzs2ZN1fcSCYJEq/nlWX5B5vwoO8NVJuYxjdGn5Q8K2sf3VwFho2IbIoPpLUJ+Z0WzkpwwSVUl40yX8xSMtP9XC3hzhNfMrEgcASOusugRjJr+Q1DLBc+UYRjh9ez4dcRQ5r1EVJu4oeO/abSk1+UcqHxYUbWUCiXZHN/Jb/Bqb5E+zaGGuIS9TdWPVV9e3PnOSxmhpTrye4gVBIvcoq8qvixpBeGK3iTPoWVaFwdBQrqz0JpE3cPyZd1QeCM8RSkriv6csMEtEMGYOkijdwbDg+vZuU9kEYnNCToTjYNCuBLA0QfvES9SaPfUu+fypFK3z1XSC0sX8BhsByGbc7dO0DvjIdmG9
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:50:46.1022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f022b1-68e8-4b3a-f50b-08de96e6a373
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10613
X-purgate-ID: tlsNG-42698a/1775814653-EE54B2A1-AD6C0320/0/0
X-purgate-type: clean
X-purgate-size: 4776
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
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:Bertrand.Marquis@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: E7ACA3D53CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWlsYW4sDQoNCj4gQEAgLTc0MCw3ICs3NjYsMzMgQEAgc3RhdGljIHZvaWQgYXJtX3NtbXVf
d3JpdGVfc3RydGFiX2VudChzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVyICptYXN0ZXIsIHUzMiBzaWQs
DQo+IHJldHVybjsNCj4gfQ0KPiANCj4gKyBpZiAoc3RlX2xpdmUpIHsNCj4gKyAvKiBGaXJzdCBp
bnZhbGlkYXRlIHRoZSBsaXZlIFNURSAqLw0KPiArIGRzdFswXSA9IGNwdV90b19sZTY0KFNUUlRB
Ql9TVEVfMF9DRkdfQUJPUlQpOw0KPiArIGFybV9zbW11X3N5bmNfc3RlX2Zvcl9zaWQoc21tdSwg
c2lkKTsNCj4gKyB9DQo+ICsNCj4gKyBpZiAoczFfY2ZnKSB7DQo+ICsgQlVHX09OKHMxX2xpdmUp
Ow0KDQpJIHRoaW5rIHRoaXMgaXMgd3JvbmcsIGlmIGEgZ3Vlc3QgaXNzdWVzIGFub3RoZXIgczEg
dXBkYXRlIG9uIHRoZSBzYW1lIHNpZCwgdGhpcyB3aWxsIGNyYXNoIFhlbiwgSSB0aGluaw0KdGhh
dCB3ZeKAmXZlIGFscmVhZHkgaW52YWxpZGF0ZWQgdGhlIGxpdmUgc3RhdHVzIHNvIHRoaXMgb25l
IHNob3VsZCBiZSByZW1vdmVkDQoNCj4gKyBkc3RbMV0gPSBjcHVfdG9fbGU2NCgNCj4gKyBGSUVM
RF9QUkVQKFNUUlRBQl9TVEVfMV9TMURTUywgU1RSVEFCX1NURV8xX1MxRFNTX1NTSUQwKSB8DQo+
ICsgRklFTERfUFJFUChTVFJUQUJfU1RFXzFfUzFDSVIsIFNUUlRBQl9TVEVfMV9TMUNfQ0FDSEVf
V0JSQSkgfA0KPiArIEZJRUxEX1BSRVAoU1RSVEFCX1NURV8xX1MxQ09SLCBTVFJUQUJfU1RFXzFf
UzFDX0NBQ0hFX1dCUkEpIHwNCj4gKyBGSUVMRF9QUkVQKFNUUlRBQl9TVEVfMV9TMUNTSCwgQVJN
X1NNTVVfU0hfSVNIKSB8DQo+ICsgRklFTERfUFJFUChTVFJUQUJfU1RFXzFfU1RSVywgU1RSVEFC
X1NURV8xX1NUUldfTlNFTDEpKTsNCj4gKw0KPiArIGlmIChzbW11LT5mZWF0dXJlcyAmIEFSTV9T
TU1VX0ZFQVRfU1RBTExTICYmDQo+ICsgICAhKHNtbXUtPmZlYXR1cmVzICYgQVJNX1NNTVVfRkVB
VF9TVEFMTF9GT1JDRSkpDQo+ICsgZHN0WzFdIHw9IGNwdV90b19sZTY0KFNUUlRBQl9TVEVfMV9T
MVNUQUxMRCk7DQo+ICsNCj4gKyB2YWwgfD0gKHMxX2NmZy0+czFjdHhwdHIgJiBTVFJUQUJfU1RF
XzBfUzFDVFhQVFJfTUFTSykgfA0KPiArIEZJRUxEX1BSRVAoU1RSVEFCX1NURV8wX0NGRywgU1RS
VEFCX1NURV8wX0NGR19TMV9UUkFOUykgfA0KPiArIEZJRUxEX1BSRVAoU1RSVEFCX1NURV8wX1Mx
Q0RNQVgsIHMxX2NmZy0+czFjZG1heCkgfA0KPiArIEZJRUxEX1BSRVAoU1RSVEFCX1NURV8wX1Mx
Rk1ULCBzMV9jZmctPnMxZm10KTsNCj4gKyB9DQo+ICsNCj4gaWYgKHMyX2NmZykgew0KPiArIHU2
NCB2dHRiciA9IHMyX2NmZy0+dnR0YnIgJiBTVFJUQUJfU1RFXzNfUzJUVEJfTUFTSzsNCj4gdTY0
IHN0cnRhYiA9DQo+IEZJRUxEX1BSRVAoU1RSVEFCX1NURV8yX1MyVk1JRCwgczJfY2ZnLT52bWlk
KSB8DQo+IEZJRUxEX1BSRVAoU1RSVEFCX1NURV8yX1ZUQ1IsIHMyX2NmZy0+dnRjcikgfA0KPiBA
QCAtNzUwLDEyICs4MDIsMTkgQEAgc3RhdGljIHZvaWQgYXJtX3NtbXVfd3JpdGVfc3RydGFiX2Vu
dChzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVyICptYXN0ZXIsIHUzMiBzaWQsDQo+IFNUUlRBQl9TVEVf
Ml9TMlBUVyB8IFNUUlRBQl9TVEVfMl9TMkFBNjQgfA0KPiBTVFJUQUJfU1RFXzJfUzJSOw0KPiAN
Cj4gLSBCVUdfT04oc3RlX2xpdmUpOw0KPiArIGlmIChzMl9saXZlKSB7DQo+ICsgdTY0IHMydHRi
ID0gbGU2NF90b19jcHUoZHN0WzNdKSAmIFNUUlRBQl9TVEVfM19TMlRUQl9NQVNLOw0KPiArIEJV
R19PTihzMnR0YiAhPSB2dHRicik7DQo+ICsgfQ0KPiArDQo+IGRzdFsyXSA9IGNwdV90b19sZTY0
KHN0cnRhYik7DQo+IA0KPiAtIGRzdFszXSA9IGNwdV90b19sZTY0KHMyX2NmZy0+dnR0YnIgJiBT
VFJUQUJfU1RFXzNfUzJUVEJfTUFTSyk7DQo+ICsgZHN0WzNdID0gY3B1X3RvX2xlNjQodnR0YnIp
Ow0KPiANCj4gdmFsIHw9IEZJRUxEX1BSRVAoU1RSVEFCX1NURV8wX0NGRywgU1RSVEFCX1NURV8w
X0NGR19TMl9UUkFOUyk7DQo+ICsgfSBlbHNlIHsNCj4gKyBkc3RbMl0gPSAwOw0KPiArIGRzdFsz
XSA9IDA7DQo+IH0NCj4gDQo+IGlmIChtYXN0ZXItPmF0c19lbmFibGVkKQ0KPiBAQCAtMTI1NCw2
ICsxMzEzLDE1IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfZG9tYWluX2ZpbmFsaXNlKHN0cnVjdCBp
b21tdV9kb21haW4gKmRvbWFpbiwNCj4gew0KPiBpbnQgcmV0Ow0KPiBzdHJ1Y3QgYXJtX3NtbXVf
ZG9tYWluICpzbW11X2RvbWFpbiA9IHRvX3NtbXVfZG9tYWluKGRvbWFpbik7DQo+ICsgc3RydWN0
IGFybV9zbW11X2RldmljZSAqc21tdSA9IHNtbXVfZG9tYWluLT5zbW11Ow0KPiArDQo+ICsgaWYg
KHNtbXVfZG9tYWluLT5zdGFnZSA9PSBBUk1fU01NVV9ET01BSU5fTkVTVEVEICYmDQo+ICsgKCEo
c21tdS0+ZmVhdHVyZXMgJiBBUk1fU01NVV9GRUFUX1RSQU5TX1MxKSB8fA0KPiArICEoc21tdS0+
ZmVhdHVyZXMgJiBBUk1fU01NVV9GRUFUX1RSQU5TX1MyKSkpIHsNCj4gKyBkZXZfaW5mbyhzbW11
X2RvbWFpbi0+c21tdS0+ZGV2LA0KPiArICJkb2VzIG5vdCBpbXBsZW1lbnQgdHdvIHN0YWdlc1xu
Iik7DQo+ICsgcmV0dXJuIC1FSU5WQUw7DQo+ICsgfQ0KPiANCj4gLyogUmVzdHJpY3QgdGhlIHN0
YWdlIHRvIHdoYXQgd2UgY2FuIGFjdHVhbGx5IHN1cHBvcnQgKi8NCj4gc21tdV9kb21haW4tPnN0
YWdlID0gQVJNX1NNTVVfRE9NQUlOX1MyOw0KDQpIZXJlIHdlIHNldCBzdGFnZSAyIGFzIGRlZmF1
bHQsIGJ1dCBpbiBhcm1fc21tdV9kZXZpY2VfaHdfcHJvYmUoKSB3ZeKAmXZlDQpkZWxldGVkIHRo
ZSBjaGVjayBmb3IgUzIgcmVxdWlyZWQsIHNvIGlmIHdlIGhhdmUgYW4gSFcgd2l0aCBvbmx5IFMx
IHRoZSBwcm9iZSB3aWxsDQpzdWNjZWVkIGJ1dCB3ZSB3aWxsIHdyb25nbHkgc2V0IGhlcmUgUzIs
IHNvIEkgd291bGQga2VlcCAuLi4NCg0KPiBAQCAtMjM1MywxMSArMjQyMSwxNCBAQCBzdGF0aWMg
aW50IGFybV9zbW11X2RldmljZV9od19wcm9iZShzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11
KQ0KPiBicmVhazsNCj4gfQ0KPiANCj4gKyBpZiAocmVnICYgSURSMF9TMVApDQo+ICsgc21tdS0+
ZmVhdHVyZXMgfD0gQVJNX1NNTVVfRkVBVF9UUkFOU19TMTsNCj4gKw0KPiBpZiAocmVnICYgSURS
MF9TMlApDQo+IHNtbXUtPmZlYXR1cmVzIHw9IEFSTV9TTU1VX0ZFQVRfVFJBTlNfUzI7DQo+IA0K
PiAtIGlmICghKHJlZyAmIElEUjBfUzJQKSkgew0KPiAtIGRldl9lcnIoc21tdS0+ZGV2LCAibm8g
c3RhZ2UtMiB0cmFuc2xhdGlvbiBzdXBwb3J0IVxuIik7DQoNCnRoaXMgY2hhbmdlLCByZWFycmFu
Z2VkIGluIHRoZSB3YXkgdGhhdCBpcyBzZW5zaWJsZSB3aXRoIHRoZSBuZXcgbG9naWMuDQoNCj4g
KyBpZiAoIShyZWcgJiAoSURSMF9TMVAgfCBJRFIwX1MyUCkpKSB7DQo+ICsgZGV2X2VycihzbW11
LT5kZXYsICJubyB0cmFuc2xhdGlvbiBzdXBwb3J0IVxuIik7DQo+IHJldHVybiAtRU5YSU87DQo+
IH0NCj4gDQoNCg==


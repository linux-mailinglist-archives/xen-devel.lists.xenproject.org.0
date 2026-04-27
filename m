Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPZ8B6xs72nFBAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 16:03:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A5473F5B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 16:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294968.1571678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMY4-0006ol-IT; Mon, 27 Apr 2026 14:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294968.1571678; Mon, 27 Apr 2026 14:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMY4-0006mn-Fd; Mon, 27 Apr 2026 14:02:56 +0000
Received: by outflank-mailman (input) for mailman id 1294968;
 Mon, 27 Apr 2026 14:02:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wHMY2-0006mh-MA
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 14:02:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMY1-008rv7-VI
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 16:02:53 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ef6c81-bab6-0a2a0a5309dd-0a2a4505ae5c-32
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 16:02:52 +0200
Received: from [52.101.69.38]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69ef6c8c-aaa8-0a2a45050019-346545266f32-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 16:02:52 +0200
Received: from AM9P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::30)
 by FRZPR08MB11874.eurprd08.prod.outlook.com (2603:10a6:d10:1cc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 14:02:49 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::ac) by AM9P195CA0025.outlook.office365.com
 (2603:10a6:20b:21f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 14:02:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 14:02:49 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AMCPR08MB11993.eurprd08.prod.outlook.com (2603:10a6:20b:770::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 14:01:47 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 14:01:47 +0000
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
 b=Ua7UmduAnPoviMK8B11Fv8VKXz97QNZ0CuFKakKEX895ZOiurPRfSTphu5K9CcT8bE/qSxRL3pHtUEWvD4bVJGEiQN+Oc82vXP924l+NWtNa+z050IgPGcSNasLWjWn4z4ehag05U7eMqKaBeKM6p92nNQaa8mD5KC+oZn7/w5azEdk98LP7cmxu2uYDxFWHbNd2osDOrhPluqrrHhliGdnFWQD5Dcfe0J603UJLbnacg+EegVLbFSU90C7xdXhffvMF2ybUZYSPfov0d6ZVkiD1Ru7hckrWQSEZpd5sB+1Xdvg+COTYSsTrXQyMUNHaRzEt0urSxjmAfx//Xh9ZZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcxltaSz8v20VzeeDOwg6Nk5OYGWs/xSbBDt0JMWyv0=;
 b=J3llXNLRLsZP0Qo7F7vZc5uvHvPwizyFoYe35gU0AYLSTC57+wtHRy+4cz7TEe4VvrNTH9Lg7ETt3PQkSEvAffkxqa6qRG9KPlfXVEQZWhzJf8LJ9I/CN98HjAM+AEe5oLiXucAszVbhhWYTcII0saRSEf0Ny9+lLReW4wQ3GCpHx3GlIpe0OfLz+2saD7/7rSWGyjF1JSVeIEpUkRcovGWT910n9GHx4+j4x9Phb/gRswX4mPZPXbeXSO7H7pcXSG6zYdEUHPlH+2WswkwwRtzus2GoN8t2cidkZ+1ZnOG/Ck5GhPC16SmMUSdpmdYQPixE7W4zEspJck2N/V4AKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcxltaSz8v20VzeeDOwg6Nk5OYGWs/xSbBDt0JMWyv0=;
 b=UD1pNrwsMGCZaa9bBIQhOGIkC8OAerBKMcV6c4tbeAuqYclCzooy3gd9pYPrNOzqlgYUCdVy/rF/WFIo/qqPAhbWQmFeNCttWrsWFmYOcoDfP3ZXN5UdAYvTNZhenrSv5dh8soaZ49ZvY01ETAnxi/9sB1Q0GOT37zMsPwNhgUA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8G8M56Y3UGUFCAvNWVthYKB3bfWKNKDPIj+gVH1KZBwhL4LdqZc+wvzDHCmthlg8je+2TgdJpz2TrK9Bwk+vb7Mwvp5Wsm+KAW+dueOO4yQENrnBoFst7NjGQBLnjNJWn9vvWAeG9Sm0PBFnC0G2ifkzQFWktxm5BCGVnM3DDEqjNM9g9JgGvipwNAUp28jXYqvdjY3SUsqAqTG+fQnaJHIanqaqspd7JK2C+oxnAQpCo3ZWWkVtYvpIYfKrmKFtta1WyX2fiT3giT59gg2Md0KtywbOodiNq6PKgmVarMqS2TX7CCP75clOje9KJfqgerV9W2RLpBHNIPS3VCCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcxltaSz8v20VzeeDOwg6Nk5OYGWs/xSbBDt0JMWyv0=;
 b=ObFS3xpVzb7JgTfjhZNLbTX9pKEJHiGG+GzZc7h9zaHRJ9l2XWwPcEOPclk2BndL9hrE4M1HGcouVA3RkT5oiG4uaUquX5ZY7cvsNhEG1vPVyc8/AkI58wcycRB7liV5YBApit5vQYQMv3cJfz79vfcPqwn5r3Ui4bomFz5m/+toIcM7DCa268lz4NecMY0LmEHGIg5NDF9Tu/d9i2ZNghLyf7CVd9aDC5LogDmkT66I58uD7X+ZdLxuqHq8J5yQcM0bfyNNjWy6RvZrqiHKFYMBgcop1waojvU6aLroPXrb9pVBOYC2kkgPgwOEZWZA5ihe+q3wRbOdPXM8ZFC5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcxltaSz8v20VzeeDOwg6Nk5OYGWs/xSbBDt0JMWyv0=;
 b=UD1pNrwsMGCZaa9bBIQhOGIkC8OAerBKMcV6c4tbeAuqYclCzooy3gd9pYPrNOzqlgYUCdVy/rF/WFIo/qqPAhbWQmFeNCttWrsWFmYOcoDfP3ZXN5UdAYvTNZhenrSv5dh8soaZ49ZvY01ETAnxi/9sB1Q0GOT37zMsPwNhgUA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
Thread-Topic: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
Thread-Index: AQHc1k5QBMsvUkAtf0yXvEOre8XAaw==
Date: Mon, 27 Apr 2026 14:01:47 +0000
Message-ID: <818AEE8A-669C-4BE9-9EF3-92323A749470@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <038337ec0e3f1474c6cc6a92090e28c6972e4dc6.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <038337ec0e3f1474c6cc6a92090e28c6972e4dc6.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AMCPR08MB11993:EE_|AMS0EPF00000190:EE_|FRZPR08MB11874:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ea296f-acd5-4fe8-e4d8-08dea465aaa1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|18096099003|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 dpbPw6PS3OciIBdwt/OelwEoGLWv+g1+xPpP5O20IJ+MdyewVMw7KA2+Wr3naAdJnF2MY8IV2Fusl1ErT3wR4q2ia8wrQlxujXYaDdHsectG3vXv6XmDm5IbOJb4lCmtT7e6cgiN6RVI3QOey/88e99V1JfJ/Ary4LqzfSL5q4dX5BBMY4vwhdt0uwUPfv4dyBNex3lLZpWtwSP9Qv1y6mU6Ihx3zcd5DC3sxFmv8PrpvWLDqYFmwtKrep9p1FpW1PVhbCXgQZeVjqrsWcV61ez29f70n8vv9JbuN9K8yJjs90cC2tbOve56ofSY4BHuKF0VMbZNk23UbkYDsMVHLoH2C9+1TiWFnbc24chVDb4+A0O9AqKFp057ujDb5DvbFK7gABoOMy502Pm1p1jf1avIb3ikqFx6SD8v2YU0rnQ38NSQUmtZ90UbHAoEcTmiqc1oAPn6d6b7drTXy/RZmkBx7zm63aWdzInoJTXIolvJFmhpv2VE+3z9TK4Z6TWH+jFH2XdJubYpKI999F0NKorzjr6CGU7QWGVf0WnN4URLUKexh/zV619zplPVn+rTCWgiTuh0L8GNYYXvLANLYs3uY5sfer3BC+L376xu0WvAjsnwKP/o1hYZZaeiyQq/jgfWrMastjrOzP2Wv50xVPq8lxEa5Z6IyE9ASk+v0g8Z+fOHxBci6lYNuz6/Vcmt6cseOPluBWlfzhqBH5YYmKzH6GEEeDyPiiqtC39RYN/TPC+1uAZ9VBAs2qZVyG3nPcAAXCO2wgPaW5UsX5n8lGcVUkQ1kDSxDXxS/1Hda5I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18096099003)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9581F87DAE83B4C88EB9EEDF1DA9A32@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 bSkd0uLGWD0O2vUkRBLtSu43Pujb3blrQkjAIUwvU+B74Y+y+RK1ftHcnb7Wrl69WO48geLuLoT4XPgsCXLqxoU0QN12FNueYn5LVfMdu50/KthfffmrQcLWUFWi4I5JlRBmQhxG9Kx7/TRFppvFXiMmSUBpTDx6f02qkVYFPwMh7u2l39+kvbt2Yd3cdUw+0oXVMOg4dTnKj2pDq28s+Xxw/hbChJv4H+FsqziAVbSf8rZQ4V2fbtyAaQtq1WrTIhvAvsNXIz8q6iq94hYccq1SGAxBPYwr+Mp2ZlNgAI9H1Pydtqn/iboHVyCGubAQVLZzBLP/w/J3qoxh/amlng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR08MB11993
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71cbf7bd-31a1-4658-88ae-08dea4658598
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|14060799003|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003|18096099003;
X-Microsoft-Antispam-Message-Info:
	mqZdFXK1Li42IefDH0IZcPqPKHv0ljY7zISCwiEPOh0jJ9vVjbNYxqrXVoCpCwJr4kpCXY/1WKR5a7OjM3taKgzHVJ02XtLFUTdqhcjqMFzgsK5em9n23CcxszYOMglZGzU7yF1Z7+SzwROwWazcaRFbJuo/wbA6FF+Ovrm8iKtiCMZr5nSMfDxTJ3RX0A4PsaxAFhI0D20UVvu9coCXcJkN+iVxfmGthdTwpkP90ynNqJPJdD4ZWldio1CIfeLaxC4vUi4sDK/F844v4lNnpeSmDzv6d83d7IKf54T1dx5NL3CIXHsOgMaGXlQAe1INIdxzMOeM36PP2x9govB+D3GyuUAmH9yJo8LRjnd8V8apzf4n63LozGKNjb4htQKZXsGFxEMTgFfqiK/SMV8kE182V/ACzhbNveROJu0iS9RG4SxbcXjtpdZ/BQzDcXDvVYZrC54gwX0cia7xfuz2JSKnadDHVFj2wYkDC1ubK5qS3VeDuUcjL6B1k2E2IUxc7BhRTaXEnNNFqQ8Wb6BnkLLYaW3USKXDjO9pilqfC/Zs0CQP+k2uT92p9FmnkRSvuSXHWuwfUNSNnKnPqWJDiWtPqYEfVk2PJvDVo+v/t1EcnPv2AzZY523g8SFZeDxTyX0SYqh8wPeA2BHVKoEOcB+/KfYNmo+WK7HNInoIl8ibUkV99yC/FjdN7KIDadHhjUEPrEqFdx5bq9zl+8dzJRw7U9bsxeRl84ORW5AptkSPMbb6Hr+YoHNr/9IAt7PGQRgm/6PEt7V2nCapGCh0Gw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003)(18096099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HWTzqYl0H4Sw813m/dTnTPFBCHrV4kMqR9zJSpT3uYQnPykHqqJXODvKJFi7bNjZcZy+ZVyO3sDHywhKfBjQpjH2MMTiQrdjBAQAsc577+GYV1p4GB5k/vCZ5UeBwu0BGNSH51woPPG2IL3o+D+7z8R1GEihOIdOrvq7W5Zj652mWO6lXbklndsQiY2mQyc4IO6CQhppk+/MZrcLrczE8ETliyYG1KhJit4eknKIaAzVbCiQ4pvbTmKVqqpcs/7JqVsHHk49jgNObKIlyOEyWLCqXFLEygPVj8lsVFyhziRqmAMISkLUsgxITvP8TE/6bJgw51kzRWFr/du9IsKXYHp56hdOe9GmSyFsVeGa2KftS0GLdh962pskOOsFwukrBz2kDYwmWDkDyIRJIV/7I2kG80T4VhI84TuC+hZ6fsnHp43WwIdHmtVEiNwZcFaL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 14:02:49.3469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ea296f-acd5-4fe8-e4d8-08dea465aaa1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11874
X-purgate-ID: tlsNG-c201ff/1777298572-E1DDB443-96884617/0/0
X-purgate-type: clean
X-purgate-size: 9850
X-Rspamd-Queue-Id: A92A5473F5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid]

SGkgTXlrb2xhLA0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL3NtbXUtdjMuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCj4g
aW5kZXggYmYxNTMyMjdkYi4uNzYwN2ZmYzljYSAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hcm0vc21tdS12My5jDQo+IEBAIC0xODE0LDggKzE4MTQsNyBAQCBzdGF0aWMgaW50IGFybV9z
bW11X3dyaXRlX3JlZ19zeW5jKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUsIHUzMiB2YWws
DQo+IH0NCj4gDQo+IC8qIEdCUEEgaXMgInNwZWNpYWwiICovDQo+IC1zdGF0aWMgaW50IF9faW5p
dCBhcm1fc21tdV91cGRhdGVfZ2JwYShzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11LA0KPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHNldCwgdTMyIGNscikN
Cj4gK3N0YXRpYyBpbnQgYXJtX3NtbXVfdXBkYXRlX2dicGEoc3RydWN0IGFybV9zbW11X2Rldmlj
ZSAqc21tdSwgdTMyIHNldCwgdTMyIGNscikNCj4gew0KPiBpbnQgcmV0Ow0KPiB1MzIgcmVnLCBf
X2lvbWVtICpnYnBhID0gc21tdS0+YmFzZSArIEFSTV9TTU1VX0dCUEE7DQo+IEBAIC0xOTk1LDEw
ICsxOTk0LDI5IEBAIGVycl9mcmVlX2V2dHFfaXJxOg0KPiByZXR1cm4gcmV0Ow0KPiB9DQo+IA0K
PiArc3RhdGljIGludCBhcm1fc21tdV9lbmFibGVfaXJxcyhzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNl
ICpzbW11KQ0KPiArew0KPiArIGludCByZXQ7DQo+ICsgdTMyIGlycWVuX2ZsYWdzID0gSVJRX0NU
UkxfRVZUUV9JUlFFTiB8IElSUV9DVFJMX0dFUlJPUl9JUlFFTjsNCj4gKw0KPiArIGlmICggc21t
dS0+ZmVhdHVyZXMgJiBBUk1fU01NVV9GRUFUX1BSSSApDQo+ICsgaXJxZW5fZmxhZ3MgfD0gSVJR
X0NUUkxfUFJJUV9JUlFFTjsNCj4gKw0KPiArIC8qIEVuYWJsZSBpbnRlcnJ1cHQgZ2VuZXJhdGlv
biBvbiB0aGUgU01NVSAqLw0KPiArIHJldCA9IGFybV9zbW11X3dyaXRlX3JlZ19zeW5jKHNtbXUs
IGlycWVuX2ZsYWdzLA0KPiArICAgICAgQVJNX1NNTVVfSVJRX0NUUkwsIEFSTV9TTU1VX0lSUV9D
VFJMQUNLKTsNCj4gKyBpZiAoIHJldCApDQo+ICsgew0KPiArIGRldl93YXJuKHNtbXUtPmRldiwg
ImZhaWxlZCB0byBlbmFibGUgaXJxc1xuIik7DQo+ICsgcmV0dXJuIHJldDsNCj4gKyB9DQo+ICsN
Cj4gKyByZXR1cm4gMDsNCj4gK30NCj4gKw0KPiBzdGF0aWMgaW50IF9faW5pdCBhcm1fc21tdV9z
ZXR1cF9pcnFzKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQo+IHsNCj4gaW50IHJldCwg
aXJxOw0KPiAtIHUzMiBpcnFlbl9mbGFncyA9IElSUV9DVFJMX0VWVFFfSVJRRU4gfCBJUlFfQ1RS
TF9HRVJST1JfSVJRRU47DQo+IA0KPiAvKiBEaXNhYmxlIElSUXMgZmlyc3QgKi8NCj4gcmV0ID0g
YXJtX3NtbXVfd3JpdGVfcmVnX3N5bmMoc21tdSwgMCwgQVJNX1NNTVVfSVJRX0NUUkwsDQo+IEBA
IC0yMDI4LDIyICsyMDQ2LDcgQEAgc3RhdGljIGludCBfX2luaXQgYXJtX3NtbXVfc2V0dXBfaXJx
cyhzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11KQ0KPiB9DQo+IH0NCj4gDQo+IC0gaWYgKHNt
bXUtPmZlYXR1cmVzICYgQVJNX1NNTVVfRkVBVF9QUkkpDQo+IC0gaXJxZW5fZmxhZ3MgfD0gSVJR
X0NUUkxfUFJJUV9JUlFFTjsNCj4gLQ0KPiAtIC8qIEVuYWJsZSBpbnRlcnJ1cHQgZ2VuZXJhdGlv
biBvbiB0aGUgU01NVSAqLw0KPiAtIHJldCA9IGFybV9zbW11X3dyaXRlX3JlZ19zeW5jKHNtbXUs
IGlycWVuX2ZsYWdzLA0KPiAtICAgICAgQVJNX1NNTVVfSVJRX0NUUkwsIEFSTV9TTU1VX0lSUV9D
VFJMQUNLKTsNCj4gLSBpZiAocmV0KSB7DQo+IC0gZGV2X3dhcm4oc21tdS0+ZGV2LCAiZmFpbGVk
IHRvIGVuYWJsZSBpcnFzXG4iKTsNCj4gLSBnb3RvIGVycl9mcmVlX2lycXM7DQo+IC0gfQ0KPiAt
DQo+IHJldHVybiAwOw0KPiAtDQo+IC1lcnJfZnJlZV9pcnFzOg0KPiAtIGFybV9zbW11X2ZyZWVf
aXJxcyhzbW11KTsNCj4gLSByZXR1cm4gcmV0Ow0KPiB9DQo+IA0KPiBzdGF0aWMgaW50IGFybV9z
bW11X2RldmljZV9kaXNhYmxlKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQo+IEBAIC0y
MDU3LDcgKzIwNjAsNyBAQCBzdGF0aWMgaW50IGFybV9zbW11X2RldmljZV9kaXNhYmxlKHN0cnVj
dCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQo+IHJldHVybiByZXQ7DQo+IH0NCj4gDQo+IC1zdGF0
aWMgaW50IF9faW5pdCBhcm1fc21tdV9kZXZpY2VfcmVzZXQoc3RydWN0IGFybV9zbW11X2Rldmlj
ZSAqc21tdSkNCj4gK3N0YXRpYyBpbnQgYXJtX3NtbXVfZGV2aWNlX3Jlc2V0KHN0cnVjdCBhcm1f
c21tdV9kZXZpY2UgKnNtbXUpDQo+IHsNCj4gaW50IHJldDsNCj4gdTMyIHJlZywgZW5hYmxlczsN
Cj4gQEAgLTIxNjMsMTcgKzIxNjYsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBhcm1fc21tdV9kZXZp
Y2VfcmVzZXQoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSkNCj4gfQ0KPiB9DQo+IA0KPiAt
IHJldCA9IGFybV9zbW11X3NldHVwX2lycXMoc21tdSk7DQo+IC0gaWYgKHJldCkgew0KPiAtIGRl
dl9lcnIoc21tdS0+ZGV2LCAiZmFpbGVkIHRvIHNldHVwIGlycXNcbiIpOw0KDQpXZSBhcmUgbW92
aW5nIHRoaXMgb25lIHRvIHRoZSBwcm9iZSBhbmQgLi4gDQoNCj4gKyByZXQgPSBhcm1fc21tdV9l
bmFibGVfaXJxcyhzbW11KTsNCj4gKyBpZiAoIHJldCApDQoNCmNoYW5naW5nIHdpdGggdGhpcyBv
bmUsIGJ1dCBhcm1fc21tdV9zZXR1cF9pcnFzKCkgYWxzbyBjYWxscyBhcm1fc21tdV9zZXR1cF91
bmlxdWVfaXJxcygpIHdoaWNoDQpjYWxscyBhcm1fc21tdV9zZXR1cF9tc2lzKCksIGFyZSB3ZSBz
dXJlIHRoYXQgb24gcmVzdW1lIHdlIHdpbGwgZ2V0IHRoZSBzYW1lIHN0YXRlPw0KDQo+IHJldHVy
biByZXQ7DQo+IC0gfQ0KPiAtDQo+IC0gLyogSW5pdGlhbGl6ZSB0YXNrbGV0cyBmb3IgdGhyZWFk
ZWQgSVJRcyovDQo+IC0gdGFza2xldF9pbml0KCZzbW11LT5ldnRxX2lycV90YXNrbGV0LCBhcm1f
c21tdV9ldnRxX3Rhc2tsZXQsIHNtbXUpOw0KPiAtIHRhc2tsZXRfaW5pdCgmc21tdS0+cHJpcV9p
cnFfdGFza2xldCwgYXJtX3NtbXVfcHJpcV90YXNrbGV0LCBzbW11KTsNCj4gLSB0YXNrbGV0X2lu
aXQoJnNtbXUtPmNvbWJpbmVkX2lycV90YXNrbGV0LCBhcm1fc21tdV9jb21iaW5lZF9pcnFfdGFz
a2xldCwNCj4gLSBzbW11KTsNCj4gDQo+IC8qIEVuYWJsZSB0aGUgU01NVSBpbnRlcmZhY2UsIG9y
IGVuc3VyZSBieXBhc3MgKi8NCj4gaWYgKGRpc2FibGVfYnlwYXNzKSB7DQo+IEBAIC0yMTgxLDIw
ICsyMTc2LDE2IEBAIHN0YXRpYyBpbnQgX19pbml0IGFybV9zbW11X2RldmljZV9yZXNldChzdHJ1
Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11KQ0KPiB9IGVsc2Ugew0KPiByZXQgPSBhcm1fc21tdV91
cGRhdGVfZ2JwYShzbW11LCAwLCBHQlBBX0FCT1JUKTsNCj4gaWYgKHJldCkNCj4gLSBnb3RvIGVy
cl9mcmVlX2lycXM7DQo+ICsgcmV0dXJuIHJldDsNCj4gfQ0KPiByZXQgPSBhcm1fc21tdV93cml0
ZV9yZWdfc3luYyhzbW11LCBlbmFibGVzLCBBUk1fU01NVV9DUjAsDQo+ICAgICAgQVJNX1NNTVVf
Q1IwQUNLKTsNCj4gaWYgKHJldCkgew0KPiBkZXZfZXJyKHNtbXUtPmRldiwgImZhaWxlZCB0byBl
bmFibGUgU01NVSBpbnRlcmZhY2VcbiIpOw0KPiAtIGdvdG8gZXJyX2ZyZWVfaXJxczsNCj4gKyBy
ZXR1cm4gcmV0Ow0KPiB9DQo+IA0KPiByZXR1cm4gMDsNCj4gLQ0KPiAtZXJyX2ZyZWVfaXJxczoN
Cj4gLSBhcm1fc21tdV9mcmVlX2lycXMoc21tdSk7DQo+IC0gcmV0dXJuIHJldDsNCj4gfQ0KPiAN
Cj4gc3RhdGljIGludCBhcm1fc21tdV9kZXZpY2VfaHdfcHJvYmUoc3RydWN0IGFybV9zbW11X2Rl
dmljZSAqc21tdSkNCj4gQEAgLTI1NTgsMTAgKzI1NDksMjMgQEAgc3RhdGljIGludCBfX2luaXQg
YXJtX3NtbXVfZGV2aWNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IGlm
IChyZXQpDQo+IGdvdG8gb3V0X2ZyZWU7DQo+IA0KPiArIHJldCA9IGFybV9zbW11X3NldHVwX2ly
cXMoc21tdSk7DQo+ICsgaWYgKCByZXQgKQ0KPiArIHsNCj4gKyBkZXZfZXJyKHNtbXUtPmRldiwg
ImZhaWxlZCB0byBzZXR1cCBpcnFzXG4iKTsNCj4gKyBnb3RvIG91dF9mcmVlOw0KPiArIH0NCj4g
Kw0KPiArIC8qIEluaXRpYWxpemUgdGFza2xldHMgZm9yIHRocmVhZGVkIElSUXMqLw0KPiArIHRh
c2tsZXRfaW5pdCgmc21tdS0+ZXZ0cV9pcnFfdGFza2xldCwgYXJtX3NtbXVfZXZ0cV90YXNrbGV0
LCBzbW11KTsNCj4gKyB0YXNrbGV0X2luaXQoJnNtbXUtPnByaXFfaXJxX3Rhc2tsZXQsIGFybV9z
bW11X3ByaXFfdGFza2xldCwgc21tdSk7DQo+ICsgdGFza2xldF9pbml0KCZzbW11LT5jb21iaW5l
ZF9pcnFfdGFza2xldCwgYXJtX3NtbXVfY29tYmluZWRfaXJxX3Rhc2tsZXQsDQo+ICsgc21tdSk7
DQo+ICsNCj4gLyogUmVzZXQgdGhlIGRldmljZSAqLw0KPiByZXQgPSBhcm1fc21tdV9kZXZpY2Vf
cmVzZXQoc21tdSk7DQo+IGlmIChyZXQpDQo+IC0gZ290byBvdXRfZnJlZTsNCj4gKyBnb3RvIG91
dF9mcmVlX2lycXM7DQo+IA0KPiAvKg0KPiAqIEtlZXAgYSBsaXN0IG9mIGFsbCBwcm9iZWQgZGV2
aWNlcy4gVGhpcyB3aWxsIGJlIHVzZWQgdG8gcXVlcnkNCj4gQEAgLTI1NzUsNiArMjU3OSw4IEBA
IHN0YXRpYyBpbnQgX19pbml0IGFybV9zbW11X2RldmljZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiANCj4gcmV0dXJuIDA7DQo+IA0KPiArb3V0X2ZyZWVfaXJxczoNCj4g
KyBhcm1fc21tdV9mcmVlX2lycXMoc21tdSk7DQo+IA0KPiBvdXRfZnJlZToNCj4gYXJtX3NtbXVf
ZnJlZV9zdHJ1Y3R1cmVzKHNtbXUpOw0KPiBAQCAtMjg1NSw2ICsyODYxLDk2IEBAIHN0YXRpYyB2
b2lkIGFybV9zbW11X2lvbW11X3hlbl9kb21haW5fdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCkN
Cj4geGZyZWUoeGVuX2RvbWFpbik7DQo+IH0NCj4gDQo+ICsjaWZkZWYgQ09ORklHX1NZU1RFTV9T
VVNQRU5EDQo+ICsNCj4gK3N0YXRpYyB2b2lkIGFybV9zbW11X3Jlc2V0X2Zvcl9zdXNwZW5kX3Jv
bGxiYWNrKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpDQo+ICt7DQo+ICsgaW50IHJldCA9
IGFybV9zbW11X2RldmljZV9yZXNldChzbW11KTsNCj4gKw0KPiArIGlmICggcmV0ICkNCj4gKyBk
ZXZfZXJyKHNtbXUtPmRldiwgIkZhaWxlZCB0byByZXNldCBkdXJpbmcgc3VzcGVuZCByb2xsYmFj
azogJWRcbiIsDQo+ICsgcmV0KTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBhcm1fc21tdV9z
dXNwZW5kKHZvaWQpDQo+ICt7DQo+ICsgc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdTsNCj4g
KyBpbnQgcmV0ID0gMDsNCj4gKw0KPiArIGxpc3RfZm9yX2VhY2hfZW50cnkoc21tdSwgJmFybV9z
bW11X2RldmljZXMsIGRldmljZXMpDQo+ICsgew0KPiArIGJvb2wgd2ZlID0gISEoc21tdS0+ZmVh
dHVyZXMgJiBBUk1fU01NVV9GRUFUX1NFVik7DQo+ICsNCj4gKyAvKiBBYm9ydCBhbGwgdHJhbnNh
Y3Rpb25zIGJlZm9yZSBkaXNhYmxlIHRvIGF2b2lkIHNwdXJpb3VzIGJ5cGFzcyAqLw0KPiArIHJl
dCA9IGFybV9zbW11X3VwZGF0ZV9nYnBhKHNtbXUsIEdCUEFfQUJPUlQsIDApOw0KPiArIGlmICgg
cmV0ICkNCj4gKyBnb3RvIGZhaWw7DQo+ICsNCj4gKyAvKiBEaXNhYmxlIHRoZSBTTU1VIHZpYSBD
UjAuRU4gYW5kIGFsbCBxdWV1ZXMgZXhjZXB0IENNRFEgKi8NCj4gKyByZXQgPSBhcm1fc21tdV93
cml0ZV9yZWdfc3luYyhzbW11LCBDUjBfQ01EUUVOLCBBUk1fU01NVV9DUjAsDQo+ICsgQVJNX1NN
TVVfQ1IwQUNLKTsNCj4gKyBpZiAoIHJldCApDQo+ICsgew0KPiArIGRldl9lcnIoc21tdS0+ZGV2
LCAiVGltZWQtb3V0IHdoaWxlIGRpc2FibGluZyBzbW11XG4iKTsNCj4gKyBnb3RvIGZhaWw7DQo+
ICsgfQ0KPiArDQo+ICsgLyoNCj4gKyAqIEF0IHRoaXMgcG9pbnQgdGhlIFNNTVUgaXMgY29tcGxl
dGVseSBkaXNhYmxlZCBhbmQgd29uJ3QgYWNjZXNzDQo+ICsgKiBhbnkgdHJhbnNsYXRpb24vY29u
ZmlnIHN0cnVjdHVyZXMsIGV2ZW4gc3BlY3VsYXRpdmUgYWNjZXNzZXMNCj4gKyAqIGFyZW4ndCBw
ZXJmb3JtZWQgYXMgcGVyIHRoZSBJSEkwMDcwIHNwZWMgKHNlY3Rpb24gNi4zLjkuNikuDQo+ICsg
Ki8NCj4gKw0KPiArIC8qIFdhaXQgZm9yIHRoZSBDTURRcyB0byBiZSBkcmFpbmVkIHRvIGZsdXNo
IGFueSBwZW5kaW5nIGNvbW1hbmRzICovDQo+ICsgcmV0ID0gcXVldWVfcG9sbF9jb25zKCZzbW11
LT5jbWRxLnEsIHRydWUsIHdmZSk7DQo+ICsgaWYgKCByZXQgKQ0KPiArIHsNCj4gKyBkZXZfZXJy
KHNtbXUtPmRldiwgIkRyYWluaW5nIHF1ZXVlcyB0aW1lZC1vdXRcbiIpOw0KPiArIGdvdG8gZmFp
bDsNCj4gKyB9DQoNCnBvbGxpbmcgdGhlIHF1ZXVlIGRvZXNu4oCZdCBnaXZlIHlvdSB0aGUgYXNz
dXJhbmNlIHRoYXQgYWxsIHByaW9yIGNvbW1hbmRzIGFyZSBjb21wbGV0ZSwNCkkgd291bGQgdXNl
IGFybV9zbW11X2NtZHFfaXNzdWVfc3luYyBmb3IgdGhhdCBpbnN0ZWFkIG9mIHRoZSBhYm92ZS4N
Cg0KcmV0ID0gYXJtX3NtbXVfY21kcV9pc3N1ZV9zeW5jKHNtbXUpOw0KaWYgKCByZXQgKQ0KICAg
IGdvdG8gZmFpbDsNCg0KPiArDQo+ICsgLyogRGlzYWJsZSBldmVyeXRoaW5nICovDQo+ICsgcmV0
ID0gYXJtX3NtbXVfZGV2aWNlX2Rpc2FibGUoc21tdSk7DQo+ICsgaWYgKCByZXQgKQ0KPiArIGdv
dG8gZmFpbDsNCj4gKw0KPiArIGRldl9kYmcoc21tdS0+ZGV2LCAiU3VzcGVuZGVkIHNtbXVcbiIp
Ow0KPiArIH0NCj4gKw0KPiArIHJldHVybiAwOw0KPiArDQo+ICsgZmFpbDoNCj4gKyAvKiBSZXNl
dCB0aGUgZGV2aWNlIHRoYXQgZmFpbGVkIGFzIHdlbGwgYXMgYW55IGFscmVhZHktc3VzcGVuZGVk
IG9uZXMuICovDQo+ICsgYXJtX3NtbXVfcmVzZXRfZm9yX3N1c3BlbmRfcm9sbGJhY2soc21tdSk7
DQo+ICsNCj4gKyBsaXN0X2Zvcl9lYWNoX2VudHJ5X2NvbnRpbnVlX3JldmVyc2Uoc21tdSwgJmFy
bV9zbW11X2RldmljZXMsIGRldmljZXMpDQo+ICsgYXJtX3NtbXVfcmVzZXRfZm9yX3N1c3BlbmRf
cm9sbGJhY2soc21tdSk7DQo+ICsNCj4gKyByZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQoNCkNoZWVy
cywNCkx1Y2ENCg0KDQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIZBEbzV/Wl2jgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 14:23:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3EB4F6549
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 14:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303561.1576887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLKDh-0005xg-RZ; Fri, 08 May 2026 12:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303561.1576887; Fri, 08 May 2026 12:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLKDh-0005vn-Os; Fri, 08 May 2026 12:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1303561;
 Fri, 08 May 2026 12:22:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wLKDg-0005uv-2S
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 12:22:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLKDf-009iXw-4R
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:22:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fdd572-bab6-0a2a0a5309dd-0a2a450b8786-14
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 14:22:14 +0200
Received: from [52.101.66.43]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fdd575-212f-0a2a450b0019-3465422bafcf-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 14:22:13 +0200
Received: from DU2PR04CA0192.eurprd04.prod.outlook.com (2603:10a6:10:28d::17)
 by AMDPR08MB11411.eurprd08.prod.outlook.com (2603:10a6:20b:717::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 12:22:11 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::fd) by DU2PR04CA0192.outlook.office365.com
 (2603:10a6:10:28d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Fri,
 8 May 2026 12:22:11 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 12:22:11 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB9463.eurprd08.prod.outlook.com (2603:10a6:10:42d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 12:21:06 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 12:21:05 +0000
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
 b=wBfhKe/BXq7Pg65qnWeUwKpOf+nZtSWWIZuY5qQhPNTlihu00Z2yUubJEV2cbM51LeTX+0bUpnLB4q5EauS25DAX8UQsr4z2F74DjfAUgprKVQfnsHpnIQGg07X71aGDV/1zkmaVLLx/Q3+5eEfFuO6uC47uQP6hBVIAM4EgaaZp7fPEecGOO3L9UQLYFgXdxH6DuC0z6kwfe1ZkyimuZYpckCG7zn9z4bC0+MC/wWmrh61NSQX861lnM6sjCJPb7U8xL90gIhIRQVPlZZiSu8VrBKvyDEUcFNTlBZ1hmB1oJGXoKLGM/x7uBAtbAXQz3IHeUsPMLZgnAXoDlNdSVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wf0JaJBKE0RAKiGaPOhcJUVQ94p3+JHF0ZQ9XWx17YI=;
 b=XcDxs43iRJW9aOUTMK3N2nRFaxuBadxeqovSz5BHEgPNAVjbBqCZCBFeAoM1AQRI/eo+Okb2kGlKn6YgSDx6OQJ5w+r5SrYM7n8srdnM2K0hjCD0FaBhwV5Zu3Wy7i2qu7DhkFHcvNdbU050aWFL+odw8AFTLNpXfhNMTnaUZPcX0r4y+V64uiRh1t0xEhB16PwC/V7JxRP7s5w4ZYusRvsge6rOPbcWZUNrnVNX2IOwF5dgBIKwThco92hIPvuIO9A9eIXGBfWBtyvmN6U7s+ZB7Htt2B3znnBgYoqbSC0aFgdIV4yIyjT4lpBFvXDjnVOqsjmifS4S7quAspXZnQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf0JaJBKE0RAKiGaPOhcJUVQ94p3+JHF0ZQ9XWx17YI=;
 b=gbnaNSPPwATeUI1alwIDdY+WdnarsOHBF5YkNKGWPCpf7qCxbWg/SCUwjxBLacRqh19797HPRIq9WkYwwrY9vPQxgSwfrjBgXL6bm278lhNY3RVRxTQL5pMQJqqMCElaXbA2dTMzhAD+J4dqOJDtpI08ktKoMcUADaNFNLwBdes=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSSO2CYNCSeqxo18qF7wjC+BQ+MRMKd8jMaRhfdwnPBZXlXwS4CsfjdPF16TWsYSdXhm43KzRuhWcaWLsxJjZ5ltIhNOn8kPyH+ijSCanOmstiACwJ0PpKJ3TzeeWk8OV38jkTCYATNh5ASCtSiDcHs6FL9HMsIQxlTj8QShsyNcmqYgTaxClyubnNqrC59UKPZh+qk3XRNbx5bxrK3xsWzaJNQNf4Jpld+3Nn9TyCdyYwLuKOdmtD9FPt2c6A4iT2OM1L0GD0lcLVydhOuIc8Zsg+mXALzeGzbYKKuOjxJvpwAgyV1bg73YejJYvEyMcqnSt8bksn1y/0Gd2eYbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wf0JaJBKE0RAKiGaPOhcJUVQ94p3+JHF0ZQ9XWx17YI=;
 b=T8ZuARX0ItsdeNiZZ+841/XWMe7O5Ohph8ZEctv76gWVjxfPFblwX3XhYeBDm7KRlX0ObLly4PGZlkjD4UcCZeBOk9ychP24S0Yauv9nLVSga2RR+K0MS9yIUAi5hgGPwUAlKKe1eQlGpTgD9RL1LtnXgLcWpcOoHD0IO4QO8lc2nborFyJm0V8St1DDyR23biL6J1Q4XqwE3szBmpmZNwx1CmoGXpYok0boJuCBeiaq51yMihgfDdZIflUtvmnY80eVoxbFa30LqUGuCjcTtclZAbdOnJJ9lMopNiOE8O85rtfo7EzFBrEXvkZ7ofButBmBLa3fQX9ez/RD2Uwluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf0JaJBKE0RAKiGaPOhcJUVQ94p3+JHF0ZQ9XWx17YI=;
 b=gbnaNSPPwATeUI1alwIDdY+WdnarsOHBF5YkNKGWPCpf7qCxbWg/SCUwjxBLacRqh19797HPRIq9WkYwwrY9vPQxgSwfrjBgXL6bm278lhNY3RVRxTQL5pMQJqqMCElaXbA2dTMzhAD+J4dqOJDtpI08ktKoMcUADaNFNLwBdes=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
Thread-Topic: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
Thread-Index: AQHc1k50BMsvUkAtf0yXvEOre8XAa7X/maIAgASD5YA=
Date: Fri, 8 May 2026 12:21:05 +0000
Message-ID: <6E040BE7-0133-46AE-8B5C-85EA02704285@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <038337ec0e3f1474c6cc6a92090e28c6972e4dc6.1775125380.git.mykola_kvach@epam.com>
 <F5384D51-933E-48E6-AE7E-B54022AEAE11@arm.com>
 <CAGeoDV907jTK5RsN51ezapA5inhvG1jWpeybbqF=LkxWcEGnbQ@mail.gmail.com>
In-Reply-To:
 <CAGeoDV907jTK5RsN51ezapA5inhvG1jWpeybbqF=LkxWcEGnbQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB9463:EE_|DB5PEPF00014B9E:EE_|AMDPR08MB11411:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ede8a7-0907-41a8-66d8-08deacfc6e45
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 Z1ypXST/ke6KOUR3r6C/+J/mu0fGGdf5O3+Usy0iyOYEpQ5frwoPwqYj3pFv+2RV03LVG+33ChkQ2HveGRZ9EECsSScpZQcvskabgnaHaBgy3LVMAoG62wkJuG5tF23ZJqbvyjLv61N5aIvsu9PcvSvBEkgxIAkBq9EtzpmP5SO5ktFjlZgVLNFoAnC+qhqgV+xOY8+xSDe5uvkm/FfHoC0Rx0xG/TUOeYz5EUEw91gPnNliniNHrodFmJzRA0LnAqsHqyAOQ8ByNHaChMafPTjTTH6WhtnU+DzPhVCwaF6dIQr3JsMmOqxG3nXwRzccD3muX6237PrlnnzrVo+zGMX9ZReUwMaiUqXHyr8uYYwiVhUC3+31NCqFa23v89ZMhcTvfKtZ9/LpZGR19JyeJzN9wEbOe4r5Q4KLvXpz4aAkz9nkzqiRmOnaMts8CYyJ07JJTR4QVr6qlO5RXZnpmTcQqW6FtST+fulrw3nh8G4rxH7E+jd3CgGiTmHhsTkTUpJUobFuEuyf8knfbGEbWW+LxfZHjwCFcfoIuPNt3ZksTTUQw+NzLnCsZaeXdx1cJS8E4xpGJIWXW5k3VvhLnQMLIrAT0o8ArsNz1v0eChQb14bcYap4c+NandbnaKT1gPhvmwQNqcc4oKsZ78JkBtwVoMJ0NECx4nwO83JNyIXoDobrEiD+Oji1QwxYwhkYbwZyw79QdA36MPQXuEPia8vnRZ0mc+aI7SwGEVOfhlA2EW8OtFd9jMvioeUkxhas
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0F84952B5B2094A815CF59D431B3EFD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 WrZWfiJOxdKsCRAFzyFQXvDK7x2tX9+SWqF1jkuZ9kV1mOJ+2OXcPaALVed6T93LOO4BdrfvaQqU/dMly9HZ8VTQDfDrLmIVyMC2bv50D5tnaxe1+vOB5QfVzA5H9i6ZSjzC59uxKiz6C1q03Klh8GBjFTDR5IGX16aCd8TC/zfOFLHF7f5t8ON5V3zP+TtgE1MC2XZ/DxjjytFy8QmMVGujle5kVMVQavw088vIFSEJ5SzOuFB4Tg/ZMGA6zGCUEFhXMxU2vB+SbMnQlG0XaLyYkgCPDxpFR9G1esAPea2p6X/Bac0L2OxSg+dqYSz21QOvmT0hflUpfOhQDFMR4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9463
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	33e35064-f4b9-48a2-9fbe-08deacfc4715
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|35042699022|36860700016|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SR5ZatuIpAJmOUlS1wdOhqXs76PCfsGUxAx23VqGbvbQeOBarJ9wxB4iG3aRItT09CZ+tDEkQKGrZ/EcloNazqybspZkyw7nsuSCKGA4PVe0Ck/KYRtzytLikk6sSUw+eK+X1jIQFmdI5xmzRbOopDiQol+Ahe3WiJIA+WrW7SAGgHLqHCyLX8DqIaUb35u4qxsJpvmp8Bdq7heDO8gZdrY7K0hnBgqx8kZ705UdMC5JUDOQCpnEAF3Y7V7noVu2qAtkam9Bp4+GyB5gykrVaxJSz4FucrfYUmO0y+SlATwDK26stlPaXt25GuEp7h9Dj1/eCSxDxcj4XySptccH6NIV2yQhA0Q2vW84xpaudGAF0QucygW4YSffnqFdYYEo1vbQP9wX2NSncs6+uAXyLG79kyTbpao82LiHEE92h7itdaaNE4CBNvTcJEAOJjNiFnfi4qtcbo6pc4zE8aPClJTJI3ROWgfYyW/Xmk4uoXsOmabmR7IKKFtS6wdqs1q0lKLXrj7FdS53pIrPFpOlOv3i/klOd3dEOP1xcC9YKxWl3+/kIBJygXz3/cjWXcnNOxSpGrFHsrAca5oxdgJ44R7vJ2uLohqJS2QiR+hTbRTl5gkYzUAEwWn+T5QRIXB0oN1Y6PgluRPd/mgg+bR8Qi8huaU/lgV2TaEkHfFFqj7IYs97iVZu+qsR7WXqVOf02jBnePf9P53nHyv4jNRIcPaMAWXsyz4wu9l3/qYdVLrgYhBqHYWJKTN5AN7J8wgt
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(35042699022)(36860700016)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8J5c6MPthQh3qoz1SYLJOOifPI9aek3Q9a8so32CDj0lv7Erz5wDCY+4J1pqrcUdjwVv6hr/gHh18LKEMCARO1kfzaqTu/7pXFVBo359nNbM0RmFB5PibcT1+1EHquaAkfo34blEQjg7pVLADSkv+76UTXyczLSpJcYOG1zIDm9I85+TKvSvH4bfYXYyZcLPAuu1AIg/MX7LbE/FUi3mod1h3xL++/T8fLUbwVOIG7XrAWUGzxsNX5UJq+JhFAgWCpeX8n+AOhZHL2bdRLx+y99H630TDY6X2sxNBsZfmKiFydaX1VGXOaGDZ7uG8/auHZ8vJxAeLYyug5CPUPIN0gJzKSwFj7zWsJwyPwwDnjPhXA1Am1jvOHV3OsG+otMzrUfN+p19It/eq0AsK2CYV0JRvOAP4pJ0hblw1AB2UYkTu/o4BzmFApmsfgv8kAq1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 12:22:11.3907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ede8a7-0907-41a8-66d8-08deacfc6e45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11411
X-purgate-ID: tlsNG-42698a/1778242934-1A772F3B-88D8A0F0/0/0
X-purgate-type: clean
X-purgate-size: 2804
X-Rspamd-Queue-Id: 4C3EB4F6549
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

SEkgTXlrb2xhLA0KDQo+Pj4gDQo+Pj4gLXN0YXRpYyBpbnQgX19pbml0IGFybV9zbW11X2Rldmlj
ZV9yZXNldChzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11KQ0KPj4+ICtzdGF0aWMgaW50IGFy
bV9zbW11X2RldmljZV9yZXNldChzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11KQ0KPj4+IHsN
Cj4+PiBpbnQgcmV0Ow0KPj4+IHUzMiByZWcsIGVuYWJsZXM7DQo+Pj4gQEAgLTIxNjMsMTcgKzIx
NjYsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBhcm1fc21tdV9kZXZpY2VfcmVzZXQoc3RydWN0IGFy
bV9zbW11X2RldmljZSAqc21tdSkNCj4+PiB9DQo+Pj4gfQ0KPj4+IA0KPj4+IC0gcmV0ID0gYXJt
X3NtbXVfc2V0dXBfaXJxcyhzbW11KTsNCj4+PiAtIGlmIChyZXQpIHsNCj4+PiAtIGRldl9lcnIo
c21tdS0+ZGV2LCAiZmFpbGVkIHRvIHNldHVwIGlycXNcbiIpOw0KPj4gDQo+PiBXZSBhcmUgbW92
aW5nIHRoaXMgb25lIHRvIHRoZSBwcm9iZSBhbmQgLi4NCj4+IA0KPj4+ICsgcmV0ID0gYXJtX3Nt
bXVfZW5hYmxlX2lycXMoc21tdSk7DQo+Pj4gKyBpZiAoIHJldCApDQo+PiANCj4+IGNoYW5naW5n
IHdpdGggdGhpcyBvbmUsIGJ1dCBhcm1fc21tdV9zZXR1cF9pcnFzKCkgYWxzbyBjYWxscyBhcm1f
c21tdV9zZXR1cF91bmlxdWVfaXJxcygpIHdoaWNoDQo+PiBjYWxscyBhcm1fc21tdV9zZXR1cF9t
c2lzKCksIGFyZSB3ZSBzdXJlIHRoYXQgb24gcmVzdW1lIHdlIHdpbGwgZ2V0IHRoZSBzYW1lIHN0
YXRlPw0KPiANCj4gVGhpcyBmb2xsb3dzIHRoZSBzcGxpdCBpbnRyb2R1Y2VkIGluIHRoZSBMaW51
eCBhcm0tc21tdS12MyBydW50aW1lL3N5c3RlbSBzbGVlcA0KPiBzZXJpZXM6DQo+IA0KPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS8yMDI2MDQxNDE5NDcwMi4xMjI5MDk0LTEt
cHJhYW5AZ29vZ2xlLmNvbS8NCj4gDQo+IFRoZSBpbnRlbnQgaXMgdG8ga2VlcCBJUlEgaGFuZGxl
ciByZWdpc3RyYXRpb24gYXMgb25lLXRpbWUgcHJvYmUgc3RhdGUsIHdoaWxlDQo+IHJlc2V0L3Jl
c3VtZSBvbmx5IHJlc3RvcmVzIHRoZSBTTU1VIGhhcmR3YXJlIHN0YXRlIGFuZCByZS1lbmFibGVz
IGludGVycnVwdA0KPiBnZW5lcmF0aW9uLg0KPiANCj4gWW91IGFyZSByaWdodCB0aGF0IHRoZSBN
U0kgY2FzZSBuZWVkcyBleHRyYSBjYXJlLiBJbiB0aGUgTGludXggc2VyaWVzIHRoaXMgaXMNCj4g
aGFuZGxlZCBieSBhcm1fc21tdV9yZXN1bWVfbXNpcygpLCB3aGljaCByZXN0b3JlcyB0aGUgU01N
VS1zaWRlIE1TSQ0KPiBjb25maWd1cmF0aW9uLiBJIGRpZCBub3QgcG9ydCB0aGF0IHBhcnQgaW4g
dGhpcyBwYXRjaCBiZWNhdXNlIFhlbiBTTU1VdjMgTVNJDQo+IHN1cHBvcnQgaXMgY3VycmVudGx5
IGRvY3VtZW50ZWQgYXMgdW5zdXBwb3J0ZWQgYW5kIGlzIG5vdCBwYXJ0IG9mIHRoZQ0KPiBzdXBw
b3J0ZWQvdGVzdGVkIHBhdGgsIHNvIHRoaXMgcGF0Y2ggb25seSBjb3ZlcnMgdGhlIHdpcmVkIElS
USBwYXRoIHVzZWQgYnkgWGVuDQo+IHRvZGF5Lg0KPiANCj4gSWYgWGVuIFNNTVV2MyBNU0kgc3Vw
cG9ydCBiZWNvbWVzIHVzYWJsZSBpbiB0aGUgZnV0dXJlLCB0aGUgcmVzdW1lIHBhdGggd2lsbA0K
PiBuZWVkIGFuIGVxdWl2YWxlbnQgTVNJIHJlc3RvcmUgc3RlcCBiZWZvcmUgSVJRX0NUUkwgaXMg
cmUtZW5hYmxlZC4NCg0KSW4gdGhlIG1lYW4gdGltZSBzaG91bGQgd2UgY2hlY2sgbWF5YmUgc21t
dS0+ZmVhdHVyZXMgZG9lc27igJl0IGhhdmUNCkFSTV9TTU1VX0ZFQVRfTVNJIGZsYWcgYW5kIGRv
Y3VtZW50IGl0IGluIGNvbW1pdCBtZXNzYWdlPw0KDQpXaGF0IGRvIHlvdSB0aGluayBhYm91dCBp
dD8gSeKAmW0ganVzdCB3b3JyaWVkIHNvbWVvbmUgdXNlcyBDT05GSUdfTVNJIGFuZCB5b3VyDQpm
ZWF0dXJlIGFuZCBlbmRzIHVwIGluIHNvbWUgdHJvdWJsZSwgd2hpbGUgd2Uga25vdyB0aGF0IHlv
dXIgZmVhdHVyZSBicmVha3MNCkNPTkZJR19NU0kuDQoNCk1heWJlIHRoZSBtYWludGFpbmVycyBj
YW4gZ2l2ZSB0aGVpciBvcGluaW9uIGhlcmUgYXMgd2VsbC4NCg0KQ2hlZXJzLA0KTHVjYQ==


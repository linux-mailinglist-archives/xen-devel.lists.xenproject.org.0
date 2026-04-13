Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAQHJsT63GnXYgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:16:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C625A3ED327
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281180.1564206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCI5L-0003wQ-OC; Mon, 13 Apr 2026 14:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281180.1564206; Mon, 13 Apr 2026 14:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCI5L-0003ut-LU; Mon, 13 Apr 2026 14:16:19 +0000
Received: by outflank-mailman (input) for mailman id 1281180;
 Mon, 13 Apr 2026 14:16:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCI5J-0003uU-PK
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 14:16:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCI5J-003Um2-1o
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 16:16:17 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcfaa7-2eae-0a2a0a5409dd-0a2a4502a5d6-22
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:16:16 +0200
Received: from [52.101.83.49]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcfab0-42fa-0a2a45020019-3465533124ca-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:16:16 +0200
Received: from AM9P250CA0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::6)
 by AS8PR08MB6101.eurprd08.prod.outlook.com (2603:10a6:20b:29a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 14:16:13 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::70) by AM9P250CA0001.outlook.office365.com
 (2603:10a6:20b:21c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 14:16:13 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 14:16:12 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA6PR08MB10417.eurprd08.prod.outlook.com (2603:10a6:102:3cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 14:15:08 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 14:15:08 +0000
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
 b=VeggpSkADjoJX9UgixV1BSOLxoVxpB7xcR6tKCfTvWqt6QqJiomxBz90XTk/7Soa0LA+J3vp0DnwQBuXVD5aJE8V05rJsnjt+WTcBnWyTBuZQHSeuTRxUt/Jt67mg40stdOcr/gZAGWwDlfm+k1N0/wasR0QmIJ/m67Q9b4/PmOFUGwBl/ep8IPg+0zEj13zqA516sDmgGQWxMp1NWXeXKr1lp9SD0ME9ImSz4PSnIWo6FcPQQ0e+wQhGc2RJJZVInd5QDGI0uFFehVsqhgd7CLwJmmf0PIrdO0Ro7yNVlawoBj7fkY2dfHIqur4eQwcG9mXEMJaKI1CC31LNH4AAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZLZQdTkKwWkK4TbcgQ8zuEaVJVDCFbrEW8fwYaWNY0=;
 b=lCK0PdwyJQq9rYnw6T907Tg7/t/grsP2/tRyCPJScwCr36n/brzB2zlx4djb4vzEbLz6cbJqWyAsvFzhT7NyUaRlzeATGQ0bu59wxibaA41mNcLH9MqdGGaMkkCDciHQ3FWnLpyCSOf+6seAnh3ClmP5AibJVf5v+7V3lQk2pXw034nOy2WXBTKUO32r1VQANhw+DrZ5ueH/PvpwexBXjw9MYbW96sIXJ3DClI3ecMPuj+DDMKDFUNwnL08PTuw2nKaHNqXWfmwXFQRjunCBPGQBvg0Z/qn+I6P+8wYFoOuON6F2QpUr8Hdu1PZ1gm3wlyf3DjXM4lDdkETHjtBemg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZLZQdTkKwWkK4TbcgQ8zuEaVJVDCFbrEW8fwYaWNY0=;
 b=nk7jkR2R6zKBA2sBlm3vXEA2tcMCZN+P/3JtgF0YL8VGu+OSqGOgdmKvSMVcBaPwYIpjnyzHjxEiv/bXnp4cla1c9CkWj0iz5D5p9c69CFH/yOU1cLb5bCaMp4OzrZh5I8VoXW2aRY6qvmUnUa5/CLIjoqIsB0KYhZkq5nnXqlY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrNcMBrxCTjIHd+u+51j78ue4sI9+RIU4k53WwB69ektqSJdaHZAk9Nq2nSZTlNQ+glG/iGGS6Uv5NYZ98ADdRo+Op2D3X0AE6vTKrNGMosfq4R+iPkhpfddN5aWwZ/yruyYoirgCCqgBtCiiBJ+rioN9gqRXz6G/j6OjQyXASCZkj6bT+WV5lnzMj7EZT5j/SqrE8E0ZqLHagm/bydd1kQyGMnVyQftSXFXAzC5sfZZ57u30jZOeasieUBkxpk6lDUGP/jiqLofp8mvSBU8aI2NWA9Riw/h4l8AednsqRMTXRGg/HuDVZ4rOEkJW0+z/BVwts4nzx4bTIXIAY6B/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZLZQdTkKwWkK4TbcgQ8zuEaVJVDCFbrEW8fwYaWNY0=;
 b=AWpZ2tpdUV/c73l4px/O/z+HINgC2VIBGz0HBSZ/SXaaq4/zzO5ZAnM6/Oa7v4g0V6ZI64N3x5FXte4VNgszsZd2Omqo1SN8In1V5HVsK/055yBTXJkf3AKYs54WXuFziWI68NYfASUc31p/THO9sQBkgtrYdzSz9iCRfggSMypQLe+jCxC+oZcys15/6jzkcHrQg/su3qWVon+ogSF2WZ1ERKusuc6ztzjrvTLhAk4zY3xH5E5FIu185TipTjHiVsUeCDNVAf/DprrBxmi47Wpc+FoRl2y2YFEZMOaaW5Ef1vRtsiY64nLGUmn7w9lFp9vOrsYe2zHpUrfk8wthdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZLZQdTkKwWkK4TbcgQ8zuEaVJVDCFbrEW8fwYaWNY0=;
 b=nk7jkR2R6zKBA2sBlm3vXEA2tcMCZN+P/3JtgF0YL8VGu+OSqGOgdmKvSMVcBaPwYIpjnyzHjxEiv/bXnp4cla1c9CkWj0iz5D5p9c69CFH/yOU1cLb5bCaMp4OzrZh5I8VoXW2aRY6qvmUnUa5/CLIjoqIsB0KYhZkq5nnXqlY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 18/23] xen/arm: vsmmuv3: Add support to send stage-1
 event to guest
Thread-Topic: [PATCH v3 18/23] xen/arm: vsmmuv3: Add support to send stage-1
 event to guest
Thread-Index: AQHcy0/uQpbP6nU2r020PGJaL0V6Mg==
Date: Mon, 13 Apr 2026 14:15:08 +0000
Message-ID: <DFFDC382-6762-482F-A620-0DE46295B027@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <51e727a521f25c3eb83b374529c8632fb8b2f314.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <51e727a521f25c3eb83b374529c8632fb8b2f314.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA6PR08MB10417:EE_|AM3PEPF00009BA2:EE_|AS8PR08MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: e296eb19-365c-4cb8-a047-08de996737b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 x7auLZvI2V9Reu4t6TGAlFQU3rBDNyogmjD9X71163jS7TNoFyJiNL+gmh4ctffYvg0Eo6glLzL5TllVBDcevh4pT2fzl/dCZQwRepH9dMVbAx8PjD+JK2l1UjFfKqbA3iVvUOV7qQSdct92XieLCt1f/tAbwGrx94qRlM2DrRJ7xE0hAer97aVJ7t7B4DXwX34i3NX7nzr50yPQzwYU+Yjp+rNLeHfkpblpLsaBvtTEsHJ/3A+gBBefyVCmBvireeuVG0DWmzKsAgHhhaEF3oHSdGXFsXqOrNT7Xia/8uCyhuLM8NE9aQlGnDZIYh29/cgK1CpTyQE03WBj9pnOTpT0HRvWgTKTnI7w9Opq+tiJdgakV2cxwsuRuLGj+nMxkQ1nas4+6s+tfuhx4p8YRKzJRGl+vfAVZaXN+Yve6NuSzkeBQGO8owB0SVSTHUKcr/WXs+pTyJnJq8691Q1CUoESVF51qHA/AkgARGVJ50noq5fGNJiAWF+ZoXzZaPjbySDVuiklJUb1JrDvyIFtJzwGvO1URhbyHiLJZK12NYC4XZMB3Yo6NsIyLarBo8roU+i8R46X2k5XXUM3UMkXHAbp9E+xJQiWvFzPPI4jTIFFShpyTFlJVtpAHhqebUW3CmWBLdkZusIaELCxbBBPZFjPY0dkMqsL9JlK9XAXyVDyoz0XbzO9CZmqa5YEclc1+/estyrw7CvlEAU7rcJvZ2xm2mdk44gbR81mlshm1Lg7G0OwEgo0Ed0xAVwiouvp2Ix/pQqHGyB894YoRr5QUSb1TRHXK0abQed8QAqNm4I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C5460A2116DD34C9FEC0DB0741AF301@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 uyvmWT56UZYpa/y/BceWUTbN/tjt0qrXuosMELp7vt5DklvPVPTmSW/iXgWRmA6lYqILiiLXtBJ0Gttfq9UkCXDJ3Bv3I+3+HOzAA06xD+1113LuKNY5a2GI1I6tl/7WxWAHUpncwhCnw7hD75fEXTnOp5eqt4gWznvsXN3RRdKDTar60leLIorvFncHsm+xPGDDfwmCiXagloHENgDbj0WHu323ISMP4Lxq/3WbfiiY5t4yAgija29LsepaO8t03//coUA7AfPf0arlpUforgNDWzqc61OI7T2F65i5ngr5aVhqivWbphhLZdPXSAuDnwM00LYb8HfvVxyUzO9mkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10417
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f34c1ea-cbef-4a21-8fc2-08de9967117d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v5Y+/1o+rlzuVkaK2z6UsNHGbjtnoSqU6G4JFWZMmpb4Qi6Bn7+554lnMoX5yAb56ff1ZvZCUghHXlO2t5W2jdOti+A/w6h9wYdzTzaTMJSHzm9D8rOrRVBLgB11OCdQ0gP4uiIDh8uhvEUKRmFfNfS87xPxmgnKuhdBHkn0iyfHIfcjmaqdNKF52zul/JySXgMUia9Dry9VlRO/dU1oA0T5Zhb1gTsDd5ZSiEelx/oawxzaEFFztlJqGtDCFFBhRhzsqIlnqxzPPkMhrzUP1MMUQu5aApJywmKFFJAOofUp+78L6BM+zdvUwvzCoCb/M1W5TKdzk6VugUdRJG4R6dNNHDyiMfpBDQ2u6A1tcJ2499MSWbPfQXVKH7anb2lO8akkwscePZI0vsRl3Bm5sh5j7Kyn7nOIVuT88bMlYixYwy8YLfRfAzt1zM2s0k6AC/B6xLEdrc5WbM7gEiIi4U2E75S0EB+uBtJE7lwp5QRyLvPGce8lU/v3C5+b3SuXQrCMrvabo/F4h85B/O935TxRFLqHjwKFf8+YRslVANdq4teX+65et1CE9vhWGcKuCdK2r9az/L1nkkbqY4dxg+J2QnoJwbGkDnvbLAjtsDMCT4kE+vwdtYesy3V7dZcEPRKvTfnmnFsXJ6fkvLv6TJ/b43I8vW+gTmIgTF67wkI6Tw8/UwYxL5m09XoaGdbJnJhXhHdXNlCMfIq+j1/tbbMAVoQaTv72TB/1Qn6daWBj0p87cIQBI2sKyAgiKWkk3xcmENTTxHmOdGUsCJ9lBA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TRNRaDDKHXZT8swoKrYPXe84VzpS9qJK5v6LCYBGcLpM0BlFfp6khMlxThymjKV4ocHtju47JTLp4qEdOPM38YR5yLqNokPSejDcfb+IMpdsSydZ/u9r+zklOdfZqndVhHDm/iIYAPgIwzNeTdWN2p2xEz6wHOIOJfi3odt8pfA/y1Iuu89dlcteQDNFHHXlXIhotPjnaTJijs6G4mTuomeMH1HvkhUCEqIlUzgzSHWvIitHEdMhOfzAiE/SNtMTQLeBfhkaBjIYfIoFz7J06Vf6gvac7cd7MIBwn/e2G3lk2XelL+QRWCnHaXZZpsnVdJq7Sf6NjE5xdJBjc29sWT6aQRtsmfCjYnbjUbJR8m9jp8DXkXZrWmd/c0NoaQydi6dG2rITU8pjo5r3JXaxd96RU9MXNQK3kvprpeDtJwou1afxlGAcU+uUszdsA3Xd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 14:16:12.7532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e296eb19-365c-4cb8-a047-08de996737b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6101
X-purgate-ID: tlsNG-720697/1776089776-47122CD1-FAB0F649/0/0
X-purgate-type: clean
X-purgate-size: 8138
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,epam.com:email]
X-Rspamd-Queue-Id: C625A3ED327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SEkgTWlsYW4sDQoNCj4gT24gMzEgTWFyIDIwMjYsIGF0IDAyOjUyLCBNaWxhbiBEam9raWMgPG1p
bGFuX2Rqb2tpY0BlcGFtLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBSYWh1bCBTaW5naCA8cmFo
dWwuc2luZ2hAYXJtLmNvbT4NCj4gDQo+IFN0YWdlLTEgdHJhbnNsYXRpb24gaXMgaGFuZGxlZCBi
eSBndWVzdCwgdGhlcmVmb3JlIHN0YWdlLTEgZmF1bHQgaGFzIHRvDQo+IGJlIGZvcndhcmRlZCB0
byBndWVzdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBh
cm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWxhbiBEam9raWMgPG1pbGFuX2Rqb2tpY0BlcGFt
LmNvbT4NCj4gLS0tDQo+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMgIHwg
NDggKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL3ZzbW11LXYzLmMgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysNCj4geGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYXJtL3ZzbW11LXYzLmggfCAxMiArKysrKysrDQo+IDMgZmlsZXMgY2hh
bmdlZCwgMTAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS9zbW11LXYzLmMNCj4gaW5kZXggY2Y4ZjYzOGE0OS4uNGMxOTUxZDc1MyAx
MDA2NDQNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KPiAr
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jDQo+IEBAIC04NjksNyAr
ODY5LDYgQEAgc3RhdGljIGludCBhcm1fc21tdV9pbml0X2wyX3N0cnRhYihzdHJ1Y3QgYXJtX3Nt
bXVfZGV2aWNlICpzbW11LCB1MzIgc2lkKQ0KPiByZXR1cm4gMDsNCj4gfQ0KPiANCj4gLV9fbWF5
YmVfdW51c2VkDQo+IHN0YXRpYyBzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVyICoNCj4gYXJtX3NtbXVf
ZmluZF9tYXN0ZXIoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSwgdTMyIHNpZCkNCj4gew0K
PiBAQCAtODkwLDEwICs4ODksNTEgQEAgYXJtX3NtbXVfZmluZF9tYXN0ZXIoc3RydWN0IGFybV9z
bW11X2RldmljZSAqc21tdSwgdTMyIHNpZCkNCj4gcmV0dXJuIE5VTEw7DQo+IH0NCj4gDQo+ICtz
dGF0aWMgaW50IGFybV9zbW11X2hhbmRsZV9ldnQoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21t
dSwgdTY0ICpldnQpDQo+ICt7DQo+ICsgaW50IHJldDsNCj4gKyBzdHJ1Y3QgYXJtX3NtbXVfbWFz
dGVyICptYXN0ZXI7DQo+ICsgdTMyIHNpZCA9IEZJRUxEX0dFVChFVlRRXzBfU0lELCBldnRbMF0p
Ow0KPiArDQo+ICsgc3dpdGNoIChGSUVMRF9HRVQoRVZUUV8wX0lELCBldnRbMF0pKSB7DQo+ICsg
Y2FzZSBFVlRfSURfVFJBTlNMQVRJT05fRkFVTFQ6DQo+ICsgYnJlYWs7DQo+ICsgY2FzZSBFVlRf
SURfQUREUl9TSVpFX0ZBVUxUOg0KPiArIGJyZWFrOw0KPiArIGNhc2UgRVZUX0lEX0FDQ0VTU19G
QVVMVDoNCj4gKyBicmVhazsNCj4gKyBjYXNlIEVWVF9JRF9QRVJNSVNTSU9OX0ZBVUxUOg0KPiAr
IGJyZWFrOw0KPiArIGRlZmF1bHQ6DQo+ICsgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiArIH0NCj4g
Kw0KPiArIC8qIFN0YWdlLTIgZXZlbnQgKi8NCj4gKyBpZiAoZXZ0WzFdICYgRVZUUV8xX1MyKQ0K
PiArIHJldHVybiAtRUZBVUxUOw0KPiArDQo+ICsgbXV0ZXhfbG9jaygmc21tdS0+c3RyZWFtc19t
dXRleCk7DQo+ICsgbWFzdGVyID0gYXJtX3NtbXVfZmluZF9tYXN0ZXIoc21tdSwgc2lkKTsNCj4g
KyBpZiAoIW1hc3Rlcikgew0KPiArIHJldCA9IC1FSU5WQUw7DQo+ICsgZ290byBvdXRfdW5sb2Nr
Ow0KPiArIH0NCj4gKw0KPiArIHJldCA9IGFybV92c21tdV9oYW5kbGVfZXZ0KG1hc3Rlci0+ZG9t
YWluLT5kLCBzbW11LT5kZXYsIGV2dCk7DQo+ICsgaWYgKHJldCkgew0KPiArIHJldCA9IC1FSU5W
QUw7DQo+ICsgZ290byBvdXRfdW5sb2NrOw0KPiArIH0NCj4gKw0KPiArb3V0X3VubG9jazoNCj4g
KyBtdXRleF91bmxvY2soJnNtbXUtPnN0cmVhbXNfbXV0ZXgpOw0KPiArIHJldHVybiByZXQ7DQo+
ICt9DQo+ICsNCj4gLyogSVJRIGFuZCBldmVudCBoYW5kbGVycyAqLw0KPiBzdGF0aWMgdm9pZCBh
cm1fc21tdV9ldnRxX3Rhc2tsZXQodm9pZCAqZGV2KQ0KPiB7DQo+IC0gaW50IGk7DQo+ICsgaW50
IGksIHJldDsNCj4gc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSA9IGRldjsNCj4gc3RydWN0
IGFybV9zbW11X3F1ZXVlICpxID0gJnNtbXUtPmV2dHEucTsNCj4gc3RydWN0IGFybV9zbW11X2xs
X3F1ZXVlICpsbHEgPSAmcS0+bGxxOw0KPiBAQCAtOTAzLDYgKzk0MywxMCBAQCBzdGF0aWMgdm9p
ZCBhcm1fc21tdV9ldnRxX3Rhc2tsZXQodm9pZCAqZGV2KQ0KPiB3aGlsZSAoIXF1ZXVlX3JlbW92
ZV9yYXcocSwgZXZ0KSkgew0KPiB1OCBpZCA9IEZJRUxEX0dFVChFVlRRXzBfSUQsIGV2dFswXSk7
DQo+IA0KPiArIHJldCA9IGFybV9zbW11X2hhbmRsZV9ldnQoc21tdSwgZXZ0KTsNCj4gKyBpZiAo
IXJldCkNCj4gKyBjb250aW51ZTsNCj4gKw0KPiBkZXZfaW5mbyhzbW11LT5kZXYsICJldmVudCAw
eCUwMnggcmVjZWl2ZWQ6XG4iLCBpZCk7DQo+IGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGV2
dCk7ICsraSkNCj4gZGV2X2luZm8oc21tdS0+ZGV2LCAiXHQweCUwMTZsbHhcbiIsDQo+IGRpZmYg
LS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuYyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FybS92c21tdS12My5jDQo+IGluZGV4IGE1Yjk3MDAzNjkuLjVkMGRh
YmQyYjIgMTAwNjQ0DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92c21tdS12
My5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92c21tdS12My5jDQo+IEBA
IC0xMDMsNiArMTAzLDcgQEAgc3RydWN0IGFybV92c21tdV9xdWV1ZSB7DQo+IHN0cnVjdCB2aXJ0
X3NtbXUgew0KPiAgICAgc3RydWN0ICAgICAgZG9tYWluICpkOw0KPiAgICAgc3RydWN0ICAgICAg
bGlzdF9oZWFkIHZpb21tdV9saXN0Ow0KPiArICAgIHBhZGRyX3QgICAgIGFkZHI7DQo+ICAgICB1
aW50OF90ICAgICBzaWRfc3BsaXQ7DQo+ICAgICB1aW50MzJfdCAgICBmZWF0dXJlczsNCj4gICAg
IHVpbnQzMl90ICAgIGNyWzNdOw0KPiBAQCAtMjM3LDYgKzIzOCw0OSBAQCB2b2lkIGFybV92c21t
dV9zZW5kX2V2ZW50KHN0cnVjdCB2aXJ0X3NtbXUgKnNtbXUsDQo+ICAgICByZXR1cm47DQo+IH0N
Cj4gDQo+ICtzdGF0aWMgc3RydWN0IHZpcnRfc21tdSAqdnNtbXV2M19maW5kX2J5X2FkZHIoc3Ry
dWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBwYWRkcikNCj4gK3sNCj4gKyAgICBzdHJ1Y3QgdmlydF9z
bW11ICpzbW11Ow0KPiArDQo+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSggc21tdSwgJmQtPmFy
Y2gudmlvbW11X2xpc3QsIHZpb21tdV9saXN0ICkNCj4gKyAgICB7DQo+ICsgICAgICAgIGlmICgg
c21tdS0+YWRkciA9PSBwYWRkciApDQo+ICsgICAgICAgICAgICByZXR1cm4gc21tdTsNCj4gKyAg
ICB9DQo+ICsNCj4gKyAgICByZXR1cm4gTlVMTDsNCj4gK30NCj4gKw0KPiAraW50IGFybV92c21t
dV9oYW5kbGVfZXZ0KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkZXZpY2UgKmRldiwgdWludDY0
X3QgKmV2dCkNCj4gK3sNCj4gKyAgICBpbnQgcmV0Ow0KPiArICAgIHN0cnVjdCB2aXJ0X3NtbXUg
KnNtbXU7DQo+ICsNCj4gKyAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApDQo+ICsgICAg
ew0KPiArICAgICAgICBwYWRkcl90IHBhZGRyOw0KPiArICAgICAgICAvKiBCYXNlIGFkZHJlc3Mg
Ki8NCj4gKyAgICAgICAgcmV0ID0gZHRfZGV2aWNlX2dldF9hZGRyZXNzKGRldl90b19kdChkZXYp
LCAwLCAmcGFkZHIsIE5VTEwpOw0KPiArICAgICAgICBpZiAoIHJldCApDQo+ICsgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArICAgICAgICBzbW11ID0gdnNtbXV2M19maW5kX2J5
X2FkZHIoZCwgcGFkZHIpOw0KPiArICAgICAgICBpZiAoICFzbW11ICkNCj4gKyAgICAgICAgICAg
IHJldHVybiAtRU5PREVWOw0KPiArICAgIH0NCj4gKyAgICBlbHNlDQo+ICsgICAgew0KPiArICAg
ICAgICBzbW11ID0gbGlzdF9lbnRyeShkLT5hcmNoLnZpb21tdV9saXN0Lm5leHQsDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2aXJ0X3NtbXUsIHZpb21tdV9saXN0KTsNCj4g
KyAgICB9DQo+ICsNCj4gKyAgICByZXQgPSBhcm1fdnNtbXVfd3JpdGVfZXZ0cShzbW11LCBldnQp
Ow0KPiArICAgIGlmICggcmV0ICkNCj4gKyAgICAgICAgYXJtX3ZzbW11X2luamVjdF9pcnEoc21t
dSwgdHJ1ZSwgR0VSUk9SX0VWVFFfQUJUX0VSUik7DQo+ICsNCj4gKyAgICByZXR1cm4gMDsNCj4g
K30NCj4gKw0KPiBzdGF0aWMgaW50IGFybV92c21tdV9maW5kX3N0ZShzdHJ1Y3QgdmlydF9zbW11
ICpzbW11LCB1aW50MzJfdCBzaWQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQ2NF90ICpzdGUpDQo+IHsNCj4gQEAgLTc0Miw2ICs3ODYsNyBAQCBzdGF0aWMgaW50IHZzbW11
djNfaW5pdF9zaW5nbGUoc3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBhZGRyLA0KPiANCj4gICAg
IHNtbXUtPmQgPSBkOw0KPiAgICAgc21tdS0+dmlycSA9IHZpcnE7DQo+ICsgICAgc21tdS0+YWRk
ciA9IGFkZHI7DQo+ICAgICBzbW11LT5jbWRxLnFfYmFzZSA9IEZJRUxEX1BSRVAoUV9CQVNFX0xP
RzJTSVpFLCBTTU1VX0NNRFFTKTsNCj4gICAgIHNtbXUtPmNtZHEuZW50X3NpemUgPSBDTURRX0VO
VF9EV09SRFMgKiBEV09SRFNfQllURVM7DQo+ICAgICBzbW11LT5ldnRxLnFfYmFzZSA9IEZJRUxE
X1BSRVAoUV9CQVNFX0xPRzJTSVpFLCBTTU1VX0VWVFFTKTsNCj4gZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92c21tdS12My5oIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYXJtL3ZzbW11LXYzLmgNCj4gaW5kZXggZTExZjg1YjQzMS4uYzdiZmQzZmI1OSAxMDA2NDQN
Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3ZzbW11LXYzLmgNCj4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3ZzbW11LXYzLmgNCj4gQEAgLTgsNiArOCwxMiBA
QA0KPiANCj4gdm9pZCB2c21tdXYzX3NldF90eXBlKHZvaWQpOw0KPiANCj4gK3N0YXRpYyBpbmxp
bmUgaW50IGFybV92c21tdV9oYW5kbGVfZXZ0KHN0cnVjdCBkb21haW4gKmQsDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYsIHVpbnQ2
NF90ICpldnQpDQo+ICt7DQo+ICsgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICt9DQoNClNob3VsZG7i
gJl0IHRoaXMgYmUgdGhlIHByb3RvdHlwZSBvZiBhcm1fdnNtbXVfaGFuZGxlX2V2dCgpIGluc3Rl
YWQgb2YgYSBzdHViIGltcGxlbWVudGF0aW9uPw0KDQo+ICsNCj4gI2Vsc2UNCj4gDQo+IHN0YXRp
YyBpbmxpbmUgdm9pZCB2c21tdXYzX3NldF90eXBlKHZvaWQpDQo+IEBAIC0xNSw2ICsyMSwxMiBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgdnNtbXV2M19zZXRfdHlwZSh2b2lkKQ0KPiAgICAgcmV0dXJu
Ow0KPiB9DQo+IA0KPiArc3RhdGljIGlubGluZSBpbnQgYXJtX3ZzbW11X2hhbmRsZV9ldnQoc3Ry
dWN0IGRvbWFpbiAqZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBkZXZpY2UgKmRldiwgdWludDY0X3QgKmV2dCkNCj4gK3sNCj4gKyAgICByZXR1cm4g
LUVJTlZBTDsNCj4gK30NCj4gKw0KPiAjZW5kaWYgLyogQ09ORklHX1ZJUlRVQUxfQVJNX1NNTVVf
VjMgKi8NCj4gDQo+ICNlbmRpZiAvKiBfX0FSQ0hfQVJNX1ZTTU1VX1YzX0hfXyAqLw0KPiANCg0K
Q2hlZXJzLA0KTHVjYQ0KDQo=


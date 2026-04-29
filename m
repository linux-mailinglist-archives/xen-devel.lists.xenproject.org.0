Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NrvBPQg8mm/oAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 17:17:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E135496ABB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 17:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297498.1573503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI6e9-0008Ez-A6; Wed, 29 Apr 2026 15:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297498.1573503; Wed, 29 Apr 2026 15:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI6e9-0008CY-71; Wed, 29 Apr 2026 15:16:17 +0000
Received: by outflank-mailman (input) for mailman id 1297498;
 Wed, 29 Apr 2026 15:16:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wI6e8-0008CS-Bp
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 15:16:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI6e7-00GRBg-N7
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 17:16:15 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f220ac-5cb7-0a2a0a5109dd-0a2a4509e522-40
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 17:16:15 +0200
Received: from [52.101.69.8]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f220bf-2497-0a2a45090019-346545083f4e-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 17:16:15 +0200
Received: from DU7P190CA0008.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::26)
 by AM8PR08MB5747.eurprd08.prod.outlook.com (2603:10a6:20b:1c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 15:16:09 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::bd) by DU7P190CA0008.outlook.office365.com
 (2603:10a6:10:550::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.29 via Frontend Transport; Wed,
 29 Apr 2026 15:16:09 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18 via
 Frontend Transport; Wed, 29 Apr 2026 15:16:08 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA1PR08MB11641.eurprd08.prod.outlook.com (2603:10a6:102:554::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:15:04 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 15:15:04 +0000
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
 b=unEn42aTQAbNV7DxHbyoKIvZmKmluYuxZJNu+TUY7uF+0u8J1g+2p7TkKQ7ey/a6eYvPVNyVCUcVD9Msffj8sbWIwtcJb5dbYYQXd+lrbY6n2BBk4DGdPGEY2F5TDMxez6x3kd0YG/hfw7JbdiOG+vMOJTEOcSFSryVNZCarBmCov9o61wWCXbUKGEJNg0yxoiAoI+bac8RyWo/MVeyOxylI8BABaS0WV9wsXlmN88tXGBDyFHuEf9vIFkEFbwUsDwRHLeZfZ01CN+vWruCOh5uaIhjnuqlEw3EWYknDj+gGmhMBZWBGuxFaKREsCpLHW+0SeZyL7hL03KOlOY9VdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrnFjHrbOODVQYq5wStjuzb8f0OT39nK2IkT9r/9Qrc=;
 b=CZLkn8qCYWENWqPstFSePk+grXyZSmLvOi3HNV9VG6N9omssXADi2qxnrSz8/8Q52zb0Z+5Q283m4UEuk2E0TlNgkCCAW8zFCgMOC00Hi6cRI3qhA2tweMKN9NroW9D0Qm0+E1LcJUL5cy5qlnIgKZdcOyc7Af782GeIPObj6H6u3pd7NNMceU8F+UrCiPZNBZK+g1EG8h0Xcq4/J0jIkEv+HRrF3WcqA6tJ9Xa1HswjjaDMwBvPDSSDr6XB1w2wuFHV3ogv0fB7rJizFgm4NDBGOsnfbRBu32ppESCfDGym7kqotkfrkLI+WnlhIBbY5n5ulUyKaFfa0fMVG8JhKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrnFjHrbOODVQYq5wStjuzb8f0OT39nK2IkT9r/9Qrc=;
 b=BbJ+xP+CPS7pKspnLyblhuHjlqV/JEU0RugBlMNLfhHQmvKOQs8vm77WOxN7fl/q35oCzWzZWTELPJHmlVnaghcFuu4F1ePwPy88RJpp52I1IYwdJDXToS2ODcRdrCMV4wNu9YCgkmTVoQme/3pVrFB1YgzmSUJg9TKaY3XJ3/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzgiaXydMu5koxIJd+XGIYw3B/mLt8XqFwYszqaJ3RtxeWSOwSCUFCgomfOVGI0kbZEWj23349Gfg3ABMqKc3Fw2BqMSBY/iLPonRKGjabOkFwFpr8+W9gHViByudxP+jJlOTdBe1wsqXSHyb0naoJBrLXZWb7F6hOkLa9vQ1iEVNfxprWL9Qt/NDHfhVVMJ5i0XzisbCc9UWWv2cZKx+wGfxMwaV2TYkGJuC2ZBIqN5tpCHBRx1se4jTu9vOJIm+6swGzVbxv512vH/YPCZNEObzC2ocfwBwtuY1XXsaVuKc84Xv9Wc3TTbZ2RHbe343jvBIQxnb0l2nn2UQ0zbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrnFjHrbOODVQYq5wStjuzb8f0OT39nK2IkT9r/9Qrc=;
 b=UQSAZGJcc5tFy+UU4DW2sKJXH9sdb+5xVCrzIKJ+uFRMLFBaDhhzFPh+4B9uHaMHIVEsP7ZO+MW+ySh49vAc/0jFJl1+qWK+IrQzl0jsg/HMZJYvz9fLCbwpC1g369n36NJw0QEoq8GT0vd/jLj6ITCWRgdB8Ov5esazI0O32nwz9azqYwlIVpZ7PwYmKFDxizapXzdNWcb9vslPFS2hccy4fccbK8mM0FLEk1cjGs1PmjZBRW64Xwcmcju4zp1NMmhm0g/Ob6xVVllWUwbxueF9oWWHK9vb3rgoBuvvetXOTqjMmII5C/CFGVs0kmoQehM5d0/KcmjhSRwiYGkMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrnFjHrbOODVQYq5wStjuzb8f0OT39nK2IkT9r/9Qrc=;
 b=BbJ+xP+CPS7pKspnLyblhuHjlqV/JEU0RugBlMNLfhHQmvKOQs8vm77WOxN7fl/q35oCzWzZWTELPJHmlVnaghcFuu4F1ePwPy88RJpp52I1IYwdJDXToS2ODcRdrCMV4wNu9YCgkmTVoQme/3pVrFB1YgzmSUJg9TKaY3XJ3/A=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4 05/11] xen: rename p2m_ipa_bits to p2m_gpa_bits
Thread-Topic: [PATCH v4 05/11] xen: rename p2m_ipa_bits to p2m_gpa_bits
Thread-Index: AQHc1xwVZhRGj/YUzUmHdsB4298A47X2J4yA
Date: Wed, 29 Apr 2026 15:15:04 +0000
Message-ID: <A729DA79-3FD0-4290-8D9C-8792A16E1B8C@arm.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <fcf48e61d270fd4665f14f43095b3659e528b376.1777303844.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <fcf48e61d270fd4665f14f43095b3659e528b376.1777303844.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA1PR08MB11641:EE_|DU6PEPF0000A7E3:EE_|AM8PR08MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: fec0cec1-6fcb-4fe0-cd4a-08dea6023dc8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 VfSE/mhkrQCzchtXgCCCyxhMxEWjjixodvmj8hfeTrToKI37yr29N1HpfgLV97h/O+N7oZ5t+Uv045gg0KnXT1OWl8R61gQwvt1aw7IwrFKff6/At61M/EnPOLAe933ciddhJopPpy00zKDKrGhxgdbJ7XjBIysWBOWv9Tz5S1VqRnowmnF0meGbatt/k9So3w+zhq7Cei36MhynMkAfrsBtx15Dkd2YuHk2e6GFM9x6W3bMb+GEQOj8MTVTqAUdkqfBGQjpPKo/YftlTGVoOkvCJkZ/dp7kmgYsMaeG6hYKmQx/KmgvFktoLxjfc8n1kku5n9GmrnMxvK1k5Jyy3b0uoPnIMMG34L9i3vMvpoXzvpivefmOTcASOOMzPJ7G7UbkVWohD34/rOJhN/WbWPxFZUCl/+6jjBUEfYLsgk6AlQkescG7vbXzvYHFlYtbqdiW/zklTi6y7oyuzN707cQRtK0fJCvXLI215YB+G0tR4BJgscEdpyOUu1Wc5DOVvem6nfx5HFSHtRaLeoI4Inr3ypI4b1SI241r24IQYsB5XX3jg5oPiosRBqohPeqQ5DWfKJKGa55e6Za6lFdNUYQUIOt7nxK5aksTEzpryFd5BqD4cqqASwAgD5jLS3NPqSsZn7UOyTDPJB0ydHlzPunPKggN5P16IFk8y5xC28685L3QKSeujX7kfxvTBaoT00ocHJbZzP2YxAOmK99rAp18EFeXPYMo82rFb32XZKGOe3l2ho0dZHI9upU42RimBoh2igwyz4plUfqr5r1Ttuvw4AYhjdzRtRNfD1eRZ14=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C18EBED23D5DEF49870E5A046E58B002@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 qT29lGlghfuGR5bnpcIMVDNk8oHvIxPpqGph0IzVgMR46Fidtx8mcQ5BdoUJLmsreB5V3xloJU0Brj5ZVG5nfPQXrM1QNUbX2TW92MYNi5aUjuCccXGJTBD5D3wh0JE3AJDw6dIGN+/aQ75uj1lTkYm72LxWR7xi2ZFpyTZrPj4BCHIIyeS5dpz7ye+CaIgoLL8cNiJ4D+zPckkMzUNgGIWVZ7/RLfug+/GGQRlcj/n7CMrnDT7a3DCOcmSM7Zcdb/acZZXVE65WqoTnQgemVreE7iRclrJ7bxKYnJpxSFD1F5CcA9qfVS5nJkgQLQ4dF/QU4wr2EZCiqaCkPbRvGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR08MB11641
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd022963-a0d5-46df-71b2-08dea6021715
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|35042699022|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FdBBmchMUel7KAzZ2M5zyK/10c+2dXyzU6zq5w33eTFuZ5fnp2pN1cLmzawdmdHG+lG9LyaEuMQN1o9UGkjRVh++kFCbS4wuoMnkf60Jw1GOb7GRafVxVgNkkhKS1bQwP2PRCD7sUJ06IAOiysiw+SOn9iK3TL4vavmRo9BGVyrnA8Pb9pvQVJI6Jl2r1rBdOQawdtTXlh5aQuTFBLgaX0D9JSkhWB8IAoCxUZll02Elb1ZEpfRaEy3Tgidsaj5fBB2LYQOuzYpMHNa0TOciiMIEyFByxVoYq18TKfiDF9SqxpP6AznDmTvUVwF0jJkj5R/uPdPVs0XaN1rn3LDTqAOECV1XSGjGfNovjwbY4PG4KiXjZe0DdqWtobJcRcCz+JgqREV4SheTuNPOtQarhOiov824w4FKC7bcQHh1QMCZTxSzHBe1KupgU/WSG1ttvjZs90EpMDX031yI4d8MT0FtYkJOWaCvX5OF359Q2EG8yQ6sBkau9g1OVVu/UDQAY3ePzYrsB8oL61GWawoHcw40X1Ol8F922fnHLHn6kEHBH+OOmCYn4r2/eMXsxWlPe5tXbU/hdvh5Lu+TaZa3e9wba9ZsZA+GcP8RLU7q7jE1UqYR2zXhvZLQQ1FUersrRj9t6LS3zo8CCGiizndRmfwAmwDqPSq2xxlelhvqWauJ1lKMqLi3RsLGP33K/d6QM3D155FBaojgOuz0hRYCSe7lHAT68cr66vZKSatLmPkdI2ASOHSDUvv+fv25nHV3Rp9FHnVExs+wJZ/0lo5HWw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(35042699022)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N61gyorxu0NSqFdyQuU/13nqXUDwiUbybFsK6DhkP6OGrBmJSxDA+oBQWvEUOvgcWetm1I5vYOnXaQebuZn8UpcZQBnGo3Pu6x8TYY6ed1UdHVArmH5xItMcJcoBKSHBenClPAguxwp2P5fQm6e0Ulq1n7RfEVwK49HSMq1fHN2sKBdnv4IslWi4GwmmHdPJaUc/Gl73EWKHAAv9xvmTYd+51H3TZQO7mUa6rPMooFYHg13ykV4kcEksmSCEcED5GOj9yHfXl7FCol8UoquRAoX4M1J0nrNitOirYZxHHUdmqCLD0xTza9CxbojGq1ZYkQP+LdRLeyo6wdAKkBVTF0hNsUOVSaDbvOPyX8lHehGVsZp7yP4qD06XHF1xBAzXYbQj2TvB/r+3obDb80T2URUaJ80qGxwx+k3nbkLfq2fGBQpzsujo1Dom68ycuc6g
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:16:08.8748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fec0cec1-6fcb-4fe0-cd4a-08dea6023dc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5747
X-purgate-ID: tlsNG-bad1c0/1777475775-414B1A53-EDF7DF5E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1516
X-Rspamd-Queue-Id: 9E135496ABB
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

SGkgT2xla3NpaSwNCg0KSSB3b3VsZCByZXBocmFzZSDigJx4ZW46IHJlbmFtZSBwMm1faXBhX2Jp
dHMgdG8gcDJtX2dwYV9iaXRz4oCdIGludG8gc29tZXRoaW5nIGxpa2UNCuKAnHhlbi9kZXZpY2Ut
dHJlZTogdXNlIHAybV9ncGFfYml0cyBpbiBjb21tb24gY29kZeKAnSwgYmVjYXVzZSB3ZSBhcmUg
bm90IHJlYWxseQ0KcmVuYW1pbmcgcDJtX2lwYV9iaXRzLCB3ZSBhcmUgb25seSBkZWZpbmluZyBh
biBhbGlhcy4NCg0KPiBPbiAyOCBBcHIgMjAyNiwgYXQgMTU6MzMsIE9sZWtzaWkgS3Vyb2Noa28g
PG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IFRoZSBJUEEgdGVybWlu
b2xvZ3kgaXMgQXJtLXNwZWNpZmljLCBzbyByZW5hbWUgcDJtX2lwYV9iaXRzIHRvDQo+IHAybV9n
cGFfYml0cyB0byB1c2UgYXJjaGl0ZWN0dXJlLW5ldXRyYWwgbmFtaW5nIGluDQo+IHhlbi9jb21t
b24vZGV2aWNlLXRyZWUvIGNvZGUuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+IA0K
PiBSZXBvcnRlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4NCj4g
LS0tDQo+IENoYW5nZXMgaW4gdjQ6DQo+IC0gTm90aGluZyBjaGFuZ2VkIG9ubHkgcmViYXNlLg0K
PiAtLS0NCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBJbnRyb2R1Y2UgI2RlZmluZSBwMm1fZ3BhX2Jp
dHMgcDJtX2lwYV9iaXRzIGZvciBBcm0gaW5zdGVhZCBvZg0KPiAgIHJlbmFtaW5nIG9mIHAybV9p
cGFfYml0cyB0byBwMm1fZ3BhX2JpdHMgdG8ga2VlcCBBcm0gcGFydCBvZg0KPiAgIGNoYW5nZXMg
Y2xlYXJlciBhbmQga2VlcCB1c2luZyBBcm0tc3BlY2lmaWMgdGVybWlub2xneSBpbnNpZGUNCj4g
ICBBcm0gY29kZS4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gTmV3IHBhdGNoLg0KPiAt
LS0NCj4gLS0tDQoNCklmIHRoZSBtYWludGFpbmVyIGFncmVlcyBhbmQgdGhlIHRpdGxlIGlzIGZp
eGVkOg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29t
Pg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==


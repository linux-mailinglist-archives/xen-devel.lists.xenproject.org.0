Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBxCIoBiumneVwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 09:29:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB152B8056
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 09:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256390.1551066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2mHb-0007RK-9h; Wed, 18 Mar 2026 08:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256390.1551066; Wed, 18 Mar 2026 08:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2mHb-0007Os-6V; Wed, 18 Mar 2026 08:29:39 +0000
Received: by outflank-mailman (input) for mailman id 1256390;
 Wed, 18 Mar 2026 08:29:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cC/N=BS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1w2mHZ-0007Om-Hs
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 08:29:38 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97e8e6b1-22a4-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Mar 2026 09:29:34 +0100 (CET)
Received: from DU2PR04CA0183.eurprd04.prod.outlook.com (2603:10a6:10:28d::8)
 by AS2PR08MB9048.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Wed, 18 Mar
 2026 08:29:29 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::41) by DU2PR04CA0183.outlook.office365.com
 (2603:10a6:10:28d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 08:29:05 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Wed, 18 Mar 2026 08:29:28 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AM8PR08MB6371.eurprd08.prod.outlook.com (2603:10a6:20b:363::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:28:21 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:28:21 +0000
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
X-Inumbo-ID: 97e8e6b1-22a4-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=otyivtTRkLAB/8IGI+9hZPi8/RbSXfgaKC2kfo7ncTcxHHXntyXao3qoQW7hv2EwWgMMp5/ExI4Q6/72vX8rPcIvgmAIniy57sIeaqFxoXoVmjCwWhCNRGgruS6/COlXJS7e25rhBA6kE94XDb0DlllylWI1RxVShZAb/RfGrFRVhPRdFm7brOwRB0eYcG5co6i6UDeu2GFESiDtR9edgWZX/QMvVQbVJ2mC4K4C5ZCMbHSiDkEsoidvNqbRjD1qekjpIzSN3OLxxrbu9m9U+1d+gFBWFpED+iXaXkJNld6eeIsw8FQbAScfzsee5wR1acIX6Do1wQOsEyFLEnUVog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erRJBGYa/wMcdr+S45LfWALzLyTSxg9xvHhSLIyqtt8=;
 b=TWgnyQHtP9MHpnRHIo1Xe7MrbeQNqvoNGH2/LbC/XvT7fd5riVTL8GXGgJ8mzaOWHv5ji6takMwNqFhtkcMugq5Bdmqyazag5yBoIVfCZsryqu8ceNxidhWKALPFpIf8vP3DmTcRJA9BPG5PMa4as1kWg0S0uNUWDI2RXZkOi62db9DeJGL5XiMlD5lAOLl8ED/STQIDlS7TMTfktdVKH23tsOfFI0NGHrw8Z54nfjpKmw3yfouhg9w5w4NWVhbkhR1HQ6KL/5nnIqU1Y+IVE2FQHlc3gfJu3+WpxKl7n73CtTc+/Jm1uFGeH+yGO++pkhcN84n/6htXx4y9s4hLaw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erRJBGYa/wMcdr+S45LfWALzLyTSxg9xvHhSLIyqtt8=;
 b=bVdE0ynKzRUb/qSGlPrsuh8wuHR25O349sJsUWswlpGmeawLoJ5mAve4PtgAsuv4rwiiXLcosVQ/UikNICHnbIWsCmdfUWx/lqMF4g0Zv1SqCxq7LUV6SZ9fOTtRumTye49AV21Ji81Apmd7Z10WzbZmCie38Emw6rSdhpfamAU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+tnbuOoWQ3j5GrpeZKkfkSDFsIElEjWtS4iR9DdLb22K74OuGOelBEsJjNBVDZvhGisR2aIkKcX2mOGBfh91rIpudUUhzFD1xbk9kdglOMClt5/P/l8Odozwe/AY7Yy3yckgVwyvUJXnQPLI03ywTxWxL7V5kMfwzrZRdH5rjg85PAt3KmY9KZW/c+jHrzkMeD26dDOeYIJtt+egLfI75B+ZmFNAUn4YIEXojJI/7BgJgvoFUNm0aeZIto2ltxB1DOTuf4xj9PC6BNN4m1bQbZ855Zs6R0UMJeah+M7mI7hNFciYQ6eyoKvJJFRN88PWVDIPFSxBbPcs/oYD0yMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erRJBGYa/wMcdr+S45LfWALzLyTSxg9xvHhSLIyqtt8=;
 b=aSFgj9UTmZp3gLOe7M8qNnR4wTbOxYgIDyhjfxrBzfKiSn2ZjgbnhdX+BzC3kCRslSio1JpCWP5z+U1XoPs5F/ZSFFByLNASuc13KEBoY2XPeU4IfFyNwh4iUs+rTNbdDwqH0DuVuMeVUy14FqVysUz7kSmY7mm5aX7T8lI1tHPUlDKXGQPV9OW2VB3S0LhLqFm/5U6b4Nt9YHXKjyGIZU8cOijzKcqAplvLEWgi2hr0ug3HvBpI0F3Z/UWjnyCcgunR/HWkoOZDLHtWSy0q/xckN6bYnlG4VkWwkqxdw6kJgs//bE8hfBof1RA8oXeLOqPKZsgOkJCUKkJ2orqwog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erRJBGYa/wMcdr+S45LfWALzLyTSxg9xvHhSLIyqtt8=;
 b=bVdE0ynKzRUb/qSGlPrsuh8wuHR25O349sJsUWswlpGmeawLoJ5mAve4PtgAsuv4rwiiXLcosVQ/UikNICHnbIWsCmdfUWx/lqMF4g0Zv1SqCxq7LUV6SZ9fOTtRumTye49AV21Ji81Apmd7Z10WzbZmCie38Emw6rSdhpfamAU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v6 5/5] docs: Document CPU hotplug
Thread-Topic: [PATCH v6 5/5] docs: Document CPU hotplug
Thread-Index: AQHcsgQvuWVORvDa+Um30EZkSgxRE7Wz/keA
Date: Wed, 18 Mar 2026 08:28:21 +0000
Message-ID: <24524A8E-6A01-4066-8F21-615E1C1E3633@arm.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
 <4857e0c10c59f283e4a3686bf9188a1809a9fd55.1773307749.git.mykyta_poturai@epam.com>
In-Reply-To:
 <4857e0c10c59f283e4a3686bf9188a1809a9fd55.1773307749.git.mykyta_poturai@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AM8PR08MB6371:EE_|DB5PEPF00014B97:EE_|AS2PR08MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7c9b25-0bcb-461d-9b79-08de84c87860
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 1TSCzfmPXLaMIlFOmLje35mwsSDWh01VWQyeMHW6e3IHemdzoMnEl7VJWOEL7njfm5SojvN/xggbuuspD11iOEzbMcAtZ0jRe7EyTmiBPp5BMZh+j016Fnz29YTSDeq1/xJ8wyXYS5l2u8pDPAF5VecH5zB+51Yz84DPCG011n1UmyK9U4bpEYIkQ/IS+eaYZenFVUzFsQgEtrNpoS2g2vKv1zf9vUpBoAAWkIVXsltF2EfEZ6fii10ZK6i2z7c0O6MhJ0pf6lux9PaGIWxEJ2Qg4BqEb9thSTyNDhG2QvoyVf6/MsK296NYePY4F0j0scoCslJg7DGpXAI2/LIs5ZJFz7VwpR1Rokl9fIEXAGRrl3tKwz+uYeYtyZkjuvwRtnAISbYcpV8nLF2RCmtuVi0TgVryxY6jkf1jh9GhaGEaJJttYLipNCtlA2vP9sOeNUDliOXyDc6vBWgBMPT7TtQotSM1khPrdjWfZMi54CjiNTFilWl3UuG+5csgqMzml3bXtQPDISm9GauQr3yTuUnL84Z5O4jejrYefbQ6Tn74enptRugq55kan0nR0Oc2oqndwE1b74a0Q1/6+PPfc1jFrjz/db2R3WpYu27estlLDVTIMIrmuL066ZozPprxDbHKmPSYxh6nkfmxwu20CzbVOd5wEu34lDt56w6f9B7Xzvhd5GgV9ujVCYFY690yTKBgNBgkU2S1LPljiBJqo6wNa/BupyqEbFeJCf1NtScOeR7Xp9hyztvTXI3dRCwLhirSGkwT1Geq/v4IMt4M1/P/U/YlCQMeQkx1gXgDtoM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1B56E4123745594FAF8F9D83A509AC40@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 TTJ8eXkhANGz6jb6VzOHi1miQmuf5sgz2cx2jNgRxJghIIEJBTuGTVrTs/JSZLCPw7CbilTYjuKVXpZsbeuKBzlktdPApGKLypbxjM4Bm8gLKMj6RjgVBmGttBKdU36rJfx6pxN/b856NCWu34W+I79fd6tEW8yMeImYWfAWMzy3r+JzK+a0CkktCt7YHA3RZyd89iz5Zt+RGd2rhmXlISdq6S11moCt3LJBzH7bdDoqGm7/vcV6w3ZUQk+qT3HXghiChNTkriBpBo2NxK/ITs3GXb1Uo1XweY6ncp50if/9Mf65NfHOdR3FwiIRfrFBtOy08PsZ/WOli8RuslyjkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6371
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50237e22-7f43-4554-548c-08de84c850c5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|35042699022|36860700016|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YtSuMbFVrDls+HfMczH0U33Dl+REyN/Eq088ftGRDOP1r8CILLJH7YyvFhTgGYaSrYnTTIk8QUHVR18NZoZRRmsH+HVbowbBRiLMAHYMqQox64e5cqduvdqwUC+cqoXYNIr9xybXagz7kuYWEHnYTYdlpjvnWnM51et1OZE3Kgh5VXwAbvgBdbRXDf9I1GpCrm/yqBmEUBsBishRCJ1kgKm8X4PPQ7/UniQziot49HbsIM7flLMOeH3KWXjkrKrv/1zhSBmYKTCk2yA+r/KXLV9sUFhstKzsD2t7iBIk77JFMQLLvKfBcobm33HoDwkv52nxQz84noxsqkenaLSdLQqYs9TdmiFYHBrxg/phK8NsnMQRlae2rYXKK4Ckb2N9tTMlkIV7YYxkirDWEFgyiiLpyEuNyclSxnmldZnH77WHPWMBTDNCQrSckfIO/4XcH8zWDchLcccqEosYQV8gDm2+GqlTOK6NXfrHn0Wxixhq+HqOqHrnGKjcGpfmyDc3HGKw9oTcI6BjWNDdXgE2PuRnbPGeaOPDhQOk+dgqoyildDrzdm8nCmZ9EI1TZuyOKMu6/6Hi/SLj2fVtWPDFA/4AkAXtAv6Xu3CDpxvkEoSRy+DZPLnf3/vSNH6n4WxWQwVmJTBabK0TtLONIEJzV+/7HpUDMJEY9ME9+MdnbvE954kGctF5DhsULwLT7P0mUfkXqLWe9P+Peha9lv/MrzeG7JUZ5/HtS8jh1atHkH9U7H2jlM0eQLWh42pPg0SPQMf3WY534iSzLVDvbOvZZA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(35042699022)(36860700016)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mEYABCbJnjvt92lrrfDhFt4s6XeHrvmT1o6bL4qmjoO2MHpt1r2st6iCx5EaeaHXjeB9RFebk3G/AmDz+uQjw/hWSqe01jNzblAoeakyJBADRFghTiiGZaNscbLtoYnVobicEqx/AKx+CfC1vzJwazuxcV421e0lAMX7ur7l+jeGD4WT+4ERKbsiB0vrzDt3sgyorLUlzMJn6BRQBcvEduk9Q/lNh+BGyH7OykJn3ituPDrud/VfHueLWdypmvZvqjJXQkrAvkeyHM1h9c0xGGnJznXPTNfO+zHXmI2F2/nzSNDHmVOltZfyySGb9DhBd4CcgQfLXrSjKzEd6kdUtCOR0rs1ukt2KWR+9AGRYjKiMxe3ULQ2MXZCAci0b3fvuColCxZNHdMuqOaVw9OPXBcFa8TzP9yRgH7/w+yoIX6BT+KErDBIjqDfsCi6XtKw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:29:28.0081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7c9b25-0bcb-461d-9b79-08de84c87860
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9048
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CAB152B8056
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykyta,

> On 12 Mar 2026, at 10:39, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote:
>=20
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>=20
> v5->v6:
> * no changes
>=20
> v4->v5:
> * s/supported/implemented/
> * update SUPPORT.md
>=20
> v3->v4:
> * update configuration section
>=20
> v2->v3:
> * patch introduced
> ---
> SUPPORT.md                |  1 +
> docs/misc/cpu-hotplug.txt | 50 +++++++++++++++++++++++++++++++++++++++
> 2 files changed, 51 insertions(+)
> create mode 100644 docs/misc/cpu-hotplug.txt
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index d441bccf37..7b93ae69e7 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -52,6 +52,7 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
> ### ACPI CPU Hotplug
>=20
>     Status, x86: Experimental
> +    Status, Arm64: Experimental
>=20
> ### Physical Memory
>=20
> diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
> new file mode 100644
> index 0000000000..45f20c2002
> --- /dev/null
> +++ b/docs/misc/cpu-hotplug.txt
> @@ -0,0 +1,50 @@
> +CPU Hotplug
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +CPU hotplug is a feature that allows pCPU cores to be added to or remove=
d from a
> +running system without requiring a reboot. It is implemented on x86 and =
Arm64
> +architectures.
> +
> +Implementation Details
> +----------------------
> +
> +CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl=
 calls.
> +The specific calls are:
> +
> +- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
> +- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
> +- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
> +- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
> +
> +All cores can be disabled, assuming hardware support, except for the boo=
t core.
> +Sysctl calls are routed to the boot core before doing any actual up/down
> +operations on other cores.
> +
> +Configuration
> +-------------
> +
> +The presence of the feature is controlled by CONFIG_CPU_HOTPLUG option. =
It is
> +enabled by default on x86 architecture. On Arm64, the option is enabled =
by
> +default when ITS, FFA, and TEE configs are disabled.
> +xen-hptool userspace tool is built unconditionally.
> +
> +Usage
> +-----
> +
> +Disable core:
> +
> +$ xen-hptool cpu-offline 2
> +Prepare to offline CPU 2
> +(XEN) Removing cpu 2 from runqueue 0
> +CPU 2 offlined successfully
> +
> +Enable core:
> +
> +$ xen-hptool cpu-online 2
> +Prepare to online CPU 2
> +(XEN) Bringing up CPU2
> +(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
> +(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
> +(XEN) CPU 2 booted.
> +(XEN) Adding cpu 2 to runqueue 0
> +CPU 2 onlined successfully

It would be good to mention here what has been tested and what was out of s=
cope
or not supported at all (ITS for example).
As part of this list i would mention:
- TEE in general (FFA or optee)
- passthrough (unless you did some tests but you did not answer to my quest=
ion on
that on the previous version of the serie)

And maybe even describe quickly how the tests were executed.

Just so that people are aware of what scope is currently realist to try.

Cheers
Bertrand

> --=20
> 2.51.2
>=20



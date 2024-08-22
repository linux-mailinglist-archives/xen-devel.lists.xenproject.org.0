Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9684A95B4DA
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 14:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781806.1191309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh6lx-0003XU-DS; Thu, 22 Aug 2024 12:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781806.1191309; Thu, 22 Aug 2024 12:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh6lx-0003UR-AE; Thu, 22 Aug 2024 12:18:37 +0000
Received: by outflank-mailman (input) for mailman id 781806;
 Thu, 22 Aug 2024 12:18:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=67fr=PV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sh6lv-0003UL-Q6
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 12:18:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a602e163-6080-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 14:18:33 +0200 (CEST)
Received: from AM6P194CA0108.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::49)
 by DU4PR08MB11103.eurprd08.prod.outlook.com (2603:10a6:10:574::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.15; Thu, 22 Aug
 2024 12:18:30 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:209:8f:cafe::b4) by AM6P194CA0108.outlook.office365.com
 (2603:10a6:209:8f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Thu, 22 Aug 2024 12:18:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7897.11
 via Frontend Transport; Thu, 22 Aug 2024 12:18:30 +0000
Received: ("Tessian outbound 97d928cc87dc:v403");
 Thu, 22 Aug 2024 12:18:29 +0000
Received: from L7b72416bde63.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 159A6557-A8AF-402E-8392-CEF02D4EF92E.1; 
 Thu, 22 Aug 2024 12:17:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7b72416bde63.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 22 Aug 2024 12:17:41 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB8036.eurprd08.prod.outlook.com (2603:10a6:150:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10; Thu, 22 Aug
 2024 12:17:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 12:17:37 +0000
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
X-Inumbo-ID: a602e163-6080-11ef-a50a-bb4a2ccca743
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CZzk82CdaWDBETp9q5D9QzmfRFiIjGX6nI1x68zYVcaoJ5/ZJIuBhUaIFjXadwgGc6w9fiq2iC4KIWq71ax6LyX3H9rHnEFOUFPeu2J2p3/FlCHPGah9G29PQ9tBunEI2EyFjHJ92ASQwwDXyY66EH57xHicGBu7hFfCOJbNbuv8SGbIbEm+lQGo4q7fEFszTH/EOhBiyv2kWhxw+YOLVpQgb+rnV3YI+U+C3MPfyE8iPVGogkmCA7PK60LJOAlzjrm3dBE7Rq53k4RlgrO590IKC14LtMXyBtUsfrYg5sm31BEekLU50wHxWxfP4uaThTbYai/sKaL4Oc0Rsb74tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PhfxDYE2y3eHFdalA+urk2TWj5lmYocivuEZVEK3Zk=;
 b=d0TLhOFscV4D61IgFv4sIN1xqkeXtAtQVpFXKly1tPfEhEPtxWBcszYF4fty+AXOWdE1wFiqc7Mtq9f64vVHbo2ZXhtV1GgJLA9g9olcl+ZCXjyOqRGQOBGQuxyVpYaa6e8jpGS/w7+fOwZnM47MYoR7wE/8y3BVwtulYpem1VZsx512SfmZtZ7Y5onuhEu9Q7+fQymJVz+hRQMKp6pPLg+dMavQz+/r8Gh9DSwf2hrOi8qgV4+EtJLhtvYsQNHXHKLZOknpOMzNVcF0cTcpDc3O2UP1bjsFrCepCH89InFn9pCHVy9ZBJlNQforxVW49G+fS0yhK4bVyKMi6fdetg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PhfxDYE2y3eHFdalA+urk2TWj5lmYocivuEZVEK3Zk=;
 b=LgaAhCaIcNNWQJMx2JXK1kE+9hXyp4z2SMv4FxbvZbeHFJgB8qgyiPyZWlg3nNGpiCpxX6e7uHnh53p1NsHqesqNsTiAV2h5JgF2jrUmszlBSwqnBgRSCmP0uDr76a5o77qO4AgUcvVA7YStjD7WjGmnbVRjMm17ABrNqMKBNXY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13a6de6946a53b83
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nqj6OIqHeip1vUnHnGU3uGqxZJ9xbR25rRERdfokdSVdkTrTZ5KlgCSoKXoYJcNVPe2AU9kjpmVnSaZ1dAG9mQv0ccLsLK/qlbzk0+Q/aCBkJY6x5qaTiPV4F/mlqKepfTlAsjnq8fNJIyELsGEJak6ViSVDpo8F8KafK1T2sLhakxkZV0Io41h1JBiNSQKwaIltOvxau3mAHzsSoBMnUoCz9sAGTbGYvtNB496ri7FKuYOoHdBkNw7Oc7yCvNsCfLxmDsWuuYP7RBQs4niVTVz9B1fMRCe6zaYQ5dimlQQ/CJhOj3i+aJtGvB0T6ql5q6o6w4cul3TeOgDOH821WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PhfxDYE2y3eHFdalA+urk2TWj5lmYocivuEZVEK3Zk=;
 b=udRzVqjNHeFitLcJX0Q9+ONet9XWgX0qfbkJZhtCnhz5oT0+sfZCMRa3TStJiySRlcT8nxcBkBW28XceqRqMMyzu2Dh9FX9nD2wcE9Y6qhGjadfhjgDXmIiJt+a8tGFqbDEO/QUYtVmCE9uBX6tZDh+cs9modPGuTwBzluY0zAWiQitnaeRwy3pslAszXV0FSkgi6I24jgtuqAjoJkpN8x6nsFcXPeta00mA3fKposXAHMxcekm5yEiT8SWi5wImqVO8Ub7bcdNC21sdZdoZNUmwG1gTU6O2NBkEgMo7+GedzTdCnq5Xi2GavQE4qTQvAe5HyknIWwVyNgTVREWAOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PhfxDYE2y3eHFdalA+urk2TWj5lmYocivuEZVEK3Zk=;
 b=LgaAhCaIcNNWQJMx2JXK1kE+9hXyp4z2SMv4FxbvZbeHFJgB8qgyiPyZWlg3nNGpiCpxX6e7uHnh53p1NsHqesqNsTiAV2h5JgF2jrUmszlBSwqnBgRSCmP0uDr76a5o77qO4AgUcvVA7YStjD7WjGmnbVRjMm17ABrNqMKBNXY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for generic timer
Thread-Topic: [PATCH] docs: fusa: Add requirements for generic timer
Thread-Index: AQHa8u0jnfgC5boSJE+t9AfK5MrS+7Ix0ZQAgAEsHYCAADb0AA==
Date: Thu, 22 Aug 2024 12:17:37 +0000
Message-ID: <D3358591-F9E2-44A6-A22A-FC2AA8857C68@arm.com>
References: <20240820103816.1661102-1-ayan.kumar.halder@amd.com>
 <5F0AF572-3437-4372-96EB-42F46B3A3155@arm.com>
 <101a7105-5638-4c69-a5b0-29c252284aea@amd.com>
In-Reply-To: <101a7105-5638-4c69-a5b0-29c252284aea@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB8036:EE_|AM2PEPF0001C708:EE_|DU4PR08MB11103:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ced3d6-df10-4aa9-0cc5-08dcc2a488a2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?D2jmwXDBo+MJdH1XsB7xwLw3+lmvcKJPeOReOA9kT78lDRcGRbr/gEnxUTaq?=
 =?us-ascii?Q?w+JLfFXd3WmOJs4mZqcvg10PR6lN5AzGVDpyzsc3j2+NGwbHFEG24pgkKY6S?=
 =?us-ascii?Q?w776tPAYPE8jzO8dQJ9+6yJcrlB+ID86CE88e+EQlA2kCIEYRl9oNHCTJBpX?=
 =?us-ascii?Q?zFDLbRDm/d2OLYeH18Ivj5CAmKeRp6BZ2agrhQ3iD0mBwVKEQ9bTgyRR8pRa?=
 =?us-ascii?Q?DonTAYCYT1IlRgB1clZUHQNjEHggz9d6ByqvfO4zGtcj8G36YJuMjlR7Pntk?=
 =?us-ascii?Q?NhfnFj6uBinTojp7IFnYpJXHASdDG037FbQy+vXTQBrybKJ4fQWpkoJhVoMz?=
 =?us-ascii?Q?yI1xokkgxzh8LML/CLdyNjwdqJaMvf29aM51vaJAT7jJrM9SZa0Jjo+1kBaj?=
 =?us-ascii?Q?UrH2Gj6ix+PBJnKHfh4gs/uKjUwo6l2GE8A4jz3SI1qhUkqzRL76SHjkaM4l?=
 =?us-ascii?Q?VI2TN2YDEFG6TGZBVXNNdkJuR2OHiHlIydR12bIBw0CFNyseh84Dsq0cz/Ir?=
 =?us-ascii?Q?/+KBhXoJC0FMyxkb2RM76KJwdlkqRS5jOTcuiqXmrOMMhUtH52khI9Ej6z+i?=
 =?us-ascii?Q?kwOsFS/6gbsBBqGswEHlHC+KzFy5tjHKIZv4IS90kds5Ph4kw9bWQPhEHBwH?=
 =?us-ascii?Q?XLO00LOvI1p5uWhLn2QSRTjw3/Q68moEZ/Rtv3B2R3fQu4wxFmKrDbhtSjtp?=
 =?us-ascii?Q?99W714qmifQuuU+k6ydvIRbNCdpAkiVzG6edmhKrCKXimr06Mo6BZlnDgnHq?=
 =?us-ascii?Q?UhUvEpIYxEp2xcC2PWiPdJXGseiZRbupTAMazq0EwRYr2noCEBRkiGE8RC2+?=
 =?us-ascii?Q?LgCejqyOpuX+ua93MQApLSnDrsgpL1wbekKb/fz+WDDboEghAeo9LmFMg68e?=
 =?us-ascii?Q?REM+3Ur+Ud0cy6+kMdluePUTCKGFPvzhJR0KLwHuWhrHRaG2WEUZyxb1P0FE?=
 =?us-ascii?Q?97qbcy0/Zbha5E87rr+PFf6rCLKBMww15Eb2qmFOQFUbnrx3fcLpdFXKgi/T?=
 =?us-ascii?Q?QngEjQ6jKTbRPYAnMvl6UgSwNiC6jy/YAd/OHLHGUsyLxsMZQ9fd31g7ViLt?=
 =?us-ascii?Q?JYpPTuK2vMd3C0B9gIFUHCRr4xsG+kNDnI8oJCtcyyR8UcjDDEm76rtZk3M7?=
 =?us-ascii?Q?cHtLRTCiAgySkgW4DqCsl4sUqmtpDxh/HAhvJTxwKyK+9wuG9MDN9tOktofb?=
 =?us-ascii?Q?DERG3TkIN/eyBUOeXM21bzS00O61PpiEyKqVflAPbXNUx9+zxPR9LkxH0/Vz?=
 =?us-ascii?Q?SYLLDbOSwQ3ShwXnK0fA6L1YsYmV4w8CPNqoJXdvtuFqvnEpPNlItRL9Yb1t?=
 =?us-ascii?Q?YwuzDg8A+9YxQnnT0/dFHcJbtiaWSlBlEgWTT9ZnuYS1u4wdcZmyMqtgjnay?=
 =?us-ascii?Q?PAe0Rq+JYsJX0tP2BD4NigZX6JanXVa9DufZ9TRWjwE4yUBngw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3148DD46C6BBF94896C240A1BBE97C5D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8036
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7b22d52c-68f5-43be-cb91-08dcc2a468ef
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?biEN6jZmVCHHZfp3rmlnZNcQyM9krga2UFGwrwtzAxrcUEBsdGr8GWsF6pa9?=
 =?us-ascii?Q?kCZDWwWXTxlgjeDqDSn8o7OKbLjaz616eKt7xAgP/S88acKMPP/FTaTf01eL?=
 =?us-ascii?Q?H4sF1NRBjlA9Z3fbyOOT9PyF50Rff2g5Vn8YBpXCsGw4gJ8pd5Am46WWoTZo?=
 =?us-ascii?Q?xqAAkkwkQfyAGgHsNSbQy+WA2ssp4UlVuIlKWpLqsRqT0b33zEv/9n/G+b3O?=
 =?us-ascii?Q?Uk/GGRCmDRn32JWk6Mg3wtXHWcrG6Mb5ucgyCzgJ7bdqkbnshmmttsEPPM+I?=
 =?us-ascii?Q?wOqn+tqsQhP7WE2eFWGrMc3H31j+Gu5OUZUdlryUHR8vvK+vjBDcgIeS93dn?=
 =?us-ascii?Q?6QJeS42GhtUO3rl/qcveqiM+0L6jCg+6wp0x/0Lqg1jueWa6Cf0hyVvYzHRz?=
 =?us-ascii?Q?jjvzEEhW9HM8QccDJIiZyMgi5LDqyYZLrYp3vbj7EzxqjWU5y/XzeZ1IOBub?=
 =?us-ascii?Q?kUhf0hxHQeuFhatxRDYVGis0ZtZjQMLzHr640JVK/e7DsQo6oBtx3vqwrAkQ?=
 =?us-ascii?Q?9sxgR3UagAG8zxTImCaQi1yq2r8Gaz9XNE84RSBKY98/RYhOUjyPwT3BaUrZ?=
 =?us-ascii?Q?5rdHr52qUC61GcfCldJQyhPb0MZGILWglt+r/7ufY/HKw1Oz8bglT+yLFLMo?=
 =?us-ascii?Q?D5plOLWK3AzitninjdkXJRUl96BVH4+toiHNlllItK0HLmfiJBM29ZTcjbb+?=
 =?us-ascii?Q?XeoTVeGE7Nlk6QnZ93rE02aAtFiX3iMgRzBQh6Ee6/kubbFCA/QRZvE9uFgN?=
 =?us-ascii?Q?5vtdjyfRZPz9jZiiceHaUwpDBzWsuxSbn7ZBMmC8lLvnKS7knbNzi9cQrx31?=
 =?us-ascii?Q?cRfyl6ZJBQui15ncdkWjlAJ/f/MOs/8jitBHSp1pg968yKfXUV0ZjkPX0JOU?=
 =?us-ascii?Q?gH7AkEoCUHh3ZWT099YSK6BlOoIOgLzuQBAKzeVKsZQu5XP2gZ/JcDK1YBW0?=
 =?us-ascii?Q?sJEs7R4dFAjIyLyuOwJeU/JF/9d62EYQGuRzRk3yoHNkwTH7PuRDCVYy68Pd?=
 =?us-ascii?Q?QtH7jsQw/um8xh9AbduGGPmULHUo4yjwSnT0fwhQ5EHpa8ahroUPYCro3l8r?=
 =?us-ascii?Q?ara3BCJb19gur0nXSw64416ebfZl4OEVMnZfvdF6mOlyc8neeAvlwgT3VTsf?=
 =?us-ascii?Q?bbKWk2mPmtWAP6cFFF0wreWf65faPJp1W4XLMIFBRq0W22wC9p4E+UADN8Ei?=
 =?us-ascii?Q?zkqr10gz9Tu2TILS0Yx7EfZX28u9HY8G1+Gi3MqauWOnIMRznl1oANYyw+ps?=
 =?us-ascii?Q?vT4P3fuurdQyUoD7gdyxb19IwgRKKYXg8aNiuO5w2TYJiS+TWTAAQZfcraU/?=
 =?us-ascii?Q?yQB4zfAs0tloRHlpaiV7spBr+EtNYfMKyavSljgnfKnRslQcNmpinEYhBsck?=
 =?us-ascii?Q?hIkNLrKKolXmY3LwKYo88btL0jL+jg9drrYdUMmDl0GHW+mQ+3t6Ze9ydM2b?=
 =?us-ascii?Q?aa+5xu6XMrTkeunnvVSfp2OCEJeLbVu/?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 12:18:30.1889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ced3d6-df10-4aa9-0cc5-08dcc2a488a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11103

Hi Michal,

> On 22 Aug 2024, at 11:00, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Bertrand,
>=20
> I agree with all your comments with a few exceptions, as stated below.
>=20
> On 21/08/2024 17:06, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Ayan,
>>=20
>>> On 20 Aug 2024, at 12:38, Ayan Kumar Halder <ayan.kumar.halder@amd.com>=
 wrote:
>>>=20
>>> From: Michal Orzel <michal.orzel@amd.com>
>>>=20
>>> Add the requirements for the use of generic timer by a domain
>>>=20
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> .../reqs/design-reqs/arm64/generic-timer.rst  | 139 ++++++++++++++++++
>>> docs/fusa/reqs/index.rst                      |   3 +
>>> docs/fusa/reqs/intro.rst                      |   3 +-
>>> docs/fusa/reqs/market-reqs/reqs.rst           |  34 +++++
>>> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  24 +++
>>> 5 files changed, 202 insertions(+), 1 deletion(-)
>>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
>>> create mode 100644 docs/fusa/reqs/product-reqs/arm64/reqs.rst
>>>=20
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/=
fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> new file mode 100644
>>> index 0000000000..bdd4fbf696
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> @@ -0,0 +1,139 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Generic Timer
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +The following are the requirements related to ARM Generic Timer [1] in=
terface
>>> +exposed by Xen to Arm64 domains.
>>> +
>>> +Probe the Generic Timer device tree node from a domain
>>> +------------------------------------------------------
>>> +
>>> +`XenSwdgn~arm64_generic_timer_probe_dt~1`
>>> +
>>> +Description:
>>> +Xen shall generate a device tree node for the Generic Timer (in accord=
ance to
>>> +ARM architected timer device tree binding [2]).
>>=20
>> You might want to say where here. The domain device tree ?
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Domains shall probe the Generic Timer device tree node.
>>=20
>> Please prevent the use of "shall" here. I would use "can".
>> Also detect the presence of might be better than probe.
>>=20
>>> +
>>> +Covers:
>>> + - `XenProd~emulated_timer~1`
>>> +
>>> +Read system counter frequency
>>> +-----------------------------
>>> +
>>> +`XenSwdgn~arm64_generic_timer_read_freq~1`
>>> +
>>> +Description:
>>> +Xen shall expose the frequency of the system counter to the domains.
>>=20
>> The requirement would need to say in CNTFRQ_EL0 and in the domain device=
 tree xxx entry.
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Domains shall read it via CNTFRQ_EL0 register or "clock-frequency" dev=
ice tree
>>> +property.
>>=20
>> I do not think this comment is needed.
>>=20
>>> +
>>> +Covers:
>>> + - `XenProd~emulated_timer~1`
>>> +
>>> +Access CNTKCTL_EL1 system register from a domain
>>> +------------------------------------------------
>>> +
>>> +`XenSwdgn~arm64_generic_timer_access_cntkctlel1~1`
>>> +
>>> +Description:
>>> +Xen shall expose counter-timer kernel control register to the domains.
>>=20
>> "counter-timer kernel" is a bit odd here, is it the name from arm arm ?
>> Generic Timer control registers ? or directly the register name.
> This is the name from Arm ARM. See e.g.:
> https://developer.arm.com/documentation/ddi0601/2023-12/AArch64-Registers=
/CNTKCTL-EL1--Counter-timer-Kernel-Control-Register?lang=3Den

Right then i would use the same upper cases: Counter-timer Kernel Control
register and still mention CNTKCTL_EL1 as it would be clearer.

>=20
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Domains shall access the counter-timer kernel control register to allo=
w
>>> +controlling the access to the timer from userspace (EL0).
>>=20
>> This is documented in the arm arm, this comment is not needed.
>>=20
>>> +
>>> +Covers:
>>> + - `XenProd~emulated_timer~1`
>>> +
>>> +Access virtual timer from a domain
>>> +----------------------------------
>>> +
>>> +`XenSwdgn~arm64_generic_timer_access_virtual_timer~1`
>>> +
>>> +Description:
>>> +Xen shall expose the virtual timer registers to the domains.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Domains shall access and make use of the virtual timer by accessing th=
e
>>> +following system registers:
>>> +CNTVCT_EL0,
>>> +CNTV_CTL_EL0,
>>> +CNTV_CVAL_EL0,
>>> +CNTV_TVAL_EL0.
>>=20
>> The requirement to be complete should give this list, not the comment.
>>=20
>>> +
>>> +Covers:
>>> + - `XenProd~emulated_timer~1`
>>> +
>>> +Access physical timer from a domain
>>> +-----------------------------------
>>> +
>>> +`XenSwdgn~arm64_generic_timer_access_physical_timer~1`
>>> +
>>> +Description:
>>> +Xen shall expose physical timer registers to the domains.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Domains shall access and make use of the physical timer by accessing t=
he
>>> +following system registers:
>>> +CNTPCT_EL0,
>>> +CNTP_CTL_EL0,
>>> +CNTP_CVAL_EL0,
>>> +CNTP_TVAL_EL0.
>>=20
>> same as upper
>>=20
>>> +
>>> +Covers:
>>> + - `XenProd~emulated_timer~1`
>>> +
>>> +Trigger the virtual timer interrupt from a domain
>>> +-------------------------------------------------
>>> +
>>> +`XenSwdgn~arm64_generic_timer_trigger_virtual_interrupt~1`
>>> +
>>> +Description:
>>> +Xen shall enable the domains to program the virtual timer to generate =
the
>>> +interrupt.
>>=20
>> I am not sure this is right here.
>> You gave access to the registers upper so Xen responsibility is not real=
ly to
>> enable anything but rather make sure that it generates an interrupt acco=
rding to
>> how the registers have been programmed.
> I'm in two minds about it. On one hand you're right and the IRQ trigger i=
s a side-effect
> of programming the registers correctly. On the other, these are design re=
quirements which
> according to "fusa/reqs/intro.rst" describe what SW implementation is doi=
ng. Our way of injecting
> timer IRQs into guests is a bit different (phys timer is fully emulated a=
nd we use internal timers
> and for virt timer we first route IRQ to Xen, mask the IRQ and inject to =
guest). If I were to write
> tests to cover Generic Timer requirements I'd expect to cover whether r.g=
. masking/unmasking IRQ works,
> whether IRQ was received, etc.

This is true but i think it would be more logic in non design requirements =
to
phrase things to explain the domain point of view rather than how it is imp=
lemented.

Here the point is to have a timer fully functional from guest point of view=
, including
getting interrupts when the timer should generate one.

Maybe something like: Xen shall generate timer interrupts to domains when t=
he timer condition asserts.

>=20
> I'd like to know other opinions. @Stefano, @Artem
>=20
> ~Michal

Cheers
Bertrand=


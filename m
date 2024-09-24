Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C139F984063
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802448.1212684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0qA-0007Vs-3U; Tue, 24 Sep 2024 08:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802448.1212684; Tue, 24 Sep 2024 08:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0qA-0007St-0L; Tue, 24 Sep 2024 08:24:10 +0000
Received: by outflank-mailman (input) for mailman id 802448;
 Tue, 24 Sep 2024 08:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6Gt=QW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1st0q8-0007Sj-Qb
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:24:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2614::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e070ff9-7a4e-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 10:24:08 +0200 (CEST)
Received: from DU7P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::9) by
 AS8PR08MB8350.eurprd08.prod.outlook.com (2603:10a6:20b:56c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.12; Tue, 24 Sep
 2024 08:23:58 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::51) by DU7P250CA0026.outlook.office365.com
 (2603:10a6:10:54f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25 via Frontend
 Transport; Tue, 24 Sep 2024 08:23:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Tue, 24 Sep 2024 08:23:57 +0000
Received: ("Tessian outbound 3e266b55d80f:v465");
 Tue, 24 Sep 2024 08:23:57 +0000
Received: from L5b5578dced13.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FCFF6A39-693D-4CF8-A76F-1F223B6A6790.1; 
 Tue, 24 Sep 2024 08:23:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5b5578dced13.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Sep 2024 08:23:51 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB5PR08MB10113.eurprd08.prod.outlook.com (2603:10a6:10:4a6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 08:23:47 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 08:23:47 +0000
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
X-Inumbo-ID: 5e070ff9-7a4e-11ef-a0ba-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cIcy5P2xXJQiaEK9Vle/TYJ5Ho8TTOVyLIrd5MuXfMwbp6jddn4Vho2Owz1Hyaskk69l5MAd1vXEwIQRByLYJ32dF4csa6s348rn3vdq1j9cPTgXj3Ak5skCWnyt4N606/4hMuLbnZgwO2DRJP6NRXyhS2AwR4Qr6QhuVp8mgfqdIOoyVPNb+eQsS7gs2EOj12AcLQvYSZbAVMNZ1mFKlnetdz9QPemZU9lMznKoHB64bIjTML5T/kViH+httYQaRahhzVK5Xv+ciAn75TX2Yq/BCtdFVBk9T/ZuerpMz+oaLvZNsy75MDLFCKjOnr0t+X4dulRGn5ZWNw9FSje+Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWGYdccDi4/VumoNnar6pSJ/vdRKkhVHN7xhYuL4BA4=;
 b=DbBAPUok28TJS0+SK1ZLm1y/NQddEsn73kFv+C8xdX16L4KwZUN9Xvq4jnwUmrNmjorp60nrhFuNc40d6q+JZy16Mfi/Rhq2uof0zXLvoHeC89xcHW2n6voNg9+NTcEcb8cwYZi/7eN0zemITptKMX0/zHQVTCg7uY5DK4sebkmKcYepdilU7l8hQm+b7tQ4gJRc+vVc5H4nJQAq/AaFmE2zlnXCiJ4+jMpKVJs8Dys+Xr/TErb7c9lH6gd5wuesuH/3wAaGggkf84U5d56sooVC3v0RfWboC+HPM7wxs2OO6M8oAr2N77c4LVVg2UYDJZt1AX8ZJV5muMZEkhUjdQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWGYdccDi4/VumoNnar6pSJ/vdRKkhVHN7xhYuL4BA4=;
 b=Q+pnfApO1dQVea+/bIYOy7T49uXj71XPVYoaSlJihx5klpx0IiWZm55Sl+ny+er3HZW4/timGG9nQtfzFG/2BWhvFWJ93Q/YtJwOEONswnokMcjNrfnAQltqFYcY4soKBJLuUj0WJ3IYPUaFnvkADiO/9jyUbtBmbJTM7aiV7E4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0b41f0df655f7ee2
X-TessianGatewayMetadata: H7DrOXuohgPlVRKX4LOozmVIPejzeObJbBHo5ofA6LFF1aJ+PxNjmaNV/CC2cqIoKCAxSCV8vVmcLu9K1jxPcoIO/G+juG9BSp0x2s22tEyPqBja9HPsuapw86GcfTvQt2GgFQQJPurxe4lILWp58rspw+jYFGChRBcr4jXyEpo=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEcs0Z4c1FqTUesH4tcgPF97sVJrDj5dbBjhownSqcYo4ErvI4mL9fffM8p2s07rlNk4/F247plhp6j3vUHZW6LyTMYgQpsPbm2ZiZ0ly7AUiwei6Kmgnp/KnKWy36Jr9H8n54kyHNlegCS5Y1uNTA4wFTVmnNO8WDc9Q/xm+29B6V9YVr9G4XeR3NWXyx9EcqYSsTa7BtlGwlRgEHpgGhEBlkAjE25W94mzfc1tp2+eOJMOaiEFiw2xVxEgQXTVoqFfbpoIXpeoP1WJ6N3J/vb+Hn+55+92BLs1pv0sSEa3dgUgouMnXeNgekx0tKLXzoq4BizuoGqgA8xU1BassA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWGYdccDi4/VumoNnar6pSJ/vdRKkhVHN7xhYuL4BA4=;
 b=gAqwtokPGvgGvqY1a/k7TjquVAlzyYNBEZ1QLRWcpNvgV1y/SPuCiIRbrq1s1qY9Pa/rfnFrNPm57Iz2Kpo/xMqbOLcYXfvahkE63XosUKxmZGxKY9cwY6V8BV/hCFb7EsfIYx/u93LAt+WQk5dq55GBLk+wH67C1wyeLlPjBkL60cBkYwjexeaVw3VAqgFdkO6S2sq8g9nO2L+1am8mfUahbr/sARdhCNAUdsElwzxwaOGQz0K9OtR1N9mrf+vjKmRvEAdG9zjBVybcVFk/VoUvgAaSwPFNKvpqoNg/UivPc4ZTtrc7CpAIHJS7VtYNyCmgekwTi/WaeIVmu/89kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWGYdccDi4/VumoNnar6pSJ/vdRKkhVHN7xhYuL4BA4=;
 b=Q+pnfApO1dQVea+/bIYOy7T49uXj71XPVYoaSlJihx5klpx0IiWZm55Sl+ny+er3HZW4/timGG9nQtfzFG/2BWhvFWJ93Q/YtJwOEONswnokMcjNrfnAQltqFYcY4soKBJLuUj0WJ3IYPUaFnvkADiO/9jyUbtBmbJTM7aiV7E4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 03/10] xen/arm: ffa: fix version negotiation
Thread-Topic: [PATCH 03/10] xen/arm: ffa: fix version negotiation
Thread-Index: AQHbCo5DR6ro4Z09O0aiPTgUk1dK17Jjv8yAgALhMQA=
Date: Tue, 24 Sep 2024 08:23:47 +0000
Message-ID: <BC0BF5AD-B3DA-4007-84E4-050884BBE08F@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <716e806316f8249611c8268f781efbea19273b4a.1726676338.git.bertrand.marquis@arm.com>
 <ec473bbd-1fea-4ccf-80d5-2f55f2db69ed@xen.org>
In-Reply-To: <ec473bbd-1fea-4ccf-80d5-2f55f2db69ed@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB5PR08MB10113:EE_|DU2PEPF00028D0E:EE_|AS8PR08MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: bcec2a9b-d12c-40b1-1f50-08dcdc723c5c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?JTyd3Zs0vzkzrt08vvwm97sDpJs1SBU9yJXTgYcY/QeuxhWXkYnHhzgNFxwW?=
 =?us-ascii?Q?rv6w+QQQDl1qKhAvfk2Iy7pk0iayh+zJegmpEp4aOYiRdDEuJxbNn85ZaGRH?=
 =?us-ascii?Q?NydAI3mO2Hsqy3nww0sMMpH6uOYx+zKsnw9uIoBLJjWuoM4AUjQw6NfowMQd?=
 =?us-ascii?Q?u8pAsFbo/yVeyEGW+e68DlXYi5elH9Oxn8Vj3ykKUpAo7pZ+EctEFLBX3pau?=
 =?us-ascii?Q?wPgtvpLTsGm1g+Wk4az6NKWKQKBT49nozp3DD6lRMvQGqNGQIJ4u4we+Bjtw?=
 =?us-ascii?Q?KRFPHI5nAOKwKduoNg6CoxY6T8GWhJOmTABAgdN99nLiS9y+xYfMvS7HDaWf?=
 =?us-ascii?Q?MbI31yLr9ehoyvFYbG/QAD9af6/+wL7Jlug4CBZedZUaLVSef2fLjJTfjRjx?=
 =?us-ascii?Q?CLOcgG/DRJlnhKG/sr2YMdoEDIt8Um0+CjiQKSJV8dvXVdyKr8Hj7FEc0IZs?=
 =?us-ascii?Q?mfQzLHVgjFcaTtpApmwSyvQpW4OF+Grz3Zz/LQlkXqke8KIez8EAxmz/r10R?=
 =?us-ascii?Q?PFSlNTocoFYOnDU++BXt2jPY+cpdEyJDaLuvcpcSGRCzn1jvWWazZZG9jSeI?=
 =?us-ascii?Q?hQ0fxT4gWKJZyKgmt88+qSvc161bLPEYpRV5u6mNWgrv52SYgI0c/Liu/j4K?=
 =?us-ascii?Q?+qi1zko9nqzVi4n/2CY6nQx+d6dYM71cpiSfgbhkK+KooUKQwCDfXAkXMgCF?=
 =?us-ascii?Q?GbZHZ9+geBuYjDGWBS4z6ZjdS50mfoHOcWwTrNI7B0S8u0qKFJe6g8NK8nbZ?=
 =?us-ascii?Q?INExz/+u6Vd7MPfxrrusH7lTFDQOo/bgGeEk2I5kVyHBTnXCB7RNlDlvViq9?=
 =?us-ascii?Q?/mArdj2CUKGMWVk9njeWyVnmZqRITQNH0cVD1HA2o6SFfq75CyrnCgVVL9Ps?=
 =?us-ascii?Q?O5drjASNnIUauW7WtUbBgnlMJBw+HXwvvp81P9KbHWmAU6M1AOkUdYyytOLv?=
 =?us-ascii?Q?g2raBUsgSg6s26iCHHRcn5bRTZn23Dhi7NnNrr34Y97CJPoNKefdQSIFD2zt?=
 =?us-ascii?Q?CQkDpVvEnBZJe2Q59eJBmt1Yj5Fu6udFHKL5bjwAqc1FzR2ydB3OpVZygjUL?=
 =?us-ascii?Q?7M1ibBmX9fgMFiqOUHmPLk1qc2DPAeNQSV3le/RfqZI4tHMneV+2909gz4j2?=
 =?us-ascii?Q?wk40Ok86lso5W6RV22M0MymacYB5lX4rRonLo/6A14Kxd/C0Qg9SGihG8OOP?=
 =?us-ascii?Q?/XAuPMJZGcPo5NGaUOjp8qWZU2rqXRnvrIgVf+DKBUOTOW28E9e47sH9e4Am?=
 =?us-ascii?Q?3m+0g7OZ/LwjemCctwSlFKVQzeHHic9cUqwk6tQ90wn0BPrpXru121Y8YRN7?=
 =?us-ascii?Q?2qDf+ocTw5L/MYYhaxbZ5QBAqU1ZZBjoUjboEsw2NkC/BQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <274B27CD9A957849908D4037631BFC1F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10113
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e8b8c28-99a4-45ac-e666-08dcdc72362c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Ps8sOuCTRbqyO+4C1VTZiLqqknyHDkiV4M+H1P+4lJG6yClHiCPYJBqyUsu?=
 =?us-ascii?Q?RKZvX8n43qs1sTTZi815CcsXxuyM9v7FUb+cEqx2wWpT5sdFZw/o1RrMFrrU?=
 =?us-ascii?Q?pR8y+RFZHlDs6pPB4uvZLhgbCCy4ny/RkC54dmmgauiNpU6WQ8krXn4B1eLa?=
 =?us-ascii?Q?B/p4t0pCamnONz5CQve+flYL4nlwkhF31twxVyJ+UbmQ1YG2eLlgdFIwnORO?=
 =?us-ascii?Q?qsPyp+yfsdmZXYhr3axxGFbdgfShFnO+bx3FAB6Y6SsAc6CyBVoFi0m4Ivgs?=
 =?us-ascii?Q?aX26rJaY2nEXSCzfIb25X3KY/qB5Dgaya6c1CewT4vQYyVys8OkXcMYozdOd?=
 =?us-ascii?Q?7LC9mNCE1WgrXhj3EDa0pM9bLpG303eunw00z6+MCyhQnW9AIX9schZTMoHw?=
 =?us-ascii?Q?Sq+77HNldZdxhgQMn1vJilEmTNZInrDrje7fsOd59yGL6hh9hp2c0uqGuHJV?=
 =?us-ascii?Q?qx4NGI/KQ/iALiD7AfXreRxu3olNIQSf2epBfm5Ymf0tGPugWmeX0M0Ytba9?=
 =?us-ascii?Q?wHMsU1A2m/twsquzsAqiDjgT6ziqRHxUlLxYZXnm22K0YKgaBjuC7APasrJw?=
 =?us-ascii?Q?QX4lrUsx51CIV1PvFQ9j+LsKWjE5loQX/DVLK2W1MjbUAojWYwSSvpPHJ1Zg?=
 =?us-ascii?Q?VR1IaTG1YS3Wv5gM1QycWHlWpAZ91Qtjvw1p9ECLrhjROjxmbP5RsaffoeA4?=
 =?us-ascii?Q?ROqrmTi56Y42a0OqJrygQfMK6V8HpFODy2WHE+8AeoXxCql7fw0YMo3EGs+S?=
 =?us-ascii?Q?PzL99teR+RKZDGxQVBEO796mKjRb/+DXUF5gTAE74cT4P4n9+s9mnZAyZcVB?=
 =?us-ascii?Q?+QaDGhqGWdzirvyIiPmF6D5QXP2DVolpv3H0giFBwsg0Z8dQKBTHo90HvV9T?=
 =?us-ascii?Q?2a8GnwnFLguvOxgoUmD4sYKAhC+vr/+S+0bWKve5c3Oks7QumkPP3/mdNS5t?=
 =?us-ascii?Q?PFlQiGtQCIZ3ouX8SI4v+VYddM4juxceSgBX+GNrGeGvjuRSOKm1j87kEZN1?=
 =?us-ascii?Q?HccJjO94gvornjvDP8EcDajBxc3aYz9ZeLMx7GECimh0bCrEoCzAeA6XzqRV?=
 =?us-ascii?Q?tyjlUA+ojeVZvWBq8lN8JJWi1An8BiV4yEPTHVKKisVRPKTKa4Kck5cDJdrL?=
 =?us-ascii?Q?MNKZtXXt56d1qclWhO810Y8Ag8BdqAV1dQFyy8CgnnV4ELauoHVpTXCGM3DF?=
 =?us-ascii?Q?Nc6DD8JBlpHInGpmarQdW0mTO3uk+79KYabdiLCVqFqLrngwBKynn2mFy/iD?=
 =?us-ascii?Q?0huwjhBWWDG2qroFV/8hpEIFs9AJvqr1o5lUGiY2NBrGh6L55uvQozoKcuZ8?=
 =?us-ascii?Q?kPlZQhQv45eQDrmoyb2Ucyeu6tMlxqCM1/4oMGrt5uuaFiMVbkWRMWDKawOT?=
 =?us-ascii?Q?Dc+HBUAO7aZCNQNHHuMXidf4DH9KClsur83pfCgsY2W7LJwJgjta9X9tNxCP?=
 =?us-ascii?Q?0iYES6JBFSZsuNdNoa7BvU3TmXeCo0P1?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:23:57.6351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcec2a9b-d12c-40b1-1f50-08dcdc723c5c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8350

Hi Julien,

> On 22 Sep 2024, at 14:25, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> NIT Typo: s/fix/Fix/ to match the other title

Ack

>=20
> On 19/09/2024 14:19, Bertrand Marquis wrote:
>> Fix FFA version negotiation with the firmware to follow the
>> specification guidance more closely.
>=20
> To confirm, below is based on 13.2.1 in DEN0077A, is that correct? If so,=
 can you add a link in the commit message (and maybe code).

Yes it and i will add a link and description to the commit message.

>=20
>> When the firmware returns OK we can have several cases:
>> - the version requested is accepted but the firmware supports a greater
>>   one in the same major.
>> - the firmware supports a greater major version. It could still return
>>   OK even if the version requested is not accepted. Reject it.
>> - the firmware supports a lower version. It will return OK and give that
>>   version. Check if we support it and use it or reject it if we do not.
>> Adapt the code to:
>> - reject any version lower than the one we support or not with the same
>>   major version
>> - use the version returned if in our supported range (currently 1.1
>>   only)
>> - use 1.1 if the version returned is greater.
>> Also adapt the handling of version requests from VM:
>> - return an error for a different major
>> - return 1.1 for a version >=3D 1.1
>> - return 1.0 if 1.0 was requested
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/arm/tee/ffa.c | 38 ++++++++++++++++++++++++++++++--------
>>  1 file changed, 30 insertions(+), 8 deletions(-)
>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index 7ff2529b2055..1f602f25d097 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -141,13 +141,24 @@ static void handle_version(struct cpu_user_regs *r=
egs)
>>      struct ffa_ctx *ctx =3D d->arch.tee;
>>      uint32_t vers =3D get_user_reg(regs, 1);
>>  -    if ( vers < FFA_VERSION_1_1 )
>> -        vers =3D FFA_VERSION_1_0;
>> -    else
>> -        vers =3D FFA_VERSION_1_1;
>> +    /**
>=20
> Coding style: We are use a single '*' to start comment.

Ack

>=20
>> +     * As of now we only support 1.0 or 1.1.
>> +     * For any 1.x >=3D 1.1 return OK with 1.1
>> +     * For 1.0 return OK with 1.0
>> +     * For anything else return an error.
>> +     */
> > +    if ( (vers >> FFA_VERSION_MAJOR_SHIFT) =3D=3D FFA_MY_VERSION_MAJOR=
 )
> > +    {> +        if ( vers < FFA_VERSION_1_1 )
>> +            vers =3D FFA_VERSION_1_0;
>> +        else
>> +            vers =3D FFA_VERSION_1_1;
>=20
> I feel the logic is fragile. The first ``if`` is generic and I think it w=
ould be easy to update the major version without updating handle_version().=
 To some extend, the same problem would happen with the minor version.

so something like:
if (MAJOR(vers) =3D=3D MY_MAJOR)
{
   if (MINOR(vers) < MY_MIN || MINOR(vers)>MY_MIN)
	vers =3D MY_VERSION
   else
        keep requested version
}

>=20
> AFAICT, this is not a new issue, but as you touch the code, we should pro=
bably harden it. I could settle with a BUILD_BUG_ON() to catch any change o=
f the minor/major.

i could see a BUILD_BUG_ON(MAJOR(MIN_VERSION) !=3D MAJOR(MAX_VERSION))
Is that what you have in mind ?

>=20
>>  -    ctx->guest_vers =3D vers;
>> -    ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
>> +        ctx->guest_vers =3D vers;
>> +        ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
>> +    }
>> +    else
>> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>>  }
>>    static void handle_msg_send_direct_req(struct cpu_user_regs *regs, ui=
nt32_t fid)
>> @@ -530,7 +541,8 @@ static bool ffa_probe(void)
>>          goto err_no_fw;
>>      }
>>  -    if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
>> +    if ( vers < FFA_MIN_SPMC_VERSION ||
>> +              (vers >> FFA_VERSION_MAJOR_SHIFT) !=3D FFA_MY_VERSION_MAJ=
OR )
>=20
> Coding style: the second line should be aligned with 'vers' rather than i=
ndented.

Ack

>=20
>>      {
>>          printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers=
);
>>          goto err_no_fw;
>> @@ -542,7 +554,17 @@ static bool ffa_probe(void)
>>      printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>>             major_vers, minor_vers);
>>  -    ffa_fw_version =3D vers;
>> +    /**
>=20
> Coding style: We start comment with /*.

Ack

>=20
>> +     * If the call succeed and the version returned is higher or equal =
to
>> +     * the one Xen requested, the version requested by Xen will be the =
one
>> +     * used. If the version returned is lower but compatible with Xen, =
Xen
>> +     * will use that version instead.
>> +     * A version with a different major is rejected before.
>> +     */
>> +    if ( vers > FFA_MY_VERSION )
>> +        ffa_fw_version =3D FFA_MY_VERSION;
>> +    else
>> +        ffa_fw_version =3D vers;
>=20
> Looking at the code after your series (didn't check before). We don't see=
m to use ffa_fw_version for other than checking that FFA was detected. So w=
ouldn't it be better to stop storing the version?

We are only supporting a firmware version with 1.1 at the moment but when w=
e will add support for FFA version 1.2 in the next weeks this will not be t=
rue anymore so if this is ok with you i would rather keep it.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall




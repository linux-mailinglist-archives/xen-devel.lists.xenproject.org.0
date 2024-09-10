Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6BB972C90
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 10:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795120.1204264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwcv-0001mw-5p; Tue, 10 Sep 2024 08:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795120.1204264; Tue, 10 Sep 2024 08:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwcv-0001kQ-33; Tue, 10 Sep 2024 08:53:33 +0000
Received: by outflank-mailman (input) for mailman id 795120;
 Tue, 10 Sep 2024 08:53:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GcQA=QI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1snwct-0001kK-LS
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 08:53:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26a01aa6-6f52-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 10:53:30 +0200 (CEST)
Received: from AM6PR0502CA0070.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::47) by DB9PR08MB7626.eurprd08.prod.outlook.com
 (2603:10a6:10:30a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.15; Tue, 10 Sep
 2024 08:53:17 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:20b:56:cafe::2f) by AM6PR0502CA0070.outlook.office365.com
 (2603:10a6:20b:56::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 08:53:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 10 Sep 2024 08:53:15 +0000
Received: ("Tessian outbound 98d42a42832d:v441");
 Tue, 10 Sep 2024 08:53:15 +0000
Received: from L2e3d06cbe37a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3BB6B616-F81C-46D9-85D6-82A97EFA3243.1; 
 Tue, 10 Sep 2024 08:50:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L2e3d06cbe37a.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Sep 2024 08:50:07 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AM9PR08MB6050.eurprd08.prod.outlook.com (2603:10a6:20b:285::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Tue, 10 Sep
 2024 08:49:59 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7962.014; Tue, 10 Sep 2024
 08:49:59 +0000
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
X-Inumbo-ID: 26a01aa6-6f52-11ef-a0b5-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=etlRduFgU/ais4G+rmKcC9hO64+rd6Kq1XTBVPv0PeEEJxo7FcjoyhXwqtlQ1/6w95iw0S5mn7gEJrjo+jL1cwU0kvUxXa9Nf9DcdExfi5l73YaPt7w3cJOviqoGOle0BGuInGAHz61PmfReGndWiEjCwDJrwgkc6kBxhTCC559MB3cOAy7WQLZ6XBUeiFPoFOBMB2aj18Lft1gddRGvTfL+h3o0ftBxVDhbqaWomfrNB+WLnGxysDspPib1BBZ0rjjpTkhQGcohKeaXXORNhc4cf8Xixfu8TuFu+13znPOMOmTsgxPVdsHMIQQFeUhbveWIxSd2pbztBamh+EGUow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idv1nK4Gptf+918VwwTFDLlODafrxluPiCYAOpZTlK8=;
 b=b02u87nPzuJXC1BxNZgMKFwt2BZPP+RW1Kh55KGerR5lh68MiZEURNlFlrKmGrxIevpD5E2U8RrJ00bSObX4Boa1rX4bqjiMTmi00NuAn9Xdvm1fZU6DO8qiORLSJms+Yn5RoNBlZLpDyYAo3sBBr8sYdyv6wYeqWh4wvnO6ffQowiUxUek/L8VU26Nqvwgpu6r7N0ffAowZofNFgDMoBg8mQdztZdc2Gf3EjdfI7xF6paf0xNCVMfmROlWmT3o7qFRVLq+nM5D/h164Fxh5GdNHBh2B2NRGMGSoISorfsvB2TIXsdTOhHf2MshbRye3GF5TQbWbJbeN7dm6mZYhpA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idv1nK4Gptf+918VwwTFDLlODafrxluPiCYAOpZTlK8=;
 b=jwGgbQK3TCt6qKxgd0PTbnw7hAL13ZoJQ14ovSikv7ZbGIC9ffAmx5V0uqQSyb/mmqqI2+V7epRCMwGxTmhguAySZEJREVX1HmRBKBO9470vrnUvVHfliJm7ZES69PvC9zVbAe0iX0YXUDJ5GTo26r7C+hZVHYzlYHSJWCT3eFc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b4a9c3697dfcd282
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JB76P5lIS4ZihXEdSeYb7z5iHNrI4RDan5PWJz7OlLUZydIPGj1+fzm6NL8VJSYiGR/fLM/vRu1B12zXz+sc3ykblGpeDrnWM1rOhmXFAJgL7JQTpU50sQAsG26Cw8ZRI1uWipbrD3qYzm6XHyZuIxcaKSAZc7fkROpPxFujXMVSrAg1dLpPmpvma8p9c/62DZj5ZYFdMxlkbVKElSioyYzr9j/d1BeUE0orldD4JnVq30zqLGXVj04pcJ/YUgPS4Mr/fc1/1EpvkjwKp5vWRhLmiSIhJDkVW15cwzVpT+e5td1qMPIukYLYrDE6SGig364D/AzI0pHOpDUsz7s+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idv1nK4Gptf+918VwwTFDLlODafrxluPiCYAOpZTlK8=;
 b=SWXgpE/YVydLHHIk2ejA7GYnADqiBOdRSYNwkYEK/vq4F3gFduT0Odzk6AG2oXqMMttiU+Be5Md40APHHud+ad+0au779lv1uz00vHhPDL3bjnMgC02P0uMcfaHvWTNJmlTl8B2MJrEVVlCqsQC+5mcKupcXCsVSCd+GYAnEm918q+cFx/6Fd6At51Agw58YAdYn3hRzwpxw/cHXoNhakJmAMjPPejkGGcVRvGLoZWDJtl7jRn79KayHn+kQ8xpJ4QStPwW5tqF9bIkuAla+WpJ6PFSGC4IzNZG/5Zxk5vW9x9T+9JuX1kipQIwC8rrmzGyIiIanUDn++BF5khwoCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idv1nK4Gptf+918VwwTFDLlODafrxluPiCYAOpZTlK8=;
 b=jwGgbQK3TCt6qKxgd0PTbnw7hAL13ZoJQ14ovSikv7ZbGIC9ffAmx5V0uqQSyb/mmqqI2+V7epRCMwGxTmhguAySZEJREVX1HmRBKBO9470vrnUvVHfliJm7ZES69PvC9zVbAe0iX0YXUDJ5GTo26r7C+hZVHYzlYHSJWCT3eFc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/gicv3: Fix ICH_VTR_EL2.ListRegs mask
Thread-Topic: [PATCH] arm/gicv3: Fix ICH_VTR_EL2.ListRegs mask
Thread-Index: AQHa/fvtz5D3yIGWFECvg14op8Y9NrJQwNAA
Date: Tue, 10 Sep 2024 08:49:58 +0000
Message-ID: <024A34D9-7D40-437D-9CC2-2CCC25A5DC57@arm.com>
References: <20240903122147.2226623-1-michal.orzel@amd.com>
In-Reply-To: <20240903122147.2226623-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AM9PR08MB6050:EE_|AM2PEPF0001C70A:EE_|DB9PR08MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c1e6e1-1281-4e81-083a-08dcd1760295
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?m+loXnGWa/2WdxleeRboBL1x/8xqp9xTEupLIBwK3L7dz6C4uvW21XzWZqP9?=
 =?us-ascii?Q?4/OrimhhMa2Pfd/pNL11rMbBQt5XTa3iB3+tqPJsvHtmE3uIiFv+j7BYlXxZ?=
 =?us-ascii?Q?rd+GoKMMmNhVMrRZQCk18W4gaXwfLCLPM5sByZ5ldpRB4Q06lxQ3LZnmhy5Z?=
 =?us-ascii?Q?jVswdXh1zEGWCI1oC0WYS+bj0bidx4RF2+YNUpdyq9ZzxBc5pDMADEPuqEyh?=
 =?us-ascii?Q?2gYiAbKLD283aFsr2lgbIaji0Q8cUZtkbkI6uO0M7stpmBqXNJTg1b0chZxW?=
 =?us-ascii?Q?/HQQcclFNAK8vqnjRkpodEzJsYU0hHWjg00wHvMFv63X+R94JGvfsFcpSAD8?=
 =?us-ascii?Q?wxVNRJbwg9GA58l0H8F7vCPg0fTVp1yDsM4O3B2Xlx4vE024xCY4LVc2QB5a?=
 =?us-ascii?Q?TGiPFuV7YUi4u/kufkvGyhvFyrz5X+PeizkX0/hKy8wLDvJ7B7ZxENegnWpH?=
 =?us-ascii?Q?ErPe2w2kfxXLMCW/SOjgd//vj3JMLycv0r2qTVQgVxXKGkJotSSAxCY3lPnz?=
 =?us-ascii?Q?TsHKjU8wOkCGbpreS/PuXQauwm1PlDNE0cBeHINIV8Dc4kkcngdgbf2fLSy4?=
 =?us-ascii?Q?AsG4ieMDwdjmptnAXBcZPOKvQ7vBnAinp+074GMOQcfs75HC2N2p6jNknJFV?=
 =?us-ascii?Q?WJa407QVh1PP6Ph4Or3l9UKGWVEMAJMvo4o26nCD0IlJDtk9+anEGfbgRLYS?=
 =?us-ascii?Q?1Z/TUi1VVeUqRNi8sM0wkA+D/JZqdUeoISeqJA1SdJcfn2lg4QYZy5wmGguq?=
 =?us-ascii?Q?lQv6uTOiRP8sth6RZ9wVgbJop67iKrujrRPfySUWpGWKgmJhB2UeHw9AN9YN?=
 =?us-ascii?Q?wKn2kMEoCY+IdSaiFblf4uK/NBazO1wBf9w0bGZHt90lxwVPXO9USj+dwcPT?=
 =?us-ascii?Q?8pS2EM1P2LxRyKg9/Bc/WU6xtDT2iHm1LDVqyCWMraFY197QBZSTYWezdHvV?=
 =?us-ascii?Q?t46nmLXaIre7LKYNM0OVcapLfSYXaKwbOBvAh3Sm8Z9AaZHy5bsLmEXhcgtz?=
 =?us-ascii?Q?4h1d3oJCrMXa6K76XIDskr3ANOJZrziqOkPGSpfXeErJy/JiqM12L+CDTlfm?=
 =?us-ascii?Q?XDw8zCiKbRFaJXq1sDAfSZhIKzSrTTIVb75tOk3PApkOpN2gmMYUaoF7ZAat?=
 =?us-ascii?Q?+ftX+cXtraNgcE/zNteI6qDM4Tgzc0NLFdpbcwfTKqAW/vQ7SKpdJqfjyX8J?=
 =?us-ascii?Q?7/3M7J7Rt6MDuADypWVR6bcSNwuRgdnFWELZIfBPoEo52lJ30/KH20Xq1g2f?=
 =?us-ascii?Q?QY2mM5DWKOJ4+bIIFNZeNE/PRQHgHSkWSpeU1cTypppoz0G/4XgWCqh+1Xaw?=
 =?us-ascii?Q?t0eauVGg0V6P/QmobCEiLYBGH0X3EMBdmHv6hjGRBpTkRYCs7gnhw6lVh2vQ?=
 =?us-ascii?Q?Je60ts3TaLSqemvkvhq6cUHkEq/ixBEo2mbnriXdTXnXnIJ+Mg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA3DFBDF264EF2478FC6665B0B4395E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6050
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a2321f4-fc25-4151-385b-08dcd1758d31
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ryD9u9O9y8WxgKj3tFyBvkv3/O7JkEhriQpktECF5drVgnxI11+jCCJUHp9D?=
 =?us-ascii?Q?MXZ6OQzLK3vhei1Iy0/2eIU1vqMac/atxEMG2Mekkg+7V2XNBu00LA4cqADA?=
 =?us-ascii?Q?94BzHIOESbGDalxUbHtD6IsZfskBslqZsqPRTfVt5ZtH5Ln3pYUguBCJ6yIO?=
 =?us-ascii?Q?F9KcjN2fBSHQugI5MulsctAL79Zywb3mkeHtFkqxkgVYPl8khRZb77E5w2jZ?=
 =?us-ascii?Q?mbs2laxhpV1lPbKAUTRIbHyOZtLbulQY4twMkEJ7ioTQk/YKd7T4jSHHzxbP?=
 =?us-ascii?Q?w6n84eHHb0slHJH/C07NVqq2D6a9NAxhBywQiZnuSzI6C1c3h7GiK5Kof3DY?=
 =?us-ascii?Q?ypjxUsBzdD+ajRoNw8IO00z8c7RgLWuBvxcQAmD1VPdG/J1ytyhXfIG2wamQ?=
 =?us-ascii?Q?9YflVM3k3B6hgB15lPr7X+8QwEqluPUboxrLNg4pcNHWcBBLWkCQcGxuVs4t?=
 =?us-ascii?Q?6M73Vyl//LU9naxf5oEDwNezrOadIhelsicuhbp/m5k9AtSeP+lKnF0G55E6?=
 =?us-ascii?Q?PvJgiwVE+EqR6+X8Sx4/priGWbWi7t6+7FOuvaTtY2eiK4zqsnL5ockAwR/M?=
 =?us-ascii?Q?iKWrcSsKjxawjwhj7BaGe1bbJTarm9vyaoGvgEWAKa0GHR+y+UdyYioKF74/?=
 =?us-ascii?Q?XgNJIWuNx1+zSWv9gwO2Rg+yoLnTc6VVkfF1iMBgEJ0LPfMC9K8o0zLsnOEJ?=
 =?us-ascii?Q?uIjIn/Wt/n9GWDcRAMtzv7rBVyfsbuO2tCt3tYeCmKuSXVazon2U/r/eKKip?=
 =?us-ascii?Q?i2i62Sarr4GyQd1Op2eAsfcvCNcJ0tsFIyuYgr1t9488okUdC0I+uR5f55XL?=
 =?us-ascii?Q?d8YB9iRY7CYtpERpEs8VsvIB4Cd1tcU067HHvDpRoj3vvGChMpKeSefCmwui?=
 =?us-ascii?Q?hX22uQGansbXB5f9oczezqxln37tRcaUy2gGIrQ2jfv9HQbNgxOLU5hNbEO7?=
 =?us-ascii?Q?rf+3Y5q7bkRE4llitxkLafKd9Vokyip40lsCn7n2HWunrb1tzUYbmwDYauhc?=
 =?us-ascii?Q?VfjnPd3ReM1C2RUV0AdxTQ3X7g3M4S98vtmgmQJZIUtLV1JvRBf6IS9q0Vxa?=
 =?us-ascii?Q?Kc1W9YxxOuOaTOCkiYZowAh1iLXMGtkSjeF9BB15jYsjlTjY984CKf3cBMR/?=
 =?us-ascii?Q?AKsqg1OZdEzEJLBnsoqTTXbPHOd/xwA7k8+cfPQb31jTS0CjGacv+R4WxQ+I?=
 =?us-ascii?Q?tddcB3DnXJQQnO3Ln320Nc0OKThSArS5X/ZcM1tlBK0ut34tUN1VS+drAawq?=
 =?us-ascii?Q?HJzqzS/DBdcECZiGUjnoGnKbQiIPNLSMLOI8EBwzV7UeUun6AFYIeI+WyyDG?=
 =?us-ascii?Q?ZPpkgROU0qn3/Is/BYnbq6n9lZl1gsPFUC72WNj9g8YIQR6ooo1p9wjPzJwa?=
 =?us-ascii?Q?8I8TRE/R+z/wqMqnSyKkmCE7xbQIhntWl2rDGH58zrucEIZqIQzoXfJIikpT?=
 =?us-ascii?Q?+kDIjQLhoUA3QgjsC8WeYFViSgf54xMh?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 08:53:15.8966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c1e6e1-1281-4e81-083a-08dcd1760295
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7626

Hi Michal,

> On 3 Sep 2024, at 14:21, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> According to GIC spec IHI 0069H.b (12.4.9), the ListRegs field of
> ICH_VTR_EL2 can have value between 0b00000..0b01111, as there can
> be maximum 16 LRs (field value + 1). Fix the mask used to extract this
> value which wrongly assumes there can be 64 (case for GICv2).
>=20
> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Nice finding.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index 227533868f8d..2af093e774e5 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -189,7 +189,7 @@
> #define ICH_LR_GRP1                  (1ULL << 60)
> #define ICH_LR_HW                    (1ULL << 61)
>=20
> -#define ICH_VTR_NRLRGS               0x3f
> +#define ICH_VTR_NRLRGS               0xf
> #define ICH_VTR_PRIBITS_MASK         0x7
> #define ICH_VTR_PRIBITS_SHIFT        29
>=20
> --=20
> 2.25.1
>=20



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4C1A21918
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 09:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878941.1289154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td3Vs-00038x-9q; Wed, 29 Jan 2025 08:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878941.1289154; Wed, 29 Jan 2025 08:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td3Vs-00036J-6m; Wed, 29 Jan 2025 08:33:32 +0000
Received: by outflank-mailman (input) for mailman id 878941;
 Wed, 29 Jan 2025 08:33:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Ogr=UV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1td3Vq-00036D-PG
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 08:33:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20613.outbound.protection.outlook.com
 [2a01:111:f403:2614::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6aaff4d-de1b-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 09:33:28 +0100 (CET)
Received: from DB7PR05CA0053.eurprd05.prod.outlook.com (2603:10a6:10:2e::30)
 by AS8PR08MB10269.eurprd08.prod.outlook.com (2603:10a6:20b:63c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 08:33:23 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::f6) by DB7PR05CA0053.outlook.office365.com
 (2603:10a6:10:2e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Wed,
 29 Jan 2025 08:33:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Wed, 29 Jan 2025 08:33:21 +0000
Received: ("Tessian outbound 5438980c8758:v560");
 Wed, 29 Jan 2025 08:33:21 +0000
Received: from L93bdccdab809.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 53BE5880-9130-4362-B76B-CE7ABDF3B472.1; 
 Wed, 29 Jan 2025 08:33:14 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L93bdccdab809.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jan 2025 08:33:14 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB3PR08MB9011.eurprd08.prod.outlook.com (2603:10a6:10:431::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 08:33:10 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 08:33:10 +0000
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
X-Inumbo-ID: b6aaff4d-de1b-11ef-99a4-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BgZ1A4Yz3sCY5gLcQEsjQbLe1cGl+Ro5Zy2pa0SUpsALf+453wfdFDkSHuwTXRvnKaV2GgtygO/sSVfWCQp9f+/F562oILm3DhZHx6LyfYHnBk3f7nNwuvKtOLtMTLFGwSWI0mKk3Z1fw9/DfII5pnhccxmhYLyqNpmor3+/8t+XBeXfvnLLv05Y/o+o+iJaj9EJkfVCjp+yZBdEEXrg8UZS0QiUVj5wLtQbwmvijH+WzvAh6jD6LcMWBezFop/T9ae0aW67tfpAdYjgCEoVjAHhXf8j+ougJcgYL09uBfc9uMTrVVBkq0AWxyxIN31xTugWaj7KWxhwaohsDArjdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUGPsp/HPncD2Me3IzexOzyyKMaKje3Ik7MFSJyl5Jw=;
 b=FXphxdtWG3HmwrErfkuKmxuXc3lD0RD+sXSpfPAZRyLLQaGBB/zhUWxihWTXzBenqX2JGp5tf40v90d0orcZMovm1shGCAyFzILGt8NjcW5yWEowZqJeHFVXIX9psnz6/pjEhl9YKuPfJRx8q1ZnFyeYbiIGLB76xo6UkFYWbGRIMxT6ru/7oVRMrOX/azIGWvaO5u9NzijZgrVVng+tUgT5SPZ+Jz8Do/OXXw2cK5uFxSW0mKJvmT0MoF/GtUjbWWWnzHfriJu106Y1H1P0hupq//sW1YyK9geXv9FEobEAn+E3+AxV0DoAYGISGX1pnSd68NneAK/tvR7jpxM52w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUGPsp/HPncD2Me3IzexOzyyKMaKje3Ik7MFSJyl5Jw=;
 b=rhxRu04ndEMy0oYoiGA8/vwvUuSIKEzqlinTOZ0365ZRwVZC9Ku5u8rrK5QAnzoZ7qHHhJ4QNjDpNW6a3I3xKBLCMMBxW9AUGMkOwnhD9JgKygsCTPePcgAcwx5lMrduFKJ/5/nfUY0GWwj7PjkLvF8APZne5vCHM+GW3aLBe4w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9985bb8269ac43cc
X-TessianGatewayMetadata: uNHoVc5anDsmRhPgy7kdyTS9W+FQmXbKjWFZgImbsFRpf53IgnK1VrAsWtRbtyswiKXYhn5pG9f4hxB80XsF0pIY/h1eCtKGkUNBACF28/5+C9chgdi+2AcSdWw0Ot2YEodt826mdUnKmFcHI4YR6g4d4IPyf7eF3qd3l8zOU+4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yE09Ib7+wX9gNzA2Gbumc4qAJXd2PMATVwZPgoCagcuBu+YpzgOgAg+mqWaPihx+uldt5sFnPGBeltHVdqdJzeXCdrLjEoDzkKX3dfUCsCqiDSGmC1OHrbtl9VHJIoKp9V/ovx+YZ5TZpXfdcuQEraM6ovCSo4lM/jwGILOPWkYZezMv/Z3sxRjrQDWgCzLk8ZyArV9xbLVV+ZOYvxBLnHnmxRRx6Ie2v3M8QK5q34a157HgRhTupSzbGkQ0VJXo+A3RnAqy/kM6si+qXnxrR2Hqc6SBIna4h/QpS++rUZGXYwRbHYx4kLcJva/g/qYCDmMbcQYGfK9aY+vstWuskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUGPsp/HPncD2Me3IzexOzyyKMaKje3Ik7MFSJyl5Jw=;
 b=eT/buyRKUKe42lrYAQ6ZfpKltIPMpetNqvhiTytKdm+g1A2Cy7sRFxU7Ty+GvgR56YKdNkDDhOwyEvwf0KxPpdVQL4MILDtcZbzfDW6Q7faVh8fUTZXbm99XwnaudF0JE0zW7f3fmBDbgXGr1lQrgG9qTLWZVT5JitN56miRzPmoIefXds7w3s8f+3rDRKMkm+kGzslh2d2SOqHBbkd7alfsAo9n7btuTDmNsyptC1SiyAo42PA3geZ3AyG10K/fjGnIJB4AFGk1qgZF/2ZdOTkpNFgOQ8Rv4wuLwpbfIsqvzUjuiOuBik5S0uK9CFCayKWEA0ZtrAlxrtvTbJ0Ulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUGPsp/HPncD2Me3IzexOzyyKMaKje3Ik7MFSJyl5Jw=;
 b=rhxRu04ndEMy0oYoiGA8/vwvUuSIKEzqlinTOZ0365ZRwVZC9Ku5u8rrK5QAnzoZ7qHHhJ4QNjDpNW6a3I3xKBLCMMBxW9AUGMkOwnhD9JgKygsCTPePcgAcwx5lMrduFKJ/5/nfUY0GWwj7PjkLvF8APZne5vCHM+GW3aLBe4w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Topic: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Index: AQHbZr2QpA/avZzDqk6Vb2qnMvbcCbMtg1KA
Date: Wed, 29 Jan 2025 08:33:10 +0000
Message-ID: <ACD22224-C61D-40F1-8235-67F18E633019@arm.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
 <20250114195010.3409094-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20250114195010.3409094-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB3PR08MB9011:EE_|DB1PEPF000509F3:EE_|AS8PR08MB10269:EE_
X-MS-Office365-Filtering-Correlation-Id: 8082e965-9efd-48e2-9835-08dd403f9707
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?DEzJmSSH6cCXhMQWx64h793Y3nKCaupCk0EAwoTx9KWvVea7TL9xAV5YF0Nk?=
 =?us-ascii?Q?TL7Qz3EZqcYcPAN5qoB12/zk50kZ4DOevtTUhxHYpD+hBT6G/GbsG2kTIZUq?=
 =?us-ascii?Q?G67fNmX14IMs6G7VwsN/JRQTXE8LO/0w895V9IIEQfPgeVvL1TcT06AuIEy+?=
 =?us-ascii?Q?CjPXJTxlaAsoM2NeUCadZvx6sKKRCnD3I85zygnkqRpSvuwZoCl6obAVc9C6?=
 =?us-ascii?Q?mJC53CXL5hUfPSJLUmHQZYTgVv1yeM54z1L3iNSud509UhGRCW6qe+2K2+nN?=
 =?us-ascii?Q?yYhShAeJEZxFTci9NNpRN6b8ZpsdQAD5EY+MJmytJ1mabXTL2qxVnx+LoW9L?=
 =?us-ascii?Q?t8P04FdIJxp9AjsVmtw7Vx2eADRHC3WrdG1CcpaRvKG7I13jDkPKlybFFyES?=
 =?us-ascii?Q?FZA6FlgyP4IZOHth01Xz1YtlcnNUkq/X7E+2R7k0XZl4fNm3IdFa79zLFkk8?=
 =?us-ascii?Q?VMg96zkSk9UwsBrQagXFwGQZFvEzMPIrdQZRIohy+mc/4XDl7t/pSsyjicWJ?=
 =?us-ascii?Q?Lt6OaI72GofdJMVZFeLO7j5AoFEZLu6b6wQzdN9oGze7U9RPkhkW5n+/sNN2?=
 =?us-ascii?Q?Jn4zlCQg04zEwQ61Iw+2ufBtZV0WEFpbs+oatat3S9mSE9NBqLybFxhe5qxS?=
 =?us-ascii?Q?5ppSGEiF6agY7E9t/DUQwTo4BcHVgrQhAAQks+DZ2ngL/GR7u6zYLD+Px4wk?=
 =?us-ascii?Q?yt6LslbvS6d3iqT9+nlJQ/o9gz6W5FwBO+1lbMuTrkLMXDCNcIM++gZU0Gun?=
 =?us-ascii?Q?kAdRFdrrQtMeRR9Yq29f3JfOO5tGwENMgQPmFe4KJMndYz+wFXMOkNHEfr3X?=
 =?us-ascii?Q?gOnrvdtC5wAjHsIJfhlXN1hVGf4IqyNbCbGjhMcwo4pVwhWQgxR5mi7CvNUa?=
 =?us-ascii?Q?IVhjeNGSnr0OLSR0FZS7wA412gkCR9A9feHKMNg450GF6CXSw39wqaWdw6JA?=
 =?us-ascii?Q?b6IDf/22CQ+efAD89TTlcpoSO+geOxQtpbCf1CtZ0cziOXM8phuIlQLdfbOV?=
 =?us-ascii?Q?ZHBD311Uq8V3Yuwa2Hsb1uncKLCybM9TRmLGCArgmMYj6IwLkdI/2ttEDEGT?=
 =?us-ascii?Q?ec70YGF4a2RCY9UA2ae6xC69VEY5YDCBLTZLZIH5D4lMMCykCBDwO4SW0S8s?=
 =?us-ascii?Q?YK1bmnn+IDzLsnB9fzmuzs4bViXsk7SyovZXcOugBQcu7vdVGfjBlUZeqJPv?=
 =?us-ascii?Q?yeeSRmPHLrHMDXmYIfnjYndrnC9kCPF3kIBzS/WxQGJjAt45Fzk2SaRqr7Ky?=
 =?us-ascii?Q?Awx/v1s9ZUt+h5xseOVJyQFnQOnAdYBPyqYlQZA2UT06fZCgM0N7eohRZvP8?=
 =?us-ascii?Q?cBoVaRqg21b5r5pU+WC0CY3vWU/Aa6p4VuWhiiosRxKitV/uJ4pNIsCbGEoE?=
 =?us-ascii?Q?G0nt1gAWLFZ5Tn6hMPBVX8H1G6tskPO+yi1PEFQbMSEHQRNt16KGwKbJbYr+?=
 =?us-ascii?Q?OrOWGUErZ5ol7QBxFPxA/3omnRV21XUw?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3283CEDE47A9F749BC9F4DEFC6C5F97F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9011
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91e89d54-27a7-4913-6add-08dd403f901b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8GcwQXW3CmitcUs0i0Ro6hUHKnSANMM3yctQgODOIokgApXEPQnXlGt6FHk3?=
 =?us-ascii?Q?JagLLlLj4m8dMs3Id3OSyVr8jqWqqY//SifUX9jKJHpYBLb3cCuyYOSA421g?=
 =?us-ascii?Q?ZZsnFocJh0z11ea76tCE5YK1X1EeDk5Y8MmRPPLFK+mNifRvFANprBNwS+lj?=
 =?us-ascii?Q?1SknWCzL58AEQ+Lcmys8zrXCv0LMJooCGwxEKG0TaHMkz32H9V+RTAC3WSWC?=
 =?us-ascii?Q?fLUSEmWQokqg54hrPGRFSgfk/FOhTEGJ8Hr4wpFHP++Zx4msZyN8z5oZzKAS?=
 =?us-ascii?Q?CibNgGvsdTo0naFdeX5RKcUQQLtdIejMYba4yLd4iIEWhlcv+YLwp4dP3zoD?=
 =?us-ascii?Q?GZOHNWiYtedKGtkXhjrhH8prJGHb6627WTvifuouMJ9ERaKo7/OA/aMlGe5P?=
 =?us-ascii?Q?sy/VZ7qA6nmU0N86r5vSscjt48fds5rjkmcqMewGD15TBuU36U+8GGzdaAM7?=
 =?us-ascii?Q?QJ83glWC0gUYeKmwd+NyogR1PiR64oIYKUGd4pTKyiM71qyZnaXXcU0cWpH6?=
 =?us-ascii?Q?Yv0PFac/6DMPjZGQbPe+dd9AhC0JzHd6I6VYEzuP7s6h2MKTkYdWv6NGyDHK?=
 =?us-ascii?Q?w+8BYKl2bhtottGcvuffISutCw8NcFg18vpYVfi6TRYU8o3e4nNx2F1SFp1j?=
 =?us-ascii?Q?18e+Mdz1a0YNolQgGRKR9jI5NTHWAC95W0v6dX0UhjIdqD9mmChuyi5qjd8K?=
 =?us-ascii?Q?NdeH93uO4lznlEvgYUwhQ8snsxrqcAu33mi0tI8tMUfy2W0+ZsUIY2t5zyaA?=
 =?us-ascii?Q?h0wN9Y+kwylif95wjWmTO6/ILdmNl+6+A+CcmbXSaIRgOLJj2I5zOOIJypHD?=
 =?us-ascii?Q?xIbwQCO7IDeFZUgag3cm9RZbw1/26onprZjqrN4DNjrHthx4kmWn04FeThd4?=
 =?us-ascii?Q?tS5bvIVnBbrh0B30tfyKRfZaGXuhwunvrZwgP5VzQHw6AHxnrU9gpbeiFGzO?=
 =?us-ascii?Q?RkB86cfw1EhtdxDL6HEKvK9aTJAI/3au/NxWai5NyhtCSF6GcEqmI/PDiENj?=
 =?us-ascii?Q?eug/t7uLNNPlDBllCEirIYc+8G33CSnKWwcqnRG4pqVKKDjNrqVqwjZmUOmD?=
 =?us-ascii?Q?0HYS2yByikLw1r7VFM0C9+rpWBC1CJ+VUqWXBjZYOModswctKCEIJmSJXBTI?=
 =?us-ascii?Q?KfLNxDbG1h5AKjWFTLC2bSWSe2xhSy1rsjT1Zy0M3qsbjL64hZBaf05sjKZN?=
 =?us-ascii?Q?kusAiE7GFbBbgpWh6fncQuecoi82rijWmbXn4VxAejM92v6BEVboQ+c86IYS?=
 =?us-ascii?Q?GD7PRBU/JA5W8s0R9xvhJHuSdPp0b4FM79lXbijwYfG9qpzvxadOREDqEtfV?=
 =?us-ascii?Q?BJgl+MJmpguQz3FI+gpIfuIVZoFTRo53G6Kau7Z9C5xjTFgmnNOP7YCa+lhb?=
 =?us-ascii?Q?p4ywj4/RPJg9h0CrB2uEQYcOrrrw9pbZtO6c/E3I1vXgOsERqV+lUuRvPXtr?=
 =?us-ascii?Q?YC/J4DUOWexsrroJqfpsFdwTKpsNfYBu6cKbJPb/wkveK5xGO7rBT/bASQhM?=
 =?us-ascii?Q?+kTI3OJDpe8yJVc=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 08:33:21.7453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8082e965-9efd-48e2-9835-08dd403f9707
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10269

Hi Ayan,

> On 14 Jan 2025, at 20:50, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> We have written the requirements for some of the commands of the XEN_VERS=
ION
> hypercall.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> .../design-reqs/arm64/version_hypercall.rst   | 33 ++++++++
> .../reqs/design-reqs/version_hypercall.rst    | 65 +++++++++++++++
> docs/fusa/reqs/index.rst                      |  2 +
> .../reqs/product-reqs/version_hypercall.rst   | 82 +++++++++++++++++++
> 4 files changed, 182 insertions(+)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/doc=
s/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> new file mode 100644
> index 0000000000..1dad2b84c2
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> @@ -0,0 +1,33 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Capabilities
> +------------
> +
> +`XenSwdgn~arm64_capabilities~1`
> +
> +Description:
> +Xen shall have a internal constant string storing "xen-3.0-aarch64".

I would rather not have a requirement that will need changing every time.
Could we turn this into a description and link this to where we store the v=
ersion ?

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_capabilities_cmd~1`
> +
> +Capabilities AArch32
> +--------------------
> +
> +`XenSwdgn~arm64_capabilities_aarch32~1`
> +
> +Description:
> +Xen shall have a internal constant string storing "xen-3.0-armv7l" when =
it
> +detects that the cpu is running in AArch32 mode.
> +

Same here and also you have a "when" here and not in previous one.

> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_capabilities_cmd~1`
> +
> diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst b/docs/fusa=
/reqs/design-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..8bb7a66576
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Version
> +-------
> +
> +`XenSwdgn~version~1`
> +
> +Description:
> +Xen shall have a internal constant storing the version number coming fro=
m the
> +Makefile.

If you go this far i think you should give the name of the constant.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_version_cmd~1`
> +
> +Subversion
> +----------
> +
> +`XenSwdgn~subversion~1`
> +
> +Description:
> +Xen shall have a internal constant storing the sub version number coming=
 from
> +the Makefile.

Same here, please name it.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_version_cmd~1`
> +
> +Extraversion
> +------------
> +
> +`XenSwdgn~extraversion~1`
> +
> +Description:
> +Xen shall have a internal constant string storing the extraversion comin=
g from
> +the build environment.

Same here.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_extraversion_cmd~1`
> +
> +Changeset
> +---------
> +
> +`XenSwdgn~changeset~1`
> +
> +Description:
> +Xen shall have a internal constant string storing the date, time and git=
 hash
> +of the last change made to Xen's codebase.

Same here.
Also i would use the comment here and in previous reqs to give an example.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_changeset_cmd~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index d8683edce7..b85af19d19 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -14,3 +14,5 @@ Requirements documentation
>    design-reqs/arm64/generic-timer
>    design-reqs/arm64/sbsa-uart
>    design-reqs/arm64/hypercall
> +   design-reqs/arm64/version_hypercall
> +   design-reqs/version_hypercall
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fus=
a/reqs/product-reqs/version_hypercall.rst
> index fdb8da04e1..10bc7b6e87 100644
> --- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -59,3 +59,85 @@ Covers:
> Needs:
>  - XenSwdgn
>=20
> +Version command
> +---------------
> +
> +`XenProd~version_hyp_version_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve =
Xen's
> +version in the domain's x0 register.

Somehow you will need a req saying that how and hypercall is specified in g=
eneral
and then one req per hypercall:
Xen hypercall number 0  shall return the Xen version in register 0.
I would also prevent saying x0 which would make this aarch64 specific.

> +
> +Rationale:
> +
> +Comments:
> +Xen version is composed of major and minor number.

Can't we link to the requirement defining where the version is stored ?

> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Extraversion command
> +--------------------
> +
> +`XenProd~version_hyp_extraversion_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 1) for hypercall (num 17) to copy its
> +extraversion in the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Xen's extra version consists of a string passed with 'XEN_VENDORVERSION'=
 command
> +line parameter while building Xen.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Capabilities command
> +--------------------
> +
> +`XenProd~version_hyp_capabilities_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 3) for hypercall (num 17) to copy its
> +capabilities to the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Capabilities related information is represented by char[1024].
> +For Arm64, the capabilities should contain "xen-3.0-aarch64" string.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Changeset command
> +-----------------
> +
> +`XenProd~version_hyp_changeset_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 4) for hypercall (num 17) to copy chang=
eset
> +to the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Changeset is string denoting the date, time and git hash of the last cha=
nge
> +made to Xen's codebase.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> --=20
> 2.25.1
>=20

Cheers
Bertrand




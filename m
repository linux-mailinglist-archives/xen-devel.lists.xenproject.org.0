Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EABD9F667C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 14:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860383.1272402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNtn7-00066Y-Pq; Wed, 18 Dec 2024 13:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860383.1272402; Wed, 18 Dec 2024 13:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNtn7-00062U-N4; Wed, 18 Dec 2024 13:08:41 +0000
Received: by outflank-mailman (input) for mailman id 860383;
 Wed, 18 Dec 2024 13:08:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNtn6-00062O-ME
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 13:08:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [2a01:111:f403:2613::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 323be91d-bd41-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 14:08:39 +0100 (CET)
Received: from DB9PR06CA0019.eurprd06.prod.outlook.com (2603:10a6:10:1db::24)
 by GV2PR08MB9399.eurprd08.prod.outlook.com (2603:10a6:150:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 13:08:30 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::35) by DB9PR06CA0019.outlook.office365.com
 (2603:10a6:10:1db::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Wed,
 18 Dec 2024 13:08:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via
 Frontend Transport; Wed, 18 Dec 2024 13:08:29 +0000
Received: ("Tessian outbound b519d6c64997:v528");
 Wed, 18 Dec 2024 13:08:28 +0000
Received: from L3d1ed4c79503.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E344EAA4-045C-464E-9A38-6401ACDBDFDF.1; 
 Wed, 18 Dec 2024 13:08:22 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L3d1ed4c79503.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 13:08:22 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU4PR08MB10936.eurprd08.prod.outlook.com (2603:10a6:10:571::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 13:08:21 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 13:08:21 +0000
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
X-Inumbo-ID: 323be91d-bd41-11ef-a0d6-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tA3u/fsHRqaeeZlpPa7Bc9CeY+3TwolEBl3NG8iEhJ+5MFDV4IzrhOrUnLwjkvSTk9128gNIJZEnznnqrYWzLnymqcF0k5x07iEeZKK7HwzeaC2Wik70X1qezIsC0lfKw9DYsH55PNuNwCFMEgx71QtGZl2tA48Yr450xmHBKAp/ULZ0T5PrSYNI+cK5gcFEGvQJAzqwHKLdAYKBnbyq3DLtVkpQ0DfOD5Q9q0OodTow9iTlIpE3vAenSt2FytsJVIZZUbllXc8vfV5qXL7QbKVNI5enf2pjCZgSJHrslyEl177E82ljKUpGSOuVCzGB40ZSRGLNARUhu8zCswGPrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZYoBm6m95gAmdsMQxvE6yda/f+Z1taeLiM3vHdA1p4=;
 b=bTcm2PDZ7EONUOBwIlq0/EYrYps4AFHgEzh/0hqBjDWZWseRVQi6mz60eT+leX7K1EF5zPVwmKO0u8Rx+BuYBVlM2IuWoURm2ZcR/aWuuEjc8S+ikjLdx/CHzR4Zqamobje3WiItuURf4KFe1H8EDulugDSgl2oMd+LF6xOwnmA8M4hCSSEkGVJV29s8Z3lgJ6feKNkCFCaW7UKN0BZuTvhAAxy6E1i9/lWmK/5T0Ayx4DkBUmsV4llig+4GmkROlaOFuBP45982x4VQeVMNNmTE0E3MOGa8j7rEvtlzrEFks29hi9EKbtrqtpQd3HhpVEApDkFaskbF2E4XLv3MZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZYoBm6m95gAmdsMQxvE6yda/f+Z1taeLiM3vHdA1p4=;
 b=UkbDu7DgCOLKpPKP8j+XVV/7jO/2BUQdo93UaClMsRMCJhz4zj5g6eg+VaMB5Hr2bnBvyJKAQMYaVgfGLAPfVqn3OqlilbrlOjyP34vZb3aL6w2/BgflizuzD9JV2Twiq3gMB849zIwD2d4hTaM2m/g8BmqvTyqt0VoG5RBIuN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 950a2b0261ecd124
X-TessianGatewayMetadata: ++6dKMBsRQjNOYKcPbfgSpld3IDgg9Uhp7f7NN66kz0lNzyFudxN4uDU4HYVExjVWreOnOj6pR5RH1uXGXwfYO69KN32DGg2Tc80kV6H6UnKooVm2tsKIcSYzhn7VQa9m03TkvLAz/NgUUZxA5XIwtf1k/uBY4nFcRZe0LfEjIs=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSxBPD1jzK50XNtl1MG9Pno6blsY7bq0vB3usVM0Vog5cfmWTrq3oXlpTdW9GAecbrKIGKBJBVIh7PUyHakCPlZ65eRpmVVeF7Ha93BfrxwZLlonvMCZg/vsn0c4MRgcy6l8Tferv3CXVrXOYwE0t80KVLX6+WSNucKJG6WOfyOJ4qIZwm772Gpqzlc1Vzn+njv5Pqqm4gfSlheeaIHO1dAwTCL5oLnT+UAsDE/prAT3eTibzVGGmvZ6jT2i+9mJnv2AP8VcV1dshr40RQ4cn42/igGBAW23OnGUR6F7W4IX3/DpKnVpWBkavlg4WAk8Mcl87bLIDfdW6Fi6g3tuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZYoBm6m95gAmdsMQxvE6yda/f+Z1taeLiM3vHdA1p4=;
 b=ZDkjGq6n2e33teBn+C2VIqZ23pKNUrfUXPzw6dxVp9TZ0C8vt2kmto20EH3KKJ3NKhgmLH273YhdBeuSkd9P7INUvv7aWZ9f7VYx9V+vOODTNpaSmb4HqKb+XSoDMLTuKr6QO9lBqI+l9UNhKrEBeNMxDF1MlQ8OmJvrixZI0Bpvd9yVnJ/qAwvCtLX/L4fxGNzQC56eVPgiPP1a7vz3alK7MeSjKU22TO48FUEluJHRfvmhb0gpnYsdUb8udozX/1fx+uzrpC+5OLe5IhPC7jVY7PCL7/v1erbumVqw+9muzJtbcC4fvuO9d7v/vvBQQjZxihgbmtvID/97HhcAeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZYoBm6m95gAmdsMQxvE6yda/f+Z1taeLiM3vHdA1p4=;
 b=UkbDu7DgCOLKpPKP8j+XVV/7jO/2BUQdo93UaClMsRMCJhz4zj5g6eg+VaMB5Hr2bnBvyJKAQMYaVgfGLAPfVqn3OqlilbrlOjyP34vZb3aL6w2/BgflizuzD9JV2Twiq3gMB849zIwD2d4hTaM2m/g8BmqvTyqt0VoG5RBIuN0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michal
 Orzel <michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Topic: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Index: AQHbTMiRgWsw6YUipkyfuZOmy7e9xLLrs5oAgAA0fwCAABobAA==
Date: Wed, 18 Dec 2024 13:08:21 +0000
Message-ID: <983EB0F5-8C88-4063-9C97-EC8BB89AA5B0@arm.com>
References: <20241212190325.2130129-1-ayan.kumar.halder@amd.com>
 <779AFC45-3F8C-4065-A39E-9325F9C72AAD@arm.com>
 <2cf952f4-69cf-4eea-aace-4b7bf291b9f3@amd.com>
In-Reply-To: <2cf952f4-69cf-4eea-aace-4b7bf291b9f3@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU4PR08MB10936:EE_|DU6PEPF00009524:EE_|GV2PR08MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 164e0ba8-2cf7-435d-0675-08dd1f6510cf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?XiK0xkUc7XHG7MU5EceWlvHtfLYCtdyiJb6crCYYtxO78BAz+ygwPW/hypdU?=
 =?us-ascii?Q?zp06pnEPgAm3YphZ248mUdetHGRkhUtGt4bRl4d8BodBlbfGnnj/0+2C2c63?=
 =?us-ascii?Q?GK7cAXowsiFyOKZ0ia5p1fUvjyg1qIHsH6jBHJYnU8IHGKjRM86qsrkBVCdY?=
 =?us-ascii?Q?MbnRZZBlFfZ0rbOVei+zNVE3Ujck4J1hwkzfpktMOnHxmZnUCWCrOgGTAjsB?=
 =?us-ascii?Q?+5hryO2CeST5qFigRX7iDx2o7CRSE04M1NvDU6AN6cDwieMRJy5CBYcPm2va?=
 =?us-ascii?Q?WFkoJhqzi9tGPKQJmmbW+iSBaQd1CKWetqVpixKKH2g/aYYZYUNzzoBgm/nX?=
 =?us-ascii?Q?fqmPB6pst4mReoMsQq4pYDHmRmjNdQvsgNYPANkMqL98cy+3S5fEZyAegh9Z?=
 =?us-ascii?Q?WbAwDr1ZJzeDENpCltO5FnfaFdHerUlhBwz15wlCoTH4TeWEslJW8XNuKnGl?=
 =?us-ascii?Q?yaDxwr1RNuathDflhzO3fan7ei65dhY7TGRvT4yvmHvjuJsUTO9K3Q1vVXLV?=
 =?us-ascii?Q?aUIwwEBSfg8Rt5E7TNxz86RZuV2dSjl+B2qfDPRrgpzovVR60KZSvw0szmqR?=
 =?us-ascii?Q?j2aRSxbLBtlsQLVuSNVnxOhaa1v9/Wrx+j2vEN8MHRisVpH8DMRfuLEYNK1d?=
 =?us-ascii?Q?3Wb6fh1zx8UKiucVLdhdvT3W4P4ex10kYNmohSKIi//VHKu+jsqv0hijVBmn?=
 =?us-ascii?Q?pCxLauVIAVV5uw3jDlE7BlH3Czlz0j3vJy3nc3O7GIi8bIiWPhk4JcZsPZxz?=
 =?us-ascii?Q?KjxXQT85OtxuAMvXIZeqdiLB7ep/D8vKts0CoZngC155w60ohH1ZDV/TFVW1?=
 =?us-ascii?Q?3FdQ4eTMeyQ/a1CRSeiBELM8OvUa5wZ75dbZRLRoTaQ3EBj37rGrBNM9AeP/?=
 =?us-ascii?Q?ctegsCE4xV4mGgykbaU8MNPg2KPLqI1czdbxLhjZLtTmzIDa12CEtKHfFaBs?=
 =?us-ascii?Q?1eqcrHrz+hQhc7w0qXWt+Gjf7OqFGNExbFDejaxIEyAoy0g8J1G6ahTjFe59?=
 =?us-ascii?Q?5U4GnGBamjPGjf0iBx2NyYa34j5J2j4wtpR0U7sjhHTpLGfsgcCXuUZoZssP?=
 =?us-ascii?Q?S3/ZhGLyaRg8QEtR6OCDyGg987fZCn5ZBOO4kwsyHxcgGq4/kaxeFQtMl/X+?=
 =?us-ascii?Q?DkBkohzkgN6cKZzB9pOxhXiZGtiTx5wE3fxwFiZLsPJsiWnZmBXHygMoxhWu?=
 =?us-ascii?Q?dPMZ3dXzfuFIJYa6mr6lhFAp7zZPqPNsNEXhfL+jBbcV+6DV4MVeDnayhkpN?=
 =?us-ascii?Q?GOkAF/SYB+rVyFRCj5IYkGJi1VA9wR3CRognaZNqv00ayAIRzuLPPeuLU9uQ?=
 =?us-ascii?Q?RfjpdzvYcfDCWB8IljcdKr2wM8uYwAcl7p5pBFXsCIpMQO7a/4yNfQArmCuL?=
 =?us-ascii?Q?5o1so0tnRWLIzm2x/uhs1e6jLlx/SRd40CmhHSiRyt96p/myBQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1DA6DE5CB84AD14780717E32F2E3B54D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10936
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e4a54ff2-e393-4626-f00b-08dd1f650c1a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3v2qXW+tTR/8r9dEwd0z730EgxlinkF4Jjz2vsCK0llWCmzlkr5QhQ+wnp8j?=
 =?us-ascii?Q?sRCpO61H1u7C8QRXno0RpyS2uu/8wdE8E6R7Q5RDGJcBUdMpsWBqRXjcLQ3d?=
 =?us-ascii?Q?/8DBoGQSc7MukvbHTRq02x44eioRYWxciKbhyrqHaEZYNVr3aXEorQ+nthij?=
 =?us-ascii?Q?eTZ0k5BWuKsw5YJn7QEaYTmETbWdvbr8chKYdAAdMPl9/IyVsi41yBoTdACM?=
 =?us-ascii?Q?QWWSury8+/FyqJZoKQnj/KtxeawYQk/9VXQ0hH+q8ih/mKsKOfQsRU//1dGK?=
 =?us-ascii?Q?ORPiFJbB0jnJAfy2gofopyUa+uY16fKhX/3q+6jRCExjwr9YA4mcuhk3ZIg1?=
 =?us-ascii?Q?SiZtiI7Y5ZoMXwCC5T8wADtRO9PZgAczbiRFXD97LnBMsssflT4OIhNDmPV6?=
 =?us-ascii?Q?eoiPg+6S4aatUhe4c4wIxY3jskRwnCtgjgLE3DhqkjWj4F+OrzP8w2/iSao9?=
 =?us-ascii?Q?FZkwVmhGBbZP/46AidD0BahrWNQPcv4/rJ79V3EsqOQwu3D5WYAxxoqbxxKc?=
 =?us-ascii?Q?BRQJGWseNzlcSaboztj40PNJfhwVyl26K21EzHL6YNImEQcgzJoN1mXKhrck?=
 =?us-ascii?Q?4Yn0Hw10Exwm0BFssljb0rI39as3eSpkHQLRz5lQrHzWWHJKB+qQBpfge+nQ?=
 =?us-ascii?Q?6VjRnbSKUkCJ/fj+1Z/Ex7+O3bjyCT8k3+cvVirgBItSr8hv3bQWQeGS1qpa?=
 =?us-ascii?Q?0rQVIffWhusv5W3xubx6fB45JCwtpkqypr/h0JlTjaFVi2IkTyocZ+hm7OnF?=
 =?us-ascii?Q?FKxZYfCdTkXGewBfoFQZmf8PJOmTrzxHi1+dt+lNF+iK0HrrFBFQSn35sDKc?=
 =?us-ascii?Q?6AfjBFKLtjIqhqV5LFYsa9pH/bEPoz7ubqNQ0ymLF/5z4HureYbnC+1WUGps?=
 =?us-ascii?Q?BzGUzbWdnvGjotr4ov/nhHg2+QbTl8owt/dxyX68Z7Hn3NLfk/v7y7jxJ02I?=
 =?us-ascii?Q?ghfgbe0lhDCJowP8fSAogJA2ofTFkV+gGLA3C4ben1+0ZRFGyomrjKUYX9/u?=
 =?us-ascii?Q?H9nkA/9YUreMhRvMePwyQ3q3uPtCw5Iy176lU3OIG1wpEkU3IGZ5TQW6Iyg8?=
 =?us-ascii?Q?6ewGZvBnxk1eNIH1cylgp/2399S7Yb8OAizca9g6lT0CQXw45bYDFzRNrtHe?=
 =?us-ascii?Q?g3mgVcBsij7HBkSSuMj39s8cmXCkmEK8lAohO8oj6WqO0R0kitS/rVLFZBXC?=
 =?us-ascii?Q?iZcj9eqF+6WpuV8q1aZkozJJBKxFCIb+GezWE7mXVHyTA8qMz2qienhyyG0z?=
 =?us-ascii?Q?6BNJ24KHtizxxls41t+1e74+0yXASYZci8B0JaVMcOEzz82g3Q9M9BhGq4V0?=
 =?us-ascii?Q?hk4mJYfYR8vivDncsWBbgBtQFS4p/C2tZi7GRTQ6K7wRFYvu/q0yDml1xzZD?=
 =?us-ascii?Q?TFUtmh09oFm3RHPiBKzAFHzthzMnjgAa8f13+o/H7N2ClRVtEGWw2Y8YFD4/?=
 =?us-ascii?Q?GZLD5vo9XY+p80y/DOH6llqkQ9g5yPjXN88/KHU+Q47I96Egt0X+eg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 13:08:29.0483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 164e0ba8-2cf7-435d-0675-08dd1f6510cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9399

Hi Ayan,

> On 18 Dec 2024, at 12:34, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 18/12/2024 08:27, Bertrand Marquis wrote:
>> Hi Ayan,
> Hi Bertrand,
>>=20
>>> On 12 Dec 2024, at 20:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com>=
 wrote:
>>>=20
>>> From: Michal Orzel <michal.orzel@amd.com>
>>>=20
>>> Add requirements for dom0less domain creation.
>>>=20
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from v1 :-
>>>=20
>>> 1. As the dom0less domain creation requirements specifies the dt proper=
ties
>>> for creating domains, it has been moved to product requirements. Produc=
t
>>> requirements define the interface Xen exposes to other domains.
>>>=20
>>> 2. For the requirements which introduces new terms (like grant table, e=
tc), I
>>> have provided the definition as part of the comments.
>>>=20
>>> 3. Introduced new market requirements to specify that Xen can assign io=
mem and
>>> irqs to domains.
>>>=20
>>> 4. The design requirements will be added later.
>>>=20
>>> docs/fusa/reqs/market-reqs/reqs.rst        |  16 ++
>>> docs/fusa/reqs/product-reqs/arm64/reqs.rst | 306 +++++++++++++++++++++
>>> 2 files changed, 322 insertions(+)
>>>=20
>>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/marke=
t-reqs/reqs.rst
>>> index f456788d96..47e1b6ad61 100644
>>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>>> @@ -47,3 +47,19 @@ Comments:
>>>=20
>>> Needs:
>>>  - XenProd
>>> +
>>> +Static VM definition
>>> +--------------------
>>> +
>>> +`XenMkt~static_vm_definition~1`
>>> +
>>> +Description:
>>> +Xen shall support assigning peripherals to various domains.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Peripheral implies an iomem (input output memory) and/or interrupts.
>>> +
>>> +Needs:
>>> + - XenProd
>>> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/req=
s/product-reqs/arm64/reqs.rst
>>> index db91c47a02..66f2978733 100644
>>> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>>> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>>> @@ -40,3 +40,309 @@ Covers:
>>>=20
>>> Needs:
>>>  - XenSwdgn
>>> +
>>> +Linux kernel image
>>> +------------------
>>> +
>>> +`XenProd~linux_kernel_image~1`
>>> +
>>> +Description:
>>> +Xen shall create a domain with a Arm64 Linux kernel image [1].
>> This shall be rephrased to mention that it shall be a binary with a head=
er compliant with the Linux kernel image format.
>> We do not want to say that we can only boot Linux.
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Gzip Linux kernel image
>>> +-----------------------
>>> +
>>> +`XenProd~linux_kernel_gzip_image~1`
>>> +
>>> +Description:
>>> +Xen shall create a domain with a Arm64 Gzip compressed Linux kernel im=
age.
>> Ditto.
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Kernel with uImage header
>>> +-------------------------
>>> +
>>> +`XenProd~kernel_uimage~1`
>>> +
>>> +Description:
>>> +Xen shall create a domain with a kernel containing uImage header [2].
>> I would remove kernel and say binary executable and add compatible or so=
mething like that.
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Gzip kernel with uImage header
>>> +------------------------------
>>> +
>>> +`XenSwdgn~arm64_gzip_kernel_uimage~1`
>>> +
>>> +Description:
>>> +Xen shall create a domain with a Gzip compressed kernel containing uIm=
age
>>> +header [2].
>> Same
> Agreed with all the above.
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Kernel command line arguments
>>> +-----------------------------
>>> +
>>> +`XenSwdgn~kernel_cmd_line_args~1`
>>> +
>>> +Description:
>>> +Xen shall pass kernel command line arguments to a domain.
>> I am a bit wondering if this one and the following are not a bit to gene=
ric.
>> Should we say through DT or ACPI header for example ?
> Yes, I can say through device tree. And then I can explain device tree in=
 the comments.

Ack

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Ramdisk
>>> +-------
>>> +
>>> +`XenSwdgn~ramdisk~1`
>>> +
>>> +Description:
>>> +Xen shall provide initial ramdisk to a domain.
>> This should be mentioning that it is provided in memory and the address =
is provided through DT.
> Ack.
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Memory
>>> +------
>>> +
>>> +`XenSwdgn~memory~1`
>>> +
>>> +Description:
>>> +Xen shall create a domain with specified amount of memory.
>> I am missing the where this is specified here ? i guess this is also DT
> Yes, this is also DT.
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +vCPUs
>>> +-----
>>> +
>>> +`XenSwdgn~vcpus~1`
>>> +
>>> +Description:
>>> +Xen shall create a domain with a number of virtual CPUs.
>> number here is unprecise
> Can I say with one or more number of virtual CPUS ? How would you want me=
 to define.

I start to wonder if we should create interface requirements from the guest=
 PoV:

A domain shall have a configurable number of vCPUs (1 to XX).

What do you think ?

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Credit2 CPU pool scheduler
>>> +--------------------------
>>> +
>>> +`XenSwdgn~credit2_cpu_pool_scheduler~1`
>>> +
>>> +Description:
>>> +Xen shall assign a Credit2 CPU pool scheduler [3] to a domain.
>> What is Credit2 ? this needs to be defined somewhere
> I have provided a link to the credit2 documentation.
>=20
> https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/feat=
ures/sched_credit2.pandoc
>=20
> Do I still need to define it as
> "Credit2 is a scheduling mechanism where more than one virtual cpus share=
s a physical cpus based on a time sharing mechanism."
>=20
> or should the requirement be rephrased as
>=20
> "Xen shall have a scheduler where a physical cpu can be shared between mo=
re than one virtual cpu".

Yes i think this rephrasing is right.

And we also need a market one saying that Xen shall provide multiple schedu=
lers (With the details of which and how at product level).

>=20
>> and in fact it
>> shall have product level requirements.
> Do you mean this needs to be a product requirement ?

Yes, this is visible to users, the design should say how the time share is =
done.

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +NUL CPU pool scheduler
>>> +----------------------
>>> +
>>> +`XenSwdgn~nul_cpu_pool_scheduler~1`
>>> +
>>> +Description:
>>> +Xen shall assign a NUL CPU pool scheduler to a domain.
>> Same
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +A NUL CPU pool scheduler maps a virtual cpu to a unique physical cpu.
>> This is a product requirement saying that Xen shall have a scheduler wit=
h such characteristics
>> and I think this is not enough to define it.
> I don't understand this bit. Do you mean this should be product requireme=
nt written as "Xen shall have a scheduler where a virtual cpu is always ass=
igned to a unique physical cpu".

Yes this is what i mean but be careful as this is not really what the NULL =
scheduler is doing.
What you mean is "pinning" here and the NULL scheduler is only about "what =
runs run as long as it is using the CPU".

>>=20
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +SPIs
>>> +----
>>> +
>>> +`XenSwdgn~spis~1`
>>> +
>>> +Description:
>>> +Xen shall allocate a specified number of shared peripheral interrupts =
for a
>>> +domain.
>> This is very ambiguous. What do you mean here ?
> Xen shall provide a way to specify the number of shared peripheral interr=
upts for a domain via the device tree .

I am lost in how you achieve such a thing in the configuration.
All you can do is assigned an interrupt to a domain, but the sharing part I=
 do not see what Xen has to do with it.

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +A shared peripheral interrupt is an interrupt generated by a periphera=
l that is
>>> +accessible across all the cpu cores.
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> + - `XenMkt~static_vm_definition~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Grant table frames
>>> +------------------
>>> +
>>> +`XenSwdgn~grant_table_frames~1`
>>> +
>>> +Description:
>>> +Xen shall create a domain with a specified number of grant table frame=
s.
>> It is really weird to say that Xen shall create something specific witho=
ut this being
>> linked to an higher level definition of the goal.
>=20
> ok, I will drop this and the following requirement for now.
>=20
> When we have market requirement to specify that "Xen shall allow sharing =
of buffer with a domain", then we can add this and the following requiremen=
t.

ack

Bertrand

>=20
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Grant tables are a mechanism for sharing and transferring frames (memo=
ry buffers)
>>> +between domains.
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Grant maptrack frames
>>> +---------------------
>>> +
>>> +`XenSwdgn~grant_maptrack_frames~1`
>>> +
>>> +Description:
>>> +Xen shall create a domain with a specified number of grant maptrack fr=
ames.
>> Why is this needed ? what is the high level req for this ?
>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Maptrack frame is the metadata for tracking the memory mapped into a d=
omain.
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Virtual PL011
>>> +-------------
>>> +
>>> +`XenProd~virtual_pl011~1`
>>> +
>>> +Description:
>>> +Xen shall provide an "Arm PL011 UART" compliant device to the domains.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenMkt~run_arm64_domains~1`
>>> + - `XenMkt~provide_console_domains~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Assign iomem
>>> +------------
>>> +
>>> +`XenProd~assign_iomem~1`
>>> +
>>> +Description:
>>> +Xen shall support assigning iomem to a domain.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Rationale:
>>> +
>>> +Covers:
>>> + - `XenMkt~static_vm_definition~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Forward interrupts
>>> +------------------
>>> +
>>> +`XenProd~forward_irqs~1`
>>> +
>>> +Description:
>>> +Xen shall support forwarding interrupts to a domain.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Rationale:
>>> +
>>> +Covers:
>>> + - `XenMkt~static_vm_definition~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +| [1] https://github.com/torvalds/linux/blob/master/Documentation/arch=
/arm64/booting.rst
>>> +| [2] https://source.denx.de/u-boot/u-boot/-/blob/master/include/image=
.h#L315
>>> +| [3] https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3D=
docs/features/sched_credit2.pandoc
>>> --=20
>>> 2.25.1
>>>=20
> - Ayan




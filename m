Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4197128B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 10:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794035.1202691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sna59-0005Ek-Ai; Mon, 09 Sep 2024 08:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794035.1202691; Mon, 09 Sep 2024 08:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sna59-0005CL-7z; Mon, 09 Sep 2024 08:49:11 +0000
Received: by outflank-mailman (input) for mailman id 794035;
 Mon, 09 Sep 2024 08:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xur/=QH=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1sna57-0005CF-MB
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 08:49:10 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20630.outbound.protection.outlook.com
 [2a01:111:f403:260c::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eb8cc9c-6e88-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 10:49:07 +0200 (CEST)
Received: from DU6P191CA0070.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::18)
 by DB4PR08MB10342.eurprd08.prod.outlook.com (2603:10a6:10:3fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Mon, 9 Sep
 2024 08:49:01 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::f6) by DU6P191CA0070.outlook.office365.com
 (2603:10a6:10:53e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 9 Sep 2024 08:49:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Mon, 9 Sep 2024 08:49:00 +0000
Received: ("Tessian outbound a180ae23ab28:v437");
 Mon, 09 Sep 2024 08:49:00 +0000
Received: from L4bdc0942e8c9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F8D27FFD-48DD-48F4-AC1F-6F7851AFBE13.1; 
 Mon, 09 Sep 2024 08:48:51 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L4bdc0942e8c9.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Sep 2024 08:48:51 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by GV2PR08MB8510.eurprd08.prod.outlook.com (2603:10a6:150:b1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.15; Mon, 9 Sep
 2024 08:48:43 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.7962.014; Mon, 9 Sep 2024
 08:48:43 +0000
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
X-Inumbo-ID: 5eb8cc9c-6e88-11ef-a0b5-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U4zaa0041cew3BnE2FlK2QLComAGYB5IPFWbgP7kRNPUcfZ7NG5QDsy2fGmPdO3IhPXgfyl7EmmnNX7rgOPx6+fpIdC1eAVE7YoTR2kPvZH4moyYn2N0HI6c0XF2F7MlcuaAY3PQe+Id6Zui0CaSri+/aJaevhOAU8SjieGA/eeTA0HLX2zd1Am758Lqfl0E8JUToDQJgx18xBlr3Y16oFWhinL4JvxK0/kjpeR0e37Tx2z9w1wQSADv7Pwo/zdl6oGN27xC1zgIbmzxa3bAzyU6/sHB3xrxLXFFPcVUvIuc0hZtwS0bhK/aii+oM5+2+2Q4I94tORJPnaVLr50I0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4AADrSPJag9qHsAYBK9lyECw1QwVpdT4FuM6VjXR9s=;
 b=j6LEaUXXdoF21LBXCVCtBDNHW9/uZgjcbUeCodHlFpDJFxh9obB0qnOpz3wee5Bg56nED8JBnUP15Y1r+30teQyuvaSnW3JFU1+sENmwX1Qm98OseVADlCyKu1F2IAcmkqnL4CqROlb1iUBANW+8t/0Y6PVkexC6FUDaS+3UgEPXyycjfxY7JuR3Qx9fkt8ED7F4afAH8hdRbnVOCs7DrFZdtROfRQrSkUqzpj4cOklsxhbBR0KFQIpT4NkgNb0lB05i9MaC5gVDi1DtYnel8R/P9tl0bPeLl3vOVmlkeb+U1bbINThi2GMsGVzF1RolEZ04YWjBECZi9fS1ETDGwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4AADrSPJag9qHsAYBK9lyECw1QwVpdT4FuM6VjXR9s=;
 b=XBfXIRFn0r7L9uUsebRFQjRXW/oQ0Zmd4JTN0lusE8TMnYshJTRMzpI5cCI88FMKjUIYiQYHXrOqZoghUFs99Z5z7cgZm3xoczgIVwO5ySoAtbXDwilaDLn3IL9XjSifwOtdZ9RMgIuHEbyo3RWz3p38aswTvm8TkijBYvs1PFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 336331cb59cf66b6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9iIZACw48drQGmCAhEArLtnFPj8qBSownQTrrRIUjCAEfoa0VGg9sgPeWfdaHLz32HfoCrBa556oMbIwnHy5bW2uHkFDxfFlP5dr59zdTX9Omyy5D4KWYfdfmL65Xy+TWp+QIjwdgKSZdUPFnhuzmHThVMjqKhbO+1slWZHBDRDdTWxaUc1fwhWnQmiMVx8gnDb3i89lJiTNgpSErWQc2JHmawoWvef6Tezo7NhEhTcft6zMfbaKmNZKHPQu+BBrPk2nb7zm2BCZURL9wjC59AWWNU7ejqyfF83za3HVsc5lhMymaLww6sEbgwnfJMfQQS+oz9qPyYUJ6UpMBU6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4AADrSPJag9qHsAYBK9lyECw1QwVpdT4FuM6VjXR9s=;
 b=d6cV5iSafxSd9OcZqyFBqusxHiQbgIyHe4890hXZKYVrvYGrpAKWFUm9bOMGPkZEqAwElkm2/JaOtFJmMBc3wHIU3MykOOiOOQl2VwP1BB3jOpYECxRI2Oio2jzJfxsHa11rAGL/CcuhrzS2p9oXFdPqgaVlkA8skDIsZD6Phc5D3jH3HUjjYYXovdPUec+3yjZmgeil5mM2cHTrg1NZj+Cl+JZekliSftSvhvg6lbKmbW7/dMcWwyipEemjIxyYrHQgz258e3IAk4kVxJTdKSQbz3Mh3PJy0ZPVMp8vBEwsEift77RP1pic8A9wJgcgQ7nfFiMUhIEkyG3K/TLhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4AADrSPJag9qHsAYBK9lyECw1QwVpdT4FuM6VjXR9s=;
 b=XBfXIRFn0r7L9uUsebRFQjRXW/oQ0Zmd4JTN0lusE8TMnYshJTRMzpI5cCI88FMKjUIYiQYHXrOqZoghUFs99Z5z7cgZm3xoczgIVwO5ySoAtbXDwilaDLn3IL9XjSifwOtdZ9RMgIuHEbyo3RWz3p38aswTvm8TkijBYvs1PFU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Topic: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Index: AQHa9XoHude8SoLzqU+vDRBIKLz30bI8y1SAgArTwQCABvDngIAAryqA
Date: Mon, 9 Sep 2024 08:48:43 +0000
Message-ID: <B9014D46-43F4-4928-96B6-CA6167964578@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
 <f14c6fb3-0ab6-49e6-b0f1-622802a599f0@xen.org>
 <3819109b-de48-480b-b548-a5d9f45a541f@amd.com>
 <e1d1ed69-94e9-4625-ba49-9ebdb2b9581c@xen.org>
In-Reply-To: <e1d1ed69-94e9-4625-ba49-9ebdb2b9581c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|GV2PR08MB8510:EE_|DB1PEPF00039230:EE_|DB4PR08MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: e537c071-4dcf-43ad-aed2-08dcd0ac3fda
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?cryvJ6p7dDAjRNqkKUc4Gv4enWZioi6yvfIr0tSBmoGPiL9w+Z2WY5fR2cU8?=
 =?us-ascii?Q?xACv7mSvi5tbZRe9/UUZjNcxb9kn5DPXhAuGvhuRSOvWibv9QZ9VXK0ccymB?=
 =?us-ascii?Q?58Pwtwt+nBOn3Kb3EOyYe5wqiC4d9uoFDif+qDXvsUkMdHnbW8GJqjaflh2G?=
 =?us-ascii?Q?rBMKAm1j5mk+Qygd/XVHMjdWIo9uyv7gletifepPe5u7lwQulRZFesdhp4Th?=
 =?us-ascii?Q?rrOrq32W1eygLdvQDztPSMb2TdoWnFjEFz1ov/CX9Ybn9FFFOTAlagAA2nNA?=
 =?us-ascii?Q?0wjBuk16VPYuJC/KR0SXB45rdrs7kijpghTuJhXCf6TAc2x2hX2w46Qsbl3t?=
 =?us-ascii?Q?ISZGzlhGFpJU5YnI+dFSWrrF35LnIiOrqi1gDbPOD/FLkggvtAzSkNoBdHNH?=
 =?us-ascii?Q?Hago6EGn0flBczTYS7iRwERYQ/A1ZJLeVn834mqbIHE4t+vG7QKE3/YbOeg8?=
 =?us-ascii?Q?wY+N45oXYA2DKeoeos8zQDRDuYHuKN7p6R7IAbVBkGgssvOMpdj3bUWA6J6t?=
 =?us-ascii?Q?gHKQJB6WvOEyB+xnBbnwYG7mwzoRRIeFLpLzyJbl6ld5ncuTeECLLqM+mbJ2?=
 =?us-ascii?Q?rz6ELIZp3UEQI4exD58xLfwpirj7jKurPUKqww2I0XhzD0pTF5zxbfnAW8hN?=
 =?us-ascii?Q?+algnszJY8VYbFKstgPYpLXYe4HILslLocvxu/1vQ8R9P0i+IVSJl5Af2Ept?=
 =?us-ascii?Q?UnLUa7A/l9oBFCSEmhHVU/H//+mL66dZeBoCXYUlnCZBFLJpOj8/XN39kKy8?=
 =?us-ascii?Q?OxzSLKyHrEQNAIxBVJbGO7ckZsPlfErqTxaER0d8/kkV7rQ8z4SIc5fPi/0s?=
 =?us-ascii?Q?i3R2na0Q8qpAZfMFR791Jc+BWl6n8Pl5HhzeplZrAMAxAgOujdSDd2KcbGRz?=
 =?us-ascii?Q?jsO31qZtPZKxA2OJT4K7wA9k14mLN/7JMx8SA7wf7eJ8d/lDrRg+xJe4OR5U?=
 =?us-ascii?Q?AiFfrqQ/HskTsHLBquRMTpubNAWyhXRS7DuaMLCZWdcn3CGLZX5MtPlOQPiB?=
 =?us-ascii?Q?4iN5RGXK1hq1kJ8Qtg05vTsi33P4T1Pzl8g7KBXXeI/smlIJSC81ALULxcaJ?=
 =?us-ascii?Q?9mG6QHKd8/8dWdc7d5NlKrayWpVgkZyu/DrpxGa05xuoDTeIb5LZ61a6iCmT?=
 =?us-ascii?Q?bvJ5ELvBTzn+hvChC9z2j/RU5ifz8zj4z96X9EJYfpadnqueAe/waDaI0/mP?=
 =?us-ascii?Q?N3nxw4Ha9QR1AbgSLMeoQnFUS+kh3a76pCXOwwiub49w6+CWJvf9/avdEhop?=
 =?us-ascii?Q?ME4cA/qbg80ZfH+M9LZNSI+J3SFmMBFc4ogSjCM7IVC1+VTMsuffyPeP8rey?=
 =?us-ascii?Q?twRDFr0QgkOz3vKN2ytUZGxtQVcgANPxZ+1PNd+MrvIvVsHB2XryhECswV1z?=
 =?us-ascii?Q?/aUoXJXkkPx0MlESf1ag53+RHRs4aamOGtF6QeZ8vI/Q8JE5Mw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2D6875BEDA319B4F95E1B1128B90F0F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8510
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fdfea4c1-ec61-4975-4597-08dcd0ac35f8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cb615KjkIgegKOgeuV3zJ9Ujw4d2oBJ1R8w0CEfrqEL0PX5pal0U4d9ypIOD?=
 =?us-ascii?Q?iNSEpJCfg35f/psJ7XbQKILo0Uc6IYkFzOb2fiYXHzUYZz+HyJCU10XnQVwU?=
 =?us-ascii?Q?KSsPuh9R9ZVnkqmNgvwztE/BSsAVgvN3eePoKRn7vj4/9EJviTmkWLKxGS1A?=
 =?us-ascii?Q?49NQSJINEDJaY+RIs/y7zmTagVbl1vcnXBJ4TRu4lUj0PVxV/nmDrOwnpoU0?=
 =?us-ascii?Q?dfA2dp9Lz/DYUKv05TwKu452vS9pNAxDJDXFLkJBmt04VXNiW3xT949Vq0vT?=
 =?us-ascii?Q?T+wGJujqAPAs+/UJSEXNjxm7KgwyLvhdtbilV+fFd0mCo7g2PkotLBZCxZuY?=
 =?us-ascii?Q?Ivqms+NkzoYi051mD9zVrpfH5TckkaqjjAxGcLz1SP/nbKd9Y9p320T4KLYh?=
 =?us-ascii?Q?LnepO7vJlQG/XSLUsid6kjEAwtXIrdg/Ed+i0alge9FFYxquPDWbuNoOWSVK?=
 =?us-ascii?Q?6GapmIpZMlNWJHHt5ECBMT7Vdzgc5UAbJ4A/TCFKKKS1Og0GSAVCcLtsElvR?=
 =?us-ascii?Q?MZttr/P8OYR4IYLMqoFPBex24X4o7Htka+O68oPWnXId/wGAGk7HSgW4irs+?=
 =?us-ascii?Q?Pb1uliHYe8ZSxsmOeJ6uqv5vI67a6RnTOp2s3x/kMvCx6/vzOXxa7tO9nJab?=
 =?us-ascii?Q?r7RH05cVI5B7p8L7D5dvyKiS9AbOPJDDMCYmgtR0FotydKhzWE/tCe1/iUfb?=
 =?us-ascii?Q?GgDf/kFdXAVHTYZiHPVgRkyiLhmdgfuHUEC6FByAjhyVrknxOlO6uR6jLtp4?=
 =?us-ascii?Q?gbwKzUiwXC/n6ul9PnE/OGkeQSdxp438jXUvntpwFMb0nAFdzaGj+MdUdLsP?=
 =?us-ascii?Q?QrWcwEzJKCWItV0VwRHtnF4drS+wCg7FeQHC6gh69xO2z6ZUKJyN/AyTkP0t?=
 =?us-ascii?Q?5Kv1VKq1tZN04InH1fseqPKkM8EFmd3uNCHuGx8xxi9Jf0PkFlg1HNzd75Rp?=
 =?us-ascii?Q?9EA1OuSvd52OhzSm9jNXeYdNtROHVXhD7q7us6Vr/rcLcW5PsB4qPBVGrcps?=
 =?us-ascii?Q?883gIJmEDDGZesOqD+Fqu59XE8tOVHTW4dMGg1DgSBBedHLi+dXwjmntaz0P?=
 =?us-ascii?Q?ZhY2PTBW5nJGeVh6fTqK8PaOWHJMW6QPfhvWZuK5oU6BANqBhb6r4VL7WnKj?=
 =?us-ascii?Q?7T7pBwPUJmjC/W/E5lTfqqO37O5wtweNwmOb6dCM52cIzuroz7EvdXVoeCK8?=
 =?us-ascii?Q?KNE5JpD9cOSSaOV0ZyJWvAVYAnyP6+w2d278o1F7njYZvt1maBlmJmxEBJUp?=
 =?us-ascii?Q?X2eYdjrbM87MQD60SW9xeceZyCHVQ48L51cyytnEriSycvCDhev78r3HACVk?=
 =?us-ascii?Q?JIq10H763mtL9/pDIwrhow4jOoAanns13i2+Rsb5gM19vfHT3cfBLuZ9/6Fb?=
 =?us-ascii?Q?8mZzRS2H31w1pL58aXb8AEzM+ovmcJBFXVTssO9aMtxFYD8JpQ9YePjJcs76?=
 =?us-ascii?Q?5/QcfamR7X7xSSHk4y6fIp0j73V3LB5y?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 08:49:00.4016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e537c071-4dcf-43ad-aed2-08dcd0ac3fda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB10342

Hi Julien, Ayan,

>>>=20
>>>> +    msr   PRBAR_EL2, \prbar
>>>> +    msr   PRLAR_EL2, \prlar
>>>> +    dsb   sy
>> This should be visible to outer shareable domain atleast. The reason bei=
ng one can use the SH[1:0] bits in PRBAR_EL2 to set the region to outer sha=
reable.
>> Thus, the writes to these registers should be visible to outer shareable=
 domain as well.
>=20
> I am a bit confused. SH[1:0] is about how the region will be accessed not=
 up to where should registers are visible. I was expecting that the MPU reg=
isters only need to be visible to the MPU itself.
>=20
> For instance, when using the MMU, the translation unit is in the non-shar=
eable domain. So a 'nsh' is sufficient regardless of the shareability of th=
e page/block.
>=20
> This is explicitely written in the Arm Arm (see D5-4929 in ARM DDI 0487H.=
a) but I can't find a similar section for the MPU yet. Although, I would be=
 a bit surprised if the MPU is not in the non-shareable domain... Maybe thi=
s could be clarified with Arm?

I got the feedback that DSB SY is ok here

>=20
> Anyway, for now, I am open to use 'dsb sy' with a TODO to revisit it.
>=20
>>>> +    isb
>=20
> Re-quoting the spec from you previous answer:
>=20
> ```
> Writes to MPU registers are only guaranteed to be visible
> following a Context synchronization event and DSB operation.
> ```
>=20
> So this suggests that it should be first an 'isb' and then a 'dsb'. Any r=
eason you wrote it the other way around?

I chased this internally and it was suggested the current order, dsb follow=
ed by the isb: DSB ensures the completion of prior=20
instructions before the next executes, and then ISB ensures subsequent inst=
ruction fetch observes the updated MPU state.

Probably I will raise something to make awareness around the misleading ord=
er of that phrase.

Cheers,
Luca=


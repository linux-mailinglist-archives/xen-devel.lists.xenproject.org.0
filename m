Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1569C3CA4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:05:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833529.1248699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASEn-0000tX-Js; Mon, 11 Nov 2024 11:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833529.1248699; Mon, 11 Nov 2024 11:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASEn-0000qz-Gj; Mon, 11 Nov 2024 11:05:41 +0000
Received: by outflank-mailman (input) for mailman id 833529;
 Mon, 11 Nov 2024 11:05:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNBq=SG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tASEl-0000NQ-5G
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:05:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2612::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfb72e5e-a01c-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 12:05:34 +0100 (CET)
Received: from DUZPR01CA0087.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::18) by AS8PR08MB8996.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 11:05:31 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::8c) by DUZPR01CA0087.outlook.office365.com
 (2603:10a6:10:46a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 11:05:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14 via
 Frontend Transport; Mon, 11 Nov 2024 11:05:31 +0000
Received: ("Tessian outbound 93d42030d577:v490");
 Mon, 11 Nov 2024 11:05:30 +0000
Received: from L4c8e27da8558.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0CFCEDF4-1CDA-4A46-B90D-055069D91EEE.1; 
 Mon, 11 Nov 2024 11:05:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L4c8e27da8558.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Nov 2024 11:05:19 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by GVXPR08MB11182.eurprd08.prod.outlook.com (2603:10a6:150:1f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Mon, 11 Nov
 2024 11:05:17 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 11:05:17 +0000
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
X-Inumbo-ID: dfb72e5e-a01c-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjJjIiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImRmYjcyZTVlLWEwMWMtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzIzMTM0LjcyNjU0Mywic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CXy48S6UYRGb+jdyYiUndi9h4Wu3cI5G70/hNG8mQK37QIn9BWunjEfXPSfCS38+Te6jbE6Dok5///UsRrbVUdFPmY84abLvuOGkrvljwSFlik+djq/iWZnDxM/f03YB+4mmYbS02RPKprlwHJfr57BvmuXS78WU2TfCMNeRa00kuK4nbunKkNscLKGQ/3GqvprBDHCL/dRZBOc1KkLRmhJVSpA6bAuHitp95S5VYLin9nUVWyKZuopUKnQ09bH1j9pggkPOwOTWaklepDiJoOY82DAytWQmeVGFdlGX10qw85SC47BvSX0PylHkBSGJXF63Ld9RZNX0NMxS/J1+Ew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Q+ixIaZQlT2NxEclvzZEL9mKTxiVGJ0d+1HKxQL4GA=;
 b=EbYPkcKCGv4swrdQMps99ij30ZLY8VnePW00TXBe7Lho6SMhFX3Xep/hvMQ9yNLhGDPPzG94PCRfK1IZNjuN3Uw/HmDmUvwiYeQpp+qldOjRO26KJfwe2mvtefgaI0efN7A6O5FSTP+FBvjyKuXYTKK2fpJK7CNrwaGfztAcN2pVj8UDi8VxDYttsMFKa2o/cX9LTE5CK+oAYnCAparcO8T0ueg3BvgEcMbfvgHHi2D7IjUNGgRlUZzUzitgq116U3rBu7UiGQe++vWjOCU2optkqoXWVSSGCiXqpSPMSzOgwzKUwmeVVPNnC5i7sxuVEngN9CNGWI65KzQvh7Jr6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Q+ixIaZQlT2NxEclvzZEL9mKTxiVGJ0d+1HKxQL4GA=;
 b=AkKPAUYN2HTO/ziAKkGNj3/h07Pg/WAIciVqo2AvUbNoHaXc09TZhiwSCpJCQla5ZqDtfBi7O0qx03SsDeaUZSEW5LOvOEKZxcJygdMUqr2fGPRm2fCBuJi58isHZFd9z174uokpYyNf87zb0lPreGgP1xH3tnomjnrxUDFJBOo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3c020562de9cd9ea
X-TessianGatewayMetadata: 6ajMjVabGSPKAkf2E/nwTWgBcL6Pr/SrpIVL/8y6fxNsfJoFYeultHmhGdz/4mTRpnrlwf/QYzUF4WyoLFtXf6+gKJJb3S/66Qp417VGlyaucSGTUKpGNuk1+mZNd3N154DQdyNBJR3Dy/26dHak3fepOR1lHxsQjPzOm25axOc=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRNlP0T85Qk62ndx8ZSj66TFGgiTJAYaK6VnEpU8Yp1FxytLcuTkHyK/5k2wC2xz7ayHPEK8Rntc1ReJjY7HAopwY4qJ7iwwA5fZZbdo2MHsWHB+0vBa0IlhVawwoXdEtr+zuyYAF/UMPdxlB2Fc47zPSRJsJz/NhwFxZuMau7/j4VYUEjaCMl+mYmW1N3W8Z221AvX08owyqO5WjucnyVfZSnHMbhRn99inpUOOdo1cz5hnac0H+BWadPBIVkMlA6J6WTZVnN4q3Qvjo7d/oVh2JqAkNjixJZT0eMNwjejkbEfl9vIkbi7SvA8cqeQS+1pBejMIDEJCJfd8WYf4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Q+ixIaZQlT2NxEclvzZEL9mKTxiVGJ0d+1HKxQL4GA=;
 b=blOu4C1jQjoPHoZFCPH87Y3dDiyYFtzBzKx6OzM7WhTl0VSuQy4oe/yjr0j2YXIyjOnAFQ/uXpvn4qCxatj/aHo4fhc6xk+9Qfe0CmDXixzBiiYe4mLvkdc2GG/f3gy1iZXFagiDqLu7V7fxxhbAzj6KkQkVgOxSiUu+qhuw1bEPQYKiKdiOAY5HwVqW6bvAv2kGevAXepOk3kt+CX/o3krtNBLyd+OIYfxDUbPlsXdXZyGE1h0CCL2n6jDyixZvVg61uL7bCTWQQPb4DcmcMIYQftkapgs3tHzIb2WHp+bYeFd8BN+KPnjWUyuubwXvekq7/A7zMTbf8G6/Hi/bPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Q+ixIaZQlT2NxEclvzZEL9mKTxiVGJ0d+1HKxQL4GA=;
 b=AkKPAUYN2HTO/ziAKkGNj3/h07Pg/WAIciVqo2AvUbNoHaXc09TZhiwSCpJCQla5ZqDtfBi7O0qx03SsDeaUZSEW5LOvOEKZxcJygdMUqr2fGPRm2fCBuJi58isHZFd9z174uokpYyNf87zb0lPreGgP1xH3tnomjnrxUDFJBOo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 1/3] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Topic: [PATCH v5 1/3] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Index: AQHbMSZ/yErsGrD3s0im25m0krd8DrKx8N6A
Date: Mon, 11 Nov 2024 11:05:16 +0000
Message-ID: <FE6C9D2C-EC6D-4A52-B321-C2B5F9F59D7D@arm.com>
References: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
 <20241107150330.181143-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20241107150330.181143-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|GVXPR08MB11182:EE_|DU2PEPF0001E9C6:EE_|AS8PR08MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7af407-e3ba-453e-7a19-08dd0240c1e7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?+E0cmAcNnfjqjcfve0Vh6Ws62JZQ9F+EQL5IjqH7GmGbW5jPwIZ3rszI/+2w?=
 =?us-ascii?Q?2zC13gXqVtVz/xyFzAqs09Paw7LMwf0I3mKE5KzcSyAQwMZpy6Ra9piHOAR5?=
 =?us-ascii?Q?iYs+NDSI4Xdt5+0DOsh6tE3oLPpXtsHnGn/1DFIPTk/xItZPN632fFgB0pw0?=
 =?us-ascii?Q?hRkR04DMBWiugMgiF6st7r7xQ4v6tkjbjHFGboQK7fszCHS3rnjmnXR0tyFi?=
 =?us-ascii?Q?EPqZyVDC/f1SGN47XVQduNm6vbYpX+wrJo1jReePeUx0/LEMpTIL385V1tj5?=
 =?us-ascii?Q?7ireZbNipiiz/+XyRPCPzrkIxUSHtUd+jcktYoYL9BdNl300BlybKGR/F989?=
 =?us-ascii?Q?/AEX3pVP2Xko5LIxGP2cmDwj2CoFJ+aG4I3mncWpShzQg+ffWPDLgrKgvG7u?=
 =?us-ascii?Q?JujOiUfAechAuuZg8GZMeAInOaqYgnX4FBntQsQBvhQnBoWpOwv/9dDno1y9?=
 =?us-ascii?Q?j77rYJqjoWAyYARkPtgioFl8h1IOU+qqUCzCNj/BGjIopWSHBNBf0sAwpZRG?=
 =?us-ascii?Q?BB3VkxkmNQlD6+9YJgo8+BBQUfPmiZkzRpy01LF4NnO57lI+YG/POSZHTJjG?=
 =?us-ascii?Q?KvdJ5ZbsSizsvSa5FF+IlsqH9dqTB/v4Usr7RLAtQK5a/kh84SQhkB44bAdy?=
 =?us-ascii?Q?rDME8PSGS9VqnPqPoqdkcQEOS14lC8IJG5Wf3y5pjZAPZqLFgBPyQ2f+NvUV?=
 =?us-ascii?Q?kCvfDzyz0xAMOMQ3tCGbD0snv8GHzY6yzZRSle4UYbrCJtcOTf8pBtuAOmDb?=
 =?us-ascii?Q?pBwP00LWpIf0Qb1YKAFc9vv94xmz6z7fbr/vDJyRvV6u5CEGaZjvbcU82S/w?=
 =?us-ascii?Q?iaCAOWA/X+jidRYgBPLF6Ke+oA+3bTu0yu229TcxGASDN4mQOGKGUfOknsje?=
 =?us-ascii?Q?2NgIH80psb5aM3ZT2hxCXjic8KRdb529Qz/Cq6ga0OMP7YWex71DoJmIMRdx?=
 =?us-ascii?Q?R6KRNOgIGyspKE3lWeCkk8thvTb8Bda1T/3x28LuihHQoFbDnP1DvHvims0s?=
 =?us-ascii?Q?dxylXSnrBffZQpTatoH+/pGOmIOxi8aNkykMraVUav96s4UOXrONfxePm4Jj?=
 =?us-ascii?Q?10A5TRcTgwhN7pM9sLT/mJ7GY9UwrMFhEZUY4+GE0csIe/Weenxdi7YvYHx7?=
 =?us-ascii?Q?CIV4y/cdeC5Dvsy+PMCL1bD6leqlWa9CIAe7nZTJ3Ic4oZUVgwOVD8W4TWHw?=
 =?us-ascii?Q?OKG4+5vsjVNpI2xV2pi71MpabshaDR7XqJa4CdtzXC7GUBAc+4gg/SrYHDzi?=
 =?us-ascii?Q?OtGvlJ39+xBzuqCjPbf+XeEaaAcrN9B2zxg/SISRE93oUKGyoipPvJ+IaO7d?=
 =?us-ascii?Q?ECXYKlgnya5Tors+ZYVMe47f7ulS3ZRtv29j85IxZxV9dBBS9A5nFQPhSiyZ?=
 =?us-ascii?Q?8Ftt28U=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_FE6C9D2CEC6D4A52B321C2B5F9F59D7Darmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11182
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52d9e1f7-1bdd-4409-1bbb-08dd0240b981
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|35042699022|36860700013|14060799003|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RG1CdDlDdDRnUnF6UkxiaVlGd2Vxd2hLbzliOVk0bkUzb1dqand4eGk4aTdi?=
 =?utf-8?B?d1RoZVpXRHZoVUFpYjNrZkx1TTNranNyV2tpajhNbmZzRHRPS3dETTVHTlRk?=
 =?utf-8?B?RjdGbC84cFMwUnMxbW5GUmhKN2Q5aEVFelkrY3BSdkhxZW0vb1Rhek5aaEhO?=
 =?utf-8?B?L3FkUzhwQXpqSCtwSk1rcjR1ZzV0TXZxV2JLeGg4clcyNVBISmtpckxXNHZE?=
 =?utf-8?B?d0hSQlNNRzVlSnUva1hnQ215dU1ybUpnTnVqVHkwM2RVVGpMbjBmUERGN1hZ?=
 =?utf-8?B?N3B6YSs5bG9qbzJtWVduMlhyenorQW1YTFdIMlBCRlRWRFhyZDR1bWlPa0tN?=
 =?utf-8?B?c1dCM1hvelpJSmxlQUtKZjZwajJPc01WOUFZYnBuMkF5U0owcDdYUUwrNkhO?=
 =?utf-8?B?bEVVNUxycVg0RHNwbVZnVzdPV3hIM0pFUnZEMTkrTkVua2tLdi9COGdjbHk1?=
 =?utf-8?B?YWx3TGNuc3ZxSU9xNER5M1RadEthWGh0NDZVRXZMUW5WWHVqUEp6SGZ5bVpQ?=
 =?utf-8?B?ZmxseVROKzVGUjlKRWgvV3lnOUJPamwrNkVMRnBXRFljZTNIRCs4WlVpZ2R1?=
 =?utf-8?B?SCtyNWRCOUJTc0UyOTFFdFhEYWFic0ZlZlAvdmVJWlM1SHVBUVM4d21scnAr?=
 =?utf-8?B?cW9ySU1tRkgzc2w3QVZqcktIQW44MmpRbXZkazMxaSt5MXBaTDRzbmtEemwz?=
 =?utf-8?B?MGRiY3lEWWhtbUVEWmE4WXhEYklqOU45Zzk2T0NHN2ZOWHVtM2RGK0h5Nldt?=
 =?utf-8?B?LzVCSFJSVW5ib04wem1TU3dYSGgzUlR5bDZ0NFRxbDZhdVJubGdjc3RBUGNE?=
 =?utf-8?B?cEhYMHluSTlYYnM4SC9IT3k3cFd1Z2NOcFMxNDZRWnlJd1VTTXpPelZqRzA2?=
 =?utf-8?B?eTEvSUV2dFlsbjByOEVLWnd2MWV3S21hT0orYk01VG9uSUNMOVNBQUhudFQ0?=
 =?utf-8?B?Rmd4d2NlUFhsUkoveWlXQUtzb0ZVRmlkdmhQVTZzTEl2cHhOdTgzNnh0SHVE?=
 =?utf-8?B?dnJ1TEc2d1hCcnVpdm1rbi8wTk9ic3FlNUppNFBzcWlTV1R0TVJ1TnJBVE9T?=
 =?utf-8?B?OVZVOUw1bXFMUUhJMmtTclJ1bnJBTHMwYW9NbmhoQjRWMDFIV3I3dVFWaXg5?=
 =?utf-8?B?dVZNUnJXbzZJMFdBekRsNFFUc1U1bkNCanJCYW10V3NobGVya2p5VUlQem93?=
 =?utf-8?B?K1BHWHJjczY1OGtGVnFHQm9FaU8zTUxVcmhEZUVGVXViekNBdm5ZMlRFaFIw?=
 =?utf-8?B?a0ExbXpPTlE5Q0IyaTFXZG9kdW5VdklCZGE5czlPT3ZhQkFxTmJqN21sMTZK?=
 =?utf-8?B?dFMvMHRUNk9aVVoyaHluTlRtY2hMeG9vMjFMVW9ZSC9kUEdFaE9GbDVzSERZ?=
 =?utf-8?B?WDlBT2dZYVE5dUd4Vnp6bWRwdnc4aGtTVVJwVnZRQS9ISUxLTEJJVXFwT3JE?=
 =?utf-8?B?cHJialk5am5sQWRQdy9nR0hqbTNQKzIzd0ZYdFBTbmM0TWtGWXZkbkFJK3Q0?=
 =?utf-8?B?N2VOU3p1bEVGL3BCczhlZzNPWnhyS0d4U00zYndndWZ1R3BvaG1aQjNKWjky?=
 =?utf-8?B?U1NCOVJEcnV2alVQQWxMTjJ4RWMwR3duTWhhYVJkdXMxeHkzcTY5VHBZTmdQ?=
 =?utf-8?B?K3gxdUhsdEN6Q2F6UzIzSGx0NnFmMy9qTUhoKzhMUzF5c0xWTFkyWmxkUzJr?=
 =?utf-8?B?aFcreEI2S1NCWFNWemNjeDA1ZWgxQUQ0NitnOHUwYlVVaVVOajYrZ25vOW00?=
 =?utf-8?B?Q1pSS0o0TXREd1ZLU3lVR0QyQXcrZ0pHMHZESDU4eWZsUGNkYmdPRWVTcVJL?=
 =?utf-8?B?MTNTMmYzbjNaOEZjZjhSVWVsTk1yelROQmVRSEloT3ZJRzRVbWVxUmw5cUJV?=
 =?utf-8?B?NWlWZ1pTSmtNWC9rNDU2dm5YSTVTaUhHeXdVOGRPSllmd3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(36860700013)(14060799003)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 11:05:31.0501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7af407-e3ba-453e-7a19-08dd0240c1e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8996

--_000_FE6C9D2CEC6D4A52B321C2B5F9F59D7Darmcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQXlhbiwNCg0KT24gNyBOb3YgMjAyNCwgYXQgMTU6MDMsIEF5YW4gS3VtYXIgSGFsZGVyIDxh
eWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCg0KRGVmaW5lIGVuYWJsZV9ib290X2Nw
dV9tbSgpIGZvciB0aGUgQXJtdjgtUiBBQXJjaDY0Lg0KDQpMaWtlIGJvb3QtdGltZSBwYWdlIHRh
YmxlIGluIE1NVSBzeXN0ZW0sIHdlIG5lZWQgYSBib290LXRpbWUgTVBVIHByb3RlY3Rpb24NCnJl
Z2lvbiBjb25maWd1cmF0aW9uIGluIE1QVSBzeXN0ZW0gc28gWGVuIGNhbiBmZXRjaCBjb2RlIGFu
ZCBkYXRhIGZyb20gbm9ybWFsDQptZW1vcnkuDQoNClRvIGRvIHRoaXMsIFhlbiBtYXBzIHRoZSBm
b2xsb3dpbmcgc2VjdGlvbnMgb2YgdGhlIGJpbmFyeSBhcyBzZXBhcmF0ZSByZWdpb25zDQood2l0
aCBwZXJtaXNzaW9ucykgOi0NCjEuIFRleHQgKFJlYWQgb25seSBhdCBFTDIsIGV4ZWN1dGlvbiBp
cyBwZXJtaXR0ZWQpDQoyLiBSTyBkYXRhIChSZWFkIG9ubHkgYXQgRUwyKQ0KMy4gUk8gYWZ0ZXIg
aW5pdCBkYXRhIGFuZCBSVyBkYXRhIChSZWFkL1dyaXRlIGF0IEVMMikNCjQuIEluaXQgVGV4dCAo
UmVhZCBvbmx5IGF0IEVMMiwgZXhlY3V0aW9uIGlzIHBlcm1pdHRlZCkNCjUuIEluaXQgZGF0YSBh
bmQgQlNTIChSZWFkL1dyaXRlIGF0IEVMMikNCg0KQmVmb3JlIGNyZWF0aW5nIGEgcmVnaW9uLCB3
ZSBjaGVjayBpZiB0aGUgY291bnQgZXhjZWVkcyB0aGUgbnVtYmVyIGRlZmluZWQgaW4NCk1QVUlS
X0VMMi4gSWYgc28sIHRoZW4gdGhlIGJvb3QgZmFpbHMuDQoNCkFsc28gd2UgY2hlY2sgaWYgdGhl
IHJlZ2lvbiBpcyBlbXB0eSBvciBub3QuIElPVywgaWYgdGhlIHN0YXJ0IGFuZCBlbmQgYWRkcmVz
cw0KYXJlIHNhbWUsIHdlIHNraXAgbWFwcGluZyB0aGUgcmVnaW9uLg0KDQpUbyBtYXAgYSByZWdp
b24sIFhlbiB1c2VzIHRoZSBQUkJBUl9FTDIsIFBSTEFSX0VMMiBhbmQgUFJTRUxSX0VMMiByZWdp
c3RlcnMuDQpPbmUgY2FuIHJlZmVyIHRvIEFSTSBEREkgMDYwMEIuYSBJRDA2MjkyMiBHMS4zICAi
R2VuZXJhbCBTeXN0ZW0gQ29udHJvbA0KUmVnaXN0ZXJzIiwgdG8gZ2V0IHRoZSBkZWZpbml0aW9u
cyBvZiB0aGVzZSByZWdpc3RlcnMuIEFsc28sIHJlZmVyIHRvIEcxLjINCiJBY2Nlc3NpbmcgTVBV
IG1lbW9yeSByZWdpb24gcmVnaXN0ZXJzIiwgdGhlIGZvbGxvd2luZw0KDQpgYGANClRoZSBNUFUg
cHJvdmlkZXMgdHdvIHJlZ2lzdGVyIGludGVyZmFjZXMgdG8gcHJvZ3JhbSB0aGUgTVBVIHJlZ2lv
bnM6DQotIEFjY2VzcyB0byBhbnkgb2YgdGhlIE1QVSByZWdpb25zIHZpYSBQUlNFTFJfRUx4LCBQ
UkJBUjxuPl9FTHgsIGFuZA0KUFJMQVI8bj5fRUx4Lg0KYGBgDQoNCldlIHVzZSB0aGUgYWJvdmUg
bWVjaGFuaXNtIHRvIGNyZWF0ZSB0aGUgTVBVIG1lbW9yeSByZWdpb25zLg0KDQpBbHNvLCB0aGUg
Y29tcGlsZXIgbmVlZHMgdGhlIGZsYWcgKCItbWFyY2g9YXJtdjgtciIpIGluIG9yZGVyIHRvIGJ1
aWxkIFhlbiBmb3INCkFybXY4LVIgQUFyY2g2NCBNUFUgYmFzZWQgc3lzdGVtcy4gVGhlcmUgd2ls
bCBiZSBubyBuZWVkIGZvciB1cyB0byBleHBsaWNpdGx5DQpkZWZpbmUgTVBVIHNwZWNpZmljIHJl
Z2lzdGVycy4NCg0KU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIu
aGFsZGVyQGFtZC5jb20+DQotLS0NCg0KQ2hhbmdlcyBsb29rcyBvayB0byBtZSBhbmQgSeKAmXZl
IGFsc28gYnVpbHQgYW5kIHRlc3RlZCwgbWF5YmUgb25lIE5JVCBiZWxvdw0KDQoNCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9tbS5oDQppbmRleCA1YWJkNGIwZDFjLi41OWI3NzRiN2I4IDEwMDY0NA0KLS0tIGEveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmgNCisrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9tbS5oDQpAQCAtMTYsNyArMTYsNyBAQA0KDQojaWYgZGVmaW5lZChDT05GSUdfTU1VKQ0KIyBp
bmNsdWRlIDxhc20vbW11L21tLmg+DQotI2Vsc2UNCisjZWxpZiAhZGVmaW5lZChDT05GSUdfTVBV
KQ0KIyBlcnJvciAiVW5rbm93biBtZW1vcnkgbWFuYWdlbWVudCBsYXlvdXQiDQojZW5kaWYNCg0K
DQpe4oCUIG1heWJlIHRoaXMgY2hhbmdlIGlzIG5vdCBuZWVkZWQgYXQgdGhpcyBzdGFnZSwgaXQg
d2lsbCBiZSBzb29uIHRob3VnaA0KDQpBbnl3YXk6DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNl
bGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb208bWFpbHRvOmZhbmNlbGx1QGFybS5jb20+Pg0KDQpD
aGVlcnMsDQpMdWNhDQoNCg==

--_000_FE6C9D2CEC6D4A52B321C2B5F9F59D7Darmcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <CD215413DDF2E2439DB67496424E9DF4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJvdmVyZmxv
dy13cmFwOiBicmVhay13b3JkOyAtd2Via2l0LW5ic3AtbW9kZTogc3BhY2U7IGxpbmUtYnJlYWs6
IGFmdGVyLXdoaXRlLXNwYWNlOyI+DQpIaSBBeWFuLDxiciBpZD0ibGluZUJyZWFrQXRCZWdpbm5p
bmdPZk1lc3NhZ2UiPg0KPGRpdj48YnI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4NCjxkaXY+
T24gNyBOb3YgMjAyNCwgYXQgMTU6MDMsIEF5YW4gS3VtYXIgSGFsZGVyICZsdDtheWFuLmt1bWFy
LmhhbGRlckBhbWQuY29tJmd0OyB3cm90ZTo8L2Rpdj4NCjxiciBjbGFzcz0iQXBwbGUtaW50ZXJj
aGFuZ2UtbmV3bGluZSI+DQo8ZGl2Pg0KPGRpdj5EZWZpbmUgZW5hYmxlX2Jvb3RfY3B1X21tKCkg
Zm9yIHRoZSBBcm12OC1SIEFBcmNoNjQuPGJyPg0KPGJyPg0KTGlrZSBib290LXRpbWUgcGFnZSB0
YWJsZSBpbiBNTVUgc3lzdGVtLCB3ZSBuZWVkIGEgYm9vdC10aW1lIE1QVSBwcm90ZWN0aW9uPGJy
Pg0KcmVnaW9uIGNvbmZpZ3VyYXRpb24gaW4gTVBVIHN5c3RlbSBzbyBYZW4gY2FuIGZldGNoIGNv
ZGUgYW5kIGRhdGEgZnJvbSBub3JtYWw8YnI+DQptZW1vcnkuPGJyPg0KPGJyPg0KVG8gZG8gdGhp
cywgWGVuIG1hcHMgdGhlIGZvbGxvd2luZyBzZWN0aW9ucyBvZiB0aGUgYmluYXJ5IGFzIHNlcGFy
YXRlIHJlZ2lvbnM8YnI+DQood2l0aCBwZXJtaXNzaW9ucykgOi08YnI+DQoxLiBUZXh0IChSZWFk
IG9ubHkgYXQgRUwyLCBleGVjdXRpb24gaXMgcGVybWl0dGVkKTxicj4NCjIuIFJPIGRhdGEgKFJl
YWQgb25seSBhdCBFTDIpPGJyPg0KMy4gUk8gYWZ0ZXIgaW5pdCBkYXRhIGFuZCBSVyBkYXRhIChS
ZWFkL1dyaXRlIGF0IEVMMik8YnI+DQo0LiBJbml0IFRleHQgKFJlYWQgb25seSBhdCBFTDIsIGV4
ZWN1dGlvbiBpcyBwZXJtaXR0ZWQpPGJyPg0KNS4gSW5pdCBkYXRhIGFuZCBCU1MgKFJlYWQvV3Jp
dGUgYXQgRUwyKTxicj4NCjxicj4NCkJlZm9yZSBjcmVhdGluZyBhIHJlZ2lvbiwgd2UgY2hlY2sg
aWYgdGhlIGNvdW50IGV4Y2VlZHMgdGhlIG51bWJlciBkZWZpbmVkIGluPGJyPg0KTVBVSVJfRUwy
LiBJZiBzbywgdGhlbiB0aGUgYm9vdCBmYWlscy48YnI+DQo8YnI+DQpBbHNvIHdlIGNoZWNrIGlm
IHRoZSByZWdpb24gaXMgZW1wdHkgb3Igbm90LiBJT1csIGlmIHRoZSBzdGFydCBhbmQgZW5kIGFk
ZHJlc3M8YnI+DQphcmUgc2FtZSwgd2Ugc2tpcCBtYXBwaW5nIHRoZSByZWdpb24uPGJyPg0KPGJy
Pg0KVG8gbWFwIGEgcmVnaW9uLCBYZW4gdXNlcyB0aGUgUFJCQVJfRUwyLCBQUkxBUl9FTDIgYW5k
IFBSU0VMUl9FTDIgcmVnaXN0ZXJzLjxicj4NCk9uZSBjYW4gcmVmZXIgdG8gQVJNIERESSAwNjAw
Qi5hIElEMDYyOTIyIEcxLjMgJm5ic3A7JnF1b3Q7R2VuZXJhbCBTeXN0ZW0gQ29udHJvbDxicj4N
ClJlZ2lzdGVycyZxdW90OywgdG8gZ2V0IHRoZSBkZWZpbml0aW9ucyBvZiB0aGVzZSByZWdpc3Rl
cnMuIEFsc28sIHJlZmVyIHRvIEcxLjI8YnI+DQomcXVvdDtBY2Nlc3NpbmcgTVBVIG1lbW9yeSBy
ZWdpb24gcmVnaXN0ZXJzJnF1b3Q7LCB0aGUgZm9sbG93aW5nPGJyPg0KPGJyPg0KYGBgPGJyPg0K
VGhlIE1QVSBwcm92aWRlcyB0d28gcmVnaXN0ZXIgaW50ZXJmYWNlcyB0byBwcm9ncmFtIHRoZSBN
UFUgcmVnaW9uczo8YnI+DQotIEFjY2VzcyB0byBhbnkgb2YgdGhlIE1QVSByZWdpb25zIHZpYSBQ
UlNFTFJfRUx4LCBQUkJBUiZsdDtuJmd0O19FTHgsIGFuZDxicj4NClBSTEFSJmx0O24mZ3Q7X0VM
eC48YnI+DQpgYGA8YnI+DQo8YnI+DQpXZSB1c2UgdGhlIGFib3ZlIG1lY2hhbmlzbSB0byBjcmVh
dGUgdGhlIE1QVSBtZW1vcnkgcmVnaW9ucy48YnI+DQo8YnI+DQpBbHNvLCB0aGUgY29tcGlsZXIg
bmVlZHMgdGhlIGZsYWcgKCZxdW90Oy1tYXJjaD1hcm12OC1yJnF1b3Q7KSBpbiBvcmRlciB0byBi
dWlsZCBYZW4gZm9yPGJyPg0KQXJtdjgtUiBBQXJjaDY0IE1QVSBiYXNlZCBzeXN0ZW1zLiBUaGVy
ZSB3aWxsIGJlIG5vIG5lZWQgZm9yIHVzIHRvIGV4cGxpY2l0bHk8YnI+DQpkZWZpbmUgTVBVIHNw
ZWNpZmljIHJlZ2lzdGVycy48YnI+DQo8YnI+DQpTaWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFyIEhh
bGRlciAmbHQ7YXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSZndDs8YnI+DQotLS08YnI+DQo8L2Rp
dj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+Q2hhbmdl
cyBsb29rcyBvayB0byBtZSBhbmQgSeKAmXZlIGFsc28gYnVpbHQgYW5kIHRlc3RlZCwgbWF5YmUg
b25lIE5JVCBiZWxvdzwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiPg0KPGRpdj4NCjxkaXY+PGJyPg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9tbS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmg8YnI+DQppbmRleCA1
YWJkNGIwZDFjLi41OWI3NzRiN2I4IDEwMDY0NDxicj4NCi0tLSBhL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9tbS5oPGJyPg0KKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmg8YnI+
DQpAQCAtMTYsNyArMTYsNyBAQDxicj4NCjxicj4NCiNpZiBkZWZpbmVkKENPTkZJR19NTVUpPGJy
Pg0KIyBpbmNsdWRlICZsdDthc20vbW11L21tLmgmZ3Q7PGJyPg0KLSNlbHNlPGJyPg0KKyNlbGlm
ICFkZWZpbmVkKENPTkZJR19NUFUpPGJyPg0KIyBlcnJvciAmcXVvdDtVbmtub3duIG1lbW9yeSBt
YW5hZ2VtZW50IGxheW91dCZxdW90Ozxicj4NCiNlbmRpZjxicj4NCjxicj4NCjwvZGl2Pg0KPC9k
aXY+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPC9kaXY+DQpe4oCUIG1heWJl
IHRoaXMgY2hhbmdlIGlzIG5vdCBuZWVkZWQgYXQgdGhpcyBzdGFnZSwgaXQgd2lsbCBiZSBzb29u
IHRob3VnaA0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+QW55d2F5OjwvZGl2Pg0KPGRpdj48YnI+
DQo8L2Rpdj4NCjxkaXY+UmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgJmx0O2x1Y2EuPGEgaHJl
Zj0ibWFpbHRvOmZhbmNlbGx1QGFybS5jb20iPmZhbmNlbGx1QGFybS5jb208L2E+Jmd0OzwvZGl2
Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+Q2hlZXJzLDwvZGl2Pg0KPGRpdj5MdWNhPC9kaXY+
DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_FE6C9D2CEC6D4A52B321C2B5F9F59D7Darmcom_--


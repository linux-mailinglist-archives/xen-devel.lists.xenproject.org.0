Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4113A4DDD9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 13:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901053.1309027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpRL1-00019f-PP; Tue, 04 Mar 2025 12:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901053.1309027; Tue, 04 Mar 2025 12:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpRL1-00017p-MN; Tue, 04 Mar 2025 12:25:31 +0000
Received: by outflank-mailman (input) for mailman id 901053;
 Tue, 04 Mar 2025 12:25:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2zF=VX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tpRL0-00017j-RP
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 12:25:30 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20630.outbound.protection.outlook.com
 [2a01:111:f403:2608::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf8dc606-f8f3-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 13:25:25 +0100 (CET)
Received: from AM8P190CA0021.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::26)
 by AS8PR08MB9220.eurprd08.prod.outlook.com (2603:10a6:20b:5a3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Tue, 4 Mar
 2025 12:25:18 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::1c) by AM8P190CA0021.outlook.office365.com
 (2603:10a6:20b:219::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.26 via Frontend Transport; Tue,
 4 Mar 2025 12:25:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 4 Mar 2025 12:25:16 +0000
Received: ("Tessian outbound 93a06e49d4fd:v585");
 Tue, 04 Mar 2025 12:25:16 +0000
Received: from L7135f3732d14.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9CF92A2E-23D1-40D9-9F84-2DF1E7E20EBE.1; 
 Tue, 04 Mar 2025 12:25:06 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7135f3732d14.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Mar 2025 12:25:06 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB9778.eurprd08.prod.outlook.com (2603:10a6:10:45d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Tue, 4 Mar
 2025 12:25:01 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 12:25:01 +0000
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
X-Inumbo-ID: bf8dc606-f8f3-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=b/T969pjixUMrXguOMJ+tVOvzMxUxikwvtldPBu9+yUKSbKRQavaznwpjXd0FOitG9wYpGVhxOQOvniuFcjEB78AgFgCLj1jm1WVdThrZvx3wfuyOytBU2ifQ4396H13MSwp3PGBNe7VUfFPW8OzHUcxxXRAcII1GVccDD4ku6WmOJ0O36uoj33sR9u5DwHTm/EkV/a48mLuNECGhGpDn329BKTIkU6hqjiR9UmBaUaYcwwn/196bS1EOost+MBbKNSblrpBB4v7h93fEinrRRJb77anCWF2mRHliqZ+nHbCqKeOgcq+e4c92ByXQDJeRBRqUr0mBTSMdEy+KqidRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUXASoFvT8QNz1iYsJkSzJtF9FnIbYk6CIDd1DEbxf4=;
 b=cyzygds+YjCEIdXJ+cjgCXCPX/3eVSU+YymXEHe1VBw8l+SFXwb2RSYMZzXC7e/J24tvH1ZTgCVr9DGqqLSnrSs7W3//S4geIba1LAckPJCo5tdB1Lj5PUQ5cryNIKE+oUvAaxc+BVawIjRXfBzp9bwnQp5ScqEMq7KKoHLcsXBANNZlBdbZX2hdvXANFmdlBw71iWEbHzEVf4tGFtEMyz32TBxLIyS955U5B+A9SgYX92vvfAi+QO45Tv6ma959i545xq5grnZWF97aAobhAnjLX2RWvHzA5reg7nT4ZugMRqxMLaZpuOs8CY/uxHaMLkL4BT8AQftEXgsuin7MMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUXASoFvT8QNz1iYsJkSzJtF9FnIbYk6CIDd1DEbxf4=;
 b=QnpyT4z36ADp9HR7hELHuAa+vb3Gu0p8Nclk4F+3JMtPmuoJ82p2grWXXUbvM3sqxsKDU1h6elC1L0eTybJlrPKK89I5ILqYhRt9j8ChBK7AuH2nZSeFHWcA4UpnPnaeTGW0/3XVHwshUbojLfbOF5wYTjI51hhE7JF1zzhyH9o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: de1cd269140a8ed5
X-TessianGatewayMetadata: BP4Jwfw1iW/qYYKtWtdijnW4v+OP8iHSmomGWld7wRqn9tzN27Rux6N+uB9w8yCzhvCFtnuARpU8ywzWN9H4wi9hCw9YjnuLGMuU/VX9iPTLJBI9iBzaPPPJ0o3+OKyPjwW9D7av6gkAwSqp7pPMUYN8ssU+CwTqNFtAhYESqGQ=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miHSg7AkyhePTt6ga3YE0J47cTakNkC/xJ1WjaclW9nuab6jVni8D4MdwaICs1kVLKz9VxmlTRfFmv0RkK+tcLYI6LAO9eQ4ivE/Qc8mE7E662Sa6fch1pbWE8yjNnST8tKPbb8wbNTw1wKVu1RoqFQyvtYlnD5sYuOD/Wx6Kqgrq43+m4iBD+KHGodF5EnwGYfY12pHOiTyTO1lVf19mJOHQ6q1Km8xitwOcbXrf23mNzMN/b/DkEixiclZ67wo5ywRtIdLoS6dVRETlUF+sQmlAxeL3VQEoaqGgFetHaygnMPvYvvM7mVC1CxkbOmtkzrPX4Gau0iKqzZuJdlnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUXASoFvT8QNz1iYsJkSzJtF9FnIbYk6CIDd1DEbxf4=;
 b=OWMkqNuiELZ/AsLkvxxnCvQF0n18BkRIL1cN3hSrDQ2kOQ+X9JBdDvCBGlGrvBLs6wQ5ig00GdSrSV4sjrsoS7epEmUPyiW4UTBdp87+i3HceSeXKXhE1B93B/g11SmR734VtHx/iHJkBu4TFWKeGATc8HGVo5Wr4bMjh8rlS+RWuSJuPkEDLN7tZjkAlTCdQ3Ly/bswG44T5KD/DfnbXr6LLUGRKVpc/EmAsFlVBnzCpW0/gnoQGdqucLgr7tm5TV7sTzOpIEI8U8gcenqwv1Uwrs3zEFBOt+J72JpCTndwtuc4XyLgZqRJRBYuCsQM4ZFcjLtknnOuGGLUKcnGTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUXASoFvT8QNz1iYsJkSzJtF9FnIbYk6CIDd1DEbxf4=;
 b=QnpyT4z36ADp9HR7hELHuAa+vb3Gu0p8Nclk4F+3JMtPmuoJ82p2grWXXUbvM3sqxsKDU1h6elC1L0eTybJlrPKK89I5ILqYhRt9j8ChBK7AuH2nZSeFHWcA4UpnPnaeTGW0/3XVHwshUbojLfbOF5wYTjI51hhE7JF1zzhyH9o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 6/9] arm/mpu: Provide a constructor for pr_t type
Thread-Topic: [PATCH 6/9] arm/mpu: Provide a constructor for pr_t type
Thread-Index: AQHbifx0LOex0WH/OkCl0iSW7rfY57Ni4d+AgAAK6oA=
Date: Tue, 4 Mar 2025 12:25:01 +0000
Message-ID: <50D855BE-1E49-4EAD-8B44-6E76512EB117@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
 <20250228161817.3342443-7-luca.fancellu@arm.com>
 <37f6cadf-005f-425e-8aa7-45a947dbbc5a@amd.com>
In-Reply-To: <37f6cadf-005f-425e-8aa7-45a947dbbc5a@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB9778:EE_|AM2PEPF0001C711:EE_|AS8PR08MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: 2790b99b-3357-48bd-7638-08dd5b179f12
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?L2lZRXJ1d0s3T2FLV0FuUUdCVjJxUWc1aG41Q1FoaUt4eTdXeW1wZU0xRWtJ?=
 =?utf-8?B?OE0zam5TTVV5L1A5WTRRS3k4WGNrK0NHSEVMb0RvL2lzc3JRQm1leCtJV2Nn?=
 =?utf-8?B?S1pIVUlYYUhFVVB3YnJxWlh0UFZxNmlEVkdMZnduM0tkbmhYaXowVWpNU0di?=
 =?utf-8?B?RGFqZ1ZjZGhZb1NIR3Evb3RoMDNUMk15OW5jSFdPSitZM1pPdnhyUVNwR2xY?=
 =?utf-8?B?LzlpT21SQzRBaTdSdnhheGhsTWVUVFZtYUwrMG9iajYrd1k3Ri9FSDVWUFR3?=
 =?utf-8?B?M1M4ZFVGbU9zUWRxWHNnSjRwQ2c1VEpKc0duSys0WktaTlJZN1Q3L2lpcnlI?=
 =?utf-8?B?bEplNTVZbURwUk1ZUkxyYzY4MDFzc2NxUDhaamNxQVJ3Y0tTUTlXRFQwRHhP?=
 =?utf-8?B?bW9qSlNQK25XY3ZxenVpQzNKemNEWVM0QWJpK0hXeGFEemN1YmJJZjFTak1M?=
 =?utf-8?B?S1dPYlZYemhERXRJUkhJOTRjeWF6M0ZPNUlJS2Y4N0hqN2dMK3djNDFXZXVN?=
 =?utf-8?B?U0dadmpoYWNjU0NUVEUwMWxjUDFZRlRta0NmN2wzS0VqZ0ZnRm1VNFZzTkt2?=
 =?utf-8?B?ZGZ5VmgrZzJxZGhxaUR1YjVXU1VVbmU2WFFvbjJOdDdSU1JpZ3F1Y1VHckZy?=
 =?utf-8?B?bVBwZ2NHOXVHMHE2MTBPVHlFalFCcVdBb3hGeis5RkZUZEJIcjdSYUZTOG1L?=
 =?utf-8?B?ancxUlpjOFJmMWt3MjYrb040cDZxZ3A3M1dUb0ZIbWhjTXNzdUZDcVpEdThj?=
 =?utf-8?B?M2wwM1BvbGRua0pYQlN1amY4eFBDSzBRaFlLMDJjVDZuUGRya0NuU2xHeUZV?=
 =?utf-8?B?MzVlZW5HSW5vOUI2QnBLM09HcTZrK2g3cHA0cDJ1blpqQ0l4WmdhcVZsdjdP?=
 =?utf-8?B?aHNFcnNnMmUrY3d0UURtYTBSOGw1M2dwYldyN01VMG5Td0VsMEppTThmMFBY?=
 =?utf-8?B?RXZwbkhSKzkzVnZ2dktqUmprQk9YK2MvemR5cVR0MXRUMTloSzd5TmZvV2da?=
 =?utf-8?B?aWRBWTJGK1B3UGFKSjVLT0xoU3p3TGx1V0wvR2F6NzBQRVJ6WllrQm44aEhz?=
 =?utf-8?B?amlnUmsvWFBpWHlLVG94WDhhSGFQTU1oa1QrZDRzZU95eExjc0F4TFgwUWpy?=
 =?utf-8?B?Sm5rVisvWDViR2orWjJEVzdkTVBVWklxbTAwdjdJaklDc0NsMEdaUTJ1aHlQ?=
 =?utf-8?B?N25GeXBJT2xZdjJyenNuZEh6U2phbjZKNHg3RUVKS24rbGxmWnhWc3pzUWNQ?=
 =?utf-8?B?Vkg1cElISG1HaGZRS0dLb04wMmJwb1poeThROGt5bWFiZFZvNHNJdE1HMkxF?=
 =?utf-8?B?bDlZc3d1Q3FDS3FXOHc4RXlVODBndjJOL01HQU0zVTZ6VGNXcnJ6Wko5aUZ5?=
 =?utf-8?B?c0QrYldveHZJS0RnRCt5QTloeU5pTENwQi9xaVVXUlZrZGJOejlaZythS003?=
 =?utf-8?B?bkR3R2tGOURJd2cveGl5ZzZOL2N6OEMwSWFRSDdIdGozaFgrV2hPVFN6TTFT?=
 =?utf-8?B?UU00emxTbzA1cjloV2o0ckhLckRhejhrQVFwaStGbGVtczZxMkFjNHdrT3pn?=
 =?utf-8?B?K0wrREJiamdiMG5MMU5YTmp5QlFoVHFQUUZWZEplaWF1MWxGT1BIbmdGeEFq?=
 =?utf-8?B?aGtYcVhJRmtIY1cyWEpBcXNIMlA2anJCV3l0YVJ5b3FtbTFLdEtxOUJnNnUw?=
 =?utf-8?B?Q1dIeDFOL2IwR1FueUx0Z2ZrTWZXSjRlclozM0lzeUx2VTZQZmg1VktnUjNJ?=
 =?utf-8?B?Z3pNUkEwTTFuRXpWZitlVmZvRXo4WU82MFhuNENnSEdEdjRtYW9YM0F4eGMv?=
 =?utf-8?B?blJ6d3VOeWRVT3h4SlBjSzJQcHR4UUFDdHU4RVZEcTRvOC9GNXY5bE5aM2F6?=
 =?utf-8?B?eThiQ0tNU1QwbUVaSFg5RHVMWWpYb2tUaFBKay81dWJTZUZOeFVTSTlnM1Jr?=
 =?utf-8?Q?yRpRmpxqwT9qTMZhGPrQ0USWUhtDCQcl?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FBCE39FD7F47049B5652553548B5DEE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9778
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ea197da-9be8-4597-f4f7-08dd5b179613
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|14060799003|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qy85RlpybnA2RVNmbkNlazRkSDZHMlU2dGJOQmxTQ0xlRmhhd0RSa0Q0TFVX?=
 =?utf-8?B?b3NVSjlhT2IydXVDajJpb1RmaC90akp5STJ6Z1dva1RnWE9iaWNyWTVrQnl3?=
 =?utf-8?B?RWVuajFHTkw1M0FHSHZzR0NGd2VkUlF2UkFCTjM2UnViMDJvejlvNUovMEx2?=
 =?utf-8?B?WlNSdEp1dEJjeU9qLzNtb0F1bFJ3cGVrY0ptakl4SnY1SzRrMVpSSjlBRmVY?=
 =?utf-8?B?QlBUeDhNa0FRU3NjS3dhLzVBZnd0RTc2MkNmMnFDWTJqVnFwNC9XbExYaWly?=
 =?utf-8?B?d2YzS0t0SFJZMytlNW5aL2FSbHdCK2NvTEUwdGp3bllBc2d4ZTBZM01hK2VN?=
 =?utf-8?B?NGx4cHAwQVRRNk1qSFJ5Z2h0Q0g3L2Nhd0NTZVMzcHhqS3drSE5FRTh3OXJU?=
 =?utf-8?B?WkhwVDdMMWRTVjluRmNUSTN2cWRBSUtIdTVBQmJXc09GWE14OGM5d3NhV2JV?=
 =?utf-8?B?YW03c05uMCt0amhCbXNZbmkxcmRKVnd1TWk3VXE3YXVkd01qVTI3dEttUUps?=
 =?utf-8?B?RVZ5WjJ2UnRtaW0vTkswYlZTdE1kY3dUa21vZlRLYlRiSFZsSzczckZaNFl6?=
 =?utf-8?B?QS9xbGI2MHZVMkpqTnRRT3psT1hHUmJXWG51OTczc1pTdVZrYjEyc21KdmJz?=
 =?utf-8?B?WUJFS1VxVXBaQTFEWVA4MVFwVUc5ZVgrcjVPRzlGaVNialdaSDRNWW55bHNv?=
 =?utf-8?B?ZHh4QWRjM2JuSGhqeThaN3F4dm80UUVxOURHWUJFTGR0NktscW9FZmxPWk5X?=
 =?utf-8?B?R1Jac1RCR3ZMWk9SZ2V3N0dGdzZqMjVLbEtReURzbG5jVjZxaGdYSjd2YVYx?=
 =?utf-8?B?ZVArNkMzOWRKSlNWR2lhTHpuQVpFR09yMGxHR2VNV2dsMGVHSGF2SFVmOVBO?=
 =?utf-8?B?eEhDTkUrdi9KVUtsZWdQRkRsaEtXTCtXUWVTVkxlNW82TGVlalEwR3VQdGNp?=
 =?utf-8?B?NUVpRUNjTVRESVJtdU9ZMnpaeE5rSEdvcVg4djJEUERVM2RjbFN1UTZ2MHZn?=
 =?utf-8?B?dlVFUElqMnE5bWk0ZWh2UW5oRml1V2c4RzZCblVrQVB6YnpHRmlSK2VFeHBz?=
 =?utf-8?B?ZGdsZHlWdjZCU2pSN2tDd0FXWmFyMGVlekRpeUUxQUNzbHB2MkVma2NLOTB6?=
 =?utf-8?B?eGNubkhaR045cTE3eFFsMlgzaGtPWEtINEpuVkhWMHF5RjIydllramFFeEdH?=
 =?utf-8?B?dU9sMjRKQ0dZN2F2RUFIalBqL0ZmNFdwWmVVRjFLMThMck9OMFgzUzJLRXdX?=
 =?utf-8?B?QTc3bVpFRCs0cGljN3Izb0FjRmxGS2tsNXpDRHcxaHdLMHl2Q0twemZRcVhk?=
 =?utf-8?B?aVlFWEhuUXdBeVZMRVAzWTU0UjV1QVNMbXFscS9sSmJWL1ZBUk56OUtTQ1V1?=
 =?utf-8?B?K0VxcU1EVkJLajJBUFRCVXFtWGFMUjNUT2ZncDZ0a29xSHhYR21DR3lQYjc0?=
 =?utf-8?B?anpHQmY4bVg3OTk0QVF5a2ZvbHdodzBnbXhCR0tYSVE5T0hkMmEyamJ0K2Z6?=
 =?utf-8?B?N3VGazVGVVRWOUU2ZWhKanZPaEZKVHRtVi9aME9SUWlscG40b1NYV2JPRXR3?=
 =?utf-8?B?TmcvalBUNyswMlpSKzdMMFh4K3ljZ1pWWlFLVExoVzJlNXRMQmVpSU1BL3FF?=
 =?utf-8?B?M2JQbXRlemxia1pJb1JwSGxnT002REl5U2xDMGdXVkFNckhZKzF4ZlY3VkxE?=
 =?utf-8?B?SHVseXNMVFpXZDBCa2ttbXBXYlRyTzlNVVdVK1E4YThyQjVLa0V4cDBIV0tn?=
 =?utf-8?B?SXNBcXdKL0NrMFFUOEtqUVYyb3lKWHduWlpXeXNyS3lkMFdnNzF4T0VuMkJV?=
 =?utf-8?B?SnRzRGw0RTV0SzJ4UHl3RHYxU0V1TTVqd2VrZXhTZ0NUMmJ5dm95Y0Q2WkNW?=
 =?utf-8?B?bVJIc2o0Y0pGazJ0S1hrQVoraU9ERmpUSi95bkl1VEQ2YWxiWEF4VVZ4YXRR?=
 =?utf-8?B?NGtEWkR4bFZ2NUV2K2dGVGNYMUFUdVNZOHgvZGNHNHl5cHRoaHVTcDRJQWx4?=
 =?utf-8?Q?ijxyTkZWZbIkqI4czXRsVYBbhHxhv4=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(14060799003)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 12:25:16.7016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2790b99b-3357-48bd-7638-08dd5b179f12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9220

DQoNCj4gT24gNCBNYXIgMjAyNSwgYXQgMTE6NDUsIEF5YW4gS3VtYXIgSGFsZGVyIDxheWFua3Vt
YUBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyOC8wMi8yMDI1IDE2
OjE4LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gQ0FVVElPTjogVGhpcyBtZXNzYWdlIGhhcyBv
cmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBQbGVhc2UgdXNlIHByb3BlciBqdWRn
bWVudCBhbmQgY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtz
LCBvciByZXNwb25kaW5nIHRvIHRoaXMgZW1haWwuDQo+PiANCj4+IA0KPj4gUHJvdmlkZSBhIGZ1
bmN0aW9uIHRoYXQgY3JlYXRlcyBhIHByX3Qgb2JqZWN0IGZyb20gYSBtZW1vcnkNCj4+IHJhbmdl
IGFuZCBzb21lIGF0dHJpYnV0ZXMuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2Vs
bHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9hcm02NC9tcHUuaCB8IDE1ICsrKysrKw0KPj4gIHhlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9tcHUvbW0uaCAgICB8ICAzICsrDQo+PiAgeGVuL2FyY2gvYXJtL21wdS9tbS5jICAgICAg
ICAgICAgICAgIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gIDMgZmlsZXMg
Y2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL2FybTY0L21wdS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Fy
bTY0L21wdS5oDQo+PiBpbmRleCAzYTA5MzM5ODE4YTAuLmRjZTc3ZGE2MDExMCAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC9tcHUuaA0KPj4gKysrIGIveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L21wdS5oDQo+PiBAQCAtMTcsNiArMTcsMjEgQEAN
Cj4+IA0KPj4gICNkZWZpbmUgTUFYX01QVV9SRUdJT05TICAgICAgICAgTlVNX01QVV9SRUdJT05T
X01BU0sNCj4+IA0KPj4gKy8qIEFjY2VzcyBwZXJtaXNzaW9uIGF0dHJpYnV0ZXMuICovDQo+PiAr
LyogUmVhZC9Xcml0ZSBhdCBFTDIsIE5vIEFjY2VzcyBhdCBFTDEvRUwwLiAqLw0KPj4gKyNkZWZp
bmUgQVBfUldfRUwyIDB4MA0KPiBUaGlzIGlzIGNvbW1vbiBhcyB3ZWxsIGJldHdlZW4gYXJtNjQg
YW5kIGFybTMyLg0KPj4gKw0KPj4gKy8qDQo+PiArICogRXhjdXRlIG5ldmVyLg0KPj4gKyAqIFN0
YWdlIDEgRUwyIHRyYW5zbGF0aW9uIHJlZ2ltZS4NCj4+ICsgKiBYTlsxXSBkZXRlcm1pbmVzIHdo
ZXRoZXIgZXhlY3V0aW9uIG9mIHRoZSBpbnN0cnVjdGlvbiBmZXRjaGVkIGZyb20gdGhlIE1QVQ0K
Pj4gKyAqIG1lbW9yeSByZWdpb24gaXMgcGVybWl0dGVkLg0KPj4gKyAqIFN0YWdlIDIgRUwxL0VM
MCB0cmFuc2xhdGlvbiByZWdpbWUuDQo+PiArICogWE5bMF0gZGV0ZXJtaW5lcyB3aGV0aGVyIGV4
ZWN1dGlvbiBvZiB0aGUgaW5zdHJ1Y3Rpb24gZmV0Y2hlZCBmcm9tIHRoZSBNUFUNCj4+ICsgKiBt
ZW1vcnkgcmVnaW9uIGlzIHBlcm1pdHRlZC4NCj4+ICsgKi8NCj4+ICsjZGVmaW5lIFhOX0VOQUJM
RUQgICAgIDB4Mg0KPiANCj4gVGhpcyBzZWVtcyBpbmNvcnJlY3QuDQo+IA0KPiBBcyBwZXIgQVJN
IERESSAwNjAwQS5kIElEMTIwODIxLCBHMS4zLjE5IFBSQkFSPG4+X0VMMiAoYXJtdjggUjY0IHN1
cHBsZW1lbnQpDQo+IA0KPiAwYjAwIEV4ZWN1dGlvbiBvZiBpbnN0cnVjdGlvbnMgZmV0Y2hlZCBm
cm9tIHRoZSByZWdpb24gaXMgcGVybWl0dGVkLg0KPiANCj4gMGIwMSBFeGVjdXRpb24gb2YgaW5z
dHJ1Y3Rpb25zIGZldGNoZWQgZnJvbSB0aGUgcmVnaW9uIGlzIG5vdCBwZXJtaXR0ZWQuDQo+IA0K
PiBUaGlzIGhvbGRzIHRydWUgZm9yIDMyLWJpdCBhcyB3ZWxsIChleGNlcHQgZm9yIHRoZSBmYWN0
IHRoYXQgWE4gaXMgZGVub3RlZCBieSAxLWJpdCkuDQo+IA0KPiBTbyB0aGUgY29ycmVjdCBkZWZp
bml0aW9uIGlzDQo+IA0KPiAjZGVmaW5lIFhOX0VOQUJMRUQgICAgIDB4MA0KPiANCj4gQW5kIHRo
aXMgaXMgY29tbW9uIGJldHdlZW4gYXJtMzIvNjQgLCB0aHVzIGl0IGNhbiBiZSBtb3ZlZCB0byBj
b21tb24gZmlsZSBhcyB3ZWxsLg0KDQpPayBtYXliZSBteSB1bmRlcnN0YW5kaW5nIGlzIHdyb25n
LCBidXQgZnJvbSB0aGUgc3BlY2lmaWNhdGlvbnM6DQoNClhOLCBiaXRzIFsxOjBdDQoNCkV4ZWN1
dGUgTmV2ZXIuIEZvcg0K4oCiIFN0YWdlIDEgRUwyIHRyYW5zbGF0aW9uIHJlZ2ltZSBhbmQNCuKA
oiBTdGFnZSAyIEVMMSYwIHRyYW5zbGF0aW9uIHJlZ2ltZSB3aGVuIEZFQVRfWE5YIGlzIG5vdCBp
bXBsZW1lbnRlZA0KDQpYTlsxXSBkZXRlcm1pbmVzIHdoZXRoZXIgZXhlY3V0aW9uIG9mIHRoZSBp
bnN0cnVjdGlvbnMgZmV0Y2hlZCBmcm9tIHRoZSBNUFUgbWVtb3J5IHJlZ2lvbiBpcw0KcGVybWl0
dGVkLiBJbiB0aGlzIGNhc2UsIFhOWzBdIGlzIFJFUzANCg0KRm9yIHN0YWdlIDIgRUwxJjAgdHJh
bnNsYXRpb24gcmVnaW1lIHdoZW4gRkVBVF9YTlggaXMgaW1wbGVtZW50ZWQsIHRoZSBiZWhhdmlv
ciBvZiBYTlsxOjBdDQppcyBzYW1lIGFzIHRoYXQgZGVmaW5lZCBieSBWTVNBdjgtNjQgZm9yIEVM
MSYwIHN0YWdlIDIgdHJhbnNsYXRpb24gdGFibGUgWE5bMTowXSxiaXRzWzU0OjUzXQ0KZmllbGQg
aW4gQXJtdjgtQSBhcmNoaXRlY3R1cmUuDQowYjAwIEV4ZWN1dGlvbiBvZiBpbnN0cnVjdGlvbnMg
ZmV0Y2hlZCBmcm9tIHRoZSByZWdpb24gaXMgcGVybWl0dGVkLg0KMGIwMSBFeGVjdXRpb24gb2Yg
aW5zdHJ1Y3Rpb25zIGZldGNoZWQgZnJvbSB0aGUgcmVnaW9uIGlzIG5vdCBwZXJtaXR0ZWQuDQpU
aGUgcmVzZXQgYmVoYXZpb3Igb2YgdGhpcyBmaWVsZCBpczoNCuKAoiBPbiBhIFdhcm0gcmVzZXQs
IHRoaXMgZmllbGQgcmVzZXRzIHRvIGFuIGFyY2hpdGVjdHVyYWxseSBVTktOT1dOIHZhbHVlLg0K
DQpTbyBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgU3RhZ2UgMSBFTDIgcmVnaW1lIFhOPTEgbWVh
bnMgZXhlY3V0aW9uIG9mIGluc3RydWN0aW9ucyBmZXRjaGVkDQpmcm9tIHRoZSByZWdpb24gaXMg
bm90IHBlcm1pdHRlZCwgYW5kIHdoZW4gdGhhdCBiaXQgaXMgMSwgdGhlIFhOWzBdIGlzIFJFUzAN
Cg0KQ2hlZXJzLA0KTHVjYQ==


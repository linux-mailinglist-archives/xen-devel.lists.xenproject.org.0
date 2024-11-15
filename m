Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA79CDE1D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837444.1253375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvFB-0001cx-KD; Fri, 15 Nov 2024 12:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837444.1253375; Fri, 15 Nov 2024 12:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvFB-0001Zy-Gs; Fri, 15 Nov 2024 12:16:09 +0000
Received: by outflank-mailman (input) for mailman id 837444;
 Fri, 15 Nov 2024 12:16:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tBvFA-0001Z3-5b
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 12:16:08 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2608::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60c11e00-a34b-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 13:16:02 +0100 (CET)
Received: from AM0PR06CA0094.eurprd06.prod.outlook.com (2603:10a6:208:fa::35)
 by DU0PR08MB8140.eurprd08.prod.outlook.com (2603:10a6:10:3ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 12:15:58 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:208:fa:cafe::ec) by AM0PR06CA0094.outlook.office365.com
 (2603:10a6:208:fa::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 12:15:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Fri, 15 Nov 2024 12:15:58 +0000
Received: ("Tessian outbound a09d3701ea63:v490");
 Fri, 15 Nov 2024 12:15:58 +0000
Received: from L11bd8c8f55da.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA874405-D7EB-48E7-8C8C-2D317B93256A.1; 
 Fri, 15 Nov 2024 12:15:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L11bd8c8f55da.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 15 Nov 2024 12:15:51 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by GV2PR08MB9422.eurprd08.prod.outlook.com (2603:10a6:150:dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 12:15:49 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 12:15:49 +0000
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
X-Inumbo-ID: 60c11e00-a34b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwODo6NjJkIiwiaGVsbyI6IkVVUjAyLURCNS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjYwYzExZTAwLWEzNGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcyOTYyLjExODg5Niwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eCUc0At5TJaGd+CPC/4cueqqnL453K+y9HbljTKYP3qUMM19gd57k0MUr9fxTSR53vH0JXCc9kE9/B6iPvQVg3l9le0JljWwoyHO+bgnkpb22yjNt+cb9gvNDzQB7e60o/rh7hDKscSKho8RP1M0nfOMyN8qEcDdWpehJOzzCP/NBjhKBGX5QkHYAVX1wxCvSTVSeWfa4JCSXDQ41shfA37MA+4DV5q1euhsUiOOFCeOcrNvHnBqSlLb+plJTfSW/D6KCt3pYf0FUVvG4j4GNZLf5u7PSfNSicgLgPoQS1awUEsNBWjvTP4X8B080A7tlhbO/gPUBX6DoboryvTnNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtTnIVpOitl2YQjYKKBIUIuxO1v6rdHSIPzyPGhQK/s=;
 b=hHEqsw64HlWcCJP3bYucMWgqTNlvWkEJd1gBtp6EiEI4T6hPpx0/TDJYI+vgNJHrhsWY7Mv6ayhUWLhpoVBS60KRsjnnJQ8X1zR3Ap3HBiatVbtzckELt1FsSsLyuYxYjQdO9ysCkQJ8aWTi4nJJk1yvbPQ/rxv1jyxPEL1hg+wq3WwU0eYCVSufmIAmZ36j3mJ6u7KWiPz0DrCUM27695+ffLG75hhoqCcStwTn2ctdo4Bt/pUHZCoAeMZokXfI6JJt9hLJU0aiPU6NfVg01LtJ8vVCiKa41xw8mlGTNAKb/Ndw8TK4tyhPu3rxUI9tf6KaOU5CPYHMu6q9Pg6Viw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtTnIVpOitl2YQjYKKBIUIuxO1v6rdHSIPzyPGhQK/s=;
 b=NU4GQYtK0NZ2yDbPUvCI4IC2yCkAvmRXUmBESNLie14PQw3rqI9AAG0igEj4N3kPv1/gmo9P7ieAwDaPFwkpopvHnemeidoBdaXmNLGJfkJgWnQqEliu/86q5wecIGz32YzycIjKEWze4ywYxQTi7srWNGEhuQg7BL2iV2uS7TE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c9503eb04854ff72
X-TessianGatewayMetadata: tKRAvq0cCZtVdeEHqx9vvmfPUU0R1w5T6S+8ejBcm7EVl0yZld5vEc3vh7okPp+7WqZv8kHrkDxjqVfHSQ0rgbpKbYa33SgtZzjTSkUlz9HL5HzgkPO3zDTN3hHg3pZnCUcccQ1Q1kr4MCuqCoS9cE1rxJC1qCAWL0boTMNw3u0=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bhnzlff1UqzKgMQpo1GwhJkfYpC0pqg/uryxHgy3zZwjg4dEwvKcNu9bRmQWe9WNuJqzps1UsPj2lndJ8OZlEg4e9wS0f00056jmeVTscxsjjXM7JUZDJaz+m3IGZLZEpmcq7Ce/qZN9qzobwF8myonwNwfrNyWiQPDYvEbD3Csnr98u3TyxFLwQkY5YGFJdbMfEWGwPfMYnyy1CM+vGcGeKxRD1sl8KcpSNO42RI2AMyWE1VAvYdt8qQd5DBY3YLwlIjOo1ucstl2g9UnkBRkCrjtQo2a+MlbFkqWdy/vQBapOtsCvzl0cgerOhjUnG6zx7hXFq0RenWg7JhpUTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtTnIVpOitl2YQjYKKBIUIuxO1v6rdHSIPzyPGhQK/s=;
 b=sEknYNeMNSkSYQoZeL0pHtMlSc2kfL5W7pvU6BH8JBK7z/DYik0hlj72BrRigwT/t3+nTY7BZNkU93EQ//sEEALv/Cqqg/ebXqGoZeYoG3Cl25gjNs7EmoWwutfjHCyHNNZM/PNTfh/bymVQTDxrkBonEXLcELHYurUf5zziHKXarztQoeqZ9khYA54CED613bht+HqckniLUbBhJAOuXJRSVPTr8lp1rwESUvAonbUMnBfsizQOMaD9fP6wspH8p3OFiJ8LIzOxmVf+esCVTKsp6fTjtWtlwA7QGlPkCasLd6mQuf8lddVsYs362J1LIZMK7FpsXvfE1Um2RhO6JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtTnIVpOitl2YQjYKKBIUIuxO1v6rdHSIPzyPGhQK/s=;
 b=NU4GQYtK0NZ2yDbPUvCI4IC2yCkAvmRXUmBESNLie14PQw3rqI9AAG0igEj4N3kPv1/gmo9P7ieAwDaPFwkpopvHnemeidoBdaXmNLGJfkJgWnQqEliu/86q5wecIGz32YzycIjKEWze4ywYxQTi7srWNGEhuQg7BL2iV2uS7TE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Topic: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Index: AQHbN0xEMVIvN3HbzEuhbXugN/BCZLK4PUmAgAAELwA=
Date: Fri, 15 Nov 2024 12:15:49 +0000
Message-ID: <F693DC5E-C4E5-445C-AE3F-24EE76B34D90@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-2-luca.fancellu@arm.com>
 <2b13f12c-905d-478c-b525-a3a8c69d5ac7@citrix.com>
In-Reply-To: <2b13f12c-905d-478c-b525-a3a8c69d5ac7@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|GV2PR08MB9422:EE_|AMS0EPF0000019B:EE_|DU0PR08MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 780e4a29-a66d-43f1-ab9b-08dd056f433c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MEtNSDhzVGloZWxhR1UzKzA5aUE4WTJNQThSbWFxc2VEZzNmSGpnWFBWSDRL?=
 =?utf-8?B?aThRbFhxVEVBZk5tYXJXUER2cjZxYUR1Z1NyYnNUN09FSFFtSmNJQi9BSEpX?=
 =?utf-8?B?RithcVJlMEZyZjQ1Y1lUOGpuQkMvUTFhaTNZWVIvdXc0dUxMajU0dHlPME5z?=
 =?utf-8?B?b2xseHV0NEl1Z0g1Z2dxS1ozc3BiVXhUUEpxRWVMblIvaHpEWUV3dER1Ulpn?=
 =?utf-8?B?T0ZJcitHVVhNV3VPRjA0UnZrbXhCSlo1Wi9IcHJzeTNyYWo1MDJPaVlPMnI4?=
 =?utf-8?B?cFNHUUNpVEF2b2QrcDVjYmZOOGRrK1hsMzVENzlQMUpLTlZKMHFYMmpUbFph?=
 =?utf-8?B?THQ2bHJsRmlTeFRzTGd1U21aZURoVmdQUU51TmdMQVZmK0tqeFBiK1FjcWpI?=
 =?utf-8?B?eWkwU3ZrNFhjMStwaEI2UExQbkZxTXBEMGtVRXJKeGdqNnRObGJJcU1tM3Ft?=
 =?utf-8?B?RVBMdlBRejNZYTBpNXZLQmRiT1JTT3FCVTgrWmJaMnozN3FQVHI1TExia2lQ?=
 =?utf-8?B?SXF4UHVWU1pNck1hMXhqcTk0WE1tTHBzNHZqWnJyVStSSURSZHk4eGw2YWJH?=
 =?utf-8?B?akpCQzNVdUFERCs0MVRBdnZwY3ZHZGFWOXBFbUovdVBoSXA2MExzYnlOeUhL?=
 =?utf-8?B?WFAyTnRZZnJSaTVHRUM1b0N3NTdBblE5MGhEa1cwSExla3J2aVFWQjNncjlz?=
 =?utf-8?B?OWNBRGpQMmFwTmJvVlJqdk1kY0ZYOFBDZDM4TW50aHVEWjJDUXljOStVUEla?=
 =?utf-8?B?TzVpaWIzallzcnN1SjE1SWtyUlNHWXMwK2tCQTlpc2FodW96SjlCdjluakdC?=
 =?utf-8?B?Nnl3UVpDL0YzYVNjU0kvRXVyeUZLeG5xS05xak1sNU1VWlUvbVNFK1NMN0Rl?=
 =?utf-8?B?VFd4dWFvbEZkc3dvaHhCa3p5YzVLY2hoYXdFNk0zajN4M2FQM2tlNmhZd0F6?=
 =?utf-8?B?aitsTXhoOHF1YU5WZDg0bE5WN2kyQjhSQ0dKVXcxN2Jid3ViRE91VjFYQnlE?=
 =?utf-8?B?NkVkSWdOKzZNTWhtNm93ZERtMHEzdTRFN0pnV1kxYTBQTHVwYWZUbmQ1WTV3?=
 =?utf-8?B?RFpmTGRNaGN1bWlWY01WQ04rR2JmK1VJNjg0aXFVVXUyeEUvQmNIZC9QWXhX?=
 =?utf-8?B?V2gxQTg1YXFHaHlBTTdmTUI0QmVrQk1PaE9iRnRVVlFLTFBlT3FxMHhhOUtL?=
 =?utf-8?B?LzlSS2w0WGRHUnlMa0FaUXVxRWlUcjZYNkZ6RE9hTDlGUktxYkZqSm56c0Uv?=
 =?utf-8?B?cWZtNFpWN3c3b2hOS0hETzVkdjZRNzUzeFF5SVRJb2dBZVBtV0ZMNmdCUFBP?=
 =?utf-8?B?MXFKSWNzYWE3OTdUQTZjSHVMdE0wSmdVNDRIUmpkaFFwTmVOUjNFV21BUkt5?=
 =?utf-8?B?Vm5xUC9xQVMwVEpodEJvcFRRc3MyTExrVlk0dFQydXFBdjhYbzlHd0k5Y0Rm?=
 =?utf-8?B?WC9sQnFrM0dQRGp3T3BiTktUQVo1QWFvM2RRM0RWbHJabTlEMm9Xa1k5MEhU?=
 =?utf-8?B?TEZGYnhTaXNqY0FaNzk3RTZ5RW52ZUxlMGlKM1hQejNxcXVNRzVJckRmeFkz?=
 =?utf-8?B?MCszV2w0QitVcSsxdnBRTHRmZ1g1R3dpRXFGTUxwbFFOcDk1WUxFK0wzUmdp?=
 =?utf-8?B?TjFRa0VrZVVBdStWWjBhL3MzWUkxOXVPbWpmNHBMRDlOKzhncWRLeVdFK1U4?=
 =?utf-8?B?WDA4aVZ0WVE5WVpkeGVSMTFvVlY0bDNUbTAzOEkvWGViWFdJZFVyVjhlSisv?=
 =?utf-8?B?M0w2QzBYM3RzRHhFTVZmbjR6Ylp5RWVPMERYWlFvVjZydUV5amdLVzd6VCtH?=
 =?utf-8?Q?86HRk4PDKWkivrlNPfthyJGlrEvH2H281SCBs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FFBDF97D400C845A6EB20CB839A6445@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9422
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47620101-cde4-4ea6-52aa-08dd056f3db6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEU4czUvbjZxS3hjdkpBY2wraWdWSk44OFRDQTY1VEZOZHV6b1BuNGFSZFdE?=
 =?utf-8?B?WjlYY3AyMU9jVXhFMUJXa0JTcnQzeU5YSGJJM3FNaHR1UnBKdTQ5SXpseHYx?=
 =?utf-8?B?MnRpMGxyTG1pYXkwM01KUktTYkFkajlQMmkwWU82UXN5K2U2cnp6S21qRmNj?=
 =?utf-8?B?bnpBbEZHQkhrQkJ5R1BiOG8zR1Z4VHM2QWltaE1QQkhXaW1jU014QUJ1ZmJX?=
 =?utf-8?B?VWJzb3RGdlNzMGRSdDBMU1c0SkFlQUsxYVFYQVVDcE50K0Yxd0cxMWV4czEr?=
 =?utf-8?B?TVJKbTBxSkgxYnJqWHhwVEtRbmlCNTZ1ZTh0c0JwOFRidTcyRUJaY3pmaUFP?=
 =?utf-8?B?ZGp2K3lrVzBTbHVUSnpaSER3T0tkM1JyOW9UV3RMYkw2UjQzb2xxUTBrMmtI?=
 =?utf-8?B?b0dpOFhiZjB0Z3RnU3dmcThyVDZOTnptUHhadUR4ZlNrQkswYy9Pc2FVK05Y?=
 =?utf-8?B?Y0xYb3ZGaWFGN0xVbmlwQW9QUFZzVHVHU3RFdVF6N2s0cXRLa29HanY1dUJv?=
 =?utf-8?B?a0dpeE15Si9iU1R6QUh4Tm12emVwWHl1RU9La2VOWU5EN2hBRERkYS96empB?=
 =?utf-8?B?NE5BYVAwYkh5bG1wSWhDWTdEd2diOXZTY3VGb29VN3pFU0hJYVhJUHRHUlFa?=
 =?utf-8?B?V3VBZG9uTjcrbzBwK1BSWnJIN0NtYXZRc2I3VTJBSWFmbFdUSzFwSk1VRmdM?=
 =?utf-8?B?Y0QwNlV4bjg1NzRKdE50MjdlaDZRK2labWZxaFVlS20zb1RuOXZrZ3JNK0kx?=
 =?utf-8?B?UDMxQlJ3dnE5dUpVQzdqS04xdVlDSFgrWWxGOTJ2dDlpdURZb2NneHc2VE1Z?=
 =?utf-8?B?NURDdy8xSjdIeWFqU1lTV1kwd2orRFRhUzQxbUNLUXdoZ254ZHRadDNqNWlG?=
 =?utf-8?B?dTNMVjVMdStOYzRtRldqSW5DTTcvTFpHRzg5SjNLZ2UzQS9Sam0xbnBOZmtH?=
 =?utf-8?B?K1NXVHdoTXRVNjBROFR2K3FmelBKQzc5QnJPWTlydXAvSzVWM2FHVmdlcFZU?=
 =?utf-8?B?cDFORmhWb1ZuSFp6YlE1bytnQVlUWTRpeW5teTFvWVoxbkcwV1FhR2lmMU9L?=
 =?utf-8?B?NUdmVXBOMk4wL0FVZDJVYzdrTTNyODlPZEovbC84OUtuOEtEK2s4ZE9wRlVk?=
 =?utf-8?B?WE1yLzg1TElXNkQ2OGpSaEpPVkRPOExBaDBseE5FcjNWY0svWHpZeVpjVVVM?=
 =?utf-8?B?bVFRcHhXbWhwUmZJL3dSUHlWa3loZS9kT2JheHVTdlBLSXNZM1ZFQldOek9p?=
 =?utf-8?B?M3JWR2xhZG8wQ3BSaGx6ZkwxR1ZQeVRleWJHZ2MybFlaeE5ONGVQcUs2QmdB?=
 =?utf-8?B?RnRnamRZN2hjWnBja3E3YVA4czJsYmpqOU85V2lEQkZVZ0Zkak1iZW1SVXpu?=
 =?utf-8?B?R1NoR0RId0x1WC8zYkpDUndtbHo0S214cUpFSUIvOWtJZzVGcjBqd2hzZGNt?=
 =?utf-8?B?Vi85VTBteWdxWVJUUkEyZUhJelhMRUQyQ05SSzdibU9IMmxoc21oU1lEVjlr?=
 =?utf-8?B?bG5TaHZ4bXJnMlZhMzBkWDdaQkE0UVhpTWZybWhCcUJlcUNaVHhRaEpvVVJs?=
 =?utf-8?B?ZndteEFPR3lYRkppMEJhUU5tM01OZkJpRG05YmVCdURWSUd6NThvcHRKRG1V?=
 =?utf-8?B?bFhTdEFoeDJpZ3VuVERtbHNRdzlaOGU2MXV2MHRCM1hKM1lER1ZKNTZrYVFp?=
 =?utf-8?B?YjVYdlluam5mWS9KWk41cTFTWEhVdjZoMkJVR0QxYTRaOWhwRXo5bENzdnR6?=
 =?utf-8?B?WGVWKzlsYk1Cc28zVWpjaFlma2pnY25ZNDlEcHYyaVRKME05M3BrVGRGbHpQ?=
 =?utf-8?B?Y3lJUERkMllJazZ1eDA2T0IraTZnbktGMzNQZFg4RCtaeWtwM29mVm9CK1Ew?=
 =?utf-8?B?NG9NdDhWd3ZpSW94SjVwTWNmSUhZaUswaTdaaEx6ZFN3bGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 12:15:58.3568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780e4a29-a66d-43f1-ab9b-08dd056f433c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8140

DQoNCj4gT24gMTUgTm92IDIwMjQsIGF0IDEyOjAwLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDE1LzExLzIwMjQgMTA6NTAgYW0sIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3h2bWFs
bG9jLmggYi94ZW4vaW5jbHVkZS94ZW4veHZtYWxsb2MuaA0KPj4gaW5kZXggNDQwZDg1YTI4NGJi
Li44MDJiZTY2ODcwODUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4veHZtYWxsb2Mu
aA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3h2bWFsbG9jLmgNCj4+IEBAIC00MCwyMCArNDAs
NDYgQEANCj4+ICAgICAoKHR5cGVvZihwdHIpKV94dnJlYWxsb2MocHRyLCBvZmZzZXRvZih0eXBl
b2YoKihwdHIpKSwgZmllbGRbbnJdKSwgXA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX2FsaWdub2ZfXyh0eXBlb2YoKihwdHIpKSkpKQ0KPj4gDQo+PiArI2lmIGRlZmluZWQoQ09O
RklHX0hBU19WTUFQKQ0KPj4gKw0KPj4gLyogRnJlZSBhbnkgb2YgdGhlIGFib3ZlLiAqLw0KPj4g
dm9pZCB4dmZyZWUodm9pZCAqdmEpOw0KPj4gDQo+PiArLyogVW5kZXJseWluZyBmdW5jdGlvbnMg
Ki8NCj4+ICt2b2lkICpfeHZtYWxsb2Moc2l6ZV90IHNpemUsIHVuc2lnbmVkIGludCBhbGlnbik7
DQo+PiArdm9pZCAqX3h2emFsbG9jKHNpemVfdCBzaXplLCB1bnNpZ25lZCBpbnQgYWxpZ24pOw0K
Pj4gK3ZvaWQgKl94dnJlYWxsb2Modm9pZCAqdmEsIHNpemVfdCBzaXplLCB1bnNpZ25lZCBpbnQg
YWxpZ24pOw0KPj4gKw0KPj4gKyNlbHNlDQo+PiArDQo+PiArc3RhdGljIGlubGluZSB2b2lkIHh2
ZnJlZSh2b2lkICp2YSkNCj4+ICt7DQo+PiArICAgIHhmcmVlKHZhKTsNCj4+ICt9DQo+PiArDQo+
PiArdm9pZCAqX3h2bWFsbG9jKHNpemVfdCBzaXplLCB1bnNpZ25lZCBpbnQgYWxpZ24pDQo+PiAr
ew0KPj4gKyAgICByZXR1cm4gX3htYWxsb2Moc2l6ZSwgYWxpZ24pOw0KPj4gK30NCj4+ICsNCj4+
ICt2b2lkICpfeHZ6YWxsb2Moc2l6ZV90IHNpemUsIHVuc2lnbmVkIGludCBhbGlnbikNCj4+ICt7
DQo+PiArICAgIHJldHVybiBfeHphbGxvYyhzaXplLCBhbGlnbik7DQo+PiArfQ0KPj4gKw0KPj4g
K3ZvaWQgKl94dnJlYWxsb2Modm9pZCAqdmEsIHNpemVfdCBzaXplLCB1bnNpZ25lZCBpbnQgYWxp
Z24pDQo+PiArew0KPj4gKyAgICByZXR1cm4gX3hyZWFsbG9jKHZhLCBzaXplLCBhbGlnbik7DQo+
PiArfQ0KPj4gKw0KPj4gKyNlbmRpZg0KPiANCj4gRG9lcyB0aGlzIHJlYWxseSBjb21waWxlIHdp
dGggdGhlIHdyYXBwZXJzIG5vdCBiZWluZyBzdGF0aWMgaW5saW5lID8NCj4gDQo+IFRoYXQgYXNp
ZGUsIGNvdWxkIHdlIG5vdCBkbyB0aGlzIHVzaW5nIGNvbmRpdGlvbmFsIGFsaWFzZXMsIHJhdGhl
ciB0aGFuDQo+IHdyYXBwaW5nIHRoZSBmdW5jdGlvbnM/ICBJdCB3b3VsZCBjZXJ0YWlubHkgYmUg
c2hvcnRlciwgY29kZSB3aXNlLg0KDQpEbyB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZSBiZWxvdz8N
Cg0KI2RlZmluZSB4dmZyZWUgeGZyZWUNCiNkZWZpbmUgX3h2bWFsbG9jIF94bWFsbG9jDQpb4oCm
XQ0KDQo+IA0KPiB+QW5kcmV3DQoNCg==


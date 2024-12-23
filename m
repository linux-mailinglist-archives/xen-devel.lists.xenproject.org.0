Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171F9FAD52
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 11:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862857.1274390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPg36-0003i0-F3; Mon, 23 Dec 2024 10:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862857.1274390; Mon, 23 Dec 2024 10:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPg36-0003f1-CD; Mon, 23 Dec 2024 10:52:32 +0000
Received: by outflank-mailman (input) for mailman id 862857;
 Mon, 23 Dec 2024 10:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMGa=TQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tPg34-0003dw-QL
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 10:52:31 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2607::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00c5e54d-c11c-11ef-a0da-8be0dac302b0;
 Mon, 23 Dec 2024 11:52:29 +0100 (CET)
Received: from DB8PR03CA0029.eurprd03.prod.outlook.com (2603:10a6:10:be::42)
 by AM9PR08MB6707.eurprd08.prod.outlook.com (2603:10a6:20b:305::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Mon, 23 Dec
 2024 10:52:21 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::48) by DB8PR03CA0029.outlook.office365.com
 (2603:10a6:10:be::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.20 via Frontend Transport; Mon,
 23 Dec 2024 10:52:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.12
 via Frontend Transport; Mon, 23 Dec 2024 10:52:20 +0000
Received: ("Tessian outbound 050b604d5e06:v528");
 Mon, 23 Dec 2024 10:52:19 +0000
Received: from L5dc2c63ca0af.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 210B986F-BAE1-47A0-A620-900E7CEC2479.1; 
 Mon, 23 Dec 2024 10:52:12 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5dc2c63ca0af.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Dec 2024 10:52:12 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by VE1PR08MB5662.eurprd08.prod.outlook.com (2603:10a6:800:1a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 10:52:04 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 10:52:04 +0000
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
X-Inumbo-ID: 00c5e54d-c11c-11ef-a0da-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vjS1o7mfTY+dHnvAT42PgLlPVutZ9t2p6tVDjJMaEqJ0QOfBZtNANU3zp230DrOlwofAogyu2yfDGGRm5IX5hXk3igL/H3n+xYAlOY43YpMeDpGnrwTae1PgEUV8oATzaQ2qVC8rFxuHq9x6QVNGwnHNeyHvkO+PwMRsNeKkoynxNZIo61AnZwZyZatZWmtLjFfLRWWQf4dSBsJCIIe8lVEXI+/2PzlLBtxMTupBQJDRuM9hVSfyqJk4kaIxr4BvdLa1L71rG8TX57RX7P4IFA4xGUtgnPVAcqWYeJr+z1PRsNU0Em4d9zbkN0yTbBuEt9vOJ6Zf8nf2gHjX3DeDdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0hNmcfkxhNf9uJvhPoMncXyvLT95JISaNVPdYxZKWs=;
 b=Kr8+cAGP85jT5EEWNh6S2kaqy2tVyNoIZghvtRGzAvcFbAsRWqVgDeW5QBr3KeCom5FZstI8yygUWEyrpPFT42wGwCBbvY2kD9W2lpzh9sbOeXxsv9c2tKg103w9xRiuIQSicvHEJIINU1Gi9NWAexDZJgj9viEyn9Wkymp58BOr4YOUxUu5F7dDdq/iQYqUoGUSQXUBo1SmG0xO3MwhJdlZd9E/xqcQ1e5qwgUqZjQ3iUW9xbf1o0qkUUEBou/2ZumPVfvh/TJLS7yjXaCPoeUDDiqYE7W853VsLVVj+5TdVm7qssrRX6gwaHYCOkdJBWj6QH5INJlxygOxA8L0fg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0hNmcfkxhNf9uJvhPoMncXyvLT95JISaNVPdYxZKWs=;
 b=UeKlOuLPg2Jp8S1oY5ksJ9SIFuZ4/mLX6T77TAo0E6DANopdPmoaLRJOUpDO7B7luBNvWt5D5XPp6ydpZ3TcxOfWsZqCKBoEgvm3ULP1qrYVlf/q0Ggo2xFip7iNwOaNHv5LiBv0k7p1eynicbfBPzFDfd+oBBMTnrQXXteHHDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 710cbda58e1e9799
X-TessianGatewayMetadata: U2KjCPr6ayngDjWOWg9+x9sqzkQMHfwApNVKJkcqrQKqG4vKE+KMZcuHs9RmQ+OcfgmHywSwGlAq+8jvyTI5yNudIYZtQNUCw8j/+89S9GEvlgTcawZg2b7zrR28r5oZvuczJKrjSse1xZ9bFreVyxTPL5aDMFfEiUUNw4ntFMw=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROWD37ZqyGjWEeu7uvCP2qZUHgw7AM1GokUo8xhD1Bk1AJFIVgp91dfX8c9K0vRPD3T0y0u5LyNzsShKxM71q/ZVzY7gZFp08EvhaZ9i4DSRasELOScOOAJkcGZzR3CfAGEqTEOQpPTiOCnrG5i5gwThmRuqc2xFljZs9YymeBEqVX2ucO1fzko2X36Nu//w6YUe+Z27u7GEwTvMPPlbTk4icQja8Rix/LGrlggNGa+ptCEEwsi8WOycHpuz4yi0HAuhgsxo1+dAms8vcBBl8kppphHTdJwVQZ1jmEkPy32JMzbRk3LGrV5VazFNrSLcY+9g9zlmRAozwF9MO1xEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0hNmcfkxhNf9uJvhPoMncXyvLT95JISaNVPdYxZKWs=;
 b=EtP6KsFuEvtkI1puWiQcJLqwX06uK8GHqNe0Ah04Ln9KdilfCdMbSbsmNrF/b0gGJJCYBDlAiQlngYbBQbqBLes/2GC8eRDKbg3Bez+BAF8xQOBK64AxvQi9k9uOZb65CgoK7/gc3F0fN76aGMGu8JLla4aq9k2883wT+PeUzwbzaAivVhzEFFCKMHn/vCXL0ImBqfDYVvCEQ9rSo0lkomDq5TdT7elMud92JcSP8KO0u4kAwahytBblc0Wr+iln/lGIgCZ/VRXeOkOj+7C8iAVvG1AerPdl/SkZudIJySBelUB9FRYDs/V5OFwir3r3gN2ZvKTl1s5TLcWvkp+Dyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0hNmcfkxhNf9uJvhPoMncXyvLT95JISaNVPdYxZKWs=;
 b=UeKlOuLPg2Jp8S1oY5ksJ9SIFuZ4/mLX6T77TAo0E6DANopdPmoaLRJOUpDO7B7luBNvWt5D5XPp6ydpZ3TcxOfWsZqCKBoEgvm3ULP1qrYVlf/q0Ggo2xFip7iNwOaNHv5LiBv0k7p1eynicbfBPzFDfd+oBBMTnrQXXteHHDg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Initialise memory type for struct kernel_info
Thread-Topic: [PATCH] xen/arm: Initialise memory type for struct kernel_info
Thread-Index: AQHbUvKnqvQwslwrpk6TiacMD2XmQ7LzewMAgAAj2ICAAAoCAIAAANWAgAABwIA=
Date: Mon, 23 Dec 2024 10:52:04 +0000
Message-ID: <3188C56B-6BF1-4488-9036-33014B469A01@arm.com>
References: <20241220151941.4192864-1-luca.fancellu@arm.com>
 <2a7ac358-7f43-4e32-9e1e-9ce1cd45304a@amd.com>
 <c39709e1-bbdb-4995-b507-212eec7c84e6@xen.org>
 <a9df74ea-38ef-4f20-be26-1c519bb9c269@amd.com>
 <7b7d4606-86fe-45c1-9aa0-48ddfacabafb@xen.org>
In-Reply-To: <7b7d4606-86fe-45c1-9aa0-48ddfacabafb@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|VE1PR08MB5662:EE_|DU6PEPF0000B61D:EE_|AM9PR08MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 6788680b-cbb2-404f-56f3-08dd233fdfc3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Vmg3NFVZZkU5RlptNzB1ZTN2QmIrdmJjTjFHN0FNYTRoUnlrNUExVVZlVmE4?=
 =?utf-8?B?T0RtL002U050NmttbEhqOE1TMjJUZ3hwamVjZEhQcG5HM1lpK1pwb3BmUmJv?=
 =?utf-8?B?aHUzYVRvTWFFQ0Mva1U5RjZDSlJabmI0ZlJua05tbm5oTXhFMGVCQUVwNGNm?=
 =?utf-8?B?VkxzNnlHZGJPaXI3SFJ2MFFEeDBJR1VaM3RscjVpcXVjSHB3TWphWTg3YjNp?=
 =?utf-8?B?Tm1zN0puVldLQ3JXTW5ZOTBvR1NJeWVya2lpcWtYU2Q1a1hINkY5SDJKV2t1?=
 =?utf-8?B?MFI1RGNzdU83a0dxY3hxWjhxN2p2cTY3Y1AxdVZxVVhnbUZEbEJwQUFydEN5?=
 =?utf-8?B?dC9rb1FLZkdOUEJWcG5tUlVINmFXYi9STDRpUGcxZis5SFliR3MvTFZtbktJ?=
 =?utf-8?B?dTVTWktSY3A3bUdUZjZRcmJoT0lwUS9ScDh5TzFxZi9uS1BOMFFDZ05xMERn?=
 =?utf-8?B?S2xCa0tDYlprbnFUZy85N0VWdDNFNXJOaTdvTnE3T3FObzdUamtYMlpIYVBH?=
 =?utf-8?B?cFBod0xEZEczS3FNRG9HRURoQllreDNLS0hTcURDYkdmOEUzV0RxZXJQMGNj?=
 =?utf-8?B?a0V3K1RJSFp0Zk1kNmhra2hHUStJQ2p4ZzNLTXpDUEgyZTBTbUJjbXVHUXFF?=
 =?utf-8?B?ZTA4OVd4KzJIOThPMTh4RjMxQTBacVcvTkR1TllEcHh0TmtlN2lzdzNYWkYz?=
 =?utf-8?B?YU11aUd1dzhyZ0FZdjY3RUpDY1lMR1RzU0NKSURJanBJc3BYRzdHMEFET1VD?=
 =?utf-8?B?T0xVSmhEMEt0cjdwYklNa0FzU3Y0TXM3ampTM01IU2hFVkMwa1dvdDY5d3Rh?=
 =?utf-8?B?ME13bGliRVYybmlORm1MaDFud2pzcHBzS0hBdGhYN25uUU9FTFN6UHpnU240?=
 =?utf-8?B?dVNhWE9wYWp4R3M0OEhDdGlPZW5lbGNvUG95eWNYNkRrK2ZYNEU4cDlzRlpk?=
 =?utf-8?B?dVliMTZIVGxrdWRySWdQMDBYeEdRbmhvVjYyV01aTWFjQnJvSFFKMXlPM0l0?=
 =?utf-8?B?MTFQYnpwNFpaWXFMNXZFOEJqT3p5RFhLUEVzMlZ2VlpSaHBqNndZMUt0RFdw?=
 =?utf-8?B?dDk5WHFaampheml3ZVNFY0dleHd3YW9KaXZKVUYyR1NXbjBhdzNlOThyS2JH?=
 =?utf-8?B?a3BZVHNkcnNGSFRDVFBGRFo2TlJiSEJVMFVLZVdZRVhjZU9jYUFUMCswbXdl?=
 =?utf-8?B?U3FoUUVnNTMzWWpSMnFqWHNSSzhSdGROWUVUTzE1eThQUENnUVZKSXlId1NB?=
 =?utf-8?B?ZFBNWHZEVUdNOCtvUy9FeU05NU0vNXI0UTczTjIxTTVRL0RGaFRXR0tpQXc2?=
 =?utf-8?B?NlRWSVVNUXhVVW8yMk5MckN6eDIvS1BIeXR2eHE3UDNWTzAzalZ2U0t0d01Q?=
 =?utf-8?B?b1ZOakZLRUpMdWp5TXpQcU15MlFvdGs4clBlV1o3ZFdUQ3FWeVBTQVhMQUZY?=
 =?utf-8?B?K2pUbDA4OFRCQWZMNFV5WHlDOUNPakdQL3ovNlAvZkRNU3NScDZ5M0J2SWNC?=
 =?utf-8?B?RGJtSk1lWE0xbkU2RXBabzZHamNpZ1FTdlZqd2tWYzBkeGVyMnlYZ3doTHB3?=
 =?utf-8?B?TzVCKzB3U2ZkN0RHUVNCaU9PZE9vRGlOalZseEh6V3NYMytZTUkrcFd2Unpv?=
 =?utf-8?B?OGt5dy9VVEp1WnQ2amdadk5zMnVRYUpOZFNaZkZRUmM2VGd4YTQxdXhKNzRt?=
 =?utf-8?B?MDd2a2dqZ0hHR3FyNHBISkxDaGMrM0dvakxNY0FxUkJNOTJUOGZFbituaVlW?=
 =?utf-8?B?R1FBemIrVGROSS9NejhBVXBoMjV1MDBFL2F5bmZYWDNiOE5PMXpyUTBFV0Jo?=
 =?utf-8?B?T2VUWEFBNENxc1RWMG95OW0vWmgzV2dOQTVQdVNqUXdTNVBiUDRhUDZZbUJD?=
 =?utf-8?B?aGluT0p1UzhQSWZrVmxXcXY2OW9tTVM0V0hYSkE0NHhPQnh6eEY2ajNXOUlp?=
 =?utf-8?Q?gnKKw2lVegfxDStje6jc0x8rZaXV9zpX?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFB9D78D74752C4F87965720ED9B0059@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5662
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd9f2f6a-fec3-4057-746e-08dd233fd654
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVBQTDBPTE51eTNXdXVUcHNrNHp2U2FZV2VENTh2Rld0WDJpSm1USnkzdTZm?=
 =?utf-8?B?R0tKNlZ4b0ZGLzZ0L3lqSGpzYTdvRVc3bTQ3MW5BQk9oMW8zRTVkaFFpQzFF?=
 =?utf-8?B?U0NwKzhEVFF2Ky9saE52YW4wU1dEcmVjbHN4emEvdHdienZtU0owUytEN2Q1?=
 =?utf-8?B?ei9RL2dOV0xPVXVSVXh3Q1BSQ3BNKzh4NE50VDNueERDb3p0NE8ra0JPTmpC?=
 =?utf-8?B?amR4NFc3VnhsdkVCQVF6Q1ZHSFVnQ3lNNDZNM0JwZzkvOGJFM0xxWjNFT2dY?=
 =?utf-8?B?MjIxMHpzUXY0STZLSEx4M1Vha2RHaTZtbldMUHh4clB1Y2ltQnQyRitMcnZR?=
 =?utf-8?B?VUYvSC91WjZOMXp6cEwydVd1dUdneVV6ODlGOHZSTGhzRXBhQ2hJQndEM1Bm?=
 =?utf-8?B?NE5xaThBZ2czQ1F2b1pmeWtvemxIREdtSStKZ1l1Q3A3aVZsRE5UY2pMSER0?=
 =?utf-8?B?eU1TVnhsTEJ5Mm9HWlcwYzVGSzA2WG9DajdjS3pOMVF4NHlKRDBlNWZDTU13?=
 =?utf-8?B?a0VLTisyOENYTDFQZmJDdEh5eU9wTkJXUWdMaDJSaUxESHhsMThOQVc3MytG?=
 =?utf-8?B?ZlFEcWNxSGxnbWVHOE9Uc2NZVU42UE1uK0R2eU9pWE9ZaGpkWkdteG01Q0hR?=
 =?utf-8?B?Z09HUkhTa1VCZnBaVC9QY0tjTmZzMEo3R2NZVkU5azg3RE5FbjEya2c4dG9W?=
 =?utf-8?B?TlVON2lUMmE4WTR6Rmlrdm1pRUZkL2JNSFkyTkZpREpqZlV4eERKVzJpUjNK?=
 =?utf-8?B?V1ZmMXRjcVJaUUM2UW14Z0o3clJjT1FSdVhiTE9oZHM0V3JMQU8rTjVHVGJI?=
 =?utf-8?B?YVZOSzk1M0VRSEJoTnQxNUVaSXdYNElWRkhGaVBuQ3NFNExUNVVDNUtobThD?=
 =?utf-8?B?V2Exem05ajcyQmd6ZHh3RXRYeVVJZ0ZORmNiSDh5ay8xeEVEaGw0VFBadXNW?=
 =?utf-8?B?YUJ1OGZ1TllmQy9JanVadXBaZEh2SUFPa2F6MGpRNHR1b2dOQ3JlMGRKNG5L?=
 =?utf-8?B?QmU0RWZ2cWh1dTA4U2hCdGQ4bm00aWdSUGVRMGF3T2xXbGxkTEFZdUg4c0dN?=
 =?utf-8?B?YUxMRDJMWVVEQ28yVWlMd2NrckFtTG5UbHFMZlYwWVEyanowSUlDQzlSMzdm?=
 =?utf-8?B?OElFMk80dkNhQVFsSVNjRjJEejRpM0d1T21BK1IvMTlkWGZtczYrV0RkS0RL?=
 =?utf-8?B?Tmx3VC9LWEppdTkxSW0vTHp2QzJmbFJSUkFJd2VjUDErbDR2MjNMU1NUUkt1?=
 =?utf-8?B?UDc5K3dkbXFFVHZkZkk4Z3hSc25TdFQ1ZFZjTitOQ1NTYjN6b2E1ZS9yM29r?=
 =?utf-8?B?WmFBY200RDczYWd5Tm84QlM0VnloR0NhblZuMUdKSFJVMGtEU2s0NkxHclI2?=
 =?utf-8?B?QTVlbjJxVXFyWUlPYjdZTWpUejZxTnYwa1ptWFZNcTFWdXZ6akRaREZRYnMw?=
 =?utf-8?B?bU5CUGFScittL21mT0RIc3FKUmpaSlNyR1VNQTVITWJIaWNadTVJSkkvbHNC?=
 =?utf-8?B?SFBhYktQZ21ZRzB5TmMrMVY1MFVYaUJJTlJQNGs0YzlYVXdwTDBtZXVlQzZV?=
 =?utf-8?B?L2EreHFLdDRKOWdCb3phamN5Y01uUmZZS2J0YzNLSWRtbHdTNENBYWZMVmVl?=
 =?utf-8?B?ZVJYWHpTZUxQR0YraGptdzJUcGdUKzdmMWhrSzE0N0pKbk9lakgrTTVTY3dp?=
 =?utf-8?B?SFR1MEExdDFEbFpRUkVSWUt5R2hhSW9VanZnRnpSdU5BZ0NhaVZsM29RTkFW?=
 =?utf-8?B?UUI5eUNQWVpxVU5yWjVsWHBVYUswMjJIREk2OGtMa2xsemdrZkh6OVJ5WE1B?=
 =?utf-8?B?Y3UzbFdOVG5POSt0aitlcUJlYmM5azllTlB6end1c3dTWGhoRkV6cElFd2Rl?=
 =?utf-8?B?OEdGcmdXYklpYkVyOW96T08vc0pZYVY1VUtrcTR2TXY2VkpFM0VYZHhVZ09m?=
 =?utf-8?B?cUxRdlA5ZUVLd0tEQ1ljU3BQUE94V3VsQkNQZ0Jqcm9KRXVDdEgxdEZTZ3Ja?=
 =?utf-8?Q?Bn3Jov5nfPwnqBpiAiWI0riNfdkDng=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 10:52:20.0511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6788680b-cbb2-404f-56f3-08dd233fdfc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6707

SGkgSnVsaWVuIGFuZCBNaWNoYWwsDQoNCj4gT24gMjMgRGVjIDIwMjQsIGF0IDEwOjQ1LCBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMjMv
MTIvMjAyNCAxMDo0MiwgTWljaGFsIE9yemVsIHdyb3RlOg0KPj4gT24gMjMvMTIvMjAyNCAxMTow
NiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IEhpIE1pY2hhbCwNCj4+PiAN
Cj4+PiBPbiAyMy8xMi8yMDI0IDA3OjU4LCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+Pj4+IA0KPj4+
PiANCj4+Pj4gT24gMjAvMTIvMjAyNCAxNjoxOSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+
IA0KPj4+Pj4gDQo+Pj4+PiBDb21taXQgYTE0NTkzZTM5OTVhICgieGVuL2RldmljZS10cmVlOiBB
bGxvdyByZWdpb24gb3ZlcmxhcHBpbmcgd2l0aA0KPj4+Pj4gL21lbXJlc2VydmUvIHJhbmdlcyIp
IGludHJvZHVjZWQgYSB0eXBlIGluIHRoZSAnc3RydWN0IG1lbWJhbmtzX2hkcicNCj4+Pj4+IGJ1
dCBmb3Jnb3QgdG8gdXBkYXRlIHRoZSAnc3RydWN0IGtlcm5lbF9pbmZvJyBpbml0aWFsaXNlciwg
d2hpbGUNCj4+Pj4+IGl0IGRvZXNuJ3QgbGVhZCB0byBmYWlsdXJlcyBiZWNhdXNlIHRoZSBmaWVs
ZCBpcyBub3QgY3VycmVudGx5DQo+Pj4+PiB1c2VkIHdoaWxlIG1hbmFnaW5nIGtlcm5lbF9pbmZv
IHN0cnVjdHVyZXMsIGl0J3MgZ29vZCB0byBoYXZlIGl0DQo+Pj4+PiBmb3IgY29tcGxldGVuZXNz
Lg0KPj4+PiBUaGUgbGFzdCBwYXJ0ICJnb29kIHRvIGhhdmUgaXQiIGRvZXMgbm90IHNvdW5kIGxp
a2Ugd2UgbmVlZCBhIEZpeGVzIHRhZy4NCj4+PiANCj4+PiBSZWFkaW5nIHRoZSBkaXNjdXNzaW9u
LCBpdCBzb3VuZHMgbGlrZSAiLnR5cGUiIGlzIG5vdCBhbHdheXMgc2V0IGFuZA0KPj4+IHRoaXMg
aXMgbm90IHByb3Blcmx5IGRvY3VtZW50ZWQuIFRoaXMgbWVhbnMgdGhhdCBpbiB0aGUgZnV0dXJl
IHdlIG1heQ0KPj4+IHdyaXRlIGEgcGF0Y2ggdGhhdCByZXF1aXJlcyB0byB1c2UgIi50eXBlIiBh
bmQgbmVlZHMgYmFja3BvcnRlZC4NCj4+PiANCj4+PiBCdXQgdGhpcyB3b3VsZCBkZXBlbmQgb24g
dGhpcyBwYXRjaCB3aGljaCB3YXMgbm90IHRhZ2dlZCBhcHByb3ByaWF0ZWx5Lg0KPj4+IFRoZXJl
Zm9yZSwgSSB3b3VsZCBhcmd1ZSBpdCBuZWVkcyBhIGZpeGVzIHRhZyAoZXZlbiB0aG91Z2ggdGhp
cyBpcyBhDQo+Pj4gbGF0ZW50IGJ1Zykgb3IgYXQgbGVhc3QgYSBiYWNrcG9ydCByZXF1ZXN0Lg0K
Pj4gU2V0dGluZyBleHBsaWNpdGx5IGEgdHlwZSBmb3Igc3RydWN0dXJlcyBub3QgcmVxdWlyaW5n
IGl0LCBkb2VzIG5vdCBzZWVtIGJlbmVmaWNpYWwgZm9yIG1lLg0KPiANCj4gSSBoYXZlIHRvIGRp
c2FncmVlLiBJZiB3ZSBzZXQgdHlwZSBldmVyeXdoZXJlLCB0aGVuIHRoZSBkZXZlbG9wZXIgZG9l
c24ndCBuZWVkIHRvIHRoaW5rIHdoZXRoZXIgIi50eXBlIiBpcyBnYXJiYWdnZSBvciBub3QuDQoN
ClNvLCBteSB0aG91Z2h0IHdhcyB0byBhdCBsZWFzdCBpbml0aWFsaXNlIGl0IG9uIHRoZSBzdHJ1
Y3R1cmVzIHRoYXQgZ29lcyBhcm91bmQgaW4gdGhlIGNvZGViYXNlLA0KZ250dGFiIGluIGZpbmRf
aG9zdF9leHRlbmRlZF9yZWdpb25zIGFuZCBzaG1faGVhcF9iYW5rcyBpbiBzdGF0aWMtc2htZW0u
YyB1c2FnZSBhcmUgbGVzcw0Kc3ByZWFkZWQuDQoNCkhvd2V2ZXIgSSBoYXZlIG5vIG9iamVjdGlv
biB0byBhbHdheXMgaW5pdGlhbGlzZSB0aGVtIGFsbCwgc28gdGhhdCBhbnlvbmUgc2VuZGluZyBw
YXRjaGVzIHRoYXQNCnVzZSB0aGVtLCBkb27igJl0IG5lZWQgdG8gdGhpbmsgaWYgdGhlIGZpZWxk
IGlzIGluaXRpYWxpc2VkIG9yIG5vdC4NCg0KSeKAmW0gY3VycmVudGx5IG9uIGxlYXZlLCBpcyBp
dCBvayB0byB3YWl0IHVudGlsIG5ldyB5ZWFyIGlmIGFueSBjaGFuZ2UgaXMgcmVxdWlyZWQ/DQoN
CkNoZWVycywNCkx1Y2E=


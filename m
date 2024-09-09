Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E098E97139D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794072.1202755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snahy-00050N-Fl; Mon, 09 Sep 2024 09:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794072.1202755; Mon, 09 Sep 2024 09:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snahy-0004yD-Cy; Mon, 09 Sep 2024 09:29:18 +0000
Received: by outflank-mailman (input) for mailman id 794072;
 Mon, 09 Sep 2024 09:29:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xur/=QH=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1snahw-0004y7-Bf
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:29:16 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2606::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9ffa2d5-6e8d-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 11:29:13 +0200 (CEST)
Received: from AM0PR07CA0034.eurprd07.prod.outlook.com (2603:10a6:208:ac::47)
 by AS8PR08MB7886.eurprd08.prod.outlook.com (2603:10a6:20b:52a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.14; Mon, 9 Sep
 2024 09:29:05 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:208:ac:cafe::20) by AM0PR07CA0034.outlook.office365.com
 (2603:10a6:208:ac::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Mon, 9 Sep 2024 09:29:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Mon, 9 Sep 2024 09:29:05 +0000
Received: ("Tessian outbound 6d35f8653bd9:v437");
 Mon, 09 Sep 2024 09:29:04 +0000
Received: from L97dd6f8348e1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E954B3C4-DA71-4626-AE2C-A6C87EBAC253.1; 
 Mon, 09 Sep 2024 09:28:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L97dd6f8348e1.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Sep 2024 09:28:55 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM9PR08MB6066.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.15; Mon, 9 Sep
 2024 09:28:48 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.7962.014; Mon, 9 Sep 2024
 09:28:48 +0000
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
X-Inumbo-ID: f9ffa2d5-6e8d-11ef-99a1-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rB83Zh58fFXrTjRI8xuCAWUJBCiLHT8o22VBaM+FTaEHK9NRJs7hhf+ttgb9z2b1UTwFvF59/2iSzktTlkLQI3XxzQ2qn7qQPKowXlg5GHjhWW7v5/Of6sSrPRxpPUPGs6COsvG6G2pReMnGmDVLT8vIPob+bcJhba4tWn2jSHDDyXoP7VLFq3ZIrPiQEFyDn9yUoINwJHWCHlRqJidfA6zZt5V2gNQ76KrZCMOC71vqz6yVapEeXEZEBg3wMpvaqtyHMDHo8gw1iK1jYR/qDqmRSG6t78bYnEBq/zaXikjUm4Ulf0hdgxdrvJel1p2pv7Wmc48CG9jv79HDjdzRsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjj6PpFluIEiY862ibNT5CP9eC37pKJ0mJzR2hBBfbo=;
 b=ZYN0j5jgL7NCX+gbb8PQDdECyhDbIl57yuvXyrKrhRx/kzwhiLFJWNC+6s+BpV72l3/ljFgdWu27397yNq1i0AXdndrzg7SgLYZP8ZSO+/RX199X54lResn4iREm8CXxIv2HK4kUksFcDHVRVtO77zob7e+5+hEyaTGw6e/bFPVSzN7RwWT/+bigAMn3eO3wSNkgulhiwOdAoNLFBIxeMLkeg9qAhyyJaoFBq2ke1yfg/78vd0QqRwFG8VHh8HceNDMzhxnm3s44s6/DDsYKYesb5gD72OQDypjWLuczvcY51UG+gswgiTJu5vWYulElCqn86jRLtafKWjR+/gyCDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjj6PpFluIEiY862ibNT5CP9eC37pKJ0mJzR2hBBfbo=;
 b=VgM+YbE7J9yQNaUvQrxkShkCh47N8PvHXIknKaBv7ZmSnk/O4eUeTi31dceNYRNN1h2bypQ83C0Im/tlFaa584X+EX0LGDxOjUqpa6kRV1G+YzeGv3eS8WH3u59WoAyEVI6oV/XNbojgJwjq78K3vYqIl8aFnOkq4xyWtHIaaoo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0882ce21f08d413d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwG+WV3+dByTbfVImzqWZQubzgp9yTlnTz9XPy//xDApUJ/ZGa8obTa7lODMlwRBRlanEvIhe/YbZ/oOBGT4TpER6sXJFLegxC1Zje9PHjhEEOZH25vS1K+Mh1OoMuq3AvCMpAJD4f3RP68liYUHOShpl1wxhJREBWIfiAuNBxmSObhsP+uqg9YLA3hlhBPRywitJELrHAYhplIQaB8ZviR3pJgOgvF11ozhmp2PL/v8mHEQe696QFd17KVoNnI7hNdS5zoEfKESVNm5yNxugN0OfajwZ5+8tgr85OhlmX4H9g/juWcSW0uxhygHDB0C4ZCW0gjbHJeb+gz686W2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjj6PpFluIEiY862ibNT5CP9eC37pKJ0mJzR2hBBfbo=;
 b=dGR5YyYg8xPGVSez9jogZMU5NDPXFR/jYEM9Ak/7wzEefrM4vT1A8p/GutIpsCCwRXn622NvLA1sPzJSUwFs18B9oHlQq2+n8Bw2ZlrqWgfCi072jnK3eGOg4ZBnZA20stULZe51Yck9+ZK4s5M/pugjG8tWFetLnyfClfwNw5hiLHzVG9pkZ/1iTpb2kWWGyUSuJlSgFZiivSwas5L9KMPwTieflgG0cksTJ3xdotxiDTSJQsoF62T/HejctuZHi3whuoKLXW5Xlv8szuJ8trvdU3P6P7lNAYoj5r3cqdYaAAlPl3zOLlhmQwcQPH3etWLNpRZaOPKIIvyhzjK2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjj6PpFluIEiY862ibNT5CP9eC37pKJ0mJzR2hBBfbo=;
 b=VgM+YbE7J9yQNaUvQrxkShkCh47N8PvHXIknKaBv7ZmSnk/O4eUeTi31dceNYRNN1h2bypQ83C0Im/tlFaa584X+EX0LGDxOjUqpa6kRV1G+YzeGv3eS8WH3u59WoAyEVI6oV/XNbojgJwjq78K3vYqIl8aFnOkq4xyWtHIaaoo=
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
Thread-Index:
 AQHa9XoHude8SoLzqU+vDRBIKLz30bI8y1SAgArTwQCABvDngIAAryqAgAAHQACAAAPxgA==
Date: Mon, 9 Sep 2024 09:28:48 +0000
Message-ID: <869AF822-AE91-4CE6-BFE4-B6E179685451@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
 <f14c6fb3-0ab6-49e6-b0f1-622802a599f0@xen.org>
 <3819109b-de48-480b-b548-a5d9f45a541f@amd.com>
 <e1d1ed69-94e9-4625-ba49-9ebdb2b9581c@xen.org>
 <B9014D46-43F4-4928-96B6-CA6167964578@arm.com>
 <7bbf2899-4c80-42c6-867c-2867ff89bfbe@xen.org>
In-Reply-To: <7bbf2899-4c80-42c6-867c-2867ff89bfbe@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM9PR08MB6066:EE_|AM3PEPF0000A796:EE_|AS8PR08MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: ce03177e-c711-42ad-295f-08dcd0b1d92b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QmFBYjBNcUFXUTJhN3FBMmlGRmdkTHNKekxyTWNkZkw5ZTk5aWJJM0xTR0F5?=
 =?utf-8?B?ZXhieTZDWlBSeHFCbHR1ODVPcDJ1dlNEYjJHamRQSWU4VythR0JVVFFCOGFG?=
 =?utf-8?B?enA1dThFbEZ3aHVYcjJDVEJGTXB4MGRsbElRT1dMYjF3cDhBRUFjcmNWdDJk?=
 =?utf-8?B?Z01yeXJMMkEwdncyOUJRRC9kTENKSDFab3k4SUJGNm1yRHV1R3VOazFxQ2lu?=
 =?utf-8?B?eHVBR2ltMko2UWcyNWplRm5uUlF1QU5BMGJJL0JZN2R6VENKYi9MbjVUc3Uz?=
 =?utf-8?B?OTFZOUFTM1dhZy9rblVHZGpHek1qY010K2VRUXRjeTBodVN3QXY3VTM1QUhJ?=
 =?utf-8?B?VjRZalBJdFJXemZXbFRXZnFUWHRaZXY3YWZ5OEIyNWpQdjBtWjNIcStwa3pt?=
 =?utf-8?B?OUlDdDEveUtITWRaRnA0Q3VHUVBjVWl4YWs1L3g0NVRuMU1nNXlPTEhveGp4?=
 =?utf-8?B?ZXVUZm85RE9heDV2T25xRllyK3dFSU02Zkt4b1gyR3U1Z3pSVnVvNjFjVmE5?=
 =?utf-8?B?RXYrdy92bXNuU2dVZmJCUHdUSjBWSFA3OWZXUUZTc3IwMHFuMVJVQXhpc0c3?=
 =?utf-8?B?RHdicDhSSjc4UUZydXhiQlhKU1lNcjc2Uk1xYUptanlIN0JOUVN2OHBobzJE?=
 =?utf-8?B?ZlNmU1dzWjlOYXdmMmMxUXZsU1JYalgrbEsxODh1Z2tnWFZ1b2dFZ3FqSkhN?=
 =?utf-8?B?b2FRVWxLWnM2VGRnY2oweXM3eGhaTDdMLzdCUmNoR04vQ0gzbzVQUTIxb2Fo?=
 =?utf-8?B?NFZ1ZFZ1bE4rL0lCL1NXaFpCdS9HVWZBSVBMaTBzQzh4dFBUMmNFK2JkMXRq?=
 =?utf-8?B?UUhZME52WjJqWnE5US9YOU5qaVpGcHR5YkJVMVZYK0NCa09zZnNZeXZTYjRJ?=
 =?utf-8?B?ODNpbmRRbGIwR3VKSGRCVFoxMlBRbHBqR3pUM2c5V2RCZlM0QVZOTGpvNFRH?=
 =?utf-8?B?SGNwWXJsVVNtRThuV3lmRHF4dklEZlpTUHhORW9ERXhKT1BhYVNNVXYyZjR2?=
 =?utf-8?B?Q2RBUW8zQTgwcWVlUVRLcHh0WWk1UEpZZ0F3SW12aUlCalpIb0wwL3VRa00v?=
 =?utf-8?B?SE9VR1VZc0F0bFh5a2ZFa0N3NGdpUHUxaEtZT1hmaVJROGgySHNreC9RRVFi?=
 =?utf-8?B?WWo0SkZZMWUyUTJEdkdBS0N0Uy9PY1k4NnV6V0NJekRsOUJqcWpWRWNodlpF?=
 =?utf-8?B?Wk1PYlhtMHFyWnhmbmNRU3FtR3pTODB2bFRYSU8rNmNOcldCd0JCNzE0OXNC?=
 =?utf-8?B?MEZUVDNWckJySzVLMjhHN1pVbCtlZzJWaXFMVmlDaWdNMDNwVUF0RFRYS2M5?=
 =?utf-8?B?UndkUWd3TVZ2VDIvVlUzNVp2QW5BRlNtWkVEQXRGem9zNDJlMVBjYUFUbzk3?=
 =?utf-8?B?WjNwSzBpWkN5cHRmYXRHU0V0UTF6d0dDZFdCTzFvQTI5aFIxc3ZFMDZzWEVK?=
 =?utf-8?B?NWpEZ29CMkNkTy8xN2kxRTdCeENTQ0xmbUZiMVZDUU04VGZWRGdITjNMdGJ0?=
 =?utf-8?B?cWFxUUF4aUFzdEVxdW15dzVCUUhZZHZSdUsveC82WlpVVklKcm9zVEFkZTN6?=
 =?utf-8?B?K28vRUdLN2s5elVWL1BHclNzWW5NTGR6RkxJNkFqVXBCWS9maHNhdGFRcS9G?=
 =?utf-8?B?WXF1Q2hNalgxd3JoQUtvQkw5b2tQRnM1QjZDVnhPWTZROWlodmlsQnpsL24w?=
 =?utf-8?B?eVkwRVRCaEU1TUxrQUFZOFc2b0VaWUM0dGJ0dzlhYWs4RFZGcko2VTJ2SXoy?=
 =?utf-8?B?M2tQM0RPR245bG5tNDk5ZktRV0p2TGhUOTZvZytLSit2NHV3N01QcmR3VFBq?=
 =?utf-8?B?SEI0ZXpKS0lKS0tuQXhCbXc0Q25RRnhOWDFqSnlaRU9TZkVVVUFxZUl1bDV2?=
 =?utf-8?B?SW01SG15ZkxsWEpSa0dJc20zMUlncFJ6dDZwNVZ3QTRRSHc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D85E2AD903438458EC2FD2CDA31C387@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6066
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8382dbf7-19e0-4a0d-6a9d-08dcd0b1cf75
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXdNRUZzSjB5dmxZVUYwa002VTlqNTZUb2p5RGYzRmQwczRRV3k1SGQwelda?=
 =?utf-8?B?RE0xaExqNHlCK3EvOWxuWllrYjRldUYvWXEwekZ5bnhTMGdlM1NXMklyWS9s?=
 =?utf-8?B?U2NNRWd0WHNndEsyWmlzM2VZZ0VqOHQ4a09yb2YrK29EdFB3WC9hM29sSWhK?=
 =?utf-8?B?T1dtTlVvWXBvU2FhOXpJN0pmWHlQOStRbmdqdjVsRmxySGk2THVKdW9tRTZm?=
 =?utf-8?B?RDVNRkdSclE5Y2UxWVE0MlNzLzBHKzdPU1NGV0p6WWgvV2NmMjdDeklXZCtG?=
 =?utf-8?B?RVZPbUI2S0lnd2h2dStuUi82dDF4UG9JSW5lYytwMGh1RUs1dWFIa0R1T0lz?=
 =?utf-8?B?aUNmYkhPYnZoUEFhT2FBaW9GZlRBbkh4MXBUWTFZd1V0VEtmb05OSy9weWdZ?=
 =?utf-8?B?UjM1U00xd3hqUktucU9pbzd4Z0hoMm5FR1hlcHY4MUVyQkc5Q3lvL1lTK3Bj?=
 =?utf-8?B?akh4TjN6TWpndi9rcmdTMzlyeXVHSmx5a3ZkbWsvamRJcDUxUDUycWczaWZV?=
 =?utf-8?B?MnpUZlhvV0o0MENKdms5cEJ3cmFocDVZcjZBUXl5NmhMQmhZQ0NUT1pjYkNu?=
 =?utf-8?B?WXdQMXRrTDRkM0NBeUJJTEhlYUk3dkhySVlNS29UZEMwUjBiZDFOdWFsN1Q3?=
 =?utf-8?B?YmUwektmdVNPSFJJTHVHbmh1RmVwVE5MRng3MWNtY3Q1aEpScDFwQVZVMDZu?=
 =?utf-8?B?Q1p6Wk14a3Jjd1grVG95TFV6bEpwaEl6RTh5UkYvSG80SVJsVTlCYlM5UDN3?=
 =?utf-8?B?OVlVS0dPQnVjU1IrcnBTTWNpdEY1aFM5TFVoN2RxazdENDFYZDNwbWFJVnJq?=
 =?utf-8?B?bXQwRzdSeUtSdWp0UGh1ZldMOVZvTElSaWp5bXF2V0pSR0ZxYStCUUhDV3hv?=
 =?utf-8?B?dVBKNXM3NlgzVEF6V0dXL2U0Rzg1WEZTek8zRTNVbTd2dlZoaTZwMmtEWGxk?=
 =?utf-8?B?RGU2VGQvV01hNVRGN1BSdVBuYmNrbEhQTzg5cEx5V21vbDRZOGliWmN1WWJy?=
 =?utf-8?B?ZjM1NEo5YVkybm1ZcVNCa3NHby9WTjYxU1VQbHNNUE8vc3VLQ3NpVUF6ZFZu?=
 =?utf-8?B?WlBya2tXbjFpTmladmNqY3dCQU9JV1ZoVFJxWjF3MnpxWEMrSG1zaC8rMHd1?=
 =?utf-8?B?dmE4VEoxT0l4S3F4c3BTMnhCaGc4ejNYbTNPblZqcFA2NWNXM3RHYlB5YkJr?=
 =?utf-8?B?ejdnNm9DWDdkVVl4MDZLR2taZUVSeDhZUEFFSHhhWHF0UzNxby8yVjU0MkJw?=
 =?utf-8?B?ZjNZTmlITVk1d0FXWmdPZDRNOFN3MDQyZDNRL2pkSEJSWGtMRllVTzAxcEhW?=
 =?utf-8?B?dnFFdW85VkpGUWJ5dTBYNWp2STlQMjZNcFZHd000M3JvdTRGeUJmQmVYRThZ?=
 =?utf-8?B?K1ZWMW05ck5Nbk5mL3JjYXZGV3lqV3Z4WnNDWmpzdjRIVjc5Wm1MUDJMdHJK?=
 =?utf-8?B?bWRyaHJBeVFOc3hPOCtsUVAzT09rNmNyc2dXZDRFTFFjNE12WDBQOEVrZG83?=
 =?utf-8?B?TDlCYXd3eUkySmFXc0hxZ0IyRWF0Wm5hcUVSdXVyOS95UUFGMUVPVjYxZjhR?=
 =?utf-8?B?MExYa000K3JPVEgza1RsdFV0NkpVMWFaMlN4VG9kTjJNKzJIZWowYVNiZHRK?=
 =?utf-8?B?bndwYXBUeFk1UzdGelJ4Q2tIb1k4SVhIcVoweTJFWWI1MFFmWmxLajAzbCtC?=
 =?utf-8?B?VGxmbzFpcjJWYVdhL1pqSXpXY1pXVnQrVEgvSzY1eEplRS9KNDU2VlFvVGdu?=
 =?utf-8?B?R0RRRU5NSnVRd25OdExUcjYvV3pXZEFKQUlBZ3pGY0VPTjRnRG04RHd6dmU5?=
 =?utf-8?B?WWxjSVJyMEMvZ0lzM0NTMWlLRVRocHZocmord3NST1hoRlZWYktxV1hIcng0?=
 =?utf-8?B?ZkdnRjFjQjIzdXd2a0Uxd3JROUxrTUQ4Y0xIVUFoZDdpSm93M05HZDdmOG0v?=
 =?utf-8?Q?T2+wzyKcqWcZqdzRFnpaPNnLl9clOcvT?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 09:29:05.0416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce03177e-c711-42ad-295f-08dcd0b1d92b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7886

DQoNCj4gT24gOSBTZXAgMjAyNCwgYXQgMTA6MTQsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwOS8wOS8yMDI0IDA5OjQ4LCBMdWNhIEZhbmNl
bGx1IHdyb3RlOg0KPj4gSGkgSnVsaWVuLCBBeWFuLA0KPj4+Pj4gDQo+Pj4+Pj4gKyAgICBtc3Ig
ICBQUkJBUl9FTDIsIFxwcmJhcg0KPj4+Pj4+ICsgICAgbXNyICAgUFJMQVJfRUwyLCBccHJsYXIN
Cj4+Pj4+PiArICAgIGRzYiAgIHN5DQo+Pj4+IFRoaXMgc2hvdWxkIGJlIHZpc2libGUgdG8gb3V0
ZXIgc2hhcmVhYmxlIGRvbWFpbiBhdGxlYXN0LiBUaGUgcmVhc29uIGJlaW5nIG9uZSBjYW4gdXNl
IHRoZSBTSFsxOjBdIGJpdHMgaW4gUFJCQVJfRUwyIHRvIHNldCB0aGUgcmVnaW9uIHRvIG91dGVy
IHNoYXJlYWJsZS4NCj4+Pj4gVGh1cywgdGhlIHdyaXRlcyB0byB0aGVzZSByZWdpc3RlcnMgc2hv
dWxkIGJlIHZpc2libGUgdG8gb3V0ZXIgc2hhcmVhYmxlIGRvbWFpbiBhcyB3ZWxsLg0KPj4+IA0K
Pj4+IEkgYW0gYSBiaXQgY29uZnVzZWQuIFNIWzE6MF0gaXMgYWJvdXQgaG93IHRoZSByZWdpb24g
d2lsbCBiZSBhY2Nlc3NlZCBub3QgdXAgdG8gd2hlcmUgc2hvdWxkIHJlZ2lzdGVycyBhcmUgdmlz
aWJsZS4gSSB3YXMgZXhwZWN0aW5nIHRoYXQgdGhlIE1QVSByZWdpc3RlcnMgb25seSBuZWVkIHRv
IGJlIHZpc2libGUgdG8gdGhlIE1QVSBpdHNlbGYuDQo+Pj4gDQo+Pj4gRm9yIGluc3RhbmNlLCB3
aGVuIHVzaW5nIHRoZSBNTVUsIHRoZSB0cmFuc2xhdGlvbiB1bml0IGlzIGluIHRoZSBub24tc2hh
cmVhYmxlIGRvbWFpbi4gU28gYSAnbnNoJyBpcyBzdWZmaWNpZW50IHJlZ2FyZGxlc3Mgb2YgdGhl
IHNoYXJlYWJpbGl0eSBvZiB0aGUgcGFnZS9ibG9jay4NCj4+PiANCj4+PiBUaGlzIGlzIGV4cGxp
Y2l0ZWx5IHdyaXR0ZW4gaW4gdGhlIEFybSBBcm0gKHNlZSBENS00OTI5IGluIEFSTSBEREkgMDQ4
N0guYSkgYnV0IEkgY2FuJ3QgZmluZCBhIHNpbWlsYXIgc2VjdGlvbiBmb3IgdGhlIE1QVSB5ZXQu
IEFsdGhvdWdoLCBJIHdvdWxkIGJlIGEgYml0IHN1cnByaXNlZCBpZiB0aGUgTVBVIGlzIG5vdCBp
biB0aGUgbm9uLXNoYXJlYWJsZSBkb21haW4uLi4gTWF5YmUgdGhpcyBjb3VsZCBiZSBjbGFyaWZp
ZWQgd2l0aCBBcm0/DQo+PiBJIGdvdCB0aGUgZmVlZGJhY2sgdGhhdCBEU0IgU1kgaXMgb2sgaGVy
ZQ0KPiANCj4gVGhhbmtzIGZvciBhc2tpbmcuIERvZXMgdGhpcyBtZWFuIHRoYXQgYSAiZHNiIG5z
aCIgd291bGQgbm90IGJlIHN1ZmZpY2llbnQ/DQoNClVuZm9ydHVuYXRlbHkgbm8gb25lIGdhdmUg
YSBzdHJhaWdodCBhbnN3ZXIgb24gdGhhdCwgSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhh
dCBuc2ggd2FzIHN1ZmZpY2llbnQsIGJ1dCBkaWRu4oCZdCBoYXZlIGEgY29uZmlybWF0aW9uLg0K
SSB3aWxsIHRyeSB0byBjaGFzZSBtb3JlIGluIGRlZXAuDQoNCj4gDQo+Pj4gDQo+Pj4gQW55d2F5
LCBmb3Igbm93LCBJIGFtIG9wZW4gdG8gdXNlICdkc2Igc3knIHdpdGggYSBUT0RPIHRvIHJldmlz
aXQgaXQuDQo+Pj4gDQo+Pj4+Pj4gKyAgICBpc2INCj4+PiANCj4+PiBSZS1xdW90aW5nIHRoZSBz
cGVjIGZyb20geW91IHByZXZpb3VzIGFuc3dlcjoNCj4+PiANCj4+PiBgYGANCj4+PiBXcml0ZXMg
dG8gTVBVIHJlZ2lzdGVycyBhcmUgb25seSBndWFyYW50ZWVkIHRvIGJlIHZpc2libGUNCj4+PiBm
b2xsb3dpbmcgYSBDb250ZXh0IHN5bmNocm9uaXphdGlvbiBldmVudCBhbmQgRFNCIG9wZXJhdGlv
bi4NCj4+PiBgYGANCj4+PiANCj4+PiBTbyB0aGlzIHN1Z2dlc3RzIHRoYXQgaXQgc2hvdWxkIGJl
IGZpcnN0IGFuICdpc2InIGFuZCB0aGVuIGEgJ2RzYicuIEFueSByZWFzb24geW91IHdyb3RlIGl0
IHRoZSBvdGhlciB3YXkgYXJvdW5kPw0KPj4gSSBjaGFzZWQgdGhpcyBpbnRlcm5hbGx5IGFuZCBp
dCB3YXMgc3VnZ2VzdGVkIHRoZSBjdXJyZW50IG9yZGVyLCBkc2IgZm9sbG93ZWQgYnkgdGhlIGlz
YjogRFNCIGVuc3VyZXMgdGhlIGNvbXBsZXRpb24gb2YgcHJpb3INCj4+IGluc3RydWN0aW9ucyBi
ZWZvcmUgdGhlIG5leHQgZXhlY3V0ZXMsIGFuZCB0aGVuIElTQiBlbnN1cmVzIHN1YnNlcXVlbnQg
aW5zdHJ1Y3Rpb24gZmV0Y2ggb2JzZXJ2ZXMgdGhlIHVwZGF0ZWQgTVBVIHN0YXRlLg0KPiANCj4g
SSBhbSBjb25mdXNlZC4gIkRTQiIgZG9lc24ndCBlbnN1cmUgYW55IGNvbXBsZXRpb24gb2YgaW5z
dHJ1Y3Rpb25zLiBJdCBqdXN0IGVuc3VyZXMgbWVtb3J5IGFjY2VzcyBjb21wbGV0aW9uLiBDYW4g
eW91IGNsYXJpZnk/DQoNClNvcnJ5LCBJIG1lYW50IG1lbW9yeSBhY2Nlc3MgY29tcGxldGlvbi4N
Cg0KQ2hlZXJzLA0KTHVjYQ==


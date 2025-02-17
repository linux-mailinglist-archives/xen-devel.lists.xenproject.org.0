Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC8A3844B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 14:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890430.1299548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk0yg-00054S-HJ; Mon, 17 Feb 2025 13:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890430.1299548; Mon, 17 Feb 2025 13:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk0yg-000525-EO; Mon, 17 Feb 2025 13:16:02 +0000
Received: by outflank-mailman (input) for mailman id 890430;
 Mon, 17 Feb 2025 13:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bV9=VI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tk0ye-00051g-96
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 13:16:00 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 532cb7fe-ed31-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 14:15:57 +0100 (CET)
Received: from CWLP265CA0521.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::12)
 by PAXPR08MB7491.eurprd08.prod.outlook.com (2603:10a6:102:2b6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 13:15:51 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:400:18c:cafe::11) by CWLP265CA0521.outlook.office365.com
 (2603:10a6:400:18c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.18 via Frontend Transport; Mon,
 17 Feb 2025 13:15:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Mon, 17 Feb 2025 13:15:50 +0000
Received: ("Tessian outbound b69432ffdd72:v567");
 Mon, 17 Feb 2025 13:15:50 +0000
Received: from L1aba98242f67.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A2F63C0F-6588-487C-B867-770F03D4BBF4.1; 
 Mon, 17 Feb 2025 13:15:44 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L1aba98242f67.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Feb 2025 13:15:44 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 13:15:41 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 13:15:41 +0000
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
X-Inumbo-ID: 532cb7fe-ed31-11ef-9896-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=l9UTlZvdMoTPD7Ikl4DmMSsqVmvzp2in5XbjRW6UH8LmRXdQNLNbzSRPkFMv2mPW4OItkUE9Q/gGtv4jgDuh+S8A+Kj8YS0SV9dBTlZfmvGKNQFWt3pI4h1aaJ1nnGO6CmPudtvfdsDzvKMzEXVLMZ272IMetgYrV1VMI33rrIRRr9C5vUDiuQ0x9HhNnyxGq58qL6gjNrFzjuIIslyHrTnBlqbUtiT2flYkDDq4ZHuM+qMlwlDuWWMZFMcEJAVCV2GeET0TtMfktaSywpB2zPO0fkhEwvuyRPROAr2kzzZ0aUM/PgxUe0WlSD7Jz44NoOJnFK2jA4srJY9OtaI3hA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR4k0HapXMk5BgxJH/I2sO9yrXBJPkk1O/DRjUBMAes=;
 b=A3PPQ+2kaym3YAvgwW+mOx2XfSNiNvJthFJVWQLLxJrp4TPh64IBWpqf3jxsSV+lkhZDJxFAB8rtQHIB1XNHK/tlVZqZTRiSScj52dlvDIgISeuXg8Qe9B1I01LVHH/YjRu/HWmUWDRAZs5mXK4GnEDHUde5S3pfOXSlIanWEuDBJ3znWweD+EwT6IFZ/xe1eZAtEQ2uSF9j5eGpVQMGFb3Ru6kzdmEeBwiiSoW63FZgMvmHHAuArlXaZjoLGqWfNnAHniok1XcMk8GdChlVlKZVZrqBNAAmeOLth9b03iRH2PBgENxRKIBgJIRvgAh7ceVoI8+X/sD671IB2JplMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR4k0HapXMk5BgxJH/I2sO9yrXBJPkk1O/DRjUBMAes=;
 b=pUHcsPsX8oW4JskyXp3VxNUtyMEhHQPFJkSOAcDA0Yv2vOlnnwOsGGSiX+lM+vKV5nZRnB5DRN6js4T8uxVQko6GOA9jVPR0NUTbu7vjKmlMXqeM0GebEmeGRXDq37ibvgIsK7B5Jwn+M03usn4NsDYCjSTde8MQapnImgDgUQQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a21829e7cb14328
X-TessianGatewayMetadata: d6/FYq4umd16NrwUA729puX5BIAFvfhI8dbgIeUgtxr3ohSRMHqsSvarh1rnp2qYHNnNffSguEp8MT4J7m7iy3CVu5AX7VAMQw3r4KEMkP+4k3fQFmZO1xgQatGMwE5RR6MfTNHlWZLDFppbndInM7UauN/388hYbIGHLwks7A8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHOcjLwRdgXqEXLyGuEij8fu7SHDv1gp55I+c6lNzTOmSoNx2DzgFJeD6wDKnXa5uka9pWTWcswlk7+nc8wVHGVa3l7Sdcrwzhv2bo7Gl6uZ4qDHug3PJYz0NLC3LTupnDqdiU+6ALFag3gUV9s97sx4gW+b4xDSNROa+N+2k+gEnl2TyhGuxgFYz9ZTHniGaEbP4YKhNISi0/3glUYDSNtU3Il1PCcmbVM3ESoJOAZArAJq4Ju72ULmpcGmLuHIPkjrPtG3JlvpDt33b8BOnKINjZ63SLAFGU6K/IUphhcvz2opeXwCDflhv/Z4EqESD2D6FLzJQdWpb8NWeHIvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR4k0HapXMk5BgxJH/I2sO9yrXBJPkk1O/DRjUBMAes=;
 b=RjS8r81WlIVnRDsO4GXYAZlKSEDX2It/QiC3CYg/lQNFHiTHjJiHTCcuLZasddCqngodwxIZEIvUXgrviamDnbSmOjBPs/8HHzXiMgoB6oawopkRis2wjLnWXa+kZNa25erpu9rk44OTLk8OSiFfrU14rL16HhH8SvnLP4mgRn85Wja1/IjDGsYhXKSYqKsuY5Q2PFz2QXN76sJvedcmPtvApRcBreV9xp6FD1dQcaxZm10EMBEA1G9t/2/KBycGjYgl8XKZ6zZOad+XPU16CoEKyDO8RQL54h6qtFpo+VxArDbVABQTGbzUZApgf17yfxSxC62c9VcHHfYsTrKZaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR4k0HapXMk5BgxJH/I2sO9yrXBJPkk1O/DRjUBMAes=;
 b=pUHcsPsX8oW4JskyXp3VxNUtyMEhHQPFJkSOAcDA0Yv2vOlnnwOsGGSiX+lM+vKV5nZRnB5DRN6js4T8uxVQko6GOA9jVPR0NUTbu7vjKmlMXqeM0GebEmeGRXDq37ibvgIsK7B5Jwn+M03usn4NsDYCjSTde8MQapnImgDgUQQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
Thread-Topic: [PATCH v2 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
Thread-Index: AQHbgSalEDkpkAC1V0u42lojYRhvpLNLdAKAgAAFoQA=
Date: Mon, 17 Feb 2025 13:15:41 +0000
Message-ID: <4EF0BB2A-1C67-4878-8027-7246B3483902@arm.com>
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
 <20250217102732.2343729-3-luca.fancellu@arm.com>
 <0ac6b968-c298-462e-a190-65cc3e74aa01@amd.com>
In-Reply-To: <0ac6b968-c298-462e-a190-65cc3e74aa01@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DBAPR08MB5590:EE_|AMS1EPF00000043:EE_|PAXPR08MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 257a57b1-57b7-4d66-7255-08dd4f553322
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NGNPZUpyb251Z2hPUEJtZ05yOVIwVHF2cnFHRVBtMHRVRjB1bmFycTRKVmpC?=
 =?utf-8?B?U2RGWEF2ckduSnM0dXQ3dXQ5c2dhVFlWS3kyU2JPOU16VjlXZ3RvL2t1NG5n?=
 =?utf-8?B?KzkybVZsMitOVUlpYmhGRE91UzBRZzhsS3lUVkFwRzhzano4dHE3Ry9pYWZV?=
 =?utf-8?B?L3hNT3FjVTdTVWpJWnBSVzV0cFpyYytqRTNHMzhHeUIvSXlRSytDLzZLL05S?=
 =?utf-8?B?NkhFRS80UE1tQnREQ1I3c09DUHZIS1hYNTFaR2hYaUpYS3pEWlZ3RDRmZ1hi?=
 =?utf-8?B?R2s0WWxQT1AwblR1ckZPYXcvaHlEOHgybDhuZ1lyMmJna2ordzMvZWdCQ01a?=
 =?utf-8?B?a1h3T1BIT2MrZXoyS1p3eEdRNklScWNFNWJvRVQ4c213ZWk0Y2llc05EWXdJ?=
 =?utf-8?B?YTRSbllIOUsrVG12dG1jVGlUelhQenh0bEkxQkc0V0dCakJVdWdMK2FrZlFR?=
 =?utf-8?B?b1Nlb2p3SVFHRGlFUWxVUTZJRmtnVVZUTHBhdWxDcHdOVi9vQkFwLzdvUmVq?=
 =?utf-8?B?SjJqSTllTyttY3VTaFpSU01ETmRpVlBaY0czVTU2ZlBKRzRobEh1UFhvTVh5?=
 =?utf-8?B?MHNMVTJpTnMwQnR6ZEQ3NjdzN1VLTlJvTUlkbW5ucnZQdWYwaUdYM2hVRFh0?=
 =?utf-8?B?ckgyRHFhMStMTmhaQlVNT2Y2Vm16Z2JIS01vQ1FPOFk3S3V3S0IrM3pXQjJq?=
 =?utf-8?B?UGFDZjhUd3VyT0ducHcyQ1htM2J3bmlzN1JaZXRGZDVhUEU4MGtjU1Mrd0NZ?=
 =?utf-8?B?MVdTS2RDWGdHR0tSa3ZMcXBoUmlzK2dVNlJ5dEVaQi85cUNaWHhkVFBySWFp?=
 =?utf-8?B?V25CNm9HVnd4QnRxZE1qdVZlNmNwNE5XczRHcTd6ckxmU0o3TEdQTnVQQWtP?=
 =?utf-8?B?NHZyc0o2cDh0NkRMUjk3NU00dTV3eUxFQXVZeXR0alhKdG91cHZuOU9WTXhK?=
 =?utf-8?B?K09BYUR2N29vL3BBTUJGVUxic0FTY0ZIRVFvOStHa1ppOGNPVFhrMlZvRVQ5?=
 =?utf-8?B?ejlEbU1tWkZFZG9QUmViQ0pwUTNFN0pIRHRROVpjNStCUStmRXVSU2I1c1o0?=
 =?utf-8?B?V0VMUUFpdzRhMkRaa2NVT1RRbDdWWFhEVnNRaTNGcVVGUXVPZG1xOUk2VThl?=
 =?utf-8?B?c1d4ZStZTHBIL3A1cE5PSkRremhST1Zxb3l6UkxwZGN6bEhCYUZLZkFFWFp3?=
 =?utf-8?B?RWl2SXpjUCt2KzloYlpPQ3VxZFJQT21Db1YxZldCMGdPcUNFN1kzQmdHOGJM?=
 =?utf-8?B?QmU1dkNRNVF2UFBsTXlIU2dTaW1vTlBQYlBvcXFPVUFad1VPWXBMMlpTMmo4?=
 =?utf-8?B?U1l4TkxmdU9rN0ZHOWxidDZraUNqWTJNMldYYXhyWWdUWHRMM1VzVXJDRXN0?=
 =?utf-8?B?Q01xcXdZa2huVlViVWVIN1lTcmE4MGkvZE5mcU0xSkJ5V1ZnVjd6SUxrNlBk?=
 =?utf-8?B?OXBtWjc2QzZDaFFLN2RrVmg3SSt2bXYzS2tIS2pKT0tRRGlia0lsdStTcDBw?=
 =?utf-8?B?eUpTem9FdVJQUE9iMVA5RmJTclpOWG82NitmbjVHT3BTdjdubUZmREdFTVkv?=
 =?utf-8?B?b3VKZ2ZpeEUwVmVJQkdEZHZSbE1DaW04dUxtV2ZJcXN1THpJUTExYmc3c2JU?=
 =?utf-8?B?WWREaHhPRDJJekxqQ0duSnkrakprQzA0OFNSeExIVUNSYk1hVkIxRHVpci9P?=
 =?utf-8?B?bzkxYUV5SmhtS052eTJ0T1JvQ1VqQkNJdUhCZDJYOHhMcU5HaHVqQTdMWTBq?=
 =?utf-8?B?VEtXUmZib2Z1OEFGZ3pJYTV6YlN3MVhObnBEaDJSOUJ2RGk0bGlXZ3k3Yml6?=
 =?utf-8?B?TWw2bHJQQURSNUtMT2RhdVdzKzdiVHlaUVd0T1pkdnp4OG1pemduOE5oaHBj?=
 =?utf-8?B?UFJCQUVkWFdPQ1hvTmlsbHQwWXpNOHU0dzZXMXBxYVYrc1RGSVNJSXpqWmFu?=
 =?utf-8?Q?cjtNPdnMRQ5HHS2sLcp+5MY2Fi4N/vb1?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CDF0A9052DCD9418D6BA53A2272D4F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5590
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0129170b-3596-49d5-be24-08dd4f552dcf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|35042699022|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qmxoa2NWZkxxR2NVZEdDNEE0eGpIRUZ1REhZUTh2UGUvSUdvQy9mYm9GQlJ6?=
 =?utf-8?B?ZkhmZVZkNGxZVHhyc3BzTnVwMFBXay82ZnhWdENJcmVqbG9uOWlINEdFRW1s?=
 =?utf-8?B?WlpMQ3QxbG1NMlRWRDBReGhJRHEyTVg1TW1uZ0VpeHBieFNTdnphT3lUODk4?=
 =?utf-8?B?RGVkakhDRExGc1JjK2xxVDk0eHh2YXNXWDdaTWNSRXFzQkE0SzU2UFEwa2Mw?=
 =?utf-8?B?aHpBQTdlRC9YVURLbXFtMTFrR2dtMktud2xPRHN2TzJXOFh3N0ViSEdXcVpl?=
 =?utf-8?B?SnRsSkxtbStVNW5nTERCK3h6RGdVcTRNOWRVSEtmMUMrbk1DSlRWQlgyRHRr?=
 =?utf-8?B?RGxqZ29DK2hXMlBPZ0FlT04yZWdPNTZtL1haeXJlcEdqOEVPVFJxYnN0QXc1?=
 =?utf-8?B?M3dXT0duV01aRFlXeDRhZHBkWXUzeGhmVWV4cnB1Tm92ZWYwUXdnVnJGZTJE?=
 =?utf-8?B?RnF1ZitiT0xJTTI5cE5OcUNLQmZUelB4d0Q1OVlhQkFtS2JxV0gvQUQ1ZTdz?=
 =?utf-8?B?NVRrRXBQdTE2SURNUDRQTkJnL3E0YjBtSE81a2U2VGxaRXJabEVkV014ZkZr?=
 =?utf-8?B?cEEwdktJRThqZG5Sd3Vpci9xcUZzVCtFNjUrWjZuUDhxYStGVzZBc01hdGNK?=
 =?utf-8?B?amtBa1U1WksvczFBdXBjMmVubXBVd2tlRE5DTnorQW1sV0w1ZEtSVEhrVDhC?=
 =?utf-8?B?Z2hqN2xzVTlwMytRcGxsRktmZC9HQWoxU3Jpb1FBRWVQa1I2eVRKRC83MGVt?=
 =?utf-8?B?b3BnQTJ3c1F1aldvdFhOZVB5YmM2ZjUwTkZFNmdRc0lQNUUxZ3lOWmErZkV1?=
 =?utf-8?B?S01LbGFkRUxqY2JWRjZIaUpJSmsyWVU2Mk1IalozdStLaVZ0TUxOQzBrSTdZ?=
 =?utf-8?B?WU1MNGEvQzRLNFZsSnF6L0ZuV25kRCs3STZXUFJkbysyTjJTRzRJaVJUaW5T?=
 =?utf-8?B?ZThsRVNpYzk1MUpCdzNTQ3JLWlVrWHVrYUZucis5SFZhdEtMNXZFT0sxYVpH?=
 =?utf-8?B?ZXZ2ZUJSbVU5ZzI5RitYRVV3TkZlQzdvOHlidUhBMVhkeThtTVZyeVdYUFBY?=
 =?utf-8?B?V052aDRYYkY1YyszSEo2bkQ1Sm0rTTdLVjZlcHhseVh6Qy9ORm0ySE1aSEJP?=
 =?utf-8?B?RGJXeDZxUnUwTGxrNHBEOXRaQjlXc1JNcUhLdnpkSHp5YWFEYnhCRWliNTQv?=
 =?utf-8?B?R1NNajVSTTR3djY5cHB0ak5RWEpkd2J5MUs0LzQvTFFRQXZCQzlJMjErcGd4?=
 =?utf-8?B?ZTY5dUQvUnFzWE1jZDZZM1lUVTc2UHpKQmZzVkVxdEJTRzdyNE9NTkVCVlYr?=
 =?utf-8?B?QTBPSCtHSWFQRjNRem5ITmFmckJaNUpvMnRFa2E5dURBTnAvdkdtRHBCQ3N1?=
 =?utf-8?B?OUMySlk4ekFxVDhKaUg1UkFldXBiYVNhNzlvR3YxU1JzcnhXL3FpYVAzTDJz?=
 =?utf-8?B?ODNyUmpqNGE1MTRFdjZvcklYTklMK3BIM20zU2FRRmpXN1JrNlVRTW12TnBj?=
 =?utf-8?B?Z1hVdytyY3dHb1pvaG9CRXRYQTlPeGpLU2duVDFUeE16dzFZOUtZejVnZ3hB?=
 =?utf-8?B?MVlacEZLM2FSeFA1c2l5bTJBeUY0QzhZUGNpMUdURnpPY1ZUakFYWlhsVlZq?=
 =?utf-8?B?Sloxd2xMa1FKNEp2YmdpY0hxZEQ3aVVpWkM4cnk5cm8wUHlZN21lUGdCNDRV?=
 =?utf-8?B?MjVUQ3hzSjkwODNTbWM0OHNxY2NsVnJZVThrdVliMjB5Ny9teWljdWd4Skp6?=
 =?utf-8?B?THBxZWVHVGFiUEZkZi9TZmFLaFQzMkU5bzlrWXdaUXdDMEhIV0lEM3VqWnh4?=
 =?utf-8?B?cU9mZG02dkJZQi9ZMDdvaDluQTZQU0pzVEtteTdoVWhDdFgxSkdaU2h3SHhh?=
 =?utf-8?B?dVNGRHRScHE3S3FCbWUzWkRLUWx1cTVUeGhZbGY0VVk2bUliWm5uc1lPc0xK?=
 =?utf-8?B?ZmtBMTc4RjJVZ0YrRzJHWHZqU2VOOXI5cUpxbmIzQWt5TVJuQ3VxeSs3MjB2?=
 =?utf-8?Q?4SxqT6M/epNG7yIXfcZY6juBwEgpKE=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 13:15:50.4563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 257a57b1-57b7-4d66-7255-08dd4f553322
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7491

SGkgTWljaGFsLA0KDQo+IE9uIDE3IEZlYiAyMDI1LCBhdCAxMjo1NSwgT3J6ZWwsIE1pY2hhbCA8
bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxNy8wMi8yMDI1
IDExOjI3LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IExMQyBjb2xvcmluZyBj
YW4gYmUgdXNlZCBvbmx5IG9uIE1NVSBzeXN0ZW0sIG1vdmUgdGhlIGNvZGUNCj4+IHRoYXQgc2Vs
ZWN0cyBpdCBmcm9tIEFSTV82NCB0byBNTVUgYW5kIGFkZCB0aGUgQVJNXzY0DQo+PiBkZXBlbmRl
bmN5Lg0KPj4gDQo+PiBXaGlsZSB0aGVyZSwgYWRkIGEgY2xhcmlmaWNhdGlvbiBjb21tZW50IGlu
IHRoZSBzdGFydHVwDQo+PiBjb2RlIHJlbGF0ZWQgdG8gdGhlIExMQyBjb2xvcmluZywgYmVjYXVz
ZSBib290X2ZkdF9pbmZvKCkNCj4+IGlzIHJlcXVpcmVkIHRvIGJlIGNhbGxlZCBiZWZvcmUgbGxj
X2NvbG9yaW5nX2luaXQoKSwgYmVjYXVzZQ0KPj4gaXQgcGFyc2VzIHRoZSBtZW1vcnkgYmFua3Mg
ZnJvbSB0aGUgRFQsIGJ1dCB0byBkaXNjb3ZlciB0aGF0DQo+PiB0aGUgZGV2ZWxvcGVyIG5lZWRz
IHRvIGRpZyBpbnRvIHRoZSBmdW5jdGlvbi4NCj4gV2VsbCwgaWYgYXQgYWxsIHN1Y2ggcmVxdWly
ZW1lbnQgd291bGQgYmV0dGVyIGJlIGV4cHJlc3NlZCB1c2luZyBBU1NFUlQgaW4NCj4gZ2V0X3hl
bl9wYWRkcigpLg0KDQpPaywgeW91IG1lYW4gYXNzZXJ0aW5nIHRoYXQgbWVtICggYm9vdGluZm9f
Z2V0X21lbSgpICkgaXMgbm90IGVtcHR5Pw0KDQo+IFRoZSByZWFzb24gaXMgLi4uDQo+IA0KPj4g
DQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+
DQo+PiAtLS0NCj4+IHYyIGNoYW5nZXM6DQo+PiAtIGRyb3BwZWQgcGFydCBvZiB0aGUgdjEgY29k
ZSwgbm93IHRoaXMgb25lIGlzIHNpbXBsZXIsIEkgd2lsbA0KPj4gICBkaXNjdXNzIGJldHRlciBo
b3cgdG8gZGVzaWduIGEgY29tbW9uIGJvb3QgZmxvdyBmb3IgTVBVIGFuZA0KPj4gICBpbXBsZW1l
bnQgb24gYW5vdGhlciBwYXRjaC4NCj4+IA0KPj4gLS0tDQo+PiAtLS0NCj4+IHhlbi9hcmNoL2Fy
bS9LY29uZmlnIHwgMiArLQ0KPj4geGVuL2FyY2gvYXJtL3NldHVwLmMgfCAxICsNCj4+IDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+PiANCj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+PiBp
bmRleCBhMjZkM2UxMTgyN2MuLmZmZGZmMWYwYTM2YyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9LY29uZmlnDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPj4gQEAgLTgsNyAr
OCw2IEBAIGNvbmZpZyBBUk1fNjQNCj4+ICAgICAgICBkZXBlbmRzIG9uICFBUk1fMzINCj4+ICAg
ICAgICBzZWxlY3QgNjRCSVQNCj4+ICAgICAgICBzZWxlY3QgSEFTX0ZBU1RfTVVMVElQTFkNCj4+
IC0gICAgICAgc2VsZWN0IEhBU19MTENfQ09MT1JJTkcgaWYgIU5VTUENCj4+IA0KPj4gY29uZmln
IEFSTQ0KPj4gICAgICAgIGRlZl9ib29sIHkNCj4+IEBAIC03Niw2ICs3NSw3IEBAIGNob2ljZQ0K
Pj4gDQo+PiBjb25maWcgTU1VDQo+PiAgICAgICAgYm9vbCAiTU1VIg0KPj4gKyAgICAgICBzZWxl
Y3QgSEFTX0xMQ19DT0xPUklORyBpZiAhTlVNQSAmJiBBUk1fNjQNCj4+ICAgICAgICBzZWxlY3Qg
SEFTX1BNQVANCj4+ICAgICAgICBzZWxlY3QgSEFTX1ZNQVANCj4+ICAgICAgICBzZWxlY3QgSEFT
X1BBU1NUSFJPVUdIDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4v
YXJjaC9hcm0vc2V0dXAuYw0KPj4gaW5kZXggYzFmMmQxYjg5ZDQzLi45MWZhNTc5ZTczZTUgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJt
L3NldHVwLmMNCj4+IEBAIC0zMjgsNiArMzI4LDcgQEAgdm9pZCBhc21saW5rYWdlIF9faW5pdCBz
dGFydF94ZW4odW5zaWduZWQgbG9uZyBmZHRfcGFkZHIpDQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIChwYWRkcl90KSh1aW50cHRyX3QpKF9lbmQgLSBfc3RhcnQpLCBmYWxzZSk7DQo+
PiAgICAgQlVHX09OKCF4ZW5fYm9vdG1vZHVsZSk7DQo+PiANCj4+ICsgICAgLyogVGhpcyBwYXJz
ZXMgbWVtb3J5IGJhbmtzIG5lZWRlZCBmb3IgTExDIGNvbG9yaW5nICovDQo+IHRoaXMgY29tbWVu
dCBpcyBjb25mdXNpbmcuIEl0IHJlYWRzIGFzIGlmIGJvb3RfZmR0X2luZm8gd2FzIGhlcmUgb25s
eSBmb3IgTExDDQo+IGNvbG9yaW5nLiBNb3Jlb3ZlciwgaWYgeW91IGFkZCBzdWNoIGNvbW1lbnQg
aGVyZSwgd2h5IG5vdCBhZGRpbmcgYSBjb21tZW50IGFib3ZlDQo+IGJvb3RfZmR0X2NtZGxpbmUg
YW5kIGNtZGxpbmVfcGFyc2Ugd2hpY2ggYXJlIGhhcmQgZGVwZW5kZW5jeSBmb3IgTExDIGNvbG9y
aW5nDQo+IGNvZGUgdG8gcmVhZCBMTEMgY21kbGluZSBvcHRpb25zIHBhcnNlZCBieSBsbGNfY29s
b3JpbmdfaW5pdD8NCg0KWWVhaCBJIGdldCB5b3VyIHBvaW50LCBkbyB5b3UgdGhpbmsgd2Ugc2hv
dWxkIGp1c3QgZ28gd2l0aCB0aGUgYXNzZXJ0IG9yIG1heWJlIGFkZCBhIGNvbW1lbnQNCm9uIHRv
cCBvZiBsbGNfY29sb3JpbmdfaW5pdCgpIHRvIHNheSBpdCBuZWVkcyB0byBiZSBjYWxsZWQgYWZ0
ZXIgYm9vdF9mZHRfaW5mbyBhbmQgYm9vdF9mZHRfY21kbGluZQ0KaW4gb3JkZXIgdG8gd29yaz8g
QWxzbyBiZWNhdXNlIHRoZSBhc3NlcnQgaW4gZ2V0X3hlbl9wYWRkciAobGxjLWNvbG9yaW5nLmMp
IHdvbuKAmXQgYmUgY29tcGlsZWQgb24NCmEgc2V0dXAgbm90IGhhdmluZyBjYWNoZSBjb2xvcmlu
Zw0KDQpDaGVlcnMsDQpMdWNhDQoNCj4gDQo+IH5NaWNoYWwNCj4gDQoNCg==


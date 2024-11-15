Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C099CE110
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 15:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837669.1253586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBx7M-0007Ju-Os; Fri, 15 Nov 2024 14:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837669.1253586; Fri, 15 Nov 2024 14:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBx7M-0007IP-Lr; Fri, 15 Nov 2024 14:16:12 +0000
Received: by outflank-mailman (input) for mailman id 837669;
 Fri, 15 Nov 2024 14:16:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tBx7K-0007IJ-Vy
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 14:16:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2612::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 243ca64b-a35c-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 15:16:01 +0100 (CET)
Received: from DUZPR01CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::7) by AS8PR08MB6581.eurprd08.prod.outlook.com
 (2603:10a6:20b:33a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 14:15:56 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::7f) by DUZPR01CA0076.outlook.office365.com
 (2603:10a6:10:46a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Fri, 15 Nov 2024 14:15:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14 via
 Frontend Transport; Fri, 15 Nov 2024 14:15:54 +0000
Received: ("Tessian outbound 6970ca6dd121:v490");
 Fri, 15 Nov 2024 14:15:54 +0000
Received: from La8d5feb9fff5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE036C82-0E02-4B49-932A-203E5B4E96C2.1; 
 Fri, 15 Nov 2024 14:15:48 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La8d5feb9fff5.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 15 Nov 2024 14:15:47 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB7769.eurprd08.prod.outlook.com (2603:10a6:10:395::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 14:15:44 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 14:15:44 +0000
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
X-Inumbo-ID: 243ca64b-a35c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjJjIiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI0M2NhNjRiLWEzNWMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjgwMTYxLjQ2NTAyOSwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GBzskmZ36Mza52w6PVC+okYncGovuSgJZeS5qcUnFKwAeJ3yezDpJaQJK+dfaQyde2RYVQRcJ9pIXebjhBYyq8IpcEHXMEsqqCXVrA1qRqqD+b3O1DGTdY/678BJzulVgDpObBvFYzqlqF7pCAlmxTViAqBgpYTuV73gINfX0w5rCKTJ2R3FUrA3CjSVn2P90igO/MRpzdYhQo4UuNl3/qq9Npkm1f6rotzX5gHp/N8xW2U0qbVaLvVPuCw+cZfjOlkYeRC8BlMHtVrAHEvc23iMyJPhVWHegsRs4vyUZ0hGWLIpDFFGGXdpoFjRLYrHf/Q6hCFVzOzR9DYnrJbj8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ucc1JP7lif6TJHsQvyxxCiKlAlRkgS12bWN6XMnIODg=;
 b=Cdqu0IQpqyDH67AzZCuHZIvNqjtWOHZ5U3p9ZvXLrRMDvobsKg22sxkAWw1PEiiDK1jBd69ZLWtNSig7nBFV5sGU/7vIl842cwrDO3x/Pny5KSU9pKCl+Aa5u+eZhXfbOw9jrUcFGIa9EJi96dejHP6IkujSb1q1EmZucfLayPAkBiwIo6tMLQUEA6rx7oCNBouQNoPYx+FMm8mC8RyPyPARUijTMoqDrhCujglAw87emYKGD60j9r6uaxHrwxXhvcfawnQYhBp9SgiVnNNQmDUcINkudJNgNpJmcyeH4JLXv+vT9iQDEx8l4Y3rjkkhn0HvkWUBZ4T+MFc7wGTjjg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ucc1JP7lif6TJHsQvyxxCiKlAlRkgS12bWN6XMnIODg=;
 b=RqQjuVOGwCIHeoO/EsILiQ75gz1QbDqEzHik0qFJMg1ybeq34/woEDV87YZ7O8TVtxAnsVVA3mPFJ0nzktkFaa772tYV78/aAYETPIwmj35gLgZcnM+zutqsOb8TJHWCwtOmje4uAFwDVRWaEfPmVrgreuscemSxA3bRjqynnNs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1e347b94b71323e
X-TessianGatewayMetadata: +6mAmooaI3m9TgllfQO7M07I6Yc0+C8LybnrTbLuBSgssCmvD99KXSgLSAxosD88WK8qw0TTSLwszfDqO2VZ0ZX4nIo/D5Cox14tlXUYNQEG/gNa5PSsDa/PoN88DE/GyQvS7aCC2J3b73ilsobwWSwub139owAWqGGPJPGkZPk=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPyohKlI565Hmv73uwM9EOUqVlvCbYQHQ96kyrsUvq7OP2vuKL9h7kh2m8aV5PWIAjvOkCgOqqfMz1WHLZzloHAUoC205npkrgRkoHr45CuV17qNklv9mDdwIFmGahqJsT+63rCqZrk3Ea5TM7LZG8mLNOlLKK46re1hq1I8Nz3wAu8ZiT9wCWRh5dIJppm8ZbZ6+SyJReaFP6ykdPZEo9tl1Ymlk7AKp1YXA68+M4PSFBm11E9245qa6BojKhDXkV3J6XXWXtUolOWcJrVwjkgeR5T944FMF3/9ufMWIOTlafC6M4Ok7Xv02cx8ESqf6NNzW1JGWvtNOT/13DizYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ucc1JP7lif6TJHsQvyxxCiKlAlRkgS12bWN6XMnIODg=;
 b=ouQHoEeD3b8XxaiXi5H8zqOB5y+YB/nkeV1JAjsN/tzkG6cQrlLvYXiSSoC71+lHsO2wO8d0DWOAVE9fMedH7o213mGYTtp9xsynFvnKHOWm+lJyW5Vx7A24BBdtS15M4fNWz8tFqx5h4BRmBaVDcCJN73HPsYL7e0llP6tACuFXYbfTP3E431XcE1RIgQ+1kNRjQTNmtb+o5ZoyuSqzMlyR/16vhtcRaIyd5GxOHoJO9tq6DoAduWBINI8OsuL0W/iaG5QdLQtqz7TFcRIkT/EmXspWpJxTaBC487IwRpB5ybJ35cYmihnWOvK/h2D3pKitQ8wJMqlucX5H8Uw/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ucc1JP7lif6TJHsQvyxxCiKlAlRkgS12bWN6XMnIODg=;
 b=RqQjuVOGwCIHeoO/EsILiQ75gz1QbDqEzHik0qFJMg1ybeq34/woEDV87YZ7O8TVtxAnsVVA3mPFJ0nzktkFaa772tYV78/aAYETPIwmj35gLgZcnM+zutqsOb8TJHWCwtOmje4uAFwDVRWaEfPmVrgreuscemSxA3bRjqynnNs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Topic: [PATCH 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Index: AQHbN0xEMVIvN3HbzEuhbXugN/BCZLK4L/YAgAAaC4CAAAkHgIAAEA8A
Date: Fri, 15 Nov 2024 14:15:44 +0000
Message-ID: <CDF98191-3F22-4410-8D5D-88D000AF5EB5@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-2-luca.fancellu@arm.com>
 <3a57e277-5fd2-4400-86b9-29479b3dfda1@suse.com>
 <CEB38FF8-ACFD-4AE1-B571-1A9219575EE6@arm.com>
 <58b636eb-a2bb-40f9-87f1-0a38c036a495@suse.com>
In-Reply-To: <58b636eb-a2bb-40f9-87f1-0a38c036a495@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB7769:EE_|DU6PEPF0000A7E4:EE_|AS8PR08MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: c37257e9-f141-47b0-c253-08dd0580048f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?T0Vna3FaUkxXdHhmN2pzM0F0ODBDa2EzS2tpWFk3MlQ4UisxWmU0ZTgvd3BV?=
 =?utf-8?B?QzJKQ0kxOGNTcDYrUDRGSnBjeGZhS29zNkNlWWovR2o2bStMMW5pYVk2NjF3?=
 =?utf-8?B?UHBZZHdYODVpMEVBWGw2S2kwYWhlL3FTS3FGTjFKZWpOS01Iam5OZjVLYVVW?=
 =?utf-8?B?MEpSaWc1OXE1alZMakxCM1cyMjUxREZFNTFXVjV5YmtaVjVCUVFFc2lTUVE2?=
 =?utf-8?B?RDZ3TGprZFI4dVMzYVQ4YjdiNGI0NTgxQWZVTjlManNTb2hDR3VrbnlZdmpm?=
 =?utf-8?B?bE0zbXQ1cGlZVTRKVklLM1lWY1ZSTTNwUkFoKzBiQnpraFRoTm50ZEZkMGhW?=
 =?utf-8?B?c3h1TUdUd1BJMXdHeWFkN1ZMTFVWcmczVDhSL2o0cmNPQUIzQ21HODBVTjlx?=
 =?utf-8?B?cGhoSktCdmU2RDdWWEQxTHBCVzBGTjhWVTB0VnF5ZEFDbEZleWtILzhnSWVN?=
 =?utf-8?B?NWRtWjgrWWpUZmpuZDN4Tml0Mm1nOWtMRWdtdjd0VThoR0FmN05QbktOV1BS?=
 =?utf-8?B?bWN4YUV4VlpBRitsQnp3R0hVRDFtSEowUGhQVGJpZ2RpVG0zLzdERmtIQjNO?=
 =?utf-8?B?MDhCZ1lzZFpXdUNpSnRCN29XUGJrMWk0OEU5MEJBbXpnblBET1RZWnJzcmpY?=
 =?utf-8?B?SDRKQ2ZQdlRBVFBUcDAyL0ViVnZhcUhCelBreUNtcGlVbm5ZQm03U1V0V0dQ?=
 =?utf-8?B?Z2QwZjU3ejVvR3hLZ2psaFBkUDl1Wmd5ZVpSeU16QjRaMFpuZkQyaDl4M3Ex?=
 =?utf-8?B?b0hSNXpqTnVKN1dmVys5dEJINXNaWkZFVFE1Q0owNTZzZ0Ryamgzc0Y0L2dn?=
 =?utf-8?B?UFlyRzlUcEwxVWZJcmpncUtSUE5UMTZPd0VEMUlUQWtZOW5kNm9oWm42TjdB?=
 =?utf-8?B?dHBkOGFWL2NFSGlMUlZPNW9qeG8waVEvdXNieDloNEJPenlZMG55c2tIcFBN?=
 =?utf-8?B?NkNFd0g3aGxNQ3JJYk9LZFdZY3VuNFVsL2VRU09SNlM4NCtFeGs3ZmhhVFl4?=
 =?utf-8?B?VHd0bkZXdFRXMU92OEJ5REUxOTNXUzBrVlFvZmZLZnRpR0NSUTlqODZOSmdO?=
 =?utf-8?B?ckNJREhmd1NPMERiaG01MFVQVHBDOTFkLzBrbFJEbjFId2ttMkMrb08vMW5s?=
 =?utf-8?B?N3ErUGx1dDRMMDUrUE8reU94aTF2UFdjdFNqOW8waVo1VXlQVVBOdTlObHI2?=
 =?utf-8?B?TUpiRnJjVjc1Uy9DcHZFb1Q1aGhwZnpMVEk3Z0JvSG02djUzUnJQUmRja3lw?=
 =?utf-8?B?SitlN0E0SS9QR0tScG5aOXVyak9ZRkRvdGZxK2N5bGNSY1JqLy9jM3pIL29R?=
 =?utf-8?B?MlFWME9mLzlLTGlxbUkxTWFyM2hvcTV5ZGtrYi82VDkyb0l3bUpNdEgzU2Mw?=
 =?utf-8?B?czZIMVZlOEJTVWNxUTRvYUt5WW96TWlvV2R0ZWZvZVQ3UmkzcWhJRDgwR293?=
 =?utf-8?B?cjFhUE1ibDVjS1ZSUndpRVZoTkNlZDk0VGZwT004TW8zM3JYaWdNc1RVZm9M?=
 =?utf-8?B?aklSY1UxUFlNdk5nOUpTcjJwOXFhVFJJNWhoUm43bXpNcjFzSnBrTVFwaVpt?=
 =?utf-8?B?ZmhnaS9wcDhEY0srUUNHWGlXamUwRGJ5QVNtNXlxcDlOdmFNMzRYcFlrZFhU?=
 =?utf-8?B?VGtvVFNQV2ZDbWFrcmFza2JLcnZVRWpCcm45WFQxYlIveXdRdFNmRE5DeDQw?=
 =?utf-8?B?OGlSVTNoYVQvWm1GRU9rRmNpeURtU29aVVBGVjF6T2FPekFrSk5Ka2duUzB6?=
 =?utf-8?B?eEY3WE5BWW1xejI1RlJMY2VzQnpPckhhMUxVWi9PT2ZnTlNpOGo4V1UxTmRV?=
 =?utf-8?Q?zUfKeeRFMUZAtgrW7r9Bsg2xpneSmqPjFDTo8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FF4700D58B68143B481197AD952F2A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7769
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f36852a-c62e-4c53-3ce0-08dd057ffe9b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|14060799003|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3FxYW1ERjRTZ2Rrc2NWcDhqSXk1amJTdWV6TUxxSlBsYjVyQVczeFJ2aWN0?=
 =?utf-8?B?TnU0S2N1eXpBdm96cEhGbENzRHlmdU9MK2JJTkZYR0N6am9QbXpqNnJCYWlL?=
 =?utf-8?B?dnc2WnBrdTl3OFNXL05QUG1ic1lNczZ3cFBCN0h0b0lDL0d4cGpBL21zanVT?=
 =?utf-8?B?Rkt2NjdVRnRiRk85czNldzN5dG14UE5HcVcrb3hUVlZ5d3lFZGtUZTQ0RG9M?=
 =?utf-8?B?RDZFVDFsR2RGMWF0Smc5VWZSMW95Q1JwL01nRXo4WFhCOUc2UDlLUTBhQ0or?=
 =?utf-8?B?Vi9lVXN5NDVKdEJSd0dJSExMUEFhZERPd2pKcG15aGtXSGRIYThWeGpYekZo?=
 =?utf-8?B?d3A3QXYxaDZTZmZvT1ZWNlVRc3hNbmFrSzVmTktuRFBIdHVJMHo4WGxoOUlj?=
 =?utf-8?B?S3dzL3BsYTIyWlNaZi9pVnEyUVkzV3hCQWd5cHdSMGMrV0syNVB2cXlxUTV0?=
 =?utf-8?B?UkFNZXVCZ3VkQUo5cXlLbjhvVDJtVW9rQTUwWXU5bGlDdGJlWVcwUHc2V1N0?=
 =?utf-8?B?bDNCdjRJY3BMVWJkalRhRHBJSitKcHk2MUdSOVNQaTVBV09MWGRRaUZmSk1h?=
 =?utf-8?B?T3BMMlV3S3lKVllsdFpxQTBJRER3NmlIbzErdkM5NHY3TmExQmxHMVBqbXND?=
 =?utf-8?B?WmdYTXFXaVcxV3pMM1ZMWS9lanZSZ0pwck81L0JuRjQxaklrck1tWW1pbDFC?=
 =?utf-8?B?dGwyNXJadFA3Qmdnd0lneUNYMDA0V0cyYzZlOTZyaHNVdnlvS08zVmZGY1M2?=
 =?utf-8?B?MEtZOVNKMkZ6cWV4bzZoa1ZpZ1VVSkJTZlhJZkUrNHJIWDZ6SVdzZlorbWpJ?=
 =?utf-8?B?c3hVQUgzQ0Z5Umx2ZmNSRk1GaHB6YjhvS21ONGlZK2tkNFRDSDR1b0k2emVN?=
 =?utf-8?B?bnRaQ2xLbUV0SU1RM0Jkcml0YlV4dU5hbklNK2JVZTBMQ3h4VHFhZjh5djUw?=
 =?utf-8?B?ekIvS0ZIRXI0dnVxUkd3N21Xazc5MDBMbSs1dVhKSDY4OHNaWE85UXUrL29v?=
 =?utf-8?B?VjZQNExud3pITXYwbDZvUmVXRHNBZlRvdXI3YXREOWRadzNQWmkzdU56UmJX?=
 =?utf-8?B?WkZ5NGN1UTFDQ1NQbmtHTHpFckRnNTc1ZnV1WHBaVFNTZXROMVA2SjNrazVj?=
 =?utf-8?B?SFJ6SjFVUTJlMGhoMmRiRzhvUXZiZjJ1QmExYktkMzk4Sm9FbXl2c1hNR3VD?=
 =?utf-8?B?NDgrNTl6ZXZ3TWFEMDV4c1dFWGxBUEpySHpudktjUm1oRDFVNVdTVzhrTGwx?=
 =?utf-8?B?N0VGdHlyT3ZKdnVWRXFyK3pRK3UzaC9NZi9uejkwcWg4NW9pSUxRM0hMVkpZ?=
 =?utf-8?B?d05ybHFvVEczV0pUbWlxUld0NUdwMndjZ1llU3hEQnVqQnNFUzVEMzMxWDRm?=
 =?utf-8?B?N0NKNW03V2NYZ2Judy9kY2Y3MllWUWdOakZMRldleGdiSVNOTldpRXhnYlVE?=
 =?utf-8?B?VU9EWEtSZlNKRE9DVWdzVTlvRDcxM3FaWFpQbXVabDNzNzUya3M1SU1yblEy?=
 =?utf-8?B?SVc2aTN4TmJRTVZmRUtFZXJkSHMvbFdTTXdlY2l0YzZITlM1YUc0NExsbUtG?=
 =?utf-8?B?OCtqYmxxcG5rZUdESjdydGtnVDdOUll0ZzZxQU11L2I0bVA3VDUvZXZUdmoy?=
 =?utf-8?B?c3lkVnI0SzIxb2V6c25aSXBySkxzRm96Q3hwd0ZFTFQyOVJaVE1aYy9CS2s3?=
 =?utf-8?B?cS84VEVZTDRqU2FLRDVrQWZ0OWpoaUVpSmswekhZWkZGekVlM1YzNzY4aUhz?=
 =?utf-8?B?bzVERlh5Q2pZU0Q0bENjd20wMDBuVitkRDE3aUtweWQwUnk1cHFkcHZaWXRP?=
 =?utf-8?B?dGhPeVpFMm0xL1hZWlpkZk81dnZvMmk1aFlzb3p2L1pjNnR3ajZVdVVXVHhk?=
 =?utf-8?B?NWl1djVRK1lGVldmem5NQ1NNTjRHS1FrQkpLeFhUOFJYN1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(14060799003)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 14:15:54.6805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c37257e9-f141-47b0-c253-08dd0580048f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6581

DQoNCj4+IA0KPj4gU3VyZSwgSeKAmWxsIHdyYXAgd2hhdCBjYW7igJl0IGJlIHVzZWQgaW4gTVBV
IGNhc2Ugd2l0aCBIQVNfVk1BUCwgSSB3b3VsZCBsaWtlIHRvIGtlZXAgb3V0Og0KPj4gDQo+PiB2
b2lkICp2bWFwX2NvbnRpZyhtZm5fdCBtZm4sIHVuc2lnbmVkIGludCBucik7DQo+PiANCj4+IHZv
aWQgdnVubWFwKGNvbnN0IHZvaWQgKnZhKTsNCj4+IA0KPj4gdm9pZCBfX2lvbWVtICppb3JlbWFw
KHBhZGRyX3QgcGEsIHNpemVfdCBsZW4pOw0KPj4gDQo+PiBzdGF0aWMgaW5saW5lIHZvaWQgaW91
bm1hcCh2b2lkIF9faW9tZW0gKnZhKQ0KPj4gDQo+PiBzdGF0aWMgaW5saW5lIHZvaWQgdm1faW5p
dCh2b2lkKQ0KPj4gDQo+PiBJbiBvcmRlciB0byBkb27igJl0IHB1dCB0b28gbWFueSAjaWZkZWYs
IGFyZSB5b3Ugb2sgaWYgSSBtb3ZlIHRoZSBkZWNsYXJhdGlvbnMgaW4gb3JkZXIgdG8gaGF2ZSB0
aGVzZSBjbG9zZSB0byBlYWNoIG90aGVyLiBsaWtlIGJlbG93Og0KPiANCj4gU29tZSByZS1hcnJh
bmdlbWVudCBvdWdodCB0byBiZSBmaW5lLCBlc3BlY2lhbGx5IHdoZW4gdGhlICNpZmRlZiBpcw0K
PiBhY2NvbXBhbmllZCBieSBhIGNvbW1lbnQuIEkgY2FuJ3Qgc2VlIGhvdyB0aGVyZSBjYW4gYmUg
I2Vsc2UgdGhvdWdoLg0KDQpZZXMgcmlnaHQsIGNsZWFybHkgbm90IHRlc3RlZCwgdGhhbmtzIEni
gJlsbCBkbyB0aGUgY2hhbmdlcw0KDQo+IA0KPiBKYW4NCg0KDQo=


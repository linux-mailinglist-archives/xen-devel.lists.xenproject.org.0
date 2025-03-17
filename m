Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34EBA64831
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916502.1321582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu7A7-00067W-0z; Mon, 17 Mar 2025 09:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916502.1321582; Mon, 17 Mar 2025 09:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu7A6-000659-Tx; Mon, 17 Mar 2025 09:53:34 +0000
Received: by outflank-mailman (input) for mailman id 916502;
 Mon, 17 Mar 2025 09:53:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q9Sv=WE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tu7A4-000653-V5
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:53:33 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af27cc82-0315-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 10:53:32 +0100 (CET)
Received: from DU2PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:10:3b::22)
 by GV2PR08MB8728.eurprd08.prod.outlook.com (2603:10a6:150:b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:53:24 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::7d) by DU2PR04CA0017.outlook.office365.com
 (2603:10a6:10:3b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 09:53:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 17 Mar 2025 09:53:23 +0000
Received: ("Tessian outbound f89894bb7c0d:v594");
 Mon, 17 Mar 2025 09:53:23 +0000
Received: from Lef39d7cf30b5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 29F09B5A-B429-4A7A-B111-44AB1AB53501.1; 
 Mon, 17 Mar 2025 09:53:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lef39d7cf30b5.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Mar 2025 09:53:12 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GV1PR08MB10855.eurprd08.prod.outlook.com (2603:10a6:150:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:53:07 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:53:07 +0000
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
X-Inumbo-ID: af27cc82-0315-11f0-9aba-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eegYrTQSNjL5O6bkyl7bd+kPGQeCQDYVMexY1PgJxvAuRrAFhwr0givjwdhWSpsbDD1MYdNykER4XJVGi7JryBJITFpUBJUUDiC2XEG1bQ+mWF2W/Y+YNlSYiVnZGGH4heVgIJrVCifWsQUr+ulqrygK7irb30XZF9iCcqrgsPrXABMgBIIUiGxeuSUdcvE30JbUQ/R/0BP0k5x35UEBO6dGcsnSdlym68wRGFHUyHxhtcar5U0IzpxtBtytgirrjPWWZNTGJcdEg4nCSR4sumHCsj9IK94dGE8uDccF1GZ0sURX/KLIiCnb//xGL8TFkVrwCbzQrcxVvh+ZUeWGFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61r5a1Ppci2hOBDY25I0/2BHDvS6dUYVtFLGHs1zbFQ=;
 b=db4q7JLyP/b798OtFci2ZI1BoftDomdfix1pOR9chkNGBB9OEo8XsJ6RAk07aEgMK1Ao2Gj0maJKL2BLtbpUdN3+iPFrvIkC/YJeW9WwlFUg9XJguJLps1ZkugnBDAcaP3HEiGKEkp7Zf2gUWDKB5+7LSMNxbYevLY6Rgx5Y6up+pW8UIJo/HFjcMCv1AedS5XitJuDbth39OkpCyLQpLTSHmp+ZG3RmMtCh8B1gvAhAHDZTFioYhmMX9aY9dNDUgDfJaGuPiR39Cc4EYy88b8BRRNesFJ3ar2OmIdkkzUbfAb2oerkLaBSCdngTikXWUJPfIwUFlPLJ6/hc6rj74A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61r5a1Ppci2hOBDY25I0/2BHDvS6dUYVtFLGHs1zbFQ=;
 b=esRdfna6QIfB8hkcXbDS2eNHwk7MBCugF7KMLt46yPPXqNd61VMDC8U97nYp3QMNGAbR+5EUvbvYc95nGCbbjXzz84a9fkp+RPX7OkyDXRFlcGYZEswhcY26iBaZgr8kEZTYk++dHFfqN/E/K4sXHwQX6uE2/dP//O/QEi8aDdM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1bfc06b2bf865d6
X-TessianGatewayMetadata: yWi0y2F+HS4lr6Pv6iHW2fR836+X8s3haz6AD3VLNSreUnOeyYrxm4fx3dyHIkLzDivzT7ZOIl9qAk7DeyB+ZNIdap7q2TJLbDku/nQn7PFgDngctg+swx2Y8cU5P0UJI0AB5kExYjF0sqyIxouolpgEAD9hOZyk+Y6YeaDxXY8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heKXLX1s17uT55CR7SuZPWKx0cvAWFDE3nJV7TjpkXvsOMUVVyhNICmzmHAeA6ywjoWm7X39FPUCrcjEBRKTJSiUELGHYBPlI1ex1/2e5cBC5RiJotlvSHhpnzPlk0Y9kyPIhRvclBU0kQrRiR2WepTHe/G/OSAm8I73e0EVePcxx3EylVrVwLRw/vHg90a6C01xMlwHr4jdcLRnFIkuXCfJ0QN42FUwRp5G2+P7q2z31YUReTt+WTjgXemNkEx/zNw941APYEwHLFM0kLIcK/Ly/pYgDFAg0Ibi5lhx4pU0yCYz1leVj6PC9b5LPndacfMb6HPXyM5TXCDlqlthLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61r5a1Ppci2hOBDY25I0/2BHDvS6dUYVtFLGHs1zbFQ=;
 b=j0uTynQFwN1v49Otr5FhrQtbqpwjJaqcmd2J+TtotPSf+NHHq43Sa98t/in2SsyBQJPo7CjLspxguZqCY2i+AZd1vJg9KPaao1A4UtHEl6GsVS9vizIYOlzAyjTf/63C9FbNXd4BS5enFbIkbrXCSF4Kmrp+3NuvpkAaoEnFy8U0LYXPt9G74yQcBoW5As0jG/Pr0hzIIfAhSFV/5ODDcCTsfpYUQKXQx4JecRICXJ+59ME2lHaCLnu96Je7qa51prk4hxk6urkCe61A+zUKUS0suQIIuMALzcsXGRncgrOUBn6gBW8ayN3csgDNlplTZf2p82iBv05aFKWZ14nEOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61r5a1Ppci2hOBDY25I0/2BHDvS6dUYVtFLGHs1zbFQ=;
 b=esRdfna6QIfB8hkcXbDS2eNHwk7MBCugF7KMLt46yPPXqNd61VMDC8U97nYp3QMNGAbR+5EUvbvYc95nGCbbjXzz84a9fkp+RPX7OkyDXRFlcGYZEswhcY26iBaZgr8kEZTYk++dHFfqN/E/K4sXHwQX6uE2/dP//O/QEi8aDdM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/7] xen/arm: Introduce frame_table and virt_to_page
Thread-Topic: [PATCH v2 3/7] xen/arm: Introduce frame_table and virt_to_page
Thread-Index: AQHblqk5MPCSPLAoTkeN9izbg86F2bN3ENyAgAABDgCAAATxgIAAAHIA
Date: Mon, 17 Mar 2025 09:53:07 +0000
Message-ID: <7C49F36F-998A-4421-85CA-42426154A9E1@arm.com>
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
 <20250316192445.2376484-4-luca.fancellu@arm.com>
 <799e2b1a-aea8-43d4-99bb-eab4fd4f6b93@amd.com>
 <5CDD6327-BCC1-4383-ACDE-19B75C085631@arm.com>
 <4247ad5a-dd96-4dca-aff0-abe6a2fd0aaa@amd.com>
In-Reply-To: <4247ad5a-dd96-4dca-aff0-abe6a2fd0aaa@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GV1PR08MB10855:EE_|DB5PEPF00014B97:EE_|GV2PR08MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: 355ba1d7-a102-469b-f295-08dd65398eb8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ODdxZ0hvemcweE9zcXF4OERwNjcxWElBSjZVaC9Sdlk4YXNTRjd2c1kwbEZK?=
 =?utf-8?B?N29FTGpvOFdKb0QzaU1yZlVHVnhmN0JiZmVFd2xYVzJoSmxubmR6cU9PbGh1?=
 =?utf-8?B?MHRkeGN1NHU4QmEzUXpsSm4wRjVtM0txSGVaMm5yRllJS2pZa1Jvc3JvZi9D?=
 =?utf-8?B?d2Y0WGoxRHA2Vko1alhCUXE3Z05EQVpjSlhWS29zY3pKSSsxSXJndmNuWjhQ?=
 =?utf-8?B?NFhZbkdxbHVpV09QVERnbmMyY2EzV1Y4VS83NUttUjBraDRpa2tYdWZ4QUxS?=
 =?utf-8?B?ZlJIRysxTlZpOHlSY3RSWEtaZHJFNzIrRExPUy9zaytXOE1Wa1BJZVlZTEEr?=
 =?utf-8?B?akZMN2lYV1FhWFA4M1BqaXp5eEtLelR6eGtuTUE4blpxVktkcERYZkVCOXV6?=
 =?utf-8?B?NmR2QjY5S2MzSE9vcHQxS3ZNN2RQTTVzZHh0ZG54MUxxTzB3STJvS3ZUVk5Z?=
 =?utf-8?B?MlNHZ0hKSTdoMEJSb0kvOTBwYjZIZTNsV3NRNlUvM2hxNFFxaGRPMjNOa1lL?=
 =?utf-8?B?dS9tdUlhQ2hOWmp5QUlWSERoUS9Uam43WHczaXdWQzVVcFFPaUQ5UkpmOEpu?=
 =?utf-8?B?NVlDOGtNYlpZTnJVWm9BRWxHMS9BOXRIRjlOTmd3Y1E2WXBqbkwyNi8xM2cy?=
 =?utf-8?B?Y2R2emNrV2I2M0ViWWNINTUycDBzT1RoTk1vamFrWGdJRCt6ejQzUHR3Z0dw?=
 =?utf-8?B?V25aUUpWS3BWRHFCY3hyU0NaQkdhc21DTjhmaVgwaXRuZ0x4R1c5c2lRN2hx?=
 =?utf-8?B?akk5Q2xSWnVNVU1oRkx4SVNibG9hU3FNN1NHZlo3bURibTdQS3VnWEt3YjNp?=
 =?utf-8?B?S0dpYjJCa1cyZmZpVzJmbkpkQ3hlb2dUT1k3d2dxQXdkbDhmMUJ3ci9tZjVy?=
 =?utf-8?B?cDUybDUrb2s3cDJ2VWVlUTFpbm16K2RQQnBmODNUT1dyTVB6Q1RQOE1UTFRL?=
 =?utf-8?B?K2FIOHlpNGFaSW1GbUdWNzRpcnNiSUNqUDNjVmdnMHpXRWQ4Sk9FZFQvdEFk?=
 =?utf-8?B?UXZrWGFCdEJObXFOZEEzd0JSRUpxM3VmSG53ZWJZdG5kK0dEVkMvZW1JbDJP?=
 =?utf-8?B?Uys5dVlPQTZURzA3UTVkLzlxTzg5b2lwMWhNUW1Rc2xacFV0OFVxSDdOT2Ru?=
 =?utf-8?B?eWFtM3FWMzRmNUdIMlc1dWNzRUQ5MWxkWEFkRk9xcUYvTVE5SXkyT2NIZmZr?=
 =?utf-8?B?RG8wQ0l5SjdPb3NVdHR6UGltUkp3N3NLS3A0VVRuSnNyZlBzSWhTQUNPajkz?=
 =?utf-8?B?YlJwOHFXQXptaXJxNUZtQ0tBY2lqZUF5dlAydVcwMEJTL0pING53Y3hmd284?=
 =?utf-8?B?Q1lKaVJMWUJJUUwvUnJNTysyK3ZtNHpiYmRLeDRjZVVoakJhMVkvU1pZTUZi?=
 =?utf-8?B?dXlFYlVDaXVBbzNTektUb1h4QzF2R2dleFN2R0hZMjBIc2RZcDJ6SFhtY25O?=
 =?utf-8?B?S0tWN1hXKzNxdjVKcDFxZ2dwby92ckFnWXVpb3ZwQ0xuZzV1eUF6c1owWlh4?=
 =?utf-8?B?U1lzcnlhYVM4QzU2YnhsSmY3WmZWNEVsWVU0UHN6OUkwNGJqSjArYmZObjBT?=
 =?utf-8?B?U2NwdUFJb0IyQ3R3YkVIVlhMVm9VZnlMUkVYcXVWazMvSzN4aEJkR2lwSmsy?=
 =?utf-8?B?cXpSUGZBR0NmUk0xUGptYkxDOWF5VzN6bFNlTDUvbVRHNWROcjd6WUhJbi9L?=
 =?utf-8?B?ckpQYnpLQ1o0UmVCUXk5KzlRUytWSWlkcmRwaDJWZFgxRjMrWENmVjREZ0hH?=
 =?utf-8?B?a0U1NVltZ3VFUmdhN1M3dTZGdUpnaXkvM3dPV0p0aUxiV0JtQkJCN2xWYzlB?=
 =?utf-8?B?MGdKTk8rSUJOMUFoT0dJYlBhLysrL2wvZWF5NEtkT0N2VW5YTzJCRlIxMVBx?=
 =?utf-8?B?NXJZNlJGdE5hMGJVT3NqRnlUTFI4ejVOUzVIUm5iVkNRNXBUeUFQdHJTMWhD?=
 =?utf-8?Q?h7D0suo7sbrOwH1+yvVODcNtYM+mbO7C?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <062B301447F7E549AD7725EF23CABDA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10855
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9979fbb5-6616-45b7-520f-08dd653984be
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|376014|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVZ6VXZIWElURS8xQm9OTWtLNW90eTdVRnNvSGFTUEVoTzdLVWVpY3lCMUtm?=
 =?utf-8?B?eWZLK3pDWmFaV2JKdE9EdGRiejEra292N01UNDJEV0FxNllBR2FaMzRxTFRp?=
 =?utf-8?B?QjEycTZxNFdNRThnS0NaMWxUL2dZZ3czdEZnLzFUUkg5dUNUSngzWWdFU0ZD?=
 =?utf-8?B?cHduSzJhNEEwVFE3MEtIeWM4bmM2dy9GRkdZQWQ5RE5OMHliRVRiM1NYcXpL?=
 =?utf-8?B?RFVHeE1oZnNnYVM1MG9zVnVSekptYUpQRUVSKzlYcDR0QTdVbyt0dFcwcmpD?=
 =?utf-8?B?aXRKOWRtajNLbU8wdUlGbmFFMnVkdy8za2UwMkVyci8xOEtLN0NZcVJKenJ5?=
 =?utf-8?B?bWo0UFZFK0pyZndyYXd1cHh5RitqSnpIeWJiaG1qeStjdmp6ZjlVRXB5bSs5?=
 =?utf-8?B?QzFUaGpROWJlVVpTNjdHdEtpdlJBdE1tcUhwQnNvbmsrM0JaUTVXK21ROHFT?=
 =?utf-8?B?czFWNlNTOW9yZkZUdzFhL29XZmlkcmxDNE9TNHQ1Z1JZSlVVUHZYOXJNSjVQ?=
 =?utf-8?B?Z2tTQUwybWNSd0J3QzZUL2hONDRuNjNNaGltaUhHbG0zRWRCbk5jOFlCUU5F?=
 =?utf-8?B?emo1cXB5YURRVDNxZFpVbi85SGxQVkJ6SjZvbHpacTRFc1FQUmZqMzhYa0xZ?=
 =?utf-8?B?MXNFRkRjS3ZPd0NlRTlWM1ZwdDFqTHdNeFVsbHZ6blgyeXNKWFdEVGFPbXpt?=
 =?utf-8?B?aGhpQWNCME0rOXZ6dlRlVEQwR2NYbjJIZHVpK1ZqSWs1SGNES1JBZG9JSUQ4?=
 =?utf-8?B?MzNpZHpiV3FHNGg0RG9iSzFxa3Q4dlRoRWdlRTdwUnBVS21WR3dNQVY5WGRz?=
 =?utf-8?B?ZGVFamRrOXF0QVdHUVZZSlFhaTJQT0x1K3Q2eVFOdE42ZW9sOU03N0JYS0Za?=
 =?utf-8?B?eVd4NU5BOFhzbjJtK0V0UC9PSHdnazR6RmF3L0FBeGlZUUZIYmlaL1dZeDZO?=
 =?utf-8?B?bzMvYm95TXFUVXlhdHBjRjJaRHplbXdnUlNHMlcyaWEzdS9CSjNaemJYUUIr?=
 =?utf-8?B?UXNJZlNiVG9LUzJBVmRPTnQ2WHlMb3RRSXB1K2tLYUliU2NVcjN5TnBKdUxN?=
 =?utf-8?B?LzJneUtpUlZkV2cyZFV2TElEOTN4dWRtNEcrcU8xMVJPaVhwVjJyczYzUGth?=
 =?utf-8?B?UjBxc0hHUm0zbkxVQVcreitFa2EwbTk4VU9yTzBUM1gxUS9EMVJETEoxMEZG?=
 =?utf-8?B?V2IxNC9saWdad1YxVU5STW50ZUNzSU56WENYQ0RJNWlXZzF2cEM4VmREMGw4?=
 =?utf-8?B?RkRKSzlmWmZrZ2FxbktrS2dlZHgvVEQybUtpQ1hXRTBTZjBxejczcGFWQXJn?=
 =?utf-8?B?OU5peHdxQjZ1dmJSZXdKQU1lUnJxa3NhMWJodURnU2J3WlZwNmtYSjBOWllC?=
 =?utf-8?B?RW02NjJSRWh0MXA2VDAydjZGbU8rUDlHS3ZTa1JJQll5VGh1bWtEYWJtSE1N?=
 =?utf-8?B?ZERIUWxabEpadzVCRFpJakR1UElzUFZpcGFDTnBzSGJmekcwbS9NSXVnSDhX?=
 =?utf-8?B?ODdCZkE2WWsyOGxibFc1eGRyN2hHVEN4QU9VNEt2dGtoYTRRS05DNmpRZjVn?=
 =?utf-8?B?Skc2MXhGbEtjVTYxaDZaUXd2YVVGNVA1bVV4d1JqNGpuSDlKUzNDa25hVjl3?=
 =?utf-8?B?TG51UER1N3BLR0FKUzdrR3Eyam5PM3htbHA2WDdzeDRPK1VZSi9Qek10RjNn?=
 =?utf-8?B?YTVjVE55UW9vZW5TK0ZaQU9xL3Z0Ny8yRjdIMmVWRkVSTlFPOTRRSWRkZmFz?=
 =?utf-8?B?RXkxZlpNVk84NmhQNEtDMFltV2VRQlkvSGkwblFkTy9aWHAvZFBBVEZldXlL?=
 =?utf-8?B?bHFzd3dtMlVkSjdkUXRGdEZWQ3phSloveEljWFVlQ1JEK1J2RW1TdldZaFVO?=
 =?utf-8?B?QzdhVCs1NXhXdTA5TCthS1JCcjdmWFhSYUNyeE51WTR0NXRCc3hWOUQySFZX?=
 =?utf-8?B?cXdDTXBHZTVXSEVydTdiUncwM2U3eGQ4N0RaSzhtUkRmSVUrUkhqa1ZTaGlK?=
 =?utf-8?Q?rRcCHx0pgz3/nbE2yKbtfXnJI6KmD8=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(14060799003)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:53:23.8505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 355ba1d7-a102-469b-f295-08dd65398eb8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8728

DQoNCj4gT24gMTcgTWFyIDIwMjUsIGF0IDA5OjUxLCBPcnplbCwgTWljaGFsIDxtaWNoYWwub3J6
ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE3LzAzLzIwMjUgMTA6MzMsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiANCj4+IA0KPj4gSGkgTWljaGFsLA0KPj4gDQo+Pj4gT24g
MTcgTWFyIDIwMjUsIGF0IDA5OjI5LCBPcnplbCwgTWljaGFsIDxtaWNoYWwub3J6ZWxAYW1kLmNv
bT4gd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4gT24gMTYvMDMvMjAyNSAyMDoyNCwgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiBJbnRyb2R1Y2UgZnJhbWVfdGFi
bGUgaW4gb3JkZXIgdG8gcHJvdmlkZSB0aGUgaW1wbGVtZW50YXRpb24gb2YNCj4+Pj4gdmlydF90
b19wYWdlIGZvciBNUFUgc3lzdGVtLCBtb3ZlIHRoZSBNTVUgdmFyaWFudCBpbiBtbXUvbW0uaC4N
Cj4+Pj4gDQo+Pj4+IEludHJvZHVjZSBGUkFNRVRBQkxFX05SIHRoYXQgaXMgcmVxdWlyZWQgZm9y
ICdwZHhfZ3JvdXBfdmFsaWQnIGluDQo+Pj4+IHBkeC5jLCBidXQgbGVhdmUgdGhlIGluaXRpYWxp
c2F0aW9uIG9mIHRoZSBmcmFtZSB0YWJsZSB0byBhIGxhdGVyDQo+Pj4+IHN0YWdlLg0KPj4+PiBE
ZWZpbmUgRlJBTUVUQUJMRV9TSVpFIGZvciBNUFUgdG8gc3VwcG9ydCB1cCB0byAxVEIgb2YgcmFt
LCBhcyB0aGUNCj4+Pj4gb25seSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIGFybXY4LXIgYWFy
Y2g2NCwgd2hpY2ggaXMgY29ydGV4IFI4MiwNCj4+Pj4gY2FuIGFkZHJlc3MgdXAgdG8gdGhhdCBt
ZW1vcnkuDQo+Pj4gV2hlbiBtZW50aW9uaW5nIHN1cHBvcnQgc3RhdGVtZW50cyBsaWtlIHRoaXMg
b25lLCBpdCdkIGJlIGJlbmVmaWNpYWwgdG8gcHJvdmlkZQ0KPj4+IGEgcmVmZXJlbmNlIHRvIGEg
ZG9jIG9mIHNvbWUgc29ydC4NCj4+IA0KPj4gU28gdGhlIG9ubHkgcmVmZXJlbmNlIEkgaGF2ZSBp
cyB0aGlzOiBodHRwczovL2RldmVsb3Blci5hcm0uY29tL1Byb2Nlc3NvcnMvQ29ydGV4LVI4Mg0K
Pj4gDQo+PiBidXQgSSB3b3VsZCBub3QgYmUgY29uZmlkZW50IHRvIHVzZSB0aGUgbGluayBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UgYXMgaXQgY291bGQgZ28gc3RhbGUNCj4+IHZlcnkgcXVpY2tseS4g
U28gSeKAmW0gbm90IHN1cmUgYWJvdXQgd2hhdCBJIGNhbiBkbyBtb3JlLg0KPiBXZWxsLCBub3Qg
cmVhbGx5LiBNYXggcGh5c2ljYWwgbWVtb3J5IGlzIGFkdmVydGlzZWQgdmlhIElEX0FBNjRNTUZS
MF9FTDEuIEkNCj4gZm91bmQgc29tZSBvbGQgUjgyIHRlY2huaWNhbCBtYW51YWwgKHlvdSBjYW4g
c3VyZWx5IGZpbmQgdGhlIGxhdGVzdCBvbmUgYW5kDQo+IHByb3ZpZGUgcmVmZXJlbmNlIHRvIGl0
IC0gbm90IHRoZSB3ZWIgcGFnZSkgYW5kIGluZGVlZCBpdCBtZW50aW9ucyBQQVJhbmdlIGFzDQo+
IDBiMDAxMCB3aGljaCBpcyA0MGJpdCB3aGljaCBpcyAxVEIuIFdpdGggdGhlIFI4MiBiZWluZyB0
aGUgb25seSBDUFUgbW9kZWwNCj4gaW1wbGVtZW50aW5nIEFSTXY4Ui1BQXJjaDY0LCB0aGF0J3Mg
c29saWQgaW5mb3JtYXRpb24uDQoNClJpZ2h0LCBJIGZvcmdvdCBhYm91dCBpdCwgdGhhbmtzIGZv
ciBwb2ludGluZyB0aGF0IG91dCwgSeKAmWxsIGFkZCBhIHJlZmVyZW5jZSBhYm91dCBpdA0KDQpD
aGVlcnMsDQpMdWNh


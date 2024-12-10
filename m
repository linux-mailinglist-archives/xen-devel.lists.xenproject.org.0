Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9928F9EB4B6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 16:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852749.1266461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL25N-0002xs-E9; Tue, 10 Dec 2024 15:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852749.1266461; Tue, 10 Dec 2024 15:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL25N-0002um-AV; Tue, 10 Dec 2024 15:23:41 +0000
Received: by outflank-mailman (input) for mailman id 852749;
 Tue, 10 Dec 2024 15:23:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3LGp=TD=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tL25L-0002ug-Ml
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 15:23:40 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baa66576-b70a-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 16:23:38 +0100 (CET)
Received: from DUZP191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::6) by
 DB5PR08MB10164.eurprd08.prod.outlook.com (2603:10a6:10:4a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Tue, 10 Dec
 2024 15:23:34 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::ad) by DUZP191CA0012.outlook.office365.com
 (2603:10a6:10:4f9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Tue,
 10 Dec 2024 15:23:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 10 Dec 2024 15:23:32 +0000
Received: ("Tessian outbound b1586bb311c4:v524");
 Tue, 10 Dec 2024 15:23:32 +0000
Received: from L32fae9d7032c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F2F7C41-8A61-4BF1-9A60-721D2B33B88F.1; 
 Tue, 10 Dec 2024 15:23:26 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L32fae9d7032c.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Dec 2024 15:23:26 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by GV1PR08MB10503.eurprd08.prod.outlook.com (2603:10a6:150:16a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 15:23:24 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 15:23:24 +0000
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
X-Inumbo-ID: baa66576-b70a-11ef-a0d5-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I8TKGExsqMS7kEyH1HGB2iABCpsjFtABavcEKKWXms8cPaT3blY6WoI8CvBkKWCv98LVL4Z/deJqDWvkNqS5QdmhIea38K+v1g/6G/sUKTCIL0QkrvGkLVyKc9fqEfLUi5QgRpUkR1vZCaGGAK1KbP9Q35h8xQ4qNTYaSHVO1Pijdnu7Lzl4nRXfKCtGmZpa9mmRIg69/rFVjCUvGJ7E/vtqWDjrJHGLLQaClGSj9ZUXNArbFAbo8Zefg+5xYt87StkqpEoCv6BoSBMaeSOcM6fXZxUP79jCsA56OIqQ+Ji3JnguQo9X9S8vhvsyLRNZRBoMVKk9CxuHASqQL1+Svg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqDKqoHswHoUumjOcdGZj78TBiNQbQgoGNZSJzRwtxs=;
 b=YYT6WUXEoipXzVL2PrAKxMxTH926+8lIldlbEH0bp1llOt8TiNgUZpP1DdG35A/cx6EEHM69X5vXhST+t7+xHquuNI8NfA7SU7L3g1N9uKYQa5jaLJBUh9FZcqTmVrU2w1KOOER0b6qeO8ni2MrspD3rWrVwGY2TKFtPfOVYe8lOTU+rUeNVItG8TRwIDGGXghH2RZkSCNkkzq47auUQg5lBMK/BtxfH2td6vwMJ+6nISDIWE0p22mKJHCkff3+Z0gKhlT2ne/KM/WEujJDs3Uo1XKVfehzCvbPcF6u2Nh3rgzb16qzng6De+HD/hfmD+32RZvhQCboTTyJsHRidjw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqDKqoHswHoUumjOcdGZj78TBiNQbQgoGNZSJzRwtxs=;
 b=Swp0LPA2qs534y37gOvxXn4FXKeQAUWS9QOV5sCUp7TGKcxJ9nwsWbRotcqvXCyphlbZCODNB6Fsr63n2FBcC4nagKKheF8YL9UZHPTwDb8m/dUt2SwiZc3PEKlhRIBoaCLdPjNQFkyhUEyMoh1EipjIOkJzSfSUXSSdHzj08PA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6838905a198f812
X-TessianGatewayMetadata: Xvz1KgZgyOCSk1lSZb/Pqk1zp0nKQdLihH0nXzSnypCS17SObXbGQn98DePxHMt+/ym8jjA4hKBNWtkYHyv1A6EYmF76gwZpghjLcdPUvMi7l+tXwmJgUSmhCPyllVH97f1LokT9sZ8FzA9uCIGapVzYWjBPhadwtavJt0VqsAY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwB8hVME3oQDKdNkomX/BTcQ5VaB8YMllzSnydL0a4WtHi/QBcbMwiH58SxcwDZhZQKmGTaR58AmWYpujfpPZviPUK21tzsoVMHSb6pBkgU4Npw7reTiEOY7No7A9fg4JL3BpfvhflgZyworORZaHf3GXjSsUKqziPjHqDtst85hM0MGfOEWHkn4iVfw01kymWd5zJ5IyaG75B3wMDiXqoVNOqLRpNijtiiVpPNl0smqd7vW3zjFRBZyRs0OLjd3ddFycGmeNZ1u1QVIkg25HW3PC8B7vtYY0gpXUMDOtk370zEuLi543Ko/UOpCfGB1Nbg/DVkiYKjzDKadYVBlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqDKqoHswHoUumjOcdGZj78TBiNQbQgoGNZSJzRwtxs=;
 b=AAvA9E+3qIih33wmW90ExZGPKu5PYEWpqQr1Cmc5AYUnJKjGOwGDyIdIKK/cbAFhuFW+8AwX0nFGxC8BWT+xjWWSE7Pc5pB8myGd67JRvi4sSiqsZIUCW7PNQSm/uKtojXCkZ+8srszCKijKeLdqKn36Gh5m/aC4JUrphh0y70MxhmXj51gVeCHtfqWwkctlAc0Fr3+71ii5C0w6Cy5ae6WKM80yJRSDQ5C+x7xTinl6U+iLkkK1whSbCJE8WO7UTxzhr8wwrt5jMWJLsVu3sVJfDVfIC5bYKJfmxhUaFyBxFmSViG++rasA6VP/h5iHl34cvsN34Y3CTINMS2jyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqDKqoHswHoUumjOcdGZj78TBiNQbQgoGNZSJzRwtxs=;
 b=Swp0LPA2qs534y37gOvxXn4FXKeQAUWS9QOV5sCUp7TGKcxJ9nwsWbRotcqvXCyphlbZCODNB6Fsr63n2FBcC4nagKKheF8YL9UZHPTwDb8m/dUt2SwiZc3PEKlhRIBoaCLdPjNQFkyhUEyMoh1EipjIOkJzSfSUXSSdHzj08PA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/domain_build: Make find_unallocated_memory() more
 generic
Thread-Topic: [PATCH] arm/domain_build: Make find_unallocated_memory() more
 generic
Thread-Index: AQHbSuu+5rMu+POVOUWRmNRoDUJ5vLLfmOuA
Date: Tue, 10 Dec 2024 15:23:23 +0000
Message-ID: <093FBC90-7C6E-4ECD-8D9E-3D1DFBEAF435@arm.com>
References: <20241210101001.91578-1-michal.orzel@amd.com>
In-Reply-To: <20241210101001.91578-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|GV1PR08MB10503:EE_|DB1PEPF000509F4:EE_|DB5PR08MB10164:EE_
X-MS-Office365-Filtering-Correlation-Id: 6223400c-cc7b-4770-f2f6-08dd192e9bbf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MHNYaGNqaFNFRVpEQlBmVWN6bEtXSlg2eE5jbnFxMkRkS1EwYWhtS0Q3U1dj?=
 =?utf-8?B?bzZVaFFidHdNS0MxQzdFdHNFcFdHTDVlMlB1TWx3Tkh0WGJNS3l6Rk9SQWxs?=
 =?utf-8?B?dVgwK05NMDJJVlgzYXRuei9wRG5seVY3dzN3QVg4RTUwYTNZVFZwaFNrREZp?=
 =?utf-8?B?V2ZWQmNIeGhRalI4aElGSUhlSHJuSnhnWC9XeEo5NTFkTmFWdVRFTkgyL3ZI?=
 =?utf-8?B?UzBZa3RVMGdlTjBCdjZ6NmpKRFN2eDNpcTJqODc0eWxCZ2ZEUGZEZzFNSlJ6?=
 =?utf-8?B?R2ZIZmFmVUw0L0U4TFJ3MlY3cmVZbjBXVzFjb21kOHgwaVhTS2R4Q3V0dFlO?=
 =?utf-8?B?N0Jxak1PZTl0K1RpQllmTkJ5UXFZbXV3OWpNSFhwSFUvbWNxQnBLQndjdE80?=
 =?utf-8?B?MTNLTnVmRVZNcm8yOEF5cGRKUTc4T1JBM3ZzTERCS1o0SzgrTVhvOVphZ2NN?=
 =?utf-8?B?L0pKZGNjcTJpTWpKMDM4T3JOT0RiUWxjTEcxMUFmSW8wQzFGZlg2NG1ZdUVU?=
 =?utf-8?B?cloyZDhWMWUvSC8xeU9jcERNSzVxbEMyOVQyVklOcHIybllNd3ZuZG9reGYx?=
 =?utf-8?B?VGpPemkxazRpeVl6VlRkUnNTT2JGbnpRWW04T1R1U0ZJeURvaldxTGF3em9T?=
 =?utf-8?B?dVdrU2tlZ1UzVnpScnNnb3dVZndJL1F1TnhSVnVqcnFkQm93M015RVJFSGNr?=
 =?utf-8?B?am5peGE2c0lGZnkyblFrYXlEdzVXb2lGK0tyUEw5cVBPcXJTSHJ3QmJ0ZGpk?=
 =?utf-8?B?MVlSMU1zWnZqUkR2bzRQT3Q2dmdtaHdkUkxKSm8wNE9ZSWtjUmZpTFhNb0J0?=
 =?utf-8?B?aGtDUm1QQmJBWkRTcmlNemFYWG5xMzJDclZlMHNwK1kzLzBMa0N6RDdOSTJq?=
 =?utf-8?B?enZqcThNOGtMUVQrQmFFdEVyM085d0ZnbkJzMXBSVTczZ2VRdUpNYy93NVpx?=
 =?utf-8?B?TkdJQS9ZS2FPK1dPZWtLSG5zbW9CS0xSZHpITkhVS0ZaSndOeHdscjhXTWNh?=
 =?utf-8?B?N2tJRkJPN2FIY2tJbTBXM0EwaW9Mb2JGQkRzUHBoMEdpcFZXOVRGQi9oaXc0?=
 =?utf-8?B?L2RXL3RKU29vNnFhTkJiZk5aclpHQjBxQ0hYZ3RrRWFGeThVNDluQVZxZFdp?=
 =?utf-8?B?TUpMcmFxM3hJaTRQNGc0TENTdUFaa3RiQmtqTnpHazVsUFVxWDc3d09lNFdw?=
 =?utf-8?B?eGc3dzU5V0Y3cHQ4REpHM2dQS2p5KzgyWTdlZS8vZVRBb291WDZ6a01YeFc2?=
 =?utf-8?B?MWZITlBiQzUrWi9XbUt5Rmd0VDYycnIva0g2WUlmMGdXVjB0aSt1aEVNWHBy?=
 =?utf-8?B?dG9NUEI1dEdybDV6MHl4NzhRcXdJNTFMWDdPdnhDT2xHLzA2djNZVncrZXRH?=
 =?utf-8?B?Z25nb2gwR3VQRmh2eXVPUWg2WjdKZXVoUjFZRDkxdVFmTk5tdGlQYmdETXp6?=
 =?utf-8?B?a2granFFMG1KYk1OZkg2cWoyd1lwQ1FCMm9HaFZwL3QrM29iSER5bFA0eDhT?=
 =?utf-8?B?SGdPNHhjcDV5UUMrL2dQR09iNGpwUS9xMHBBMHU2NVU3SURkMEJGN0tmQk9a?=
 =?utf-8?B?bXJLY3ArTUV1eDRTZVlkeUUwdTQvQlZkZjR3VzlNcFBVUWp6YURtdEY4N3Rq?=
 =?utf-8?B?c3VpTk9lVHh1VWdyK3dOaUZxK0J5TnZCRS8raHQvOWRPQWJ5LzZzeFVFZ1RL?=
 =?utf-8?B?bGJlMmNPcmhhS3dXYWl4OXdiSG83c1VDR2RocXdmQjlMaFVVV2lVejBjT3lo?=
 =?utf-8?B?bkV3bDh4YU9TUDJWUjVYWHJtUDBJSitsWTlnNUZ3NFZOQWt4clRFNUtoNll3?=
 =?utf-8?B?SDFjR1BOeE4xRnM0cURiOFRnLytZVE1MTnNqalRsV2dmckd6NGt3dWJjQ25a?=
 =?utf-8?B?OXJDYWFqRldUd0NmK1dOY1VneEJxRjM4YkNyeWtzWWcwZ3c9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <46541C600F01D84A999BDEAF44CF9801@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10503
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	366e325e-76ac-451d-49c0-08dd192e9676
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|14060799003|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2xwdSsvSHdEMDI0RkV4ajNVN1h4enYxbjRCeEZaUGJMTWtac1BCVGJOeEFL?=
 =?utf-8?B?ZWJscEJHMG9LcUVVcnZUakRvTy9GRHRsNmowRFdTY3FMYUlEQzZlZUYvRW83?=
 =?utf-8?B?Vmg3VHdWL0tpRDlIRXJWa09vNUpMOXBRREtaQ2JleEJ4WjBCeVNlYnBDaWky?=
 =?utf-8?B?Q3RSTW53VW93ZzVDaU9IK3ByaU9NdnFnOUtEekFGcW9kQlljUzhnTmVheHRx?=
 =?utf-8?B?WUFhOVJDT09KSVNmcFBhVnUxSVpNMGwrY3hLSldaQ2JLOTdsdkdjbGoveGFr?=
 =?utf-8?B?OEhycmdVU2lubEV6bDFXcmZ5STdpT0tEQXY2VVJ0dmdnS3ZNTDg3M2ZJKzNq?=
 =?utf-8?B?NzA4dFRpY01CVmgyMjhaVkNNb1kzaSs4VHBRTFN3bjBSNnZURUVWNGtnaHI5?=
 =?utf-8?B?dDFMNFM5cWs1T20zK3NvYzVIVCtzYlJNRzZIblhDM2RMSUdXb0dScHBNb2JM?=
 =?utf-8?B?Z2gxTW8vRWNvZTNFTm5GU0I2MjNvZENIaGlTWm8vV1dOOTcwY0NNdFN0Sm9K?=
 =?utf-8?B?S0pxQmYyVkY1WnJxT3RVanhEeEJZVThzQkp5L2tBREpDOFhUWEM1QXFvL212?=
 =?utf-8?B?Vnpkd3FFaVpmRkZ6RWkzZVVOWGdYcVVmN3FsdjBrMTF4b0phWm1wK3JHN0hO?=
 =?utf-8?B?UE1iQTFuREgyRmhVWUxsdE9oaU5waUxZV0pMRTZuTVdMZ1A3dyt3RDh5MVNw?=
 =?utf-8?B?aWpuTTc5WlVBMW5ObkY3Q3A3VzJRYzhJUGFsTDNZaDdySWhPSVJpa2FrRFlX?=
 =?utf-8?B?Smh5VkQyRzN5VXp2dGlsWmF6T3gzVmVJZ1NCbE5xZU1WUXRiMDRJOFBYMERk?=
 =?utf-8?B?amFOWlJtREZybjh4RGFMSGJxanc2K2NRR1g2blBjb21VTUsvcmd0eDdzR29G?=
 =?utf-8?B?eHN2a05nM0pKd1pkZmlyM2hGMTl2cFNtNXRjcXE0MG1zUVY0eXUxVjJ1U3ZL?=
 =?utf-8?B?eTJTNUZFTnBZY2M3Y3p6Ryt4TWFyRlBiSmFGUFZ3eHR1TkhNckRGMWd4YnpH?=
 =?utf-8?B?Q0tnU1BJYmprSklVSXBERlR2RGxuMWc0L1BUZkQ0K3dIeUV2MlI0K2JoQmxx?=
 =?utf-8?B?R1h2UU16MnFiWThkLzhyNDJHY2hDWTd6Z1JUSmRuMTRkRG9pZ3gyZXdDSmQ5?=
 =?utf-8?B?M0VVRHowcVdXM0c3WmxrVlpLWXU3TkdCSC94RWdscmVTcmRvT0h4cG1ySDhy?=
 =?utf-8?B?bkxabUhzbmVQVTh4cTNscy9jRVhobTZPNmtvK2trYURMUGY5bEo4Y3E4UHZx?=
 =?utf-8?B?bjArYU55c2h3b21USTZrbWF1WklSVHROV0dhSDl2WEJTNUZyb0xVdVkvelcv?=
 =?utf-8?B?eVlXY3YrUFJUbERuYkhEVkl6WkxTUUNRaktHaks3OWxxME9oYlVFaFJ5U0sy?=
 =?utf-8?B?QlZYTzc0dGxZM0EwbXc3bUpzMHZTaWJjWW5rUnp2bkZKVG8zbStkVnFoVHNm?=
 =?utf-8?B?S0lSTkRZaXROQ3h3K01GS0Y2aXJ4a1E3MUZKMVoxd1ZmRGUrVWM3WGE4M1Ix?=
 =?utf-8?B?NHQ0U1lFRHFBSnlxM0xJL1VGNVJ5NTNVR0k1aFc3dTdGam5zc05GUXNMZXh1?=
 =?utf-8?B?VHA3bVRCa1RFbDh0Y0d2UVRYb2RoZDlZQ0VEQnVLWG1KdWdMdzBKL24vMC9S?=
 =?utf-8?B?WXgyelpRYVNuaVpGZm5uTk9CWUZsTWx4RVRkR3BINnZrTXQ4QUdIVmNBWmNu?=
 =?utf-8?B?dy9PZldEYjVWL0N3aURML3JBMU5OcDZSU3JnYlZ6aDkrdzRGRkpja0dkYW56?=
 =?utf-8?B?dGFtWHB4aEZSS0Z5OTRuT0RNcG9kSC9RaU5oQW1UTTltWTRLejFHQzB2TkJl?=
 =?utf-8?B?K3lJTFgzU2k4ZHVWV0oxWDVNYWZRckxYcTk1a2xxNGpYd3VsYmZzZVFjeGFB?=
 =?utf-8?B?cXFQNEtTR09OUEN3eEJpVlczZk5jbm9zKzFJR0NBamVmYm1nU01SOU5SNWxJ?=
 =?utf-8?B?NTZtd2lLNU5Oc1kyL1Rucmo4VEhHZ1hhaEwxSnFVZnZRU2tZM1NRTDl6dUg0?=
 =?utf-8?B?eGJ2cStxZUJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(14060799003)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 15:23:32.8247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6223400c-cc7b-4770-f2f6-08dd192e9bbf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10164

DQoNCj4gT24gMTAgRGVjIDIwMjQsIGF0IDEwOjEwLCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEF0IHRoZSBtb21lbnQsIGZpbmRfdW5hbGxvY2F0ZWRf
bWVtb3J5KCkgaXMgb25seSB1c2VkIHRvIHJldHJpZXZlIGZyZWUNCj4gbWVtb3J5IHJhbmdlcyBm
b3IgZGlyZWN0IG1hcHBlZCBkb21haW5zIGluIG9yZGVyIHRvIGZpbmQgZXh0ZW5kZWQNCj4gcmVn
aW9ucy4gSXQgaXMgbm90IGdlbmVyaWMgYXMgaXQgbWFrZXMgYXNzdW1wdGlvbnMgYXMgZm9yIHRo
ZSBwbGFjZSBhdA0KPiB3aGljaCBpdCdzIGJlaW5nIGNhbGxlZCAoZG9tYWluIG1lbW9yeSBhbHJl
YWR5IGFsbG9jYXRlZCwgZ250dGFiIHJlZ2lvbg0KPiBhbHJlYWR5IGZvdW5kKSBhbmQgaGFyZGNv
ZGVzIHRoZSBtZW1vcnkgYmFua3MgdG8gYmUgZXhjbHVkZWQuDQo+IA0KPiBNYWtlIHRoZSBmdW5j
dGlvbiBtb3JlIGdlbmVyaWMsIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgZm9yIG90aGVyDQo+IHB1
cnBvc2VzIHdoZW5ldmVyIHRoZXJlIGlzIGEgbmVlZCB0byBmaW5kIGZyZWUgaG9zdCBtZW1vcnkg
cmVnaW9ucyAoZS5nLg0KPiB1cGNvbWluZyBMTEMgY29sb3Jpbmcgc2VyaWVzKS4gQWxsb3cgcGFz
c2luZyBhcnJheSB3aXRoIG1lbW9yeSBiYW5rcyBhcyBhDQo+IHBhcmFtZXRlciB0b2dldGhlciB3
aXRoIGEgY2FsbGJhY2sgdG8gcG9wdWxhdGUgZnJlZSByZWdpb25zIHN0cnVjdHVyZSwNCj4gYXMg
dGhlIGxvZ2ljIG1heSBkaWZmZXIgZGVwZW5kaW5nIG9uIHRoZSBuZWVkcy4NCj4gDQo+IEFkZCBm
aW5kX2hvc3RfZXh0ZW5kZWRfcmVnaW9ucygpIHRvIGJlIGNhbGxlZCBmcm9tIG1ha2VfaHlwZXJ2
aXNvcl9ub2RlKCkNCj4gdG8gY29udGFpbiB0aGUgbG9naWMgdG8gZmluZCBleHRlbmRlZCByZWdp
b25zIGZvciBkb21haW5zIHVzaW5nIGhvc3QNCj4gbWVtb3J5IGxheW91dCB0aGF0IGFyZSBub3Qg
cGVybWl0dGVkIHRvIHVzZSBJT01NVS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBPcnpl
bCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IC0tLQ0KPiBUaGlzIGlzIGEgcHJlcmVxdWlzaXRl
IHBhdGNoIGZvciBMTEMgY29sb3Jpbmcgc2VyaWVzIHBhdGNoIDMuDQo+IEZvciBkb20wIExMQyBj
b2xvcmluZywgd2UganVzdCBuZWVkIHRvIHBhc3MgcmVzbWVtIGFuZCBnbnR0YWIgaW4gbWVtX2Jh
bmtzLg0KPiAtLS0NCg0KSGkgTWljaGFsLA0KDQppdCBsb29rcyBnb29kIHRvIG1lLCBJ4oCZdmUg
YWxzbyB0ZXN0ZWQgaW4gb3VyIENJIGFuZCBubyBpc3N1ZXMhDQoNClJldmlld2VkLWJ5OiBMdWNh
IEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2Vs
bHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0K


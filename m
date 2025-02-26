Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73BA45C6E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 12:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896380.1305060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnF8c-0002YQ-6Z; Wed, 26 Feb 2025 10:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896380.1305060; Wed, 26 Feb 2025 10:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnF8c-0002Vr-3s; Wed, 26 Feb 2025 10:59:38 +0000
Received: by outflank-mailman (input) for mailman id 896380;
 Wed, 26 Feb 2025 10:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Soix=VR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tnF8a-0002Vl-GI
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 10:59:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c36195aa-f430-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 11:59:34 +0100 (CET)
Received: from AS4P191CA0038.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::7)
 by AM8PR08MB6338.eurprd08.prod.outlook.com (2603:10a6:20b:369::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 10:59:30 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::e5) by AS4P191CA0038.outlook.office365.com
 (2603:10a6:20b:657::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Wed,
 26 Feb 2025 10:59:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Wed, 26 Feb 2025 10:59:29 +0000
Received: ("Tessian outbound a81432d5988b:v585");
 Wed, 26 Feb 2025 10:59:29 +0000
Received: from Leaf63ea9bdea.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5DBFBC36-FB99-4440-B110-ADA4BD172201.1; 
 Wed, 26 Feb 2025 10:59:22 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Leaf63ea9bdea.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Feb 2025 10:59:22 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU0PR08MB9228.eurprd08.prod.outlook.com (2603:10a6:10:41b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Wed, 26 Feb
 2025 10:59:20 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 10:59:20 +0000
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
X-Inumbo-ID: c36195aa-f430-11ef-9aae-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LSQ6v8FPgScbmimUirnSsYpCbcAXLuHnQblSj1wLG62zGAP1AsEpMMui9yFY8sVSGxX/BwtfA1UzOJrUQ8kHCC2MKkFbhU6k6NhLuAiklW9JPqQbd108ZdG7o+5qKgO2n16LdnXI/DNPAr/7ZQ5Op309EQy8QgTI4SFrzaHqmCBwJo25ERXLNsIlM9J/qlbSgMYKYBv9U6s8DXwyN8k+MSx1dl16brwnqIeO4DOyUyRQ71h7KHipYcnz2LP+PB+6G3rCv5gdLElS5eM/mu+1j1MV2jDb0vuUOEUyJU9twNabvIzDhbakygR93/sF9yzRdHElwQHmHAcyj+gf/APcTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QrsW2AoSNUhRF54mu4rMgR2e66z7oSRy6T7iZPb0eg=;
 b=DMX3Y/+AxSFYYWQkQm4/ip7qTVCVv4khKAsWRbeiz5LsXfJ/mx+QjxFx76+Mgm5EJ+F+T15Wv82Ta3TXhBbaRoi+I9uDYbUTklhI6TsTP8vFd1P6MpeFjl+OHJ8uy/dErDDOs/OAhI7vuW36AfcDOQ4SiWsbkHhwpwiUOO26Do0WLhlZaBanq3e967hJ4NhOgwAyBTx6ERq7hmDSELHHWGb36ubIjTALBp2KK/rflZra0lc4czsbl1DXSqffdedcDwVazNTbE+NACkGlr+OQ+pdspQl8PuWM8Gtow9uT7dyFZVguH7uSo2nySQh/JzCEQUhnLxtdTcErRj6op+0wtw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QrsW2AoSNUhRF54mu4rMgR2e66z7oSRy6T7iZPb0eg=;
 b=Z2xjwUJ8PIIAvx/+59V7d9Cy7rswZH9Crhq+vgTNOhi5XEy1iaYNEvev5tL9TxOSEwzI3fZuFTNixerce+xQDEYCRaaU/mM1WAlkPvQ+MM0YqDDOYUnUxr5KuA0rUxBySyGtTX/gK3WXBSlb5L/8PyKYlOdb0DMQJKjMVI37gHg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 017d79ab1101ddf8
X-TessianGatewayMetadata: LADvxW+Hzq1hAR9rVhLNYsQXOaZItXDDdHDjUC3sjPnYKpYN+jRsGrjTJOUDSbTuLf9SX6CKlEb7sQvVWCmNQsfES3O9kl65R+o8Wk3bJo/A9h7dYWVfUON9ILrc29YtXuaazbCYIUyfXHzSV3Ugu7E0kO43Kxc9ZcXLDZ1tQfE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYJ9lmjXNL6bB91TsQGcQmdx0Z7lqD3nLSg7REyqIXdZiVRQY5KejLn2gXDCEWxbec5iXqxDOIoDwVuVj3qA/B6d29NjGwfgx6iwVLhdj02phOTcAz5VWXE+39c8o4+iV276POPCGfRqF6u4NcS0Cw5Yw2HjHeV4LGXHQNzixyzuGC3YwvEQVqaBBZwZTQHi+Zl7xlvxMniEjoz8/VcCC1Cegn5lJzppF91/Ieng+Np+LTOrkUiPocsjG0FJ6Lgc1k1vxrbhQ/poQDgObMaSoLG7KuJUtTGvdVSs/zxrpdJRWOmlLlUxKAaqX2K+WuIwST3lru96d/y6Pq5o76zbYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QrsW2AoSNUhRF54mu4rMgR2e66z7oSRy6T7iZPb0eg=;
 b=hVC2GOwFORlsO0Nq1I8UZNFjmHm7a4s2Lgmu4g97PXL4tdv6NApp8kD4SNdWh4u9nBsI3uv1BarijOj8ESZ7psyJxIdxAwU/1VZ85hLL6qpTMueUUV/V/7qR2R9DnpVr8fb6YQN5S57IEjSpG+C2oz6pqucSs0Kx/tDB2Cj/VR081izDZTJRiufrzip3xjlKzECZmr2dta9gUiwulNozp2XgJaHRxhEYNZHT5gyIVVQPct8HBZNRQ2olxpXxQASW1/LZj0JWfCBA5ZlnFax5ZTvdnrARZzabMaWmrwQ4uJ8MSy0QjCWZBNg2D+JbiiX+o0wLtlfeYM48x0suXDv8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QrsW2AoSNUhRF54mu4rMgR2e66z7oSRy6T7iZPb0eg=;
 b=Z2xjwUJ8PIIAvx/+59V7d9Cy7rswZH9Crhq+vgTNOhi5XEy1iaYNEvev5tL9TxOSEwzI3fZuFTNixerce+xQDEYCRaaU/mM1WAlkPvQ+MM0YqDDOYUnUxr5KuA0rUxBySyGtTX/gK3WXBSlb5L/8PyKYlOdb0DMQJKjMVI37gHg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Don't use copy_from_paddr for DTB relocation
Thread-Topic: [PATCH] xen/arm: Don't use copy_from_paddr for DTB relocation
Thread-Index: AQHbiCmjnkyna+WuREGzHZ/umIzQ77NZZMaAgAABvwCAAALigIAAARmA
Date: Wed, 26 Feb 2025 10:59:20 +0000
Message-ID: <26F45E2A-EF28-40AF-B9BE-5B3AD5EE7C2D@arm.com>
References: <20250226083649.2063916-1-luca.fancellu@arm.com>
 <0ee45f03-c072-4552-b446-58fd9388dd0d@amd.com>
 <F32D92EA-D96B-4D5B-9770-B0D73832927D@arm.com>
 <47fb8c2e-a33f-43f9-93f8-fc09be754cfb@amd.com>
In-Reply-To: <47fb8c2e-a33f-43f9-93f8-fc09be754cfb@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU0PR08MB9228:EE_|AM4PEPF00027A68:EE_|AM8PR08MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca70e24-a549-4bf2-eb30-08dd5654a4d8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bHM1U2FOaTVHd0VDLzhNOFpiTzlvNU1CV2c1YjU1ZkFmeVR0YnlSbG40dlNB?=
 =?utf-8?B?ckF0NkhxamM2a2xJcyt2Q2NCVEE4c085aWFrZ0txcHQxSmkwZUtUaUNWczhO?=
 =?utf-8?B?eUYrS0w1VGVLWTg0aEl4dmF6M0YzNnpiTXprd202b2IvekRaRzE5UEc4SE4r?=
 =?utf-8?B?Y1drOCtIVVQwWnNuSHpRQlIxSkF1cXQ0UFpPTVZZMkthanJia2NMQTltZFpi?=
 =?utf-8?B?aHA0YkhPOVJrakVZZVF4QWZpTVhFOEp2NUJrbU80RzBMd29UWmZSVHg2bDh3?=
 =?utf-8?B?L05PRWxpbGx6QVkwOVBsY1ZuUWI3S0gvNlZzVEdjK3MrZmNVblZkc1Q5eTNC?=
 =?utf-8?B?cHVXZ3NqT0c3cjdtU1lOaTNYTDl0cVFXTFBiNk51KzVjQkR4NzErUzdENjl6?=
 =?utf-8?B?SnFkcS9MZDg0T2dBaVV2YzN3TTcyZmk4NFBtVGZaQXNhaWVHaTNLWW5sbnZY?=
 =?utf-8?B?MUg0Y1NoYzVHNWFQT29DVGRNcUx4NEZKUnl5dnErS2RNNUwrQUtIcWVRQm5I?=
 =?utf-8?B?NlJVeTFhcXBDNHNta1JIRW9mV01NcFJQZWRvM21qdkp6bitWNEd0ZXlJS0hq?=
 =?utf-8?B?blVIQ0JSSElKVGozTERoQVdybVkydEpIMitHL0hCTFdxM0wyR3FvbmcyeHpT?=
 =?utf-8?B?dk84ajl3b1hNc3hIYjY2UzJvYjhwZ2dEN0NWMDlvV09XWEFLL296aU1oN1Bu?=
 =?utf-8?B?Rmd3MzZKSHMvR1FjYXdRRXpKRTU5ZFZXRnFRNDVmTWJQdkVxRWtrVWFaTyty?=
 =?utf-8?B?UVplQ1hWVFQySXZ2NU5vZXV4YnVxaHBZc3N2RHUvcDVnT1M5QjJjN0dtY0R2?=
 =?utf-8?B?Q1dBS1MvOXpGdkt0UERqMFdDZURCekJqWVNCU0gvSmEwWlhHU0lXcklGMTBR?=
 =?utf-8?B?MW1KMXFGeldYWEVvNjhVUUk4MlZxeG9rRVNndEt4OWttU2xoNHUwRVZ1Mmxp?=
 =?utf-8?B?ZDRWYXJ5QnNXY3puYWt0ZTRRd0hMQVZydTZUUjVXR2VxRVhlOXh2ZjZoemxT?=
 =?utf-8?B?eGc2TFlPUDlLbXE5UTZBbVR4alJqUTZHVHBPSGJSa29BYUpvc1Q1Q0pUN1pV?=
 =?utf-8?B?YTNJUEl2UHhUMjNRUTFjUVcxbzROU2FVR1IwY1RTZlgxVWdBVVdwU0FiZENY?=
 =?utf-8?B?Rmd5U0h2QmJLMS96QnZHMDhoOWt5MEVCM0NMalVtYkh6OGE2aXM4ZkFkemNx?=
 =?utf-8?B?cWlkQ0E5U2NxVk5lVWJ6NWlIYmxBMXhxd1ZhdlNKL2ZlUlh4YkVLeUpXV1Bi?=
 =?utf-8?B?NGNoWElaKy8vZnBTU2hYUi84bnZVTmFHNEc3REpXRm1qMzFLekhFWUFZRS9s?=
 =?utf-8?B?T25QU09OM21MRjV1LzhCY0QvOEtoZFVlWXBzUE9aM0cxaTAvUzZrSmFuVnNq?=
 =?utf-8?B?SktkclRsaXdlT2pHM0lpSTJBU3haVDdqRTJpREQ5ZlhoaUNOQ2dhaEdYbThj?=
 =?utf-8?B?RWcvUkhQODROcEVJa3VxUnErK1dpeFozUkYvRG84Qi9TQStjNENNYUlzdEFa?=
 =?utf-8?B?QVkyc1JKS0hldzc0TWxZbmN6bjJ6d2ZobWx1WWFJK1d5MEhHbUx0Uk10NW4z?=
 =?utf-8?B?T1R1ZCtSaDJ0NktrMEJZSGo4SCt3T2xNcEFKdHprdnNscENCSGtzUlNUd2xS?=
 =?utf-8?B?QkpZYkhUNjRPaFNicHBveUNPVXhEOWdxVlpCcVJteU5sbklYTG16dkhFaVlq?=
 =?utf-8?B?Qm8vdDJaUmNIaFNDaGFDaTJzYi9zRUtQMUFzOUdNTlkrdWt3QjdVZXNaRXZE?=
 =?utf-8?B?cTcxZStJU2NiVmtlakJIOUUxSnV3b01ETzI5QktyRVowTTZYZDRPUCs4cU1w?=
 =?utf-8?B?dkt3TWFRU3dyczhUbC8rb0R2K3VDQktDL2xBeEo3WU9pU28zWGNXZ2tpYXJ3?=
 =?utf-8?B?L2RjMFI4Ni9GS2RCRWdhS0lNd2t3QUFuT3Z2cjFTaXVRZzFNREF4azYrOTU3?=
 =?utf-8?Q?yXWyQT+2bEOdbZchfLY21LZzAWBVQTmr?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4C63C712B4139409DA08E781D76B2C9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9228
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	75026952-a37c-4593-32c8-08dd56549f0c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjcrazhQMmllRkVYZXIxOFBuLzZIYS9raUxzKzRORElwRkFyUzVLRk5EUVZw?=
 =?utf-8?B?RWJXOU13YlFHWGRNSStGRDRFYW5CNWU0Y2tFdGI2aWFQNzZNSnFFRFFZRm8z?=
 =?utf-8?B?ak9tWWc4QjVBenNlM3FMSUx4OXBKUnJZYmpkbVg2N1IwZis1QkpBeTVWVy9W?=
 =?utf-8?B?VmtoL1ltN0Ryck9WOGU2T0J3VSs0aFB1SFd1U3ZSd0FFV1FxM3VFYzI5bmFv?=
 =?utf-8?B?Wnc1Um9Ddkx1c0JiT2drNkwxYVBYSTNlM0h5RW9Da0s5dDU3RWVGOFFyemg1?=
 =?utf-8?B?Ym5kZkM5YjQrMWt1am5MWlQ0MXpsWXNFdkt1b2dWNlNYc0FmRmlkZUFDVWZY?=
 =?utf-8?B?a0FpRUZXOG95WVhnRWRRK2ZDYWVGRFlkblRmc2ZPRVFBK1pqZjFOZE4zWGZz?=
 =?utf-8?B?YUVYM0M5bjFoTktkZEwwMFoxL1hlbUpXNWZxNHAwRHBLZkpDUXlGWGg4T0s0?=
 =?utf-8?B?SVVTdW1wVFRKY0daYWhBVER0cllFcVRJUHkrY1ZLalRuTy9NdUpldk5mcGJW?=
 =?utf-8?B?bGM0R1NhVmg5djhjQkNoYmRmWUxXL0FwZURWQ1VaT0RtQnpEK3EvL3RYQy8w?=
 =?utf-8?B?ZWtLK1JJYytzYmMyZCtnTGljQzEwN2lqdHoyZHNCME9uQUNGdkNhdG1ZVkhy?=
 =?utf-8?B?UzgwMTlCaHZCc2o1U093cXFCRGRZZy9OMXhWNVluVW9IVzg3bWRGUXk3RzRK?=
 =?utf-8?B?cy95cXU0WGkyaUt4YjZjd243YjVNTlcrRkxMZUtCbWxPTUNHT25WUHZQVUt2?=
 =?utf-8?B?QzE2MjFldUtvQktYVTh6TVZESlN2NGZtejA1S1Rwd05ROFdFK2JjYmU0Tk5l?=
 =?utf-8?B?RUE1ZjEzK3RFakJDMHdkdExDODlnTnZWTXU1ZUpHbXdKL3Q1Y3lNTEkwQm9x?=
 =?utf-8?B?b09Ma1Y4aldZdHJTSHZVT3JyYWZJUnFDRm9DdkVTbEdHcUhMa3RxeDhnMm56?=
 =?utf-8?B?LzlCcUVUWVVVRWozNHJHS1M2ZVZNNWJKaVpoVzUyVnZ6aEEyR1hvalgvVE9D?=
 =?utf-8?B?UDBreWs4QWpWb1c5ZGVKbFBWRnRUM3RwQWRBRTR0SDh1THk0K1VJcFpqNExV?=
 =?utf-8?B?Y3U3ckZLZlR5Mk03cG1IcGlUVnhRR0d4MmhVRGxKMW9pdUFadXVXeDZwWklq?=
 =?utf-8?B?U01OMFphMXpOUlJQRHFJdi9CUTZNVXc1YW1GcmVKaFZ2NGhMZmtMT1ZnMnly?=
 =?utf-8?B?R0llR1UxVXhUQWVqdlo1QlVYQmtRNnJtNUlDL3Brd3BBQmZjRTdZT25oN1J2?=
 =?utf-8?B?elhzVVJJZUNhUk4zMkNMR1FWZkM2cHFMVFFZS0psWU14VnVHZW0wSXBjck1i?=
 =?utf-8?B?VHVtQVpiN1B5bXFhTGNad21LekZmMnorU01mVVJCekRFQm1EMkp0NFFCOGRW?=
 =?utf-8?B?OWU2TkUvaUhoUVpQNC84MjlYaDl1QXZld0dYV0JPSkt6WmlZZi9iWlBudzhl?=
 =?utf-8?B?RlNZQzZ2dHlZZzJiMlp0eDduK1FqaW5tYzVyTTVaL1hBMmNxVS9JM2h3Kzhz?=
 =?utf-8?B?LzRVL3hDcEY1MGJFODk3L2w2WHNMRVdDMG9KQXhoTFVqTUl4UnFKZzdwRi9N?=
 =?utf-8?B?THVQUnU0MU55ck1jNUhNVjE1Z043WTRLSGpUSHVPTEIrZDlkUFd3ZlZnNUtp?=
 =?utf-8?B?REpPMDhYMUpjcGdTNDNKMEgzM1EzYi9zcXNIQkszejIwT2hXaldDTjVDODEv?=
 =?utf-8?B?YksvUDh2UHlCemFtcVNpT2dzNVNtekdEQndDazFyZHphMHVDMEVSeHY2K2RS?=
 =?utf-8?B?U0xoNG9rTDJ4aGRmTEJrb2NpSDdHOHJGWWYzdXA1bFdHYUt3STRwc0treEx4?=
 =?utf-8?B?aUV5SjU1c2h1WElzQ0c2ZjU5WmtBNU12ZmRqTklBbkd4ekN2TjI0akIzSXZ4?=
 =?utf-8?B?eHRZelMrYUlBN1JTOVVCQm9qdERIYktYZzVacmZMdEduSms2NmFjQ1NXWWdt?=
 =?utf-8?B?bDJUajdUanRhT1RldHE3M1JndE1lNEFnTkJ6d2NEbTNXWjRKSnpNMFlEQzFT?=
 =?utf-8?Q?yf6588P6kMx0Su7dpo/oX/1ngOJtDY=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:59:29.8149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca70e24-a549-4bf2-eb30-08dd5654a4d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6338

Pj4gDQo+Pj4gDQo+Pj4+IA0KPj4+PiAgICByZXR1cm4gZmR0Ow0KPj4+PiB9DQo+Pj4+IEBAIC0z
NjIsNyArMzYzLDcgQEAgdm9pZCBhc21saW5rYWdlIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQg
bG9uZyBmZHRfcGFkZHIpDQo+Pj4+ICAgIGlmICggYWNwaV9kaXNhYmxlZCApDQo+Pj4+ICAgIHsN
Cj4+Pj4gICAgICAgIHByaW50aygiQm9vdGluZyB1c2luZyBEZXZpY2UgVHJlZVxuIik7DQo+Pj4+
IC0gICAgICAgIGRldmljZV90cmVlX2ZsYXR0ZW5lZCA9IHJlbG9jYXRlX2ZkdChmZHRfcGFkZHIs
IGZkdF9zaXplKTsNCj4+Pj4gKyAgICAgICAgZGV2aWNlX3RyZWVfZmxhdHRlbmVkID0gcmVsb2Nh
dGVfZmR0KGRldmljZV90cmVlX2ZsYXR0ZW5lZCwgZmR0X3NpemUpOw0KPj4+IE5JVDogSXQgY2Fu
IGJlIGp1c3QgbXkgUG9WIGJ1dCBpdCByZWFkcyBvZGQuIFdoeSBjYW4ndCByZWxvY2F0ZV9mZHQg
bW9kaWZ5DQo+Pj4gZGV2aWNlX3RyZWVfZmxhdHRlbmVkIHBvaW50ZXIgZGlyZWN0bHkgaW4gdGhl
IGZ1bmN0aW9uPw0KPj4gDQo+PiB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZToNCj4+IA0KPj4gc3Rh
dGljIHZvaWQgKiBfX2luaXQgcmVsb2NhdGVfZmR0KHNpemVfdCBkdGJfc2l6ZSkNCj4+IHsNCj4+
IHZvaWQgKmZkdCA9IHhtYWxsb2NfYnl0ZXMoZHRiX3NpemUpOw0KPj4gDQo+PiBpZiAoICFmZHQg
KQ0KPj4gcGFuaWMoIlVuYWJsZSB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIHJlbG9jYXRpbmcgdGhl
IERldmljZS1UcmVlLlxuIik7DQo+PiANCj4+IG1lbWNweShmZHQsIGRldmljZV90cmVlX2ZsYXR0
ZW5lZCwgZHRiX3NpemUpOw0KPiBZb3UgYWxyZWFkeSBtYWtlIGFzc3VtcHRpb24gYWJvdXQgZGV2
aWNlX3RyZWVfZmxhdHRlbmVkIGJlaW5nIGdsb2JhbCwgc28gd2h5DQo+IG5vdCBhc3NpZ25pbmcg
ZGV2aWNlX3RyZWVfZmxhdHRlbmVkID0gZmR0IGluIHRoZSBmdW5jdGlvbiBhcyB3ZWxsPw0KDQpq
dXN0IGJlY2F1c2UgaXTigJlzIG1vcmUgZWFzeSB0byBmb2xsb3cgdGhlIGdsb2JhbCB2YXJpYWJs
ZSBjaGFuZ2VzIHdoZW4gcmVhZGluZyB0aGUgc3RhcnRfeGVuKOKApikNCmNvZGUgYXMgdGhlIGZ1
bmN0aW9uIGlzIHRoZSBvbmx5IG9uZSBtb2RpZnlpbmcgaXQuDQoNCklmIHlvdSBzdHJvbmdseSBv
cHBvc2UgdG8gdGhhdCBJ4oCZbGwgY2hhbmdlLCBidXQgaW1vIGl04oCZcyBlYXNpZXIgdG8gZm9s
bG93IHRoZSBjb2RlIGluIHRoaXMgd2F5DQoNCkNoZWVycywNCkx1Y2ENCg0K


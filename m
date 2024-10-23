Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783309AC0F8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 10:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824469.1238593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3WLT-0002MC-NX; Wed, 23 Oct 2024 08:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824469.1238593; Wed, 23 Oct 2024 08:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3WLT-0002I1-Ki; Wed, 23 Oct 2024 08:03:55 +0000
Received: by outflank-mailman (input) for mailman id 824469;
 Wed, 23 Oct 2024 08:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KN5j=RT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1t3WLS-0002Hk-Su
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 08:03:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2614::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57f259d5-9115-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 10:03:53 +0200 (CEST)
Received: from AS9PR06CA0222.eurprd06.prod.outlook.com (2603:10a6:20b:45e::32)
 by PR3PR08MB5676.eurprd08.prod.outlook.com (2603:10a6:102:82::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 08:03:50 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:45e:cafe::ad) by AS9PR06CA0222.outlook.office365.com
 (2603:10a6:20b:45e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Wed, 23 Oct 2024 08:03:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Wed, 23 Oct 2024 08:03:50 +0000
Received: ("Tessian outbound 5c9bb61b4476:v473");
 Wed, 23 Oct 2024 08:03:49 +0000
Received: from Lee6ebcd8a2fa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B515ECCF-ED42-4A18-B6E8-728798656714.1; 
 Wed, 23 Oct 2024 08:03:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lee6ebcd8a2fa.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Oct 2024 08:03:42 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9341.eurprd08.prod.outlook.com (2603:10a6:20b:59a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 08:03:41 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 08:03:41 +0000
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
X-Inumbo-ID: 57f259d5-9115-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KDgWp1i4PhciJVxPrMuth9U/dWL0Hnix7B3wspPG2pnxatfL/BsAKyErapUCfQnjWdLhLSjMNSQcWThfsD8v2x1cMquuQjlM/QkSh9n44AdqPnhkzihmmBmmsZUH17yWSNUce4ZcgQBifMCwRQneFpplZTU4HHWI0BgmBjvCQbxSZMk7XRAgBD56EGfQbrrgXf3mCJ29LrXy5tfIwipNleN9nSS3mezRUPeCw2gp748g8MOkbys/en7nWZPvozKY87ZI/MLRFZxjLoUYR3tXQvg7aW6KvX8WWylJj9Vl3pNKiFjKkKPBOjDwkAokBmYtlJ7koo8tNrQBY69vFvTYiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bAgEMeTfi8oPhogR0hpjNSHqI/H5dtGubT0r8NbpT8=;
 b=PCXz6j2K//IriLzdJ2E/wE2AC4wUterAKe8TS5pj00NlTRifmQqDrUiaJB4XH/dSWNZGGxULtcWJOPXyyNaUYOQfMNB+EjG4GoQB1P6Cy7eZbxoh/SxEDeHnyl9z1VDTIZZcalFpQthPyih+wzoXjy4cfl1mrEydqlkB5p3OxTIOcmnrOXvRiR00Mp2rb2x0PZM0XcEk2rPcY7hkF1HaTYe2ijrtTYyQRQSXaC2ijOqHQm8AFj4w9DsQdsLoZJpT0tv4oKjmy5aVnLRNw77YR4cP6+fy3Sa1IkNzQAAxVu/83NUJITtMfeFZReyHkyeXIQl8CVDQzj/OT+cek60Npg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bAgEMeTfi8oPhogR0hpjNSHqI/H5dtGubT0r8NbpT8=;
 b=VrjCvmLcSUoJYT14H0RHD9xTFsTjOOPQUQAI7ywsbe5vqcUUYWimoy2Ozda7tsJ798hqx094sI4MsfWEqoqUUVxRcsPz+yL8sLN/xVvEu3lMcG36mT3UnE6co9+vQn8Iamr2o5CVcW9mddMm0Ls1iFTVKF/gakd+oTAv04iiaEo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: af528055cd8029f7
X-TessianGatewayMetadata: 5LG6K6R89HGf8gVBF+oabmhI7lM7W74lFcqgsg9ecvi7RHfrdKlRzU1EoXRqT7UvixUHy+gsdE8CET/LXqvJoYJQA4kMekX5caIvHiB7bgXwULU9yorbf/xni1pTFFG6PKOxTa9jxKxD8ipNX9H8VzQHh2W6o4knX7Yqq8HXayM=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gd54JUzHLqWnroeYxhiHPmWTu5ULJW+LC3NAi/SlR13/4CxDgn79LCLvcuRaDmtCQcSmg6ZW1m9V5xMEOWjzGGMLmw5YLm9/jRsZ1T8h/9EvA2uWo0hJOC5zdk5rwrYfbIIz+QJbbZAio31H9gVQwNvofV9dDETnSZgu86vfXh/+TAkqI1TrRb+03YhhHkF0ZVNnmToRChVDMZR/MzHKyueYC8SfMQqqtkyFkLOf8KLy6Wqk64MzHNgZy54ikaOjwij0EIpD3LIx3BPf6LdNJ2d3+VViMmzW6rG9hs/Thu5g1EYmAqx5Sd+1dgGkbqg0WE736duFqhxReIkf1ZhrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bAgEMeTfi8oPhogR0hpjNSHqI/H5dtGubT0r8NbpT8=;
 b=gwpOCMEb9B2ghKKOCSCQzsRCS0EMEnWDZXXJEYh5tgeOh7y/Ti5nma3o9VFMLBK21ABT8x6HOSVJ3ycjI6qVJ+pMtG+VegDKqSXsOcQR8vzHeHnT1LwiukSGyjXMYsiQdBueLE1RKRuhSixP+YbWZOZLNGivriTE5YpukgFrr39giun2KI0zSxH/vE1QoTAWhyIqQYcpR1GzyZCmb6HdCGEMM+zHBvBO1MZPeNaPMKLAEbAVomXyHaXUki9NMfDY2cESB1vRWeH+L3Tm82OuianDOz/hkosSnppl22ggvB9a5JzH9E/eBJLkuQNYfzolBpKwIfbjdSAzPXC1w/8TFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bAgEMeTfi8oPhogR0hpjNSHqI/H5dtGubT0r8NbpT8=;
 b=VrjCvmLcSUoJYT14H0RHD9xTFsTjOOPQUQAI7ywsbe5vqcUUYWimoy2Ozda7tsJ798hqx094sI4MsfWEqoqUUVxRcsPz+yL8sLN/xVvEu3lMcG36mT3UnE6co9+vQn8Iamr2o5CVcW9mddMm0Ls1iFTVKF/gakd+oTAv04iiaEo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 02/10] xen/arm: ffa: Rework feature discovery
Thread-Topic: [PATCH v2 02/10] xen/arm: ffa: Rework feature discovery
Thread-Index: AQHbH6X5MdxS7WyybUSgZAd64vdid7KSWI+AgAGsPoA=
Date: Wed, 23 Oct 2024 08:03:41 +0000
Message-ID: <1402C8D3-009D-455D-AE0C-DFE245FDA746@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <8cc7abbd82b43aa595ddc2dce3495663dfc413e0.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44GUxXLmeUon5JbxcEcKqyitaC6-2FmZFAW37daqyVg-CQ@mail.gmail.com>
In-Reply-To:
 <CAHUa44GUxXLmeUon5JbxcEcKqyitaC6-2FmZFAW37daqyVg-CQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9341:EE_|AMS0EPF000001A9:EE_|PR3PR08MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: bb627392-22db-4b67-3d40-08dcf3393ab1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?THMzY3Q0TTRrQ2hoemwxTERHYkUvazVBRDRhMGp6S28xVmdRVWJzSWlEdnkw?=
 =?utf-8?B?YVU0QkZEN3Q0aTBUR3cxYTYzakczWk1na284MkU4bE1DbDIxeGpXSHYxQnNG?=
 =?utf-8?B?RXBxemM5eHpXaFhVQXRsK0xmenJuUFNuZWpsVDBYWDhtMFFLUzdUcm16THpP?=
 =?utf-8?B?TWpBeWVTcEExdDBCZW1GS1kvKytxOUt6RlJHaDh4NHNPY25lVVlqVjFIRk1r?=
 =?utf-8?B?ZzJ6Qk5adnZUVFQ0OHZXVnUvSGdnV2dKbDVsZ2pSSUg4cmh2ZFlxWXJtcUw4?=
 =?utf-8?B?eTVyWVFZZkR2dExKeEhucFRMbE9ZbndGYWliWUhObDdtdFQrY1VNZXhnNGZD?=
 =?utf-8?B?bHBGT2lJY2cwQUhDNnJWOGl1UG04ZHFZMXhPQWpQV2VSaFh1SnJGL3ZNeE5l?=
 =?utf-8?B?cXpVVkNaeGJHbElHZUNCdGNlRWJOUmM1Z2VjTTNwVStTSjFFaGJqUHpKNnhu?=
 =?utf-8?B?aUUxcitYY2FkbHJoSzMzUkhScW9xb0QzcXY2RWFHOHVqWTNnWG9kc0p0UWQ1?=
 =?utf-8?B?SmdYUjBka3F1L0tHcVJIbGdTbU9ScG5OZ1MvTFlCNm14dmxZSjBhRGt1ZjVU?=
 =?utf-8?B?LzJkcjAvQis3TE9lQ0tyOTlqYlhaS2oxZHdSQ3pEN3JtR2xDbjFiaGYxVG9v?=
 =?utf-8?B?MXd2NGx2WGN4UXB0WlBIcjRTcnJLMHE4WUEzNHlRdS9IVGZIMVhtb2gwemFH?=
 =?utf-8?B?UVNCVUNVY0lJS2lGblI0aVlvL08ydjVUTUIvbmRpOFJxTDI1WUdKazNNSUZP?=
 =?utf-8?B?cHlneGhNVzRIUWIyTFpwamxYQXlBZDJXNTF2cFpPVk1XZE55OTI4cFc1dGY1?=
 =?utf-8?B?SmpCQndkV3lFWUI1UTFGTzVYRnFsS01NV1B5RHNJOFRBVkM4TVQ4WnR1MjFl?=
 =?utf-8?B?TDNlR0o1L1cyWlFwcDhEYlA3dFQ1d21FTFgxTFd0aXRHVElNSTNqMTBQTHZ0?=
 =?utf-8?B?SW9EUFFYOXlJRG4wRndQWXhoTHVRdisvcGRlYk9VbnpxSHIyYmo4UXpZUnkw?=
 =?utf-8?B?RHh4MHBTdTkyd2tYcXQvWVBwMmoxUkEyNWF4N2xzZTl4VmRDdTQ2aXRTV005?=
 =?utf-8?B?d0RSaTQxK3NZczZvaitjNjJWbnNxMUptMFNEaTJVSkFENG1PYnRUM3E3YklG?=
 =?utf-8?B?N3dWSGJNNC82YVA3VVJTaStJdUI1aEJ1U2xHa1hKS0tTK0JPV2V0VjJZcG5L?=
 =?utf-8?B?dHM5eWdTVXlobXZxbmdWcnB4MTJkU0lVNnZQa1NLbEYwQ3JiQlB2VXdueTNF?=
 =?utf-8?B?eHJNaElKWUNCM1lPbXNMQVJlWHh6NzBTcmRETFJFZ1lZdmRqY2ZDUy8zVDdi?=
 =?utf-8?B?Rlh6djlUK09manpxNnNUTXB2N2ZsU3ZYZC9iVVNjbDNCVitubDVzWnpWK1dG?=
 =?utf-8?B?TWx5cVlpamgrblN4Rm9wd0NteTNlaUdhWEZ2ZVNhTGpVU0xpZWRGT3RCQjRR?=
 =?utf-8?B?OW5XRzNWdFkrYkFnTTYrNkJCUmVycWZXaUdldnJrTStYaE5CZDVHa1BMRnVD?=
 =?utf-8?B?T1ZkT3piTGNaSXRwc054aUJienJOV2ZtTXVDczJ0U01HNlB0YVpMbE9qOURM?=
 =?utf-8?B?S0lkNnczaFlsZUprU2EvOGlJMjl2SkpUNlhOekNQbEY4VUhoZnNUTDlrYmV6?=
 =?utf-8?B?UFJUZTc1Ukx2VHhZZXZicGVuSUozVTAwY3hJczlHaGt3TXozOCt3Y3FvVllJ?=
 =?utf-8?B?OXhWMkoySzB2QzlvdkVwclNidnM5QnhPb2VSdjVvS1dDTkZaa3NQLzhqeGdD?=
 =?utf-8?B?Y3JLQmNSdXZucnZoWU53b041ZWpPWnJyeGZPQkxsbEIzdDlkTFhYTDUvaDZi?=
 =?utf-8?Q?DPhHm1jFYhL2iJYbGOvExJxkYV4vbW8WNn4iU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D80ADD69973E3499F17E79920E6010E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9341
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d132859-e59b-4908-e405-08dcf3393553
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUZjYWhMbU96VmloMTAzcy92Szh3VUw4eG1LTU1KRy9uRkthSEN0VW5ibFA4?=
 =?utf-8?B?UnpFRjRmS3VUR281NEhCc3F3N0NscEdEVDVoNTkvdHkzcWdCN3RnV2FxK3Ft?=
 =?utf-8?B?NlF0OHl0UGRvbnBDSTJHODViVWEyWkVxSW5ic21xbkxZSGVXNmVzNUpOM3kw?=
 =?utf-8?B?SllpdVdacUZkcnJ4Sjl1b1N4bVY2aklhTklkMnVvUXVkendMN3dVZDVMZ2dK?=
 =?utf-8?B?UWZtS3FZQVcvczYwOWNrSmdPVzRJT1lyY1BKbmhnK2pBNTRidEh5VkpVdTAr?=
 =?utf-8?B?WlFoNERDODBzUGYrSFZlQ2kwK0pvK2hPdzdXNUZFdlpmS1NvclBkZlpJaHpq?=
 =?utf-8?B?Ykx5NURDL0VEVVcwNkdpbmVQSlJXNjJvamhjcjlPYUpuYksvelNQMHFYN3Jt?=
 =?utf-8?B?YklYYktnUjRmQ3E2VnZEN2VyZUpDMk5BbTNONnFTcFo0VmRuMWdOWlE4R1pQ?=
 =?utf-8?B?ZVJaL0ZaQUhwQUhrMWQ5WEJwWmNMcWMwMEp1dVhjYnZKS3d6NFU3SnBGQ1Fr?=
 =?utf-8?B?eFVUZXNXTitibmdDeUhzRGpLY2tiT0d6TndhelVpQm1CcVhITVh4dk1sNDM3?=
 =?utf-8?B?RXEwK0ljaUdjemcyMDZqZTRmbE9BM0w2NVJhbFZNRUI2V1VrVUJ6S0pHZ2pE?=
 =?utf-8?B?OHpVRktEL0laSUlLVSs2QWVxK1FISzlnUkxKY0VXb0JZdGkzaDAxd21LYzNH?=
 =?utf-8?B?dXFacDRoRW9vV1lCOTc4VnFNM2RBWnN4alpERzRtdTVLY2oyM1FMcUZlTHZU?=
 =?utf-8?B?SjBLUk5CWFQ1dUFpSUdtNnNGQW1meDU0QVRzMjYxclZoRVkxWC85NVI0U3lP?=
 =?utf-8?B?LytkR1VxZGNWWklIelZnZE9qREZDUzNKZHhlNGtnQ0xOckJ4YXlBY1NRTC9L?=
 =?utf-8?B?MUxzdFZhVEs3VTlYM2VJekZBMG5BM1JpQytDeWRONHhXNXc2MFhpdS9xMm5H?=
 =?utf-8?B?YWN4ODJ1K3dTdFBoMTRwMWRPSXdBai9WMnBzRlpMa1pzSmtsZmdMcjFmR1N5?=
 =?utf-8?B?eEdpZ0p5NTZUS3dEcS9XektiOTRCaG4zU3YzR0liMEkxT3ZGUWplT1hrUVNX?=
 =?utf-8?B?bnJTMU5VUjh2ZDh2cFBMRTB3MTYxTDRSdFpDZGhYRE9BM0pLY1AraGJXMXhF?=
 =?utf-8?B?cGpYdGk3SjI1dmFjWW1JSHppTDFSQy9VNXZsYlBtbktyL1BRcFpMbWViZ0JQ?=
 =?utf-8?B?S0N5K0NsdTlhRXB1Y0hoWXB0MWRsYm5ZU1p2NFREUEpWNWNyQ29OMVlqd2Q5?=
 =?utf-8?B?dFlYTVd0dFNLMDNVcXdjQXAwL2hnV3JvVkQ3WVRmZmJHM2x1b083SmdPVjhS?=
 =?utf-8?B?bk5sZHR5Uks3bDd3S0t4QlAvcHJmOU9pV2RXTWQva2ZlQy9jdmhVeGpCOE85?=
 =?utf-8?B?S0d3Rm9SeUFmTjFSb1R5Sm1MdWw5S1pmUEhmaENBN0YxdE5DWS8vYTRQUXBa?=
 =?utf-8?B?V0VVbDNDazZrWUUyaXlQZWtlNWtHM3VzQmZMS3FCOCs4MDRoRy92Q0FpcUFv?=
 =?utf-8?B?TzZaMGQ2djl0S1RBVmJXYkV2djBMYnJsZ05QY1hpNkFXNTFCcktBQVJvcUI0?=
 =?utf-8?B?WXNPVCt1ZXpsN1dSY2JKb1kzdzZpK05BQ3lYUzdJUStZcGdVYlppUnNSakJF?=
 =?utf-8?B?TjVyMEF1c0tLZmpNMkNPTk1rQW5BaDJ5dzNWWHNDcXV6UjBxdS9wOUQxMTVu?=
 =?utf-8?B?ZXVSZ3FtNDNNbTBoTS82cjdpVXFtOUVHZ3BFcVNsREZHSVhjMnFSb2ZKM1hM?=
 =?utf-8?B?a3puNmFKcm85RmZnR3REZnRlL25kSkxQN0M4bGUzS0VkV2dWMnA3NHJuNUpW?=
 =?utf-8?B?SlBtWS9ldTZwdzQrZnh3UnlXaDdBNmprRXVKc1FOSEIyaUJTdE96WUwrMEN6?=
 =?utf-8?B?S2UzUjN6cGh0MTlsSDN0dWtNTkhPSi94aG8rZ2RNeGZQR0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:03:50.2522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb627392-22db-4b67-3d40-08dcf3393ab1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5676

SGkgSmVucywNCg0KPiBPbiAyMiBPY3QgMjAyNCwgYXQgMDg6MzAsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTA6MzLigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBTdG9yZSB0aGUgbGlz
dCBvZiBBQkkgd2UgbmVlZCBpbiBhIGxpc3QgYW5kIGdvIHRocm91Z2ggdGhlIGxpc3QgaW5zdGVh
ZA0KPj4gb2YgaGF2aW5nIGEgbGlzdCBvZiBjb25kaXRpb25zIGluc2lkZSB0aGUgY29kZS4NCj4+
IA0KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRy
YW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdl
cyBpbiB2MjoNCj4+IC0gU3RvcmUgYSBzdHJpbmcgdmVyc2lvbiBvZiBBQkkgbmVlZGVkIGZyb20g
ZmlybXdhcmUgYW5kIHByaW50IHRoZSBuYW1lDQo+PiAgb2YgdGhlIEFCSSBub3Qgc3VwcG9ydGVk
IGluc3RlYWQgb2YgdGhlIGlkDQo+PiAtIFJlc3RvcmUgY29tbWVudCB3aXRoIFRPRE8gd2hpY2gg
c2hvdWxkIG5vdCBoYXZlIGJlZW4gcmVtb3ZlZCBhdCB0aGlzDQo+PiAgc3RhZ2UNCj4+IC0gZml4
IHRvIHVuc2lnbmVkIGludCB0aGUgaW5kZXggaW4gdGhlIGxvb3Agb24gdGhlIGFycmF5DQo+PiAt
IHVzZSBhYmkgaW5zdGVhZCBvZiBmZWF0dXJlIGluIHRoZSBuYW1lcyBvZiB0aGUgZnVuY3Rpb25z
IGFuZCB2YXJpYWJsZXMNCj4+ICBhcyB3ZSBhcmUgbm90IGNoZWNraW5nIGZlYXR1cmVzIGJ1dCBh
YmlzDQo+PiAtLS0NCj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhLmMgfCA1NyArKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS90ZWUvZmZhLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiBpbmRleCAxY2M0MDIz
MTM1ZDUuLmRkZTkzMjQyMmVjZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZh
LmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+IEBAIC03NCw2ICs3NCwzMSBA
QA0KPj4gLyogTmVnb3RpYXRlZCBGRi1BIHZlcnNpb24gdG8gdXNlIHdpdGggdGhlIFNQTUMsIDAg
aWYgbm90IHRoZXJlIG9yIHN1cHBvcnRlZCAqLw0KPj4gc3RhdGljIHVpbnQzMl90IF9fcm9fYWZ0
ZXJfaW5pdCBmZmFfZndfdmVyc2lvbjsNCj4+IA0KPj4gK3N0cnVjdCBmZmFfZndfYWJpIHsNCj4+
ICsgICAgY29uc3QgdWludDMyX3QgaWQ7DQo+IA0KPiBJIHByZWZlciByZW1vdmluZyB0aGUgY29u
c3QgYXR0cmlidXRlIGZvciB0aGlzIHN0cnVjdCBtZW1iZXIgc2luY2UgaXQNCj4gZG9lc24ndCBh
ZGQgYW55dGhpbmcgd2hlbiB0aGUgc3RydWN0IGl0c2VsZiBpcyBjb25zdC4NCg0KV29ya3MgZm9y
IG1lLg0KV2lsbCBmaXggaW4gdjMuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJz
LA0KPiBKZW5zDQo+IA0KPj4gKyAgICBjb25zdCBjaGFyICpuYW1lOw0KPj4gK307DQo+PiArDQo+
PiArI2RlZmluZSBGV19BQkkoYWJpKSB7YWJpLCNhYml9DQo+PiArDQo+PiArLyogTGlzdCBvZiBB
Qkkgd2UgdXNlIGZyb20gdGhlIGZpcm13YXJlICovDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBm
ZmFfZndfYWJpIGZmYV9md19hYmlfbmVlZGVkW10gPSB7DQo+PiArICAgIEZXX0FCSShGRkFfVkVS
U0lPTiksDQo+PiArICAgIEZXX0FCSShGRkFfRkVBVFVSRVMpLA0KPj4gKyAgICBGV19BQkkoRkZB
X05PVElGSUNBVElPTl9CSVRNQVBfQ1JFQVRFKSwNCj4+ICsgICAgRldfQUJJKEZGQV9OT1RJRklD
QVRJT05fQklUTUFQX0RFU1RST1kpLA0KPj4gKyAgICBGV19BQkkoRkZBX1BBUlRJVElPTl9JTkZP
X0dFVCksDQo+PiArICAgIEZXX0FCSShGRkFfTk9USUZJQ0FUSU9OX0lORk9fR0VUXzY0KSwNCj4+
ICsgICAgRldfQUJJKEZGQV9OT1RJRklDQVRJT05fR0VUKSwNCj4+ICsgICAgRldfQUJJKEZGQV9S
WF9SRUxFQVNFKSwNCj4+ICsgICAgRldfQUJJKEZGQV9SWFRYX01BUF82NCksDQo+PiArICAgIEZX
X0FCSShGRkFfUlhUWF9VTk1BUCksDQo+PiArICAgIEZXX0FCSShGRkFfTUVNX1NIQVJFXzMyKSwN
Cj4+ICsgICAgRldfQUJJKEZGQV9NRU1fU0hBUkVfNjQpLA0KPj4gKyAgICBGV19BQkkoRkZBX01F
TV9SRUNMQUlNKSwNCj4+ICsgICAgRldfQUJJKEZGQV9NU0dfU0VORF9ESVJFQ1RfUkVRXzMyKSwN
Cj4+ICsgICAgRldfQUJJKEZGQV9NU0dfU0VORF9ESVJFQ1RfUkVRXzY0KSwNCj4+ICt9Ow0KPj4g
DQo+PiAvKg0KPj4gICogT3VyIHJ4L3R4IGJ1ZmZlcnMgc2hhcmVkIHdpdGggdGhlIFNQTUMuIEZG
QV9SWFRYX1BBR0VfQ09VTlQgaXMgdGhlDQo+PiBAQCAtMTEyLDIwICsxMzcsOSBAQCBzdGF0aWMg
Ym9vbCBmZmFfZ2V0X3ZlcnNpb24odWludDMyX3QgKnZlcnMpDQo+PiAgICAgcmV0dXJuIHRydWU7
DQo+PiB9DQo+PiANCj4+IC1zdGF0aWMgaW50MzJfdCBmZmFfZmVhdHVyZXModWludDMyX3QgaWQp
DQo+PiAtew0KPj4gLSAgICByZXR1cm4gZmZhX3NpbXBsZV9jYWxsKEZGQV9GRUFUVVJFUywgaWQs
IDAsIDAsIDApOw0KPj4gLX0NCj4+IC0NCj4+IC1zdGF0aWMgYm9vbCBjaGVja19tYW5kYXRvcnlf
ZmVhdHVyZSh1aW50MzJfdCBpZCkNCj4+ICtzdGF0aWMgYm9vbCBmZmFfYWJpX3N1cHBvcnRlZCh1
aW50MzJfdCBpZCkNCj4+IHsNCj4+IC0gICAgaW50MzJfdCByZXQgPSBmZmFfZmVhdHVyZXMoaWQp
Ow0KPj4gLQ0KPj4gLSAgICBpZiAoIHJldCApDQo+PiAtICAgICAgICBwcmludGsoWEVOTE9HX0VS
UiAiZmZhOiBtYW5kYXRvcnkgZmVhdHVyZSBpZCAlI3ggbWlzc2luZzogZXJyb3IgJWRcbiIsDQo+
PiAtICAgICAgICAgICAgICAgaWQsIHJldCk7DQo+PiAtDQo+PiAtICAgIHJldHVybiAhcmV0Ow0K
Pj4gKyAgICByZXR1cm4gIWZmYV9zaW1wbGVfY2FsbChGRkFfRkVBVFVSRVMsIGlkLCAwLCAwLCAw
KTsNCj4+IH0NCj4+IA0KPj4gc3RhdGljIHZvaWQgaGFuZGxlX3ZlcnNpb24oc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MpDQo+PiBAQCAtNTQwLDE3ICs1NTQsMTQgQEAgc3RhdGljIGJvb2wgZmZh
X3Byb2JlKHZvaWQpDQo+PiAgICAgICogVE9ETzogUmV3b3JrIHRoZSBjb2RlIHRvIGFsbG93IGRv
bWFpbiB0byB1c2UgYSBzdWJzZXQgb2YgdGhlDQo+PiAgICAgICogZmVhdHVyZXMgc3VwcG9ydGVk
Lg0KPj4gICAgICAqLw0KPj4gLSAgICBpZiAoICFjaGVja19tYW5kYXRvcnlfZmVhdHVyZShGRkFf
UEFSVElUSU9OX0lORk9fR0VUKSB8fA0KPj4gLSAgICAgICAgICFjaGVja19tYW5kYXRvcnlfZmVh
dHVyZShGRkFfUlhfUkVMRUFTRSkgfHwNCj4+IC0gICAgICAgICAhY2hlY2tfbWFuZGF0b3J5X2Zl
YXR1cmUoRkZBX1JYVFhfTUFQXzY0KSB8fA0KPj4gLSAgICAgICAgICFjaGVja19tYW5kYXRvcnlf
ZmVhdHVyZShGRkFfTUVNX1NIQVJFXzY0KSB8fA0KPj4gLSAgICAgICAgICFjaGVja19tYW5kYXRv
cnlfZmVhdHVyZShGRkFfUlhUWF9VTk1BUCkgfHwNCj4+IC0gICAgICAgICAhY2hlY2tfbWFuZGF0
b3J5X2ZlYXR1cmUoRkZBX01FTV9TSEFSRV8zMikgfHwNCj4+IC0gICAgICAgICAhY2hlY2tfbWFu
ZGF0b3J5X2ZlYXR1cmUoRkZBX01FTV9SRUNMQUlNKSB8fA0KPj4gLSAgICAgICAgICFjaGVja19t
YW5kYXRvcnlfZmVhdHVyZShGRkFfTVNHX1NFTkRfRElSRUNUX1JFUV8zMikgKQ0KPj4gKyAgICBm
b3IgKCB1bnNpZ25lZCBpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGZmYV9md19hYmlfbmVlZGVk
KTsgaSsrICkNCj4+ICAgICB7DQo+PiAtICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiZmZhOiBN
YW5kYXRvcnkgZmVhdHVyZSBub3Qgc3VwcG9ydGVkIGJ5IGZ3XG4iKTsNCj4+IC0gICAgICAgIGdv
dG8gZXJyX25vX2Z3Ow0KPj4gKyAgICAgICAgaWYgKCAhZmZhX2FiaV9zdXBwb3J0ZWQoZmZhX2Z3
X2FiaV9uZWVkZWRbaV0uaWQpICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBwcmlu
dGsoWEVOTE9HX0lORk8gIkFSTSBGRi1BIEZpcm13YXJlIGRvZXMgbm90IHN1cHBvcnQgJXNcbiIs
DQo+PiArICAgICAgICAgICAgICAgICAgIGZmYV9md19hYmlfbmVlZGVkW2ldLm5hbWUpOw0KPj4g
KyAgICAgICAgICAgIGdvdG8gZXJyX25vX2Z3Ow0KPj4gKyAgICAgICAgfQ0KPj4gICAgIH0NCj4+
IA0KPj4gICAgIGZmYV9md192ZXJzaW9uID0gdmVyczsNCj4+IC0tDQo+PiAyLjQ3LjANCg0KDQo=


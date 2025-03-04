Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953C7A4DAC2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 11:35:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900912.1308883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpPcP-0003FT-0r; Tue, 04 Mar 2025 10:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900912.1308883; Tue, 04 Mar 2025 10:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpPcO-0003DN-Td; Tue, 04 Mar 2025 10:35:20 +0000
Received: by outflank-mailman (input) for mailman id 900912;
 Tue, 04 Mar 2025 10:35:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2zF=VX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tpPcN-0003DH-EO
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 10:35:19 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ae47128-f8e4-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 11:35:13 +0100 (CET)
Received: from AM4PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:205::21) by
 AS8PR08MB7814.eurprd08.prod.outlook.com (2603:10a6:20b:528::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 10:35:10 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:205:0:cafe::29) by AM4PR05CA0008.outlook.office365.com
 (2603:10a6:205::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Tue,
 4 Mar 2025 10:35:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 4 Mar 2025 10:35:09 +0000
Received: ("Tessian outbound bc832f6acacf:v585");
 Tue, 04 Mar 2025 10:35:09 +0000
Received: from Lf651edc86f4a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FEB27438-A799-485F-A1EF-5A59E4B9C63B.1; 
 Tue, 04 Mar 2025 10:34:58 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf651edc86f4a.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Mar 2025 10:34:58 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB7697.eurprd08.prod.outlook.com (2603:10a6:10:390::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 10:34:52 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 10:34:52 +0000
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
X-Inumbo-ID: 5ae47128-f8e4-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lOjrxwv0oIdgMi2sS7rZ29kWc0C2agMAlno3QvSMPGpDM8ULwkLtYIkbETgPno9IkhYToE183Fgkg+9f841gIOSbXFX7v9rjMAlvhDeJIIP1qdKCLtYnUWVWbl79xN+KnwlRqI0woZDIkzNZyIdVA2FjzGmXxZEYM8IYrg1VqVdgmSbJX8qDRCsZ8FRq4aDKHBrJT+2W1WDvMPOpk5lvuQsvb5jC42uAwexfAyqfVTX9k+PKxP8CWb6KsNj58iK/MEJwMeaYMtUCa6d2LcpFBdlIAqm8vhMkipthEFzhoofnSyfu62WoTbw6DQpW2l7pOF5VfGKA7aHW5vumusWwuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMKNHd8zYPlLQeTsOLCvicU++KPh7HLdBmfdALJix4M=;
 b=taoN8IpxPG1wO83zHnqFc6RhjEoz0ixYZol6YIOnqAqVVaxJkyy01EJ7owSRAwezHzn1WgnDNqBP4Nb9unzant/9Uwli9yPgKxXfYrljnoVsdwE+RGue8ukOLuJ7hZ15LUvE/G7CaCHgbwoQXFipV4pD3e92/rUcW0ChAgC8IBu2ubKmWHR6Zug3nHjkpW5oviXHyVstcINqNVxglx7qmaRUJdkOb8tmhKDI5FwoBFXO2M0hKsWtR0VLPPC9V5iAFpM5K4Y+7acjc/FhkMjHweWtf+FquKsUGaGdVTb6GY7EunfEsXcXK0E7mWPAGhqPPoI+YPVRBUvOYzrh0LgGHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMKNHd8zYPlLQeTsOLCvicU++KPh7HLdBmfdALJix4M=;
 b=PNoNYMiUr7ZFPk0YdFTrB8liPQuqUCoS2HTZCe1/2JeYlPQkjYNTkrO8Ymjg0eF336L/MiPC40kSs+DJjcSWidJD9A6zII663sVo9T4OadwyZxjrA9v8fmUPaQGljiol1vWktRNZEfHB5D93fJnAmwFNMZFyNgmZE8OK1AIoVPg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 932c643c98db06d1
X-TessianGatewayMetadata: Sew/xhToTpqjmYMm1YlI0gfhFjhpelAyHNAXaa0J+qmAPHvYSUpfUAAMI3FLjafsDox70oA6avSb/2b1KhQtCWT+XlYxX0xAy9OZsNpreKqWvRHu92PPFeAxNOSTfO1efxgXaMDGQ5kn2hrUbPwczj0G9aB++juHB0EUbsNYYMM=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H74jGwVw5qX2QoZwAuPkMiLMWIbATUz6rd2wwkFTqWMt7Yuu3r0w7kgeE57wMKd+aDp+elSw73XEELRC3EzUDlyKcMOnlzW1eumooWvvqidUaoMDfMMyEVSpVpvgtO3rhn7wFbpYT4kAQl8WjnD9Mqjjqk8EnyWkQgG+JYuFEIRsEE9G/UUc3VRADE1lEY8Rg+zwB1XRqXhs8BKekoV29HJWgd4XuyU2oAlJo4o+Ac6wmBu8ZIaYJLltkXq4KZEvKIWqhhdUXYQXSMH3MT0cYG6EGPX9jkCRuwdvljN5sz0zbiJHl0U2J2N6td5lHiaGGocAitjSrglQepx6q/eInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMKNHd8zYPlLQeTsOLCvicU++KPh7HLdBmfdALJix4M=;
 b=Bq0F+93h12Jl4S1/6fvpCaD57p4avE90E76Uxj3evi6h+Lcq5QcCXx2vsyfFHn3uF2yiZiStThTQCTGFIR9Xt+8tgFx/fRhrO/aC0jiZZbltulbKc7VSP4b+hHkkR3li0JKtrhiHEUKQuaoR3f4ZQVLTRUuMTPr3rJ41vX9CFDgfHK9ENPIFAcKH2KZ9rk0ASWWV2C27zHUhUzVdRow4p41l/Lupe/irhWQ7BWG3IVa14tE2d4u6MSgqCbh4Zq7d+l2t6uaw+WTFPN+12Q5tkgtkX98Ubx/S8Rb8opEKRKRoFbfWmuMNoKNVRePl5HWwqsEFOkNp86GHrDbC+Nc3Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMKNHd8zYPlLQeTsOLCvicU++KPh7HLdBmfdALJix4M=;
 b=PNoNYMiUr7ZFPk0YdFTrB8liPQuqUCoS2HTZCe1/2JeYlPQkjYNTkrO8Ymjg0eF336L/MiPC40kSs+DJjcSWidJD9A6zII663sVo9T4OadwyZxjrA9v8fmUPaQGljiol1vWktRNZEfHB5D93fJnAmwFNMZFyNgmZE8OK1AIoVPg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v8 0/6] (mostly) Arm32: add/convert entry point
 annotations
Thread-Topic: [PATCH v8 0/6] (mostly) Arm32: add/convert entry point
 annotations
Thread-Index: AQHbiGdgaQeZbq4rv063MySVx6NiprNi0TQA
Date: Tue, 4 Mar 2025 10:34:52 +0000
Message-ID: <25651522-A8CE-438A-8D96-F67195841055@arm.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <e09dacac-b673-43fa-9a1c-3a3a5b5d802a@suse.com>
In-Reply-To: <e09dacac-b673-43fa-9a1c-3a3a5b5d802a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB7697:EE_|AM3PEPF0000A794:EE_|AS8PR08MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe15354-c7c9-4769-3701-08dd5b083ceb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N3NWQ0U5bm5jRTNDZUpPeGwxaG5nWlVyd3FML1Mxd1YwbzdzK2RXQmVrL2dY?=
 =?utf-8?B?L0I3cldiL09DQnZQQ1BhVGpaZEJoc0R4U1FPWGZpS0xWaldyVmVReCtHRjBt?=
 =?utf-8?B?N0UxTlFLbW5WeDBBRVhMWFJHMFNyektMY3hlT1p2UlZuK1ZuZmhXNTltRDlO?=
 =?utf-8?B?LzBCaEJNQmlPemVTWklaWnRPQXRhWTRyVjBXY0h3VmN5eUZ1K1NHMUhwczND?=
 =?utf-8?B?ZFJMNFU0TzhxZXF6ODA3eGorMzFTZHdhQmUvbUJWdDVzNHVGZjVmeDd2UGln?=
 =?utf-8?B?YURNM2ROYzZLVzg1RFU3UlRzTXJIbnd5LzVKZXNEeXhHcXhlaHRlNmYrV3Ur?=
 =?utf-8?B?V0lVKy83U2h2MnFWMnhKSUpYR2NpYXJ2TnFrSmVBMUZORk5NUzlKWSt2cU4z?=
 =?utf-8?B?QlAxMDRUTzBURC9LSXJ5Q1RtNXdScXFMazBSYWE2dmIvaXQwN3k0amN6TkYz?=
 =?utf-8?B?RjFYSXp6SktBSHhlaGVDZ2FuVnk1YWpVa0JWMWtWTXZ2UjRLWEFZNnRtbUJC?=
 =?utf-8?B?aURGSDdGVHJCN3krTmFIQjRyTGovaFlpa0N6a2FuUEtsUVJ0dUFlellKQlBZ?=
 =?utf-8?B?cm9uWE9MSjVCOTM3MmdIY1dTdU1JUXdJUEdSMHBUT25nK3hTd2U3Tmxzd0pM?=
 =?utf-8?B?ZFNTRm9uNk1TazN6Q3VLRkVqQ1RrUHNZSUlSM3RTdnhYRXVXV1VkVHE4QlFa?=
 =?utf-8?B?d29JWi9hN3FxN25uNFJyVmkyc3gwRmRrUFZVWVJCZXFRU0JkQVhoWC9IeW1H?=
 =?utf-8?B?eDVQN1RDdEEyN0hjcTRSR05iTHl3ZVlRaGRtRnRERlJTRmVsblRERGFhQitr?=
 =?utf-8?B?WGxXeVpjYnlGNllTeUM0UkFhdCtpK2szb09jNkhxOTJFTytjRVRYWmJPUHlH?=
 =?utf-8?B?ZXBzM1NtVHJ0OHdGcFlzdndSMllpZWJadXZCbEYrUThFWWlhaE1qVzA3Uy9D?=
 =?utf-8?B?ZStjRmVVK3htTEp3Q3ZWMi8waDZmcWJmSDFLZzZiV0JRdSttNTl2TDM4UEFG?=
 =?utf-8?B?UWdJTWNwMzNaNlRSV1ppdnl2UklPTzdBWnJ2Sk8zMlNGdGNLRU5oZHhjTU1P?=
 =?utf-8?B?am1tTVhxVjBJcmMrZ0dhcC9xMVhRRkpCSkxOam1zVXpKT2hoakdCYWJHbWhs?=
 =?utf-8?B?Y291dnBvSXVMa2xZYWpVbnVuNUpuU2NKMVZFWFE4MXh5eXJ4Q3c5RFoyVVN3?=
 =?utf-8?B?TmNydDNuQ0d5cDlDUHc3QnFwN09XanBPekVXdUkrM3laOVhISWxaN09tU1Fj?=
 =?utf-8?B?TzFXbElUOTluZW9XTnFRSFI0MTNVMXlSU1dOSG1yTGlrSVA2UjdtMk5qazdx?=
 =?utf-8?B?K0dwUXd4cGhGN0YrSk84SCs0OXQzWGc1cUZLZERxZnNPWG9YbWlKK24yNDNl?=
 =?utf-8?B?K1pPakhBWVBlbDQ4YXB0dXNSVy83RWkvaTBkS0RrYzlNN0VqNldxckdkNnJ6?=
 =?utf-8?B?eGpIV2hvUEkxbWMxRlBWeENPY3FlL3d0S1ZMeFN4ZjIzbm5MZUFqSkpLQUkz?=
 =?utf-8?B?K2t0K21zK3k0U3hVV05MT0hhZVA1cGNIQW9Ya2hNd2RyR2VBNGV1NDV6WGhV?=
 =?utf-8?B?c3JwK2M2Si9HNm9Td3BQdkJLSVVoK2lUaEJ6SzRtNFNDbFl2aGZoQWVJc3Fv?=
 =?utf-8?B?ejVpclFaQXBSOHZmdktoZHc0NXBob2lkTGhVaCt0OC9SdyswVkdpWG80Zmtz?=
 =?utf-8?B?cXRicmFUZ1V4SWFqK2ZzZEVSUEhKQ0ptcEdlR2k0amJyVU50b3JIdEFpeDFl?=
 =?utf-8?B?M21TcHI5UmhrNVNPQWZqZXNSZXJyWHhWYVpIM2ZCMFBiNFZZbm0yNXhtcFJq?=
 =?utf-8?B?VXh3M0w4ZmphYXFoNkhXcGh5MVU3MFkrbDFNeUVJZmswaXNDd2p0NUJrL2hI?=
 =?utf-8?B?eldCQTNiOWJTeStCbDJHelhzODkzRE81d3R6Wk1mK1hEU2pmREtRcjV2WUw2?=
 =?utf-8?Q?llplXR8nkQpx6PA7TRmpGb/zKE/n6Rrz?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <34862C6941050147ABB248BE3C9D51FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7697
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23e88a51-10a6-488e-e98c-08dd5b08328e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|35042699022|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzJBVlhTdm1TODJ4aXZ5b0dCb0tnVXBZSE0vZHFtSnlFQ2dYR3NzQVlBVDZj?=
 =?utf-8?B?MEtQVUpwZE9FYTdxWXJRcTVpNE9xcVV1bWRwbWI5KzNwTVdiR1A0ZDNoYjl3?=
 =?utf-8?B?WXBsMmI1WXVGRE1BMWVQOVdXYnp6cmJZN3dWVytjbGJGQ0xjMkRNaXgxOUZU?=
 =?utf-8?B?UG0rcCtLWFNLL2lpRFJBRHpDVTZhdkIvVCs1R25LZldGcnF1QXFVd3dHOXFa?=
 =?utf-8?B?dmk1UmRYRStzQXdpOHZyODF6d005R3ordlVsVnlhNXg4QmRtMmQ1WmJqTEM0?=
 =?utf-8?B?MmxmMVVNcDdabzdwN2J3L3dOeEpTaVNjbXJOU3FZTkVpWklzaTBpNmRzYWZP?=
 =?utf-8?B?NWNaQ0dYRWIwdjZDRnpPV0crdkE5SkgzUUJHVi9pb2dlR3JhTVZsYzRZTG5z?=
 =?utf-8?B?OTd5cVNqZS9qQ0ZlRk9wZ25iT0xYWEJYTlN1QmhOOWFWeFBkdzlTaFhxUTB6?=
 =?utf-8?B?b09qU1JUWWRQRncrYXY0Mkc0bTE0Mlo4VVNFMVlESnVZQUJ5dDNOYUN0eVZE?=
 =?utf-8?B?NnZSaU12a1Q4eDdXYUNnbGs0S1p6Slo4NExjOGlaY0RXMVV6dER6Q0x6STRG?=
 =?utf-8?B?Q2Y1UmdOR0ZKc0RqZkp3VVJWMVl2bFcyZVlFUmVaWjZZWWcvbGNIK253TnB4?=
 =?utf-8?B?SEZjMDVQbjMzZnJyaG5naUNBbjQzaUtJOStOQWtGN0szS3NlMjJ0cFJvY0F2?=
 =?utf-8?B?Y2V6WEtUTVNDdjZqOTdyMG1yT1ZRTFpRdWJXUVRiZUtPR1orcEx6ZCtnYUtP?=
 =?utf-8?B?TGpwUXJaQm91VWx4cUdGR1FINkQ2Vm05WHp5QWlpNXBaYXFOaEhPSk90dXVL?=
 =?utf-8?B?MGoxRk5KM2E0L01WZnpCaUxBOGJ2K1NyOUpzTmM5QUpXZ2thQ01WRk1MK0RY?=
 =?utf-8?B?NStTUm03aTEzLy9TU0t1SFVUdmRnOC8za2FleXBCVkFON21zR2tyRTRyRG4w?=
 =?utf-8?B?elhNU0I1ZHE1YXQxYnAwSEVyd2E0THkvc2xKdmFQTWRmY2gwUjFLMGwvY0ZP?=
 =?utf-8?B?aGxHY3Fsbm8rUVc3SndheVpwSC9JVjU5SWxENFVPT0pWbzhIWDFlTDZLOU5L?=
 =?utf-8?B?bHlNNU4yRkI3VDY5WFhmT1U2WG5sZkcyeGZwaDE2K2t4eUJZZm90aSszVHpX?=
 =?utf-8?B?NXM5eEVuRDVhMlBDRFJOYWZMeGZ1SkpWVmhBSWFGWFJvSkd2MXYvWGs0QnQ1?=
 =?utf-8?B?K2NNODhaT1NONUdicEtsKzUyMnJrN0NBTUpQQlJoVjlhOVh5V1JFcU5RNlRw?=
 =?utf-8?B?bHltWHhTRWJ4T0w4T3kxSFgwQUVSMHFBQXpFb28rLzF5K3dQbkRHRmF0RHp2?=
 =?utf-8?B?a1dMSHlwYVBQVnN6ek8wMVA5ZStGanhVY25GMVovTyt3UW92cHhvd3hUSFRj?=
 =?utf-8?B?VEtBM1pIcHYwbm1EdTZyTXlOZ1pJRmtTT2lxVGpiU2o4YzdjamtuanNvVDMw?=
 =?utf-8?B?L2l4NkpxZngrSm5OeDJzLzAvMHFJNTUxM2oySTZCZk40aEszMFBiUDNWSHN1?=
 =?utf-8?B?ZnFOanVYNkFGM1lWTnFTM3gvRUNHby8rcWRKZW1pdFZQZm1ia3Eva3ZGQ1lJ?=
 =?utf-8?B?SkdTeDZBMGw5K0JsREVUYmgyckh4YmJRbkRlU2tNU0c5NVp1dUtWQWF4bFdQ?=
 =?utf-8?B?Y1JYT1BmNVNrRTFuWSt5N3poQXJBR1Y0YmxhdXowSzhBdnI0OVNDMUxpOXlz?=
 =?utf-8?B?NHUweHJEbHIwejc1UmxWcVZpV3ZCUDgrSDBVOStzZDlVeURCN3M5RkJxaUlP?=
 =?utf-8?B?cmN3L2xRSEJzaFBqalhqb1l0SkFUamx0QmdEY1FHd0x1dEJUc1N6Q2JuQjRz?=
 =?utf-8?B?M0h4M3dMZ05GdmdXaHc0WjE0bnBBcEcvV2IwTXkrQ0hzZ0lmTVM4aG9vQ3kw?=
 =?utf-8?B?VTZUUTNZa0gxL1QrdTlhUEVrUTh0aytvOHhua1VLZjZUWkcyMStPdUR4c010?=
 =?utf-8?B?TXBwVDd4NzNZT3Z6QXRtYlVROXZMNWN3Y1VtdHJVdEt6dkdPMTQ2My82c3Bz?=
 =?utf-8?B?MnRmcm81SlRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:35:09.5767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe15354-c7c9-4769-3701-08dd5b083ceb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7814

SGksDQoNCj4gT24gMjYgRmViIDIwMjUsIGF0IDE1OjU4LCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gQmVzaWRlcyB0aGUgKG5vdykgbGFzdCBwYXRjaCBvbmx5
IEFybTMyIGFkanVzdG1lbnRzIGFyZSBsZWZ0IGluIHRoaXMNCj4gc2VyaWVzLg0KPiANCj4gMTog
QXJtMzI6IHVzZSBuZXctc3R5bGUgZW50cnkgYW5ub3RhdGlvbnMgZm9yIGxpYnJhcnkgY29kZQ0K
PiAyOiBBcm0zMjogdXNlIG5ldy1zdHlsZSBlbnRyeSBhbm5vdGF0aW9ucyBmb3IgTU1VIGNvZGUN
Cj4gMzogQXJtMzI6IHVzZSBuZXctc3R5bGUgZW50cnkgYW5ub3RhdGlvbnMgZm9yIGVudHJ5IGNv
ZGUNCj4gNDogQXJtMzI6IHVzZSBuZXctc3R5bGUgZW50cnkgYW5ub3RhdGlvbnMgaW4gaGVhZC5T
DQo+IDU6IEFybTogcHVyZ2UgRU5UUlkoKSwgRU5EUFJPQygpLCBhbmQgQUxJR04NCj4gNjogY29t
bW9uOiBob25vciBDT05GSUdfQ0NfU1BMSVRfU0VDVElPTlMgYWxzbyBmb3IgYXNzZW1ibHkgZnVu
Y3Rpb25zDQoNCknigJl2ZSB0ZXN0ZWQgdGhlIHNlcmllIG9uIGFybTMyIGFuZCBhcm02NDoNCg0K
VGVzdGVkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+ICMgYXJtDQoN
Cg0KPiANCj4gSmFuDQo+IA0KDQo=


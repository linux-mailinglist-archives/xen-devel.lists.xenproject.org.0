Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8770A385F2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 15:19:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890543.1299694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1y3-0001HX-IY; Mon, 17 Feb 2025 14:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890543.1299694; Mon, 17 Feb 2025 14:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1y3-0001Ep-Ff; Mon, 17 Feb 2025 14:19:27 +0000
Received: by outflank-mailman (input) for mailman id 890543;
 Mon, 17 Feb 2025 14:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bV9=VI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tk1y1-0001Ej-SA
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 14:19:26 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2606::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e0ce264-ed3a-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 15:19:21 +0100 (CET)
Received: from CWLP265CA0466.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::14)
 by AS8PR08MB9598.eurprd08.prod.outlook.com (2603:10a6:20b:61a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 14:19:15 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:400:1d4:cafe::1f) by CWLP265CA0466.outlook.office365.com
 (2603:10a6:400:1d4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Mon,
 17 Feb 2025 14:19:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Mon, 17 Feb 2025 14:19:15 +0000
Received: ("Tessian outbound c2a0e6651601:v567");
 Mon, 17 Feb 2025 14:19:15 +0000
Received: from L74dd9da6b9a8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9DE03676-0721-447E-AF28-E35C25AC268C.1; 
 Mon, 17 Feb 2025 14:19:04 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L74dd9da6b9a8.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Feb 2025 14:19:04 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU2PR08MB10040.eurprd08.prod.outlook.com (2603:10a6:10:49f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 14:19:01 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 14:19:01 +0000
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
X-Inumbo-ID: 2e0ce264-ed3a-11ef-9896-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CzKr0AearA/YJ+pnxfT+xFc8Iuvzx7EEezs8JSVSFx6RWxvTj4flax6/wWMym3YkW5il6Thi8MdymaufJW132nYY+z5Y1fqsnMxL9m8uWGFDW9FMOfoOs2wPQaQmRyreq98t45BQin5Z2JqUsR/0jNgY2RmZ1Co9os5CqO2BRnKUazCT6tubQ7jgAgsQhCAB+4/UMI4YS0XsYebawM+sYB8OGEI4+twpKgOYP79pcnNW9gVWJm2ZZpSq1FheMldIOsyTty/xRo2LzHPzx+xAWgZvptgeNwVyuIqkoCDEajkYNNE2IsajVYYySR9BkXZ3SCJJG9LNBrMJnErTYTYLhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lsiV2LI2N3Y6hg3T//mmq+jVKUNMXEBUG/GwQjHkuE=;
 b=h09f6O103yar1rSHIpiHNV2AEkqySFKHsZBOOIcKYjTpZZ8Wora3xpnUHxWz5fdyUF1rAbNe9ml3Z6Mgc5fGxCBU+UGWjCUQ+TGOWBgezKI8Nvgo4ma27Ydjbpbbcgoc7rqf6EjUMZ6RY3b6YiIop8ICgHZjb9//R5WMF/uU68pa2s4OEtnb5GE9zfcoaLdLHf2RBZHbNLZnpbtfQuEBGlSTCbhastPAlz0SJX/HQxP6yNabnkxGRTp0A9lKT7MhaiHjNcL5gPhgUfudo0dwDVLSOF8eg+Vc4fTAdUqT6M6CvJq35nfcjTNijMx8413BDGEJJLjOP/M9qCfWHVrd1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lsiV2LI2N3Y6hg3T//mmq+jVKUNMXEBUG/GwQjHkuE=;
 b=W6d/K2OaBwDdiC8wMJPHrANmGkxPjJblT9psJVtpfhZtGAop17dI65nKoEKTB58e5GB4+Cgicb8nyeIK8UnVspPvBTXYyzWZ9nkk+84r3qTk9nx6VTqeNHLGfrMb6nU/QbUoA4DmZzR0v9SSm6LdYrU9loCwmgROLn+RatRW4EU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ffee07da6c6bc645
X-TessianGatewayMetadata: 516FKuYMvHmxfYcmHNzpIQl9BtfFrw30/ekonAINkoDb5OBN5VMXcM7vs0OkzfTQOw8f7AZ8KPyMxk+8hwdQYW3LM3jaw8nMuk0LQJ6jtx+bc3ZD1UapPtFbHFvah1PHpJp9AM/HSimMlEWZdeu4Twgf1u9RNGU4jPzn4g3pS+g=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUmwY/z+cSdgz/Vfm+uTE62/Xa0oeeixvivDJ/TxJWcf0NIxdnB0k94/M0NPP1i187A95AJPanUgYgbH8HeoGIHMQsPPtk3GAIH467IM9H7g4sibRvhB7GwsA6icByYMRM6HdQlWCge50mN6Tur4bL2ZZedn9u3+5KosrP7RPy908FU9IZANDLGlRWW5b5nB5ad1JE9ZSY2YH7OLu2EDtlyKqcE8vu1KjIpq0KOSFAZXRkRvgd7EUX5cTLzVTo6MndCZGfXjWvARoy5818x5RvEA6XYd5YgeH+z4hKIBqpV63TeRrmLg9BUgAUtIA8DNC+pzH2D5w5qACAe6Q+azyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lsiV2LI2N3Y6hg3T//mmq+jVKUNMXEBUG/GwQjHkuE=;
 b=EDfXjTCXX7EClnS54IKHi9QHuLYnZYcztl295BgCEoLUyMalM6tMAESYTmOESml55F306JFtaO/Zu/I0PhtsX9/1dLGGNM4Rku2/QWlhTF9JPrr/l+mH5e5j7eoTrasoGp9NnhwBTZt9b6e7UfpM6tKlOibvjalah0h/aorCneqdK7Qc/Xpx61dn1XWrAmPtKsVTOpZGotpi7hUHFKtDbPlRMT95jbhuk8WoNHeaBCTzNx291qDzwbKhx3+kX0xen2Yk8RaLpStY/N2hbBGHnyJWfpxOaXZ21DjqBH7NbY44LFy+gaWG73koheA93GVJEE9tgDfnMyJ2HfPMgJtzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lsiV2LI2N3Y6hg3T//mmq+jVKUNMXEBUG/GwQjHkuE=;
 b=W6d/K2OaBwDdiC8wMJPHrANmGkxPjJblT9psJVtpfhZtGAop17dI65nKoEKTB58e5GB4+Cgicb8nyeIK8UnVspPvBTXYyzWZ9nkk+84r3qTk9nx6VTqeNHLGfrMb6nU/QbUoA4DmZzR0v9SSm6LdYrU9loCwmgROLn+RatRW4EU=
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
Thread-Index: AQHbgSalEDkpkAC1V0u42lojYRhvpLNLdAKAgAAFoQCAAAHkAIAAD84A
Date: Mon, 17 Feb 2025 14:19:01 +0000
Message-ID: <403AC6BA-0E94-4FDE-B520-E7D3CC8645D1@arm.com>
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
 <20250217102732.2343729-3-luca.fancellu@arm.com>
 <0ac6b968-c298-462e-a190-65cc3e74aa01@amd.com>
 <4EF0BB2A-1C67-4878-8027-7246B3483902@arm.com>
 <74ed67a9-1ac4-4df0-b71b-19903d418f91@amd.com>
In-Reply-To: <74ed67a9-1ac4-4df0-b71b-19903d418f91@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU2PR08MB10040:EE_|AM4PEPF00027A69:EE_|AS8PR08MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: fe598a20-1e6f-4a47-df90-08dd4f5e0ef7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Mm1jMHphNzQrdzAwcGl3UkkwQVJHT3JXeEpSZ3VxUHJ4K1c5aHZKYTZteTMx?=
 =?utf-8?B?Z2Eyclk0RzJLRUxVRWh6Z0Urb21lRXV3V2RxR1pFZEVVZ2Jxak5OSmU3V0Iy?=
 =?utf-8?B?UUFlMmxoaHNWNENtR3RpR2pUbnpOVWZuWXlaMmU1OFh0ZmNOTUJtTDNuZDA0?=
 =?utf-8?B?VzRpeFk1VG52eFdIWkxzVzl2cmNDV3FZRHZweDdjZWM4dE81QllYTWV4b01Y?=
 =?utf-8?B?MVMyK0FrVjZIcnBlNkF5eUtvSEh2eFNmYnZ4dzZtdWt4RVVPMzFqVTYzRzc3?=
 =?utf-8?B?TDduVlZJRUxMeStWaEFka21SVG5GeXM5azZTMGU0TUlFMUJOVjJtWklwbmRp?=
 =?utf-8?B?d0tJUTVEd3l0RWZvZmsvTkpJdEpHb1VLeFE4Y2lFcGtpYTJYWTMyT3Fqb2RK?=
 =?utf-8?B?aVlpUU9QWkltQ3ZsZW5YNFM3WU9lUUVYNEE5ekRvOGorVU5US2N4TzI0VkN3?=
 =?utf-8?B?bnppU2J1UEp6MlVGaXQ0Y0tzMlpPUytNL1B5OXNiU1lDOGFlSXE2SDBRMy80?=
 =?utf-8?B?WStnZ0NJSlBLMW5tRnJKWHNTU3FuR21QL0N0WEZIeVZtVGYrdEZ0WElVYTh6?=
 =?utf-8?B?ZWN6SFpJMVRJaDE4T1k2Z3VGSGtFQTZCZzd4NnRrazkvOHpaekNSSHB4OHUr?=
 =?utf-8?B?anpjVVF3Y2hKN0dFYk5MRGtPSDhoWkhmMHc4SERzQkRsVWgvU2lpMlMweW9J?=
 =?utf-8?B?VDZOZ3BWcjZDS3JrZE05Y003aVVoT0w0QzFKOHNFdURzRThjRWJVOE1GY3N0?=
 =?utf-8?B?VzYvL29MRzRIZTR4RFdxUmxIUVBJNFBwRDJIL21XQThCZUVmc1BvT3hzVXRE?=
 =?utf-8?B?RWlURkhad25IV0JIc2c0MmY1RzE1UDZjRCtLS0ZaWHpOTXVXTmYxbWRSelFB?=
 =?utf-8?B?ZElnR3RQdWx4d1dMWkVBVURtU2Fud1hxajJKRkI5MUlzSXA0S2pVVU1vdk1y?=
 =?utf-8?B?RHFJSE9LdjAwVkMxWnZFNkl4RjRLL3FPa28wR0E1UzV0NWZ5RWNHd0Z5QTZH?=
 =?utf-8?B?Tys3S2doNDhFVFo4ckkySDhtbGUyUEg4UG95dGZDTEwrWUtyUmJZVEtUOW5Y?=
 =?utf-8?B?TEVtd2RRSmxQSWRmSlduNjFiZmdsQU92UVNXSzRIWEhubXhZc3NxVnA5aVNT?=
 =?utf-8?B?NGZUanFxSXIwbVg2bVAxemNIUzNiM1RZdmNXT0xubWtqV1FVcUQ4Wk9wUGV6?=
 =?utf-8?B?cUxXYm42a3FvNUpPK0RUVE5yem9reHhLelRIMzNjdENqU3Z3QWtYaDAwR3VX?=
 =?utf-8?B?RDhPT1VKc1NUMXRzb3pTVkNQcnZrb2Q4SVd4dWZWSzExSTJ3eWdZK1lRaG56?=
 =?utf-8?B?R3Y0cnBXY3FlVFlOUjVSZEZiOWhSeGk1eDNDSERnZUJJR0xTOWRtWEpPT0xK?=
 =?utf-8?B?QlFhWmV1K0xhZW1Kam13QThCYzVIZDdZY1BOVkhwR2JZekFFN3VaLytUaVd4?=
 =?utf-8?B?TXduNnJqOTlwMWVWN083WndBZDdFaG5CTGNCWVZqcjhlc01QQUEzZVBHZi9j?=
 =?utf-8?B?bTB2WUtXVUs5MXl5NUdIYUhrRU1kOXJOd3UwRzBoV1BQL3ZFdDJ0REQveU90?=
 =?utf-8?B?TkdqUzlkVjVCbk5VYjdERXBtWGdlejkvbHRoOW8zV29pemNFNWhibjEvS1Jt?=
 =?utf-8?B?VWNieXhrSHJvZHREbVZlQU1QRVhDeElFSzRJU09Bckxpa0dGeVlxWHQxN3pN?=
 =?utf-8?B?YjBwU3N1MDFaWDJrRnIzbkdnT3ZzM1lGc3hLT3FvTEFBSTAyeGtXVU9JZWly?=
 =?utf-8?B?NU1hZTRqMGFLKzdZZXo0ZXZ2NnNwZ2tDeXV5dU93b3BMeFJUbDJ5b3h6cUUv?=
 =?utf-8?B?NVdHbEJaWEhXdnJrS1Jyay9nSlB5VGMrMUFnekx0bWJSdCsxL0l6ODNjZzdr?=
 =?utf-8?B?TGFqQTRmUEVhL2dXVStxVUZkVWk0UFltWmhzUytBak9RZ0k4bEd4TFJlTHJL?=
 =?utf-8?Q?d236YTNmSnS1Z2zC+Ik9Iv1KM+XquPpJ?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCCAFBB08EDDC548AB6E2C5EF65F5972@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10040
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c927520b-864a-4c52-bbf3-08dd4f5e068e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|82310400026|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUVnSk5ORkpUUWc1NExvaFE2TmJiTlFSVm9zOTlYWk9iYms2RDRHWjRwRXlk?=
 =?utf-8?B?UG5rQWd4cDJhaVUyMHhvQ0MzcnZQTTF3dmprbGEwWmVkRjdSeGpSL0ZxZGpl?=
 =?utf-8?B?VDljYlpJcjZ3R0pqSUhxdUhRdWZCb3RnN3FBbjFqOHg2L1p3Y0dJS2FLVFNq?=
 =?utf-8?B?cGRmL3JYYmhEWDd0aEFxalkyM0ZaWm8wV2dCZWE1RXNSRHByemV3TDRkU09u?=
 =?utf-8?B?bWxCY2Y1QXZOcU1mUXNueTFTd3NYVytTTmlsakIrZzNCL1diUjgyNlJsMjI3?=
 =?utf-8?B?RXBpaEhpRGIxSmpvWlhKNkFvKzcwUFl5Nk5Yb0h0M3RPUFY2TDlJNWRSOUVB?=
 =?utf-8?B?elZBR05GeHc0RVZ0NDUrZDYvdVpSMGdDNXVQL2FILzdvcHIzSlgrL3FtRWNl?=
 =?utf-8?B?dmUrQWtTSzFrVk5BdnIzMWF0MTBxdnMyTjFnVWVFUlYxN1hDSmVPanloVnlJ?=
 =?utf-8?B?MnRYYmdPcjRITTR4YUFhWWZxT0R2aElHTTdja3JxWUNNaDVkMUk4b1IwNmV4?=
 =?utf-8?B?ZE5FSzEyM3pSRXhFUnpTYkx4RGdjd2hpSlV6aE4vTXJzb0NaZ1VnVVpKZEtH?=
 =?utf-8?B?OEQ0dTBaZFBVN2pqdlptbXJJTDVCVGVZRFZFS29UajBKQ2xpZ2owQUY0WVdY?=
 =?utf-8?B?T1IvYlFUMjVxUlBoeU5UYk84b2RZM3czUk1GR1JIRHBHUUdDWnZOZWxZaDRV?=
 =?utf-8?B?ZC9XQlhjMVErYUJ0L3FKTzVlWnNLU3JtM3RBQjJqOEY5M0h6K3g4TkU4SHBo?=
 =?utf-8?B?MUhzcWdtdkwveHhMaTNJbzYzVUUzZkN0bW10MVhZaEdtU1VIS21yM0c4S29G?=
 =?utf-8?B?SXE0YUNFNnptZEZFV0VYSVVrbmpKc1YwWEhmY2pnWURrck8xUEg4UmtTYXZq?=
 =?utf-8?B?OGtyZldndm1xTU5JN2R4SFpJSUlaTXFENmxJMVJ0V3AzOXYxRDlZbGtqYVdG?=
 =?utf-8?B?Z05PS1JZWG9ITkQ2czZ5RzBzVWFmamEwbDd4aytvK1BBUmZkRVVxSENGZDZR?=
 =?utf-8?B?aEZ3Wnp3QUtyN3crZy9oY04xdGZwTVRWNjFtekVrN0ZNV3pSQlZVV2JxQzVS?=
 =?utf-8?B?WnlmMFpNVlFscERITyt3aDhaZjduVi9lb1EwYTBLUlRMb1dBTlJ6VzZsREJR?=
 =?utf-8?B?R2dWRXNMMk9vdWhaTi9LSFJ3MWNjenlZdGZ5Ym1EK0ZzaDhuOTFHVXYrV2Jp?=
 =?utf-8?B?M2t2cFJSS3dCOHYwakRod2R0MWRJeTFRVm12WkUvcFNuM1VoRXBVWVR6aFdW?=
 =?utf-8?B?NjVGYlYwS2dGUlFMMFFjL0tWd05HczhnYUVLV3NBWUczS3Ywd2hsRisrM2xS?=
 =?utf-8?B?QnpCakNldzd6Qkw1NGFwUTF0NW52NDkzQWhxaHdockF0WHIxNDg1ckJUNFNQ?=
 =?utf-8?B?L29RQ3JXeS9aemNqa2hJdy9NblhVOGNMNGJxZzVVcmdlR0F2K01UN1NQTWFy?=
 =?utf-8?B?c3I0S21tZytXOTJmWlErZm9MVzNCRjNzclp1ZitVK21zR2oxazQ3UGthRkox?=
 =?utf-8?B?dDVIemVzWEhrL2dsbVJDU3djQVhDYU1zNWdxZFArKzJOV2hXa2J5THdLRC9M?=
 =?utf-8?B?b1ZSSjFxSS9PZTdWb3pjcXI2emJIaWw4M0FhcUhucjU1WVpsNXNuSGlUVFB6?=
 =?utf-8?B?NEhrWjRRRGFBRzV0emVibVNvZ2NVTG1Edlc5bllhOEN6QkpqU3p1TmhQYU4y?=
 =?utf-8?B?Z3cxTDk3OUZhTzQrdGUraGlWYmg0QVVCUkRaN0FnMlFkbG5OL29UbUxZWWdi?=
 =?utf-8?B?RHR2YzZDK1A4bU9RK3ZUVWtkZC9vb2djNlVVYS9UUUdlZDVSdmVZMG0rQXMv?=
 =?utf-8?B?SVJPUURhcFhQUStrYUpvSXJpd1ZsQW5QK0JHK1k4TzV1UExYUE5KUnRUSlpK?=
 =?utf-8?B?eE9GUUtqQWtYQ2tMeXd5QXQzdFhYOTFtUmxFa3ZsYjVjaGN4ay9EZTVxU3JZ?=
 =?utf-8?B?d1dyUUQ1N1h5ekYvaUNnMm1OUWsvK0IrcW9vOHQ3bmpTclRkRE4vbUx3MWxl?=
 =?utf-8?Q?O/rB1jtCIKmuYYHUxJJzYmi+4DIWFY=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(82310400026)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 14:19:15.2499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe598a20-1e6f-4a47-df90-08dd4f5e0ef7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9598

DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9z
ZXR1cC5jDQo+Pj4+IGluZGV4IGMxZjJkMWI4OWQ0My4uOTFmYTU3OWU3M2U1IDEwMDY0NA0KPj4+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vc2V0
dXAuYw0KPj4+PiBAQCAtMzI4LDYgKzMyOCw3IEBAIHZvaWQgYXNtbGlua2FnZSBfX2luaXQgc3Rh
cnRfeGVuKHVuc2lnbmVkIGxvbmcgZmR0X3BhZGRyKQ0KPj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKHBhZGRyX3QpKHVpbnRwdHJfdCkoX2VuZCAtIF9zdGFydCksIGZhbHNlKTsNCj4+
Pj4gICAgQlVHX09OKCF4ZW5fYm9vdG1vZHVsZSk7DQo+Pj4+IA0KPj4+PiArICAgIC8qIFRoaXMg
cGFyc2VzIG1lbW9yeSBiYW5rcyBuZWVkZWQgZm9yIExMQyBjb2xvcmluZyAqLw0KPj4+IHRoaXMg
Y29tbWVudCBpcyBjb25mdXNpbmcuIEl0IHJlYWRzIGFzIGlmIGJvb3RfZmR0X2luZm8gd2FzIGhl
cmUgb25seSBmb3IgTExDDQo+Pj4gY29sb3JpbmcuIE1vcmVvdmVyLCBpZiB5b3UgYWRkIHN1Y2gg
Y29tbWVudCBoZXJlLCB3aHkgbm90IGFkZGluZyBhIGNvbW1lbnQgYWJvdmUNCj4+PiBib290X2Zk
dF9jbWRsaW5lIGFuZCBjbWRsaW5lX3BhcnNlIHdoaWNoIGFyZSBoYXJkIGRlcGVuZGVuY3kgZm9y
IExMQyBjb2xvcmluZw0KPj4+IGNvZGUgdG8gcmVhZCBMTEMgY21kbGluZSBvcHRpb25zIHBhcnNl
ZCBieSBsbGNfY29sb3JpbmdfaW5pdD8NCj4+IA0KPj4gWWVhaCBJIGdldCB5b3VyIHBvaW50LCBk
byB5b3UgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgZ28gd2l0aCB0aGUgYXNzZXJ0IG9yIG1heWJlIGFk
ZCBhIGNvbW1lbnQNCj4+IG9uIHRvcCBvZiBsbGNfY29sb3JpbmdfaW5pdCgpIHRvIHNheSBpdCBu
ZWVkcyB0byBiZSBjYWxsZWQgYWZ0ZXIgYm9vdF9mZHRfaW5mbyBhbmQgYm9vdF9mZHRfY21kbGlu
ZQ0KPj4gaW4gb3JkZXIgdG8gd29yaz8gQWxzbyBiZWNhdXNlIHRoZSBhc3NlcnQgaW4gZ2V0X3hl
bl9wYWRkciAobGxjLWNvbG9yaW5nLmMpIHdvbuKAmXQgYmUgY29tcGlsZWQgb24NCj4+IGEgc2V0
dXAgbm90IGhhdmluZyBjYWNoZSBjb2xvcmluZw0KPiBUQkggSSB3b3VsZCBub3QgZG8gYW55dGhp
bmcuIEkgYXNzdW1lIHN1Y2ggY29tbWVudCB3b3VsZCB0YXJnZXQgZGV2ZWxvcGVycy4gVGhlbg0K
PiB3aHkgYXJlIHdlIHNwZWNpYWwgY2FzaW5nIExMQyBjb2xvcmluZyBhbmQgbm90IGZvciBleGFt
cGxlIGJvb3RfZmR0X2NtZGxpbmUgdGhhdA0KPiBhbHNvIG5lZWRzIHRvIGJlIGNhbGxlZCBhZnRl
ciBib290X2ZkdF9pbmZvIHRvIHBhcnNlIGxlZ2FjeSBsb2NhdGlvbiBmb3INCj4gY21kbGluZT8g
VGhlcmUgYXJlIGRvemVucyBvZiBleGFtcGxlcyBpbiBzdGFydF94ZW4gd2hlcmUgd2UgcmVseSBv
biBhIHNwZWNpZmljDQo+IG9yZGVyIGFuZCBkZXZlbG9wZXIgYWx3YXlzIG5lZWRzIHRvIGNoZWNr
IGlmIHJlYXJyYW5naW5nIGlzIHBvc3NpYmxlLiBBZGRpbmcgYQ0KPiBzaW5nbGUgY29tbWVudCBm
b3IgTExDIHdvdWxkIG5vdCBpbXByb3ZlIHRoZSBzaXR1YXRpb24gYW5kIHdvdWxkIGp1c3QgcmVz
dWx0IGluDQo+IGluY29uc2lzdGVuY3kgbGVhZGluZyB0byBjb25mdXNpb24uIFRoYXQncyB3aHkg
SSB3b3VsZCBvbmx5IGNvbnNpZGVyIGFkZGluZyBhbg0KPiBBU1NFUlQgYnV0IGluIHRoaXMgY2Fz
ZSwgdGhlcmUgYXJlIG1vcmUgdGhpbmdzIHRoYW4gbWVtb3J5IGJhbmsgdGhhdCBMTEMgaW5pdA0K
PiByZWxpZXMgb24uDQoNCm9rLCB5ZXMgb2YgY291cnNlIHRoZXJlIGFyZSBhIGxvdCBvZiB0aGlu
Z3MgdGhhdCByZWx5IG9uIHRoZSByaWdodCBvcmRlciBvZiBjYWxscywgaG93ZXZlciBJIGZlbHQN
CnRoYXQgYW4gb3B0aW9uYWwgZmVhdHVyZSBsaWtlIExMQyB3b3VsZCBiZW5lZml0IGZvciB0aGUg
ZXh0cmEgZG9jdW1lbnRhdGlvbi4gSW4gb3RoZXIgY2FzZXMNCnJlYXJyYW5naW5nIGNhbGxzIGNv
dWxkIGxlYWQgdG8gWGVuIG5vdCBib290aW5nLCBidXQgaW4gdGhpcyBjYXNlIChhcyBpdCBoYXBw
ZW5lZCB0byBtZSkgaXQNCndhcyBub3QgaW1tZWRpYXRlbHkgY2xlYXIuDQoNCkFueXdheSBpZiB0
aGF04oCZcyB5b3VyIHByZWZlcmVuY2UgSSB3aWxsIGRyb3AgdGhlIGNvbW1lbnQsIEkgd291bGQg
bm90IGFkZCB0aGUgYXNzZXJ0IGluIHRoaXMNCmNvbW1pdCBhcyBpdCBmZWVscyBub3QgdGhlIHJp
Z2h0IHBsYWNlLCBidXQgSSBjYW4gc2VlIHRoYXQgaW4gZ2V0X3hlbl9wYWRkciBpZiBtZW0gaXMg
ZW1wdHkNCndlIHdvdWxkIG5vdCB0b3VjaCBwYWRkciBhbmQgaGF2ZSBhIHBhbmljIGxhdGVyLCBz
byB3ZSB3b3VsZCBub3RpY2UgaWYgc29tZXRoaW5nIGhhcHBlbi4NCg0KQ2hlZXJzLA0KTHVjYQ0K
DQo=


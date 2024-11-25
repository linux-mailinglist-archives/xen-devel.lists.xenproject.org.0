Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A3D9D8A56
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 17:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842944.1258608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbyo-0004KX-T0; Mon, 25 Nov 2024 16:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842944.1258608; Mon, 25 Nov 2024 16:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbyo-0004I2-Q0; Mon, 25 Nov 2024 16:30:30 +0000
Received: by outflank-mailman (input) for mailman id 842944;
 Mon, 25 Nov 2024 16:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WzRA=SU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tFbyn-0004Hw-Jy
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 16:30:29 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20625.outbound.protection.outlook.com
 [2a01:111:f403:2608::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92fdcc73-ab4a-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 17:30:25 +0100 (CET)
Received: from DB8PR03CA0007.eurprd03.prod.outlook.com (2603:10a6:10:be::20)
 by AS8PR08MB10150.eurprd08.prod.outlook.com (2603:10a6:20b:62a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Mon, 25 Nov
 2024 16:30:18 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::91) by DB8PR03CA0007.outlook.office365.com
 (2603:10a6:10:be::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19 via Frontend
 Transport; Mon, 25 Nov 2024 16:30:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.16
 via Frontend Transport; Mon, 25 Nov 2024 16:30:13 +0000
Received: ("Tessian outbound 70f2252b2aaa:v490");
 Mon, 25 Nov 2024 16:30:13 +0000
Received: from Lb685cba4cdab.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49CA2A71-7C16-489F-A4E9-A06508A4A3ED.1; 
 Mon, 25 Nov 2024 16:30:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb685cba4cdab.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 25 Nov 2024 16:30:06 +0000
Received: from VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22)
 by AM0PR08MB5522.eurprd08.prod.outlook.com (2603:10a6:208:18c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 16:30:04 +0000
Received: from VE1PR08MB5807.eurprd08.prod.outlook.com
 ([fe80::ee39:f31e:3c63:985a]) by VE1PR08MB5807.eurprd08.prod.outlook.com
 ([fe80::ee39:f31e:3c63:985a%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 16:30:04 +0000
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
X-Inumbo-ID: 92fdcc73-ab4a-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwODo6NjI1IiwiaGVsbyI6IkVVUjAyLURCNS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjkyZmRjYzczLWFiNGEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTUyMjI1Ljk1NzY5NSwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Jr8wHWgvzDgai/is2aMyugd8I+n3+Tz1Pc5EQxl3JBJpJnLq15rdDZU2Ugto404lBQxJA4OPje/9VCUPE6/zqWzo7RZ3zvAmgPVmo87a5kvscqwLw9/Cb6va0oXCQTq+SdsviI5LVf+hxUh3hKXIQSGEkTrTXyDeW5wW5OSx1WKxvlMFwr8f3m+rfIUE1q2E7ahwIrEocpiXfGb3HAJJ2euTvjkmS7s9X17YocFXJynY2HVw5rTJXfyV2ekcmUvXB8Je8qeh2hCtfwecTJaBMvHgjSa+Ry8siFq47zAd5YG1MsLbgtaORI0kT4JB71WBuVzWeqGf0cy9F9PZCedlpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpQRabkWGjn7Z5I94H8240NDLwxcjDruRmPz0q+Ya2g=;
 b=VEk+jQFMfTbdqULZDHz5FM5nthXeeO1Llwwyzd9Geh4Cdt4XU53rkNcUE8ZrhJtnoeEqSBtcjBWgqb1kDUMpoWe0hwBY5FOkjLCAb26j8znCNQlzflTqt3n0vL2lWfq7TyffQpIsvfK1/nHybMBE5AkaFBDquBM9cWITV7P+yywMwnIebGQoUeFtYL4Cwa7Kw9Yua9QcvR5oj6pNQvcKyojVqoQbmaaGPJgdtDo+5YM+aQcn9mfhAYhehuNxYQqHiszOfq38P5G0T9OAPBiBW9eAQe1mjrlgucHfndagEbjdqPUXhSrSXetbAUzfQolboQDIMAQfyT1DFdG36ubHYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpQRabkWGjn7Z5I94H8240NDLwxcjDruRmPz0q+Ya2g=;
 b=ZHph7CWtX2KB38/YdSL1ADgqCzBQuLpKna+QT6lBIOp1WTz9i9BbP0dZ/sVZX6wQjAVli4FLMqkFF4PN+czaqf1/gAC0V/3nHopG4hC3l0zs8/RJLCBxUBCy+O1+zUfxyT+q7xjRgZrXF/UAu3FE3ceHxIa+LjoJ4yZgAJ8NfY4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5c469885eb5f3e67
X-TessianGatewayMetadata: r6XCOIicKbTZAK5dIsQqjMqXwpSVV+ibQentGBh4QEv1zIkeyT8FXogGNb8YfL0eRbOTHvhVoasx8ZIcTDTcIYicL4n5aTeUha0nqiQxyTcvkW/rrU2qO4TX3By2kLYwayxffBeYsiZhtyHitb57JgBESLVisNFZSz5pgAykCeY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZflqJ79JCqCHyYBZiVeocl26N/bk6iD3I3zOzaEis1sJfgMmsE0YQjwbaTGwvrY3RMu6iLrWBoHqOqCuSFU4FwZxeZs4PMgtTVCRT09l6kSsOs1MMRROPzAbvG8S3R4Fw8HozarTgYwxn2iQokaEQjeKuwUt10mRhsPXoCg38ObMYkgffxBIVzjYb+ee9Mt0tfYIIu9FL/jNgUPK8JAHitMn5yb68sNJd/HxQsOqf+HDQQKPS4jDtPjttGcGClXLLxsSFULnvnnxtsCeThlF0SmAxsxQrt5HC+ssUwEAK+7gKUQSZnSeEY7Cj4NQsco1otgQ4VmbMSFZV9lxaOxHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpQRabkWGjn7Z5I94H8240NDLwxcjDruRmPz0q+Ya2g=;
 b=dy9kOS144pd0nuiHGrEmOAt+Xjr1IGgN+rucQxItXulSaNXQTfawIbbU6UvPz2KHtR+AVknucFIqJybymTawt1eSt2S45SB1k1t5Jsz2I0Q35a7EUTtnwfCMY/jo64iuny/ULxZiYeHdS9y5QqM26SiPJ7vxeF3r3hkRRXAHevfieWtSUiicoaodKTPSir5OkIP2QRFneSlsO//tuJp0FKOInLSG2MO/Tait76S7IIlwu4kUf9yZGq2vjhos4tzZqao/NPNcpaRcxAn4huR8FyYh9LavMiVebEwkMFebXUTVgixaYX/CfMiBbPgComTQHwJ5IZ5gYVwvk+YbuCmVsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpQRabkWGjn7Z5I94H8240NDLwxcjDruRmPz0q+Ya2g=;
 b=ZHph7CWtX2KB38/YdSL1ADgqCzBQuLpKna+QT6lBIOp1WTz9i9BbP0dZ/sVZX6wQjAVli4FLMqkFF4PN+czaqf1/gAC0V/3nHopG4hC3l0zs8/RJLCBxUBCy+O1+zUfxyT+q7xjRgZrXF/UAu3FE3ceHxIa+LjoJ4yZgAJ8NfY4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Topic: [PATCH v2 1/4] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Index: AQHbOmE7YtVMCPerGUiym/x0EBbXBrLIN3IAgAACNoA=
Date: Mon, 25 Nov 2024 16:30:04 +0000
Message-ID: <482AE5CD-CBC9-446F-B249-E5272CE7ECA3@arm.com>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
 <20241119085806.805142-2-luca.fancellu@arm.com>
 <d2243aaf-d2f7-4975-a6e5-1db81414a509@suse.com>
In-Reply-To: <d2243aaf-d2f7-4975-a6e5-1db81414a509@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VE1PR08MB5807:EE_|AM0PR08MB5522:EE_|DB5PEPF00014B95:EE_|AS8PR08MB10150:EE_
X-MS-Office365-Filtering-Correlation-Id: c0471116-7d24-4264-c3c7-08dd0d6e7054
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VUdjclhuUmRyTUR6dkowekxMallCMVlMcno4TkxJV1lscmhPQzgxU2hZNVdZ?=
 =?utf-8?B?MndwcGRnOVdzeVZOYUlNOUE2bFlkTzFLL1JHNnNXbzJ2b2lOakxUQWMzRVg1?=
 =?utf-8?B?UU5FZzJLbkxFRml2ZjZodm84K0JscjdkZGpMcW00YjJYV1VlM2R6NGVqclM3?=
 =?utf-8?B?M08xT2x6YUp0WlBRa0VsV2FEdTgzb05JTk04TjAvcUczNkEwa0lVQ2RTenJV?=
 =?utf-8?B?bnRGQTQzTDB4bTY1SnZwbTg3R1daRjZoZzRKWHl4NnRMZGlPNG4yOGNNamNJ?=
 =?utf-8?B?OTl4ejhXRXlKSS9ON24rMUZoaENtSXJ1Z0V2TjE2V0RVenozZFhaY1hLdTZh?=
 =?utf-8?B?K2Nva3BJNjNEMTg0MjF3eU1NOEphbTZsWXZNc1hDU2VneExhbnhsN2VJL0xk?=
 =?utf-8?B?MnRhbElVamxWZVZVZDh4N2lDNzBsbm5Sb3AyVktBMy9KZjZwS0VVQ1pMaWtj?=
 =?utf-8?B?UzdNR2ZsTXZGZ3pPM3Z1SUNtdnVUcjJ3aVZzQTJKUHZnVEhOVHF4UTZJN3pV?=
 =?utf-8?B?VmloNE4waTZhVlpnYW5zbndZS2lDUS90RDVYaEVJaXlHT3RvMWJJOXB6cTZB?=
 =?utf-8?B?ak01Y29sckVJT3MxYTdFOFpsdUNKdG0zK0xpd2NoTnBwRDd2N0ZYZUplTlVB?=
 =?utf-8?B?ai9qLzJBdFZyUlRyOWJlVEQ3eE9zb1p0YkE5MnRBWENkSGxMK2Q2WEE0ZUlx?=
 =?utf-8?B?MVBsVFYrekdvMDB2YzNNRGJMa1hieWNOYUpuWFY0bUhPU3RTaS83NE1GaHd4?=
 =?utf-8?B?NWhlS00yODNwMXNxaWVtRktObEVEaVNhT3BpTFA1N0lDaU4wbHMxdktoNEht?=
 =?utf-8?B?dTI4ODdSZkYrUzl2NHJpblF1N2ZGVWdNN0NqYWtlWEQwdk1EVXNwN2c2dHl6?=
 =?utf-8?B?TG80WE56Q3hUUUFUdEhGVUdnbEJrQjMwbFArWWlROXpZc2h1SEhCNVFNRUhw?=
 =?utf-8?B?YjFLeHRkY2VTMFQyVzMvQ0tJUGwwRXRrNExHNDM1MVlEVTBEOWRzUWhqTkxQ?=
 =?utf-8?B?Y1M4R0FPdlZDK1VwNmU2WlAzTWpVNExVZEtJR3poTGJUaG0zY0ZEby8xQ1FE?=
 =?utf-8?B?cExBbFRrUXp4TnNjY0lBU25hTGhrWTJlOCtHQUdNcko4a2Z2NDVlUEJUcUl6?=
 =?utf-8?B?SWU4cGkvUWVjcllhV25VY2ZvVWFYYVFXT3VPZVd1QWhMTmdNSXN1aFA0ZDBS?=
 =?utf-8?B?aktPOXZZd0NrUmNid0tqWjF6NWNjTUhIbllzdzdwMTNxRkd2Z3F3OWVwdmMv?=
 =?utf-8?B?V29wMTlPRlJvM1h4ejIrWlVDcEtFNENyL1NEMDNKUWZHSmhQb0xxanFrdmU0?=
 =?utf-8?B?a3Z5bjhvWmI2MjVWR1RJZ2JuVW1EMVZVTHJ0VEdtODVWMmZZMGQwRXp6S0Nt?=
 =?utf-8?B?Q1daVnZSS3BnZnR0WlJJZDR2OUpwZDYwQ1Y3NkU0eUh3dzFQaURjWG9obndT?=
 =?utf-8?B?djZNM1lyL2NnWjk0emRsb1JKN053RFpMbUY4S3VwWU5ZclhpQ2VmRFNpRG1L?=
 =?utf-8?B?Um80MlRJZDUzMDNOcXF4NWZFOGUxRWI3WHdHSUZDcmRTL1ZnczlTTTRTb3lT?=
 =?utf-8?B?dkx2TXoveHY2Vlk1UGpkekEvc2lNQTJLQTZrYXJYL3c0ZTg2YzR6NnIvc3dp?=
 =?utf-8?B?eUt3T3ArK3hMMEk1Y1FPM29zREpGcXJlcWo1UUo3bUtkTmNjVkk0VlRuSzBT?=
 =?utf-8?B?QURBYVhyTDZMeUw5OEVVUGx3MzJmVU04NGliSmJDcnlDTEpvRmNGMlJTd0pl?=
 =?utf-8?B?TlZJOHRpbXErRGtDckdPcmwrajhrSmdEeWJBNWVGbStyeTdsSXBJTWhreUVI?=
 =?utf-8?B?enBSQ3B1aGl1dlQyaVd6c2t1Q1ZkNXlNMWJ5c1h0VUxjbFMwRkdOd1hDdUU4?=
 =?utf-8?B?VFVLd0VobGtGQlhwYzlOUFMxWklrRjlwckRONmJXN0E1WXc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5807.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <83CF42637104D14B9AAB090675284EAD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5522
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:1b2::22];domain=VE1PR08MB5807.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a5a9009a-4c8a-4814-1be5-08dd0d6e6acb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|82310400026|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vkc0VFdHMEkvR2dqaFBIT1dCRXNpQ3RoV2tZb0VWUUROVllTV1gzM1FzemJy?=
 =?utf-8?B?RHBCbVpBUEJMZnVQem9waXc2eVcxelBtOGRVc3hhdlMyK25ETk95VHRRRHNv?=
 =?utf-8?B?QmFQekF6NDlFRlB0ekxBejhnNDArQWVsaWNmbE13KytuSHRtcHYyMWNOaE9h?=
 =?utf-8?B?Y2E2UUdsakgyVENMejJ3VGVndHJvUWlpK2x6a0Q4YTdhd0Zpamp3Zm9tMUxT?=
 =?utf-8?B?MjFUbk1EMU8yVTRjY2NNRlBvb1dPK1dITlBQTDVnZ0orSDROd3Jsa1pJL2Yw?=
 =?utf-8?B?Y0hUZ3NBVjIrQ1RzNkp6V2RvUXd4QlNUOFFCVkxIOTFqbHVaZE5zOS9jK3Zy?=
 =?utf-8?B?TklaV1VxQy9ZWGlCY24yTkFEZzdFUTRtTy9weG1MaDA1cWZxYVlDRzZacWtG?=
 =?utf-8?B?ZkJJRVBEVkF4eng2NXUxNE5YbEdKRTc1S2VEU1ovYmRvS0NteXdYaFJ0VlFH?=
 =?utf-8?B?cXBqd3Exb25ZdnlnRUh2dGlFQUNFbFJhSTJ4cEprd1hTZittRGdOK0ZSN3g0?=
 =?utf-8?B?cnNEYlZRSTY0ZW5qU0tlanhpeFZ5ZlB5U1YvUmsvbGxISVRVUURJY1VzMXJ3?=
 =?utf-8?B?am1yQnk5L3NHL05qakd3K2Q1blhHOXA2a3ZjTllSdnpZWlQyUG5PalgzSHlr?=
 =?utf-8?B?eVMyL3lFV0xGeVdzb2dkcDNwSDk0WEJrR1NJbGZSMzVKQUZNeVNjdGozSlFZ?=
 =?utf-8?B?bGVmdTJPU05SdlJncm0vSzdTYWgwa2I4RnRvaS8zd0svSG9NdnRvaHd5Z3Bv?=
 =?utf-8?B?eWVPYVV4OENqUkpCQ0gvSEYrMk1Pd24wSU90TkJsSlpuNkhCWVZGMTZBSm1B?=
 =?utf-8?B?MkhhQTM3TTFuc1Fqc1RjRGRiRG9sdTZkYzhvVm5Qc3E5L3dEMEt6ZVJqdllN?=
 =?utf-8?B?UklFNnVkVEF0TU40UDFaeG1Sb0grbUhqSmNMeEdHbHhIVmN5dDlUd3psTUxk?=
 =?utf-8?B?UTZQejJDR000NjlQa20wQVFGb3JXYnMxaE05S0dISmM3VTBydnZSOHhiQUFr?=
 =?utf-8?B?SnkzNE5XVkFzZlFTUW82Ym9tN0lKcnBuWU1kTS9jL1AzRHVYNXBhNWJjdVFD?=
 =?utf-8?B?UXdpUC84aGdvNi9KYWFtbEUvdElxclgxUXpCUC9jaFJpNHlXaXJWWTNuTTN3?=
 =?utf-8?B?RVozbHV3MGFHVEVYRDBqVW1VdDNsTVM4WFJCaHMxdzE3eGl6K0RUQlBRN1pL?=
 =?utf-8?B?WmhiemF3S21nWWlYUWRsRkdZOUVhZVorK0VRNGRVWHN1SlcwZGFLdm5oSDlG?=
 =?utf-8?B?NDAxWnZKZlpWSE1hc2pOTnlrRDg3SFNVSTNqTzVUdzl0dnoyWEhxZ1dNb0VO?=
 =?utf-8?B?Mi83OFgrUVJiNXBwSUx4N25vVnVLUjVOK3k0TVBWQzFqL2ptSXM0YXNrUWti?=
 =?utf-8?B?bzlZZGRVWmh4WUZWeU5Idy83SGZTMWVWamw1MkhUZzhvVE1Nc1hTNkxTeEV2?=
 =?utf-8?B?MndxNXBoSlJBVDR1Z3VuSEFTS1lxdHpBQk93ZUh4WVlBWHhiMFZKdXNGYWE3?=
 =?utf-8?B?Q2c2TFNGZUxiQ25aSDgwNHBHNHUvaGNGOFpSeEduK3VacDZDcUVod21mVGpI?=
 =?utf-8?B?L2ZXSUxMVGpDR0hkaVUyVVZBNGQ5ZmVIWWo4bUhIMVYrcEZvNDVzY2xNbTdt?=
 =?utf-8?B?TVM1SGE1TjdkdzFDUTVnMFN2QUpCcGMxa1NqNXFZMW1mT1YrSVUwTVdLa2NL?=
 =?utf-8?B?V0pVeGg1OHVZaVdmQzhpWEpCKzNYRjF1UFAvVHhEOXBsQkJEZjJwbDYvbjgx?=
 =?utf-8?B?MUczWGs1d2ZmYy9FcWZmdkV0L2FKTzM5RGRrUW1BTHFlVEdhUVdZS1A4OEFQ?=
 =?utf-8?B?Vk4wclAvUHh3VC90YXpKajdldW9GbGVKOHpPakoyOFREa0xIQXNDQ3lTMmtk?=
 =?utf-8?B?eE1kUnVFWnB6bmJBUVo5VEk5L3QwQXc5dmtiTTF6VXlFZGh1OXFaSjdaSmo5?=
 =?utf-8?Q?UZZgXTKrSIGP8ykFB2AcT8zfzO8Bo9KX?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 16:30:13.8332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0471116-7d24-4264-c3c7-08dd0d6e7054
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10150

SGkgSmFuLA0KDQo+IE9uIDI1IE5vdiAyMDI0LCBhdCAxNjoyMSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE5LjExLjIwMjQgMDk6NTgsIEx1Y2EgRmFu
Y2VsbHUgd3JvdGU6DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdm1hcC5oDQo+PiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vdm1hcC5oDQo+PiBAQCAtNSwxMiArNSwxOSBAQA0KPj4gICogcHVycG9z
ZSBhcmVhIChWTUFQX0RFRkFVTFQpIGFuZCBhIGxpdmVwYXRjaC1zcGVjaWZpYyBhcmVhIChWTUFQ
X1hFTikuIFRoZQ0KPj4gICogbGF0dGVyIGlzIHVzZWQgd2hlbiBsb2FkaW5nIGxpdmVwYXRjaGVz
IGFuZCB0aGUgZm9ybWVyIGZvciBldmVyeXRoaW5nIGVsc2UuDQo+PiAgKi8NCj4+IC0jaWYgIWRl
ZmluZWQoX19YRU5fVk1BUF9IX18pICYmIGRlZmluZWQoVk1BUF9WSVJUX1NUQVJUKQ0KPj4gKyNp
Zm5kZWYgX19YRU5fVk1BUF9IX18NCj4+ICNkZWZpbmUgX19YRU5fVk1BUF9IX18NCj4+IA0KPj4g
I2luY2x1ZGUgPHhlbi9tbS1mcmFtZS5oPg0KPj4gI2luY2x1ZGUgPHhlbi9wYWdlLXNpemUuaD4N
Cj4+IA0KPj4gKy8qDQo+PiArICogTVBVIHN5c3RlbXMgd29uJ3QgaGF2ZSBIQVNfVk1BUCBlbmFi
bGVkLCBidXQgd2lsbCBwcm92aWRlIGltcGxlbWVudGF0aW9uDQo+PiArICogb25seSBmb3Igc29t
ZSBvZiB0aGUgZnVuY3Rpb25zIG9mIHRoaXMgbW9kdWxlLiBTbyBoaWRlIHRoZSBkZWZpbml0aW9u
IGZvcg0KPj4gKyAqIHNvbWUgb2YgdGhlc2UgZnVuY3Rpb24gdG8gc3lzdGVtcyB3aGVyZSAhSEFT
X1ZNQVANCj4+ICsgKi8NCj4+ICsjaWZkZWYgQ09ORklHX0hBU19WTUFQDQo+IA0KPiBXaGF0IHlv
dSdyZSBoaWRpbmcgYXJlIGRlY2xhcmF0aW9ucywgbm90IGRlZmluaXRpb25zLg0KDQp5ZXMsIEkg
cmVhbGlzZWQgdGhlIG1pc3Rha2UgYWZ0ZXIgc2VuZGluZw0KDQo+IFdoaWxlIHRoaXMgbWF5IGZl
ZWwgbGlrZQ0KPiBzcGxpdHRpbmcgaGFpciwgdGhlIHF1ZXN0aW9uIHJlYWxseSBpczogRG8gdGhl
IGRlY2xhcmF0aW9ucyBhY3R1YWxseSBuZWVkDQo+IGhpZGluZz8gSU9XIHdvbid0IGl0IHN1ZmZp
Y2UgdG8gaGF2ZSB0aGUgZGVmaW5pdGlvbnMgdW5hdmFpbGFibGU/IFdoaWxlIHRoaXMNCj4gd291
bGQgbWVhbiB0aGF0IHdyb25nIHVzZXMgYXJlIGZsYWdnZWQgb25seSB3aGVuIGxpbmtpbmcsIHdl
IGRvIHN1Y2ggYWxsIHRoZQ0KPiB0aW1lIHdoZW4gd2UgZXhwZWN0IGUuZy4gRENFIHRvIHJlbW92
ZSBhY3R1YWwgdXNlcyBvZiByZXNwZWN0aXZlIGlkZW50aWZpZXJzLg0KDQpJIG1pc3VuZGVyc3Rv
b2QgeW91ciBjb21tZW50IG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uIGFuZCBJIHRob3VnaHQgeW91
ciBwcmVmZXJlbmNlDQp3YXMgdG8gaGlkZSB0aGUgZGVjbGFyYXRpb25zLiBJ4oCZbGwgdHJ5IHdp
dGhvdXQgaGlkaW5nIHRoZW0gYW5kIEnigJlsbCBzZW5kIHRoZSBjaGFuZ2Ugc29vbi4NCg0KQ2hl
ZXJzLA0KTHVjYQ0KDQo=


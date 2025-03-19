Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB4CA68C9A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920509.1324659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusNa-0004cm-TG; Wed, 19 Mar 2025 12:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920509.1324659; Wed, 19 Mar 2025 12:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusNa-0004aU-Q6; Wed, 19 Mar 2025 12:18:38 +0000
Received: by outflank-mailman (input) for mailman id 920509;
 Wed, 19 Mar 2025 12:18:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abOv=WG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tusNY-0004aK-LT
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:18:36 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c201::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 474cb475-04bc-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:18:34 +0100 (CET)
Received: from AS9PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:20b:462::27)
 by DBAPR08MB5797.eurprd08.prod.outlook.com (2603:10a6:10:1a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 12:18:27 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:462:cafe::80) by AS9PR06CA0021.outlook.office365.com
 (2603:10a6:20b:462::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Wed,
 19 Mar 2025 12:18:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 19 Mar 2025 12:18:25 +0000
Received: ("Tessian outbound ec1a125a00e6:v597");
 Wed, 19 Mar 2025 12:18:24 +0000
Received: from Ld968d676f6a6.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21952333-F689-4E56-BC99-3C7CB906F6B1.1; 
 Wed, 19 Mar 2025 12:18:15 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld968d676f6a6.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 19 Mar 2025 12:18:14 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GVXPR08MB10686.eurprd08.prod.outlook.com (2603:10a6:150:150::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 12:18:06 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 12:18:06 +0000
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
X-Inumbo-ID: 474cb475-04bc-11f0-9ffa-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HED6QeFKrm25Bt2KDc7//sLGVP49jutywOBt+Cjj0NW028KrqgrWddIofqBrdtHfvz+sLaA0B6zeFRBfaRYb9eRoSZG/etTOR0u7etoXl3bUXC0u/kfW/yq/iKcVuff4/J+kj8ynhZwCiC9EStNACyR9/h6wk83Lgk/bytKV4nNOFLMLflJ9jbTE9a0A/kU1v3eWZv6KwG6ynZx9te/D9OuOJCEi03OcWRhwfR/+RODeXn9AIptOI1NVZYoJd/3fGdMh+urx3hkuEBFc74nUyRgVHSfXblQAmCyCMA2AeBofqVZAvbxCuiP3hTiq2vN6LetxBmCQ1SX+gixS58MrBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTjs+LiMA1PvXz9SzeaXguR5ZE40Z+DHXv6zDQ66l3E=;
 b=CqcfTP+6GlWfGpukE9NrRUBtXtOeH8SDZZ6hB93PkdZiqjFFz6NITSipq1p9dplNHXVAs/uVXAGso4EVEBkfwATR/tw2EpN9AsPGW1NakhyYHL06PB5sHgATlWk+JGiveLDy6FY4dNsjYW85B7mAeCMuETGQOpkI7ysen4KPl5F6gmqsgKxYmCnkYIvP59sX07kcE2L/C+eGjJp8tVqagIDANx2JMwtc90HkxMHv3AjcwrYI8krY+CE9FVWv3NmK0jDGgE63PilQ6X/1a160e3T8r6bKnvTPOQ3oB/jzlPettZ7w3KaNu5RdtsNuNLsVFR4cNf0vAdBmBNjPB2cg9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTjs+LiMA1PvXz9SzeaXguR5ZE40Z+DHXv6zDQ66l3E=;
 b=sFIePDGhcqpo4cmiMsXrjgB0Ge4Hs57r1EnVUZaq6qsihNQJMV2gLh+CfQFnhyTZHxNzmwMWO8LnKZvM/Z/PRBbeL3US/SNa5ALsx2EFW6n3AoZRSEB6ao3C4CAQFHGXg0IXoNKXRs9jcT+9ontzX0ZWQlE6fF1SDQLBYeHDqOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b42996c851c2045
X-TessianGatewayMetadata: 50QlEbNrkVsy8xvA0AHOTuBmInTOzNwsLM4TJVEDjL96C+sAbKxdShZM6InU4cEcGHWFEqfTUI2JvML4oIHmguu3LBEVO24P9AH9fhdv1WmhmIKRGP/WNGLnu1CERZhK7T5sFCdrYv92H2dQAxI9IEKx1YO02n9rcTXjHxe1cBw=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejAJsd38CbX9ikEODYaoCNINz7exWi7CGOyhhznGpcuDgxqCdt8BkbORDVSM2EyW/8crEUwtsjjljeAWWMGmDng8GtrFROIy7kib3OgVX7YxmP3XfMbU7SG/Np8m3Sltr+v6d19S4WVQYcP55nfZr/NwwsssRPsq/X3sfyvnf+2oDII4oSPa+tYtzOlKPAe0BZIDsHa24PbDpCiO3OBRnEwG2xlYWyq38SGMjUAIt/iNQmD3ib0oNl6g82DRqGwiYFmRgoJuz5DdGGhKX702d73uS2bLN7wFQX3hCDHR2Wphrf4SsSQqtL/W8IBJLCQkyKEZmHqmWbXptZc4cZbzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTjs+LiMA1PvXz9SzeaXguR5ZE40Z+DHXv6zDQ66l3E=;
 b=FfBtanI/6A32eWLRy0+dy076NDnv6KJHDZJV3ZqX/d40sgZ36lv8BQy0M3sf/WQLNvpnVx+DYMGEsYbnZrQJcoW1T+b5D82WvoMcCmBaAKK4SByAZG89KA9X7U/cwveDisnyB+dyhQl4QmMwYAOTfbR1pxqsqueChVSS1LNtn1gdlKCTGuleUw/cOyanq/4OarW8ViDkfczS35LYlgdUtcyXoaUJ37WZtkRAgDp+eD8UZNHctfeO258/ix3UD4kAEi0a6Ysr4BMh+jicQFYZuPynvy7pIh5mlL5MyGNZh8w4jqsTyFVjNMB7fvZ2oLOjId9pfmBqPayk7w94EYV9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTjs+LiMA1PvXz9SzeaXguR5ZE40Z+DHXv6zDQ66l3E=;
 b=sFIePDGhcqpo4cmiMsXrjgB0Ge4Hs57r1EnVUZaq6qsihNQJMV2gLh+CfQFnhyTZHxNzmwMWO8LnKZvM/Z/PRBbeL3US/SNa5ALsx2EFW6n3AoZRSEB6ao3C4CAQFHGXg0IXoNKXRs9jcT+9ontzX0ZWQlE6fF1SDQLBYeHDqOg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Wei
 Chen <Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
Thread-Topic: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
Thread-Index: AQHbl3hIuq5Ui4sTKky0PpKNFdMoBrN43e6AgAF5B4CAAAvlgA==
Date: Wed, 19 Mar 2025 12:18:06 +0000
Message-ID: <D86D58F5-1EDD-4362-B163-5AD25C5DCC51@arm.com>
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-7-luca.fancellu@arm.com>
 <85ba02a9-f9f9-4141-85be-a9a2d431e450@gmail.com>
 <26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com>
In-Reply-To: <26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GVXPR08MB10686:EE_|AM3PEPF0000A799:EE_|DBAPR08MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be00d85-0994-4b55-9769-08dd66e02611
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?blVoQTZjdWlLQ3A1V0hiRE9leU9IcTlMY0ZrN0F1ZG5zRFQwaUhQeWtJdkpG?=
 =?utf-8?B?TnBDYzJsN0phaTBzQnpVZ25LSlY0OXlEK1RXL2lwcXE5SXVZNTVHQnhjQWcr?=
 =?utf-8?B?L2Y4THA1dlhHbmlqMk8yU2RtbnRCc2JPcUxPNGZsY2RYaURISjM3dWtGbVZu?=
 =?utf-8?B?SktyZUFRWmdDNU56TmxVeGk0STV2MlhFbi96N2FqU3E2Y3A5RkJLZGdLOFU3?=
 =?utf-8?B?V25RL1ZDUmtSYWFhb1hrUnBTZWhDT0FFWFc1aU82ZHZDcWJoL2N0ckxPTEI1?=
 =?utf-8?B?SUd5ekttNUpIb3llMXhwL3hzcCtjQ0NhUHFjQWFFV2w0ZjlNb29iRForaERt?=
 =?utf-8?B?aXMrbCt6eUc5TWRHTld4ZFBRQjlWc01JVnc5dENhVVVBVk9PdFovQ0EzamtL?=
 =?utf-8?B?QW83andJTDRkbDRTMzBMT2NleE5TYytlanM5RUlmYWhsMlBaeXJFY1JqRGpB?=
 =?utf-8?B?bHp1bTZweTh4Y0lyWjNyZ1BYWWR5MEZjN1FaSkxRRFd1RjRldzdMRlJ4SHk3?=
 =?utf-8?B?SW1wVjE5eGJrVEhqclBjNUllOEw5WkNxRzZ6N1dqUGIzNmh2b2pYR0tXNEdm?=
 =?utf-8?B?NXp6OHRRQ2JYOUoyYUFwU2M2aTc4Z1lzUTFXdE9rUGtQRWhqbWhFb3RweUJV?=
 =?utf-8?B?cmJOTFlUSGVTUUhUQ0lUdWlXTktrblRUYnpLbGNUY09leUxQR0g1dUFOaThi?=
 =?utf-8?B?T3JOcllBKzhQYTFjUitjVVV6d2Vla2hvb0toaHMydlhuMGM3cE9leHZ3bWl1?=
 =?utf-8?B?aVFPa3lwQ0dBanVaODR6SHM4Q0pZTGJ6enpQRlVRaGNYMmZ4TjNoTm9VSm05?=
 =?utf-8?B?VStnNENxazJoQWgySU9WS3FlcmVSMDJocnNSZnBlTWFkVDU5dTBCSEVWc0hP?=
 =?utf-8?B?S1hHRTFOZlZZdWV5V3ROQ3JPclBXSVVMb1MwYVpsbGlXN3ZqTng5MEE1K3Qy?=
 =?utf-8?B?dGhPaGgrbTA1eEpqOEg1TjAyZlFuQnJGZHk3ZnZwQjNSOXF0bFY3SCsyV3I5?=
 =?utf-8?B?ODBwUFFNOEZNVGo5clgyRzJMRTRPOVBxcHZGSDAwNXd3dmo1U3FqcmlZUGhP?=
 =?utf-8?B?amVMdU1WTmp5bURjZ1BJVDZUaFQza1NTMW1WSFlBU1dHMDdzM25EamNFTHJO?=
 =?utf-8?B?ZjJielNUZFphQWIxWmpBczZPSm9JZmNrMlFaY29LUk4rSzd4NmJCTTZHU2xp?=
 =?utf-8?B?SVNBUEx6ekVTZWNZMjEzWk9FUThtbmZDWHRiNEExc0VnWkJibGh1ZDZ5YnpG?=
 =?utf-8?B?Q3hvV0xwcUI5dzI5a0xrVVc1Zm03MXUvWnFrVXQwWHNvSklBNWZVbnp1VlFk?=
 =?utf-8?B?Nms0NDRHN3dpT3JVMUhSeldBWnNac1BQb0tFeTZLamRsdUU5UDhEWVJ0V3JR?=
 =?utf-8?B?V2xsRFdtaEN4M1V0cXJJaDJUdkVVTzNDZFdXRkRrOWNnQnV4aVU2RjFqTmR4?=
 =?utf-8?B?d0QxVDQzaDd5QzdEUmlSZXlJOTFnYThueEcybzRPamxVZU1YWDVCYTErbml2?=
 =?utf-8?B?NEhXMGczYmJVUW0zRFdMRWlxLzEzWDNTZEMzRVgvWlJYRkJHUjV3ckUrTTFF?=
 =?utf-8?B?d0E3UnlDTWNGckREZFVQS1hBK2diRUhZVkJSNG1BdGdybXdmTG1RTFk3dEx3?=
 =?utf-8?B?Nk8zbGpxeDEwNGdxM2lIQzJHWE5sRzB6alZWQkpoM0lhQ2VhUEVFb1o1MGQr?=
 =?utf-8?B?Tkdpb1pYSmhjUWg2c2g1SWE2MHBsU3RPUUxkNlo4RjNlK1g1SCtOTmpTT1di?=
 =?utf-8?B?ZnFCdG1IdWxUTzd4MTQrcTJ5Q0RjV2tQTDRkbFFwR3AyRCtVNmp6L1hzQXdE?=
 =?utf-8?B?N01FbHUvYytNS0UrblZQSExXaDgrK1FnNUpPTGs1Y2FRb2FoRm45Z2JLaDF0?=
 =?utf-8?B?cnBmMlBKNURwcC90NFZSOUFmZ09yR1hPQTNkUFhBQzNYd2NFRDZRdmZqY2RV?=
 =?utf-8?Q?KjQPaFcclfAoN1PvI7J/TCay49FjiPot?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <174F091DDF8B0E4597AB3CDB90E63DA4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10686
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a35ae1c-a61d-45e5-0c24-08dd66e01aa6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NythWTFVSzkzcldoQVRoVXRmaWFlNllIdDA2Ni9QTW1aOStWY0tIOXFFUS9a?=
 =?utf-8?B?MDBjVlBGSXFWRHY0ZnMyYitJdkRIQkJCNThrOExVR0FZVFdpUDQrZnFPL0s4?=
 =?utf-8?B?VFZ1Z2VpUDgzWWM3cUExRDFIaktpSkRYUEx0b3VEY0hBOFV3YnJWcU1LYkht?=
 =?utf-8?B?Yk9uRHBqUUE0THVKbi9QOVdjbHJWZ2tmYS82LzRmeitjdFBvNHZwek4wVVl3?=
 =?utf-8?B?clVrUDZhaWZzU01BbUcvdUFyTjlHZ24zSk9Pb1M1UkRnejVIOHpZUEIwOUVi?=
 =?utf-8?B?NTFHT245SDJQVWFnMElQaDdGY2dOUXJSbUFTamc3QU9RYllSSEJaOFpXaTFF?=
 =?utf-8?B?aUpPNmxIdW92cmt1YWdaNHNmUlAyL2RrR281ZkVVTmF6RVBGWTdkYzYyYkla?=
 =?utf-8?B?ZmdmZTVCTThuVEVVREIxU0lrWUJxSzNBajE2dGVoYWh3VklxUlNqZ3F4elRO?=
 =?utf-8?B?cUNOZHlEbW5RRmVpRE5rVjUvaHZ2U2hqL1kyeEdXa3RwZ3BJSUt4UzB0WHU0?=
 =?utf-8?B?elRDbE41ZmJLUE5Gb1ppR3ltaVUzNzc3UHFyUkdoOE4zQUdNbUY1OVkvdUl2?=
 =?utf-8?B?QmVQZ203UUZZWFBpY3Q5UmIxQ0tJdE9zVmFGWlRpclMxZEp0eC90bS9rclNm?=
 =?utf-8?B?SERiRXBtZjZ5S3dpdkZQeTRoS2Y0c3lBaVJJdmJ0dFNZbGdqZVhWMjlnY2hS?=
 =?utf-8?B?aUZDbkVnZEF2TlFDZW81MC9BQ2daUWJobjVmQmJLWFk4T3RXcUM4OVRNcUdz?=
 =?utf-8?B?VExkMUl2M21qWENyUksrdzNIYlpvT0JibUFVenA0d2QzMG9PdW9NVGpDaHZO?=
 =?utf-8?B?cUlMYncwSHc2dXlvTWVrZExLaUhjdnFXemhCeW9zRlZ3VnU3QmtZOUhhclQr?=
 =?utf-8?B?ckZMMk4xZXpqZzN4ZXFSV09zZ0NFWDNpOUprc0VnVWxCdzUwYWIrNDRQc09Z?=
 =?utf-8?B?cEpZZnJJV3BWa2phWFNlYXA5R0J2ajU2Y2hSSjVOTkNqaUhkUlY4cGVXanhl?=
 =?utf-8?B?MnYzSFZNSUVBYmZrSVJNejBObzRkTWd1czN2cEVpZXhScm9OdzZnd1BvK3JB?=
 =?utf-8?B?K1ZTQWRodUVzcndCUENabGh3Qmt6djFZTUhSeldJZ1N3OUNBRTI4RVlwRkxx?=
 =?utf-8?B?Rytnek5reGxCSE11eWtTMTlsOVgrQm9NUlhobWlnOXJSYjJpek8va3p6OE5r?=
 =?utf-8?B?cU1JVzBrRUFPVU5rV0o0RUd6dzhjMGNDc1BXNk8zcWtwL2NDR01EV0pMVUEy?=
 =?utf-8?B?MzVQK3R4QXI5MXZkQlBGZ3liMmVIM1dTNGV0eUJWdFRoYVFSS1k1c083ckpl?=
 =?utf-8?B?Yi9wNHZnTlIrQWhJdUY0SG5jZkhaY00xRGQ2dWZxK2JrZXRBV2RhRTN1dkdT?=
 =?utf-8?B?UDJqaFpUWkpuV1dBRnhTaWJ3dXdPWVZVempCditCVSt5ejgxd0xzbjdIUmo3?=
 =?utf-8?B?SDBzTFpXYmg0RHd5bEhPY0FDNVFDYU0rOG1VWnVSODJuWG93c3Awa3psZXc1?=
 =?utf-8?B?QjNoSU45YU1PZ044YWV2TTZpVyswRWorTUZwV21ub3NveWIxbUtyOXE1UTUw?=
 =?utf-8?B?M3NwK0h4ZldmNjBDVGpOT1pSV2xRNFlHU0NBYnZZeXZ4RVZEU0lRajlvTSsy?=
 =?utf-8?B?Sm53SVVldXQ1eUFRd2o3d3dEQzVUaTVOdExzQkpFUnR4NnNOdWVEZ200ZG8r?=
 =?utf-8?B?QzFrMUhqMHc5aE1DUUtUdzFmbEpyTmRVNlNySnRReGNhZ0RoRjMvVDRLLzBu?=
 =?utf-8?B?WWU5aC9PR21ybXpwRW5oOHE3cE9LN0huT3FWSUNuVTRzUDc0eEJhZERvYXhw?=
 =?utf-8?B?Sjl0WHB1OVBUTHRHM0EydHpOUG5yYzJySnk3Q2szaXpjblV3VkRmblplTjFW?=
 =?utf-8?B?OXdHUFNzVStsd3JyUnB5Ri9HVUVsaHE5Mnh2VDVWUm1xNUdseE01M3lKYmlp?=
 =?utf-8?B?R05PaWNZN2VIci9vY3QxRlFzczBNNFVkNnVpWXBVMmVvNUJQU2Z5Z204YmRP?=
 =?utf-8?Q?DWEJq3Bi1MnsJGUAH7e5UEXHaYjLDQ=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(1800799024)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 12:18:25.2779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be00d85-0994-4b55-9769-08dd66e02611
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5797

SGkgSmFuLA0KDQo+IE9uIDE5IE1hciAyMDI1LCBhdCAxMTozNSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE4LjAzLjIwMjUgMTQ6MDUsIE9sZWtzaWkg
S3Vyb2Noa28gd3JvdGU6DQo+PiANCj4+IE9uIDMvMTcvMjUgOTowNyBQTSwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+PiBGcm9tOiBQZW5ueSBaaGVuZzxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPj4+
IA0KPj4+IEFSTSBNUFUgc3lzdGVtIGRvZXNuJ3QgbmVlZCB0byB1c2UgcGFnaW5nIG1lbW9yeSBw
b29sLCBhcyBNUFUgbWVtb3J5DQo+Pj4gbWFwcGluZyB0YWJsZSBhdCBtb3N0IHRha2VzIG9ubHkg
b25lIDRLQiBwYWdlLCB3aGljaCBpcyBlbm91Z2ggdG8NCj4+PiBtYW5hZ2UgdGhlIG1heGltdW0g
MjU1IE1QVSBtZW1vcnkgcmVnaW9ucywgZm9yIGFsbCBFTDIgc3RhZ2UgMQ0KPj4+IHRyYW5zbGF0
aW9uIGFuZCBFTDEgc3RhZ2UgMiB0cmFuc2xhdGlvbi4NCj4+PiANCj4+PiBJbnRyb2R1Y2UgQVJD
SF9QQUdJTkdfTUVNUE9PTCBLY29uZmlnIGNvbW1vbiBzeW1ib2wsIHNlbGVjdGVkIGZvciBBcm0N
Cj4+PiBNTVUgc3lzdGVtcywgeDg2IGFuZCBSSVNDLVYuDQo+Pj4gDQo+Pj4gV3JhcCB0aGUgY29k
ZSBpbnNpZGUgJ2NvbnN0cnVjdF9kb21VJyB0aGF0IGRlYWwgd2l0aCBwMm0gcGFnaW5nDQo+Pj4g
YWxsb2NhdGlvbiBpbiBhIG5ldyBmdW5jdGlvbiAnZG9tYWluX3AybV9zZXRfYWxsb2NhdGlvbics
IHByb3RlY3RlZA0KPj4+IGJ5IEFSQ0hfUEFHSU5HX01FTVBPT0wsIHRoaXMgaXMgZG9uZSBpbiB0
aGlzIHdheSB0byBwcmV2ZW50IHBvbGx1dGluZw0KPj4+IHRoZSBmb3JtZXIgZnVuY3Rpb24gd2l0
aCAjaWZkZWZzIGFuZCBpbXByb3ZlIHJlYWRhYmlsaXR5DQo+Pj4gDQo+Pj4gSW50cm9kdWNlIGFy
Y2hfe2dldCxzZXR9X3BhZ2luZ19tZW1wb29sX3NpemUgc3R1YnMgZm9yIGFyY2hpdGVjdHVyZQ0K
Pj4+IHdpdGggIUFSQ0hfUEFHSU5HX01FTVBPT0wuDQo+Pj4gDQo+Pj4gUmVtb3ZlICdzdHJ1Y3Qg
cGFnaW5nX2RvbWFpbicgZnJvbSBBcm0gJ3N0cnVjdCBhcmNoX2RvbWFpbicgd2hlbiB0aGUNCj4+
PiBmaWVsZCBpcyBub3QgcmVxdWlyZWQuDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogUGVubnkg
Wmhlbmc8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbjx3
ZWkuY2hlbkBhcm0uY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHU8bHVjYS5m
YW5jZWxsdUBhcm0uY29tPg0KPj4+IC0tLQ0KPj4+IHYzIGNoYW5nZXM6DQo+Pj4gIC0gSW50cm9k
dWNlZCBBUkNIX1BBR0lOR19NRU1QT09MIGluc3RlYWQgb2YgSEFTX1BBR0lOR19NRU1QT09MDQo+
Pj4gdjIgY2hhbmdlczoNCj4+PiAgLSBtYWtlIEtjb25maWcgSEFTX1BBR0lOR19NRU1QT09MIGNv
bW1vbg0KPj4+ICAtIHByb3RlY3QgYWxzbyAieGVuLGRvbWFpbi1wMm0tbWVtLW1iIiByZWFkaW5n
IHdpdGggSEFTX1BBR0lOR19NRU1QT09MDQo+Pj4gIC0gZG8gbm90IGRlZmluZSBwMm1fdGVhcmRv
d257X2FsbG9jYXRpb259IGluIHRoaXMgcGF0Y2gNCj4+PiAgLSBjaGFuZ2UgY29tbWl0IG1lc3Nh
Z2UNCj4+PiAtLS0NCj4+PiAgeGVuL2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAgIHwgIDEg
Kw0KPj4+ICB4ZW4vYXJjaC9hcm0vZG9tMGxlc3MtYnVpbGQuYyAgICAgfCA3NCArKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tDQo+Pj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21h
aW4uaCB8ICAyICsNCj4+PiAgeGVuL2FyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgIHwgIDEg
Kw0KPj4+ICB4ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgfCAgMSArDQo+Pj4gIHhl
bi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAzICsrDQo+Pj4gIHhlbi9pbmNsdWRl
L3hlbi9kb21haW4uaCAgICAgICAgICB8IDE3ICsrKysrKysNCj4+PiAgNyBmaWxlcyBjaGFuZ2Vk
LCA3MyBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4+IA0KPj4gRm9yIFJJU0MtVjoN
Cj4+ICBSZXZpZXdlZC1ieTogT2xla3NpaSBLdXJvY2hrbzxvbGVrc2lpLmt1cm9jaGtvQGdtYWls
LmNvbT4NCj4gDQo+IE1pbmQgbWUgYXNraW5nIHRoZW4gd2h5IFJJU0MtViBuZWVkcyB0aGlzIGF0
IHRoaXMgcG9pbnQ/IFRoZSBzdHVicyBzdXJlbHkNCj4gd2VyZSBhZGRlZCB0byBhZGRyZXNzIHNv
bWUgYnVpbGQgaXNzdWUsIG5vdCBiZWNhdXNlIHRoZXkgYXJlIGFjdGl2ZWx5DQo+IG1lYW5pbmdm
dWw/DQoNCnNvcnJ5IEnigJltIG5vdCBhIFJJU0MtViBleHBlcnQsIEkgc2F3IHRoZSBzdHViIGFu
ZCBJIHRob3VnaHQgdGhlIGFyY2hpdGVjdHVyZSB3YW50ZWQgdG8gaGF2ZSB0aGVtIGltcGxlbWVu
dGVkLg0KDQpJZiBub3QsIGlzIGl0IHBvc3NpYmxlIHRvIGxldCB0aGUgUklTQy1WIHBlb3BsZSBo
YW5kbGUgdGhhdCBzZXBhcmF0ZWx5PyBJ4oCZbGwgYmUgb2ZmIHVudGlsIDMxc3Qgb2YgTWFyY2gg
YW5kIHRoaXMgcGF0Y2ggaXMNCnVzZWZ1bCBmb3IgQXlhbiB0byBpbnRyb2R1Y2UgYSBidWlsZGlu
ZyBzdGF0dXMgZm9yIGFybTMyLg0KDQpDaGVlcnMsDQpMdWNhDQoNCj4gDQo+IEphbg0KDQo=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C76FA3C393
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 16:26:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893159.1302084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklx8-0008Nb-6K; Wed, 19 Feb 2025 15:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893159.1302084; Wed, 19 Feb 2025 15:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tklx8-0008M4-3c; Wed, 19 Feb 2025 15:25:34 +0000
Received: by outflank-mailman (input) for mailman id 893159;
 Wed, 19 Feb 2025 15:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+zk=VK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tklx6-0008Li-BW
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 15:25:32 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c057ed7e-eed5-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 16:25:29 +0100 (CET)
Received: from DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) by AS8PR08MB9979.eurprd08.prod.outlook.com
 (2603:10a6:20b:633::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 15:25:27 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::5) by DUZPR01CA0067.outlook.office365.com
 (2603:10a6:10:3c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.15 via Frontend Transport; Wed,
 19 Feb 2025 15:25:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11 via
 Frontend Transport; Wed, 19 Feb 2025 15:25:26 +0000
Received: ("Tessian outbound 8b1c71667766:v567");
 Wed, 19 Feb 2025 15:25:26 +0000
Received: from Lc096c708ae91.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EAACA0FE-BA20-4AC2-B959-6C6DFD20AC7D.1; 
 Wed, 19 Feb 2025 15:25:15 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc096c708ae91.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 19 Feb 2025 15:25:15 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB6523.eurprd08.prod.outlook.com (2603:10a6:10:256::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 15:25:13 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 15:25:13 +0000
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
X-Inumbo-ID: c057ed7e-eed5-11ef-9aa8-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P6IxgE8jHM/PcouFURzAzaX4RcDWJrNf97FFxmg4NX7trHDfK2RUyGkTgYcHClUeFLR7ln0w2+sem1VM336V9WnVjOJuj9bkzZHcli0EPC9ph5BD3eDymOHulxW5f9MxfWg5E3lAPNVTJjHHDgf/xtlidCiHTc1f5oBwhTFN+apP+5NIEzS4vQOQ72jmTtz0IbZhLmXaRZxDncKvxsMFOayqKWkRrbWQzsnk893sacx6aH+2Mt6UGpmmmsKoi4SDZ0yRan62C4ggblG3Ce0pDd+sef0Ik88YP1yC/sbx58/5adREdE/VTJv5N+iNP+xOvmc4YrmaVQiPqeybTMzw/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Wm5NzVlagE9VunbJNgABmclrs3CV+DbMwaQ1f9nzGY=;
 b=ogZeoGShZ2l5zuQPxaNt/628ZBXAkArojdQcwLeRh5eeGUJViREowppVZiMnUQoZ8ZJU50Mu8fT5/I8zViXLLZKAO5JPnCsSflFjchrt9XE1ouOyOo3NrixkbadNkA6vn4HV4RYT1GGXDmyjklLaO/lb4JpVJ0kdFrVqtU8Oo1MY08RtqsajVnJPXFu117AbRXuW/Fa/08eSUDk/HXuhaOrZ+ZQ0EjPdGyZvq3lL8FJqPq2V2z02WzSajrH7bFyCL4h+4WHxemNba+8eCTBi6UcAo5ERipdbFQi5tzmIjBVWkd38Aq008XvM0zKuJkf1NRBm7p+yVxFrikziP8AU3w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Wm5NzVlagE9VunbJNgABmclrs3CV+DbMwaQ1f9nzGY=;
 b=EVVWvqWS10JdiYsmBcW87s6x7nyMxCaHz4cCRlVIlQKu8HPC7ac57PjVWJWqOEGeS6FKFtbnW/xv+gMc9xLIyg6zFDDFN3TwKJsZdPdAh5rsfu2noPlpE+dcbuVv3OranJJwU3S1rUo52uI3+JgaGonRqb0ziUQrE1NpKIK4XhQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25dfc4b541951458
X-TessianGatewayMetadata: NsbZE+eROd6pwRP6egqqedqYsbX8bvpeT6fifwGt0Aigg19rf/hmf7Hslvc6tbaJ7uQ0LjF2ybdyfHIfImvIZmNJ0NyYImOdFRxWOs+fJVHAp515NdgwaBOYBbrETa2stXLKYWTZMz1bhDYLECGOeCv4+jY5VcXo9Qup46mp00M=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMOyqD8kF1rnXg7Mn9QsgUww/Cc4EcyArXpHdqwIx2D/QNiVTP7UtmZfdzE+mgdZfXRXRV0TEsN4/sBzK2iXjCEXjZ8hB+FFiH8fslbhHfAvFw3enBh5Bsizb6FOvOvQacKccoazKBSl/pSTzZI/e2w0San1Dnkh57Fjis173/164zwNVSKJWtyHsTn5BMOVYTOrh15RIuZAUzf3u/K+/HE4AQrKPaKGo2XgEmd5aHxNCt/VC7Ya+U/QogQLqC2WJZupbNkqLUgIbKxmkhtCumOXhKbvACL7cZRbkIngTnXKPEn/A+CVCmiOKLXKpEdFn3k6awDKwdMutG1+WDx35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Wm5NzVlagE9VunbJNgABmclrs3CV+DbMwaQ1f9nzGY=;
 b=totCxVqrYFexonbXbw1CJ4JduWSz+wZxsU8Kc9yP8xdcSKWjKUGMovI74Fvz8pcdPILoHcbidJJJ+s9aO2rLJX3qKDLNUwLgO11cO6z29Wg0uj/hpLclR34rrSeu84sbQIjKAsVp2iJG7393V3O99N8FWqfxmUBKkNs2ioc5g/C2dkhm0GnyEnAsOOWe+odhDPFCg07vbl8lXwQwKyWxvSj+FR4ORxzV6ymg8OBuZyJrRrZhjADiVB5ZWECTagXVZVXOVCrxOMx7SRHz84TPOr1ef6GTRcuNMcbk8DyjQijhnscSinfN8Kep5a9F626S5Qjc/at0QsycTEsuCWAvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Wm5NzVlagE9VunbJNgABmclrs3CV+DbMwaQ1f9nzGY=;
 b=EVVWvqWS10JdiYsmBcW87s6x7nyMxCaHz4cCRlVIlQKu8HPC7ac57PjVWJWqOEGeS6FKFtbnW/xv+gMc9xLIyg6zFDDFN3TwKJsZdPdAh5rsfu2noPlpE+dcbuVv3OranJJwU3S1rUo52uI3+JgaGonRqb0ziUQrE1NpKIK4XhQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Topic: [PATCH v3 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Index: AQHbgeq9NiESuirZAUKjxGV4IoLUtLNOlIQAgAAFvICAAAbRgIAAH+aA
Date: Wed, 19 Feb 2025 15:25:13 +0000
Message-ID: <59D691D9-5A06-49C1-8B0C-E874029A97C6@arm.com>
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-2-luca.fancellu@arm.com>
 <bc6b785c-627e-4185-aa02-b90b9e592d08@suse.com>
 <E6E21F32-EA02-4DE1-80CC-98D3A21FBF79@arm.com>
 <cc864728-0302-4ddc-88e0-c5330e3dc409@suse.com>
In-Reply-To: <cc864728-0302-4ddc-88e0-c5330e3dc409@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB6523:EE_|DU2PEPF0001E9C5:EE_|AS8PR08MB9979:EE_
X-MS-Office365-Filtering-Correlation-Id: d32941dc-8e56-4c23-7602-08dd50f9a313
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?M0FMZVJmT2NNbDZCYko3MSs4KzlHVURsWE10UXk1b1crNWp5c0hUVTkrS2RS?=
 =?utf-8?B?bXZYMzVoQit3VHpmYWp0TVRqYVRiQ1dycEtqby9GTTdSV1FILzlQY25wd0sr?=
 =?utf-8?B?OTJhNEtGYmlheXZHQVBjRmY1TzJqeXc5cUhVWnhkT1F2cGpWZjVwSHFFUjRs?=
 =?utf-8?B?cjJmUGtIT3Z5Q0lvd3dmTndvbi90QVZLaVV5VlJXUWsya2RIc2xFT1Yxc1M1?=
 =?utf-8?B?NVV3SmN4R01KU3QzT0xQUUpmeFJoLzhuZ2RmQ3ZJNFh4VGhGRElRNkE4aHJi?=
 =?utf-8?B?TmlSS3JuYWZmRDFMbzZJRG56ZTUrMkJvQkpwTlp5WnRybzl2bjdjRkRrMGY5?=
 =?utf-8?B?WmJSLzRyTmZrWG5uejJmYVB0VHJqRkFPRjJmTXlOUEVkOEozSmppYklwRnkr?=
 =?utf-8?B?M3NrMXVHWnp0YlZvb1JRZXZWelBDS0FWZFUxUDdYdi9GRytTa0dLTy8yWmNx?=
 =?utf-8?B?bzN5REx4aG0xanFkL0tWMm9hVitudi9IemlNbkt1RGt5TE5WSWxOWE9WSnR3?=
 =?utf-8?B?OXZMY21Pd0w5eUt2eXZPRHRZSmFUTEFtZ3YvbVJaQkV4VmJyQS9KTlFGZUxV?=
 =?utf-8?B?eW04bEF6MmRQV3BqN1pMUklkdThPYit3SlM0aGYrWm9zUFdBWnIrdGJOMmk2?=
 =?utf-8?B?dnZpZlo1VzRZMmJWaTlmK3cvcVh5VUwyR3dibzJYN1Y0a3liYVo2ZU85b1pw?=
 =?utf-8?B?WFZYK1ZIUTU5NHhhWFB5Wnk4ZTNZN1VtUGNXSEdaREVhVFVVUFZaa0Z6VVZa?=
 =?utf-8?B?SEdDWjBFcFFNYWxqZkRWQy84S1UycHY1amQyaHpjQmR2YlFkbnROU1lPSGRH?=
 =?utf-8?B?cHh4VjR1SUpjV2RTUkFDSVFab3hEM1B0TktOTEpBVEkzK1FUVlVRUUJCNENB?=
 =?utf-8?B?ZS9ZaVBYMWpwZ3J0RlRoQmplMXVEWmhZazNUSVkyb0N4RXMxOTRIN0lUWFQ5?=
 =?utf-8?B?Q3RjcmNseVJMUHpvS0Q0VHJ4dmM4WlRZOE9vNWdDL1lzOFdyNUJYYm0yeldQ?=
 =?utf-8?B?Nldxay9tSTdDd3AyU0d6d285YjY5Nzh3OGVlZXZuUC9wM3NRZytSVW1qV2hH?=
 =?utf-8?B?dVNhMWNxdzhmSXVpVC9mcUwzanBlTzZZbGxLZnVLVzRUKzZJQjFDRk1TaVow?=
 =?utf-8?B?ckZvRDdadlo4dTQ5ZFduWGVzUzNTbmQyUUJUbndSK1BlSmcyMEl2TWxXMisr?=
 =?utf-8?B?emo3a3dxdjBxcTBaWnpBYndGMTI4M2hCUUdlKzVDNGRHYXZOaWRsaXpWd0NE?=
 =?utf-8?B?VTZKWlNZN2l0c1pYQTdqNTNPMG9wdG4rOTNFMC8vUlNwaytsYnhGRW44NjBE?=
 =?utf-8?B?ZXBQYnZ2NEtWM0QvN214V0xOZ3NPSmtMdE96NjBwQ1ZVU2piNDFNNmtRajdp?=
 =?utf-8?B?WEU3Qm12TUhyQXdmUVJpNkp3YXhVWjVPSlFBK0EvYi85VkpBalNHalJOMHJL?=
 =?utf-8?B?QWU1aG5pOUhVY0w4WlJZMHFoc1ZqWTNWWUNQV0VqY3VCZEhzU3JHdUkzUmN2?=
 =?utf-8?B?QWdVVzVyc0tOaHNhZ3hLMnBLenJ4eVhWdmprZEhYMWhad2RyYnJ3V3NkR01Z?=
 =?utf-8?B?cnFTRVhYMmc1bGx1cU1tdDhYSTF6b0JrTDlPaVJwa0s5anZ3MTdMTEpQa3RD?=
 =?utf-8?B?MG9DQlRCQjhIWldOKzBmUEFxRXBXTWU0OFV5TEtzbER0bGowVjduSTRKT2xs?=
 =?utf-8?B?YVYwbUJSRWw4ZkRkbnAwN1EyeVJucFJFZU1WcTY0YmFCeUUyN3MrcVlFVDdn?=
 =?utf-8?B?U1dOTkw4S2luTnh2aVljVzgzdlJIQzhYemp1N1NBWTRTOFhpVkFhT0lKYmpv?=
 =?utf-8?B?QWRTYy92eGZyQXFHYlJIckc0YjdmWTk2anNuMUJjSWVzUlpVUjBzdE9Pb08w?=
 =?utf-8?B?UytFZ2tjcmtjY3AvcElKSFB1Zmc0WWEyZ3RFN0xkSkV4RzRmenp2TGYzSzlP?=
 =?utf-8?Q?8vZZ4KjSbsSpn6N3g3/An0u1JN8HAxwI?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00EE5EAD4FB754479AE39076041293DE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6523
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b576675-9dc3-4ec6-0f78-08dd50f99afe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzBqdDBtbmlWejg4NWxyUjlBTXBvemswVnVKYTl3NCtNeSt1cFloQVVKWm5P?=
 =?utf-8?B?MzRrS1hJSFB3a1A3NTZHVjFlaHY3ZG84V0VkalJDTHhmVVczUjk4TjJkWHdW?=
 =?utf-8?B?Qkc5VURxNlpsOERvT3VxUXpHbXBMVCtjUkhzZm8vWnV3RE5EQWljL1Q0MS83?=
 =?utf-8?B?OWZlOXp6QjFmRU9GTTkzNlpjbk1nUmNDTE5CTHVYTU5KTTdhK3Nac0hYTUUw?=
 =?utf-8?B?THpqVHNxWFRkZ1ArajJjZVBPWGlzazUyUm5NSW5VcHU3SGNYaHNlOFFiSEtv?=
 =?utf-8?B?bU5Ea2lyWDBwakdZekJyVU5TVW1BdDlkK2sybXQ5dHpkYTAvVGNldG1uRzJV?=
 =?utf-8?B?dU02N3ZXM3o4SnAvT3Zqd2F2L2NnSnhFK1gzSkhWdXhUaHRrYUZ4V08xS0U3?=
 =?utf-8?B?ck1HeE9kMWJuSzJac083QWRSZ2JFY0YxWXcrSCtsTTJVbitYNXdIc0VBa1g4?=
 =?utf-8?B?bGs1T21qNkFKeUJXd1JtMVVPTU9zcGVIMGxzdE1CSEdFN1BxeWs0UDRDUUx5?=
 =?utf-8?B?SW5KdC9jSytoVmRLT0JlV2s3QVl1WDQ1cDFuS2FpU3ZBcHZqNFJUOTlHZmRl?=
 =?utf-8?B?T1hoY21CVDI3aU9JUFRqWVNnZmNaVk1HRERSOHVNQ3lwWVZiandMTk56eHdR?=
 =?utf-8?B?S3ZKTWxuYmJwUWZiYzkrMjlNUVJaTDNSck51N0JTSXNrZHNUM1JaMGErZE80?=
 =?utf-8?B?UjdWeE9WdUxLMGM2d1g2b3Q4MXVvQ3VvYkRlVWxubzhpdkJGN1A3S3NIek5r?=
 =?utf-8?B?ejZSWFM4enAzVkxMZkpKRHFlYXB5Sjd4ZG5UNlo3MmJXa2FSNldsdmRuaWx5?=
 =?utf-8?B?SmNSOWZXOFlRVzJjZ2hBMXBCbFY4bUc5bVN6L21qQXRDVFNBYWtzNHZRUXV5?=
 =?utf-8?B?djJhNUw1dVdibjU0N0p6anhHK1Q5L2gyeW9wdC9iL1lOOER2dVhtVVkvdGZt?=
 =?utf-8?B?NXMrc3JZQXQrQTNBdkgzUm5qYlgvTjZGS21jVC8xK2VOR2VYaFRhS2hIYnZ5?=
 =?utf-8?B?VCtwUGQ1RG5xOHVFRk9zQWljRkM4UVJDUyt1ckpGU3BWQ0s3aG9mUzczVVEz?=
 =?utf-8?B?VWxoRXdqRFdaVlozVkQ0Y0UrTFJBbXRTRFIyYlBIWXV6UjMrOEQyZlAxTWdu?=
 =?utf-8?B?ckpMalcyS25XdjM2ZXhCNStjYytTcVVtQWdKZGltVWYzdXI5ZzVJRk05d2ky?=
 =?utf-8?B?LysyM2V1MkJwMTZkOXZ4b2NuZ1BOR0l1KzRKUDdjSndkRHFlZ0VoakEzSTVO?=
 =?utf-8?B?SVlCaFVsOVVyMTJZcFUvLzlURXF5eHk1U0swSDl1YVNaV1NYbHRILzFrUzc1?=
 =?utf-8?B?bGdCQm9PY3JKVUxiV0p3bjB3dXVXS1M1NTNtT2pjM0RKT3RDSDcvMEZHNnBS?=
 =?utf-8?B?ajM0YjRqdUsxZEZLdHNuUnNidlZoMTdxVEpQakhwcUttR3R4cnluMlpCVFJL?=
 =?utf-8?B?Q2RpR0g3QWh6NmlMczZRaWszSzJXNTVQWFhhQmlTb0pwY3VMa1hnajlqaGFU?=
 =?utf-8?B?NWhnKzRna2JxbXptTmRtWHpBUDhjWXVBcDFvMmw1aVRxeU1nbEdWV3FXOWpK?=
 =?utf-8?B?eHNLenBPSHlITSt3ZXkrNjRRTU9zenMwREcydWJJbmhaZDlPS1ZFajlZOHBY?=
 =?utf-8?B?WTh0aHBzbExrdDE5RmxrdGw1WWR1VDFNN21KUkpwaHlDcjNVQlFBV0l6SkZR?=
 =?utf-8?B?bzBMTEY4cEZISHBQY1Z6WUJjb0syTXhueXJnMXI0aGl0UDRsQm1PQXRFQVIy?=
 =?utf-8?B?d0dtZ29UMVR6dlBKeTk2YWRDY05yckxmcjZFaEdNaGg5amh0N1JOdFd5d0NZ?=
 =?utf-8?B?V014M0VLdmZSR1FmU0dWSkFNSDFzRGRqYU1EZmFiUGkyQW9FbnlMMTUrNVc5?=
 =?utf-8?B?SVI5MzFHVjN1cVFNSVRIbXJOdHhnQTkzRlJEMnh3WnJESEdTQ2tiekw2OUxu?=
 =?utf-8?B?ei9jVGtIRkEzbkZPZ1A4WUdFcnJnL0VzMXlnWTVvMURFSDkrNTNZdU9GcUE5?=
 =?utf-8?Q?xu2ob2qSY0CPb+PSH3Cr3EPxBWZ8yk=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 15:25:26.9518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d32941dc-8e56-4c23-7602-08dd50f9a313
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9979

DQoNCj4gT24gMTkgRmViIDIwMjUsIGF0IDEzOjMwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTkuMDIuMjAyNSAxNDowNiwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAxOSBGZWIgMjAyNSwgYXQgMTI6NDUsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMTguMDIuMjAyNSAxMDo1MSwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4+Pj4gKysrIGIv
eGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4+Pj4gQEAgLTExMCw2ICsxMTAsOCBAQCBleHRlcm4g
aW50OF90IGlvbW11X2h3ZG9tX3Jlc2VydmVkOw0KPj4+PiANCj4+Pj4gZXh0ZXJuIHVuc2lnbmVk
IGludCBpb21tdV9kZXZfaW90bGJfdGltZW91dDsNCj4+Pj4gDQo+Pj4+ICsjaWZkZWYgQ09ORklH
X0hBU19QQVNTVEhST1VHSA0KPj4+PiArDQo+Pj4+IGludCBpb21tdV9zZXR1cCh2b2lkKTsNCj4+
Pj4gaW50IGlvbW11X2hhcmR3YXJlX3NldHVwKHZvaWQpOw0KPj4+PiANCj4+Pj4gQEAgLTEyMiw2
ICsxMjQsMjggQEAgaW50IGFyY2hfaW9tbXVfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCk7
DQo+Pj4+IHZvaWQgYXJjaF9pb21tdV9jaGVja19hdXRvdHJhbnNsYXRlZF9od2RvbShzdHJ1Y3Qg
ZG9tYWluICpkKTsNCj4+Pj4gdm9pZCBhcmNoX2lvbW11X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFp
biAqZCk7DQo+Pj4+IA0KPj4+PiArI2Vsc2UNCj4+Pj4gKw0KPj4+PiArc3RhdGljIGlubGluZSBp
bnQgaW9tbXVfc2V0dXAodm9pZCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICByZXR1cm4gLUVOT0RFVjsN
Cj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiArc3RhdGljIGlubGluZSBpbnQgaW9tbXVfZG9tYWluX2lu
aXQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IG9wdHMpDQo+Pj4+ICt7DQo+Pj4+ICsg
ICAgLyoNCj4+Pj4gKyAgICAgKiBXaGVuICFIQVNfUEFTU1RIUk9VR0gsIGlvbW11X2VuYWJsZWQg
aXMgc2V0IHRvIGZhbHNlIGFuZCB0aGUgZXhwZWN0ZWQNCj4+Pj4gKyAgICAgKiBiZWhhdmlvdXIg
b2YgdGhpcyBmdW5jdGlvbiBpcyB0byByZXR1cm4gc3VjY2VzcyBpbiB0aGF0IGNhc2UuDQo+Pj4+
ICsgICAgICovDQo+Pj4+ICsgICAgcmV0dXJuIDA7DQo+Pj4+ICt9DQo+Pj4gDQo+Pj4gSG1tLiBX
b3VsZCB0aGUgZnVuY3Rpb24gYmUgYW55d2hlcmUgbmVhciBsaWtlbHkgdG8gZG8gYW55dGhpbmcg
ZWxzZSB0aGFuDQo+Pj4gd2hhdCBpdCdzIGV4cGVjdGVkIHRvIGRvPyBNeSBvcmlnaW5hbCBjb25j
ZXJuIGhlcmUgd2FzIHdpdGggIm9wdHMiDQo+Pj4gcGVyaGFwcyBhc2tpbmcgZm9yIHNvbWV0aGlu
ZyB0aGF0IGNhbm5vdCBiZSBzdXBwb3J0ZWQuIEJ1dCB0aGF0IHdhcyB3cm9uZw0KPj4+IHRoaW5r
aW5nIG9uIG15IHBhcnQuIEhlcmUgd2hhdCB5b3UgZG8gaXMgZWZmZWN0aXZlbHkgb3Blbi1jb2Rl
IHdoYXQgdGhlDQo+Pj4gcmVhbCBpb21tdV9kb21haW5faW5pdCgpIHdvdWxkIGRvOiBSZXR1cm4g
c3VjY2VzcyB3aGVuICFpc19pb21tdV9lbmFibGVkKCkuDQo+Pj4gV2hpY2ggaW4gdHVybiBmb2xs
b3dzIGZyb20gIWlvbW11X2VuYWJsZWQgd2hlbiAhSEFTX1BBU1NUSFJPVUdILg0KPj4+IA0KPj4+
IE9uIHRoYXQgYmFzaXMgSSdkIGJlIG9rYXkgaWYgdGhlIGNvbW1lbnQgd2FzIGRyb3BwZWQgYWdh
aW4uIEVsc2UgaXQgaW1vDQo+Pj4gd2FudHMgcmUtd29yZGluZyB0byBnZXQgY2xvc2VyIHRvIHRo
ZSBleHBsYW5hdGlvbiBhYm92ZS4NCj4+IA0KPj4gV291bGQgaXQgYmUgb2sgZm9yIHlvdSBhIGNv
bW1lbnQgc2F5aW5nOg0KPj4g4oCcVGhpcyBzdHViIHJldHVybnMgdGhlIHNhbWUgYXMgdGhlIHJl
YWwgaW9tbXVfZG9tYWluX2luaXQoKQ0KPj4gZnVuY3Rpb246IHN1Y2Nlc3Mgd2hlbiAhaXNfaW9t
bXVfZW5hYmxlZCgpLCB3aGljaCB2YWx1ZSBpcyBiYXNlZCBvbiBpb21tdV9lbmFibGVkDQo+PiB0
aGF0IGlzIGZhbHNlIHdoZW4gIUhBU19QQVNTVEhST1VHSCINCj4gDQo+IEknbSBzb3JyeSwgYnV0
IHRoaXMgaXMgdG9vIHZlcmJvc2UgZm9yIG15IHRhc3RlLiBXaGF0J3Mgd3Jvbmcgd2l0aCB0aGUg
bW9yZQ0KPiB0ZXJzZQ0KPiANCj4gIlJldHVybiBhcyB0aGUgcmVhbCBpb21tdV9kb21haW5faW5p
dCgpIHdvdWxkOiBTdWNjZXNzIHdoZW4NCj4gIWlzX2lvbW11X2VuYWJsZWQoKSwgZm9sbG93aW5n
IGZyb20gIWlvbW11X2VuYWJsZWQgd2hlbiAhSEFTX1BBU1NUSFJPVUdIIg0KPiANCj4gPw0KDQpu
b3RoaW5nIHdyb25nLCBJ4oCZbGwgdXNlIHRoYXQsIHRoYW5rcyBmb3IgY29uZmlybWluZy4NCg0K
PiANCj4+Pj4gQEAgLTM4MywxMiArNDI5LDEyIEBAIHN0cnVjdCBkb21haW5faW9tbXUgew0KPj4+
PiAjZGVmaW5lIGlvbW11X3NldF9mZWF0dXJlKGQsIGYpICAgc2V0X2JpdChmLCBkb21faW9tbXUo
ZCktPmZlYXR1cmVzKQ0KPj4+PiAjZGVmaW5lIGlvbW11X2NsZWFyX2ZlYXR1cmUoZCwgZikgY2xl
YXJfYml0KGYsIGRvbV9pb21tdShkKS0+ZmVhdHVyZXMpDQo+Pj4+IA0KPj4+PiArI2lmZGVmIENP
TkZJR19IQVNfUEFTU1RIUk9VR0gNCj4+Pj4gLyogQXJlIHdlIHVzaW5nIHRoZSBkb21haW4gUDJN
IHRhYmxlIGFzIGl0cyBJT01NVSBwYWdldGFibGU/ICovDQo+Pj4+ICNkZWZpbmUgaW9tbXVfdXNl
X2hhcF9wdChkKSAgICAgICAoSVNfRU5BQkxFRChDT05GSUdfSFZNKSAmJiBcDQo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb21faW9tbXUoZCktPmhhcF9wdF9zaGFyZSkN
Cj4+Pj4gDQo+Pj4+IC8qIERvZXMgdGhlIElPTU1VIHBhZ2V0YWJsZSBuZWVkIHRvIGJlIGtlcHQg
c3luY2hyb25pemVkIHdpdGggdGhlIFAyTSAqLw0KPj4+PiAtI2lmZGVmIENPTkZJR19IQVNfUEFT
U1RIUk9VR0gNCj4+Pj4gI2RlZmluZSBuZWVkX2lvbW11X3B0X3N5bmMoZCkgICAgIChkb21faW9t
bXUoZCktPm5lZWRfc3luYykNCj4+Pj4gDQo+Pj4+IGludCBpb21tdV9kb19kb21jdGwoc3RydWN0
IHhlbl9kb21jdGwgKmRvbWN0bCwgc3RydWN0IGRvbWFpbiAqZCwNCj4+PiANCj4+PiBDb21pbmcg
YmFjayB0byBteSB2MiBjb21tZW50OiBXaHkgZXhhY3RseSBpcyB0aGlzIGNoYW5nZSBuZWVkZWQg
aGVyZT8gSWYNCj4+PiB0aGluZ3MgYnVpbGQgZmluZSB3aXRob3V0IHRoZSBtYWNybyBiZWluZyBk
ZWZpbmVkIHdoZW4gIUhBU19QQVNTVEhST1VHSCwNCj4+PiBzdXJlbHkgdGhleSB3aWxsIGFsc28g
YnVpbGQgZmluZSB3aXRoIGl0IGJlaW5nIGRlZmluZWQ/DQo+PiANCj4+IEnigJl2ZSBkZWZpbmVk
IGFuIGVtcHR5IHN0dWIgb24gYW4gaGVhZGVyIGluY2x1ZGVkIG9ubHkgb24gTVBVIHN5c3RlbXMg
Zm9yIHRoZQ0KPj4gcDJtIG1vZHVsZSwgdGhpcyBpcyB3aHkgaXQgaXMgYnVpbGRpbmcNCj4gDQo+
IEJ1dCB0aGF0IHdhc24ndCBwYXJ0IG9mIHRoZSBwYXRjaCwgd2FzIGl0PyBJLmUuIHdpdGggdGhp
cyBzZXJpZXMgYWxvbmUNCj4gYXBwbGllZCwgdGhpbmdzIHN0aWxsIGRvbid0IGJ1aWxkPw0KDQp5
ZXMsIGJlZm9yZSBidWlsZGluZyB0aGVyZSBhcmUgb3RoZXIgYml0cyBuZWVkZWQsIHRoaXMgaXMg
b25seSBhIHNtYWxsIHN0ZXAgdG93YXJkcyB0aGF0Lg0KDQo+IA0KPj4gSSBkaWRu4oCZdCBtb2Rp
ZnkgcDJtX3NldF93YXlfZmx1c2goKSB3aGljaCBsaXZlcyBpbiBhcm0gY29tbW9uIGNvZGUsIGJl
Y2F1c2UNCj4+IGl0IHdpbGwgYmUgdXNlZCBhbHNvIG9uIE1QVSBzeXN0ZW1zIChSODIgaGFzIE1Q
VSBhdCBFTDIgYnV0IE1NVS9NUFUgYXQgRUwxKQ0KPj4gYW5kIEkgd291bGQgbGlrZSB0byBzdGF5
IHRoZSBzYW1lIGFuZCBiZSB1c2VkIGJ5IE1NVS9NUFUgc3Vic3lzdGVtcy4NCj4+IA0KPj4+IEFz
IHBlciB0aGUNCj4+PiByZXNwZWN0aXZlIHJldmxvZyBlbnRyeSwgdGhpcyBjaGFuZ2UgbG9va3Mg
dG8gYmVsb25nIGludG8gd2hhdGV2ZXIgaXMNCj4+PiBnb2luZyB0byBiZSBkb25lIHRvIGRlYWwg
d2l0aCB0aGUgb25lIEFybSB1c2Ugb2YgdGhlIG1hY3JvLiBPciBtYXliZQ0KPj4+IGl0J3MgdW5u
ZWVkZWQgYWx0b2dldGhlci4NCj4+IA0KPj4gSSBkaWRu4oCZdCB1bmRlcnN0YW5kIHRoYXQgeW91
IHdlcmUgb3Bwb3NpbmcgdG8gcHJvdGVjdGluZyBpb21tdV91c2VfaGFwX3B0KCkgd2hlbg0KPj4g
IUhBU19QQVNTVEhST1VHSCwgSSB0aG91Z2h0IHlvdSB3ZXJlIHJlZmVycmluZyBvbmx5IHRvIHRo
ZSBzdHViIGluIHRoZSAjZWxzZQ0KPj4gYnJhbmNoLg0KPj4gQ2FuIEkgYXNrIHdoeT8NCj4gDQo+
IFN1cmUuIEFuZCBubywgSSdtIG5vdCBhZ2FpbnN0IHRoZSBleHRyYSBwcm90ZWN0aW9uLiBJJ20g
YWdhaW5zdCB1bm5lY2Vzc2FyeQ0KPiBjb2RlIGNodXJuLiBUaGF0IGlzLCBhbnkgc3VjaCBhIHJl
LWFycmFuZ2VtZW50IHdhbnRzIHRvIGhhdmUgc29tZSBraW5kIG9mDQo+IGp1c3RpZmljYXRpb24u
DQoNCm9rLCB5ZXMgdGhlIGp1c3RpZmljYXRpb24gaXMgdGhhdCBNUFUgc3lzdGVtIHdpbGwgYmUg
YnVpbHQgd2l0aCAhSEFTX1BBU1NUSFJPVUdILA0KYnV0IHRoZXJlIGlzIGEgY29tbW9uIGZ1bmN0
aW9uIChwMm1fc2V0X3dheV9mbHVzaCkgdG8gTU1VL01QVSBzdWJzeXN0ZW0gdGhhdA0KSSB3b3Vs
ZCBsaWtlIHRvIGtlZXAgY29tbW9uLCB0byBkbyBzbyBJIGhhdmUgdG8gaGlkZSB0aGUgbWFjcm8g
aW4gdGhpcyBwYXJ0aWN1bGFyDQpjb25maWd1cmF0aW9uIGFuZCBhZnRlcndhcmRzIEkgaGF2ZSB0
d28gY2hvaWNlczoNCg0KMSkgcHJvdmlkZSBhIHN0dWIgaW1wbGVtZW50YXRpb24gb24gdGhlIEFy
bSBzaWRlDQoyKSBwcm92aWRlIGEgc3R1YiBpbXBsZW1lbnRhdGlvbiBpbiBpb21tdS5oDQoNCm51
bWJlciAyIGZlbHQgYmV0dGVyIGJlY2F1c2UgaXQgY291bGQgYmUgYXBwbGllZCBvbiBhbnkgWGVu
IGNvbmZpZ3VyYXRpb24gd2l0aG91dA0KSEFTX1BBU1NUSFJPVUdILCBldmVuIGlmIGF0IHRoZSBt
b21lbnQgdGhlcmUgaXMgb25seSBNUFUuDQoNCk51bWJlciAxIGxldCB0aGUgcG9zc2liaWxpdHkg
Zm9yIHRoZSBzcGVjaWZpYyBjb25maWd1cmF0aW9uIHRvIGNob29zZSB3aGF0IHRvIGRvIGluIGFi
c2VuY2UNCm9mIEhBU19QQVNTVEhST1VHSC4NCg0KTm93IEkgd291bGQgbGlrZSB5b3VyIHZpZXcg
b24gd2hhdCB3b3VsZCBiZSBhY2NlcHRhYmxlIGhlcmUuDQoNCj4gDQo+PiBpbiBhbnkgY2FzZSB3
aGVuICFIQVNfUEFTU1RIUk9VR0gsIHRoaXMgbWFjcm8gaXMgbm90IHVzYWJsZQ0KPj4gc2luY2Ug
ZG9tX2lvbW11KCkgaXMgcmVzb2x2ZWQgdG8gYSBtZW1iZWQgdGhhdCBkb2VzbuKAmXQgZXhpc3Qg
aW4gdGhlIGNvbmZpZ3VyYXRpb24sDQo+PiBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KPiANCj4g
WW91IHZlcnkgbGlrZWx5IGFyZW4ndCwgeWV0IHRoZSBtYWNybydzIHByZXNlbmNlIGFsc28gZG9l
cyBubyBoYXJtLiBXZQ0KPiBoYXZlIGxvdHMgb2YgbWFjcm9zIGFuZCBkZWNsYXJhdGlvbnMgd2hp
Y2ggYXJlIHVzYWJsZSBvbmx5IGluIGNlcnRhaW4NCj4gY29uZmlndXJhdGlvbnMuIFNvbWV0aW1l
cyB0aGlzIGp1c3QgaGFwcGVucyB0byBiZSB0aGF0IHdheSwgc29tZXRpbWVzIGl0J3MNCj4gYWN0
dWFsbHkgZGVsaWJlcmF0ZSAoZS5nLiB0byBmYWNpbGl0YXRlIERDRSkuDQoNCk9rLCBpbiB0aGlz
IHBhcnRpY3VsYXIgY2FzZSwgYXMgSSBleHBsYWluZWQgYWJvdmUsIHRoaXMgbWFjcm8gaXMgb25l
IG9mIHRoZSB0aGluZyBwcmV2ZW50aW5nDQpBcm0gTVBVIHNpZGUgdG8gYnVpbGQsIG90aGVyd2lz
ZSBJIHdvdWxkbuKAmXQgaGF2ZSB0b3VjaGVkIGl0Lg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==


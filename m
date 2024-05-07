Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB28BE55C
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 16:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718170.1120736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LYW-00028m-VL; Tue, 07 May 2024 14:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718170.1120736; Tue, 07 May 2024 14:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4LYW-00026F-S6; Tue, 07 May 2024 14:12:32 +0000
Received: by outflank-mailman (input) for mailman id 718170;
 Tue, 07 May 2024 14:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rSc=MK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s4LYV-00024W-Cl
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 14:12:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260d::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d68aaf5c-0c7b-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 16:12:29 +0200 (CEST)
Received: from AM6P195CA0089.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::30)
 by GV1PR08MB7804.eurprd08.prod.outlook.com (2603:10a6:150:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 14:12:27 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:209:86:cafe::a3) by AM6P195CA0089.outlook.office365.com
 (2603:10a6:209:86::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Tue, 7 May 2024 14:12:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Tue, 7 May 2024 14:12:26 +0000
Received: ("Tessian outbound b7675f20d34d:v315");
 Tue, 07 May 2024 14:12:26 +0000
Received: from ac1c0323418b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E8036E1E-7F29-4152-86EB-DBCFB612FF0F.1; 
 Tue, 07 May 2024 14:12:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac1c0323418b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 May 2024 14:12:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB8046.eurprd08.prod.outlook.com (2603:10a6:20b:586::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 14:12:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 14:12:12 +0000
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
X-Inumbo-ID: d68aaf5c-0c7b-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UtTm13LDuSpDP+vDkOwLugl/PwQE+IGIvJtOgWU1yOBZr6HKGns6Lvp33+kNp8PdxSC4TPh9O49k58Melae0J13XjjjcWGstbNL7uuO9J7tYPIiKgEstJDVW39QSjZUOORn7hJN1Q87l4UPBdqaxQeJV/gYtap1leNMyY0DVzlsXZKlBjp3xHMvB9sasDZgCNjn9HxaDrjGqiAhiPxShcrTLeetOPLOqrck882imgH4C3guxF2vqzJfzb/+zp3M1KgB7eYBx1yXZh3R5mp7qqaU2l9k56Q9FHswkuJAUvzi+rZTIVLrTltnI+ELqSMmhiye4zbWRbBlu95d/Iy0cnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTbXAxOSkw4qUW8xcnWH29JWsqQgbakDLygqvGzklhI=;
 b=EqiKoRPc96OfnKjN9QTmt4RWN1kPhUboVW6tnGb/3CcwsPqsGb6qqE+oIu4P0A2Fvcb1VyF/kz3XsETWwNZksUUfQGzGt1t1GWptTPO3r2jnDKlPkHb2d2wtDTHWM2z3XdXM83/LzpZJYZ+E8GMwLq8bsqRtfDL9gSAXYlAE1ez5W1D+W7eaYvz1eGXEWlKTeysJQrC58JZWEXtN8RTJQrhfwALxRRutdRUSlFniXtfu+KEhuJV5DCQNEkc5w7M4pTzVTVjYSZqONOvm55Z38BSuu8Sn1yxQXNaobSx6DDSGNevbLgk3ZSTUVawMkMBgzUcJHSkw+wbCcl6YQFwLeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTbXAxOSkw4qUW8xcnWH29JWsqQgbakDLygqvGzklhI=;
 b=QAqoAZchFepHexAXTOjfV1a9ceQBVNZhNY0TOm6/4O9Sc6z6VhtX4GQGBYEKnrev8GpmbwdFWuMLqpVrdhxCqLthbY+cyLNGqT//FE3RWgSvOyjh6pgPDQxYtuEGdyOueb41/FyzVxzlcm5G3IR9om+eOxKqbbbTveMqa7f/hJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80355d62aeaa91a6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAXi/9m2G41n/1Q8wnyDPSPtrr1GfU7tmcKMK4Pjwz0P1PToKOGaYFmDl5DQmiCvE8E51V6IxLp1rBv4aKGEytIfw8vsMhv3He3zML599GU+IDTicMEseqj12LTIQO8iwIZIRZATFKNRN/StCCOhlIWP3rMJCdtvJ8iuC3569zaVRQo9NigVpt0X5rIGSuoZv9tCi2mj8j1VYDmwRJsJISOZLjehFmtgqKXIU18xPbn4IDU1v+lzG0V9uCVM7wU8rQcbaGnYxurMD6FpKINdA4f8gyq0Awjb47xjw9dOJ8UzlSKrbr3EVXi1z2sT8S2l04KGF0BYJX5UQaTPGjqBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTbXAxOSkw4qUW8xcnWH29JWsqQgbakDLygqvGzklhI=;
 b=hscYlr5hUkGieuYtTUbrzW99jBGVJf0llQfHmUk4oU36nyaRlf26fUCW4N+QsVzzX7+MMGBSD+PoBnYUmbKwrSadQtqerGpf24P0aYZW+hH7A7wGZ/QlZoAjXnMTBK5RSOQ9HBOsitvO7HOMIHpqfwL+KRZV/SU+SAplVsV6GI/lVujv/LC7M3WRkUklmIbUWKohXoFnF6kmLVWBlTMrft/9gKzgMcnI4JcfCOUXhcmdozSxfTjR2wOcTS20EgaqFjHmY9QDpr4yjc0TUw3teLw47vzRQsDqd5/eMbPVLyNcys6vaFdUffa7sMSJJfi61lTznJ86ucoQv2Pd4IQkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTbXAxOSkw4qUW8xcnWH29JWsqQgbakDLygqvGzklhI=;
 b=QAqoAZchFepHexAXTOjfV1a9ceQBVNZhNY0TOm6/4O9Sc6z6VhtX4GQGBYEKnrev8GpmbwdFWuMLqpVrdhxCqLthbY+cyLNGqT//FE3RWgSvOyjh6pgPDQxYtuEGdyOueb41/FyzVxzlcm5G3IR9om+eOxKqbbbTveMqa7f/hJs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/7] xen/arm: Lookup bootinfo shm bank during the mapping
Thread-Topic: [PATCH 1/7] xen/arm: Lookup bootinfo shm bank during the mapping
Thread-Index: AQHalVftWBiV4yp+FUmOns8otkWCO7GKRsoAgAGX6oCAAATTgIAAAtiA
Date: Tue, 7 May 2024 14:12:12 +0000
Message-ID: <2121ADBD-87D6-48B7-AFDF-9F79DBCFBFD1@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-2-luca.fancellu@arm.com>
 <28322f07-99fc-4428-bcf2-b8c2af04d38b@amd.com>
 <882A5390-64AC-4FB6-AA53-4CE466CF9062@arm.com>
 <2a33e7b2-c958-4a63-a9ea-40e9940b4253@amd.com>
In-Reply-To: <2a33e7b2-c958-4a63-a9ea-40e9940b4253@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB8046:EE_|AM3PEPF00009BA1:EE_|GV1PR08MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce6135e-0663-45ee-0e60-08dc6e9fb957
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?clFYRHZOQS9nOTJ5NUhIdXJPZXBHR2F3TjF3NU9mbEFyZlVSYzIySEw4MFds?=
 =?utf-8?B?dWpOQXFhaWpIVXQzaWRHNkFZelJhVjVOVkZBUnZSQUlmdlN1UDhod1l5WjVT?=
 =?utf-8?B?N2JDT1VTYkJuQWlNTCtIamo0bDJPWitGZi9MYlM3a0U0T3kybm5ZSG9zNHpl?=
 =?utf-8?B?d0ZEUkNXb01BaHlCREZscTJXZ2tkUWVzMFlQY0d5UjBIcXVIK0xKOU5pUDZH?=
 =?utf-8?B?ZGdiNnZLUDBXRXNlLzlHdkhQbDQrbTg1VTErYS9TdmMraVVpenlFZDY4aC9M?=
 =?utf-8?B?L2lzcDhER0EybkdGdytXS3R3dWdua1RISVdZOHhxb3RqSFBJRHlVaXdrenU2?=
 =?utf-8?B?L2lOSkV1V1ZlUkxTV0w4S0RadVBvQWdMQ3gwQzhtVU9ib3BwVUwrL3ZSMVBU?=
 =?utf-8?B?MitzMXVDSXNFb0ZxZ3ViY0VvZXBZSEZCSmFGK3NjTG1QMnNsTVVlczVmZ3RY?=
 =?utf-8?B?d3JoUk1PN056OXorU3paVmpid3BZTk5pbzVjTjM2ZXhnVzI0NTBuOHUxeG02?=
 =?utf-8?B?dFBuQmo0eitLMDBQS2YzUDdWcG83RWpwQXNFVUtieU9RYWVUUWk4UUVORnRN?=
 =?utf-8?B?OVk3bXhRY0NWdldKOVAzSm5TT2NyTDZtRldac01DRHNEU2dXL0RvY0lNNHZx?=
 =?utf-8?B?TytBdCtMczM1U2prR3FlaDEwWXhodHozajNPNy9icWJ5eG95WEp2eFVpVCtO?=
 =?utf-8?B?MStzTUNSVC9YYkVjMGRxUUQ5YTMweHFpVzJRM2MvbzI2MXJhOW9XV1BMS2ZS?=
 =?utf-8?B?THNzdzNFQndONWZZNHJOYVlYOWZUSkZXNTdpR1p6QTVwRUdSRTFHQ0FScHlW?=
 =?utf-8?B?VkdqeUEyWHoyaTRITlBTV3kxUkllbUdidTFZWGVsa1ozVW5YaThReGdoTnRV?=
 =?utf-8?B?bkx1VVl3SnhodWNFZkE0OUh0dEdjT1ozSG9ERy9xcDZ5c2J4UVZ3OERWVjlK?=
 =?utf-8?B?eG82dVpKYkIyQWsrTUl6aThjSThHcWMrWGIxbk1zcDNnd0RMTElJR1BTWWRX?=
 =?utf-8?B?aHRQSkVkSHZHcjFEaUsxVURaWXVHc3hiU2d0VE5HWHk5TFJ4SXI0VEJ0ZjNt?=
 =?utf-8?B?WVYza1B0R3lSNzdra1A0eldia2RwVDJZWmM4MFFVUVB5cVVZRkVNK3FUMEdZ?=
 =?utf-8?B?NTFDUWRoV2ZPSWx1YzZsVldTUGQvMk4veXBDdGc1YllKNjBoOHJFRWtUbnFI?=
 =?utf-8?B?bERmbHJrUzczd0lDOHNldGpUKzRRcDl4NlYrdjFscjg3MjlQRmtxa0xhWk9t?=
 =?utf-8?B?Y1VWZ0ovTmxDbTlPNExWYkw2NHJlbXpETUdTbnFCZllGbTc2T3BkUkVTWEh1?=
 =?utf-8?B?RWk5MzJkeUNIQUE4UGFmL0w2cHJ6UGVNQWxMMEZLZUJrb0s2WENYTzZWWjBp?=
 =?utf-8?B?K2poTHVNUXJBZjRoUjhnblJIV3U2Y2pPUk9kTlBsVlRrMmVESW1sSFFHSzJt?=
 =?utf-8?B?NnM1YklCbEN4czdyUENxQy82SXpUaXdXdWtkbklqS05sY2g4QUd2MEd3QnJR?=
 =?utf-8?B?bUpoZEJnNE1ieFZCR0toWXBQck9aK1JIM2gwMHNtS2VLTktwd2hhU0UxejJE?=
 =?utf-8?B?M3FIS2l5TU82eDVVQmNZby92RmRvMUJWREcwbVpIU1pNNWtjZnNMcGJvNXRp?=
 =?utf-8?B?alp1LzFkMDBGQkZpSEdnMHJUVGZ5TC9FWVU1TXV0emlWMnVCdkdiemhNL2I1?=
 =?utf-8?B?VHFOZ3BGRGNCeVlNU2pIbW1pY3N5VEpvbUdieVRTeVNkM1lmeUU4NnpucDkv?=
 =?utf-8?B?SEo0OFVzUkdtSTZ2RnZ4K2NMeVhBdWlTSjF3cDQ2c255ZkJ1a3diTDNmemNi?=
 =?utf-8?B?RVEzOFAyU2xOTWY5TEt3Zz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DC5C736EDCCC24394A2EE7F96FB8BF3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8046
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1892db06-1343-4812-4c57-08dc6e9fb0ac
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|35042699013|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnpCU0tZTWlzYVdEeGhIaWhsSThIemRGS0t6blNKVGljY3pTcFd4WnFEeUgx?=
 =?utf-8?B?SlpZK1dkU21tRFdJVEFIU0I3azRQSDFUR3pnL0R0UUhPQzdpTk5KVEg5SHY5?=
 =?utf-8?B?cForNHl0NTZDT05BYXVmb1MwYmJPWWRKWWxkbTIwTmowRnhlMkJ6NEtxbUNY?=
 =?utf-8?B?OFlIdXYwWU5YakU2a2NZVFBjcjVHakovSGxJTlkyY0hUOFBoblcwdUllRGYv?=
 =?utf-8?B?THI1SllsWHBuaVJuUC9tdTltNjJCZFR3MmdJRlQwSFNaSnZJMTV5dWZibVBS?=
 =?utf-8?B?WkEzZXBkL0tDOGZjTk51UlNYRGhVbUhielFnZlBsWlpDRkJkMVVDTGlzdHRu?=
 =?utf-8?B?WjJSTVNVOWNwaUtNZmE1WERlb3JVZXpQd3BRdGtwNUlCYzBMRUtadkJKVjBI?=
 =?utf-8?B?aktmdGxQNUhlb0ZlZkxEeEdXdlhKaHE2dHVkVGoxb2htSDNQY0lJdTZ6eTJk?=
 =?utf-8?B?NVRZRUhvbjRzN3JSNVc4RHVWWFpaaElhUHNmdmpUazRGTmpYQlJ0QzhEcTZ0?=
 =?utf-8?B?d01SRDhyUmlpU2Vja0FLK28rbTdVNGxVSytHMDJLTFhRb0hxdDl4UXF3R3Vj?=
 =?utf-8?B?aG9PN3hVd2s2L21nbTRHTVRlaC9sV0NsdjZpV0REVkE4Q0NHSzEvVVJzVG43?=
 =?utf-8?B?R3F2eHppKzlqTlR6T01jRU9zUjlqLzJnVmowZFpPK0xuZ1EzcWdvU2xmRnQ2?=
 =?utf-8?B?TXBQLzE1TDVjRGM1UnBIYnc2V3E2WUU4Q3NCL0Q3aUVpaWFQUkFjRzAyTHBJ?=
 =?utf-8?B?eEJ6YXFIUnJUZW1yS0hEanJucUlKbjlmM3MrSERhaHBjR0ttRkZOSjd3YURO?=
 =?utf-8?B?Zmx1aTVzYW1KdmhodmJqekI2YUZXMUJmOHd6eWx0akhSZzZWUnB1d1BZR3VU?=
 =?utf-8?B?dkE2QVU5M2t4U3ZlNm91VldsaFdvc2pZTkJBWjRQZTY3NjVLbVJpQjNyUDMx?=
 =?utf-8?B?ZFJQRE0zWUxMV0l1aWxNamxEdGFUVnZUTkczMzVBQVVpamROUXBBRW1UOGdY?=
 =?utf-8?B?SThXc1JMV1dNZEh4NnRNdkpMN2ZNalA0Y29VVWtwMCtJYzRhcXk1dHBLa295?=
 =?utf-8?B?Q0hWUTdSSW9YYk9jWStFeUM2eFNJdmMxVE1FK3o5ZzQ0TFp5WnpuSndxVE5w?=
 =?utf-8?B?S1R1dWhHNEs2MHdMeC9qMGJ6ZGhHa2t4b0tvWTZ5MWMvRWs0dTUzNkVMSTNM?=
 =?utf-8?B?N05VS1gxVkZrR1VzUTNOcllQbElBbXU2NmlDZEZmb2R4Y2JiNUg2RFE2dWhX?=
 =?utf-8?B?WERhWTF6WkVwelozdVlJNCtCR21UYlF1eGp0TmtvYmowcmRwbWlZMlBQTGd6?=
 =?utf-8?B?MlRYS3Nod3JOeDZZYmNqY3Noa2xnT0NHUVZQa01pK3VoQTNBemQrVlN3N3cy?=
 =?utf-8?B?L0NpSUF2S0JiNkhoZEFkdk1oblNNVDdHZ0lsbnIwWTVFNW0zZjhWTGxzOVY1?=
 =?utf-8?B?WGdmb1NaK0J3RHJVSzlzU3N0eGhMQUhkV1pObVhXYVpBY2JCUWpZRnhxZWNW?=
 =?utf-8?B?Nkh0QWV1bHVRbE1BcFE4eEVwVGVTMDZmU3BLeDdPd1hkWG1KdjJ5alRVT3I2?=
 =?utf-8?B?UjI3eXB4TDJZYUw4ZWx4aXdmRDZkN1UrZFVUSGlDZXhFWngvRmtFWFBLTk9v?=
 =?utf-8?B?K0xFZGcyV3VuM3hYaU9DOVdLK2dZakUxaDhzaVBveDYwamdSMnNaYjd2ZnNP?=
 =?utf-8?B?YVdNV2MyMUxtRzFSVW5YSVo1Z1ZnS2xsVW1CT2tPejM0MXRDQS8waEgyTjEw?=
 =?utf-8?B?UkV4YlRpMkhWWFZ1WU9PaUptYm9FT2tCZ0hhM2xFTkMxYjdpT2pOb2VqWG5u?=
 =?utf-8?Q?Dd2bNZTrgHBhUGBJbPxa9GzRw5fgLMXeHz4T0=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(35042699013)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 14:12:26.7644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce6135e-0663-45ee-0e60-08dc6e9fb957
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7804

SGkgTWljaGFsLA0KDQo+PiANCj4+Pj4gDQo+Pj4+IEBAIC00NDAsNiArNDMxLDI2IEBAIGludCBf
X2luaXQgcHJvY2Vzc19zaG1fbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLCB1aW50MzJf
dCBhZGRyZXNzX2NlbGxzLA0KPj4+PiAgICBkZXZpY2VfdHJlZV9nZXRfcmVnKCZjZWxsLCBhZGRy
ZXNzX2NlbGxzLCBhZGRyZXNzX2NlbGxzLCAmcGFkZHIsICZnYWRkcik7DQo+Pj4+ICAgIHNpemUg
PSBkdF9uZXh0X2NlbGwoc2l6ZV9jZWxscywgJmNlbGwpOw0KPj4+PiANCj4+Pj4gKyAgICBpZiAo
ICFJU19BTElHTkVEKHBhZGRyLCBQQUdFX1NJWkUpICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsgICAg
ICAgIHByaW50aygiZmR0OiBwaHlzaWNhbCBhZGRyZXNzIDB4JSJQUklwYWRkciIgaXMgbm90IHN1
aXRhYmx5IGFsaWduZWQuXG4iLA0KPj4+PiArICAgICAgICAgICAgICAgcGFkZHIpOw0KPj4+PiAr
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICBp
ZiAoICFJU19BTElHTkVEKGdhZGRyLCBQQUdFX1NJWkUpICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsg
ICAgICAgIHByaW50aygiZmR0OiBndWVzdCBhZGRyZXNzIDB4JSJQUklwYWRkciIgaXMgbm90IHN1
aXRhYmx5IGFsaWduZWQuXG4iLA0KPj4+PiArICAgICAgICAgICAgICAgZ2FkZHIpOw0KPj4+PiAr
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICBp
ZiAoICFJU19BTElHTkVEKHNpemUsIFBBR0VfU0laRSkgKQ0KPj4+IFdoYXQgc2Vuc2UgZG9lcyBp
dCBtYWtlIHRvIGNoZWNrIGZvciBzaXplIGJlaW5nIGFsaWduZWQgYmVmb3JlIGNoZWNraW5nIGZv
ciBzaXplIGJlaW5nIDA/IEl0IHdvdWxkIHBhc3MgdGhpcyBjaGVjay4NCj4+IA0KPj4gWWVzLCBi
dXQgaW4gdGhlIGVuZCB3ZSBhcmUgZG9pbmcgdGhhdCB0byBwcmludCBhIGRpZmZlcmVudCBlcnJv
ciBtZXNzYWdlLCBzbyBpdCB3b3VsZCBwYXNzDQo+PiBmb3IgMCBhbmQgaXTigJlzIHRvdGFsbHkg
ZmluZSwgYnV0IGluIHRoZSBlbmQgaXQgd2lsbCBmYWlsIGFmdGVyd2FyZHMuIEkgZG9u4oCZdCBz
ZWUgZnVuY3Rpb25hbCBkaXNydXB0aW9ucw0KPj4gaGF2aW5nIHRoaXMgb25lIGJlZm9yZSB0aGUg
b3RoZXIsIHdoYXQgaXMgdGhlIGNvbmNlcm4gaGVyZT8NCj4gSXQgZG9lcyBub3QgY2F1c2UgdGhl
IGZ1bmN0aW9uYWwgZGlzcnVwdGlvbi4gSXQgaXMgbW9yZSBhYm91dCBjb2RlIHJlYWRhYmlsaXR5
IGFuZCB3cml0aW5nIGNsZWFuZXIgY29kZS4NCj4gSXQgbWFrZXMgbW9yZSBzZW5zZSB0byBmaXJz
dCBjaGVjayBmb3Igc2l6ZSBiZWluZyAwIHJhdGhlciB0aGFuIHdoZXRoZXIgaXQncyBwYWdlIGFs
aWduZWQsIHNpbmNlIHRoZSBsYXR0ZXIgY2FuDQo+IHBhc3MgaWYgZm9ybWVyIGlzIHRydWUgYW5k
IHRodXMgbm90IG1ha2luZyBtdWNoIHNlbnNlLg0KDQpPayB0aGVuIEkgd2lsbCBzd2l0Y2ggdGhl
bSBhbmQgY2hlY2sgaXQgYmVpbmcgZGlmZmVyZW50IGZyb20gMCBiZWZvcmUgdGhlIGFsaWdubWVu
dCBjaGVjay4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=


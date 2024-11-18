Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C09D0BA6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 10:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839187.1254999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCy2D-0000Ux-Uq; Mon, 18 Nov 2024 09:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839187.1254999; Mon, 18 Nov 2024 09:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCy2D-0000T8-PM; Mon, 18 Nov 2024 09:27:05 +0000
Received: by outflank-mailman (input) for mailman id 839187;
 Mon, 18 Nov 2024 09:27:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91/F=SN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tCy2C-0000T2-2z
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 09:27:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f403:2614::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42ba099e-a58f-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 10:26:59 +0100 (CET)
Received: from AM7PR03CA0020.eurprd03.prod.outlook.com (2603:10a6:20b:130::30)
 by DU0PR08MB9132.eurprd08.prod.outlook.com (2603:10a6:10:474::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 09:26:53 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:130:cafe::9d) by AM7PR03CA0020.outlook.office365.com
 (2603:10a6:20b:130::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Mon, 18 Nov 2024 09:26:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 18 Nov 2024 09:26:52 +0000
Received: ("Tessian outbound d013e61db77e:v490");
 Mon, 18 Nov 2024 09:26:51 +0000
Received: from L2e49239403f1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F464A41-4937-4909-8D69-D802D70B3F4F.1; 
 Mon, 18 Nov 2024 09:26:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L2e49239403f1.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 Nov 2024 09:26:45 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU0PR08MB9321.eurprd08.prod.outlook.com (2603:10a6:10:41c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Mon, 18 Nov
 2024 09:26:42 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 09:26:42 +0000
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
X-Inumbo-ID: 42ba099e-a58f-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjA3IiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQyYmEwOTllLWE1OGYtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTIyMDE5LjM0NjA1OSwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aZVx85zyRKSjUPQlb8AVwpN7Qd276yzIqmaiPMHAPwQxNJHZTEgM89aQ7wN6xCNyukm+x8/+H1q+TKR7onOSSGwQkar1NFD/BE0YgrHh+gHqmAsn2BoIaj16klJcpLbS0fimGYYeShfLcLNr3KNtOkI65w9nZiOW8DJpudhNM5quRl39HLZtVKW2IKvD6a7MBYi7DXefgjEZWJrg+uGHXC7/NxtpnXAwD2SmfGTwOHalNyeV7eWi0NBwSF2oqBD+vk/XP6olRV194o4VbcIMiQEqOdUkOpVXlEPmxuM8s2CfqJLWlIh1iGSymxQddsKD9W5Xut6xN4LJUgFB74rsVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjfDe4ftPxQF8j1BRyobcwMfo20svTID/ViM8jf14FQ=;
 b=QzaG3IGrAHBUbdg4lT41ZsGngbjLWmiA/JCqi4tf0Cb1amNhvpoE7ZhH7QyOOKPG1OG7Bhi6Zn5euJecGVhJ5Ycr0hqzIOoW4ptSnEhM7Up91rg4O7e2m30uEx2rpU7np48UZrMLMMz73rwuoTDgDNQWY8fReBMbIfz64C6seH+54dImMPXe+Lcr46dpsjYghQTCUIoPL9yHktadWOFSbnjjLSexnajLLhPdzlst35utAW6aGK5CQ0+Wt6QaDeot6M2morDIMu0X4kZT3sYLp50c7mS9K0o8NeYopCSjrcFVrjD9o4MzZ5u5FNLa3U6JvLjTFj+JcRsN5YYOz1lgPA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjfDe4ftPxQF8j1BRyobcwMfo20svTID/ViM8jf14FQ=;
 b=IOgAggyiGRDjo8RTxgJBgel3dEICtO4UijJytLCXeXPathTjXAXcTCZC3KeNSZIrDDDTX6vDzfxKknxEqHIqfcvQZNnnzi4o0qCKmuAEIIT/TZgwiYFFIyjMS7Bwa4Iw+ww9To6PbSr5HkawdLLeEVeRKY/4JAXj14N9CE2AiWQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e80a016e1d42cf25
X-TessianGatewayMetadata: 6WljJtlsZATCD2ZFaIiQNQOid+DOhoItQD++gsgeNneGcx8vejjWAJYx6Bcy7ZQN/Re9n0nBnAU3MZtTyQBLeStgtAebzKW+YaQQ/hGW7KfPAbJfTT5htHgLQMdGZisddeep1ufu3qluWx3wzwN8Pd8aY5FKHDIHQEBDK3ou0I4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBIAzX7LNuggu1SCRGXkyBJPkZ/66xtSy8G9JXUkCK4IptCL5GdVWoz7kEcR9upMRJdQezrzwwbi9BcCZJzAtZCKM+D42X4WGcfBHbN6BC4AhhEN5md//xBNTNB+YZYd47Pt0pBDFLSlXNOO2wcG+TFOj6SwXZk+J/PZQrFRNGgHnBibGY7HF3tYt/HJHe9G9lrQoWSXXzWGaUAM1H9RDk9eu4rcUD2dKnkqkA9pk8+epzWzgUvanUeLKp2zchBUgj0vgsea0LGpdjUgEndnd44OuWi7JphisyaYgrW/C2c2/j+XqG9LiLDvgP49x7YjvH0wLSv7FzeuEbe3swsu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjfDe4ftPxQF8j1BRyobcwMfo20svTID/ViM8jf14FQ=;
 b=YhE9BjaNSx/cafvv2PlHKwcOkXxQ52K6aA0Z70ls+MdeGgLkWrn2v/FxmFVzkEdDxQUDRIn4nANtx0iiyGanoTRNzabfHL0LqmocVDbUk7Kx8/ySpDLVLtJTQSjnNELoxYqK1+vyQ3esDieGuZFp6mKey0GbDtYmNozh3imiVArc9wukHTxczHi/dh26TZN2oel8XUzZY207Mum+7kPdz190uexKBkzK00dNWQnCGOq/kXCXtd49CMawLtRMOQ/tjxhFvnJVJQHGiiOVwCnc1tBEXfqJjT2wa200CI/AnokElHSiWiTntvg+ZLCkI7oc53lZrkphwDU1wpNiDsRNBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjfDe4ftPxQF8j1BRyobcwMfo20svTID/ViM8jf14FQ=;
 b=IOgAggyiGRDjo8RTxgJBgel3dEICtO4UijJytLCXeXPathTjXAXcTCZC3KeNSZIrDDDTX6vDzfxKknxEqHIqfcvQZNnnzi4o0qCKmuAEIIT/TZgwiYFFIyjMS7Bwa4Iw+ww9To6PbSr5HkawdLLeEVeRKY/4JAXj14N9CE2AiWQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/5] arm/setup: Move MMU specific extern declarations to
 mmu/mm.h
Thread-Topic: [PATCH 2/5] arm/setup: Move MMU specific extern declarations to
 mmu/mm.h
Thread-Index: AQHbN0xKZ7YiM4TBAk6CEhVFsS12wLK7wp0AgAEGmoA=
Date: Mon, 18 Nov 2024 09:26:42 +0000
Message-ID: <F6E75602-5373-4E92-880B-E0280178E488@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-3-luca.fancellu@arm.com>
 <e14ff136-f74c-43b6-aa7d-1c88f56f805d@xen.org>
In-Reply-To: <e14ff136-f74c-43b6-aa7d-1c88f56f805d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU0PR08MB9321:EE_|AM4PEPF00027A6C:EE_|DU0PR08MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f200d32-bf09-4fa8-baf2-08dd07b322ea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Zjk0bHFUMlIvL3JVUzNjOXloOXRQSjc0anIycVoyY25QSnlyVWFGUnUyRklW?=
 =?utf-8?B?N0hvL0VieE05YUxaZmhwcnZkbkc1eHZmSTgwUlc5RzNCYnNhcTh0dysva0dF?=
 =?utf-8?B?TTZ6VDlQMkxKVytlSGlSbzduM0dsVDltTVI1THJ6alAzU3dYQ2Z4Zkl2dTVm?=
 =?utf-8?B?aWd0SUdHTXBVS2RYSXRBSDFzYzAydEtJV2h4UzM5RE1mYUhQblQyeERpSGtq?=
 =?utf-8?B?d3I4WWNIQ3FEeTdMKzl0Z0Vob2o3S3FQZnV6KyszOGJFamxVUC9kU0Y2dDNS?=
 =?utf-8?B?bVczUjdRdk5XV204OWNyTFFxcnFUMmNyWW1PYkgvVEdQYzRNaHpiaTNaUVFj?=
 =?utf-8?B?QVFUNHdTZGptbVJkMDBSVnF3dXBmc2MyV2FOcWV4UitPUzh2eXVEQUg5NXlw?=
 =?utf-8?B?VGZTeGh5akZvdmFCN1ZQbzQ4V2dMdE11Tkx1dWtLV2xoNktRRkswdFJWblBU?=
 =?utf-8?B?RFRmSHU2OGtKZzgyVW1hdi9DT0p4WGhJdklHSVh2K2pWaU1WT3FmVUgzMWRS?=
 =?utf-8?B?aVZJbEJidVM3NGVTYktBTEU0bVVzblh1dllNdXRPMHk3Q3dhclZrcm5ZZkUx?=
 =?utf-8?B?eXh5bnU5YlVGalNwVVd0clZEYnVOR080MVR6VVpaVzUzK0FGa1pFTTdKQVVM?=
 =?utf-8?B?cklXTis1VU0yMzVMT3Zoa0xMWmZicHdpWlZaZmpxRmVpMEtibkZ5M3p2dVd1?=
 =?utf-8?B?OXNXWVozSUU3emtLRWZnRGVyaGhIbjAybi8xaW53MUZDQXM2MXJQTWtBVUFC?=
 =?utf-8?B?NkFJTldKWFRCU3luTjNrQUZKMGQyeThheHBFY3FlUjlVMGNWSS9hZkVlOG5k?=
 =?utf-8?B?bTBSSTZ6cDZpd01mK250eTdrZWZ4VHh4U0E3OW55U1ZHbXNSUHFGQ3NieFAw?=
 =?utf-8?B?ZE1HNlpxcjczTDdjYkpkQ2J1UkdCdDZXSTJ2KytsN0tJbmlCR290MDlZc3E1?=
 =?utf-8?B?Y3dRNnJGZDM5UzBJVzA1TDI5OEllZzdWQWFzY1lSTVplY2htS3J5RnhQVU1R?=
 =?utf-8?B?UUwzWGhNelo5WFRBU3k5MFlNQm1jUlVWd2RxcTQ3N0dnREtuWDdaTnZMN0sz?=
 =?utf-8?B?TjJUamxidGlOWWRpZXdwUnVsOUgxMUVHTG5PQnljY0wwN0VPekpOdlN1MUxY?=
 =?utf-8?B?Y2dxSXFoK3k2K3k5Z29LcmxYckt6dkltakUwejZZc0g2S1NIMmN6TGdYSURn?=
 =?utf-8?B?VjhSNkxqZytYajZlK3VwMC8wTFB1Ung3TWd0VC8vcGhaSFFRQ2lEcFp1NHc4?=
 =?utf-8?B?dVVKeHVDZUlvOXhNMUhOMGlRdzExWC84VFBMVmZja1JWeDdoTCtLVFRzTU5v?=
 =?utf-8?B?dDJITURXUmFyTi9vVyt4a21ZbC93UUM4WHlXUlRwUldzTmFnYnNjZHdZOEtU?=
 =?utf-8?B?d05Hb003LzN4RGNCNWF1bDBEdkhUNHRaaVNXU3VhaXIyNlZzTkZ5eStYZGRr?=
 =?utf-8?B?Ulh4TmpYbW9rTFZZWVBmKzFVT0loOUh3akJmeEV0dDNYdU1KYkN6UTNFU0RB?=
 =?utf-8?B?S3h3NXg1a3Q5MWRiUjhMOGk0c1BXMVQxT1hScE9PZGpsczZ4TEI5NG42NU5E?=
 =?utf-8?B?eG9GYjV3MFE4ajBrYUxidUkwcWZoZjZIWjBQWGI0Z3M3ZFdPSXBCeXN5a25V?=
 =?utf-8?B?QnhqN0w3V1pYSDlWZ0dnQUVyWi9pZWFXVk1pUEtEcytpVU40bkpHWWg1dnZF?=
 =?utf-8?B?N1NPRmNNQW5lR3NGY2RYVmdXeTZHaVRra2pJSDc3eW16dGJmKzlyRXdhenVD?=
 =?utf-8?B?OUpYOEUwSlhkTkEyMDJaV1dXUkdtV29xd21kMDdIM1pNZG9XZjl5ckZkc2xT?=
 =?utf-8?Q?S3D14akk33XI4p60NJZyaz06ekt37JAkDT/2w=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B015B091F384243AE3DCF13807AF737@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9321
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	198e7ff5-5355-4611-01a7-08dd07b31d06
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|376014|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlEyYXpVb2NUbld3V2Q5cnM3ekI1b1dhWjRtZ1VqUTg0M25FZDdLS3R1eUhu?=
 =?utf-8?B?K28waGxMOUFhbW9WOFdMNmsrU3VwWm5PNE1IRGk5UGZSQ24xbTVRVmFCcVhO?=
 =?utf-8?B?RDlaakZqa203K3pzQUJGNUxIcWpOVHJacTFnN20rcXB2U3VSRW5pNC93dGRn?=
 =?utf-8?B?Z3dVUC9Ob1RhTmZuTVFSeDdCNS85aUoxSHpWZms4QncxQnlrUHFiOWc5c1lw?=
 =?utf-8?B?dGw4OVNoS0ppV0pkei9nZmx0M2xpVHIvMGhxaGl3NS9DY1N0M3BZbDIxMmRW?=
 =?utf-8?B?R2tlL1BZNXhPUFJQUkh5b21LamRnVjRGd0lXaWZjVkp1ZFkyWGs2cHkxSnpQ?=
 =?utf-8?B?UVg1a3FTVmtTUldVQU1COUQwUEI2VHJXSEcwcWxzQUJ6NTVHdWNleGNLOWxI?=
 =?utf-8?B?L3JCTUUxMXRmWStTWFFsRHVwM2FnM1N6ak55SGMyY2p1OHJQNHBCcVc5L053?=
 =?utf-8?B?NEJlL3cxM2ZzQWhQb25JdG5Ia2NUT3pESlNzWm1mK2hBWnl0RElrYm1kNnNY?=
 =?utf-8?B?SzQ0RHRDVzB2clpyTm5seXFWYlN0N21za1I3YzRmbHBkMHdTcTJUeDQwejBt?=
 =?utf-8?B?dXN1aTlDVWFtT1pjWDBzU2tkWm1FbE8vTkR6M2JmV1c4UGhjR1NGSFlwdW9Q?=
 =?utf-8?B?RGdMb3QvRHYzWWxqbkpUZ08vVDJtRkF0VS94L002dmFIeTRjdHhXL3RleUYv?=
 =?utf-8?B?MTI0bVREbzJaeHRDY3NIK3kwRTd2ZnAzcHk4QUtRSTVxUlZESnZESmxERnk2?=
 =?utf-8?B?Q2pIaGdaWldWanRQUWF6Zm1iLzFiZnNoOXFpNWxwMnNtRGRoN0NoZkoweWdv?=
 =?utf-8?B?MmlQUjcrQ2p3RzVkaDFndEEycWNkL0FDSUQ0UEpiYzlHQmxPSVBFbDBpQS9a?=
 =?utf-8?B?YmJqU2xLam8zODBWQkcybmtPTTNibTNrdGE5bGVQTXRMOWJiRlFpcUhpNjg4?=
 =?utf-8?B?anpoMGF5T2FNV01GRmtnSHBTV0xaMkJsWjRhUUYxWlNUSXhOakpVcUJ5V1Za?=
 =?utf-8?B?bkllRHRVRlJ5NjM1SHlKaU91bHd6VmpibUJxbWpYaWhzczUzNFIxcGhFMER3?=
 =?utf-8?B?UVhBbnlWWEl2WVZ4M1dNZHNEWTRXMlYzZHNpMGRDRW45TXFxNDdlQlIyWlIx?=
 =?utf-8?B?YjVEL3Z5ekxUWXJETlh4alViTFh1bXJGTXlSYVZuUU9ia243SGkzeXlXTnlO?=
 =?utf-8?B?YktiMXBTQngxb3RaUmtnMXNMejd2NmRmVWFJWE9nNjQvWXh4RFhEYUVzbHBi?=
 =?utf-8?B?anJHRXlRSkxRbXBIQ2l2WTJLZUQvOEY2L0xnclh6KzIyd1JzYkR3UjQvVnRs?=
 =?utf-8?B?RFVhc2Y1bjlFa1FNKzdDUy9VSnZuWURWaE8yVHY5b1pJVkJKVkJyb2RsS2Ni?=
 =?utf-8?B?a2xEV2N4ejdtd0ZsUUVxZVZSOE05RUU1aUhUayt2Yk51ZVdRTk5EQUxTOHdL?=
 =?utf-8?B?RVBSMnRpamVyV3lOR3pPY3JTNHFjK1g1VnprSmpFcGJVbnY0V1gwZWFEVy8z?=
 =?utf-8?B?c0toSjFPMkd4eVZWWDJvSDRZdmM0SExuM0MzUzJ6UFdxU0NHb2s0akNXd3pk?=
 =?utf-8?B?SXM0clAwdERhbWZJdEJTSnpVR01IYXdtVzREa0d2WWZZaDY5cUc1VUtUZUd0?=
 =?utf-8?B?S0swYTBLNkZMMmtGVWwzejJWblB0dzQ4TFVMSFVweVpJeHpiTXVTREFaQnZL?=
 =?utf-8?B?eS9mU0xTK1dtakVkWkFrZDhxZ0l6OXlBRWdYNG5RM0hoU3FncThJNHdTaGtO?=
 =?utf-8?B?S0Z0dm54Nmh4eW9jVmxXUHg2dTNsK2FKNFZpVU00K2hQUWFoN1BBQyt1bnYw?=
 =?utf-8?B?QjZ5U3FqTzhWOHJkTkFHMkFSY04vNVp5aWNpN09WV2lTckR0SGk3VGRvT2xl?=
 =?utf-8?B?cnM2Ny85SWg2MDZmdVNSSFovOTVJTTVQanB2Sk8xRFNETmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(376014)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 09:26:52.2202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f200d32-bf09-4fa8-baf2-08dd07b322ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9132

SGkgSnVsaWVuLA0KDQo+IE9uIDE3IE5vdiAyMDI0LCBhdCAxNzo0NiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMTUvMTEvMjAy
NCAxMDo1MCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IE1vdmUgc29tZSBleHRlcm4gZGVjbGFy
YXRpb25zIHJlbGF0ZWQgdG8gTU1VIHN0cnVjdHVyZXMgYW5kIGRlZmluZQ0KPj4gZnJvbSBhc20v
c2V0dXAuaCB0byBhc20vbW0uaCwgaW4gb3JkZXIgdG8gaW5jcmVhc2UgZW5jYXBzdWxhdGlvbiBh
bmQNCj4gDQo+IFlvdSBhcmUgbW92aW5nIHRoZW0gdG8gYXNtL21tdS9tbS5oLiBCdXQgSSB0aGlu
ayBJIHdvdWxkIHByZWZlciBpZiB0aGV5IGFyZSBtb3ZlZCB0byBhc20vbW11L3NldHVwLmggYmVj
YXVzZSBib290XyogYXJlIG5vdCBzdXBwb3NlZCB0byBiZSB1c2VkIG91dHNpZGUgb2YgYm9vdC4g
U28gaXQgaXMgY2xlYXJlciBpZiB0aGV5IGFyZSBzdGlsbCBkZWZpbmVkIGluIGEgc2V0dXAuaC4N
Cg0KU3VyZSBJ4oCZbGwgbW92ZSB0aGVtIHRvIGFybS9tbXUvc2V0dXAuaA0KDQo+PiANCj4+IC0N
Cj4+ICAvKiBGaW5kIHdoZXJlIFhlbiB3aWxsIGJlIHJlc2lkaW5nIGF0IHJ1bnRpbWUgYW5kIHJl
dHVybiBhIFBUIGVudHJ5ICovDQo+PiAgbHBhZV90IHB0ZV9vZl94ZW5hZGRyKHZhZGRyX3QgdmEp
Ow0KPiANCj4gU2hvdWxkbid0IHdlIG1vdmUgdGhpcyBmdW5jdGlvbiBhcyB3ZWxsPw0KDQpUaGlz
IG9uZSB3YXMgbm90IHByb2JsZW1hdGljLCBidXQgSSBjYW4gbW92ZSB0aGlzIG9uZSBhcyB3ZWxs
Lg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==


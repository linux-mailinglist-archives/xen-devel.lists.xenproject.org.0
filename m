Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9189ADF48
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 10:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825017.1239209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3tIr-00066A-Cv; Thu, 24 Oct 2024 08:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825017.1239209; Thu, 24 Oct 2024 08:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3tIr-00063O-9j; Thu, 24 Oct 2024 08:34:45 +0000
Received: by outflank-mailman (input) for mailman id 825017;
 Thu, 24 Oct 2024 08:34:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3x2=RU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t3tIp-00063I-Ih
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 08:34:43 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20611.outbound.protection.outlook.com
 [2a01:111:f403:260c::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfae707c-91e2-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 10:34:40 +0200 (CEST)
Received: from DU2PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:10:234::14)
 by DBBPR08MB10841.eurprd08.prod.outlook.com (2603:10a6:10:533::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 08:34:35 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::31) by DU2PR04CA0039.outlook.office365.com
 (2603:10a6:10:234::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Thu, 24 Oct 2024 08:34:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14 via
 Frontend Transport; Thu, 24 Oct 2024 08:34:34 +0000
Received: ("Tessian outbound cd6aa7fa963a:v473");
 Thu, 24 Oct 2024 08:34:33 +0000
Received: from L19b5ae54414d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3F18274-C588-4FF6-AE40-69FEFB2CDD35.1; 
 Thu, 24 Oct 2024 08:34:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L19b5ae54414d.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2024 08:34:23 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM0PR08MB5459.eurprd08.prod.outlook.com (2603:10a6:208:186::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 08:34:20 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 08:34:20 +0000
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
X-Inumbo-ID: cfae707c-91e2-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MdRI7bzbNI/5V7jarYF1YrGIGW6DRA7GaqKg0L9XJ46DMknVcgz7TaaDDYUqDF3b+NxMWPUfrhCSIMYyVzkm6JtdKgweT6nqgOHWelcZCP0rheiXaJAzTiXJ1CJWGu93tQKVd7oB37Zx3oBGj7w6xx8JkH2vobP4cxiE573xmwmjKkEx/WQaQxMFO4TkOEIkI+mJcAhLBBjpHZhHX/iVI+0W9aqCXiALdkIet9t9fEDzn23Pe98fWpP0j1CprQPKuGi2GpUArUTrpMC2rTCAD33/ONEMPoFtTkC7fURpMF2+MtrbBfLpLEWM0Gdm0mVCUAqYWn0AHiHAIyvFnfbgxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKGalIxB4zMKgUIqNKlSfKXHEHEYooS/pk7SbzcmLM0=;
 b=G1aYGK6F5lzBvdIuAWHvfMQ7Wp13GkD3mG5/BTuq1e21cU3/gloAgWEOuc/pyTgxYE99XgSOjk5OC/Ub7YjLJNunETnbLtOPpj0dzWvJh9LWNlkyV4ZB0t8vFTtThPOqnma7n/Ub91P+86mJVuPRqMbQKvWjmR+sgw4h6uP7641oUZhT7JC76fQz0/mHt7i/9+PctGyvlr+866tssHEUgbNIbE5Qtas59ua65AR+pUxeqWYxRpEW4O6ji9J3WTfeSpspwlGoi/zuSzf36I/PpFSnmIs3mwt/+UFoJdWvc4H44ajJhzzgrQcsLPU0BoZQV3moB/u7LLe7AvZ/6LmqlA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKGalIxB4zMKgUIqNKlSfKXHEHEYooS/pk7SbzcmLM0=;
 b=KAVRZG4hWYgQXsPCaWsImi6cvq1/obO5IySKqaWFwLxKmv/fvecpCxD2IWBf5tse2qYzxFE1SWU31+YPQUQNm4ino/3rRyGWjbWXKf0kumyCjT/FvGiUSGuYC+XaXzbbzMQyMfRlHi9k5Cx3YcapSlT//mUE2tBvAmPyHBWeG4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d2118c7788d7996d
X-TessianGatewayMetadata: JryMY8c4J3WEGLRldBdjEEahESs5uVxG1W0UqQ98CXVEtfrLnDi/epN32JQhu0WfMepnC3+W5psU+4XMBZi93Wo/sdKcEl0NVFZD7J4GO5vJ8AmigtIsytOBS2qtiwzrkg9TZM9KMsoULxF8h+2WAOSfZpPosm5tzqGm1gTUPUQ=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppwPGVpVqvTkNqxoEsyvUekL/EtF1Lhm3E6658TDV0MV8fw48fnLiJttnhT0+v3Buw/6E3zCZXWIaqMy3N8+a6u+XYmOVQLDc/HDxbHNcBnZk7xUYyP1bMwUGsfVd8FNICHoeCiLgxHDcAD83Wl0LVp/v0py1OrwtfGd5Cdb3LG3CNmcRyvL4RkU2j2e5YcXNkUmwMeZIofHjC2EhthYmh6ZYkRG4iIjrID5jzeVkVbueXH/ceDE2p8uT5cYjYR2C9m+WPwzqGtvqXFtwb1uMs4Hbj5vFcslJYKJE68SAPcX9H8kYqgyTpc7nW+C8JrLa73ABgDb5q1EZVPLmVbO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKGalIxB4zMKgUIqNKlSfKXHEHEYooS/pk7SbzcmLM0=;
 b=KisBmlBZxyJUxiE1p+RWgaAAW3umwW58eg65/++8PAjxveZcTgzb3X/rtHRCgy3TmSWwuAsotYKVjuB68dUy1mGrsOGDjWSVOaXhDcIVk/c8JitDvqVqC055a5YBOP5G5mbe1+QzHQw0QyfFwDD26M1aD8n5kEuV9fzhHi2glqrsHsnVevdoaraAw31FJx/1SpuK7Y+NzdxrVzoAh2gCnp9c+BWVmPmewywMvyn8JO+krA80NjUdzS1FoZoF4Njq8J+dVVsYvBzVP8ZCsnNc4mKHJhi9WIGr3HuWPDoI8r2sISdbzbtT/GtyOENQ5Rr6exR67/a1t79PXc62Hna1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKGalIxB4zMKgUIqNKlSfKXHEHEYooS/pk7SbzcmLM0=;
 b=KAVRZG4hWYgQXsPCaWsImi6cvq1/obO5IySKqaWFwLxKmv/fvecpCxD2IWBf5tse2qYzxFE1SWU31+YPQUQNm4ino/3rRyGWjbWXKf0kumyCjT/FvGiUSGuYC+XaXzbbzMQyMfRlHi9k5Cx3YcapSlT//mUE2tBvAmPyHBWeG4U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Topic: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Index:
 AQHbGx2Ge9N55hTx/U2iD9lYiTVQprKNIysAgARC6gCAAA8agIAAAOKAgAEgqoCAAAHOgIAAAmiAgAA3SQCAADcxAIABi38AgAAB0oCAAAFRAIAAA2QAgAEElgCAAAi6AA==
Date: Thu, 24 Oct 2024 08:34:20 +0000
Message-ID: <616EC2B4-3281-4C24-A0AB-BD850C56F4DB@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
 <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
 <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
 <A302D615-E25E-46DE-A4CA-4FF911293D83@arm.com>
 <d1e8decf-3c63-41fe-a6e3-f880b984dda4@xen.org>
 <61C13F4F-24D2-4B6D-9216-813EDEED4865@arm.com>
 <5b8d5c3e-3c52-4b3b-b63f-c89a58f40f10@xen.org>
 <4E7C8350-D6DE-43D3-B269-185FFEE62B96@arm.com>
 <8991e9da-5abd-4fd7-919b-fbe87d747838@amd.com>
 <251fb5a2-a8d7-451b-9714-5cc984645354@xen.org>
 <acd45c52-7675-4dee-b8f8-46429cadf9ac@xen.org>
 <d70dae8e-5197-48db-859b-a3cae67e4ca7@xen.org>
 <6dad812c-b1dc-49e4-aa08-aac5647ca37d@amd.com>
In-Reply-To: <6dad812c-b1dc-49e4-aa08-aac5647ca37d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM0PR08MB5459:EE_|DU6PEPF0000A7E0:EE_|DBBPR08MB10841:EE_
X-MS-Office365-Filtering-Correlation-Id: 80cc577c-eda0-4617-d3df-08dcf406b023
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YWpBeUk1UTA0RTI4SkJWa0ZBdjVGOW45Qmh6S3JGVXlnelRFdGlrdXppZFlo?=
 =?utf-8?B?RWRheEpidzM3V1o4Ly9BUllZVENINnV4eTVVelRTYVFCWHkrbnRHMkFPQzAr?=
 =?utf-8?B?V3N4NWFCd0VjTmh2R01ZTGh2QmxwYXc0dUdoNkk2Y0xZL3ZwK0lsajB4NlZU?=
 =?utf-8?B?dldOR2tSWHE2U1JvY3JIT2JFK1BZWEdCTmRZVUE1YmxZL2pJZ0VZV1hMNy9Q?=
 =?utf-8?B?RkhDendsNFJMdGh5aytRYjlJS01ZaFd6eE8zb20zM1RGem1ieGdZWGxRc0pD?=
 =?utf-8?B?Rmw1azF3QTIvaDV1VzhDeDR6bE13SzNLSkt3VTgvUEdEMWlWUXMxRFI1a1pN?=
 =?utf-8?B?ZUZ0Ny9Ybm9EKzhlK1YzTXRvbWJid0pVT1pUZ2pNS2tCNldib1JVNVJ4NzBl?=
 =?utf-8?B?UVd6Q2VuRG5UK2NpTFVsclBpSi9peFBqRHpadVRCbnRKVi9BbFVHZkY5M01y?=
 =?utf-8?B?VSs5N3VicXJaeDZyWEtwcDNYcU9vanI4RXQ2NzNmR3lyVWh3RHlwTVJvaHZk?=
 =?utf-8?B?eFU0b0JoVzhBUU5tS3BnaS9YQnNBSHJQbTJOSW9yRVVMb2x5WFRXRUFBTkxW?=
 =?utf-8?B?bGJXYU1tS0ZtRFZsa0g3V1R0MTFsZUZhMVRsVEpaSWJsN0w5RU0wWUxmOHVI?=
 =?utf-8?B?UW5Wcnk5UTREZ1hxSEF3SlVxcWpYejk1dHZqbUFtUjJEMmdSSU9GdmhYblgv?=
 =?utf-8?B?SlQ0b3pES3JsdUZJeWtQditrNzhMWUVvb3lFeno4SjVjVzBvNit1MnB1NUxj?=
 =?utf-8?B?cWNJdjFxd3dBMUk2NDJ2WjJDNFM0R1d1T3l6Uzk5aDQzS3ZRMlJSYWppMUJT?=
 =?utf-8?B?dks1RWtQTjVmbm9nWERhTzBGWUdoTUxOdXRDalArcUJZSW5TcitvRWZncnp4?=
 =?utf-8?B?bmhhRGhORWRtR3JjazA5S0xYMzh2L0d3T09EZHp1R0tDQWx2eHNZd1RKOVVW?=
 =?utf-8?B?bktiZzN6QzdieGZMNFE4QVBDRFpqREZXWkU4THUyVE42K1JjL0Z6NGdZOGpF?=
 =?utf-8?B?WGR4RFREUEJvV0w0emR3SVYrNGVrV2pkN01vZDNUWmxHTUVYTHlCcDI1Y1lT?=
 =?utf-8?B?NDdlNFhYUzhMKzJmbTQ5UEowemxSRnUyc0thS2IzQVVLb29EL3RqOFJWbjI4?=
 =?utf-8?B?ZERpUzdkT1ZYZzJ6cUFqMTBXUDV5eGZMQzB0dXdZbGJja29vdmNCd3lDNUVl?=
 =?utf-8?B?akdDLzhMbmhmbVhuR1VoVU11SjIvRE9vNFdZR201MCsvbTVOQWg4c0h6clJW?=
 =?utf-8?B?RDhoazQyQzEvK0ZZaTQyVXRZVjFyQjc2WUtmM3B1Q21yYlk3Rk44SHllbE5v?=
 =?utf-8?B?MHFvbUVvUlZZeVhnbDJub2xLVlZGUHVZbkRtUE84ZHNjOXZnbVUwei9DZGMw?=
 =?utf-8?B?WllGcFNDZDBzSEZLVG9PTzN0QzFlUU5GZG5UbGgzYmpVZXhNN2hGQTJkVm1N?=
 =?utf-8?B?VW5CVGxlaHlFSHJYOXJ5ZUUvSUJXV0dzQTI2Q3VIQlBTR0hJdFY2NlhhRGVV?=
 =?utf-8?B?Q2FoZi95UlZ1V2J3TnpHR1o3TGxOUUhya2JWMVEwc3prUGJCdGs5Y0MwQWNn?=
 =?utf-8?B?UEVhRzIzb1dmbXByQU5XZXNybnJ5Ni9hL3M2Y3RGNWtNSlF2V0F0bmt0NU5Z?=
 =?utf-8?B?SnI3YWlVdW9XNUU5cmFmQzkycWF5b0t5V1BaRWp3WHJVZXZNZGN6L21FckQ3?=
 =?utf-8?B?S25kRkJxa3E3elpnMWkrU0p0TC9vdjU0TTVtbnZ6dGsySkpDZEVqWmhmTDVj?=
 =?utf-8?B?NTc1REdMSndQamFsQUtSb3VkN2NWbkFnbFZzMC9UUU8yclI4bzZRcUowRXR4?=
 =?utf-8?Q?ABOjJe76PWmBGAEer089ns8XGmbdPZDZrmXSE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8350231E8DF66441AB26A403FF788D95@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5459
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f79b3af-b2d3-4680-4932-08dcf406a7cc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW9IMVlsMFFuYVVMeDd4dEE4RnNiQU8xd0lRRnNqYW8ybHZRaTJTaUl3Y1lY?=
 =?utf-8?B?MlczRmpsTFNyMTl3TkpEb2JacjlkVUIxWjVzd3paUkF5TWU4bEF3eWxCNVlZ?=
 =?utf-8?B?NlVmcTAwcENIZ1ZueTJPWUFncEYvempmejJQc0Z2SFhYbUhMYWJyL1Y1cEE2?=
 =?utf-8?B?bzBNMDBxN21DRlBONVJxMVBqczMwanJRcU9XRXhBUGZ3V05Rb29PZm9jTWpW?=
 =?utf-8?B?V1dnenByck9wTVJ1T3JscTZEQVVSN0VSUVloZ2NpcStFZFlobERleTg0aXNR?=
 =?utf-8?B?cjF4cVJYZy9UUVBFeitqMU5mUXJqck1jYkZrZFh6dWI5V2hZcW9ZWDFTRHpV?=
 =?utf-8?B?SVNQNWYyb3BqZTFQbWZTbHU2NndCNGdRNGxOSWxSVHkzQm1va2I5SHFCenJN?=
 =?utf-8?B?VnZBTVJsdldROTJuUGZUaVZkN3VJdzErTERxcndUaytlZkd1VnI3a2E0Mkh4?=
 =?utf-8?B?bERjOW5vZS9lQkdFcXhlMk1XQkRyNUd4elNYQkgrTHhWbFhSMnI2Wmh2WE5D?=
 =?utf-8?B?azNlVGRxK0R6TFJpZDM4cDZyTFN4Um9pWlBSRk10dGh1eEJhUk8zSnArK0J5?=
 =?utf-8?B?ZWF0L2lYNVRjZHlsNzl4a3F4TmZmTFJvUGg3SGFmdkUyVzNNODZxV0UyNG9q?=
 =?utf-8?B?NFZYTm9GR2M3ZCtsZjVIMTAwVUx1SUhCWHJSYXE2NFN1cEttWEhSNEp4bFBR?=
 =?utf-8?B?MEIvdG1EaVdsci9vemhnMDFuYkViVUw3VWlvd0E5c2VVQnBpTzE0SG1FZll4?=
 =?utf-8?B?VnFGZFlURXc5dG5zWGJ1cER2K1RiaHN3bzAzS0w3YmZBVmwrS01sNTU4QW8v?=
 =?utf-8?B?cnUwU3RJOXp2SnRxV1lRajcyZ3NYOXA4NzFNU2lMQ3BSb3h5V0R6TUVtS0hX?=
 =?utf-8?B?dmlhLzk0eWs2TWxvTEgreWtGdWN6czNqWllQN1V5cDFOSWQvc2M3bDFIdFdu?=
 =?utf-8?B?MGYxVzRQQkpGRjFmZ0dia0crR3hVS2lTOWkzOFZlSm9RT3k3bVhxRSt0TVNI?=
 =?utf-8?B?S2Urejd1bnk4YTNUbkVWUzNvVVp2ZHdiVTZvQXp3UTlYZm95RnQ4cDJLN2pW?=
 =?utf-8?B?RTlZbFQ5RGliU0FNTkEyRitNMmZKTDAwZndTUDRDRkZtVGZBZ0JwckRPS09y?=
 =?utf-8?B?WGpNZkNSbkxyTVRQMGFuVmQyVjhnUnhXZFRGTCtnQ2MyOFdNaDI1L2hITkI2?=
 =?utf-8?B?V3FNeGduaERpYkh3akRIakJwNlQxYkhzWnplSjBsK0FaTHFUVWlBTW9GaG9Q?=
 =?utf-8?B?dythZzZpeHFXUTdIcHQwN2M3cG9aMGZiZU1kcWxTQXl0aDMxM05ac2I0L3JS?=
 =?utf-8?B?RDNYRy9XRUlFaU1YaEJ1Vkc0amdVRTZQenVEYWErSW5FaUs0Rm1RREF0ZlBG?=
 =?utf-8?B?WTlkQ1J6VTV3bkNsS3Nrc3Qwd2x3aVE5am9FaVU4QnJEaVA4UjhjTFdpaDVp?=
 =?utf-8?B?MjdJR0ZLYldLOWNZUWRhd2ZQNTdRV2dlME9TM25scjZkWlFuYStXZlpWQUZh?=
 =?utf-8?B?dVBhN3A4Tlc2T1FNOTA0N0xnS3B6VWdYbnpLNGlTT2szM3lseWFHL0RuS2Ry?=
 =?utf-8?B?VnpVRzU2cGJ5Sm9SYVVyV0F6VUxpelJ4VlYwVXdERThjem54V3VKV2hxWVNh?=
 =?utf-8?B?RnozSmMrVENrNUppUzNGYnVWek9iaVZxcmcwbUVUOWJZTk9DTk9Ed1lXTGgy?=
 =?utf-8?B?aTFYeFA5dTVrMUoxbThJQkxpTmVtY05wcjVOMUV1ZUFnYWVQT21IbHlZeno1?=
 =?utf-8?B?QVJxbWFRRllKUFhScWdFV2dRWUwvOHVOM3k1MDROUHlXYXVBREoxQngyWTJB?=
 =?utf-8?B?ZVdONDFTWVllN3NFSU5MeGoyMHhSKzBmZjRYU3BnMExYaWw0aUd1bkZhQWdG?=
 =?utf-8?B?VUVFSld6dGRqZ0pvMDN6U3hZakVUSkhLL3FNbnpjUXdFTXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 08:34:34.1730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cc577c-eda0-4617-d3df-08dcf406b023
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10841

SGkgQXlhbiwNCg0KPiBPbiAyNCBPY3QgMjAyNCwgYXQgMDk6MDIsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFua3VtYUBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEp1bGllbiwNCj4gDQo+IE9uIDIz
LzEwLzIwMjQgMTc6MzAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IA0KPj4gDQo+PiBPbiAyMy8x
MC8yMDI0IDE3OjE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gT24gMjMv
MTAvMjAyNCAxNzoxMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiANCj4+Pj4gDQo+Pj4+IE9u
IDIzLzEwLzIwMjQgMTc6MDYsIEF5YW4gS3VtYXIgSGFsZGVyIHdyb3RlOg0KPj4+Pj4gSGkgTHVj
YS9KdWxpZW4sDQo+Pj4+PiANCj4+Pj4+IE9uIDIyLzEwLzIwMjQgMTc6MzEsIEx1Y2EgRmFuY2Vs
bHUgd3JvdGU6DQo+Pj4+Pj4gSGkgSnVsaWVuLA0KPj4+Pj4+IA0KPj4+Pj4+PiBPbiAyMiBPY3Qg
MjAyNCwgYXQgMTQ6MTMsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+
Pj4+PiANCj4+Pj4+Pj4gDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBPbiAyMi8xMC8yMDI0IDEwOjU2LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+Pj4+IE9uIDIyIE9jdCAyMDI0LCBhdCAxMDo0Nywg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+
Pj4gSGkgTHVjYSwNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBPbiAyMi8xMC8yMDI0IDEwOjQxLCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+Pj4+Pj4gT24gMjEgT2N0IDIwMjQsIGF0IDE3OjI3
LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+Pj4+Pj4gMikgZHNi
K2lzYiBiYXJyaWVyIGFmdGVyIGVuYWJsaW5nIHRoZSBNUFUsIHNpbmNlIHdlIGFyZSBlbmFibGlu
ZyB0aGUgTVBVIGJ1dCBhbHNvIGJlY2F1c2Ugd2UgYXJlIGRpc2FibGluZyB0aGUgYmFja2dyb3Vu
ZCByZWdpb24NCj4+Pj4+Pj4+PiBUQkgsIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIG9uZS4gV2h5
IHdvdWxkIGRpc2FibGluZyB0aGUgYmFja2dyb3VuZCByZWdpb24gcmVxdWlyZXMgYSBkc2IgKyBp
c2I/IERvIHlvdSBoYXZlIGFueSBwb2ludGVyIGluIHRoZSBBcm12OC1SIHNwZWNpZmljYXRpb24/
DQo+Pj4+Pj4+PiBJ4oCZbSBhZnJhaWQgdGhpcyBpcyBvbmx5IG15IGRlZHVjdGlvbiwgU2VjdGlv
biBDMS40IG9mIHRoZSBBcm3CriBBcmNoaXRlY3R1cmUgUmVmZXJlbmNlIE1hbnVhbCBTdXBwbGVt
ZW50IEFybXY4LCBmb3IgUi1wcm9maWxlIEFBcmNoNjQgYXJjaGl0ZWN0dXJlLA0KPj4+Pj4+Pj4g
KERESSAwNjAwQi5hKSBleHBsYWlucyB3aGF0IGlzIHRoZSBiYWNrZ3JvdW5kIHJlZ2lvbiwgaXQg
c2F5cyBpdCBpbXBsZW1lbnRzIHBoeXNpY2FsIGFkZHJlc3MgcmFuZ2UocyksIHNvIHdoZW4gd2Ug
ZGlzYWJsZSBpdCwgd2Ugd291bGQgbGlrZSBhbnkgZGF0YQ0KPj4+Pj4+Pj4gYWNjZXNzIHRvIGNv
bXBsZXRlIGJlZm9yZSBjaGFuZ2luZyB0aGlzIGltcGxlbWVudGF0aW9uIGRlZmluZWQgcmFuZ2Ug
d2l0aCB0aGUgcmFuZ2VzIGRlZmluZWQgYnkgdXMgdHdlYWtpbmcgUFJCQVIvUFJMQVIsIGFtIEkg
cmlnaHQ/DQo+Pj4+Pj4+IE15IG1lbnRhbCBtb2RlbCBmb3IgdGhlIG9yZGVyaW5nIGlzIHNpbWls
YXIgdG8gYSBUTEIgZmx1c2ggd2hpY2ggaXM6DQo+Pj4+Pj4+ICAgIDEvIGRzYiBuc2gNCj4+Pj4+
Pj4gICAgMi8gdGxiaQ0KPj4+Pj4+PiAgICAzLyBkc2IgbnNoDQo+Pj4+Pj4+ICAgIDQvIGlzYg0K
Pj4+Pj4+PiANCj4+Pj4+Pj4gRW5hYmxpbmcgdGhlIE1QVSBpcyBlZmZlY3RpdmVseSAyLiBBRkFJ
SywgMSBpcyBvbmx5IG5lY2Vzc2FyeSB0byBlbnN1cmUgdGhlIHVwZGF0ZSB0byB0aGUgcGFnZS10
YWJsZXMuIEJ1dCBpdCBpcyBub3QgYSByZXF1aXJlbWVudCB0byBlbnN1cmUgYW55IGRhdGEgYWNj
ZXNzIGFyZSBjb21wbGV0ZWQgKG90aGVyd2lzZSwgd2Ugd291bGQgaGF2ZSBuZWVkZWQgYSBkc2Ig
c3kgYmVjYXVzZSB3ZSBkb24ndCBrbm93IGhvdyBmYXIgdGhlIGFjY2VzcyBhcmUgZ29pbmcuLi4p
Lg0KPj4+Pj4+IFVobeKApiBJ4oCZbSBub3Qgc3VyZSB3ZSBhcmUgb24gdGhlIHNhbWUgcGFnZSwg
cHJvYmFibHkgSSBleHBsYWluZWQgdGhhdCB3cm9uZ2x5LCBzbyBteSBwb2ludCBpcyB0aGF0Og0K
Pj4+Pj4+IA0KPj4+Pj4+IEZVTkNfTE9DQUwoZW5hYmxlX21wdSkNCj4+Pj4+PiAgICAgIG1ycyAg
IHgwLCBTQ1RMUl9FTDINCj4+Pj4+PiAgICAgIGJpYyAgIHgwLCB4MCwgI1NDVExSX0VMeF9CUiAg
ICAgICAvKiBEaXNhYmxlIEJhY2tncm91bmQgcmVnaW9uICovDQo+Pj4+Pj4gICAgICBvcnIgICB4
MCwgeDAsICNTQ1RMUl9BeHhfRUx4X00gICAgLyogRW5hYmxlIE1QVSAqLw0KPj4+Pj4+ICAgICAg
b3JyICAgeDAsIHgwLCAjU0NUTFJfQXh4X0VMeF9DICAgIC8qIEVuYWJsZSBELWNhY2hlICovDQo+
Pj4+Pj4gICAgICBvcnIgICB4MCwgeDAsICNTQ1RMUl9BeHhfRUx4X1dYTiAgLyogRW5hYmxlIFdY
TiAqLw0KPj4+Pj4+ICAgICAgZHNiICAgc3kNCj4+Pj4+PiAgICAgIF7igJQgVGhpcyBkYXRhIGJh
cnJpZXIgaXMgbmVlZGVkIGluIG9yZGVyIHRvIGNvbXBsZXRlIGFueSBkYXRhIGFjY2Vzcywgd2hp
Y2ggZ3VhcmFudGVlcyB0aGF0IGFsbCBleHBsaWNpdCBtZW1vcnkgYWNjZXNzZXMgYmVmb3JlDQo+
Pj4+Pj4gICAgICAgICAgICAgdGhpcyBpbnN0cnVjdGlvbiBjb21wbGV0ZSwgc28gd2UgY2FuIHNh
ZmVseSB0dXJuIE9OIHRoZSBNUFUgYW5kIGRpc2FibGUgdGhlIGJhY2tncm91bmQgcmVnaW9uLg0K
Pj4+PiANCj4+Pj4gSSB0aGluaw0KPj4+IA0KPj4+IFNvcnJ5IEkgZmF0IGZpbmdlcmVkIGFuZCBw
cmVzc2VkIHNlbmQgdG9vIGVhcmx5LiBJIHRoaW5rIHRoaXMgaXMgdGhlIHBhcnQgSSBkaXNhZ3Jl
ZSB3aXRoLiBBbGwgZXhwbGljaXQgYWNjZXNzZXMgZG9uJ3QgbmVlZCB0byBiZSBjb21wbGV0ZSAo
aW4gdGhlIHNlbnNlIG9ic2VydmVkIGJ5IGV2ZXJ5b25lIGluIHRoZSBzeXN0ZW0pLiBUaGV5IG9u
bHkgbmVlZCB0byBoYXZlIGdvbmUgdGhyb3VnaCB0aGUgcGVybWlzc2lvbnMgY2hlY2suDQo+PiAN
Cj4+IEkgdGhpbmsgSSBtYW5hZ2VkIHRvIGZpbmQgYWdhaW4gdGhlIHdvcmRpbmcgdGhhdCB3b3Vs
ZCBqdXN0aWZ5IHdoeSBhICJkc2IiIGlzIG5vdCBuZWNlc3NhcnkgZm9yIHRoZSBwZXJtaXNzaW9u
IGNoZWNrcy4gRnJvbSBBUk0gRERJIDA0ODdLLmEgRDIzLTczNDk6DQo+PiANCj4+IGBgYA0KPj4g
RGlyZWN0IHdyaXRlcyB1c2luZyB0aGUgaW5zdHJ1Y3Rpb25zIGluIFRhYmxlIEQyMi0yIHJlcXVp
cmUgc3luY2hyb25pemF0aW9uIGJlZm9yZSBzb2Z0d2FyZSBjYW4gcmVseSBvbiB0aGUgZWZmZWN0
cw0KPj4gb2YgY2hhbmdlcyB0byB0aGUgU3lzdGVtIHJlZ2lzdGVycyB0byBhZmZlY3QgaW5zdHJ1
Y3Rpb25zIGFwcGVhcmluZyBpbiBwcm9ncmFtIG9yZGVyIGFmdGVyIHRoZSBkaXJlY3Qgd3JpdGUg
dG8gdGhlDQo+PiBTeXN0ZW0gcmVnaXN0ZXIuIERpcmVjdCB3cml0ZXMgdG8gdGhlc2UgcmVnaXN0
ZXJzIGFyZSBub3QgYWxsb3dlZCB0byBhZmZlY3QgYW55IGluc3RydWN0aW9ucyBhcHBlYXJpbmcg
aW4gcHJvZ3JhbSBvcmRlcg0KPj4gYmVmb3JlIHRoZSBkaXJlY3Qgd3JpdGUuDQo+PiBgYGANCj4+
IA0KPj4gSSB1bmRlcnN0YW5kIHRoZSBwYXJhZ3JhcGggYXMgZW5hYmxpbmcgdGhlIE1QVSB2aWEg
U0NUTFJfRUwyIHdpbGwgbm90IGFmZmVjdCBhbnkgaW5zdHJ1Y3Rpb24gYmVmb3JlIGhhbmQuDQo+
IA0KPiBZZXMsIEkgYWdyZWUuDQo+IA0KPiBIb3dldmVyLCBhcyB0aGUgbGluZSBzdGF0ZXMNCj4g
DQo+ICJEaXJlY3Qgd3JpdGVzIHVzaW5nIHRoZSBpbnN0cnVjdGlvbnMgaW4gVGFibGUgRDIyLTIg
cmVxdWlyZSBzeW5jaHJvbml6YXRpb24gYmVmb3JlIHNvZnR3YXJlIGNhbiByZWx5IG9uIHRoZSBl
ZmZlY3RzIg0KPiANCj4gVGhpcyBtZWFucyBzeW5jaHJvbml6YXRpb24gaXMgcmVxdWlyZWQgYWZ0
ZXIgdGhlIHdyaXRlIHRvIFNDVExSX0VMMi4NCj4gDQo+IEhvd2V2ZXIsIHRoaXMgc3luY2hyb25p
emF0aW9uIHNlZW1zIHRvIGltcGx5IGRzYiBzeSArIGlzYi4NCj4gDQo+IEZyb21BUk0gRERJIDA0
ODdLLmEgSUQwMzIyMjQgQjItMjc0DQo+IA0KPiAiQSBEU0IgaW5zdHJ1Y3Rpb24gb3JkZXJlZCBh
ZnRlciBhIGRpcmVjdCB3cml0ZSB0byBhIFN5c3RlbSBQTVUgcmVnaXN0ZXIgZG9lcyBub3QgY29t
cGxldGUgdW50aWwgYWxsIG9ic2VydmVycyBvYnNlcnZlIHRoZSBkaXJlY3Qgd3JpdGUiDQoNCkkg
dGhpbmsgdGhpcyBpcyByZWxhdGVkIG9ubHkgdG8gdGhlIFN5c3RlbSBQTVUgcmVnaXN0ZXIsIG5v
dCB0byB0aGUgcmVnaXN0ZXJzIGluIHRhYmxlIEQyMi0yICh3aGljaCBTQ1RMUl9FTHggYXJlIHBh
cnQpDQoNCkFueXdheSB3ZSBjb3VsZCBkaXNjdXNzIHRoaXMgaW4gcGVyc29uIGF0IHRoZSBYZW4g
bWVldC11cCBhbmQgd3JpdGUgYSBzdW1tYXJ5IGluIHRoZSB0aHJlYWQgbGF0ZXIuDQoNCkNoZWVy
cywNCkx1Y2ENCg0K


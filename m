Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26DA9D98E7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 14:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843774.1259376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFw05-00059Q-7U; Tue, 26 Nov 2024 13:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843774.1259376; Tue, 26 Nov 2024 13:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFw05-00057D-3G; Tue, 26 Nov 2024 13:53:09 +0000
Received: by outflank-mailman (input) for mailman id 843774;
 Tue, 26 Nov 2024 13:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuIc=SV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tFw02-000577-Pq
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 13:53:06 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1814830-abfd-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 14:53:03 +0100 (CET)
Received: from DUZPR01CA0354.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::6) by DB9PR08MB8435.eurprd08.prod.outlook.com
 (2603:10a6:10:3d5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 13:53:00 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::d5) by DUZPR01CA0354.outlook.office365.com
 (2603:10a6:10:4b8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Tue,
 26 Nov 2024 13:53:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Tue, 26 Nov 2024 13:52:59 +0000
Received: ("Tessian outbound 3b1f0cd68b0e:v514");
 Tue, 26 Nov 2024 13:52:59 +0000
Received: from Lcf24810524f2.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 532C149F-3C72-4FAB-81BA-9D8F81BFC1E3.1; 
 Tue, 26 Nov 2024 13:52:49 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lcf24810524f2.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 26 Nov 2024 13:52:49 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU0PR08MB9078.eurprd08.prod.outlook.com (2603:10a6:10:47a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 13:52:45 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 13:52:44 +0000
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
X-Inumbo-ID: c1814830-abfd-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6YzIwMDo6MyIsImhlbG8iOiJEVTJQUjAzQ1UwMDIub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImMxODE0ODMwLWFiZmQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjI5MTgzLjcyNjYyMiwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X+RlBznjauvcapkf43McGJ+F3qnQsGehLnaCIZRQW2viV+ivOSfSotT858KAzn7OlSmh2L7tSUyiJC1Kuz/sy9QDq8mWlDrz9GFw94E1IOlhJ6YBS3faubg6Yx27G45r9lcO565Uo3VqXVdWY4w+A6yJaNpTuHdOh8GGObeg7ZX36YBePmt5L2sIk0gXKGJaM4i7/GrePMM2mpXOdqDvOtsa8B24CT3okFThK0V3ycMTBRcayR7J41fGLzHzPK0QfwryTtYUOQXs9Id9XFBGicZgD7bk5Vy9Vn9dpso0K38MK59PiDxdHwlK7ShOz5KmAltqP7HE8kDdfhhDju/nHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hTtStIm0SWoepj+W/CbKwf2l1KK2PH4O3tUvYRKZLY=;
 b=h8F5bCJoq4M0jmplVpi6YXdOT17rGQ/bu537u+c5Eo1sZoGWTgHoM+oxJZO9QzZs4zJ1g6p0jBx/pJh8SGB6aB1W5t+NcsIgzDfmH/uyauj5WKCIC8oerReLPaoWl5pgkmwfqlJHMn9enBzoO9aRWZnLeVqlZChn9FZl42Sb2jemjBMhJa8yTgPMsbVksMd/+OIKbg7foCeMCowiYEImHi8LV7uRmSKm94ASZPa5Z1WefZLYOYlsmrJFgetyqQFlHlwZp0RDHyeq3ZUJ/sFI/3Do5eCOmLNIDxxah4EVoipIVrlf0SWkUNp+vc/jkp4IR/lIQ/1RVADfwyIaE+0ssg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hTtStIm0SWoepj+W/CbKwf2l1KK2PH4O3tUvYRKZLY=;
 b=FnVJ8/UhZuX5YQnl1lC/FOptd1gr7z5q8truaCf6UeP8dcmOVBQt1jkDYGRAxF2rn4AZN0vfz0Jp3p052VOysyBeTfkOkkVcfEQ7e3mKJZI4fJKnIBbBg8D4bI7OFRT6Z9L03Ch6q4CtbC60WPtScB4h4T4MyOaof1n1rGLdVYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3655f75c36574106
X-TessianGatewayMetadata: qC5ubY04GPOD2xbUVbFoykj6S67qXv5qXImSBZH+w9l3xllyb4fDE9V5ibOEY76hFHtCp6E9tj7Zf7QLzGV1TO708vMkP095xjQlEWi+maF1sg/QV4exIFX5vjLM393Vn1fOGfyJzP9I5mxab3eNqgV5wUFW92kkOTHoWYxxb8Q=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gy7Z1QnorIMIZ9PgZjVccYaP7QnMezk+3XMq38PGRc0l1QFhPeH7Xhz1VVJU0T3uL0etMkvpboAK0hoewyfCWgQXbtL3kZwJ4gggUuAt9z9yQdGAdbJtCcPXm4/mh6MPFXEKpgfgSOJAxHuK/XVHyqAHI03qKOp9tmlJJEEuKYvEK5Rj1RdA72FBcHVcvyyipSAmb24Keh42X6+QoWEOtW3po5cFzMr2lMl5Hc3w4alP50LwjML41SKotXN5HSIyP03AKhTRoqna37wTtooEl6tzbDfDftOwGqeS9n//S9Q9jeH4eSp5QzvyGYoD0ZrRs8mFAgUjMzaipr6IaYIZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hTtStIm0SWoepj+W/CbKwf2l1KK2PH4O3tUvYRKZLY=;
 b=aqm8GFxQ7L7LCXQhLcWgKDO2OPD6DtY6iAyCyJZDnc4tcSkLtOSHIPwL/6ugmkwU5agARlHvtJk6uPpuJ/rM5YECYhjjE0wSvg01VI2ppdnOAr5WfKkAFRVE/7YzqzVt2vU6FV8wqb/weuAmFarcONLzttoRP6+RSz2rm8YnIXwvstWI3HVaCdEXThNSjLjJzg9JKyFH/wAPPZDCoKIBiUD+MU/iRTObjHJr1rr4NO/hPAyMen1PgkPbf1t/Z5XYuYJzTCLmH/plmBH12Mlhfn5+oS3LV8uEfyjnB/bp/RPs+RfXLc0kpoS15UV5UsKmUOQeFFevOBDUUHDtuhuU9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hTtStIm0SWoepj+W/CbKwf2l1KK2PH4O3tUvYRKZLY=;
 b=FnVJ8/UhZuX5YQnl1lC/FOptd1gr7z5q8truaCf6UeP8dcmOVBQt1jkDYGRAxF2rn4AZN0vfz0Jp3p052VOysyBeTfkOkkVcfEQ7e3mKJZI4fJKnIBbBg8D4bI7OFRT6Z9L03Ch6q4CtbC60WPtScB4h4T4MyOaof1n1rGLdVYI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
Thread-Topic: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
Thread-Index:
 AQHbOmE/JeWd4mQRXU6E1FRNAbLoQLLIOm6AgAE0ZQCAAAS3gIAAJQWAgAABEICAAAZqAA==
Date: Tue, 26 Nov 2024 13:52:44 +0000
Message-ID: <C881D093-C583-49BE-B541-ACE705C2C2C7@arm.com>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
 <20241119085806.805142-5-luca.fancellu@arm.com>
 <ca91b717-47c3-4f92-af6a-cb740ef6e91d@suse.com>
 <BE895863-B07F-42C2-BD44-D0A1E6150DC4@arm.com>
 <e5f0b9e4-80ab-4cf5-8745-4cb83cfe4c7d@suse.com>
 <7761CEB9-2304-4588-9ADE-C81B9A5E536C@arm.com>
 <7cc9ad6f-e5f6-444f-994c-b176a93cfb29@suse.com>
In-Reply-To: <7cc9ad6f-e5f6-444f-994c-b176a93cfb29@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU0PR08MB9078:EE_|DB3PEPF00008860:EE_|DB9PR08MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: d46c123e-a042-4876-ba9b-08dd0e21a399
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WEtkYzNSb3VhOCtVamt0VEoxOEN3MzJzazJidGJCQndkaEpZTE9hN2k5QmNY?=
 =?utf-8?B?T2ZzeFN5YU9GVHZ5RW1JTlFvMy93bU4vZ1FQNmUxcXY5aHdoQm9yc0dhNXBH?=
 =?utf-8?B?d0kveFJxNnRDc25ZbWR0ZFI4dFoyZHFCYTBLS05pREtxckxmckJ0aVR4czVX?=
 =?utf-8?B?QjRyZkhmYm45N0MwRmZZMHZTS1VyUUt0MjNBMjRaU21RQlRWSDRqcWdYQ0tU?=
 =?utf-8?B?Q0dzM05FNlpZYmFkNjMrTHROVDRVRERqbmhmSHBuQW9EWU1ZYWNiWHVKUVp1?=
 =?utf-8?B?a2k3ak1sR25LemZCMFFsQ2lDcVdDOTYrUWVMZU53bXlQTWZZaGZiR1ZzTlZW?=
 =?utf-8?B?Y0wzNEI3N2M1dGNjejJ3OTU2MTc3UW9odldmR21GQXJKMUUwVWVEM1FueEd6?=
 =?utf-8?B?eTJZUnBveGpQbnA0Y2ZLRkFFbGdMclV4aWtQa3dkWFhGeWxuRlI0Uk16VUR0?=
 =?utf-8?B?aTdIL0kydFpKNVZxM1JITWFBbklHRERETmN0bk5POG5wa0R2MS9WaXBOci9r?=
 =?utf-8?B?MlZCYjNsYlVMVjhTSER2RnpkY1JyK2MrMEFQT3d6NXhyd3pmTEozbDFNRm9m?=
 =?utf-8?B?SnNtQlEvc21sVlhzNitMaHozQUl5YmFyNTUraFNyQWJIbUp5NVVtdzVKZEhH?=
 =?utf-8?B?QVpTbWdZd04yNWp0eURFREtVaFFPMFAyOGpXWEoxdFllbFFiMzVNOXNKUnY0?=
 =?utf-8?B?Zk9kbVlQTm9UenU3ZHZjb1J2NW9jbmtLMER1azJKNGRXMjVsV3RHS0Z6N25i?=
 =?utf-8?B?ZnlqWSszZ29ld25pYXgrc1gyL1RUb1VnZWg0S2JITElNZUEzcHJoK1Zhb05W?=
 =?utf-8?B?Sk1CRWVGYTczL1ZRNFk4R3dqSXZicTdjS1NQVVNEbTd1ek82RHVlZkhmd2xI?=
 =?utf-8?B?enloVVJUQUlacXdXL2owNFlCN0FvOEs5L3l4OXF4NUJlMXMySS9LU0dTVVNI?=
 =?utf-8?B?bGtwVC8wTlNteWZWNVUyZUo3TDNQKy91TUJjSkpBOXU3OVJ1ZmVYZkpwbXUx?=
 =?utf-8?B?S3RtSXM2KzNCQk5KS3BMbGRDTUFJbnJvcjQ0VWVhVWVMU2tLM3pmY2tPYmpy?=
 =?utf-8?B?b2NRSElWWENkZ3JVenk5Ulo4ZEhKOGpOVDhpWjBsVWdGME9vbUF0TUhtd0hT?=
 =?utf-8?B?U3AzbUZjKzJoa2R1OFYvK2xPNklvVHR2NDhzUFFpTEdRcXN0RkhjaFJxY3Bt?=
 =?utf-8?B?YWZKZGFuckZJUWovR1RDUlI4eG5EVzA4OTgvL0FFOWJIc0FJcURIckZFRWRs?=
 =?utf-8?B?dHU5SE5IKzFsNElITTlDeDdES1EydWh5cUt3N2pWUzNoY0JuZVgzbzZ0eUZC?=
 =?utf-8?B?YXdReEtHa1k0VmNDQjVRQmo3bUphM0NqK282Z25HUGZVbFdyNkM2cWZYWnBq?=
 =?utf-8?B?THRDS01kcVFRcGdQcU12aFMvZ0dTQlVKUGV1cENjUGErRXpUS3ZRZHJlZmRs?=
 =?utf-8?B?R1dJV1JCQUpIS3RLZm0rMnR6ay9hYXpKdDFoeHU1TnBDTGJnT3RweTQ5MnFl?=
 =?utf-8?B?ZXA0OFg0NlNDWmg1M2t6b2w1Mm1pRFlDZXlrTmVoZ3RXQ3hMSDVDRnpTWGlG?=
 =?utf-8?B?Y1lOc3BUM2g1KzZMcUJmT0xJWWEvVmRIbnk1QmVqbmdGaGxsSkJlYkQ5cytG?=
 =?utf-8?B?MXNNR2JTc2dnYWJBbXF0d3NkNXhtTjBraFNkUkJIZTJuU05nTFI1d21wcmVl?=
 =?utf-8?B?MldIekkwS2FQa2E3SHFBV3YySVU3K09lOXJQQUp4cmlYL2xmdlorZlFKanVk?=
 =?utf-8?B?RUd5YUEvRkVZQ1VSSGp2ME5oVGtkek9uNXV0Z0J5cFZUaHI4RGd4TUtvL1R6?=
 =?utf-8?B?NDZKdzdTNk56VjlGemVMSnN4N05SMTlYT1lGVUJzUzBVMDF3Tk5IUGs0bjky?=
 =?utf-8?B?S3ZGYjJWY2U5M3ZXSEFEUjNzV0hONkNnNmZqd3FvTWRyUUE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CB1CF957869A649BBFA71E1E66D9D9E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9078
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f60c7a7a-dd0f-4ec8-0b20-08dd0e219ab2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|14060799003|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z29IblZaWGl1WUJqeS81a1c5SmVKV1lMZ0dneDVNNStBdmN4NnBJNlpQamRw?=
 =?utf-8?B?aVNLRlBBY05td3d5OFlEZ085a2MvaVlBY1c5MndNVnZuanVPdnJDV0hQLzN3?=
 =?utf-8?B?eU5SNnNaK3FIcjhrMlkveXArandrVTJrd09oTHcrbWR1MEpKcFROY2gwMzda?=
 =?utf-8?B?ZXVpZFMrYWVKNXd2RTE2L0I4RnlPVlhnSFE2MExzcUIyOUdEWEFoYUp0d1VF?=
 =?utf-8?B?ZW0wRUs1WDVIdVppbTF0UFRJbWlRQVIzUWR2dC9uMGVxMHFuS3BUMi9oNlRn?=
 =?utf-8?B?cjNSQnluRy9BYWFjT1dBSDZxVFpxZVRORldwYStiTHI5ajk5STU4UXBnZnB4?=
 =?utf-8?B?ZFh1N3UrdTl1WThIa005bGFpdDlkbDNGVC9NOGtKU1Z0RXV3cjliWDhsclVO?=
 =?utf-8?B?cmFBS3BnazhtTFhkTE5RWkNTbU1DRnQ1REhsQ3NZTlJjZDUwUkJrTXhjY0xn?=
 =?utf-8?B?SWdTSDM4Qi90b3VFU0U0b0FaeHBlbFU1M0VKbkoxVGRMdmNoWHh4MHlqVWNv?=
 =?utf-8?B?QjBMYnZRY1hEekxmTkFUT3lEL2FGRlN4NytpZU9hYWlaY0RrT3dIcGR0dWh5?=
 =?utf-8?B?UDBnSG8rTFpYeGphZk9GSFNJVnFQbWpSanM0c29tRFNsZmJyTkU5Ym1xRTc5?=
 =?utf-8?B?NkptcUFTL0tTdXhPOUJhQjd1a2h4K1lMcWQ0a01ZKzhmMVdzTDFrMTBzY3Er?=
 =?utf-8?B?cWw3d01Ld01pak1qZnlTdGE4ZW4wRFFqTXlQNTNpQURSZG1wYURRbzdlYnFq?=
 =?utf-8?B?SzFmWEo2RVZQdjAwUStSRENNdEtkZ3F5MkRwN2gvbFZpWkU2cHJYeXdJdHhq?=
 =?utf-8?B?NEkyZDhkZDNpQWJEYW1IaldEL3Y2SWVMVGJWV0cwT203SWhmbXIwYmZ2RTgy?=
 =?utf-8?B?TWlLOVdhRmY3dzYxRFNaeENFTmNsbUt1QWRyQjZZMHNOUzFJNTV6MmFQMGhP?=
 =?utf-8?B?VGVEdjZuS3EwRXBSNlhPa0MwTDgyaWk4MjdLdW5aZ3E5Rm1KaHJBQkNIWGNB?=
 =?utf-8?B?VnFQN1R6OUh1WmR0YXpFakJza29KRGFXdTIySzk2a3RwekVKWlRuSUhyU2h6?=
 =?utf-8?B?RTFVMlI3VnR3TE1vanR6RVBUNGdpUGpCWDBmOXZCK0YyYlk5b2xGWEN1Y1RK?=
 =?utf-8?B?SUJlejJVdXU5MXgxSWtJRkRDVlhEcS9BOHQ4RTNpRkFqY1N5ZWRLdWtySmZx?=
 =?utf-8?B?Um0vM01aSFRPSTJEYjRubGJhcWdJQWhOYjcrMzY4cG1UeW9kYTlTTTBMNUdR?=
 =?utf-8?B?RzhOUTkyalp5bStUdUt1djI4MGtFaEd2eHFiZDhFV203Sk9TUmFrZDh3L1lD?=
 =?utf-8?B?bkM4aWd5L3dVSnNJbDB0bXl0UUgrTFNZUW1ydFJVU1BIQXFZUTAzRG41VDhp?=
 =?utf-8?B?TE9sMElTcUtCK1AxWmY0UHc0Mkhab0lvaFo4YVpjbFBQek5xQ3ZaUDRBMjVE?=
 =?utf-8?B?c0N4NFNwNERhb1FINzQ5YzJtZ1pZWnpXYmFGM2l2czRUMU11M25PZFZXNmE4?=
 =?utf-8?B?bW1SUkQ3NjVJcm9LaGUvbEVNM25Ldkd1bDJ0bFpvcXhjR2pYSFRkU1c5MHl6?=
 =?utf-8?B?bDZhMSt4ZTBCVkQzMk5aaDlUd2JCc2pobWNWKytRZis2NkdXaitUck1kRm0z?=
 =?utf-8?B?MUx6QWVEaS9hRTRLcHl2S2dobTVMa0ZvWHkwVjZGbit0anFFaVVtcVlRSFN3?=
 =?utf-8?B?SjFjaEdneW9yNDRORDU4SDdMRUdjNHhmcGV6MXNaNlhkbUZuSVc0ZmlQTGlz?=
 =?utf-8?B?VzBZVTZBZC9PbXdyRHhWdFlUdy9nMWU5QnFrR1Rwb2dYT3F5NlVLQm9CQndS?=
 =?utf-8?B?OUtrM3l6dng2NndrdnFMdzZHVXlrTE5EL1lkR0dMYkdhS0F1dDdYTk5EdXFT?=
 =?utf-8?B?NTlXUUJ3NWFJaGdRSlVxb0xHc09FWngvZmZqa2dMV3dhdWRmNHY4eFBBZnEv?=
 =?utf-8?Q?GEYlM9ZRQRCJ7vYetVM8EoUHYZHS1zKT?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(14060799003)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 13:52:59.7636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d46c123e-a042-4876-ba9b-08dd0e21a399
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8435

DQoNCj4gT24gMjYgTm92IDIwMjQsIGF0IDEzOjI5LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjYuMTEuMjAyNCAxNDoyNSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBUaGlzIHJlYWRzIGJldHRlciwgdGhhbmtzLiBGb2xsb3ctb24gcXVlc3Rpb246
IElzIHdoYXQgaXMgc3RhdGljYWxseQ0KPj4+IGNvbmZpZ3VyZWQgZm9yIHRoZSBoZWFwIGd1YXJh
bnRlZWQgdG8gbmV2ZXIgb3ZlcmxhcCB3aXRoIGFueXRoaW5nIHBhc3NlZA0KPj4+IHRvIGluaXRf
ZG9taGVhcF9wYWdlcygpIGluIHRob3NlIHBsYWNlcyB0aGF0IHlvdSB0b3VjaD8NCj4+IA0KPj4g
SSB0aGluayBzbywgdGhlIHBsYWNlcyBvZiB0aGUgY2hlY2sgYXJlIG1haW5seSBtZW1vcnkgcmVn
aW9ucyByZWxhdGVkIHRvIGJvb3QgbW9kdWxlcywNCj4+IHdoZW4gd2UgYWRkIGEgYm9vdCBtb2R1
bGUgd2UgYWxzbyBkbyBhIGNoZWNrIGluIG9yZGVyIHRvIHNlZSBpZiBpdCBjbGFzaGVzIHdpdGgg
YW55DQo+PiByZXNlcnZlZCByZWdpb25zIGFscmVhZHkgZGVmaW5lZCwgd2hpY2ggdGhlIHN0YXRp
YyBoZWFwIGlzIHBhcnQgb2YuDQo+PiANCj4+IENvdWxkIHlvdSBleHBsYWluIG1lIHdoeSB0aGUg
cXVlc3Rpb24/DQo+IA0KPiBXZWxsLCBpZiB0aGVyZSB3YXMgYSBjaGFuY2Ugb2Ygb3ZlcmxhcCwg
dGhlbiBwYXJ0cyBvZiB0aGUgZnJlZSByZWdpb24gd291bGQNCj4gbmVlZCB0byBnbyBvbmUgd2F5
LCBhbmQgdGhlIHJlc3QgdGhlIG90aGVyIHdheS4NCg0Kb2ggb2ssIHN1cmUgb2YgY291cnNlLCB0
aGFua3MgZm9yIGFuc3dlcmluZy4NCg0KPiANCj4+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
Ym9vdGZkdC5oDQo+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2Jvb3RmZHQuaA0KPj4+Pj4+
IEBAIC0xMzIsNyArMTMyLDYgQEAgc3RydWN0IGJvb3RpbmZvIHsNCj4+Pj4+PiAjaWZkZWYgQ09O
RklHX1NUQVRJQ19TSE0NCj4+Pj4+PiAgIHN0cnVjdCBzaGFyZWRfbWVtaW5mbyBzaG1lbTsNCj4+
Pj4+PiAjZW5kaWYNCj4+Pj4+PiAtICAgIGJvb2wgc3RhdGljX2hlYXA7DQo+Pj4+Pj4gfTsNCj4+
Pj4+PiANCj4+Pj4+PiAjaWZkZWYgQ09ORklHX0FDUEkNCj4+Pj4+PiBAQCAtMTU3LDYgKzE1Niwx
MCBAQCBzdHJ1Y3QgYm9vdGluZm8gew0KPj4+Pj4+IA0KPj4+Pj4+IGV4dGVybiBzdHJ1Y3QgYm9v
dGluZm8gYm9vdGluZm87DQo+Pj4+Pj4gDQo+Pj4+Pj4gKyNpZmRlZiBDT05GSUdfU1RBVElDX01F
TU9SWQ0KPj4+Pj4+ICtleHRlcm4gYm9vbCBzdGF0aWNfaGVhcDsNCj4+Pj4+PiArI2VuZGlmDQo+
Pj4+PiANCj4+Pj4+IEp1c3QgdG8gZG91YmxlIGNoZWNrIE1pc3JhLXdpc2U6IElzIHRoZXJlIGEg
Z3VhcmFudGVlIHRoYXQgdGhpcyBoZWFkZXIgd2lsbA0KPj4+Pj4gYWx3YXlzIGJlIGluY2x1ZGVk
IGJ5IHBhZ2UtYWxsb2MuYywgc28gdGhhdCB0aGUgZGVmaW5pdGlvbiBvZiB0aGUgc3ltYm9sDQo+
Pj4+PiBoYXMgYW4gZWFybGllciBkZWNsYXJhdGlvbiBhbHJlYWR5IHZpc2libGU/IEkgYXNrIGJl
Y2F1c2UgdGhpcyBoZWFkZXINCj4+Pj4+IGRvZXNuJ3QgbG9vayBsaWtlIG9uZSB3aGVyZSBzeW1i
b2xzIGRlZmluZWQgaW4gcGFnZS1hbGxvYy5jIHdvdWxkIG5vcm1hbGx5DQo+Pj4+PiBiZSBkZWNs
YXJlZC4gQW5kIEkgc2luY2VyZWx5IGhvcGUgdGhhdCB0aGlzIGhlYWRlciBpc24ndCBvbmUgb2Yg
dGhvc2UgdGhhdA0KPj4+Pj4gZW5kIHVwIGJlaW5nIGluY2x1ZGVkIHZpcnR1YWxseSBldmVyeXdo
ZXJlLg0KPj4+PiANCj4+Pj4gSeKAmXZlIHJlYWQgYWdhaW4gTUlTUkEgcnVsZSA4LjQgYW5kIHlv
dSBhcmUgcmlnaHQsIEkgc2hvdWxkIGhhdmUgaW5jbHVkZWQgYm9vdGZkdC5oIGluDQo+Pj4+IHBh
Z2UtYWxsb2MuYyBpbiBvcmRlciB0byBoYXZlIHRoZSBkZWNsYXJhdGlvbiB2aXNpYmxlIGJlZm9y
ZSBkZWZpbmluZyBzdGF0aWNfaGVhcC4NCj4+Pj4gDQo+Pj4+IEkgd2lsbCBpbmNsdWRlIHRoZSBo
ZWFkZXIgaW4gcGFnZS1hbGxvYy5jDQo+Pj4gDQo+Pj4gRXhjZXB0IHRoYXQsIGFzIHNhaWQsIEkg
ZG9uJ3QgdGhpbmsgdGhhdCBoZWFkZXIgc2hvdWxkIGJlIGluY2x1ZGVkIGluIHRoaXMgZmlsZS4N
Cj4+PiBJbnN0ZWFkIEkgdGhpbmsgdGhlIGRlY2xhcmF0aW9uIHdhbnRzIHRvIG1vdmUgZWxzZXdo
ZXJlLg0KPj4gDQo+PiBPayBzb3JyeSwgSSBtaXN1bmRlcnN0b29kIHlvdXIgY29tbWVudCwgSSB0
aG91Z2h0IHlvdSB3ZXJlIHN1Z2dlc3RpbmcgdG8gaGF2ZSB0aGUNCj4+IGRlY2xhcmF0aW9uIHZp
c2libGUgaW4gdGhhdCBmaWxlIHNpbmNlIHdlIGFyZSBkZWZpbmluZyB0aGVyZSB0aGUgdmFyaWFi
bGUuDQo+PiANCj4+IFNvIEp1bGllbiBzdWdnZXN0ZWQgdGhhdCBmaWxlLCBpdCB3YXMgaG9zdGVk
IGJlZm9yZSBpbiBjb21tb24vZGV2aWNlLXRyZWUvZGV2aWNlLXRyZWUuYywNCj4+IHNlZSB0aGUg
Y29tbWVudCBoZXJlOg0KPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hl
bi1kZXZlbC9wYXRjaC8yMDI0MTExNTEwNTAzNi4yMTg0MTgtNi1sdWNhLmZhbmNlbGx1QGFybS5j
b20vIzI2MTI1MDU0DQo+PiANCj4+IFNpbmNlIGl0IHNlZW1zIHlvdSBkaXNhZ3JlZSB3aXRoIEp1
bGllbiwgY291bGQgeW91IHN1Z2dlc3QgYSBtb3JlIHN1aXRhYmxlIHBsYWNlPw0KPiANCj4gQW55
dGhpbmcgZGVmaW5lZCBpbiBwYWdlLWFsbG9jLmMgc2hvdWxkIGJ5IGRlZmF1bHQgaGF2ZSBpdHMg
ZGVjbGFyYXRpb24gaW4NCj4geGVuL21tLmgsIGltby4gRXhjZXB0aW9ucyB3b3VsZCBuZWVkIGp1
c3RpZmljYXRpb24uDQoNCkkgd291bGQgYmUgZmluZSB0byBoYXZlIHRoZSBkZWNsYXJhdGlvbiBp
biB4ZW4vbW0uaCwgSSBqdXN0IG5lZWQgdG8gaW1wb3J0IHhlbi9tbS5oIGluIGJvb3RmZHQuaCBz
byB0aGF0IGl0IGlzIHZpc2libGUgdG8NCuKAnHVzaW5nX3N0YXRpY19oZWFw4oCdLCBASnVsaWVu
IHdvdWxkIHlvdSBiZSBvayB3aXRoIHRoYXQ/DQoNCj4gDQo+IE9idmlvdXNseSBhIHBvc3NpYmxl
IGFsdGVybmF0aXZlIGlzIHRvIG1vdmUgdGhlIGRlZmluaXRpb24sIG5vdCB0aGUgZGVjbGFyYXRp
b24uDQo+IA0KPiBKYW4NCg0KQ2hlZXJzLA0KTHVjYQ==


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506648BE40A
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 15:31:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718118.1120665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KuR-0008OS-Br; Tue, 07 May 2024 13:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718118.1120665; Tue, 07 May 2024 13:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4KuR-0008Lb-91; Tue, 07 May 2024 13:31:07 +0000
Received: by outflank-mailman (input) for mailman id 718118;
 Tue, 07 May 2024 13:31:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rSc=MK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s4KuQ-0008LV-76
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 13:31:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bfd2d87-0c76-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 15:31:02 +0200 (CEST)
Received: from AM0PR02CA0183.eurprd02.prod.outlook.com (2603:10a6:20b:28e::20)
 by AS8PR08MB8826.eurprd08.prod.outlook.com (2603:10a6:20b:5bb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 13:30:52 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::82) by AM0PR02CA0183.outlook.office365.com
 (2603:10a6:20b:28e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Tue, 7 May 2024 13:30:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Tue, 7 May 2024 13:30:51 +0000
Received: ("Tessian outbound e46bb127ed3d:v315");
 Tue, 07 May 2024 13:30:51 +0000
Received: from 6a051c7c62f0.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 79ED57C8-3CE3-41DA-A4E0-6AE3B1E5B583.1; 
 Tue, 07 May 2024 13:30:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a051c7c62f0.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 May 2024 13:30:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU5PR08MB10415.eurprd08.prod.outlook.com (2603:10a6:10:519::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 13:30:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 13:30:37 +0000
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
X-Inumbo-ID: 0bfd2d87-0c76-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UZudkOKp+gbdyMRBFhSGCE/8einnKGQc8LRJmHQZAdr5Q+bAvJFbeoiHDIXmRvkgXhozvTBf97VYKxd8cJ4NRfx5eucUO5jg9h4J3DV1iZEbNQ1SCiJCCU8Kyti3UR0CGe5Ou2U+u98nwtzUX6jhbJ3Rl0Q29USncBFgdjgXUlJ8QDScPsk4fd2mWPQbyryt+K2vS4ECIouZCE22W8OrbEekB82r+AjdneOPlI66NqLq4vPqqxi/clBUN6GM+ZLeluKCKyJ7A+uLClIiSr5B1Wg0Z15Yd3kn4t++5FwIomEZAZpcJi1fZjxsSOeP/fIBbSZ7Hu7BkOpEdNDoVNtcpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLZe/krtQ6Xu4kVb/9R/+gGbvpxBggIpPorzOgR0Bhw=;
 b=XOQrsKwh4HDqJ/VDFegyTNH5S7w4NmmXaKaNjY/OZKnG5k5Q6zZMLtCfhmLwFcs9k5zP27riNA6WRUbw8n03iCAi4ztNc2j0saA2LZ75xzEug3TG5TFD1hZ/4WsngPSpJWzeFkwoS/3iyhDLHS7mztye29csmbMG+4xktIGaBfEEw+9SzlX8gQCOWpUs7DPrEejYINgKEIkpxSOLFIOsLQZlrQdxNxCxQ2asYgrb9iiMfkXfayWvCwsCyglQRFDrxe25eJ06ZyyAEOyD50BODXJiNGYgQLbiNo2EGf88X+Q7sq4a178Hwl1eiJnu/sYg+v1ZQZpvK2iVZiuhsNKncA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLZe/krtQ6Xu4kVb/9R/+gGbvpxBggIpPorzOgR0Bhw=;
 b=aBOdcJIFpV/mfIV8S9n6o82RDBdpqw9h4jl8rjA4m6hUxKQIXvQYOj5uCAqf07LXx2LTxVGmsYmtiU34NsKl4O/bPrUu3v7xuiWFu5K4coj7Wr3kYytnHVVvzD20zttIqYq9p7WAy1zfqXENdto/xbGS7j/CO0c5Vqeq74wPRV4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 12cf3bd0580ecbd4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRNt4g4A7VSxJO3WUpZf9rjoOFENpUE1By8lly6tBntEQm6suXdQG3LSr/EjS66p6+AEjo9pA8aYYkojVGi4qlPiaB5E878/GZtSTR4UWGY6HtO7b0hbgcKjfL9w1R4e2/p0nBTSvxA5IzfSEcsQSiiggWEf9D9Noprh024SQp1f4r0FPrRLc7H0pTl9Tg8STH/GnFGINH5qZ5zYmJ30xdpEzKcrfCgSpH9VVbTdI8aDpXczISnYdZJUC/YGbOSU6UiOOvqvdwrupq9F4Gt+tylXiHUjrZR4+FqNhmI+qQJs9tEgNhkH14T/XCw6FBaYJjHpbZbnjdhcgrHjoD+qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLZe/krtQ6Xu4kVb/9R/+gGbvpxBggIpPorzOgR0Bhw=;
 b=ByY9qVFQu9/SPoA6ZeOdjVj2A8sHiuAm0UMhr3F33UiSpJkPGPxxn2gTpf1Nzmyr/oFpiCyMt6wBF28qAUUILAINPAvaV44iI6tdbboxtC1rJgCoOdGHHpUC1VOJHgwb3jhLIV1Aeq8zjR9mzW7jHnrNYS2ffpaJcwRaboiP5QQMYJQYEKgOQ3JcJ3uwUN2WVSXcj8UOvSqnKl9SUejMGyW6rnMtxq0KRxkxoOUX34hCBLRTCwz4WH3zTHkKegx6FXs6D89Yr4CWnsoZUOHh1EyaMC1ZwPOhjlo7h4kRnDmWXvEOyH2Eb2moCtFJmJ3NcVvjPOp0YDBUCiDtxsmd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLZe/krtQ6Xu4kVb/9R/+gGbvpxBggIpPorzOgR0Bhw=;
 b=aBOdcJIFpV/mfIV8S9n6o82RDBdpqw9h4jl8rjA4m6hUxKQIXvQYOj5uCAqf07LXx2LTxVGmsYmtiU34NsKl4O/bPrUu3v7xuiWFu5K4coj7Wr3kYytnHVVvzD20zttIqYq9p7WAy1zfqXENdto/xbGS7j/CO0c5Vqeq74wPRV4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Thread-Topic: [PATCH 3/7] xen/p2m: put reference for superpage
Thread-Index: AQHalVftK+2d6c8qh0SLUJVfhafWO7GL2AEAgAACwYA=
Date: Tue, 7 May 2024 13:30:37 +0000
Message-ID: <9F196831-D294-4227-B86F-E8EEACB5B076@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
 <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
In-Reply-To: <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU5PR08MB10415:EE_|AMS0EPF0000019B:EE_|AS8PR08MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f28889c-3db6-4745-e11e-08dc6e99ea3d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d0w5TDFpbmFWRjVOK0lpbVJFWkxpVWljMWxrOHU2TVY1Q2MxYmNkRlZuTTF6?=
 =?utf-8?B?dEJmekZQL1o1M1pIWm9LQ3loOE5lcExLOUxHZmpaTE9FRDdNKzlzaW1QOENq?=
 =?utf-8?B?WTZ1eVZnMDc5Um9IbnRDenVFa01GRlNhanEyQ09wNk13bExEQ0tzcEJ2c2RD?=
 =?utf-8?B?SG0yQ0oxQklpNEdWelBQdEtCUUxaZW95L2NIeGxIai85V3A2dmplRUtxdGFm?=
 =?utf-8?B?bm9TQmF4Mnppa2lISUhUWENUVWR2Yjl4ckgweEgxeHVKdVBZZVJOeG5MeW55?=
 =?utf-8?B?SnR4NUNCcktNZ3V5VEw4OHpCVStyaTdGdldSTFFrOTgvK2VFTmtVMm92Wnhn?=
 =?utf-8?B?Z1QxYUpvNHg0bGpaUjJCanhnNi9IVUp3T29sK045eUZOVVlRK3M1N1dRU0Ew?=
 =?utf-8?B?U216OG1BWUZMNWhUaVYyekM5anp2eHN4ZGJ1Q0lSWXMra1Q1Ky9LOGc3bTl6?=
 =?utf-8?B?RHVubWpQNWVKazUvdStKQTZ5RzNtRUVuUmRxMlQrUTI3TFovNGt0YjVyNlE3?=
 =?utf-8?B?R2J5M0JlU0VudWZkN29uNlRrYjdwK0pzT2VJVXArZ0VTWkR6end4ZnRuWnd4?=
 =?utf-8?B?WlhlRjhwRXZxMlAwRlRNMitLVXpaZDU1YkFJWUo5ZDRBNGVMays4VlN4Qkxz?=
 =?utf-8?B?Z3ZIUlhtZWRTNUx0YXhxaVdDT1ZuRDA2cFFFcnhjMkZGWm1rVTNOYkhQZ2ZG?=
 =?utf-8?B?T3I2K2dGdEdMcWg0cjREUUNFODZkQ3ZaUTg4U0c0S1IyTlE0OUJkTWFvb2Uy?=
 =?utf-8?B?OTRXalBaYmxtSHRwRU5pb2EvQTFXVjdFZ0s4NHJSM1E3WklVKzhPS0FzaGRZ?=
 =?utf-8?B?bjhZUGwrNnYyUHlBMUxGRnU1VGRhblpGemhvZ0ZzdG1ORktzSEUyUThhSDln?=
 =?utf-8?B?MFAvVUFDY1V0OFR3dVk3SXMwZS9oOS82b1dnVG45Zmc2ck1sN3FXNHpHYWJZ?=
 =?utf-8?B?aU1xZ0pOSUkxQlJ5aitzS1hVQWxvQXVqZW1wR0Q1QWhEbzRMSE1McDdQMXRz?=
 =?utf-8?B?Y0pTZm5vNE84YzN5WU5lNEdWT3BLNkgvQWdUaDJhMFlua2IrWUpGZEFJbEov?=
 =?utf-8?B?di9mK0gySWE0VDRpMzhZdlhjd3FIWktwM1Q2QWFITEVnM0VtYjh3Mm5BTnl2?=
 =?utf-8?B?M3J0SDNqaHBmNVVJQlZlQ3ZtNmlHNFZjbXlBeisrc2RQWmRxT3N5TmxaZVlR?=
 =?utf-8?B?bzZWekI2b2RLSy94azZHNVI4Y3pzYUFmRVlZV1lETXg3NlNsVURIYm9OMXU5?=
 =?utf-8?B?RFFic09jN29HZkRpV1h6aHd5bzJTUUcxa05GdmphaWZZblQ5NDNqOU9wNmFo?=
 =?utf-8?B?TC9rdWFxVE1QM3MvNlJQdGJUWDVOT2I4OXNONHNzZ1EyUnpkYzNtTTVLc1gv?=
 =?utf-8?B?cU93RG9mOFBBV2ZtREFnZ1dod1lPUytNbTZHWDZYVGJvZ2tJc3JlWTRkc2Jz?=
 =?utf-8?B?cmRyckhsL05uVE1JcUo4cDdHSzhXVFk3bkVMTFl5NnAxZ0J0QkVyYm9QWkY0?=
 =?utf-8?B?SGQ5bHFvdWJyemZQOXF1aFd5S1lnZDUzemhncVFBM0VTeVZZa1dIN0dybTlj?=
 =?utf-8?B?cVM3eXZkQ1ZHUHBYajB2ZS94MUhyMDVxcGlQWjljUHcxOWpMWmZJbXhiWGhD?=
 =?utf-8?B?OWVLYlhzTnlqSGRJelQ4WnJyb045bm9iNG9icWZDcVVsZlhvdS81c0d6NXcz?=
 =?utf-8?B?UndQWXdEU05VU0YyOWtNZkFZRG9oZlh3K0pPWmJobjJlZm1BWkd5RG5WRmV5?=
 =?utf-8?B?aDlhUEVnc1ZTdHJJbjZsc3VWSUhtczltYVlPeEl4ZEt2UDAyY0czUDBSOTJu?=
 =?utf-8?B?LzZaSzJIeG9JSkVSLzI3QT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <77AC5011AA01494FA545FE595E2026D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10415
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0412a9e2-e79e-489d-2f8c-08dc6e99e1ea
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OW8rRmNWb1JITzc2OE5QcXZJb2h4UEJVYTRMSW9EdlZWSHAxVVJwMWh5MHlY?=
 =?utf-8?B?ZThLdkZoTHczRUdYaitlTGRLTGFqMVVsV2JnZ09Qb2pBMzlzZGI1Tm9vQ1RO?=
 =?utf-8?B?NHlaaHNmZnZxdlo4bVRHOEtRRjM2QnNnakdvN3B2KzRUNzROSnBhdkpTSVkr?=
 =?utf-8?B?dUtNNFgvdWsveTBLWWl1dStCR2UrVkl0MUFwN2hpNWdNUnFNVjhWOG9kdE5D?=
 =?utf-8?B?ZjQxWFdrdmc1T1FVallpSE9ocUFBVTUrYlVMbzBtWmdoYzNIS2lkZnkrRGww?=
 =?utf-8?B?WlZ3L21vOVlieXRacUEzaFhWRU1LNDhDMlMyNk5rRFl4RHN6eDNtNU1GUHBu?=
 =?utf-8?B?WXRhSWhIazZRSUlhTXQxdnhVNlVONnc1ak1HcmNDR25acFhYbmtiZ3RWTHVt?=
 =?utf-8?B?VHZUajNVVGJUUkJzNzlZQktORFNTcFFRQVlicGVCbCtBZ0tVMkJoa2l3QXBG?=
 =?utf-8?B?MzhmSThZeFFXOXQ3Nk9ONmhrU3BrWmRrajFOU0pTeVlWQTZFR1p5OC82azVZ?=
 =?utf-8?B?NVRoZWRYQ0tpejZZRDNDUlFxbnRGcXo5WG9nSks2alQ2Y0kwU0tEWk9oU3Zi?=
 =?utf-8?B?eWxlbEhnc3RvVTMxSnByVldlVzR6RFRTVm1ybnljcnF5Zy9QN0tGcFdLRFpZ?=
 =?utf-8?B?K3hDY2ltOUd3N0JKbXQyKzlSejBRUzZSRWhDUEcyOE9YOEJVV2Q2d0M2UVNI?=
 =?utf-8?B?QklYcEcyNy9OV0NJanUvcWpLZUtmNEErWmxJT0M1SG83VFhIbnMrT2RZLzZU?=
 =?utf-8?B?bjN2NHgwYUFacm0vd1JrNVZibXBZWWVRQmRzVVRjNFg0dXMyS1JBQS94QXNL?=
 =?utf-8?B?ZUlrbDhCeHBkVVB1WmxqWWZ6N0tpaVV5ZWprUDhGeENEWGJES3Fsa1I2amhs?=
 =?utf-8?B?RjVYNnNNUmRZTTVqT3VwdXNUN2kzWkY5UWlmYmpJdlhyNzEzSjU1aFRmd1FQ?=
 =?utf-8?B?T2xjVm1jM05sKy9xNzMxT1E0UUk3a0MrSUp6QSt2TE13Mko2N0lZSDQyaXJX?=
 =?utf-8?B?RmhNT2VzRm92THRNc2R2djhQV1dZN3JVVDZ5N283V3hxZ2hmLzlKTW1OL08x?=
 =?utf-8?B?ZWV0MnlWdUIrYlp4ZWdpckdBbGUyT3IxT0tZSUUzSFI1WXBxMlIzaktFakt1?=
 =?utf-8?B?Y002TUxwb2dlcHI3aytEQU5udko3T0U3dlo1TndWVzR4WjJUQ20rY09TQzJq?=
 =?utf-8?B?ZzJxZXZNU1Q5YmFYeDM3ZjRvQ1lWRzlEYlNWYndJVTc1UWw4TnVmT1hQRUhs?=
 =?utf-8?B?ZkQ4bnhNdS9rYWVzOStEa2E3Zngwb0FLRnpDbXpzaERBV0JjLzZmL0pFQXVP?=
 =?utf-8?B?NEVndWh3M0dDOElDd2M1ei9ONTdDeFI3NzcyQ0d4LzYyYnhUUjYxR21aSlBs?=
 =?utf-8?B?QlpkalI3QUFQdHgxZ3FwZmJTR2kxNHJiUXBuZkRoNHk2NGVNVEJpYkhabXd4?=
 =?utf-8?B?Y2NjNVRxRTB3b3l1Y0N1QXZtd2E0OWt4YXJzSE90NFFwZmc4aml4c3lUdFBo?=
 =?utf-8?B?M0lpZUJhZmRESGdYSTV0dGcwZXdFN1F5QjBVaG1xNnBzUEhyakNvZktSRWFI?=
 =?utf-8?B?bENGbnEzZWJtbGxzL0Nna0kwZWdadTduTWgwVUVXMnNOV3VyQWhVNVdxNmtt?=
 =?utf-8?B?MTZwNEFkOUlPa3BNRk43WHphVjFnMDlSRFRHOWl3M0lnanRDYy9SeUFMa1J2?=
 =?utf-8?B?ZnV6eVROYnp3bTVreHUvRHAxNGZKUnlJZ0JUbExPQm44ZHR0RThYemVueENp?=
 =?utf-8?B?Y2VQOGVPVnVsZHBQZ3JtMEJLdWFvL3JOcnhIYUhUMCt3dHRGNEVqRlFLUmtp?=
 =?utf-8?B?djZqNngxSEJDVzNlZy9BRFRZcnZzL2JCajBWMlMxSkxHd2JoOGdxS3lublhD?=
 =?utf-8?Q?UfUv4tDuA3vjY?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 13:30:51.8118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f28889c-3db6-4745-e11e-08dc6e99ea3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8826

SGkgSnVsaWVuLA0KDQo+IE9uIDcgTWF5IDIwMjQsIGF0IDE0OjIwLCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyMy8wNC8yMDI0
IDA5OjI1LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gRnJvbTogUGVubnkgWmhlbmcgPFBlbm55
LlpoZW5nQGFybS5jb20+DQo+PiBXZSBhcmUgZG9pbmcgZm9yZWlnbiBtZW1vcnkgbWFwcGluZyBm
b3Igc3RhdGljIHNoYXJlZCBtZW1vcnksIGFuZA0KPj4gdGhlcmUgaXMgYSBncmVhdCBwb3NzaWJp
bGl0eSB0aGF0IGl0IGNvdWxkIGJlIHN1cGVyIG1hcHBlZC4NCj4gDQo+IElzIHRoaXMgYmVjYXVz
ZSB3ZSBhcmUgbWFwcGluZyBtb3JlIHRoYW4gb25lIHBhZ2UgYXQgdGhlIHRpbWU/IENhbiB5b3Ug
cG9pbnQgbWUgdG8gdGhlIGNvZGU/DQoNClNvLCB0byBiZSBob25lc3QgdGhpcyBwYXRjaCB3YXMg
b3JpZ2luYWxseSBpbiBQZW5ueeKAmXMgc2VyaWUsIG15IGtub3dsZWRnZSBvZiB0aGlzIHNpZGUg
b2YgdGhlIGNvZGViYXNlDQppcyB2ZXJ5IGxpbWl0ZWQgYW5kIHNvIEkgcHVzaGVkIHRoaXMgb25l
IGJhc2ljYWxseSB1bnRvdWNoZWQuDQoNCkZyb20gd2hhdCBJIGNhbiBzZWUgaW4gdGhlIHNlcmll
IHRoZSBtYXBwaW5ncyBhcmUgbWFkZSBpbiBoYW5kbGVfc2hhcmVkX21lbV9iYW5rLCBhbmQgbWFw
X3JlZ2lvbnNfcDJtdA0KaXMgY2FsbGVkIGZvciBvbmUgcGFnZSBhdCB0aGUgdGltZSAoYWxsb2Nh
dGVkIHRocm91Z2ggdGhlIGZ1bmN0aW9uIGFsbG9jYXRlX2RvbWhlYXBfbWVtb3J5IChuZXcgZnVu
Y3Rpb24gaW50cm9kdWNlZCBpbg0KdGhlIHNlcmllKS4NCg0KU28gaXMgdGhhdCB0aGUgY2FzZSB0
aGF0IHRoaXMgcGF0Y2ggaXMgbm90IG5lZWRlZD8NCg0KDQo+IA0KPj4gQnV0IHRvZGF5LCBwMm1f
cHV0X2wzX3BhZ2UgY291bGQgbm90IGhhbmRsZSBzdXBlcnBhZ2VzLg0KPiANCj4gVGhpcyB3YXMg
ZG9uZSBvbiBwdXJwb3NlLiBYZW4gaXMgbm90IHByZWVtcHRpYmxlIGFuZCB0aGVyZWZvcmUgd2Ug
bmVlZCB0byBiZSBjYXV0aW91cyBob3cgbXVjaCB3b3JrIGlzIGRvbmUgd2l0aGluIHRoZSBwMm0g
Y29kZS4NCj4gDQo+IFdpdGggdGhlIGJlbG93IHByb3Bvc2FsLCBmb3IgMUdCIG1hcHBpbmcsIHdl
IG1heSBlbmQgdXAgdG8gY2FsbCBwdXRfcGFnZSgpIHVwIHRvIDUxMiAqIDUxMiA9IDI2MjE0NCB0
aW1lcy4gcHV0X3BhZ2UoKSBjYW4gZnJlZSBtZW1vcnkuIFRoaXMgY291bGQgYmUgYSB2ZXJ5IGxv
bmcgb3BlcmF0aW9uLg0KPiANCj4gSGF2ZSB5b3UgYmVuY2htYXJrIGhvdyBsb25nIGl0IHdvdWxk
IHRha2U/DQoNCkkgZGlkIG5vdCwgc2luY2UgaXRzIHB1cnBvc2Ugd2FzIHVuY2xlYXIgdG8gbWUg
YW5kIHdhcyBub3QgY29tbWVudGVkIGluIHRoZSBsYXN0IHNlcmllIGZyb20gUGVubnkuDQoNCkNo
ZWVycywNCkx1Y2ENCg0K


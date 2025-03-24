Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FFA6DAD2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925484.1328358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhWK-0000SM-1D; Mon, 24 Mar 2025 13:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925484.1328358; Mon, 24 Mar 2025 13:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhWJ-0000Q5-T4; Mon, 24 Mar 2025 13:07:11 +0000
Received: by outflank-mailman (input) for mailman id 925484;
 Mon, 24 Mar 2025 13:07:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDgH=WL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1twhWJ-000892-9e
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:07:11 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4acaf0c-08b0-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 14:07:10 +0100 (CET)
Received: from AM8P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::27)
 by PAWPR08MB9638.eurprd08.prod.outlook.com (2603:10a6:102:2e0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 13:07:07 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::5f) by AM8P191CA0022.outlook.office365.com
 (2603:10a6:20b:21a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Mon,
 24 Mar 2025 13:07:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 24 Mar 2025 13:07:06 +0000
Received: ("Tessian outbound d078c748a3d6:v601");
 Mon, 24 Mar 2025 13:07:05 +0000
Received: from Lb37729a73290.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 751A21FF-0726-432D-B690-DB87D51154BD.1; 
 Mon, 24 Mar 2025 13:06:59 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb37729a73290.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 24 Mar 2025 13:06:59 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB6351.eurprd08.prod.outlook.com (2603:10a6:102:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 13:06:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 13:06:56 +0000
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
X-Inumbo-ID: e4acaf0c-08b0-11f0-9ea2-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pQa9vRb8SnCoQZ3dm1/F5eMrNhohMDlDpKhqGP1+Q49cdikKtiakWxp2muPHeZK+RE7v77jPq1xgoxJkGjupcrI0AgBXbPkiYgx42SBJBLJFIq/VXOcN9zmRsRBvqGHgmkhbtPKnofObCcaUoUlgSXyyBsQComujmMkB8/EzgFTjadyvHGHF7Z5lt5PPDGYaqmrqg/kBHw2zdBjQ55Nbr3lUP86c7xWD24jOX/tp8DksSaotjWG4Eodp3i8bogEnHMSrGQXSLZTy42/zvAzEwcPTHiW3JfYYrlDnbWkB4r8vmFlduRg9ZYVBj9j6CdM+03UohaAJ/UQjkLagLJ7/Xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiIaM187TRCxqeo1kPMjwQeuuwvWBXXGXPGVEBLaDsE=;
 b=N4ANWwWdknCGfjeTl22AbbVzwo+1pO0603duaOeNi51nG65eYLFPBA/wgHckJmcTG4KV8osCt/+OjVMrvsRVJc76q+1a/z2aaIaNjVUsAVd00eD9EIrIoNUgh3Yq7yXRUZNbhayjOb2bGumj0lU28cZacAkKqIpVlT+XBtQzv4p+DIGqxaenEGq0WXuyQ1TCyQOeKwR4vMkX2dH/mT4aWq3aqxj3VHTnA02+K6S1OURu5Y34ayQfJpb2W3YTpjsJ/qfja2IpIK+tBst0wQl0BcBnf3tWwEIRz3rTOnWVS+j8M25DPKVhxDAfEdiSGtPHQMcBM0jXlS/WrB2tuW8YVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiIaM187TRCxqeo1kPMjwQeuuwvWBXXGXPGVEBLaDsE=;
 b=Fmmk7VjW0ITJ+iS3oEzjaDGHGTaGTgT/YBYJIOVHyKqeL2HvXAr/JQYTRLTwRbguwXmgscSH0x1ePqL9tSmK31z7M6COd+Srmr+0CQfdtv69nxfCEc1pu2ahYbHjbqnr/co8K4j0fZsydAXAsrZ5lAy7yorYDXk2MUNs+GQ23jI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c8ebbf333fbb02f3
X-TessianGatewayMetadata: V4uabKF5SfNTIl/fV39Qfb5jYax42liJweakFzylPeHqk4a02G2oBgXjEBJDM68BMh8Nt+gW3UB/6m6SZTs5LOuVu2RtxtxDu5F8oi9xxGkqC6kreGiNLAD/qb211jSfl41qCd+rfbDbebcDHbe/t6XyvBt8L6iZZyp64b+W8Gk=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBCRHLmPVECtm0sVMqH/SEa+RlrvuXS44G0fOftLm72aeXJs7Q0FJSgYc0arvm+JetuUfXphfOFSZyCY2YL2+ia+6YOj6/dn5P0ga8bJiHSwbxyGTamzcnfexkOiZvwYAToRricFnGyNUerf2HmufJSIiNXL2KsIwBKoSxP9J63eJBeI1EDTxT2rlHk1YxKQTLcroUmD1DTcS8x4J3ehe6yNEmEE1Sh0rbbn+Xrnv0LKjNQgQh0SFRX84FaM47nXbXZRUrirmInSptg4O6tuneWJLMAKWbWOoZWBiUVteVNw14UqYg8By9EqNRyO77ASOD06ZxkZDqplvUd0eQbVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiIaM187TRCxqeo1kPMjwQeuuwvWBXXGXPGVEBLaDsE=;
 b=SKJ0tS7CSKPs4z7Mqm+kp1lOfwQ4Y1jqdmCMTHFoM+CKwqNFYdu4m9bBJ7xz5VTCVV8F3/6FLgDmncrGR2n75Gd+HtvKryG+LlbuW8tNg7sJhu15fHQof2LcfuRN/4+SEhMNUC9eErGUUgQAUQIZUBjCpVCeK63e9NvVgqjqwYsW8Tv//Qj5gpiCM2DXv5APhYiUGix7i9cOCMMWR0Zn60ZTkoKcVn9sAbnQOs1ruvEmra8g/gOe0t2hW4mIP0jh6kkkXUAg6NfQpQEBo8MukTEK3JsrEYsNa0/ClRQv1sin+v7iPR6Lu2F992r4JEXo4ZMz/BUVns73PiXE1D2FIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiIaM187TRCxqeo1kPMjwQeuuwvWBXXGXPGVEBLaDsE=;
 b=Fmmk7VjW0ITJ+iS3oEzjaDGHGTaGTgT/YBYJIOVHyKqeL2HvXAr/JQYTRLTwRbguwXmgscSH0x1ePqL9tSmK31z7M6COd+Srmr+0CQfdtv69nxfCEc1pu2ahYbHjbqnr/co8K4j0fZsydAXAsrZ5lAy7yorYDXk2MUNs+GQ23jI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v3 5/5] xen/arm: ffa: Enable VM to VM without firmware
Thread-Topic: [PATCH v3 5/5] xen/arm: ffa: Enable VM to VM without firmware
Thread-Index: AQHbnJ1P36ESPN6dS0aOqSpHOpyt2LOCGzMAgAAmwwA=
Date: Mon, 24 Mar 2025 13:06:56 +0000
Message-ID: <0873A9B9-8B31-4F02-A926-A832FE0F50B7@arm.com>
References: <cover.1742570590.git.bertrand.marquis@arm.com>
 <f3886649f23845932dd322eb45ad8f980e53ded1.1742570590.git.bertrand.marquis@arm.com>
 <CAHUa44GPniTZxtaUU3WeL_oU+oGYoz0nTBA=1QaE0Py=+bZQ8A@mail.gmail.com>
In-Reply-To:
 <CAHUa44GPniTZxtaUU3WeL_oU+oGYoz0nTBA=1QaE0Py=+bZQ8A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB6351:EE_|AMS0EPF00000194:EE_|PAWPR08MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: aa049fc3-9eaa-483f-6b92-08dd6ad4c722
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N2Q5aUx6cTBkQ2p3UElIbjgxZG1qUHZwQVlIOElpWmRaMXJ1Mms5Mi9Iclg4?=
 =?utf-8?B?M2FNNXQ3OHZZQlJxeU1PSzlrbHhUZVNNQ2JQakhWTWN1NEpnVkJ1NCthZVAz?=
 =?utf-8?B?TnV1c3R5eDl3S1ZPVmM3TzR3VWUxbW9uNlpSSWhKbDFEWVZIdmJIaTZVcjEr?=
 =?utf-8?B?VGRsbWZnazdYcDBLYnVIc3lmNnlFQ2kvWWVUVWVVSFNwaVJ5ZDJIME5odVVK?=
 =?utf-8?B?WjVUajJxdzduN1d6aGNBNDc4QkJuSkUvS2FxUGtqN1lyU1EwRWRQcTQ2ckVL?=
 =?utf-8?B?QlNhejJCcTZ1ZXNoUExsQWh2M0x2bUpLVnZxbmhUbEE3ZnBFcHZtRlNMdWV6?=
 =?utf-8?B?Z0tLNHE4N3J2bmJBVDhVS1NTTlFWNThFVkFuNzRrVzNpb3kyb3lDaXFKT0pR?=
 =?utf-8?B?SUI4WFJ2WHhmOGkwRGlvRit5UWlJN1BqWnMrOUYvUUUrY1RBODdJaG5yL1Qv?=
 =?utf-8?B?eUNyNU9BcnY4VU5Xc29wdnlicG1wZEpzY1ZzZmt3WDhuVVZ1cGdCYTgyaE84?=
 =?utf-8?B?V2JYSkRTa2todHFDeUxEd0JRUEdyazlMUkN4ZG9IckRaWXNJMHdaTzdpbFZP?=
 =?utf-8?B?alc0LytPRmR2cmVCMnVYRHIyLzJaM1d6ZjZkbjJBWXhaWktDMG0yOTc4QTJL?=
 =?utf-8?B?OU9nOWR5dnFRNVJQU3JlcUk2d1VEbmttN2hmSGpmUnRxQktlMjJkaEZydVVH?=
 =?utf-8?B?K3hxbFA0TjdCc1RnR2pHWGRMZWEwczExREdBTjNqaVZKVnMxMnBoM2xRaHBG?=
 =?utf-8?B?NEZUcXBMY0ZCSnp4dlhJOEpzWXlTSjFmQnJJek5mZU1KU2cwQkRybGtRNjBo?=
 =?utf-8?B?OEpWQnJ1cGVEa2RzaHUwaUFvNzluZXc3V1laZmhxREpEbUhPazg3MGs1L1Ni?=
 =?utf-8?B?VUNBSWYxNHhEVEpONGp0a0JVcG5lVEZFaXRma3BHd3QybnBnR1d0VDZOSVdY?=
 =?utf-8?B?WW9oY25jWDhLUUxzOGhwQTFRZFUxVTBkS2FIQm5aK3BpRzhDcFhYWjkzTTBn?=
 =?utf-8?B?eHI0RlMzaHBEbUpFVnBpM05WTnhBUEU2TTJpSlFtVDhuQlA0Yjl2Z1p6L1kr?=
 =?utf-8?B?WnlRbmpaRC9qQ2FaTHZoVm01aDFpN242bVllakU2alhpeUxjcUVqQ1VnUEUw?=
 =?utf-8?B?WUN3RUdqNmVMMU95eUQwczhLcjY3ek44NVYvWlhIUHRNdUJTNXZ3RHp5anh0?=
 =?utf-8?B?UmZ6dnBTekJORVdvem1GUUhJbS9vUGh3dVpzWWRYS2lxWERUblFyZDFqZ0Yy?=
 =?utf-8?B?TXF0V2tBSmdCb1ZuNmZGd0RadE5jd3VUN2FteFJKb2R0NEVDcWVLaDV0WlAw?=
 =?utf-8?B?MDNpVW9VU0wyYnVNU3pFZWwxVVRwaWN1VThVVlRsbEtVWDUvaTh2emlRMXFV?=
 =?utf-8?B?cTcxbStSbEw0cEZVZWVwU3ZNRk92aDVMZjhBemJZVVdwTjZsZHVVQlFOTEs1?=
 =?utf-8?B?K0ExUlQzL3JuUTB5K1o3YmM1dllvK0MvNEwzcjhIREVRR2M2cHo4c3hIam9G?=
 =?utf-8?B?SUhLYU1oK3M5QWExODZrRFZVNUVUK01pdC9oYi9DdlBubjZmOFlPTi91dU5a?=
 =?utf-8?B?bzF6Y25oNDdYSGR5TWVucXFYcGxTcEYrMzRuNXRpM090ckJ2ejhuOHpTTE5T?=
 =?utf-8?B?UW0yVG9jMFZiL1lLWWhXbWZqeFFvaVVMRjd3VUowd3pzQTEyVnVsMG4vYnZN?=
 =?utf-8?B?Znk2T1lObldKSmREdFpzK3NwL1NFMTZRbVZyVkUvOU5YcGZSU09GMWVKbC8z?=
 =?utf-8?B?RDVQcXJTb3Q0WTBncTFqZTF0S2YrT1VGRmlNdkw3S2FwMlNNd1RKa1N1OGVq?=
 =?utf-8?B?bGthVExSMEMxajRBNFBMRFJ3NVhoVy85UGtMOE9BTXplZHhPUURmN2E4VlJE?=
 =?utf-8?B?Z0lBNy8rYTlVYkJ4d2ltRlkzWG9zL203bFY1bUFIeHMycmtPd20zRnVJL3RM?=
 =?utf-8?Q?X9+ly2CiDqq++9nsn5/A+vPsCjcMJrt6?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A7E6C85BBE0D74184B56C32E3E915E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6351
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a55a5333-b73d-4863-9fe8-08dd6ad4c136
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0NhelJtWVlyTGhhdXZxeTNyY3l2dE92ZG9iYU5sREUvMW12cy85R0hZMDR4?=
 =?utf-8?B?cGFoMlBIK3QzVEtGTHFVaERtSkRsU3hVd0l3K1dGUUFZeGZROUFFZ1NWUFoy?=
 =?utf-8?B?bGdTMHUwWkdvMjBFNWs3TUdzS091VmEvSER2NjBwbFhvUVgyK0IvMmEzdXdz?=
 =?utf-8?B?RE4wcG16R0UzZ3lwWitZait5RFRKWWFOOGc4YUo2U0l4YWRPdCtkSEpiRHl2?=
 =?utf-8?B?UTEraHFOK3hkcVRVcHIyNWFEdFlUdUFKSE1xN0xjV25nQ1MyWmFFLzJSZzNL?=
 =?utf-8?B?eGR6N1hRWDZ3OUVzc1lFbVVuMkxYR2IxSGp3ZitmUUo1RHMvTVNGeEo4bW5h?=
 =?utf-8?B?Z2VONmZqWE9OSDZFNzBEZG5PMHU3NC9XbnpEQ2lwRlk0Tm0yV2lwVHdFTDJS?=
 =?utf-8?B?dTZraVVMZDF0bEV4VlNIYTFORURqRUlVSGxDZHFKVDVjRUQ3Y2VlWFltTXVM?=
 =?utf-8?B?VnlLM05HTXh3cWxRZnVrZGN1anU1ZHBuUTdBNVpzczVMdDlxSnJIejdNWnhY?=
 =?utf-8?B?bWdCTFI5bERxNEc0cHJ6Y1RySzZlcmZ3Q1FLNGdLSEN5Rm42UjVsMzNkQXF0?=
 =?utf-8?B?NHhWQk5QOWJOYUgwc1VvVFdvSzRzV3dsUU1nS3lSM1B4MnhQcWlZa1NwczlN?=
 =?utf-8?B?Vmw2azNaQllEZE9uenRzUGk0QVNVNllnamlmK3owcnNmdWJESVkzMlorTGRq?=
 =?utf-8?B?R3RSWEYwVWlPQW1yN01tTVFDMTZOVnlZVWs5UUMvRitGajJyK2hWSXZQVkti?=
 =?utf-8?B?aFNTNEd6ZExnNW1GSitLdjFTV2dLdzRkVTMzRm1ISWhnWmlrd3JTU0JsRkdU?=
 =?utf-8?B?cFlXUFdaSEY1M0xWcGtJTjd4TnpEYk41N0tyTWdvSUU5b3M4bjRZQUVNSTBS?=
 =?utf-8?B?MzJONHVOVEdmSUNDWWRjV2hacnJ3OHRoUC9VNTdxSWJLOVpHZzMvUEJSUXA1?=
 =?utf-8?B?b3JWZkJQWG5Fb3JoN0ZrZWo1U1FLZWI0ei9xZ1M4MEErZy94S3NqUE56OThk?=
 =?utf-8?B?L3JtMTBjTWxoUTF0ZXBNU1RkME96ZnlsWDZuaUdjMGdycy9nTWtqa21Pc2lK?=
 =?utf-8?B?M2x1bnBBcU5zbnc1NTBpVVJhRDE3S2RGMWgrTU9FblpXaUdJajBoejJCQlY4?=
 =?utf-8?B?ZWU5YnR1YUdEUG02bXByWjIwUndaeWlOZTZhY091b0dicVIrTDY4Q053S2Vy?=
 =?utf-8?B?NlMzVUJQY3REU1czZkFKMU8xSnZ3VjJRVVlmMUlMVlR6dENGTnc4cVlkR1c2?=
 =?utf-8?B?eFNJRlcwYTlnQ3J1V09OWnZIYmdETzF3dDdNaHVocWpNaGh0cmRvdWEwMGFo?=
 =?utf-8?B?MXFXQkNPNnVRdm0wQVh4VHQ2RW1uZU5QcTJ2bnJ3ejJHZ1cwOGVQaExodHVq?=
 =?utf-8?B?OHZmUHdIYVptS3E3RGd5TkFhM29tcHVqRXN3c3BTVnJiUWpiVU56Y1YyTzB1?=
 =?utf-8?B?Z0xWb2Z6M2NJbURZNXhhYkpsWWcvYTJpeXNNUXl3TEJiR2JkUXdNYVh0NTJ3?=
 =?utf-8?B?S21oTGpQalNoS1N3NGVPcVc1MVFDUGpsdEdIdjRiZitTOUdQcGp3SUJqOFZn?=
 =?utf-8?B?L29JRHFGWmdQdy9oNmJiUTBob1lvdDFUc0xNRWhTdE52Nk9yYkh4TEdRaHUx?=
 =?utf-8?B?RzFucEIvUDBKLzYrWTdJTTVpRDRUZmlRTGw2MzFialVHbGRHMGUwTlZBVE5H?=
 =?utf-8?B?YjhCb0lMbFZKcDJveWJWd1NaT1ZJM1Bad0w1NWt5S1dMN3ZuSmljdkxpVEZ4?=
 =?utf-8?B?S3NqUmMwcUw2MU5ZempQcVZNK3U3Q0RnQldRUy83aEhvbWJONllwd25CWGov?=
 =?utf-8?B?TDVxVFNnRGkxQlVuNjBsVXZ1UnJxNjdzTEYvdTB1QjlCM1pSdWhCbEVMUHQ3?=
 =?utf-8?B?bHEwYUhhMTBGci8zWnlVY2huZzlUWG5JTmNXbHhaUEQyTnJHWSttc3l1M2RD?=
 =?utf-8?B?a3Y2SFBxZmd5NmpmaW9FS1lMQktQSWgvZTd1UVdwS2dxTDFNMjRJb2FxdnQ2?=
 =?utf-8?Q?UhvC4bmymKJPlrRRAsfBlFRS7hUUEA=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 13:07:06.2386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa049fc3-9eaa-483f-6b92-08dd6ad4c722
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9638

SGkgSmVucywNCg0KPiBPbiAyNCBNYXIgMjAyNSwgYXQgMTE6NDgsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgMTA6MTXigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBXaGVuIFZNIHRvIFZN
IHN1cHBvcnQgaXMgYWN0aXZhdGVkIGFuZCB0aGVyZSBpcyBubyBzdWl0YWJsZSBGRi1BIHN1cHBv
cnQNCj4+IGluIHRoZSBmaXJtd2FyZSwgZW5hYmxlIEZGLUEgc3VwcG9ydCBmb3IgVk1zIHRvIGFs
bG93IHVzaW5nIGl0IGZvciBWTSB0bw0KPj4gVk0gY29tbXVuaWNhdGlvbnMuDQo+PiBJZiB0aGVy
ZSBpcyBPUC1URUUgcnVubmluZyBpbiB0aGUgc2VjdXJlIHdvcmxkIGFuZCB1c2luZyB0aGUgbm9u
IEZGLUENCj4+IGNvbW11bmljYXRpb24gc3lzdGVtLCBoYXZpbmcgQ09ORklHX0ZGQV9WTV9UT19W
TSBjb3VsZCBiZSBub24gZnVuY3Rpb25hbA0KPj4gKGlmIG9wdGVlIGlzIHByb2JlZCBmaXJzdCkg
b3IgT3B0ZWUgY291bGQgYmUgbm9uIGZ1bmN0aW9uYWwgKGlmIEZGLUEgaXMNCj4gDQo+IFByZWZl
ciBPUC1URUUNCg0KUmlnaHQgaSBmaXhlZCB0aGUgZmlyc3QgaW5zdGFuY2UgYnV0IG5vdCB0aGUg
c2Vjb25kIG9uZS4NCldpbGwgZml4IGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCj4gDQo+PiBwcm9i
ZWQgZmlyc3QpIHNvIGl0IGlzIG5vdCByZWNvbW1lbmRlZCB0byBhY3RpdmF0ZSB0aGUgY29uZmln
dXJhdGlvbg0KPj4gb3B0aW9uIGZvciBzdWNoIHN5c3RlbXMuDQo+PiANCj4+IFRvIG1ha2UgYnVm
ZmVyIGZ1bGwgbm90aWZpY2F0aW9uIHdvcmsgYmV0d2VlbiBWTXMgd2hlbiB0aGVyZSBpcyBubw0K
Pj4gZmlybXdhcmUsIHJld29yayB0aGUgbm90aWZpY2F0aW9uIGhhbmRsaW5nIGFuZCBtb2RpZnkg
dGhlIGdsb2JhbCBmbGFnIHRvDQo+PiBvbmx5IGJlIHVzZWQgYXMgY2hlY2sgZm9yIGZpcm13YXJl
IG5vdGlmaWNhdGlvbiBzdXBwb3J0IGluc3RlYWQuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEJl
cnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gQ2hh
bmdlcyBpbiB2MzoNCj4+IC0gZml4IHR5cG9zIGluIGNvbW1pdCBtZXNzYWdlDQo+PiAtIGFkZCBz
cGFjZXMgYXJvdW5kIDw8DQo+PiAtIG1vdmUgbm90aWZpY2F0aW9uIGlkIGZpeCBiYWNrIGludG8g
YnVmZmVyIGZ1bGwgcGF0Y2gNCj4+IC0gZml4IHwgcG9zaXRpb24gaW4gaWYNCj4+IENoYW5nZXMg
aW4gdjI6DQo+PiAtIHJlcGxhY2UgaWZkZWYgd2l0aCBJU19FTkFCTEVEIHdoZW4gcG9zc2libGUN
Cj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmEuYyAgICAgICB8ICAxMiArKystDQo+PiB4
ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jIHwgMTA0ICsrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tDQo+PiAyIGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDU3IGRl
bGV0aW9ucygtKQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xh
bmRlckBsaW5hcm8ub3JnPg0KDQpUaGFua3MNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4g
SmVucw0KPiANCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMgYi94
ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiBpbmRleCBlNDFhYjVmOGFkYTYuLjA2Mjc2MjVlZmU2
MCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS90ZWUvZmZhLmMNCj4+IEBAIC0zMjQsOCArMzI0LDkgQEAgc3RhdGljIGludCBmZmFf
ZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4
Ow0KPj4gICAgIGludCByZXQ7DQo+PiANCj4+IC0gICAgaWYgKCAhZmZhX2Z3X3ZlcnNpb24gKQ0K
Pj4gKyAgICBpZiAoICFJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICYmICFmZmFfZndf
dmVyc2lvbiApDQo+PiAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPj4gKw0KPj4gICAgIC8qDQo+
PiAgICAgICogV2UgYXJlIHVzaW5nIHRoZSBkb21haW5faWQgKyAxIGFzIHRoZSBGRi1BIElEIGZv
ciBWTXMgYXMgRkYtQSBJRCAwIGlzDQo+PiAgICAgICogcmVzZXJ2ZWQgZm9yIHRoZSBoeXBlcnZp
c29yIGFuZCB3ZSBvbmx5IHN1cHBvcnQgc2VjdXJlIGVuZHBvaW50cyB1c2luZw0KPj4gQEAgLTU2
MSw2ICs1NjIsMTUgQEAgZXJyX25vX2Z3Og0KPj4gICAgIGJpdG1hcF96ZXJvKGZmYV9md19hYmlf
c3VwcG9ydGVkLCBGRkFfQUJJX0JJVE1BUF9TSVpFKTsNCj4+ICAgICBwcmludGsoWEVOTE9HX1dB
Uk5JTkcgIkFSTSBGRi1BIE5vIGZpcm13YXJlIHN1cHBvcnRcbiIpOw0KPj4gDQo+PiArICAgIGlm
ICggSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSApDQo+PiArICAgIHsNCj4+ICsgICAg
ICAgIElOSVRfTElTVF9IRUFEKCZmZmFfdGVhcmRvd25faGVhZCk7DQo+PiArICAgICAgICBpbml0
X3RpbWVyKCZmZmFfdGVhcmRvd25fdGltZXIsIGZmYV90ZWFyZG93bl90aW1lcl9jYWxsYmFjaywg
TlVMTCwgMCk7DQo+PiArDQo+PiArICAgICAgICBwcmludGsoWEVOTE9HX0lORk8gIkFSTSBGRi1B
IG9ubHkgYXZhaWxhYmxlIGJldHdlZW4gVk1zXG4iKTsNCj4+ICsgICAgICAgIHJldHVybiB0cnVl
Ow0KPj4gKyAgICB9DQo+PiArDQo+PiAgICAgcmV0dXJuIGZhbHNlOw0KPj4gfQ0KPj4gDQo+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfbm90aWYuYyBiL3hlbi9hcmNoL2FybS90
ZWUvZmZhX25vdGlmLmMNCj4+IGluZGV4IGY2ZGYyZjE1YmIwMC4uODZiZWY2YjNiMmFiIDEwMDY0
NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfbm90aWYuYw0KPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL3RlZS9mZmFfbm90aWYuYw0KPj4gQEAgLTE2LDcgKzE2LDcgQEANCj4+IA0KPj4gI2lu
Y2x1ZGUgImZmYV9wcml2YXRlLmgiDQo+PiANCj4+IC1zdGF0aWMgYm9vbCBfX3JvX2FmdGVyX2lu
aXQgbm90aWZfZW5hYmxlZDsNCj4+ICtzdGF0aWMgYm9vbCBfX3JvX2FmdGVyX2luaXQgZndfbm90
aWZfZW5hYmxlZDsNCj4+IHN0YXRpYyB1bnNpZ25lZCBpbnQgX19yb19hZnRlcl9pbml0IG5vdGlm
X3NyaV9pcnE7DQo+PiANCj4+IGludCBmZmFfaGFuZGxlX25vdGlmaWNhdGlvbl9iaW5kKHN0cnVj
dCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gQEAgLTI3LDIxICsyNywxNyBAQCBpbnQgZmZhX2hh
bmRsZV9ub3RpZmljYXRpb25fYmluZChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAg
ICB1aW50MzJfdCBiaXRtYXBfbG8gPSBnZXRfdXNlcl9yZWcocmVncywgMyk7DQo+PiAgICAgdWlu
dDMyX3QgYml0bWFwX2hpID0gZ2V0X3VzZXJfcmVnKHJlZ3MsIDQpOw0KPj4gDQo+PiAtICAgIGlm
ICggIW5vdGlmX2VuYWJsZWQgKQ0KPj4gLSAgICAgICAgcmV0dXJuIEZGQV9SRVRfTk9UX1NVUFBP
UlRFRDsNCj4+IC0NCj4+ICAgICBpZiAoIChzcmNfZHN0ICYgMHhGRkZGVSkgIT0gZmZhX2dldF92
bV9pZChkKSApDQo+PiAgICAgICAgIHJldHVybiBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVSUzsN
Cj4+IA0KPj4gICAgIGlmICggZmxhZ3MgKSAgICAvKiBPbmx5IGdsb2JhbCBub3RpZmljYXRpb25z
IGFyZSBzdXBwb3J0ZWQgKi8NCj4+ICAgICAgICAgcmV0dXJuIEZGQV9SRVRfREVOSUVEOw0KPj4g
DQo+PiAtICAgIC8qDQo+PiAtICAgICAqIFdlIG9ubHkgc3VwcG9ydCBub3RpZmljYXRpb25zIGZy
b20gU1Agc28gbm8gbmVlZCB0byBjaGVjayB0aGUgc2VuZGVyDQo+PiAtICAgICAqIGVuZHBvaW50
IElELCB0aGUgU1BNQyB3aWxsIHRha2UgY2FyZSBvZiB0aGF0IGZvciB1cy4NCj4+IC0gICAgICov
DQo+PiAtICAgIHJldHVybiBmZmFfc2ltcGxlX2NhbGwoRkZBX05PVElGSUNBVElPTl9CSU5ELCBz
cmNfZHN0LCBmbGFncywgYml0bWFwX2xvLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJpdG1hcF9oaSk7DQo+PiArICAgIGlmICggRkZBX0lEX0lTX1NFQ1VSRShzcmNfZHN0ID4+IDE2
KSAmJiBmd19ub3RpZl9lbmFibGVkICkNCj4+ICsgICAgICAgIHJldHVybiBmZmFfc2ltcGxlX2Nh
bGwoRkZBX05PVElGSUNBVElPTl9CSU5ELCBzcmNfZHN0LCBmbGFncywNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYml0bWFwX2xvLCBiaXRtYXBfaGkpOw0KPj4gKw0KPj4gKyAg
ICByZXR1cm4gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4gfQ0KPj4gDQo+PiBpbnQgZmZhX2hh
bmRsZV9ub3RpZmljYXRpb25fdW5iaW5kKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4g
QEAgLTUxLDE4ICs0NywxNCBAQCBpbnQgZmZhX2hhbmRsZV9ub3RpZmljYXRpb25fdW5iaW5kKHN0
cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgIHVpbnQzMl90IGJpdG1hcF9sbyA9IGdl
dF91c2VyX3JlZyhyZWdzLCAzKTsNCj4+ICAgICB1aW50MzJfdCBiaXRtYXBfaGkgPSBnZXRfdXNl
cl9yZWcocmVncywgNCk7DQo+PiANCj4+IC0gICAgaWYgKCAhbm90aWZfZW5hYmxlZCApDQo+PiAt
ICAgICAgICByZXR1cm4gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4gLQ0KPj4gICAgIGlmICgg
KHNyY19kc3QgJiAweEZGRkZVKSAhPSBmZmFfZ2V0X3ZtX2lkKGQpICkNCj4+ICAgICAgICAgcmV0
dXJuIEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0KPj4gDQo+PiAtICAgIC8qDQo+PiAtICAg
ICAqIFdlIG9ubHkgc3VwcG9ydCBub3RpZmljYXRpb25zIGZyb20gU1Agc28gbm8gbmVlZCB0byBj
aGVjayB0aGUNCj4+IC0gICAgICogZGVzdGluYXRpb24gZW5kcG9pbnQgSUQsIHRoZSBTUE1DIHdp
bGwgdGFrZSBjYXJlIG9mIHRoYXQgZm9yIHVzLg0KPj4gLSAgICAgKi8NCj4+IC0gICAgcmV0dXJu
ICBmZmFfc2ltcGxlX2NhbGwoRkZBX05PVElGSUNBVElPTl9VTkJJTkQsIHNyY19kc3QsIDAsIGJp
dG1hcF9sbywNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgYml0bWFwX2hpKTsNCj4+
ICsgICAgaWYgKCBGRkFfSURfSVNfU0VDVVJFKHNyY19kc3QgPj4gMTYpICYmIGZ3X25vdGlmX2Vu
YWJsZWQgKQ0KPj4gKyAgICAgICAgcmV0dXJuICBmZmFfc2ltcGxlX2NhbGwoRkZBX05PVElGSUNB
VElPTl9VTkJJTkQsIHNyY19kc3QsIDAsIGJpdG1hcF9sbywNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJpdG1hcF9oaSk7DQo+PiArDQo+PiArICAgIHJldHVybiBGRkFfUkVU
X05PVF9TVVBQT1JURUQ7DQo+PiB9DQo+PiANCj4+IHZvaWQgZmZhX2hhbmRsZV9ub3RpZmljYXRp
b25faW5mb19nZXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiBAQCAtNzEsNyArNjMs
NyBAQCB2b2lkIGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX2luZm9fZ2V0KHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzKQ0KPj4gICAgIHN0cnVjdCBmZmFfY3R4ICpjdHggPSBkLT5hcmNoLnRlZTsN
Cj4+ICAgICBib29sIG5vdGlmX3BlbmRpbmc7DQo+PiANCj4+IC0gICAgaWYgKCAhbm90aWZfZW5h
YmxlZCApDQo+PiArICAgIGlmICggIUlTX0VOQUJMRUQoQ09ORklHX0ZGQV9WTV9UT19WTSkgJiYg
IWZ3X25vdGlmX2VuYWJsZWQgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgZmZhX3NldF9yZWdzX2Vy
cm9yKHJlZ3MsIEZGQV9SRVRfTk9UX1NVUFBPUlRFRCk7DQo+PiAgICAgICAgIHJldHVybjsNCj4+
IEBAIC0xMDgsNyArMTAwLDcgQEAgdm9pZCBmZmFfaGFuZGxlX25vdGlmaWNhdGlvbl9nZXQoc3Ry
dWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgdWludDMyX3QgdzYgPSAwOw0KPj4gICAg
IHVpbnQzMl90IHc3ID0gMDsNCj4+IA0KPj4gLSAgICBpZiAoICFub3RpZl9lbmFibGVkICkNCj4+
ICsgICAgaWYgKCAhSVNfRU5BQkxFRChDT05GSUdfRkZBX1ZNX1RPX1ZNKSAmJiAhZndfbm90aWZf
ZW5hYmxlZCApDQo+PiAgICAgew0KPj4gICAgICAgICBmZmFfc2V0X3JlZ3NfZXJyb3IocmVncywg
RkZBX1JFVF9OT1RfU1VQUE9SVEVEKTsNCj4+ICAgICAgICAgcmV0dXJuOw0KPj4gQEAgLTEyMCw3
ICsxMTIsOCBAQCB2b2lkIGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX2dldChzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyAqcmVncykNCj4+ICAgICAgICAgcmV0dXJuOw0KPj4gICAgIH0NCj4+IA0KPj4gLSAg
ICBpZiAoIGZsYWdzICYgKCBGRkFfTk9USUZfRkxBR19CSVRNQVBfU1AgfCBGRkFfTk9USUZfRkxB
R19CSVRNQVBfU1BNICkgKQ0KPj4gKyAgICBpZiAoIGZ3X25vdGlmX2VuYWJsZWQgJiYgKGZsYWdz
ICYgKCBGRkFfTk9USUZfRkxBR19CSVRNQVBfU1AgfA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBGRkFfTk9USUZfRkxBR19CSVRNQVBfU1BNICkpICkNCj4+ICAg
ICB7DQo+PiAgICAgICAgIHN0cnVjdCBhcm1fc21jY2NfMV8yX3JlZ3MgYXJnID0gew0KPj4gICAg
ICAgICAgICAgLmEwID0gRkZBX05PVElGSUNBVElPTl9HRVQsDQo+PiBAQCAtMTc3LDE1ICsxNzAs
MTQgQEAgaW50IGZmYV9oYW5kbGVfbm90aWZpY2F0aW9uX3NldChzdHJ1Y3QgY3B1X3VzZXJfcmVn
cyAqcmVncykNCj4+ICAgICB1aW50MzJfdCBiaXRtYXBfbG8gPSBnZXRfdXNlcl9yZWcocmVncywg
Myk7DQo+PiAgICAgdWludDMyX3QgYml0bWFwX2hpID0gZ2V0X3VzZXJfcmVnKHJlZ3MsIDQpOw0K
Pj4gDQo+PiAtICAgIGlmICggIW5vdGlmX2VuYWJsZWQgKQ0KPj4gLSAgICAgICAgcmV0dXJuIEZG
QV9SRVRfTk9UX1NVUFBPUlRFRDsNCj4+IC0NCj4+ICAgICBpZiAoIChzcmNfZHN0ID4+IDE2KSAh
PSBmZmFfZ2V0X3ZtX2lkKGQpICkNCj4+ICAgICAgICAgcmV0dXJuIEZGQV9SRVRfSU5WQUxJRF9Q
QVJBTUVURVJTOw0KPj4gDQo+PiAtICAgIC8qIExldCB0aGUgU1BNQyBjaGVjayB0aGUgZGVzdGlu
YXRpb24gb2YgdGhlIG5vdGlmaWNhdGlvbiAqLw0KPj4gLSAgICByZXR1cm4gZmZhX3NpbXBsZV9j
YWxsKEZGQV9OT1RJRklDQVRJT05fU0VULCBzcmNfZHN0LCBmbGFncywgYml0bWFwX2xvLA0KPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgIGJpdG1hcF9oaSk7DQo+PiArICAgIGlmICggRkZB
X0lEX0lTX1NFQ1VSRShzcmNfZHN0ID4+IDE2KSAmJiBmd19ub3RpZl9lbmFibGVkICkNCj4+ICsg
ICAgICAgIHJldHVybiBmZmFfc2ltcGxlX2NhbGwoRkZBX05PVElGSUNBVElPTl9TRVQsIHNyY19k
c3QsIGZsYWdzLCBiaXRtYXBfbG8sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJpdG1hcF9oaSk7DQo+PiArDQo+PiArICAgIHJldHVybiBGRkFfUkVUX05PVF9TVVBQT1JURUQ7
DQo+PiB9DQo+PiANCj4+ICNpZmRlZiBDT05GSUdfRkZBX1ZNX1RPX1ZNDQo+PiBAQCAtMzcxLDcg
KzM2Myw3IEBAIHZvaWQgZmZhX25vdGlmX2luaXRfaW50ZXJydXB0KHZvaWQpDQo+PiB7DQo+PiAg
ICAgaW50IHJldDsNCj4+IA0KPj4gLSAgICBpZiAoIG5vdGlmX2VuYWJsZWQgJiYgbm90aWZfc3Jp
X2lycSA8IE5SX0dJQ19TR0kgKQ0KPj4gKyAgICBpZiAoIGZ3X25vdGlmX2VuYWJsZWQgJiYgbm90
aWZfc3JpX2lycSA8IE5SX0dJQ19TR0kgKQ0KPj4gICAgIHsNCj4+ICAgICAgICAgLyoNCj4+ICAg
ICAgICAgICogQW4gZXJyb3IgaGVyZSBpcyB1bmxpa2VseSBzaW5jZSB0aGUgcHJpbWFyeSBDUFUg
aGFzIGFscmVhZHkNCj4+IEBAIC00MDIsNDEgKzM5NCw0MSBAQCB2b2lkIGZmYV9ub3RpZl9pbml0
KHZvaWQpDQo+PiAgICAgaW50IHJldDsNCj4+IA0KPj4gICAgIC8qIE9ubHkgZW5hYmxlIGZ3IG5v
dGlmaWNhdGlvbiBpZiBhbGwgQUJJcyB3ZSBuZWVkIGFyZSBzdXBwb3J0ZWQgKi8NCj4+IC0gICAg
aWYgKCAhKGZmYV9md19zdXBwb3J0c19maWQoRkZBX05PVElGSUNBVElPTl9CSVRNQVBfQ1JFQVRF
KSAmJg0KPj4gLSAgICAgICAgICAgZmZhX2Z3X3N1cHBvcnRzX2ZpZChGRkFfTk9USUZJQ0FUSU9O
X0JJVE1BUF9ERVNUUk9ZKSAmJg0KPj4gLSAgICAgICAgICAgZmZhX2Z3X3N1cHBvcnRzX2ZpZChG
RkFfTk9USUZJQ0FUSU9OX0dFVCkgJiYNCj4+IC0gICAgICAgICAgIGZmYV9md19zdXBwb3J0c19m
aWQoRkZBX05PVElGSUNBVElPTl9JTkZPX0dFVF82NCkpICkNCj4+IC0gICAgICAgIHJldHVybjsN
Cj4+IC0NCj4+IC0gICAgYXJtX3NtY2NjXzFfMl9zbWMoJmFyZywgJnJlc3ApOw0KPj4gLSAgICBp
ZiAoIHJlc3AuYTAgIT0gRkZBX1NVQ0NFU1NfMzIgKQ0KPj4gLSAgICAgICAgcmV0dXJuOw0KPj4g
LQ0KPj4gLSAgICBpcnEgPSByZXNwLmEyOw0KPj4gLSAgICBub3RpZl9zcmlfaXJxID0gaXJxOw0K
Pj4gLSAgICBpZiAoIGlycSA+PSBOUl9HSUNfU0dJICkNCj4+IC0gICAgICAgIGlycV9zZXRfdHlw
ZShpcnEsIElSUV9UWVBFX0VER0VfUklTSU5HKTsNCj4+IC0gICAgcmV0ID0gcmVxdWVzdF9pcnEo
aXJxLCAwLCBub3RpZl9pcnFfaGFuZGxlciwgIkZGLUEgbm90aWYiLCBOVUxMKTsNCj4+IC0gICAg
aWYgKCByZXQgKQ0KPj4gKyAgICBpZiAoIGZmYV9md19zdXBwb3J0c19maWQoRkZBX05PVElGSUNB
VElPTl9CSVRNQVBfQ1JFQVRFKSAmJg0KPj4gKyAgICAgICAgIGZmYV9md19zdXBwb3J0c19maWQo
RkZBX05PVElGSUNBVElPTl9CSVRNQVBfREVTVFJPWSkgJiYNCj4+ICsgICAgICAgICBmZmFfZndf
c3VwcG9ydHNfZmlkKEZGQV9OT1RJRklDQVRJT05fR0VUKSAmJg0KPj4gKyAgICAgICAgIGZmYV9m
d19zdXBwb3J0c19maWQoRkZBX05PVElGSUNBVElPTl9JTkZPX0dFVF82NCkgKQ0KPj4gICAgIHsN
Cj4+IC0gICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJmZmE6IHJlcXVlc3RfaXJxIGlycSAldSBm
YWlsZWQ6IGVycm9yICVkXG4iLA0KPj4gLSAgICAgICAgICAgICAgIGlycSwgcmV0KTsNCj4+IC0g
ICAgICAgIHJldHVybjsNCj4+IC0gICAgfQ0KPj4gKyAgICAgICAgYXJtX3NtY2NjXzFfMl9zbWMo
JmFyZywgJnJlc3ApOw0KPj4gKyAgICAgICAgaWYgKCByZXNwLmEwICE9IEZGQV9TVUNDRVNTXzMy
ICkNCj4+ICsgICAgICAgICAgICByZXR1cm47DQo+PiANCj4+IC0gICAgbm90aWZfZW5hYmxlZCA9
IHRydWU7DQo+PiArICAgICAgICBpcnEgPSByZXNwLmEyOw0KPj4gKyAgICAgICAgbm90aWZfc3Jp
X2lycSA9IGlycTsNCj4+ICsgICAgICAgIGlmICggaXJxID49IE5SX0dJQ19TR0kgKQ0KPj4gKyAg
ICAgICAgICAgIGlycV9zZXRfdHlwZShpcnEsIElSUV9UWVBFX0VER0VfUklTSU5HKTsNCj4+ICsg
ICAgICAgIHJldCA9IHJlcXVlc3RfaXJxKGlycSwgMCwgbm90aWZfaXJxX2hhbmRsZXIsICJGRi1B
IG5vdGlmIiwgTlVMTCk7DQo+PiArICAgICAgICBpZiAoIHJldCApDQo+PiArICAgICAgICB7DQo+
PiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgImZmYTogcmVxdWVzdF9pcnEgaXJxICV1
IGZhaWxlZDogZXJyb3IgJWRcbiIsDQo+PiArICAgICAgICAgICAgICAgICAgIGlycSwgcmV0KTsN
Cj4+ICsgICAgICAgICAgICByZXR1cm47DQo+PiArICAgICAgICB9DQo+PiArICAgICAgICBmd19u
b3RpZl9lbmFibGVkID0gdHJ1ZTsNCj4+ICsgICAgfQ0KPj4gfQ0KPj4gDQo+PiBpbnQgZmZhX25v
dGlmX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpDQo+PiB7DQo+PiAgICAgaW50MzJfdCBy
ZXM7DQo+PiANCj4+IC0gICAgaWYgKCAhbm90aWZfZW5hYmxlZCApDQo+PiAtICAgICAgICByZXR1
cm4gMDsNCj4+ICsgICAgaWYgKCBmd19ub3RpZl9lbmFibGVkICkNCj4+ICsgICAgew0KPj4gDQo+
PiAtICAgIHJlcyA9IGZmYV9ub3RpZmljYXRpb25fYml0bWFwX2NyZWF0ZShmZmFfZ2V0X3ZtX2lk
KGQpLCBkLT5tYXhfdmNwdXMpOw0KPj4gLSAgICBpZiAoIHJlcyApDQo+PiAtICAgICAgICByZXR1
cm4gLUVOT01FTTsNCj4+ICsgICAgICAgIHJlcyA9IGZmYV9ub3RpZmljYXRpb25fYml0bWFwX2Ny
ZWF0ZShmZmFfZ2V0X3ZtX2lkKGQpLCBkLT5tYXhfdmNwdXMpOw0KPj4gKyAgICAgICAgaWYgKCBy
ZXMgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPj4gKyAgICB9DQo+PiANCj4+
ICAgICByZXR1cm4gMDsNCj4+IH0NCj4+IEBAIC00NDcsNiArNDM5LDYgQEAgdm9pZCBmZmFfbm90
aWZfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkNCj4+ICAgICAgKiBDYWxsIGJpdG1h
cF9kZXN0cm95IGV2ZW4gaWYgYml0bWFwIGNyZWF0ZSBmYWlsZWQgYXMgdGhlIFNQTUMgd2lsbA0K
Pj4gICAgICAqIHJldHVybiBhIERFTklFRCBlcnJvciB0aGF0IHdlIHdpbGwgaWdub3JlLg0KPj4g
ICAgICAqLw0KPj4gLSAgICBpZiAoIG5vdGlmX2VuYWJsZWQgKQ0KPj4gKyAgICBpZiAoIGZ3X25v
dGlmX2VuYWJsZWQgKQ0KPj4gICAgICAgICBmZmFfbm90aWZpY2F0aW9uX2JpdG1hcF9kZXN0cm95
KGZmYV9nZXRfdm1faWQoZCkpOw0KPj4gfQ0KPj4gLS0NCj4+IDIuNDcuMQ0KDQoNCg==


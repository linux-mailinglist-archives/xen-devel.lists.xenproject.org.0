Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEFE9D0F9E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 12:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839280.1255099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCztV-00028c-9G; Mon, 18 Nov 2024 11:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839280.1255099; Mon, 18 Nov 2024 11:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCztV-000268-6I; Mon, 18 Nov 2024 11:26:13 +0000
Received: by outflank-mailman (input) for mailman id 839280;
 Mon, 18 Nov 2024 11:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91/F=SN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tCztT-00025j-Bz
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 11:26:11 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6feaea0-a59f-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 12:26:06 +0100 (CET)
Received: from AM0PR01CA0178.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::47) by VI1PR08MB5472.eurprd08.prod.outlook.com
 (2603:10a6:803:13b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 11:26:02 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:208:aa:cafe::51) by AM0PR01CA0178.outlook.office365.com
 (2603:10a6:208:aa::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20 via Frontend
 Transport; Mon, 18 Nov 2024 11:26:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 18 Nov 2024 11:26:01 +0000
Received: ("Tessian outbound bf1c175f6cbb:v490");
 Mon, 18 Nov 2024 11:26:01 +0000
Received: from L0eb1d3bf2105.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 51072EA2-A710-4309-8F7A-68270FD01695.1; 
 Mon, 18 Nov 2024 11:25:50 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0eb1d3bf2105.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 Nov 2024 11:25:50 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PR3PR08MB5660.eurprd08.prod.outlook.com (2603:10a6:102:8d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 11:25:45 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 11:25:45 +0000
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
X-Inumbo-ID: e6feaea0-a59f-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6YzIwMDo6NCIsImhlbG8iOiJEVVpQUjgzQ1UwMDEub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImU2ZmVhZWEwLWE1OWYtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTI5MTY3LjA0NjExMywic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=f+BwnxcQdtCl4lKapihpNdXwvx4drIqaQ+tIa3QQ++JJ21cklM9g26ec2xK1OsApPazEHcdY/TTbDmEqJ4hKO1QxODCb39NGpNl9R2CBTjiKiGTsDoGEWq35dPQy3N6KpHg1wSJAUz2kvlUEW1HbIgZNYo+VTMasyfJCsU+cRjDAaswSYcSg4Sr2LFPeSaW6ibb66Jg5bkRtiFXQrixrv0QjMNk3KyNaCaRVmXi1kvJZYZspPomheAE26wmapmIo6TOiyc8SkbP3o+USLsH95oMnf2A8baRG3s0dllALIBqhMBsTtNhh4Su6aaD0kf9Nwq/a2yyE0yr4QLqoe5WGzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X18TRJjfZG5ogE2E6zEhVsufJfPN/PtToNLWcwY45wE=;
 b=Y0hOnTG2TOFApIcuDptIC+F8WElGYYCK2/SLgu3l5RA+ccfm+/4Z3IAl3sofCFIA+yOfIHFtjdfJwteY5s1ji53rQ5NVMFwKicJ2dt4OBDiXtINJ0lBD+1dpAvRz1TiGyMv5dpsJCcW2WWqPLv9R49rvZQWCYECGkRjTrIB1IPhuYj0EEKz5GKkaUP2xHuGduYAGPIgk9sKyTmYMXIOgFCBl4rvew8y9FlhgKxWQcUuLYa58RUsurbQwOPUb+7v1U8n9jxLz25kBB4YLFlmtG6P8VCT2p0gNTuGSIL69BZCyv1jSxrBdadMtVtGYzhMKeanGUh7VMF1Ai69nFiN3EQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X18TRJjfZG5ogE2E6zEhVsufJfPN/PtToNLWcwY45wE=;
 b=aFdJJDN5ccMtHW4CZtlXiT9SC3dwh0x2DRr8bQsmrMUYYdiCQMp0K84ZuRltoa1wCWdZhmlHfFLRrBhrQPmbWs/a9aexOl5pEmpinFlhEQnCcl0mmbwGNJHzFQ+Je8+Da7SNLiy3VBxFleoozH5qhqmK/hrEAQXXLshpBz+EGE8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cfad5cff5e96ad9
X-TessianGatewayMetadata: EYgbhrQlY66eiAHHO5ctEF4adANZ64b9q0KSSe0hpxDarKp2VRTUfioV2BhcIPfiAtT+pOz8+ZDymFLmWkuql32Y7lL03Mv1//et+2bpBepRVidn7jxN6wcOe2EG2XqUsvxyYHKiTPkCemcW2gh2tsvqitQ5LHv9kPEikI07Jds=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ox8KailIkuevCr0joyh7I4vZZXlo7YC6hiO+s/hD7jNu3THL4M1pkh0g4zLv3OGuu3SCrJPDcv7FyvolLzp8ONjT++jsxtJpAQzw+wJGIRMal/f9adUSqp5ob0VQszYS/r7rOeWP/gmSQcZh5YY6+4OCzOsVak+DPT+OnWpwmWL9outsGxglg0bCJq8qyYMPzkqXW6NF917fvwys/msP7yxW93p9GcJfDSOzk+ya2nRVOkw706HBFdTM8MHr30IbiL3aLirAC54AIZ0ORRLwR9HR9I5H11N9efwlmeA6OWploZUXeQAzTFAPuA+lqhd+DeDlY4QmxgCDzWgdFrLe2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X18TRJjfZG5ogE2E6zEhVsufJfPN/PtToNLWcwY45wE=;
 b=LSApPBWvbCqCiZk3nKsS69hjkSLZpSt4oXFgdVfQv6DP50lXudVM+e9Dloq7nHxIci1Gvm1U43KTyKnZU0DryboNHU3lxRmb8bHCJ07xXVLlVTHX/8JAOdS7eW0cskDcybPo7On7otMP0XaxrpNKuAqwKezLxi6rzdWEWeGIXS4AXvknVXSZO83uRbd8JCgfdanTy7ugEKv2P9gJAYAO0RS/ipnQN1WGnOsEu88WNiZV4ZgMRUhcI5NofQtcg/8BOGlTgMKv93WA3xGSl1Cor05TfO5OeGfsVZUZC0lsBs5PPyjj7FVjou8v4Cw4lX00B/wX7slcHm5Tx6/yhNf6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X18TRJjfZG5ogE2E6zEhVsufJfPN/PtToNLWcwY45wE=;
 b=aFdJJDN5ccMtHW4CZtlXiT9SC3dwh0x2DRr8bQsmrMUYYdiCQMp0K84ZuRltoa1wCWdZhmlHfFLRrBhrQPmbWs/a9aexOl5pEmpinFlhEQnCcl0mmbwGNJHzFQ+Je8+Da7SNLiy3VBxFleoozH5qhqmK/hrEAQXXLshpBz+EGE8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 5/5] xen/arm: do not give memory back to static heap
Thread-Topic: [PATCH 5/5] xen/arm: do not give memory back to static heap
Thread-Index: AQHbN0xIcV74X7F5t0unnpAIyChkWLK7ylSAgAEgJgA=
Date: Mon, 18 Nov 2024 11:25:45 +0000
Message-ID: <D677C8EA-7A4C-4073-8434-6397089D9E63@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-6-luca.fancellu@arm.com>
 <857e4cd2-f8b2-41e0-bc66-96628bc48044@xen.org>
In-Reply-To: <857e4cd2-f8b2-41e0-bc66-96628bc48044@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PR3PR08MB5660:EE_|AM2PEPF0001C70D:EE_|VI1PR08MB5472:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a323bc-430e-40a4-d023-08dd07c3c881
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VFZEeFd2MDc1RDdlUGJuQUpvcFczOENWY01rY3ZmZGQyMUxoVm1DZHBBcnlk?=
 =?utf-8?B?cFc1WU56d2dYM0FBQW1HempRK3VSMklWd0gwVGdBQStzcVcrdXJoYkNDaFZ4?=
 =?utf-8?B?eDZxS21FdGczT21GYTd3blNDQ3RuT1RieXc4OTdNODNHODNvV1ZNY3BjVVJn?=
 =?utf-8?B?c2dUNWhsWGRIRHVIMi8zQ2FKU3NTS3d0N2ZLSjlCUkFDQjZGRDEvRkJBMnY4?=
 =?utf-8?B?TnRxZFR6cGRDTGdyeW5YcDRsQjFmY3hFdFcwSGJMK24wemZuN0h4eXNscVJq?=
 =?utf-8?B?Wm5LUnVLOHVUaUVVSkdwc0VsNGgySTJ0blo2L084TWY0dExYblRJbHpORDdw?=
 =?utf-8?B?SUdZTXhISDlQMm13NGQrZEc0TC9yZ0JxQUtQWS93N0djZElzMUZUZmU5K3dW?=
 =?utf-8?B?N2JDQzV1bEN4eFFkNDZmWXlCMUFicVByY1NqSHNGV3BEWVg0UGRiWGZhVkpt?=
 =?utf-8?B?YWdTbkNNbmhjS1pWUDMyRDFEVDhNZ21xQm1qNTI5Zm9jdC9PVEpsWXdJK1VN?=
 =?utf-8?B?R2RBaDd0WkdUSHptTDJxVGFBR3dQdkp6YXY1R0dBNVcvbTlXSkFsajdodTd5?=
 =?utf-8?B?aGxTaEUxT3dsZDhEdU1oL1dmVnhGWWdBclVVY1pVamVJWkVqaXNrTWxCUWVa?=
 =?utf-8?B?Ky96T1hPSW9RUFVlaXVqR1ZGU2dYc2hvR3hsSDdSaDZ3SnMwYVFDQ2tERkFx?=
 =?utf-8?B?Zk1rL2xmWThOdWlQeVRjQWpRVE9BMk1lRWZxN0JKRFlia1B3eU9YWEhGTzli?=
 =?utf-8?B?czl4VVJPOWNuR0hhZVdXMnhmd2cyUzQwU3BJWVpsSzZOY2cwUlJWclNYRzUv?=
 =?utf-8?B?b3BYaDRXNWpUbHRab0dqNk1mWFN6a0xNZzBGSmt1TlZJOFEvZlM3eW5pcGZ1?=
 =?utf-8?B?WWFROWNaczZyQ3ZKWGk1Vkg5cVM4TXI3dWJYNlRFbGMzVkFMa2VyTzNvWGtR?=
 =?utf-8?B?elQ3WHdYMzhGZnVXM1JsYnZSSk15cGNrOTFCY3FRQUs5K0VWU2lZQ1BqaWVz?=
 =?utf-8?B?bWtTVDRtcEhNL1FOdUhSMVRPYjlubDh6MTc4VzVlL1Z0cm9LQ1pPeFdMWG16?=
 =?utf-8?B?VUlWYWZXR2w3dlFyM0doSTFFdVFBTjdlMjJRWEpaNkgrTHlrUjlBeE0zdmVq?=
 =?utf-8?B?VVBqdi9YUGMrTWdaRXgzRzQyeW9zWjA5SGlnb3ZycDJ4bER2a1RCdm9JclVp?=
 =?utf-8?B?S1NXNnZqYnBnSHp1bGM5RVo3YXBRRGNocDQ4WXNpSzJzVldvUkZNRHEvR3ho?=
 =?utf-8?B?Z0pVczE2UVVlamZDY0crcFFxZFFzaVJIYm8vSzIzZ3hkYXlRT1ozdWJFVW50?=
 =?utf-8?B?MzdxOW5WanVpYlZFYnd0K2dKR3ZwTHYxT3o3Nkc4Q20weWIyRHNNKy83cFpn?=
 =?utf-8?B?MXdySzlJYitPM0xUVHI4NlU3Y3puQTN0VjJaQW5rb3NHNXVaQUs0NUl1V05z?=
 =?utf-8?B?NS81QTAxN0VVYjJQTHVNM2V5Nm1NYTAwT3JBWklnS21MajNVWjQ3Q1phbHdu?=
 =?utf-8?B?UU94WlY5bGVaR1FxRGtyRVhTUDdkek8yWk5GSHVEZ2ZNSFI0QUVOei9yTGpu?=
 =?utf-8?B?Z2hZd0djdlYzUkMyZEE1MWVPQjR5V1BTWlhQa2RUcnI1QWhXcjl0Nk1xSFhS?=
 =?utf-8?B?d2hHVDRGVytkakFyV3dUQlFMM3VUNnllb1h1UkdQdWxVU0dBSVB0ZDI4bDc2?=
 =?utf-8?B?dnZ2OWZ4ekFFQXlQOVJhSzhyVGs5TUU0ZDZqbGdqSUFacW9xSXFoeFh5RHlL?=
 =?utf-8?Q?cnI+nL6JhDa3891igUY++iDEBRQGA3+xyFTctvq?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4524B25473A7004C948F22836D7FF2D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5660
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae3b1134-98c9-4021-e7cb-08dd07c3bea1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEN0UC9jSUFza3V0SURSWCtkQ29GTjNjMUc5QUx2YWdnS0MxRTR2aHZOL3ly?=
 =?utf-8?B?RUdrNUgvU3FhUFAycFVPVnN6NDZzdDI0eGJQSms3Mzk0QzFreEowbWhOTUdL?=
 =?utf-8?B?am41NWw3cFRIUDZNM2owbiswNE5kaERFaVVQemRhK1FZNC81a0lsWDhzZ05o?=
 =?utf-8?B?T2U4UHhlZUVYTUxEREFiN3NqcWc2L1pjelNXSTRBQWJBbkRwSDVQRURaUTVL?=
 =?utf-8?B?U2tyMjMvZEhhZzNyTXduRHJxMGZESy9UeVhTalQwTEU4S1MwZjJvRmgxQU1o?=
 =?utf-8?B?VkhmTVQ0L1NiZHpBQ3VSVFM0VmtVNmQ0eDkrTzNWallOUVZQaHY5Z3U3bER5?=
 =?utf-8?B?bWozY0xZL0pmakpuNDVSS3ZyUG9mN0FCN0Z3cTRvNjZrSkg0VEVOUEJFNEdF?=
 =?utf-8?B?c293MlBOYXhNN0h1ZEtHZFRHT0hpVmFFeEg3VlA5b21uNGhkQndzeFN5VjZk?=
 =?utf-8?B?MFgzSUVSL0t5c2xET3pnalY4MG0rOTVrbDhzL2hwenc2RnZyR05nQ2x0THFz?=
 =?utf-8?B?WS9kR2dXaC8vUUpoUC9MVUxUU2lUNWdDSnp4RkZ4ZHJSUWdxM2p4S2FyRDRI?=
 =?utf-8?B?VTVnaXJ5cC9yMVlaWERQbUpmaXBtZk5TUTdkNVlISzRMcTBuNjZjeGpCOUJz?=
 =?utf-8?B?cmVYZnlXSEpmNXorNEdvTnJxZFdoYVhValBnOE0vK0VWclIraFFsbjRGWmxJ?=
 =?utf-8?B?cEs2ZEdxK01NZXBmQlY3MmVibkYxM0FER05yOUE2TEVPbVBsTTY3K2NXQ2l1?=
 =?utf-8?B?enZ6ZVBvb25MVm1MdHhMcVFWd2RFU0hYaitYbEtxWTFMQWx0SGlwc0VwNk5r?=
 =?utf-8?B?cFhENFBidVl5VlhEc29WMkYza3JGcHZ2V0JEQnFFV1J5ZDJRbTJqckZ5ZlJL?=
 =?utf-8?B?K2JGbWtBM2owdWRGMTJYalBDNWhhUjhwQitvVktNUHVlK1pBdEVHeE43ZVU5?=
 =?utf-8?B?Y0loU2VTMlZST3Erd0VlVEsxTGs5SUsrSkJ2WEJvWEZxYTM1MzlJelErNzVN?=
 =?utf-8?B?bUtkNmhqdEUvQlIzWWE5RE5JekJBZlBEcE9YT3hsRGNDSlhOSCtxTmVHTzdw?=
 =?utf-8?B?ZXIvTGJ0a3pSbE0ybjhjRStGc0ZMNENHY2ZJdHMvLzViU0UvNW9BMWpuTjlD?=
 =?utf-8?B?aTdWSDJyVnpGOTh3N0RLVFVGNHlhWGg2QjhMeUFWbyt5SUtJb1ZWenRMbTUz?=
 =?utf-8?B?MXFkUDQ5MUNTdmxDSjJwQnhFaHZ6dzErU1RIYWZKbjVqWjhYRXllOWhkWE5O?=
 =?utf-8?B?NlFUeVR1MWRoV3d6RkF0N2RGaWVOdlNHaTA2bTY1cDFTMXFhMlFYMFV0c3F4?=
 =?utf-8?B?Qk5neCs0WjFMRFd2dEF6TEJSS2c4T1VrZDc2eWZOUm9HRkdrcit3dkUzVnV2?=
 =?utf-8?B?VjNVb01UaXVQU3pZaUphclRSRGFNZGx2RTVHVnhWMTY5bHp1bE5GTS9Xcnhm?=
 =?utf-8?B?VzJTRkY1OTVhMFNkVi9QbW9EdGNDRWd6SGxmNTZYaFFBV0Z1UHp4U0VWZG5r?=
 =?utf-8?B?U1Rza3crZzRvdHBlamdXN0Q4Z0VNT0lISUNXbVVab2RDdksvVUFvT05neEV2?=
 =?utf-8?B?RW8zNFlzYlRtZlBwLzlaUzFIUWN1Ly9uVHd6TmFZRU5qTVp4UWFnNWY2bG1j?=
 =?utf-8?B?TEJ0ZWRvR3VjTFdQbkRNZlRuSlVMVEx4RXBpdUlTd2t4ZlZVWVNwbUpUazRm?=
 =?utf-8?B?dStLdjh2cTVzTmJ5RHcxRlNSbUxSYk83SDFaTXd2SW82cjlKVktOMEFCeDJZ?=
 =?utf-8?B?RnR4aU9lSWJTenU2ZzZXOW01UjNhL21TajhQTlYxanAycHFId0RVZEJVV3Jw?=
 =?utf-8?Q?bqNwuPlrd9oD4ChQCTY2U6XgqSiew6waZOT3g=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 11:26:01.9977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a323bc-430e-40a4-d023-08dd07c3c881
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5472

SGkgSnVsaWVuLA0KDQo+PiAtICAgIGZ3X3VucmVzZXJ2ZWRfcmVnaW9ucyhhZGRyLCBhZGRyICsg
c2l6ZSwgaW5pdF9kb21oZWFwX3BhZ2VzLCAwKTsNCj4+ICsgICAgaWYgKCAheGVuX2lzX3VzaW5n
X3N0YXRpY2hlYXAoKSApDQo+IA0KPiBUaGUgY29tbWVudCBvbiB0b3AgbmVlZHMgdG8gYmUgdXBk
YXRlZC4NCg0KSeKAmWxsIHVwZGF0ZSwgaXMgdGhpcyBvazoNCg0KLyoNCiAqIEluIGNhc2UgWGVu
IGlzIG5vdCB1c2luZyB0aGUgc3RhdGljIGhlYXAgZmVhdHVyZSwgZnJlZSB0aGUgb3JpZ2luYWwN
CiAqIGtlcm5lbCwgdXBkYXRlIHRoZSBwb2ludGVycyB0byB0aGUgZGVjb21wcmVzc2VkIGtlcm5l
bA0KICovDQoNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZGV2
aWNlLXRyZWUuYyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZGV2aWNlLXRyZWUuYw0KPj4gaW5k
ZXggZDA1MjhjNTgyNTY1Li4yMmI2OWM0OTE3MWIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vY29tbW9u
L2RldmljZS10cmVlL2RldmljZS10cmVlLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZGV2aWNlLXRy
ZWUvZGV2aWNlLXRyZWUuYw0KPj4gQEAgLTI1LDYgKzI1LDkgQEANCj4+ICAjaW5jbHVkZSA8YXNt
L3NldHVwLmg+DQo+PiAgI2luY2x1ZGUgPHhlbi9lcnIuaD4NCj4+ICArLyogRmxhZyBzYXZlZCB3
aGVuIFhlbiBpcyB1c2luZyB0aGUgc3RhdGljIGhlYXAgZmVhdHVyZSAoeGVuLHN0YXRpYy1oZWFw
KSAqLw0KPj4gK2Jvb2wgX19yZWFkX21vc3RseSBzdGF0aWNfaGVhcDsNCj4gDQo+IFN0cmljdGx5
IHNwZWFraW5nLCBzdGF0aWNfaGVhcCBjb3VsZCBiZSB1c2VkIHdpdGggQUNQSSAoZXZlbiB0aG91
Z2ggdGhlcmUgaXMgbm90IGJpbmRpbmcgdG9kYXkpLiBTbyBJIHRoaW5rIGl0IHNob3VsZCBub3Qg
YmVsb25nIHRvIGRldmljZS10cmVlLmMuIEkgdGhpbmsgcGFnZV9hbGxvYy5jIG1heSBiZSBtb3Jl
IHN1aXRhYmxlLiBBbHNvLCBJIHRoaW5rIHN0YXRpY19oZWFwIHdpbGwgbm90IGJlIHRvdWNoZWQg
YWZ0ZXIgaW5pdC4gU28gdGhpcyBsaWtlbHkgd2FudHMgdG8gYmUgX19yb19hZnRlcl9pbml0Lg0K
DQpTdXJlLCBJ4oCZbGwgZG8gdGhlIG1vZGlmaWNhdGlvbnMgYW5kIEnigJlsbCBtb3ZlIHRvIGNv
bW1vbi9wYWdlX2FsbG9jLmMNCg0KPiANCj4gTGFzdGx5LCBzaG91bGRuJ3QgdGhpcyBiZSBwcm90
ZWN0ZWQgYnkgI2lmZGVmPyBPdGhlcndpc2UuLi4NCg0KQ291bGQgeW91IGNsYXJpZnkgaWYgSSB1
bmRlcnN0b29kIGNvcnJlY3RseT8NCg0KSWYgSSBwcm90ZWN0IHN0YXRpY19oZWFwIHdpdGggQ09O
RklHX1NUQVRJQ19NRU1PUlksIHRoZW4gSSBoYXZlIHRvIHByb3RlY3QgYWxzbyB0aGUgY29kZSBp
biBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj14ZW4v
Y29tbW9uL2RldmljZS10cmVlL2Jvb3RmZHQuYztoPTkyN2Y1OWM2NGIwZDY0ODQyZTJhMGZkMDk1
NjJhYzkxOWMyMDRlNmU7aGI9cmVmcy9oZWFkcy9zdGFnaW5nI2wzOTMsDQppcyB0aGlzIHdoYXQg
eW91IGFyZSBleHBlY3Rpbmc/DQoNCkFuZCBpbiB0aGF0IGNhc2UsIHNob3VsZCBpdCBiZSBvbmx5
IHRvIHByb3RlY3QgdGhlIGFjY2VzcyB0byB0aGUgdmFyaWFibGUgb3IgdGhlIGFsbCBibG9jaz8g
Rm9yIGV4YW1wbGUgbm93IGlmIENPTkZJR19TVEFUSUNfTUVNT1JZIGlzIG5vdCBzZXQsIEkgdGhp
bmsgd2UgcGFyc2UgYW55d2F5IHRoZSB4ZW4sc3RhdGljLW1lbSwgc28gdGhpcyB0ZW5kcyBtZSB0
byB0aGluayBJIHNob3VsZCBwcm90ZWN0IG9ubHkgdGhlIHZhcmlhYmxlLg0KDQpDaGVlcnMsDQpM
dWNhDQoNCg==


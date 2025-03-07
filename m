Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894DCA56692
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 12:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904903.1312696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqVoO-0003OJ-60; Fri, 07 Mar 2025 11:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904903.1312696; Fri, 07 Mar 2025 11:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqVoO-0003MK-3R; Fri, 07 Mar 2025 11:24:16 +0000
Received: by outflank-mailman (input) for mailman id 904903;
 Fri, 07 Mar 2025 11:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ceor=V2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tqVoM-0003LS-6h
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 11:24:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af4d477a-fb46-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 12:24:08 +0100 (CET)
Received: from DB6PR0301CA0069.eurprd03.prod.outlook.com (2603:10a6:6:30::16)
 by AM7PR08MB5318.eurprd08.prod.outlook.com (2603:10a6:20b:104::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 11:24:03 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::7b) by DB6PR0301CA0069.outlook.office365.com
 (2603:10a6:6:30::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Fri,
 7 Mar 2025 11:24:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Fri, 7 Mar 2025 11:24:02 +0000
Received: ("Tessian outbound a60532193129:v585");
 Fri, 07 Mar 2025 11:24:02 +0000
Received: from L168028a3130e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7803E17A-5507-41FA-B7C2-CF7F861C1D0B.1; 
 Fri, 07 Mar 2025 11:23:50 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L168028a3130e.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 07 Mar 2025 11:23:50 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAWPR08MB9613.eurprd08.prod.outlook.com (2603:10a6:102:2e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 11:23:48 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Fri, 7 Mar 2025
 11:23:48 +0000
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
X-Inumbo-ID: af4d477a-fb46-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=azXQHDeLT3IQhhaM7354u3btLbHUYqX32De3yiYpcvxhpPykZcnhfHCbJDyXGQHFY6zNfx80tQE6MuCZ/ZN3T/iqb+RwP2x27LZ7T2rmNkC7i/y79PCqJGmAxssGBqqhS73n29FRWP6OehM0/X9V72eDTiMt1IIjvHIUSXLC6cV+ej8BWswis5pypt4clEY5kbuyd4b4EaT2dfUoLMmyoXlcUOUvCIlEl59RqJlibW/NXs26iWwFbWp/GJBJBMc3Ze7x5QLLwo27dhMugTnWayjcG0bcjOlqjZfDaTYE4iwmdJLURypx9oSOhJb3ZZIE0NKIt/Mlr6EH4LheagauFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpSCct9tGiW8zIHM1IfWMzCfJ7Bem16VzZ8Bs9ayW7U=;
 b=hfltGZRURXTfbVUuAMMFwWndTZr0EYreWfQiJzqA4rvHnGLCO7oQwYbQFyBjXOFI5nLBFgLtlf4+KuOx1A7uz3pnMNZ8reMjhQYLabEwFh/SMJtQx11kWRRG1iyOlyp6Jk/Ve9vLaWRd61OFBIO8rFAz3QubHvdShifFY2i90pvQcvXOzV19dj7u+Zy3IRiv3AUANjHLFhtXh7OhUog+2yPkroHZfhwChuawbo2GpfncRj5FLOxo8qb1J6U/0hCernp3yT93m2ojlFc4SWaYDZtoDnwsMsRSn8Q+VFX+HQ1BJQawc55Ye4o4VerUjyX1oH7BgXj0USyDSoXh+Eg1Cw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpSCct9tGiW8zIHM1IfWMzCfJ7Bem16VzZ8Bs9ayW7U=;
 b=owhgS062KDJAlBu+wRD+d+bzRIEbKq/rV7kVXxrbZzeqywcv/S+7xb2eR7F3ICe8pTWiAxZSpLhgqT3gPav/gjo5WEymFWMmn0D4YJInzGlA/6m0LfyC4H/PuhPCDKpFhNXO3lZStG6/n1oxVxzcqtOQDKajbA1nVCjTfgOnA6E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2b95d564db976452
X-TessianGatewayMetadata: y5q2dzanSprzrroXZDkSQeSVS0jvYsh948j9jFi/UcRJ2vFxE7ReGvNRPoDbz9MMH2ZsKVoIwGPILax3fnaSo8y3CZTzyEtfgwmfppWouFGyiYMYoxYQL1V8qjXtcm6gFtwKS52Xld/PQOtUaGshqvEjqL4NhTPF4llX3YfRCps=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDszsQx0DlIJhXd03bade6ElWyYBffFN7Ljt4Hn/VT/JObvS4STYAWOqlHPTGElvRatPen6StARMEh55d6h3uNRLRvom1rXyW9Fa5YTKRvJ2/B9aWLi6KtnqLAmrsE2moyKUYibfjtidxvaOLvbe45GgJjd7tjOpj4Lg3KSJqdqF/sDBg30ZkdiGaXWeUWrKYvDcc8D7kSamwR87bWI6kYyNNsbP48F9pSEi3ZbtlZwJgnDRofPH3F7S68RjAZmKxyl39Z2uzS5XYAbzaUVbe/5SA8k1571p5HYiMbuiw+/Q8nzVsZlJvRoXl87JRyaTQEURVdoWaYkCLIz0qymL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpSCct9tGiW8zIHM1IfWMzCfJ7Bem16VzZ8Bs9ayW7U=;
 b=Fzw2pW1NDH8U50EAnzVHcHaRJv8p2jmmkgZ37sCeE21LslRtsZGnr80OO8/APUK+Uw+/UodIBflmVDFz8LAgercq2kNK2wPeM+kNzGgQDuVNoRuh3DAIRbvb0iEpmbj3icVIzGT6HxM+4N0+ZwGgatZltjGM+J7b+S7XtX+d+3i7SLcxkF9qiiOwTH9cwAHS/Xoq9wOoSV1QQ3tnXQQTJcRFhL4gVD0qTbTVw+mPvMiqcz5Z8eckOGc8iYjyg6LKXNNpSeLnbocreZtul9sI+kLTl2kKKinEiTIsSSWllTJyOGEGsuB75htwJfrUkiS29RQEibB/YzUz59lK3N153Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpSCct9tGiW8zIHM1IfWMzCfJ7Bem16VzZ8Bs9ayW7U=;
 b=owhgS062KDJAlBu+wRD+d+bzRIEbKq/rV7kVXxrbZzeqywcv/S+7xb2eR7F3ICe8pTWiAxZSpLhgqT3gPav/gjo5WEymFWMmn0D4YJInzGlA/6m0LfyC4H/PuhPCDKpFhNXO3lZStG6/n1oxVxzcqtOQDKajbA1nVCjTfgOnA6E=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Topic: [PATCH v4 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Index: AQHbjzbI53lezYd1hUSXD4RbGtfICrNnYsoAgAAC7ICAAAdSgIAAGzEA
Date: Fri, 7 Mar 2025 11:23:48 +0000
Message-ID: <FD7FAEC0-2678-450E-A85F-24ADFEEE1B03@arm.com>
References: <20250307075818.740649-1-luca.fancellu@arm.com>
 <20250307075818.740649-2-luca.fancellu@arm.com>
 <9a257d60-3047-4d8a-b461-ce793d5f89e8@xen.org>
 <F4801232-DC72-44D4-AF0D-EFDF5D2B3202@arm.com>
 <cc4c694c-9d31-4239-a469-18580d74d35a@suse.com>
In-Reply-To: <cc4c694c-9d31-4239-a469-18580d74d35a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAWPR08MB9613:EE_|DB1PEPF000509FE:EE_|AM7PR08MB5318:EE_
X-MS-Office365-Filtering-Correlation-Id: 396db98c-d418-47ee-26d1-08dd5d6a903b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QVgyS2FudzR1RWJnTGVsWWR5THIySDJQbm5Hbld2VVJFRUc4R2FJNXkveUp4?=
 =?utf-8?B?dks5QzdZZW0wdExPbEdOazcvbDRyS3Y1NFlUSmRFazJQTXRQeVlBZ2hkRmpC?=
 =?utf-8?B?NFZVUlRFcGptZGZCLyt2WnB6QzlmV2tZTkhpd20vdU9XM0tPYWJaYnJQRW9O?=
 =?utf-8?B?VGRyLzZjMUZFYWxPTEhodjdyZ2xPbm1vVVU0RmRNU3MzTnBZS1J4MHhIb1Jq?=
 =?utf-8?B?TVdDZW5PUXVSNmRvdVBVZDFjOGJzRC9LbGVGbG9kWVhtU2VWRDBtZDZzNG54?=
 =?utf-8?B?WUFHZzAwT1lsV1N6WGRPelFqRHBsZ1V3UXpuR2o4NUs3UXRUbmY0eHhVZDFy?=
 =?utf-8?B?bVZXUEhNSDRscnBDeVk0ZDdLT1RSOGhDenRoWEhvSWplK1NDNzJxeThLUjYv?=
 =?utf-8?B?bGUxOG8yUWNFeXh1TDdpNGxQNFhCYXFRSEtKY3JvUXF0YlozclJwQmJydldj?=
 =?utf-8?B?TnFiRHU2d3IrczJoY2ZYSGpPc0FobHhYeTNwdlc4MUJMOVQ5dWk3M2Y1cElB?=
 =?utf-8?B?NzVFYjlLOXZCSGY1OXdHUVpJTmh3d204dm80SFAxQzZ2bXVpS2ZzWnY4SnFk?=
 =?utf-8?B?VmxMSjVRWHN2K1JlTzFnZkllN3dZalVNU0lPMktrOVhseHptOTVSZVRLazRS?=
 =?utf-8?B?UmdpUWVUN05Nd29TRTVUNTFzby9NZ084TXBSRDVWNnkvKzFZSWZUZm4yVXNm?=
 =?utf-8?B?T3hJY2FuVnUxTXlVM3VYMkR3dG5MMDN0NXp3UXd3Uk9PZ2h1azhLQ1ZQcmha?=
 =?utf-8?B?VnlCZmdhVFRaaU15T1cxeFRKeXN3cVhVaW9Fd1l4L3FZNGRIOWZNN2UvbkFl?=
 =?utf-8?B?OVFZbGtxLzhPRUxidk1WWUpaN2RiMloreHExaUhLL2MySW5OZTY1TzVqdUZK?=
 =?utf-8?B?WGFMdU1ISHZ3b3ZQWVNxUVNiUWNKVnMzZVdBdkQ3UTZpUDdqSUhxTFFFTXph?=
 =?utf-8?B?RGEzSWdCZk9XT1ZwZEJ6d0dnMUt2YjdGK1k2djhraWEvaDhhNVNTNytOcCtl?=
 =?utf-8?B?b05pNG1xd3c4bWdnelhUZ2lxamIrUHFKQWlKQnRaQ0F6MW51RUFnYnZNUzFl?=
 =?utf-8?B?ZGN0bHpBZkdiY1FZM24zSUV6QTkrbmRLRjRjUWFOQmhHQkMxemFIZk9FeXRr?=
 =?utf-8?B?WVVRcnQ2K1ZNakVQYlZHcmhmZkpxckNpNFZJbE5nR3NQNEZrWWJZT2RtUjky?=
 =?utf-8?B?cVRtc0FSOUxCRzBZeXBwS0lZUkE0OUZjeE9yNkNmTUhVSCtZd3Z1bnlaNGpT?=
 =?utf-8?B?RzFqUTVEQjNTeVh0aEdrLzc4T1BERUNZNDl3VXZmbWFVM3cvdTNjWjZvNHhj?=
 =?utf-8?B?YWIxNDdZYlRCeENYd3NYUTRYd05qME03YlN0ZTk0dWpmOHlrbERaMWU3TEEv?=
 =?utf-8?B?djlZMFpsODg0a1REV0s4L3RCa0wvUFVUK2lteHhTU3lQck44ZVU2eFdVL2FF?=
 =?utf-8?B?dE9tdXJiTGlsVkdnNmNhby9ZUFFUUDNoeUkrTFRHMUxZRlUvTm9GS2gzbkhT?=
 =?utf-8?B?VUdYQmxTT2FJWDBmc20vWndkbnlQcDNBL0lhNkx1QjJ6d2gzNllWUDhrNWl4?=
 =?utf-8?B?NStOU0pQM2lHWWszaWFsalJKSGg4c2ZWMTRPNW5hdFdPaFowOUV1QkpGWDZU?=
 =?utf-8?B?TFl1aVV5bFloYUJLZWszU1hnZG9GRys0eGJFeHVTK3ZyRGdGbFQzelBkeXlX?=
 =?utf-8?B?QmQvbGtsTXJBTjBiWGdUWmlSMTFwb1lnT1ZJMXdmWkVjZXNZYi90YVBSQzc0?=
 =?utf-8?B?dVJKaG5heVRaODhJRTBpMks4UElMZ0szTW1KNFYxaFZvdVAvd0VGcHdyTmpT?=
 =?utf-8?B?ZU1zYjZuODJZV2tsVG1TQXdjMTJpeWlXYWNpWUUvbEJjeGhuTE9aMW9oMk94?=
 =?utf-8?B?L3dqYzZlQW13UmlZamFOenZpTnZ3WTZ2UXlmdlNDbDJybGZsR3FTNnpMYURO?=
 =?utf-8?Q?lEmdjQrmXJWmYT+YbkMHEL0TBadfDcx4?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F04E3B79E136B4196E6FB84EE6A2770@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9613
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0ae914b-b65d-457e-383f-08dd5d6a87e5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2gyL1hGUUFJU2RpZmhQUGc3d1d0c2xYQUdmejlHUGZaeEgxbC9meUM4N2Q3?=
 =?utf-8?B?emVaTU5scEF1akRrOW0wOG90dnIwdm1uKy9Lb2F2SWNhUWZqWTJ0cmNUd01F?=
 =?utf-8?B?QzV3eUNveTh2ZFR1dm5tWVBWc2FvRXo4WU90R0paK04wOG4yNUhxZWZaWXp6?=
 =?utf-8?B?UksvTzFnanVTckdGckRyWTJvdkhhWEVLL1FlWnk4Ym1kT1VrQVcxRUozWC9t?=
 =?utf-8?B?UUx3dmhMK3Via3QwNk4wSWlQcXpTeEJMZi9nV0VlcWU0QTRwaGpkdnVEOEYz?=
 =?utf-8?B?Njk2VTdaWjlVeVBReXV6ZWtaa2g5NzNlMjZaU2h6ckt4dnhsOUdyNHgzckov?=
 =?utf-8?B?RXpBcnhMWG8rTHRFSmVCN0FXSFNrdFBYbnNUYjhpMEM5U0RvWUo0OXlIVXIv?=
 =?utf-8?B?ZU1Pc0RiNlFSb3ZOS3g4c1EyU3VWY0MrVHVPak84REJCaXV5Smg0enlJak8v?=
 =?utf-8?B?Qm1kUUIxK0UxbVZkQ1F3UEE4amxMUllLV1VIbUpBV295Qk52ME0vN1R6L1Q0?=
 =?utf-8?B?SWJwYUx5Nmx3NUJtZVhzSXdsZ0I5NDdIK2ZWYUtuV2RYUU1oK2lEZm95QkdH?=
 =?utf-8?B?TUFCYTZBeUZRZVJueUpOOWw5blBXUk00ZktiZnNZWC8vZXRpdUdrUEsxTkF3?=
 =?utf-8?B?UHl4dEMydHlodER2ZEEvWnNXcVdpd1EyR0Z2TDdWRmVJSXRESk5zeU0wcGVT?=
 =?utf-8?B?ZjdENFcrWDYySlVBYnN5VklEK0h6T2RIaXBSR0o1RzV3Z1pHdW9URXpVZHlV?=
 =?utf-8?B?YnlYci83QjdrRCtVWm9kZlpocW1DeWhYcEp6T1ZjVEN5anpvakIxL3FvTzZq?=
 =?utf-8?B?MzNpaDZIcUROMVUxSm5XSW9PdnkwNTQzcndvcDBGdlJxNzVhU1UwVjBEL1g5?=
 =?utf-8?B?THVTV2N1cjV0OFZkTzQ4Nk4yZGIzNkNWaWlwMTd6aVpicmE2ZzgzUC9ZNGpj?=
 =?utf-8?B?TGFqWFYrdWlZMFpZYjJHQ1AvcG5KOElPSkRmSGlDWE5jckljQWxKZHl0c2dN?=
 =?utf-8?B?dzZ1NnJyT0o2d1pmai9IRnRWY28xSHZqTTc3ckhJSXhnM1pkMG1QWC9YKzgr?=
 =?utf-8?B?NWh1TjE5RWtVQTNoOWhyRmNNN082RlF1bjlPT2w5MzlaTnN3UFRnZmU4Ulg1?=
 =?utf-8?B?NDA5OUQxelBCU28wUFVmNkRqUVI1eGdOK3NxWW1Hck1kb2EvN1g0VnpNM3RB?=
 =?utf-8?B?ekI2Y0RUeFlNcjAzMW9XZzBjVmdyWHZzTlJUT0NMSm94eWJmam1obDdoS0lT?=
 =?utf-8?B?RUZZbXBSN0VSL3d2MnAxd09WY0QxKzIzL0h5QVIxaVFML3dvaGxkTE5qODFl?=
 =?utf-8?B?WDFBR1ZLUWdybkpWQnRNMUcxaWdkNEJPZEtFR29FN0dDLytza09iRENQY0gz?=
 =?utf-8?B?a1ZxeHh4SjZVRjdrYkRIRWRLTEZuVURtc1dUcXVqOTg4RThSaVovSk1xWDFx?=
 =?utf-8?B?SkJ3SC9wUUJUZjN3ZjdFSGo4d29iOTI5eTh2OUhmcFhzRVE1Q2RZdWx6ZDlo?=
 =?utf-8?B?ZEV2bjRJdGtZU1RsWDZEeldwTTFBQkovYkdHemt0YXRzRWhtV2RValV0YkJo?=
 =?utf-8?B?UVV0OTNlenNiMitUbDJoTnNSUFQzNHdjellmR1dEUHBMT1FvN3VtWTJ0L0RJ?=
 =?utf-8?B?NzUxYzMzaDhDQUJmR2dXYlhlR2lRWVRlaFBwR1NYMnBVTUVISHBQajcvb1I4?=
 =?utf-8?B?NFl2NFRXdW9SVmN0dlN5N050SUVCeUhlZXpVT1pMU3F6MDlYcndvVUQ3OUgr?=
 =?utf-8?B?L2ltUCtaUTVRcXNVVEhsTVcwZmpmejQ3NysyMGJMVVFxZlQ1LzE3NEV1ZE9l?=
 =?utf-8?B?OGZWRmNQUjVPMUFzdWhUSzA3RVBCVldLTUNkNDUrY2RBdm1pc3ErbzNxbDdh?=
 =?utf-8?B?L1FueDlzYVNLUDdva2V0WGpON21mRC9wSGZrLzJoSGF2MUtDTmo4MlRwNWZT?=
 =?utf-8?B?dy9kbyswQmNNNWlRNkRJZGRLdWY2NWY1cGptcVF6U2d6cHU4ZkxrUHlTcGlB?=
 =?utf-8?B?RXJtNURMUEdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 11:24:02.4190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 396db98c-d418-47ee-26d1-08dd5d6a903b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5318

SGkgSmFuLA0KDQo+Pj4+ICsNCj4+Pj4gK3N0YXRpYyBpbmxpbmUgaW50IGlvbW11X2RvbWFpbl9p
bml0KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBvcHRzKQ0KPj4+PiArew0KPj4+PiAr
ICAgIC8qDQo+Pj4+ICsgICAgICogUmV0dXJuIGFzIHRoZSByZWFsIGlvbW11X2RvbWFpbl9pbml0
KCkgd291bGQ6IFN1Y2Nlc3Mgd2hlbg0KPj4+PiArICAgICAqICFpc19pb21tdV9lbmFibGVkKCks
IGZvbGxvd2luZyBmcm9tICFpb21tdV9lbmFibGVkIHdoZW4gIUhBU19QQVNTVEhST1VHSA0KPj4+
PiArICAgICAqLw0KPj4+PiArICAgIHJldHVybiAwOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKSB7fQ0K
Pj4+PiArDQo+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgaW9tbXVfZG9tYWluX2Rlc3Ryb3koc3Ry
dWN0IGRvbWFpbiAqZCkge30NCj4+Pj4gKw0KPj4+PiArI2VuZGlmIC8qIEhBU19QQVNTVEhST1VH
SCAqLw0KPj4+PiArDQo+Pj4+IC8qDQo+Pj4+ICAqIFRoZSBmb2xsb3dpbmcgZmxhZ3MgYXJlIHBh
c3NlZCB0byBtYXAgKGFwcGxpY2FibGUgb25lcyBhbHNvIHRvIHVubWFwKQ0KPj4+PiAgKiBvcGVy
YXRpb25zLCB3aGlsZSBzb21lIGFyZSBwYXNzZWQgYmFjayBieSBsb29rdXAgb3BlcmF0aW9ucy4N
Cj4+Pj4gQEAgLTIwOSw2ICsyMzMsOCBAQCBzdHJ1Y3QgbXNpX21zZzsNCj4+Pj4gI2lmZGVmIENP
TkZJR19IQVNfREVWSUNFX1RSRUUNCj4+Pj4gI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0K
Pj4+PiArI2lmZGVmIENPTkZJR19IQVNfUEFTU1RIUk9VR0gNCj4+Pj4gKw0KPj4+PiBpbnQgaW9t
bXVfYXNzaWduX2R0X2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZHRfZGV2aWNlX25v
ZGUgKmRldik7DQo+Pj4+IGludCBpb21tdV9kZWFzc2lnbl9kdF9kZXZpY2Uoc3RydWN0IGRvbWFp
biAqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYpOw0KPj4+PiBpbnQgaW9tbXVfZHRfZG9t
YWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCk7DQo+Pj4+IEBAIC0yMzgsNiArMjY0LDI2IEBAIGlu
dCBpb21tdV9kb19kdF9kb21jdGwoc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgc3RydWN0IGRv
bWFpbiAqZCwNCj4+Pj4gICovDQo+Pj4+IGludCBpb21tdV9yZW1vdmVfZHRfZGV2aWNlKHN0cnVj
dCBkdF9kZXZpY2Vfbm9kZSAqbnApOw0KPj4+PiArI2Vsc2UNCj4+Pj4gKw0KPj4+PiArc3RhdGlj
IGlubGluZSBpbnQgaW9tbXVfYXNzaWduX2R0X2RldmljZShzdHJ1Y3QgZG9tYWluICpkLA0KPj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHRfZGV2
aWNlX25vZGUgKmRldikNCj4+Pj4gK3sNCj4+Pj4gKyAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4g
K30NCj4+Pj4gKw0KPj4+PiArc3RhdGljIGlubGluZSBpbnQgaW9tbXVfYWRkX2R0X2RldmljZShz
dHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wKQ0KPj4+PiArew0KPj4+PiArICAgIHJldHVybiAxOw0K
Pj4+IA0KPj4+IEkgd291bGQgc3VnZ2VzdCB0byBhZGQgYSBjb21tZW50IGV4cGxhaW4gd2hhdCAx
IG1lYW5zLiBJSVJDLCB0aGlzIG1lYW5zICJubyBpb21tdSIgcHJlc2VudC4NCj4+IA0KPj4gV291
bGQgaXQgYmUgb2sgc29tZXRoaW5nIGxpa2UgaW4gaW9tbXVfZG9tYWluX2luaXQ6DQo+PiANCj4+
IC8qDQo+PiAqIFJldHVybnMgYXMgdGhlIHJlYWwgaW9tbXVfYWRkX2R0X2RldmljZSgpIHdvdWxk
OiBFcnJvciDigJxubyBpb21tdSIgYmVjYXVzZQ0KPj4gKiAhaW9tbXVfZW5hYmxlZCBkdWUgdG8g
dGhlIGZhY3QgdGhhdCAhSEFTX1BBU1NUSFJPVUdIDQo+PiAqLw0KPiANCj4gV2UgaGFkIGJlZW4g
dGhlcmUgYmVmb3JlLCBoYWRuJ3Qgd2U/IFBlcnNvbmFsbHkgSSBmaW5kIHRoZSBzdWdnZXN0ZWQg
dGV4dA0KPiBoYXJkIHRvIGZvbGxvdy4NCg0Kd2VsbCwgSeKAmXZlIHRha2VuIHlvdXIgc3VnZ2Vz
dGlvbiBmb3IgaW9tbXVfZG9tYWluX2luaXQgYW5kIGFkYXB0ZWQgaGVyZSwgDQptYXliZSB0aGUg
YWRhcHRhdGlvbiBkaWRu4oCZdCBtZWV0IHlvdXIgY3JpdGVyaWEgdGhlbiA6KQ0KDQpCdXQgLi4u
DQoNCj4gSG93IGFib3V0DQo+IA0KPiAgICAvKg0KPiAgICAgKiAhSEFTX1BBU1NUSFJPVUdIID0+
ICFpb21tdV9lbmFibGVkIChzZWUgdGhlIG5vbi1zdHViDQo+ICAgICAqIGlvbW11X2FkZF9kdF9k
ZXZpY2UoKSkNCj4gICAgICovDQo+IA0KPiBJZiB0aGF0J3MgdG9vIHRlcnNlLCBhZGRpbmcgYSBm
ZXcgd29yZHMgc2hvdWxkIGJlIGZpbmUuDQoNCmFzIGxvbmcgYXMgeW91IGFyZSBoYXBweSB3aXRo
IHRoYXQsIEnigJltIGhhcHB5IGFzIHdlbGwsIHBsZWFzZSBsZXQgbWUga25vdw0KaWYgeW91IHdh
bnQgYSB2NSB3aXRoIHRoaXMgb3IgaWYgeW91IHdvdWxkIGRvIHRoZSBtb2RpZmljYWl0b24gb24g
Y29tbWl0Lg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==


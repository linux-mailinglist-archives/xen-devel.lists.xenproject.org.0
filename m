Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4B59B340F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 15:54:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826634.1240963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5R7v-0004nh-SL; Mon, 28 Oct 2024 14:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826634.1240963; Mon, 28 Oct 2024 14:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5R7v-0004ka-Of; Mon, 28 Oct 2024 14:53:51 +0000
Received: by outflank-mailman (input) for mailman id 826634;
 Mon, 28 Oct 2024 14:53:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MlZD=RY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t5R7u-0004kU-TV
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 14:53:51 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20629.outbound.protection.outlook.com
 [2a01:111:f403:2606::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fe7fc27-953c-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 15:53:48 +0100 (CET)
Received: from PA7P264CA0158.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36c::14)
 by DU2PR08MB7373.eurprd08.prod.outlook.com (2603:10a6:10:2f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 14:53:43 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:102:36c:cafe::d0) by PA7P264CA0158.outlook.office365.com
 (2603:10a6:102:36c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23 via Frontend
 Transport; Mon, 28 Oct 2024 14:53:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.0
 via Frontend Transport; Mon, 28 Oct 2024 14:53:42 +0000
Received: ("Tessian outbound 4f9bb016c0c5:v490");
 Mon, 28 Oct 2024 14:53:42 +0000
Received: from Leee85013cb93.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D2886F7-CC2A-4109-9020-248493C2DB2F.1; 
 Mon, 28 Oct 2024 14:53:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Leee85013cb93.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Oct 2024 14:53:30 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB3PR08MB9136.eurprd08.prod.outlook.com (2603:10a6:10:435::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 14:53:28 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 14:53:28 +0000
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
X-Inumbo-ID: 6fe7fc27-953c-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zWAY1N7TSU52xBiDmLytHgvkhlyOlZwtoxlWJEbRrjRc0mK7yfNqlIekM8tTrc3jECfE0yD1p7JrRrsKiwM5HLN0LcQVC6LCD2hZzDu4fvcVTTz63ihdqHMrQkVtJXcx/lWZ5jysOxXII3JjAynzDOoC0fMh7mNQCUbdOlvpChLAu1B+of5y9PWTlaedhVMbzmSie0S8t2iHP4WfGOJIaLrsxzcywRzc6Kb687Oc9L8jH113OBmcrWwEypGXqq+saLPpOUH1urDM/l0uTcrq+AbaoN1QlPtHUm0szoJGWxmx8NhDDg4/O+Nyl0R2971QC15xoINXew1rsdcS919myQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDV2MuxSOjmSu3hnr2329r1eV0r7BKaDaT+KbCMEKj4=;
 b=elgNKmZRZvHg337ACMfAPVfOm7zPF/eHEkBwZFrx4VZht8MuQHa5vusJTvddOMm+MBGt41ahKaRd2l7wIjUlgWy9GcNvPVmkFgXDxAJ942wiZLfO0HIqkQghJDGNLqVuyWMXYQqLhi/GLwgkFUJ1BGkrT+znYvxFVSgRBUIcLjKoFPLTyLVH3QQRc8cXVU2UA0o5Cah7JB4CL5fBAboQxquDg0mGS/A8HNtYkcCqL7PXggF8jrXl0jOyab1Jn9Ni0giBt6CsDZg5lICWyAkIm/EcH8V3q+NfAsttrTV4OUtNQZ8wJlsP+wyGloFHd+qZEVKvD54FEZLh2L6D1vkPTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDV2MuxSOjmSu3hnr2329r1eV0r7BKaDaT+KbCMEKj4=;
 b=gALMlSXlqit0kwY+TIcuf/haGugoqExgd+mYHDVH4PY24d2PU3DfDIZPN3ZqlGj4ZQuW+SQjXlcD+rZokpknuygWVoGD4TT9Sl1fQKMSroOjxHQTPBiWO8nP57sh2KLvHTjez8Q/2vfvP6H/rf32RE60LHm0c/LEM8FW8WvPkQY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5840ce3241f27887
X-TessianGatewayMetadata: mcY3iz5GefycCJuY6hxbF8on6l9EciJO0Op/Ev3SBgCXWbyxqPUjdVQjchyEZnrRKFfps23aR8HhPnAOiEW8A79y/s8clvwG3P31han9V0sROKOt1FyfcJuh8YZt8ueR/2yO/rqyFd6eWuRERgZTHJGFZCN8W7Xbxz5Xk+7okF4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vp2axopoY6TYRo7RLH6jioYJFwMjs8+Aw7zcdvbGs+d1tUjEQiwxQPqHJFCz0GX2fTZzRmppfgRmqnI3tCNyCaP41trepmd9gwDvXbUd/CnEq7YIZy7wdEyiGwXrCOI035W0UQS6zWJkSH1eVsDYDuSF0FnZ5eNi3dVSzUNmqleOA5ofcwBR29WD4vKNUw4IcGg/DqrvRqQ+5mViPXlHXG1zcCmGvoBiQuH6wvopju4gMQUy76CJBwZEO56kvU1rEpxrhlANw1mCf8E1fMgv9nnaXCnOYHsDyA0H0m0ZiJA/n7f+HXNl6bW2zNG43ao7HwPcHsot9F/4d/4hIJIfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDV2MuxSOjmSu3hnr2329r1eV0r7BKaDaT+KbCMEKj4=;
 b=qEH3QQS02/K96IZMJtJqYSHgC7LLsgju2sRb01D3OMhPvD7TwNMqVLQ4e33H7bGGwqQcZ6wWTsnffR8zB+qudQds6g0MFyErGe3m2dIFTy33Lr9CvnqdUnR41nzFAj0fpK03Bh/bp4Twvv4f3455hL7fj8QN00tG0NryhAQjH5br1geLYx/C9TQ58wHPwPt3GM3BhJznmBGmZRVhrNnGSdoIYrULdeF1cO+AWbes95A2GvI0UYanE2jRub0S/uXfd16Nt9F92CmmqQ1dcYV3sUJD+JbYTE18kimO116zsrphUDvZCD0LlZb21ZtxrrVmhrLoIWZ9w2pQqenjcVU+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDV2MuxSOjmSu3hnr2329r1eV0r7BKaDaT+KbCMEKj4=;
 b=gALMlSXlqit0kwY+TIcuf/haGugoqExgd+mYHDVH4PY24d2PU3DfDIZPN3ZqlGj4ZQuW+SQjXlcD+rZokpknuygWVoGD4TT9Sl1fQKMSroOjxHQTPBiWO8nP57sh2KLvHTjez8Q/2vfvP6H/rf32RE60LHm0c/LEM8FW8WvPkQY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>
Subject: Re: [PATCH v4 3/6] xen/arm: mpu: Define Xen start address for MPU
 systems
Thread-Topic: [PATCH v4 3/6] xen/arm: mpu: Define Xen start address for MPU
 systems
Thread-Index: AQHbKTd0Vc85q9/6SUW4ygKFCDwj9bKcP8+A
Date: Mon, 28 Oct 2024 14:53:28 +0000
Message-ID: <BC661646-EA41-4EA4-B99B-C4B184AD71D7@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-4-ayan.kumar.halder@amd.com>
In-Reply-To: <20241028124547.1371867-4-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB3PR08MB9136:EE_|AM4PEPF00025F9B:EE_|DU2PR08MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 359d76eb-5cae-4689-6e3f-08dcf7605124
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MmpSNnd4SmU2L2F6MmozdkMzTURMcytDdWhVc1lxY2FGbytLV3ZrcXBwZ083?=
 =?utf-8?B?R3U0L3owWENRazJmUmg2aDRrVnBOYUdmWElLYk04STBlelQyeURQTy9tZHRl?=
 =?utf-8?B?UDAxN085UjNKUmNFb3l1VjU3cm1MV2F6a1FNU1c5UW1pZXoyUlpGSWRMbms2?=
 =?utf-8?B?U0pGR1AyS09EdEUraGhQSUExRWtkOUovMFQ3dllVcmh5VDhESzg0SHN5VTBt?=
 =?utf-8?B?dW5OeXhSYjAvRVJiQkFWSTdzbDVXdzZrMWVLMjVaT0dWclljVXllMDhiNVJS?=
 =?utf-8?B?RFBDWlFGS3FTdEhKY3NST1dPVHF3dnBhVE9MaS9oMWlYMFVJWERaK01Ya2J6?=
 =?utf-8?B?NWVlY053dDM4ekdmdGVBQjg5ajhYVlBvRmNRK3FFeVhjQ2U0V3dBZXYwaUlS?=
 =?utf-8?B?RFRoZGtEZlZreHBkcnNWTHl2ejlTWTBWNlpFNVA5RXFTNmpNZ0t4QlVHQlNS?=
 =?utf-8?B?eEN4RTViS2paYm5nKy9GbjBzVVlIcnJ1UWR6d2h4VTJCMXlKT0R6THU1R2xT?=
 =?utf-8?B?Y21hSlQybmdKL2VnaFNpVlNESndVNkwrQzNsK0pveXNxL2t1ODNYZU1vL3BC?=
 =?utf-8?B?SzkzMGJDbmFmNGxNeDBNL3ZocUNBejQ1dDVnZGZSUzl5b3BYelEwZGlPTW9B?=
 =?utf-8?B?MFpKcmptQm5vMVMwTnh5MEYwR2JjVWJ6cnRzTHVicDhjdWg0eit4OC8xY09Q?=
 =?utf-8?B?VHF4Z1Z2WFI1SzJmMWZ1QVNEODVndEphRDYxbldIOWlzTnlzM0EvQUtiT3hX?=
 =?utf-8?B?bXZ2T2pQTWxFOVEvazdUUUJ5YTFveHVOeml6WGhoRWswWmh2TFhJQmZKTDRY?=
 =?utf-8?B?U2hwMkFtdnBrSm80NDFoTklDT1JTMnZlaGt4WHhKWnExRkQzbDZWaXcyODNW?=
 =?utf-8?B?b1l5SG9wUk54dzU1WlNoZDdSQ0tNSXViT2JrZlhUTVZORUJIeSt2NFlwNnZn?=
 =?utf-8?B?NmhlN2pDeHhGMnROWUVaUG0zdWxWMkFYdHozOS84M2phellpa3dZL21EeTlT?=
 =?utf-8?B?RkxkSkJNczM5UUpHZ1FFOFFwd1BJN3lLVUFMN2RFS05XL1RBR25uZ1QwMTcr?=
 =?utf-8?B?Sytkd2xlNWNQYlN5aGs4Q3dMODVvdy9NREpQUzlkeUd5Q2s0SEdPL1FiV2VC?=
 =?utf-8?B?NlJGYXlGdjNxY3oveVhland2RHZGUG03R2tiUUxzNkdMd09oQStrUFQyTnRl?=
 =?utf-8?B?YWNPSVFtdSs1Zk5mTVRRM2swTUt2Vm1SZTBFUVo0R29iNnF4NGNoWWZVZXJ3?=
 =?utf-8?B?N21mNmdzcnRnN3F1dGQ2VWRVSDhjNEc0dnZ1Ui9EMUZsVVN1eExDUWxNZ1dS?=
 =?utf-8?B?Mjk3RUI4SFNoTlFKbmVFYkFzNzZOdW1JZm1PMnNjb3IveXFxeUFNZ05RR1Jv?=
 =?utf-8?B?VSs3MTlDc3BDZnJSTWI3eTJDa0tXRU9lUXNVNUp0SFRMS0VHQllwTDZNUStw?=
 =?utf-8?B?Z2IrV1ZOeGZMV2RjWFAvZUVnLy9aTS9KNUJCdEJNdEl0WjNySys4S3dnSlVn?=
 =?utf-8?B?R0JocDlEMS8yNE02RzduTUoxQ3lnNFFDRHRxN0FKWlAvZkJYSmVEZHlaR0tx?=
 =?utf-8?B?VmtUZkthUXlKRUk5YkROdVZIZ0tIbTFHQVJhVjBEOFBUNUJ6VVFYMlBPZ2Vx?=
 =?utf-8?B?ZkZEMjdHdEVsOU9lTWlNMzM5TnpCZ0JWZlA0QUhkVXlnSHl0ZStLMDFBeVJB?=
 =?utf-8?B?ZEx0MFlSWWU1RkYvaG9aQnFGbWRqbExaUXlUakN1SkFDWWhJbk9aSDM0U1pv?=
 =?utf-8?B?UVVFQnlZWDNnZnNCSHFtS3RhREdmY28zUE5pZXMwall3NEtRdzBVcWp4RzFk?=
 =?utf-8?Q?NCYmrtjgoSGiFXtYQ6LF6ffqIx8OGnHpLG8o0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDAFD29FA7D8894C8D05D1413F716A74@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9136
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d519c695-783a-4c1a-13ea-08dcf7604844
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|35042699022|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STNMOTRKOEVlZmhibjBTZnpKNTJnV3VHR2dFNUdURjk1NG91dlRoQnNOVXEx?=
 =?utf-8?B?OVhOTmVtM2I2NjVvSFdYY1FCS2tiUWY1aDN5ODh3ZUk2ZHI3bVFraFQzcFdH?=
 =?utf-8?B?bTBHSzN2c3BVdm82Q2IvRmlvd25zWHY4U0tPbzBCNWFOSjF1VXVpQXUvYUpO?=
 =?utf-8?B?Y004amhJT29xdGlXVjFMdnk1NklBWmJ5SldhS3FobnpORkdjZ3c0NHZSTkQw?=
 =?utf-8?B?N0pVV3ltck16d3lTT0toMGZHOEFsNVpWTHRqT1dITmxCQ3JtQ3E4aDF6SXpt?=
 =?utf-8?B?SkFYVDVzQStjNVBPOFZCZ3c1OWh6cnN1T2dMNXhPT3E5TWw5ZEU3eTVFcys2?=
 =?utf-8?B?dkVrTTFDUkNkZ2tSTWxteEtESlRKTVZITDdrd0JOdTErMWVVaStmUldZaUdT?=
 =?utf-8?B?dVR0aEVhZDZxcEk5ZG5nYmNVQUo0YzI1dy9mUkFCL2NraUswc0czM3ZZRjZQ?=
 =?utf-8?B?U2VwUEZsRENLeHArSFhudWtZSkRNcVFpZFRlamFkWHNlTDlPbTVRTTE1bjR6?=
 =?utf-8?B?VGlEQ1ZyRFJjN0VtM2NoUEdYdGtBZzJ1Wlpyd3d6dTcyNmt2RkNlUEhjTHp4?=
 =?utf-8?B?SUt4c2p1RU5wN2VEakF0SXhQYU5ZcHVqOFdKSU11SjNQRmM1OWJ5VEFVYlNl?=
 =?utf-8?B?Rk1HSThkaDVkVURmY25Dcmo0cmhENjdsYTBhaTFMbXc2Zm1MMjg4V1RoUzhR?=
 =?utf-8?B?UXh4UWg0N0pHZVp1VDFXeGNtdFBJdEZ0U3JxaVl4Skx4ZEErNHlYZk9Cc1Vs?=
 =?utf-8?B?bWp6cWJjK0o2TjBuc09LSjh4R0Z6WGszYitHS0NNTHMzRFFyOHJJL2dvWDU5?=
 =?utf-8?B?ejNuSUhSWWxyTmgvY0g3TG1YRWQvc1BHWFRBQkQyb1B4NDJoRnZNdXJkZVZS?=
 =?utf-8?B?MUc2QnZNdy9VbDNhb1lidHhSQzM5eHRGVGlrUXpDdzQ3M3oxdDVxTXZaZEEv?=
 =?utf-8?B?cHpCdFBYTDU3cDRoZ2FZa1FMSllHMkp1d0ptT3ljL1lGbVY3NTdyRnVIWjdS?=
 =?utf-8?B?RTZucmxzWGhGUFJYdTZMbEtXaUorM1ZOV1BnaGJ6a3Rhc2dEUFJQQk1Hb240?=
 =?utf-8?B?YW8yb1JPTzgwd3ZCYkRSSGFJU0c4TCtRQnZmcXFzbkQxNVZDTFppVS9sMjd2?=
 =?utf-8?B?WlBqUE55NGZSdWpEZHN5MHN1azFTbEV1V3lldEJHM0dmbUMzMlBLaENOVHgv?=
 =?utf-8?B?eFI2cTM4QmxHeUplSDkzc3hJVGFkRDhoNkdrM2RkT2tVcjhwaHlFU0dscnZE?=
 =?utf-8?B?cUQzOXFiNkNUYXhLaUJNRTR5L3Q5OXhybm9oQURpdWR3QmUzSEo2VXZSVmlR?=
 =?utf-8?B?c0pyV281M2dDcHpZUUo5MkhvdW1ueFA5V0pMd1pyY2UrcE9JTjB1MWVsQkVi?=
 =?utf-8?B?ZHFCUkU1QUpMU0hDVmkxenlRNW96OXlySkxkVHYyVDBldWF3Y0Z3SjA4S05Z?=
 =?utf-8?B?ZUNnMmlpUVloNnRaVUEvaU9IdXF3bTQyNkNLWEptK1ZLTEFHclBEdFU1a0Yr?=
 =?utf-8?B?SGkyWG9JMElxVGk5Q0JrZGxoeWwrOERYMjhCYkt1R1g2TnlpWnpWQUhsS0Iy?=
 =?utf-8?B?ZFp3WXkrNGhnTGpaU3VVeHpPeFpYQ0xEQkdiaUlQQzVnTitzOHRyVWR6UERC?=
 =?utf-8?B?REJYZTVhRXpScENSY1BkQlNNbmFGL1NvSWQwai9odkV3YnFZL3ZYMU9lbDA5?=
 =?utf-8?B?U3R2Q2FPRHUxSnpNekgzbTk1S0xaVVRNRFNMbERYQ0ZWK20wUTZjOXQ1R21K?=
 =?utf-8?B?ZGFrczRrVml1cldLdmpRU2N4VjJTYVNlNmlmSXBqdXRMWG1YZlRST2krTjE3?=
 =?utf-8?B?VGtkeWFhcXVtaWpNYS8rQXVibFN4VXFXTWtkMW13RWRPdGZRNHBTMDhHL09a?=
 =?utf-8?B?bXlHMjVxS1FSOEpBUXZQSnN1V2RSK2kwZkUxdkZZYWw3UFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(35042699022)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:53:42.9249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 359d76eb-5cae-4689-6e3f-08dcf7605124
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7373

SGkgQXlhbiwNCg0KPiBPbiAyOCBPY3QgMjAyNCwgYXQgMTI6NDUsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEZyb206IFdlaSBDaGVu
IDx3ZWkuY2hlbkBhcm0uY29tPg0KPiANCj4gT24gQXJtdjgtQSwgWGVuIGhhcyBhIGZpeGVkIHZp
cnR1YWwgc3RhcnQgYWRkcmVzcyAobGluayBhZGRyZXNzIHRvbykgZm9yIGFsbA0KPiBBcm12OC1B
IHBsYXRmb3Jtcy4gSW4gYW4gTU1VIGJhc2VkIHN5c3RlbSwgWGVuIGNhbiBtYXAgaXRzIGxvYWRl
ZCBhZGRyZXNzIHRvDQo+IHRoaXMgdmlydHVhbCBzdGFydCBhZGRyZXNzLiBTbywgb24gQXJtdjgt
QSBwbGF0Zm9ybXMsIHRoZSBYZW4gc3RhcnQgYWRkcmVzcyBkb2VzDQo+IG5vdCBuZWVkIHRvIGJl
IGNvbmZpZ3VyYWJsZS4gQnV0IG9uIEFybXY4LVIgcGxhdGZvcm1zLCB0aGVyZSBpcyBubyBNTVUg
dG8gbWFwDQo+IGxvYWRlZCBhZGRyZXNzIHRvIGEgZml4ZWQgdmlydHVhbCBhZGRyZXNzIGFuZCBk
aWZmZXJlbnQgcGxhdGZvcm1zIHdpbGwgaGF2ZSB2ZXJ5DQo+IGRpZmZlcmVudCBhZGRyZXNzIHNw
YWNlIGxheW91dC4gU28gWGVuIGNhbm5vdCB1c2UgYSBmaXhlZCBwaHlzaWNhbCBhZGRyZXNzIG9u
DQo+IE1QVSBiYXNlZCBzeXN0ZW0gYW5kIG5lZWQgdG8gaGF2ZSBpdCBjb25maWd1cmFibGUuDQo+
IA0KPiBTbywgd2UgaW50cm9kdWNlIGEgS2NvbmZpZyBvcHRpb24gZm9yIHVzZXJzIHRvIHNldCB0
aGUgc3RhcnQgYWRkcmVzcy4gVGhlIHN0YXJ0DQo+IGFkZHJlc3MgbmVlZHMgdG8gYmUgYWxpZ25l
ZCB0byA0S0IuIFdlIGhhdmUgYSBjaGVjayBmb3IgdGhpcyBhbGlnbm1lbnQuDQo+IA0KPiBNUFUg
YWxsb3dzIHVzIHRvIGRlZmluZSByZWdpb25zIHdoaWNoIGFyZSA2NCBiaXRzIGFsaWduZWQuIFRo
aXMgcmVzdHJpY3Rpb24NCj4gY29tZXMgZnJvbSB0aGUgYml0ZmllbGRzIG9mIFBSQkFSLCBQUkxB
UiAodGhlIGxvd2VyIDYgYml0cyBhcmUgMCBleHRlbmRlZCB0bw0KPiBwcm92aWRlIHRoZSBiYXNl
IGFuZCBsaW1pdCBhZGRyZXNzIG9mIGEgcmVnaW9uKS4gVGhpcyBtZWFucyB0aGF0IHRoZSBzdGFy
dA0KPiBhZGRyZXNzIG9mIFhlbiBuZWVkcyB0byBiZSBhdCBsZWFzdCA2NCBiaXRzIGFsaWduZWQg
KGFzIGl0IHdpbGwgY29ycmVzcG9uZCB0bw0KPiB0aGUgc3RhcnQgYWRkcmVzcyBvZiBtZW1vcnkg
cHJvdGVjdGlvbiByZWdpb24pLg0KPiANCj4gQXMgZm9yIG5vdyBYZW4gb24gTVBVIHRyaWVzIHRv
IHVzZSB0aGUgc2FtZSBtZW1vcnkgYWxpZ25tZW50IHJlc3RyaWN0aW9ucyBhcyBpdA0KPiBoYXMg
YmVlbiBmb3IgTU1VLiBXZSBoYXZlIGFkZGVkIGEgYnVpbGQgYXNzZXJ0aW9uIHRvIGVuc3VyZSB0
aGF0IHRoZSBwYWdlIHNpemUNCj4gaXMgNEtCLiBVbmxpa2UgTU1VIHdoZXJlIHRoZSBzdGFydGlu
ZyB2aXJ0dWFsIGFkZHJlc3MgaXMgMk1CLCBYZW4gb24gTVBVIG5lZWRzDQo+IHRoZSBzdGFydCBh
ZGRyZXNzIHRvIGJlIDRLQiAoaWUgcGFnZSBzaXplKSBhbGlnbmVkLg0KPiANCj4gSW4gY2FzZSBp
ZiB0aGUgdXNlciBmb3JnZXRzIHRvIHNldCB0aGUgc3RhcnQgYWRkcmVzcywgdGhlbiAweGZmZmZm
ZmZmIGlzIHVzZWQNCj4gYXMgZGVmYXVsdC4gVGhpcyBpcyB0byB0cmlnZ2VyIHRoZSBlcnJvciAo
b24gYWxpZ25tZW50IGNoZWNrKSBhbmQgdGhlcmVieSBwcm9tcHQNCj4gdXNlciB0byBzZXQgdGhl
IHN0YXJ0IGFkZHJlc3MuDQo+IA0KPiBBbHNvIHVwZGF0ZWQgY29uZmlnLmggc28gdGhhdCBpdCBp
bmNsdWRlcyBtcHUvbGF5b3V0Lmggd2hlbiBDT05GSUdfTVBVIGlzDQo+IGRlZmluZWQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogSmlhbWVpLlhpZSA8amlhbWVpLnhpZUBhcm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBB
eWFuIEt1bWFyIEhhbGRlciA8YXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbT4NCj4g4oCUDQoNCkxv
b2tzIGdvb2QgdG8gbWUNCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2Vs
bHVAYXJtLmNvbT4NCg0KDQo=


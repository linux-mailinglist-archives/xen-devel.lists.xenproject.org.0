Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EAEADB414
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 16:40:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017338.1394321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRB0V-0000Rp-9S; Mon, 16 Jun 2025 14:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017338.1394321; Mon, 16 Jun 2025 14:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRB0V-0000PE-6n; Mon, 16 Jun 2025 14:40:19 +0000
Received: by outflank-mailman (input) for mailman id 1017338;
 Mon, 16 Jun 2025 14:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KWUM=Y7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uRB0T-0000P7-Br
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 14:40:17 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:200a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfab5018-4abf-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 16:40:14 +0200 (CEST)
Received: from BN9PR03CA0342.namprd03.prod.outlook.com (2603:10b6:408:f6::17)
 by SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 16 Jun
 2025 14:40:07 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::ba) by BN9PR03CA0342.outlook.office365.com
 (2603:10b6:408:f6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 16 Jun 2025 14:40:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 14:40:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 09:40:00 -0500
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
X-Inumbo-ID: cfab5018-4abf-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHSP/lOeCPcf5A9YbQP1pzDY9ynoGoUXm+RfkihcwsTQJ/rv/UXq90QvCgjKBOAeb5qdxXbpL5SpkJmy0Kqt/vDB930IAOR67ksEtCbi9rLygXYGLFlyJeKTJ7r2gDsxoRWNne+61kA1TZrMDx8BY+HXKp/3Tu3mmgQ4U+8Zn/jSZh2L68ifNqWkuXKDqhecHM6Xuy1tiWnXrOg4f4gPc0ADtOkPD2374CG0c5o70UjnyS94YIt3+p8cAD1DsX70ctacGUnNsDy4GVJuiPdG+14xIlAst+wxYmR+yu2XVAQZJfFKCkA5WacgnNYDLiXu/wydgCucesprRRbUHzfMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qBU7Fg+QABi+iGcPxy3fjDFbaEAYIwssbUZIt3syaM=;
 b=AkElMJPTIX1VFQTKLbWTwwG30x7JCShgqCPaggtMt8jwPppPYtVr6Yf3mb+NDuCd0J+M7dCxCP1aGTzc5Q211x8U5DVb/6Mvwq8LcwoeO4em6foRH4dXMaT6emCGuOgT+ccUWbfIE7urWFNhfYRAhtRX7TXgur+qqwnW35Bl2HLQafW/EeVDdaXvctckqWywKTteLaPhxL/aTrBu/xW0+jblvNg0tAGDlE40axuSXKIFcjFbdDLWm+WVABNlg0Eolr47VRkul4yuKvnApoBekPBxBdYXROnDKdI8IDzyNVxdvRW3eJv7B9xR6A/IP6CNBzEzISrtLvbTWyCmPN2xDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qBU7Fg+QABi+iGcPxy3fjDFbaEAYIwssbUZIt3syaM=;
 b=kHhwP/2xCX6J1rY8fa21pR3VFbOi3G90Gor3kLkLRlE8eI5q7Zy2y27V/2xDUeWqslhjzVEwEmnOz6URNLhV6nqgdFe+agZP8yiltutxd5vHouN17tQsH/EeIDSxCWR1XJ1zpE4OEXgcT/inEfst63/GWCjCBye/5WcR1Xe6HWc=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Jun 2025 16:39:59 +0200
Message-ID: <DAO1A9SJ9I2G.2L00II6AC0JDZ@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 14/14] kconfig: Allow x86 to pick
 CONFIG_DOM0LESS_BOOT
From: Alejandro Vallejo <agarciav@amd.com>
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-15-agarciav@amd.com>
 <2a54e49b-c1ad-4654-9291-4373e92580ff@xen.org>
In-Reply-To: <2a54e49b-c1ad-4654-9291-4373e92580ff@xen.org>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|SN7PR12MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a6d5e9f-a1b3-4d95-81b6-08ddace3b055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUVWT2pTbS9JNXFxdEhvY0dLZTRySnBPeTZ1STZrcFNLVSthb21paWt1VjFV?=
 =?utf-8?B?ekFKcXlvanhpa3QvRUx2dDRINmdPQkY1YW5kWFhMUFRGb1JCMWNiMFV2M3pB?=
 =?utf-8?B?dnZxMXAvZzk0T2tDS2pSVFZoQ1BNUjdnMHpHdll4VkFrb1VGSnltVnN6a1M1?=
 =?utf-8?B?NlhVZkU2UjZ3SDR5bnFYdUlBQVkvR3RzaVBXKzA2c0Z2VTZPTXhFNnBzZGw4?=
 =?utf-8?B?TGRTS3ZEMmgxUnlsenNnNGFqTFlTYmxUdnJ3ci9qZWlkQXJiMnAzSTNMZkI0?=
 =?utf-8?B?QkZSOTFWdWNOT1poNml4OGJ1N1hoZExIK2pRVXFldGwzS1FVT0hPQVJKeEZv?=
 =?utf-8?B?cDloallOQS9meG5JZzRpR24velVnell0Qy9DT0U0d0dYLzJaaWc4bUowZllt?=
 =?utf-8?B?clE4bWhkLzNOZnNXVWxCSW1ncjVaQ2dJL3JtT29BTzk1bG5UbTJIQjlmUVFG?=
 =?utf-8?B?RW16dElXTllvZkphUHZCdVpFZ0RMVGJ3by9QMlV4bkt3ZmgxTUpuNGM3ZWx6?=
 =?utf-8?B?cVE0WGRRRWNBRzViWkFldUZkMFlPZkFPbXBKTDZxWTgzSVo0eVhxSUVxNmJq?=
 =?utf-8?B?UkFRaUQ0WVVvdDZ6OUNIYmhmYXRrcGJOTy92R2t4bm81cmdScWJTcGVvZUFs?=
 =?utf-8?B?QlF0bjJqbFZ5cDA4QjQ2ZStaaG1qck90cWVBditidS8yVzJpTmc2akF2LzFB?=
 =?utf-8?B?aFhZNERzZ2pkN0FmeWdUK2ZyaXRxMUdjWjZvVWpoaW1PY2xrVWprNHVQL0pu?=
 =?utf-8?B?TmNYMDBQYnFMZUVHNlNpMmhHUG9UM2RyNmdhWDNCajUybnZlL25JQm9rNStS?=
 =?utf-8?B?cm8yd1JKaCs4bms3NTFDRWxrREhxc0ZCR0xNc09pQXUxYXVMWmNTVmdwQUdB?=
 =?utf-8?B?Q2o1RjdUcGdhY3I0WWVjYktiQ2pNNFpHSUdlR2dOMXo3NzF2bjFpTGpTQmRz?=
 =?utf-8?B?TXpXQTJkVGpOUEV0bDBHdlI2OHJHRnRPQWJuQVpJSW5Rd2dhSWVGWlYwUU9L?=
 =?utf-8?B?cWdKckVUYVRpU0FmbXJiNmRkcFdHSkJEZFVjSjFqYmpPaEp5eG5jcXgzZFF2?=
 =?utf-8?B?dnY4VVJ6NWhMWXhQeDJLay9RMklLejA2aXdGa05QTVRJejdzSWRFWjJkNDZm?=
 =?utf-8?B?ZGg3NWlIOFl5N1hiaVRCb0JsUGZwT2J3T2RMWmpSWm01UlZTV2hpSXdUZ2F2?=
 =?utf-8?B?NDd3M3FtQ0NJbExjcm5jdytUOEFldkdNYXJsQm40bW1ySGhRaDJRLzNWdG5x?=
 =?utf-8?B?bVFuM2ZYMUZUT3U3QkI4K1lPOU9kOHBzSlVFSlRpckpQRXNWdmdIbTFTMkdr?=
 =?utf-8?B?UWtVMzIrRW8zYjZIMFAxUEpERExRN2JnZmtnaFVFRFlwNTArak9rbWlSd1Bu?=
 =?utf-8?B?MVJ1MG1oOU40QlkzeGVsbjNwUXRtR3BQazNkZWx6L2ZrOEZTVWpGbGlqeEcv?=
 =?utf-8?B?cWdqamo3MWxuZ1JBYWJxaHd4VUNWdFMvRzRvcUFwaFh1ZExLT09JR3JEcDRj?=
 =?utf-8?B?MXl5OUwxOUdlNHJOaElWbU5sUVpkbk8rNTZNcjFvUktKUHVQdGR4MDNGdjdy?=
 =?utf-8?B?N0oxODRVTjJmL1c3T1piVzJ4RkNRQzFmZ2hwTXVmTEFLMHoyTXZXaXlpbElm?=
 =?utf-8?B?Wjh6Y09OQnczZWhNQ3lJbjVGYXNMdGhaUklqWmUwY3hWQnJKaS8xQUQ4MjRD?=
 =?utf-8?B?YlExQTE1aGxNNkVZQTNmNW9zTEdHUWRFY1Evb29EdnBjSUFpenYyUUhTNXlE?=
 =?utf-8?B?NUVhdDI1TGFhWFNuS3BMVVFVTzl2c0xwbXZRMmhkaGVYNFRDM0lCTnZVRS96?=
 =?utf-8?B?SWp1YTYra2NiQ3NmMitNei9tWHp2eU5qUzBhQmJoemRiSis3V0lkUGFCQnhs?=
 =?utf-8?B?RW9NMndPZE1CK29pdkpmTy9jZC9kVVhEajhEcGFaYndRZnlLNXlpNGJoL2tV?=
 =?utf-8?B?NUljTm9qTGEwTExscXRtVHVRUGlMbk9IL0JNa29ObjZrSitkcHp1NlFMdFho?=
 =?utf-8?B?dVNVQjc5d29Zajd5NFhDUXY0ZFBaQkVPQklEdWFHblFYUGpLVzFVNGdYa1BG?=
 =?utf-8?Q?qSnWJo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:40:07.2003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6d5e9f-a1b3-4d95-81b6-08ddace3b055
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204

On Mon Jun 16, 2025 at 10:00 AM CEST, Julien Grall wrote:
> Hi,
>
> On 13/06/2025 16:13, Alejandro Vallejo wrote:
>> Without picking CONFIG_HAS_DEVICE_TREE.
>>=20
>> In order to do that. Allow CONFIG_DOM0LESS_BOOT to enable a subset
>> of the common/device-tree/ directory.=20
>  > x86 doesn't want dom0less-build.c,> as that's tightly integrated=20
> still to the ARM way of building domains.
>
> I don't understand this argument. dom0less-build.c was moved to common=20
> and it will soon be used by RISC-V. This raises the question what's so=20
> special with x86?

That's 2 separate matters:

  1. dom0less-build.c not being compiled in.
  2. CONFIG_DOM0LESS_BOOT enabling use of DT code without CONFIG_HAS_DEVICE=
_TREE.

(1) is a matter of not wanting to boil the ocean upfront. The way x86 and
everyone else build domains is just different and duplicated in non-trivial=
ly
consolidable ways. The goal here is to enable the domain builders in any ar=
ch
to use the same backbone. I don't want to go the extra mile just yet to uni=
fy
domain construction (though in time I will want to).

(2) has to do with compiling OUT things I really cannot have around. Anythi=
ng
involving devices described in a DT must not exist on x86, because it has n=
o
concept of a "struct device".

My intent is/was to repurpose CONFIG_HAS_DEVICE_TREE to mean "this hypervis=
or
goes on a platform that gives a platform-describing DT". On x86 that's give=
n by
DSDT/SSDTs with ACPI.

>
> Note I don't particularly care if you don't want to use it on x86.=20
> However, the argument provided is lacking some details... This will be=20
> useful in the future if someone thinks about consolidating the two.

I very definitely will want it all unified, but I'm working one elephant at
a time.

Cheers,
Alejandro


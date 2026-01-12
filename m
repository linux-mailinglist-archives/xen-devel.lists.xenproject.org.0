Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46BCD13A87
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200567.1516446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJqH-00080G-Rl; Mon, 12 Jan 2026 15:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200567.1516446; Mon, 12 Jan 2026 15:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJqH-0007xn-On; Mon, 12 Jan 2026 15:28:29 +0000
Received: by outflank-mailman (input) for mailman id 1200567;
 Mon, 12 Jan 2026 15:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1UP=7R=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfJqF-0007xh-NX
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:28:27 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55314ff0-efcb-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 16:28:24 +0100 (CET)
Received: from BN1PR13CA0029.namprd13.prod.outlook.com (2603:10b6:408:e2::34)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:28:16 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::6e) by BN1PR13CA0029.outlook.office365.com
 (2603:10b6:408:e2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Mon,
 12 Jan 2026 15:28:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 15:28:16 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 09:28:12 -0600
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
X-Inumbo-ID: 55314ff0-efcb-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4P9i1wOqEG8il/gVYLjCWqDP67bljK1JNf7gAzGDLDfdJAcjZUriI7z0/qdzLMOdSV9Jlgwkv8AqdEo1ZpdCnAc2ssmgd6T5sC4uDW68hLFAjdt0vgtZa0zM/fdRcwj2/XFIZJtb9iM4RCqI/olXTKUGETnwvf+2xt7iTm9X1dlIzAAD9pOi3Une9WmlXj4NQl8bp1P6Nlo7lk7+lYZOZ5GPIk87UAViIFOvgL3XnN8RmCWN5RMqMVs/VZHoQGLLsiZHeLnsqoIyaYewJwLtzGg7qyO/jT+gEnuHelJ6Bt3dUxZkj5VosRuMuP8iC3o7D5/pY+FtcOcKywx3skswA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5lPGmFvbpaE9gwdlvLa/CMdfRxAynaR5zdCd6X2C4E=;
 b=A2xusC+uzthIaK/iAoBltoO49PCQzsgmNXPsk3/EE87LK67LqO+vWjnSPAbTow9PXJsZ67hf4oFlJUKqKW7aGxtY1s14kwygrsWb6v8We6G1FYeydNYT0m7aiTO4p3dP+hIIpiJGNx3wFud9DCVF+S/1prPCCO1K1QfAebiFukpPb3+hb4GxMgmNjp4hDe/lrrZO7dI9A5VMp5O6wndO1PVe9e/Klg9HOxklyV527upjsx3YLZtPkH5eR0wzCE+kt24Xf9JUiTIF8Fhof8KFIdUYBofX/A2LeBW96vo8SaBU/hWkXmYCPEzad9f5qijf7Aoav5MGrjKvSXs8ooWfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5lPGmFvbpaE9gwdlvLa/CMdfRxAynaR5zdCd6X2C4E=;
 b=NRaUcworzxdTLZ0biw0BakrD9jSPFI9tCw/DCu4UFqHs0ldeW+zw5JxJoOuyTlEXW4Qa1KWViCs36Z+HuYos/qxG+tuh4nfZKvfa1UXVrZBhD+oBoOaawnLOgvUSZOnjf56ZEy0hThyh0+zE4bcnE3PC3IpgoSbrX1I++wvBmrE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 12 Jan 2026 16:28:11 +0100
Message-ID: <DFMPTKU4F4TY.2LF5TKLV8C3RT@amd.com>
CC: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: Add Kconfig option to use a 32bit TLB clock on
 debug
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260112140851.55590-1-alejandro.garciavallejo@amd.com>
 <2a903c72-633d-4c91-938b-443628ac37cd@suse.com>
 <05372ffc-c1b6-4d65-a13b-cd28de6248b5@citrix.com>
In-Reply-To: <05372ffc-c1b6-4d65-a13b-cd28de6248b5@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a07d463-a3d5-4751-b54e-08de51ef351b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1dYZ25tNVF4VTZ5TkJQdUpxMm96YTZENmtsa3BRNkRhU0w3TXJ5RjZqZWE4?=
 =?utf-8?B?cXRIMTcxd2FIempuZzN1ZEYrdGJETTR2Mk50YWhRNmlHZVQwYUVtVWl4NEt3?=
 =?utf-8?B?VzdxWTVRbFliVnV1SFJUN2pXdWlFL2RJbTBlQ2kvcDR2R3BzNldZYW5VTUE2?=
 =?utf-8?B?WUN0NlZXSVhLQ3I2dWx4NHVwMERDVDdDeG9vU0t5QWIvb0pZeko4NG1qNXZ0?=
 =?utf-8?B?Rmpwd2Q3bnVRNDRBdFpITzFLckdDdDhjUklKclNLV3dleFJFVWZaVXBZbHhW?=
 =?utf-8?B?RWtNa1V6ZWJ6L3NuTVBzZGJkWW1zT3NEeUVyNXh0cEkzNEJ5d0FIR3lHajls?=
 =?utf-8?B?VmtmTVFiT1JQRHdsNEZiMjNsQkhiTEt5ZTZlVTlkTjJyUnQvZWI0aWpHMXhr?=
 =?utf-8?B?N3NhNi9pNmxyRlVnYlhQZlVDcE45Ty9jaEpWRWZZYndSVGFlekZiTk1zZ3du?=
 =?utf-8?B?Z2FVMXRuOTlaSXFFRjJndDhaTWt1VXR5bHFUcG1LbmJOVEZqSFJURVdhYWRm?=
 =?utf-8?B?bm1wWkxrb0kxWlRVamEwMDhTNjE4S3daUU14Vnp5S2VrRlZUTGpwVDRVdTdz?=
 =?utf-8?B?MUhYelJNTEpKVCtoZVdVVTNTaUtYUTJaOG9WQUxKRXNqaUQ4NnA1TmpYZWgr?=
 =?utf-8?B?c0JXUFBUekNKd2FHUFNubkMyZXN4MytYUE8waGErN3ZYbmwveHJoYW9MUHda?=
 =?utf-8?B?d1Rta1d0ZVE5OEJXaEZ0c0krYnVOelFlQmFUSnhHZHZjRVRWM2o4UTZSdE1Q?=
 =?utf-8?B?OU9oQldRZHJzOEo3cFVNWFd4WGNJc1pnam93Umd5aFAyWE8rcjQxaS80c2pS?=
 =?utf-8?B?cGVkVDNxOTJNdFdtejUwTjkwTVZFYXRtYjRBQjYrTXdlQml5bE41akpTcU5N?=
 =?utf-8?B?MmY0dHd4SzRiVDM4OXdoOWVMcmxESkZWZWNBaUpsMGpBOUx3eFl5SWNLWDRI?=
 =?utf-8?B?N1gwZjZPb0FSNStrVDNhbHFYWEwvZW5rQmlWSDlBWC9VcWRMOEpweDdmMXo5?=
 =?utf-8?B?QzBGKzZZNDdKUGFBMnBTQjREanlFb2pkYWVTTktIUU9vUXhzc1pFSW0wRHJw?=
 =?utf-8?B?WVowZE9la0RaS2dVQnBQL2tlMVFMYjF5WDRlUUNERUE2MXY1bXl1NFp0OXFI?=
 =?utf-8?B?V2Y5QlFTdk9JdUc0ZjVOUUNoU3NHRGxtbDE3VlRNYjhVWnhWZUZNOHdMY2xV?=
 =?utf-8?B?RUlwTnpHUVlOck9ad0ttcWQ0dzY4RnBETVEwaCtTOGppckhZY3VlMkF3N1Rq?=
 =?utf-8?B?bnBsOExGWWl4djJZL3dXZXhZaDUvYlI4ZSt6Z3dPMjZJdHRMZzl3bk9pa01j?=
 =?utf-8?B?OFdJQ3BWbE56QVM5UVh3NkpTV2dEeHpBM2lHcmZuUnhXTTRxK1lZRitudHFM?=
 =?utf-8?B?TjMrR1QxUHhST01YZnU0U25BODRoeDJnMTQrV1R2QnJZdXNVUUY2U0FUYTI2?=
 =?utf-8?B?azBiTnhRWDhKV3JIOE1sdlBnRTZLZHRzNDdOUUxtaDVnSVVHZEtwY2JVVnEx?=
 =?utf-8?B?aFJvL3ZORWRtQUNSdUlmTEVVSkZ2NHpRbWhKS2FjdlNiUGRDYzZKTThmbXBL?=
 =?utf-8?B?Vk5pOFA2dGNGS3VtVmg5ZmpVaUtjTUtjTGRVSjA0YTgyT0ZyL2tkWmdXQ0N5?=
 =?utf-8?B?R2p5SHhoc2F4VmZwcHJlenVSZksxM0QwYkJtcjVGV0dTRlpCVE9HTTJPTVE0?=
 =?utf-8?B?bFZORDZQWTEyUmVVTGc1ckFCMStuVG81TjdFZWxDZytpcmdZeFIxRXhhaTZB?=
 =?utf-8?B?M3JsdmRwOHh0cmZSeTc2ZUJCSFdRTVpBZE9jQkZwRFgyeTVRamduWS8vajlG?=
 =?utf-8?B?UVJFekVFOFd4YkFFb1V4ZU13MzU4YmRXWXFXWThlTGtwK3VFYTlBdzlxRW9V?=
 =?utf-8?B?citySWt0RmZlQUR2WUFVMldpbWxaTU05TGhrSjZrN2ovUkgyWk5OZTZjQytL?=
 =?utf-8?B?aUtSWG5ROTV1RVhYVmswaG5yL2VqSFp1dlZHWGgzV0RQT1kxTWV6NXFIOWxm?=
 =?utf-8?B?UTFjWldJTHB5Z2l5Yno4aW11a01VMWVlaDdSWC9xWW9nQXFFeTdVc210UERB?=
 =?utf-8?B?dzJFOTNtL2VtdkZycVRSZ2Q5cEFjdi9iMXdqZWthNGV0WkZ5YU9Sd2lWNVVs?=
 =?utf-8?Q?tJaY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:28:16.2803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a07d463-a3d5-4751-b54e-08de51ef351b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877

On Mon Jan 12, 2026 at 3:47 PM CET, Andrew Cooper wrote:
> On 12/01/2026 2:43 pm, Jan Beulich wrote:
>> On 12.01.2026 15:08, Alejandro Vallejo wrote:
>>> Debug builds stress the wrapping logic of the TLB clock by narrowing it
>>> down to 10 bits. This is inconvenient to test real time workloads on
>>> such builds.
>>>
>>> Add Kconfig option to be able to selectively use the non-stressed
>>> behaviour on debug.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> Hmm, yes, why not. However, ...
>>
>>> --- a/xen/arch/x86/flushtlb.c
>>> +++ b/xen/arch/x86/flushtlb.c
>>> @@ -20,11 +20,7 @@
>>>  #include <asm/spec_ctrl.h>
>>> =20
>>>  /* Debug builds: Wrap frequently to stress-test the wrap logic. */
>>> -#ifdef NDEBUG
>>> -#define WRAP_MASK (0xFFFFFFFFU)
>>> -#else
>>> -#define WRAP_MASK (0x000003FFU)
>>> -#endif
>>> +#define WRAP_MASK (IS_ENABLED(CONFIG_DEBUG_TLB_CLK) ? 0x3FFU : UINT32_=
MAX)
>> ... the comment then will want updating as well, I'd say. It doesn't go
>> terribly stale this way, but at least slightly. I'd suggest to minimally
>> drop "builds".

I left the comment because the rationale still holds. Dropping "builds" sou=
nds
good to me.

>
> I'm suggest just dropping WRAP_MASK.
>
> We've done this locally in the XenServer patchqueue since 2011 or so due
> to the overhead, and I don't think it's interesting enough to warrant a
> separate option.
>
> ~Andrew

I don't mind much either way. I need it gone for my needs and I don't care =
much
how it happens.

Jan + Roger, do you have strong opinions on the matter?

Cheers,
Alejandro


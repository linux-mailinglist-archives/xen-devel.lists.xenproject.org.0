Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DDDB5381C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 17:46:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120503.1465423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjV8-0001uM-6R; Thu, 11 Sep 2025 15:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120503.1465423; Thu, 11 Sep 2025 15:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjV8-0001sm-3e; Thu, 11 Sep 2025 15:46:22 +0000
Received: by outflank-mailman (input) for mailman id 1120503;
 Thu, 11 Sep 2025 15:46:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwjV5-0001sb-W7
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 15:46:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74896bad-8f26-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 17:46:18 +0200 (CEST)
Received: from BL1PR13CA0113.namprd13.prod.outlook.com (2603:10b6:208:2b9::28)
 by SA3PR12MB7781.namprd12.prod.outlook.com (2603:10b6:806:31a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:46:13 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:2b9:cafe::96) by BL1PR13CA0113.outlook.office365.com
 (2603:10b6:208:2b9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.8 via Frontend Transport; Thu,
 11 Sep 2025 15:46:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.0 via Frontend Transport; Thu, 11 Sep 2025 15:46:13 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 08:46:09 -0700
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
X-Inumbo-ID: 74896bad-8f26-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1u3LApDYszOTEma88lL46zxbHQhLkO0HRq583UzgeIfnMyRcPUFDYuS+UWUmfXvRsP15/WsAKJC+APpeoElUtM78X2j+YMAfQ/lJyYqi3hYpEUQCjEuy3/Cew2O3mIRgzTcnuLuMGXxIaXexVQQ2Qi8MaNZajFtH713XwUo+O/QUR4jmdT7EhuAKL81zzfa9I7HFIjBggmIPlhVTWt4FtF1/6NjDMdz8EuKGEfaU4oxnx08CRxQEi8rATyYGovX590zJOk1Shm+6KXI1ZY5dacx7e7pVAjwFPptplZqlXrNmgpC3+O7fyaS6pEJOQNAsB6K/uGxL41lpX+nLkllJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GKoceEeRTsg1YvJtSF0BHGnKeYr1esTx0wBbEOPykQ=;
 b=iCDBYxuQVOzEtH5rosJwVYxGPWPLurWk9z8E2usiuYo+mmB9qZAGQmlSilSI42bhbTPiE4mpmfjEAy/fDXqDVPyKIScxouvImVxRYB0eDBeJ8rU1WneC6DcwBpHxtxgAr+XZ21IhdnnRKDHEaN8adcrC6yM/33lOnMJdI12tYuFfGGe3TCYr07DBuIvxuDrYHo4IWjfgvtgV+MRieAi8CkkdR5C4GiPly4iwkq0Rl0Cb+cStRTsxCHgTY9OB1uVvO8cjW6SdfbqcKnJQPCKLcr7PU8vl6J7qv1PPvShTQMWytaO5d83lua2x0Mhs8mkqDNmqNh4C/qyHjPJodkKa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GKoceEeRTsg1YvJtSF0BHGnKeYr1esTx0wBbEOPykQ=;
 b=ns+9JQ6EhZONsehp0bH8BWZGlT79oOazrzG8+WZ0ddmlSdKbwhC8YvmIh0YwORChkiBbQ+lbm7rfv50cEjZTqHJKTLEHtQdALKFi0JWNSA7Rv2bLNxJcHARg6jl0FY01523E88XPtzaq7tzblb+dZDBEYZWGuEhIUZXJb+Uh++g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Sep 2025 17:46:08 +0200
Message-ID: <DCQ36BD5H3WJ.3HQWZERCZS2JD@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: domU reboot claim failed
X-Mailer: aerc 0.20.1
References: <fae4b58f-c6ff-4db1-8198-1a5f76868d4d@amd.com>
 <d81b0c13-853e-479a-ad11-9b9990b723a3@citrix.com>
 <dfed2c2a-f4b7-4efe-bb1e-c5173c1fe531@suse.com>
In-Reply-To: <dfed2c2a-f4b7-4efe-bb1e-c5173c1fe531@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|SA3PR12MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 301d1f7b-331d-4500-e19a-08ddf14a566b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXV2OStzVlE5VW9uelFoV1pockRLcktqVm1xamFLRUp6WEdBUjdaMGd3VGxh?=
 =?utf-8?B?Q0Q1SVk4NkRJbkZRY29zMU0reU9WSkZSd2pkVW9xYm44SEYxK3hLUDIyc2dr?=
 =?utf-8?B?d2VqTENHendxRk0zS2VFWnA5RmlRVlNTZEp2R091WHQ5NHR4S1R2YkRlanRK?=
 =?utf-8?B?SitUQndlMjF5a0JZanNjbnlEelhQWWdRK0thSkhIRENKbWhsSEUvSXJPaWZ5?=
 =?utf-8?B?NEVYZU9CVlRIUFVTYzlGQjkyZ2NVL1NMN3UvVVhnU3lxb2JHNGw4OGpOT0NQ?=
 =?utf-8?B?Qk5VOEVNczAyZXQ2QlNXdHkwQUIySUgxRG1BbFBGTHp1R3o4Y0p4ZEZaTDZW?=
 =?utf-8?B?Z3ZCd2hiTnoxdXh4M1ZtcTNSeGpGUXgxTlpTNDM2cnkwOXdHeXZSWXZwdU9R?=
 =?utf-8?B?VkVLdjVvOVhwSStZMjFxN1NDdjVTK1JtcUh1bWpQNzUzMEJsazRSbUdmdzg5?=
 =?utf-8?B?Nmt5V3lZQ1hSbGs4QVJvRkdPZHdTOHhSWDF0S2pBOXF2LzhFNlIxU3hjaEtv?=
 =?utf-8?B?aUhVWFo4VkZJaEU0R2ZJSm81ZTdpTHpZVnp4aTJtWkEzeUVBcVNvVWpwOWp6?=
 =?utf-8?B?VkIvdnZubmNDR3NseUFKc0RheDFpYzIzVkZtUy9SOWNYYU5td2JZcUcwVWJT?=
 =?utf-8?B?ZndHUW5YKzMvczRGbzB3MGRiNHk5bXdzYkZqd3cwc28yK1Z6RVBSREpZNXMv?=
 =?utf-8?B?dlh0UnMwZWczREZPVDVETHBndFUwNk5OMWd1MFFablBVQXVyM0RPNDBlU3Rt?=
 =?utf-8?B?aEYrVmhmTzdhRG1iSklncXNkNEFZQnRYWThDSGIzY2piaDZuL3JPZWRSdXhk?=
 =?utf-8?B?ZWVnOVA4NVgvblZla29jQUU0b3RzZVREU2E0Z2k1OWhlZStWd2ZyWEE2cWg2?=
 =?utf-8?B?bGtndnUrSjVEYk1MRUo3aHZIeXk5OWZjNDc1MEN2d21ITTZQN0c3a0FqRHNX?=
 =?utf-8?B?SzErNFZJOXlKN1FETVh1MW85b0xPS2tUOEN3Nll6VkltYU11aEFlZWU4dk93?=
 =?utf-8?B?Ym8rU2xiYTBpU2IrTDZMSWxmbXdIUUV2ZVg0eGVOYW1oL0NjRjdCVGVPc2hs?=
 =?utf-8?B?dlNwYW9HUk1BSkd2amtFaTJseTRWcDVsSWdjOFNMcmpxTVBWNktBcjJGU1dX?=
 =?utf-8?B?WHdSTWpVblJ6bE9SRlQ5a1h4SUtCTmZLTkRYMHp6ck1wYWpUUFNvNTE4eEcz?=
 =?utf-8?B?MjZTRGdmQkZSbVRkTmdyazBTTDNLcXN4cEg0dUZVclZaQ210RHV2czE1TDFN?=
 =?utf-8?B?WmVrMlJXbVVwV1ZocUNFU3RQbHY1OFpSYVlJc2wwN3IybDlhdnNJM1ZnNDlH?=
 =?utf-8?B?dnFBc0pETVd1Y0VMUWIweUdoL0ZnNHhpUEl1eGNCaUtScDRrR2tkOEhoMlZM?=
 =?utf-8?B?ckQvWVRGbDdPcldlTkt0Nmo3NUFtTXNiUzVMVlNOcy9QVUVyNU1aTTB3OFJ2?=
 =?utf-8?B?Vm1oek1SNTIxWitQclIva3ZaZ3JvZWZBcnZsWGlDbVMzV01yajRtMGxQVHBV?=
 =?utf-8?B?WFJFb3VXSk1mdW1YeFJvZ0RoQjJRRWVha1BOajlKZ0hFcVVXZXpUeW5penlq?=
 =?utf-8?B?ZzVuaFFrdDJ0SkU3Vm1CQlFXcUJoTTI0RmI5MmV3M21pTXZXMmlWYUEydWI3?=
 =?utf-8?B?N0NyZzEyazdrT3pIRHR4ek9yMXJBeElqb2tUYU9iYUx5bCt2elhFL3dXUjdF?=
 =?utf-8?B?Q0hsMWFxb3NaSGRaNVZZbml3eEprUlQ2OEVzMEh0Rk1hZzV1RExCNFJTRExp?=
 =?utf-8?B?aGp4NXV4Y0tmcVpHMW5GU1ZXWVZSbkNLcmFsOWRKRUxuWGZQUlgvNGdvdTJY?=
 =?utf-8?B?eXlKSTY0MkxmMzFIQ1FkdW1PVlp6NW1najcxS2huNiszWm02RE5wN3FwbGFy?=
 =?utf-8?B?Rm53clhncDFBaXVMYkdVMUpoQTI0aTJHcDFjZGJ6d1JkQTV4TWFSRlJwRE1q?=
 =?utf-8?B?NWRWWjQ3Q2Y0dVlRQkVyN3MrVndoU1dWQlY5c0ljYmxEc3RYUElLMDczMEJK?=
 =?utf-8?B?MXRlY3pZSnRGTEcwd3VYRkVGVEVoNWRFYXIrTWtHZzN0MjJUaXpvUTMxaVNV?=
 =?utf-8?Q?IEzF01?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 15:46:13.5843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 301d1f7b-331d-4500-e19a-08ddf14a566b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7781

On Thu Sep 11, 2025 at 9:55 AM CEST, Jan Beulich wrote:
> On 10.09.2025 23:57, Andrew Cooper wrote:
>> On 10/09/2025 7:58 pm, Jason Andryuk wrote:
>>> Hi,
>>>
>>> We're running Android as a guest and it's running the Compatibility
>>> Test Suite.=C2=A0 During the CTS, the Android domU is rebooted multiple=
 times.
>>>
>>> In the middle of the CTS, we've seen reboot fail.=C2=A0 xl -vvv shows:
>>> domainbuilder: detail: Could not allocate memory for HVM guest as we
>>> cannot claim memory!
>>> xc: error: panic: xg_dom_boot.c:119: xc_dom_boot_mem_init: can't
>>> allocate low memory for domain: Out of memory
>>> libxl: error: libxl_dom.c:581:libxl__build_dom: xc_dom_boot_mem_init
>>> failed: Cannot allocate memory
>>> domainbuilder: detail: xc_dom_release: called
>>>
>>> So the claim failed.=C2=A0 The system has enough memory since we're jus=
t
>>> rebooting the same VM.=C2=A0 As a work around, I added sleep(1) + retry=
,
>>> which works.
>>>
>>> The curious part is the memory allocation.=C2=A0 For d2 to d5, we have:
>>> domainbuilder: detail: range: start=3D0x0 end=3D0xf0000000
>>> domainbuilder: detail: range: start=3D0x100000000 end=3D0x1af000000
>>> xc: detail: PHYSICAL MEMORY ALLOCATION:
>>> xc: detail:=C2=A0=C2=A0 4KB PAGES: 0x0000000000000000
>>> xc: detail:=C2=A0=C2=A0 2MB PAGES: 0x00000000000006f8
>>> xc: detail:=C2=A0=C2=A0 1GB PAGES: 0x0000000000000003
>>>
>>> But when we have to retry the claim for d6, there are no 1GB pages used=
:
>>> domainbuilder: detail: range: start=3D0x0 end=3D0xf0000000
>>> domainbuilder: detail: range: start=3D0x100000000 end=3D0x1af000000
>>> domainbuilder: detail: HVM claim failed! attempt 0
>>> xc: detail: PHYSICAL MEMORY ALLOCATION:
>>> xc: detail:=C2=A0=C2=A0 4KB PAGES: 0x0000000000002800
>>> xc: detail:=C2=A0=C2=A0 2MB PAGES: 0x0000000000000ce4
>>> xc: detail:=C2=A0=C2=A0 1GB PAGES: 0x0000000000000000
>>>
>>> But subsequent reboots for d7 and d8 go back to using 1GB pages.
>>>
>>> Does the change in memory allocation stick out to anyone?
>>>
>>> Unfortunately, I don't have insight into what the failing test is doing=
.
>>>
>>> Xen doesn't seem set up to track the claim across reboot.=C2=A0 Retryin=
g
>>> the claim works in our scenario since we have a controlled configuratio=
n.
>>=20
>> This looks to me like a known phenomenon.=C2=A0 Ages back, a change was =
made
>> in how Xen scrubs memory, from being synchronous in domain_kill(), to
>> being asynchronous in the idle loop.
>>=20
>> The consequence being that, on an idle system, you can shutdown and
>> reboot the domain faster, but on a busy system you end up trying to
>> allocate the new domain while memory from the old domain is still dirty.
>>=20
>> It is a classic example of a false optimisation, which looks great on an
>> idle system only because the idle CPUs are swallowing the work.
>
> I wouldn't call this a "false optimization", but rather one ...
>
>> This impacts the ability to find a 1G aligned block of free memory to
>> allocate a superpage with, and by the sounds of it, claims (which
>> predate this behaviour change) aren't aware of the "to be scrubbed"
>> queue and fail instead.
>
> ... which isn't sufficiently integrated with the rest of the allocator.
>
> Jan

That'd depend on the threat model. At the very least there ought to be a
Kconfig knob to control it. You can't really tell a customer "your data is
gone from our systems" unless it really is gone. I'm guessing part of the
rationale was speeding up the obnoxiously slow destroydomain, since it hogs
a dom0 vCPU until it's done and it can take many minutes in large domains.

IOW: It's a nice optimisation, but there's multiple use cases for specifica=
lly
not wanting something like that.

Cheers,
Alejandro


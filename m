Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNZxB2X8FmrwzwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:15:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8579C5E5B3C
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320570.1587853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSF1v-000422-QR; Wed, 27 May 2026 14:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320570.1587853; Wed, 27 May 2026 14:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSF1v-00040o-Mr; Wed, 27 May 2026 14:14:43 +0000
Received: by outflank-mailman (input) for mailman id 1320570;
 Wed, 27 May 2026 14:14:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wSF1u-00040i-4k
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:14:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSF1t-00GZHV-HB
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:14:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a16fc3a-2eae-0a2a0a5409dd-0a2a4508e8e6-40
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:14:41 +0200
Received: from [52.101.48.56]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a16fc4f-63b5-0a2a45080019-3465303889a2-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:14:40 +0200
Received: from BYAPR21CA0029.namprd21.prod.outlook.com (2603:10b6:a03:114::39)
 by MN6PR12MB8472.namprd12.prod.outlook.com (2603:10b6:208:46c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 14:14:31 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::23) by BYAPR21CA0029.outlook.office365.com
 (2603:10b6:a03:114::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.4 via Frontend Transport; Wed, 27
 May 2026 14:14:30 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:14:30 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:14:29 -0500
Received: from [172.31.156.136] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 27 May 2026 09:14:29 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWYclCbgnES2Ko9fRmvDo62iGnaf7jfT6H6jktxauxZKadP9YW7zgyVPV8Hma/wWf0UUij1hRMfLtSQWi2KOK40d2cSf171ypP+fq05X0Qh9mkfEzWUj29at4gSxpyipW5YP06lyZpoTbCQvTn84vbuJ0rOr4NhIErozpgquhHKqvVhvNS/Nu6e7t7zR0wRAdk32Ex8L9gAgYpAvAbUT7TDxB8BPVrC9r9P/Yy+iiCNHHsQAt6834Gj5UHgnJbMm5vgxWThB8teLbJNcTmTozl7/NXPrCXxAVzgUeP06OOnnHhPKcP6/i3WOYXFQSLgOUPuFWBe70EOxwc2y6ez2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuFhUof84GP/1a8JT8QuET5mRZd6DQe5yo+wRAnKNSE=;
 b=JODORFG9g4pwbAJ7S4F9MDGAmJA2d7cUwRs+MCkUiGT0usSKpt4mk2SJX8msmVR3h51kNluv+NqcxcnqidhWiEy4NPHmg81Jj6VFHp3cthgePBtzlGpciZk/RpDYReUVVY/lmwfOZUW9eoqrMwqrnPm7evIyIwwg0Z/3wI8K6U9Psdb0vs3aKrOH1gTF342TMRESzWl59AUrLDFvw/BdpsDCW13oyy43lQ6eUqvxbG1YaZ7e1nx+Fm9FgOCBoZWlti71fA7y3MUtbm5/ONoKWuxUfRSu3pW9bDW9wjqAbAY8aWa5oPLGDhGShyqZ6knG3C/PCeWmcBku3nutnZ97Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuFhUof84GP/1a8JT8QuET5mRZd6DQe5yo+wRAnKNSE=;
 b=GkF7fQ67BpDjEjyPcaKCI9HgdUX8/hddrJkCcu0emTVUCmS+Y0jgVh0Oq/L1aDKJl3vPEfzb2JUYEdYFScySyVnM5HHAr/WOrJGc/1UB7H+FkYx8RyxoeU/P73eHnOXSU6K5qKChauO7szNAeHiHrZevOc5m6SR1iIyH0rx2iHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b3e58f3a-ec2a-4a91-a947-9900c00715ee@amd.com>
Date: Wed, 27 May 2026 10:14:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Change stub page freeing to fix smt=0
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260526203114.40882-1-jason.andryuk@amd.com>
 <7a0f7653-a299-4ead-af6c-944b8ffbb73d@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <7a0f7653-a299-4ead-af6c-944b8ffbb73d@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|MN6PR12MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: a424e0bf-a82f-4333-6181-08debbfa44d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|4143699003|56012099006|11063799006|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	waLhSXxpSHwpAAhkPCGSF8+tR2z2dqMXJBUGMIU5th3aHL0Ng3tJicHq2knAnUvT90xrl5TnIV+Vih/NlguOAUo1JzfbMF/7tqZD34zh7H4g92jlO9UXmSfeoXYe1NyJseNe0kClYywWORjV8LRfClmVx3Sre2cvgjfv6GqqbpYVJEOj3MXAEO5TmPCI9VyBgHqw6+/hEXreHMC7RhrOd/vNOJS6FwRgDfvG3T7Z38sEAYQRetZ2hwBwncO5i44aa3e3ZBMXvTnd2rb9EPl3Z/5JwfID8mL7OsZLVlKyLO2w3CcW3liUbmE0yYcNX3p2yrJWecdDfJovkHOniWEmq28DC/E133NQ57MMLik38lFnkBWYT0bqdp0Hmdq4Y3z6BR/OkUFu5PP4Y8fVtUHObsiNBFyUFBDmicb99TmMpm4n5Hkn4/t7g25KSqPisaBViBlpVm0kk+jCOxrRxGHVMvCrOb2Wdu7IaRbiP+of62f8GPTuw/t01hZmK59a9z9DJoq5l5Y0jn33XSNoR/gB+s6CqVqnLUJ+G8EO0wW5RHQYLasTp8lu6ZSbjRZRJggJqKaR3ffNOHnl/vWNS3a60NyHG2KyUDMrgV+kXPhCjfR0/YiXQTZh6N+7M4ionDEFhLyRe7jvitaIkXcSKuzv+Y2G5X8ipATTN1ynDeisYuMi7t4JlR6nLAStmzYOZUgSANws5+vTpqIkDXeL+mKea9YR9rfxcqdWqAIto3nOT1s=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CLZdttmxKNVDR45KOMIhpu+KAj67yu1aKyDJAxI/plDtKUmP8hWzT09MexgkxTR3o2xwViCo706S1pcN1q8Rb5YHYaINMWarb/xTYdIKzOvuk5Qtid6knCvtplz7jkaw++aIp5F4pHaW8KTvfT2eGhF7H6a6PN1kuUevFzEs1CFacwR/a7oc9l9oqEmJYy/2T+McADZvX6W89cOlYi12rJKFuFcCItGIIJ4T8ftKrZ5OFQUQCJWlH0fbcvIhvsyeL3kNF41Liujng0uvukiEhIRU30JCMesUFR61c3OS2jD3TB/kFoIMGu7RzqYHJ2g4Id8awiUfvFZY1Fe/NMd7y5PJiHVOB0nwX6O9PzOv+vkv8PQ6QKKO1NUbUgQ9831my6/2ZC00dV1IK5n4R8p1JJPZIcaTIkkbm/LXevsE6FXk/302Su1+bcF5IMnOlLax
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:14:30.3040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a424e0bf-a82f-4333-6181-08debbfa44d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8472
X-purgate-ID: tlsNG-c1860d/1779891281-BED73DB1-31A7EC3F/0/0
X-purgate-type: clean
X-purgate-size: 4784
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 8579C5E5B3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-26 18:03, Andrew Cooper wrote:
> On 26/05/2026 9:31 pm, Jason Andryuk wrote:
>> A single stubs page is initialized with 0xcc and re-used, with multiple
>> CPUs each using a portion of the shared page.  In cpu_smpboot_free(),
>> each stubs area is checked against 0xcc.  When all are set to 0xcc, the
>> page is freed.
>>
>> Booting a system with smt=0, CPU0 is initially setup, allocating the
>> stubs page and initializing to 0xcc.  When more CPUs are brought up,
>> CPU1 is initialized and then immediately brough offline as it is the
>> sibling of CPU0.  Since the page was initially memset with 0xcc,
>> cpu_smpboot_free() finds all stubs as 0xcc and frees the page.
>> However, the page is still assigned to CPU0 and continues to be assigned
>> to other CPUs.
> 
> It's more complicated than this.
> 
> With CONFIG_PV (and !opt_fred in 4.22 which is perhaps newer than you're
> testing), the LSTAR and CSTAR stubs guarantee that the 0xcc's are
> overwritten with real instructions.
> 
> In !CONFIG_PV, the 0xcc's only get overwritten by the exception recovery
> selftests (CPU0 only, and gated on CONFIG_SELF_TESTS), and "complicated"
> instructions in the emulator (which in your safety environment, you
> likely have compiled out).
> 
> So, in your environment, I think you probably can exclude the stubs
> entirely and trim even more LoC.

Thanks.  Ok, my build was !CONFIG_PV, so 0xcc's were not overwritten. 
The fault happened before the self tests ran.

>>
>> Meanwhile the page can be reallocated, which can lead to misbehavior.
>> The particular instance was the stubs page re-used as a page table which
>> later faulted when the entry was all 0xcc.
>>
>> Change to initializing the page as 0xd6/STUB_BUF_FREE, and initializing
>> individual stubs as 0xcc/STUB_BUF_USED.  0xd6 now indicates unused, and
>> 0xcc indicates used/assigned.  When freeing a CPU, the stub is set to
>> 0xd6, and the page is freed if all stubs are 0xd6.  Initializing with
>> STUB_BUF_FREE lets cpu_smpboot_free() a page that was only ever
>> partially used.
>>
>> 0xd6/UDB is a 1 byte invalid opcode, which is similar to the existing
>> use of 0xcc.  0xd6 is used to identify bug frames, but the stub addr
>> (e.g. 0xffff82d07fffe000) fails the is_active_kernel_text() check.  It
>> should be okay to use here.
>>
>> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> It would be nice to use get_page()/put_page() to let count_info handle
>> reference counting, but they require an owning domain.
>>
>> The listed Fixes introduced the use of 0xcc, but the smt commit may have
>> made it more problematic.
>> Fixes: d8f974f1a646 ("x86: command line option to avoid use of secondary hyper-threads")
> 
> Honestly, I dislike all of this "try to free data for going-offline
> CPUs".  It is both complex and a non-stop source of bugs for tantamount
> to 0 benefit.
> 
> On x86, we must boot all CPUs we find in the MADT.  You're seeing this
> behaviour already.  This is because if an #MC hits any group of CPUs
> where any CR4.MCE=0, it's an instant reset.
> 
> For this reason, firmware doesn't hand APs over to the OS in the
> Wait-for-SIPI state (which resets CR4 to 0); they're in MWAIT or IO-wait
> typically these days, using firmware provided stacks.  But firmware
> cannot handle an #MC intended for the OS, so the OS must set up stacks
> and at least an NMI and #MC handler even for those CPUs not wanting to run.
> 
> This what park_offline_cpus is trying to do, and while it's set for
> Intel and clear for AMD, I'm pretty sure this is a bug on AMD because
> you can still get MCEs with core-scope groups.
> 
> 
> Beyond that,  smt=0 is an emergency bodge for speculation safety, which
> is always better done by changing SMT settings in the firmware.

I was asked to check something with SMT disabled, and I could not find 
SMT in my firmware.  I looked for a while without success, and then set 
smt=0 :/

> xen-hptool is useful for testing but it's not a thing anyone uses in a
> production system.
> 
> ACPI CPU hot-add does exist in virtual environments, but hot-remove is
> theoretical at best.  I've not seen any evidence of ACPI hotplug
> actually working on Xen, and I think the chances that it does are slim;
> it requires AML execution, and is right in the middle of the split-brain
> problem with physical vs virtual details that dom0 suffers.
> 
> 
> So, lets just allocate the stubs and "leak" them in testing scenarios.
> It removes bugs and removes code, and has no effect on well-configured
> systems (where cpu offline is not used in practice).

Ok.

Thanks,
Jason


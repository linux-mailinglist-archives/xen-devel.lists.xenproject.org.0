Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKRiC/f0HWqegAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 23:09:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857A26257D2
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 23:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324120.1589779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU9re-0007HJ-37; Mon, 01 Jun 2026 21:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324120.1589779; Mon, 01 Jun 2026 21:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU9rd-0007Fj-U6; Mon, 01 Jun 2026 21:08:01 +0000
Received: by outflank-mailman (input) for mailman id 1324120;
 Mon, 01 Jun 2026 21:08:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wU9rd-0007Fd-3b
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 21:08:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU9rc-001CZl-6I
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 23:08:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a1df44d-2eae-0a2a0a5409dd-0a2a450ad540-48
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 23:07:59 +0200
Received: from [40.93.194.53]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a1df4ad-56b3-0a2a450a0019-285dc2357192-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 23:07:59 +0200
Received: from PH7P220CA0101.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::17)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 21:07:54 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:510:32d:cafe::8a) by PH7P220CA0101.outlook.office365.com
 (2603:10b6:510:32d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 21:07:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 21:07:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 16:07:53 -0500
Received: from [172.18.181.126] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 1 Jun 2026 16:07:52 -0500
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
 b=BoRnRn2X83y487A3gNon78krqexsPBJyAb5cm4x/OYyY7Ti/i71x1ypRoG+ky2TXOLB5XJPyfxniD8TKO1CHZ+HDip6Ayp5vRlyrE+NSxLBDVqFx2Fj4DoN33v3jtKiV7QQwCu7L7GnceVYkR9b7NJHN88xJvhb8viTqqMH43Yi6iWBN3I7sDR2WyWwA1+MPCeOpdujSd13L6mGgVH71JzHsZlQ5B1Pr55GGRR5+jYhG2ilXaFsxo3z9QsCR6koWgU7CdFyzr7zMhgmtPH8X6mazgOwOMpi7T6CTz8NugYHcBnK8P07ZDdhSLf7aayQkdSKloL51dFxrmboDynKWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG9W2e5jgQUBQAJLZL/4kduVWRVloyFkEdOR1JN+kME=;
 b=Dm8h2x44fkE1yec6fyoSNsaNsVdN3bj+4oct9YzoGNG8Y0pBn5j0OJJ0FAfxa/6t5wi7Xj0g3zjPKDD72y2MffA0PCjvORGaHtfm/ut8SEWn6jQsQt+wvj/WnZ8nHyNXrt3wAUHLw7GuP5tT1HKLUmtS4Non4IrKL3YON32XcytZa4kYWvmEkGje02j5Cj7O02oWgVWCUUJRDHsk3fW8ssy9oFXh+07XsNZgYE2oUgNqkhQqb0kWQUF9R5Uhy/oMz2z8e9qQxSegjNCInq/D1NR7mgb2TgClaUDDmytJjlDf/kENtvYTgBFUkwDvs+S/c4aBl3fr+T5tGll2SIj8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hG9W2e5jgQUBQAJLZL/4kduVWRVloyFkEdOR1JN+kME=;
 b=Vm9ypva4CVWKHvFkkzGzMurCLL4mvcNdF7lYk33jW4MeqnUeb9uU4LSp23sOYDFvzpdVsiWDwRIOzlNTLT0VkTLK7RmOFPz0kqq+JywnFvD1KKlWUdlZMZlBWv9B4vf1AhVJVrFNCNUAaKG+cnHG1RP4HZNPCkF/t243gOam1NE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <5cdfca65-50f8-487a-a146-86e1a68f459c@amd.com>
Date: Mon, 1 Jun 2026 17:07:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Change stub page freeing to fix smt=0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260526203114.40882-1-jason.andryuk@amd.com>
 <ah26nl95MgqhPPAi@macbook.local>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ah26nl95MgqhPPAi@macbook.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: bca5ad0b-f635-47dd-36fd-08dec021d8f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gbo+YLs6SWlqfSCRVO6AB3g+VrUq8U93MzLqOF2mIZxA8zw01jN6cEsz8LizrSFlGvfS2yS82yqnhIH46iK0V6mNX5h/odZu0SrqpTC3/0n20wZq6grHGmmbTV3iVwE26IfQ9A4hyt270XggKdmsnK9p+Fn7sK4S7/xawPsIFgCdTKfKUoMyOao4Jo2yxfb4OzewQ67beUISlL9bONVU7t6Zg6J3H6cdZuu5u97EyJj2+TejyGKbTTlKMujmgb6eUhdAsRqKiGD7OaSN88e5GjB4G7ELwSebw29fmqNfyFYejHt3bVceVyEhMktwrTHZAQvGchoU0kP+Mub338iXvcdPUFC35CK9RPzFTDlmnyQVUk7KysZc1/T1lhhnyTQsCfYil5toyHdf92O+L7L1xpmEK4c84uQz0eA9NEjmrl3mbY7hWP7okMLL58cENLuLw87zQ4pCrXVJd2L/cVAY2fQNppTGN35dn3PgTAZl71FBWRMVaSaMq7G15dUy1pUsfhFjxxA8g4Yp1wyeLy+dbnpPDQiwU2rqk9Kj/om5beeDohP7yJd4Si+Hl5NLP/R6v2G4tqHgsd6x0ZGp5xiHpI4oy7/mPWKWWwTzJUnOONEbFEaWlNo7u3eiPJPymaiFpUGTu0CUOdYrZ8ELlHj6DytW7CWE2z+UOtqHVRuA5J7DzGfgIht/6CPi3/gypB/5UOyIO1vp/LVLXem24RjX3NJM2t7sl1kxs3IArAoUBg4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V9z7hUfxoT/hDB88+DsyRGfnpk3meZAACjBRZLcRCqN0S7DGosO/Jw28P4qadO6AYGw7A15vLuc3IOrV7c0unsQCZufoeyVJoHd0wZMJ2mkCp32I/ZaHCTYIKLBFTlQza0JmyQXrBxDfCBoQnIRFH3JK9LzZSwvgB61A0CM8A/glB60hodNh80/hAtHPHn2JZ44wv13lFDlEmhxuAnbVq5di8dnpy4cK2L+Qq2lYuLP+1hqok4z3DleLOvZ7NURKxxzPwmiVu51DZbznfv8Ac5LJUDwQFHwiR/VG38m72+O5LtoM2CKnqgkANNKWKqfPqQCP7Z+afQKOjGKB2+te3NCjFlttq6rnM+NJnCJ796FsDdo1ZENoRabz1ECKj9SJNQaILcOQ/uihRaBQxt9Sjx+OZeQ+6q8HZKExUzugjVNfMp2dEEtSh5D3HGF2QTKA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 21:07:53.9245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bca5ad0b-f635-47dd-36fd-08dec021d8f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018
X-purgate-ID: tlsNG-4011c0/1780348079-7C8788B7-BFC69298/0/0
X-purgate-type: clean
X-purgate-size: 4034
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 857A26257D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-06-01 13:00, Roger Pau Monné wrote:
> On Tue, May 26, 2026 at 04:31:14PM -0400, Jason Andryuk wrote:
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
> Speaking with Andrew, we believe it might be easier to simply forego
> the freeing of the page, possibly something like:
> 
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index ff05955bae40..62c6cbf4b561 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -990,19 +990,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>       {
>           mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
>           unsigned char *stub_page = map_domain_page(mfn);
> -        unsigned int i;
>   
>           memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
> -        for ( i = 0; i < STUBS_PER_PAGE; ++i )
> -            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
> -                break;
>           unmap_domain_page(stub_page);
>           destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
>                                (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
>           per_cpu(stubs.addr, cpu) = 0;
> -        per_cpu(stubs.mfn, cpu) = 0;
> -        if ( i == STUBS_PER_PAGE )
> -            free_domheap_page(mfn_to_page(mfn));
>       }
>   
>       if ( IS_ENABLED(CONFIG_PV32) )
> 
> (there might be further cleanup possible if the page is not freed, the
> above chunk is untested).
> 
> It's a single page shared between 32 CPUs, and offlining 32 adjacent
> CPUs seems very unlikely.  IMO the extra complexity of having to deal
> with the freeing overshadows the very small memory gain we get from
> it.

Hi Roger,

Yes, I made and tested the same change locally last week.  Well, I retained:
      per_cpu(stubs.mfn, cpu) = 0;

Maybe it would be good to save the mfn in case the CPU returns?  But I 
thought per-cpu vars are cleared, so it wouldn't be available anyway?

Also, I was waiting to see if anyone chimed in with other ideas.

Thanks,
Jason


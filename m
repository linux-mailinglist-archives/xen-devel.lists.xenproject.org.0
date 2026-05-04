Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNpKHkix+GkdzAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:46:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97394BFFC6
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300009.1574569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuYr-000065-IZ; Mon, 04 May 2026 14:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300009.1574569; Mon, 04 May 2026 14:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuYr-0008Uf-Fg; Mon, 04 May 2026 14:46:17 +0000
Received: by outflank-mailman (input) for mailman id 1300009;
 Mon, 04 May 2026 14:46:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wJuYq-0008UZ-8j
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:46:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJuYp-00DGL1-Aa
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:46:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f8b12e-5cb7-0a2a0a5109dd-0a2a4506afba-14
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:46:14 +0200
Received: from [40.93.194.19]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f8b135-7371-0a2a45060019-285dc213695f-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:46:14 +0200
Received: from BN9PR03CA0724.namprd03.prod.outlook.com (2603:10b6:408:110::9)
 by DS0PR12MB6437.namprd12.prod.outlook.com (2603:10b6:8:cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 14:46:09 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::fd) by BN9PR03CA0724.outlook.office365.com
 (2603:10b6:408:110::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 14:46:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 14:46:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 4 May
 2026 09:46:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 May
 2026 09:46:08 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 4 May 2026 09:46:07 -0500
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
 b=rBhcClR3tBuLLoUIFt7oy/K5FGNSppWFTMQegJZmL0mtwad23n8knUPchYzs/BFlp3YAyA/zL0lKfuG+sIk/LfJnWsfetZRE0HHOpj0bmYLTttTvLWyH2CZlGK4ajztQNdvrH0MTMmEVT/aqYW0Y0uLCsMmIfaG/ibq/eXAb2e1NcGSxWmtB31qz7Tb9A5iY4NtUjqxfVnwsRXi+xsknzx7FbzckUsMXQZfARexQvGXe4iA4is+N5ML5BKHkXEw0ElQsjQ69890svJMcxgtFl/cFRj0avy2/E/5L6MpUpfQb6wEAK5ko7OHiJJXKr0RUsR1sQpUT3be+nzq/qcaaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeu0C7yFDtU2qsVJ6OUoEtzQRQj/QaIlxDJII66T0r4=;
 b=ebgSUc+xi6E1uBlGS7seUTgK4xUfA12AX2XI5kROF+kes5vMMZAEpANkMmZvCRrHGMQRjlA+E31BnRseCQo4+hU0fzgbaLzd7Fb6nsWxT4Dd8SVax3cH17mMzOU1+Qe9NchlNVxbElcVWE94MkFK4A+regiFWWQQ5Xo3Uf8UNJTV3VFolOAmtX85Fe6uqSChX4cBnaCRG7KMgEvQwzHBEj1N3+oCTSVsHvc8YN6F4zEEg0vrfxQgg8MTb4h4SdSFGFsrWLBQIMYQnXA9aGk6hI+YTzou8wxprPbPrq/KW2zhUbBZ+kAo66cOEoXJpBdhr+vRlXns7bFw3FhMizWKTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeu0C7yFDtU2qsVJ6OUoEtzQRQj/QaIlxDJII66T0r4=;
 b=LOHjMMQsfiVlfxWQK12EXIYld1UD6jKb6eu/TC+QTcNjJu2bTDl0kwGgT0G9CobR07JX8PY3oQUmHzbxcQ/VCjq+v6WRBjZmHXT4DWytZJLV17t6V6wMp8HSPuhLk1fghwvZ9jz27xZvaB0JhkYTqR7HUasbwf/xoeCT36LEa1Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <934afe1f-a55f-4335-ad2e-98346ea8b19a@amd.com>
Date: Mon, 4 May 2026 16:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/arm: skip holes in physical address space when
 setting up frametable
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-3-michal.orzel@amd.com>
 <42E57541-C0A9-4E19-A8F1-825E83A856DB@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <42E57541-C0A9-4E19-A8F1-825E83A856DB@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|DS0PR12MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4f9662-684e-4f04-d367-08dea9ebe0f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8RzDGTR7lxs4ufwP0ci8FRHKWNv9tOJGoNFcRq7NnD4JjDg4KIS+2+HTMLSsvHNjomqwpjakh6kLhlTYyLNWjHUi38hfgU9/HGo3pgZ2aGmKwTrk0IpQt4KW+EuvP5xtpaDFckl357VwG7XIDUEXvH65gh9pn/o8m5VGLaTe9gTdkj9aKQLYcKUeyyysm+W+Mxle6/PqejHRwIIMG2Ksek+zMVH6mcjD1EVU44c9XlOuOfdHPe2QgP/MQxruzsUqaTPmaHTLhwfpj2IkxD4DVrbvXYQgBwqTQIU9yhb3a9yJqLX4jGZY6NM9Vfd1FB3Ki4CfOZ4NDpMfz7URvDg5HkFba5Do+sKhJ6p7rn92cGOA4L++lPcLmFxwk/IblDIiqegUO9atMgDC/f0Juz42qMy/ziLy0aCWEU4puMa6wKVnzAxz7k7riKRYFvQ11JIZRycP6ewW1jF9sYB2raOeHjH/9UowuGbuD/Bltl9kVciQxtrMB6HwBkb+seQB/UtgAJp5HkU8zTcQqFvaNF6AETW7eCZqymL21uNNI/T9DOukgOIkICQiQW8qvh9rddldFw8L80xJv1qq/fFXFFXEZBZGgqpVuZDbz5AFLI8+E5YQ+cwZva45xI5gcC7jivyQgD/luOAMgoQn7HlV6wGaN0oc+JFKPef3iLiYdNj+QLcXC3hPQAi4eMl078EJ9riUdQyFToQjj2keGo/QHNaUM9Z662ajv+8MGbk4JEPgg1c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iG+SeXs4jwddpmtMADlwJgEVHHv6YdgtE2PfDpsUlaEowPlaqMDibq7/ju6RNqN/W1DO86oW3UirSogBl3dik0NyuObOeexg1TrxjuZOjJhDHhobp3S5VZT0udl+bQD7lpfr6e64M4dF/XGJeT1pqdeoxNdF0VuJ4DengxlQCL5bVWwMyHm+C0DKO3CCmtOoBEgplLavXYvM8NUJdWqwXASeG07xbTOPLNKUTkjtnxXJKW0B7SeWoyCAbccKNDmUIO3pr3afXsdqXmF6r4zoNnDkcwpEOsWgnqf9N0f4iRIeY+LFW9HO5dFPAYrk9+bjFTajGQHM13oY6+h3DTRwDUYeYGxA5N1X/fJA4knwf0XRYcAlSMBD3pSZmTHe7Xp/+wzdlG/Lb86EoASu4lH8K7BMNJPzXGMwNSu9jI5+AN3aH3atJBSi8g1P8HEdE2rA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 14:46:08.9427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4f9662-684e-4f04-d367-08dea9ebe0f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6437
X-purgate-ID: tlsNG-16d1c6/1777905974-CE777D75-99A1D41D/0/0
X-purgate-type: clean
X-purgate-size: 3004
X-Rspamd-Queue-Id: D97394BFFC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]



On 01-May-26 17:00, Luca Fancellu wrote:
> Hi Michal,
> 
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index faef0efb327c..7297cca01551 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -63,7 +63,7 @@ void __init setup_mm(void)
>>
>>     setup_mm_helper();
>>
>> -    setup_frametable_mappings(ram_start, ram_end);
>> +    init_frametable(ram_start);
> 
> I think that now ram_end and bank_end can be removed
Right, will do.

> 
>>
>>     init_staticmem_pages();
>>     init_sharedmem_pages();
>> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
>> index 6604f3bf4e6a..dfc888c8ee0e 100644
>> --- a/xen/arch/arm/mmu/mm.c
>> +++ b/xen/arch/arm/mmu/mm.c
>> @@ -6,18 +6,45 @@
>> #include <xen/mm.h>
>> #include <xen/mm-frame.h>
>> #include <xen/pdx.h>
>> +#include <xen/sizes.h>
>> #include <xen/string.h>
>>
>> -/* Map a frame table to cover physical addresses ps through pe */
>> -void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>> +static void __init init_frametable_chunk(unsigned long pdx_s,
>> +                                         unsigned long pdx_e)
>> {
>> -    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
>> -                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
>> -    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
>> -    mfn_t base_mfn;
>> -    const unsigned long mapping_size = frametable_size < MB(32) ? MB(2)
>> -                                                                : MB(32);
>> +    unsigned long nr_pdxs = pdx_e - pdx_s;
>> +    unsigned long chunk_size = nr_pdxs * sizeof(struct page_info);
>> +    unsigned long virt;
>>     int rc;
>> +    mfn_t base_mfn;
>> +
>> +    /*
>> +     * In-loop chunks span whole PDX groups, which are always page-size
>> +     * aligned. The last chunk ending at max_pdx may not be, so round up.
>> +     */
>> +    chunk_size = ROUNDUP(chunk_size, PAGE_SIZE);
>> +
>> +    /*
>> +     * Align the allocation to the contiguous mapping size so that
>> +     * map_pages_to_xen() can use the contiguous bit.
>> +     */
>> +    base_mfn = alloc_boot_pages(chunk_size >> PAGE_SHIFT,
>> +                                MB(32) >> PAGE_SHIFT);
> 
> This fixed 32Mb alignment feels a bit more than we need, If for example the
> chunk is less than 32Mb? If we had some variable alignment for chunks less
> than 32MB we would maybe help alloc_boot_pages job, in the end if the chunk
> is less than 32Mb it won’t get the contiguous bit anyway.
Good point. On Arm64 this affects any chunk spanning fewer than 3 valid PDX
groups (~14MB per group). I'll use 32MB if chunk size >= 32MB, 2MB otherwise.

> 
> But I’m fine also if you leave it as it is.
> 
> With the above fixed:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
I can take this one but ...

> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
not this one given the change.

~Michal



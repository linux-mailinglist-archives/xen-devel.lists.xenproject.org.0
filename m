Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOolNBcB+ml1HAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 16:39:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D724CF92A
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 16:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300750.1575242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKGvE-00037B-KR; Tue, 05 May 2026 14:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300750.1575242; Tue, 05 May 2026 14:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKGvE-00035f-Hm; Tue, 05 May 2026 14:38:52 +0000
Received: by outflank-mailman (input) for mailman id 1300750;
 Tue, 05 May 2026 14:38:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wKGvD-00035Z-40
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 14:38:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKGvC-00A7o8-Gk
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 16:38:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fa00f0-5cb7-0a2a0a5109dd-0a2a4509cac8-24
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 16:38:50 +0200
Received: from [40.107.201.14]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fa00f8-2497-0a2a45090019-286bc90e6d78-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 16:38:49 +0200
Received: from PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::27)
 by DM3PR12MB9389.namprd12.prod.outlook.com (2603:10b6:0:46::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.18; Tue, 5 May 2026 14:38:41 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::98) by PH7P221CA0055.outlook.office365.com
 (2603:10b6:510:33c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 14:38:40 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 14:38:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 09:38:39 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 09:38:37 -0500
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
 b=q5ZmVAJY+pSPC//J3dBesRsvEg08zp5tC6pjU6C/jAJ0fyRr4MVeCMH0bqFjrptSgHO9SonSymhU+qZL07eRsKMGS3fmJKnrHBtuTm1/t93X/6NMVCeDT7sbdKbaKu2yiCRfhUlY/8WXLQyGIs/PzKdkUQBXh7zrKY06BhAtGFfDtDMqpWUaPcC0Arjic5yRDtK8k+Km0xlnDSq8WgefVc4ejYk/CHrRqKlsC3zUbLci5Eob7+EERZ032iPjvNvjmdsbw1ruOi9fFWiUByzDafPB4I7Q2ealx8JqcV24Eo44UkN9Ky2hIm9XN3Ix/uGFr5NBrXq559QkPiN3v4RSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HD00Oj62COg/PiI9JUpmfTm1pstQxRoEJOR6y1VN4Eg=;
 b=YAJQaGmjSYPJYk5Jqx8Y2N/D9Ne8nYGbP7VEFVehTF0eGuVMcBVTi/woSdb3zL/PXHTSbk50eRnbPSBps3eVmLGbtFM9smNooxT1v409VWaCY8UbkvN7b30Gex6yTL1Ie4DCKzlU/RkgWHi3raz+F7yypk5COFMssVrJEsw0PEKHFZF9DzqsbRXiEfqMT/A2ZM4LELIcS6FyeCbrMRulFMhWhGstEQsgR/Le5TrmYiBiQkd48RoeKcxVhQo3MwnpRgDuTH8SZuSYAHyu5Rsv8/uWDu+X3qq06M47C9yVsYkIBKEPFyWDJ8Pu3RSxgVxE+YmOXBKMDNYW5zaSUSh2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HD00Oj62COg/PiI9JUpmfTm1pstQxRoEJOR6y1VN4Eg=;
 b=1xbx8hDNjglljpNAQWB8GsNXZKFLQIqHildSRVMQilcHjv8gTgOGOtdPg4ayGIh8CpyY8ubFPOCLRfr/gSopOFe4iC7NdwyRcmMkhVq/1AtPfB7oYkmyXbxk5eg3L71sAaJXT+jFf200CN7bwS5IZNF8DJjo+5Y0hXAX7zUgyiE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <7f209655-a9a4-4174-ad05-825b175fb90c@amd.com>
Date: Tue, 5 May 2026 16:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <afi7HUFoDYabM9VV@macbook.local>
 <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
 <afmYf-ldUxWQXRDL@macbook.local>
 <309b2ff6-c200-47d0-be3f-ec289df641c6@amd.com>
 <0a3583df-2682-426e-a704-aa8711caec0d@suse.com>
 <a90db340-e569-4f77-b5df-dd1a1504f8cf@amd.com>
 <0267eb6f-1161-45b7-8905-d7aecb78e74c@suse.com>
 <e8218607-26d8-4517-8634-df3c365e5bb2@amd.com>
 <afnfeLeYypvBiEze@macbook.local>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <afnfeLeYypvBiEze@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DM3PR12MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c4814e-ac15-49c3-c6f0-08deaab3fff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	p4uh5RqjEpyKLRAvxu954CplFlurZEsHqhLUEPyH6fRQvd0X6fSDJwbZKqwtFeJUPIX7K9YIQ+hDj3Xpxjj/gBvLTIxID9zv4abFaOv9/k9AXRIwYim6SvjGDYkkmYkjPwBimUfXKL3c1cThBAqJqkrJELA+fc7Z802uajy3CCbofmKPpudyWDf2tdiwuzdukHy5O1You55ylHobVgzHkx+AqK1EPqmUKhBGap4yuEbUD89X7MhnQR2DvygaGhy4Z68Q5O2yQmKnzp5yU19Q+8tReJvVodwnYVbSNQc5PKaLddKTrBjJmaYGfgQOlbcit2Etj8K64IPDCbt5WHa8LBbV5/x4MkLzhrOLbbhw0TzIBfFNWTRI7JBwDOhqgmPJDNWLpps/7a95jcSGl24RKFN7HLKw/qYBs37tv5vPtPUuNlEf0JHjoHVqegew/9eEWM0yTjHEz7QfAhq2+HKp8LtPJGu47xPJSSRv/wIFyYQow3luoFHRl41bsjjQ7kkdZLQYtMW3BOG4KZXQRLDz0CBu2ptazXNr2tsV+W7NCrZpGCuK2ACdSvyGmIzOr0vr36jAi6ydHQ38CaCSRNeb6X2KzcL32lhP4ZgdQNLAmxpMufesLUeyXD3OfUE27vJbosQB58HOAccRIPtjZCWc7/EN9MmimILSOo56czdJq+klsyDHGMAdQSzKfrCKJSXQFa2+293azBt9c2zdLEms7UQCt0QUyta5Rn1TdVNEduw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fokmwBWDBAOSmDGC3mpja+Hz2zz7ovHzR8a8ZAiOa2/ylN7UBkj6Y/peJKpFux/kH8MfTkoXt1zdAOkqQYOAXztisW/Ftpeoh4V1CI6Jdxd4wZ2X7BEp0r4p4rFce/KEZ/oG6gVeSwD1KDqPv6CeEShgMX5pl66hBrFRP1k61Jd9J+xyMOvyEmcoo/xJkfb2sG82cEgtNZIeFNWlbDY9lhs8a79etcYb1a4cK1HwUKBAf1fNg2Q7svqFc+OWdLgmtFsJ7j8JQwwH7FWW4lFnBJNhcE3Bxs+cpGp3N7I+op8EsSHa6IzvS/HF3l29d0tKZ2vvU3lPASMj31wNAwnYkhrQZB8aOQq5FxrUw8G7og+rsAjUfkylA6htBVIGWeP9gMKTrvSJ3j1fMeY0kCevXSRzuN4TUjr9OAWiPP7OVZhQrNadDXEIixc44/lbAiGh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:38:40.0776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c4814e-ac15-49c3-c6f0-08deaab3fff4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9389
X-purgate-ID: tlsNG-bad1c0/1777991930-93D7FA53-B14C4AF8/0/0
X-purgate-type: clean
X-purgate-size: 5187
X-Rspamd-Queue-Id: 36D724CF92A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]



On 05-May-26 14:15, Roger Pau Monné wrote:
> On Tue, May 05, 2026 at 01:46:51PM +0200, Orzel, Michal wrote:
>>
>>
>> On 05-May-26 12:49, Jan Beulich wrote:
>>> On 05.05.2026 12:46, Orzel, Michal wrote:
>>>> On 05-May-26 12:40, Jan Beulich wrote:
>>>>> On 05.05.2026 09:35, Orzel, Michal wrote:
>>>>>> On 05-May-26 09:13, Roger Pau Monné wrote:
>>>>>>> On Tue, May 05, 2026 at 08:48:15AM +0200, Orzel, Michal wrote:
>>>>>>>> On 04-May-26 17:28, Roger Pau Monné wrote:
>>>>>>>>> On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
>>>>>>>>>> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
>>>>>>>>>> the frame table starts at PDX 0, which is only true on x86. ARM
>>>>>>>>>> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
>>>>>>>>>> defines it).
>>>>>>>>>>
>>>>>>>>>> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
>>>>>>>>>> to 0 when the arch does not define it. This makes the generic macros
>>>>>>>>>> correct for all architectures, even though they are only used on x86
>>>>>>>>>> today.
>>>>>>>>>
>>>>>>>>> Hm, I assume this offset was added because the original mask PDX
>>>>>>>>> compression won't (usually) compress the gap between 0 and the start
>>>>>>>>> of RAM.  However the newish offset PDX compression should be able to
>>>>>>>>> compress from 0 to start of RAM, and hence you don't need to apply
>>>>>>>>> an extra PDX offset there?
>>>>>>>>>
>>>>>>>>> If that's indeed the case it might be better to integrate
>>>>>>>>> frametable_base_pdx into the mask compression algorithm itself, so
>>>>>>>>> that on some arches it's a mask plus a decrease.
>>>>>>>> The offset is needed regardless of whether compression is used. With
>>>>>>>> CONFIG_PDX_NONE (no compression, PDX == MFN), if RAM starts at e.g.
>>>>>>>> 0x80000000, the first valid PDX is 0x80000.
>>>>>>>
>>>>>>> OK, so you are doing some (kind of) address space compression (removing
>>>>>>> the leading empty range to the first RAM region) even when PDX is
>>>>>>> disabled.
>>>>>>>
>>>>>>>> Without frametable_base_pdx
>>>>>>>> the frame table would have to be indexed from 0, wasting
>>>>>>>> 0x80000 * sizeof(page_info) of memory just to cover the hole before RAM.
>>>>>>>
>>>>>>> But you don't really "waste" memory, just address space?  Oh, maybe
>>>>>>> not on ARM as it doesn't use pdx_group_valid?  And so you
>>>>>>> unconditionally populate the frametable from PDX 0 to max PDX.
>>>>>> With pdx_group_valid (which this series adds) we wouldn't waste
>>>>>> physical memory for the leading gap. But we'd still waste virtual address
>>>>>> space and the FRAMETABLE_NR check (max_pdx > FRAMETABLE_NR) becomes tighter
>>>>>> because the full range from PDX 0 must fit. For example with RAM starting at 5TB
>>>>>> the virtual offset before the first usable entry would be ~70GB — more than the
>>>>>> entire 32GB FRAMETABLE_SIZE on ARM64.
>>>>>
>>>>> Yet still - this is exactly one of the situations offset compression means
>>>>> to cover. I'm entirely with Roger as to it being undesirable to build a
>>>>> special case variant of "offset compression" into "no compression".
>>>> In this case, if you don't want to generalize the macros, how should we proceed
>>>> on Arm if we still need the offset to cover the PDX_NONE variant that we also
>>>> use? In v1 I just created a local override but Julien wanted to generalize the
>>>> macros instead. The discussion about switching the default on Arm from mask to
>>>> offset that is not even selectable on Arm needs to wait for the new release cycle.
>>>
>>> I'm not convinced of that. If you need offset by default, why not enable it by
>>> default (right now, and potentially even as a backport if there's any bug that
>>> is being fixed)?
>> As said before, we also need offset when using just PDX grouping and no compression.
> 
> But you don't really mean no compression?  The offset itself that you
> subtract is a transformation, and hence a compression, as the physical
> and PDX address spaces are no longer identity mapped?  Maybe those
> systems should have never worked with PDX_NONE, and instead required
> a PDX compression in place (one that would remove the offset from 0 to
> the first RAM range).
I'd argue the PDX <-> PFN mapping itself is still identity here — with
PDX_NONE, pfn_to_pdx(x) == x and pdx_to_pfn(x) == x. frametable_base_pdx
is not a PDX-space transformation; it's an offset that's only applied
when *indexing into the frame table*

Conceptually it's closer to "skip the leading hole in the lookup arrays"
than to a compression of the PFN/PDX number space. It also sits on top
of (and is orthogonal to) whatever PDX scheme is selected.

> 
> It's an incomplete conversion IMO, as ARM applies it to the
> frametable, but not the direct map.
It is applied to the directmap on arm64 — see directmap_base_pdx.

So both the frametable and (on arm64) the directmap apply the
equivalent offset. They use separate variables (frametable_base_pdx vs.
directmap_base_pdx) but the principle is the same.

> 
> Thanks, Roger.

~Michal




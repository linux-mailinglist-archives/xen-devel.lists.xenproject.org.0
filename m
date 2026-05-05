Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMf+N5XK+WmFEAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:46:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5019F4CBC1D
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300544.1575073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKDI9-0005rl-Pn; Tue, 05 May 2026 10:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300544.1575073; Tue, 05 May 2026 10:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKDI9-0005qG-Mo; Tue, 05 May 2026 10:46:17 +0000
Received: by outflank-mailman (input) for mailman id 1300544;
 Tue, 05 May 2026 10:46:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wKDI7-0005qA-GR
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:46:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKDI4-003DbN-Ra
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:46:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f9ca75-2eae-0a2a0a5409dd-0a2a4504dde8-4
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:46:13 +0200
Received: from [52.101.53.55]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f9ca71-1dec-0a2a45040019-346535375ab8-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:46:11 +0200
Received: from PH5P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::8)
 by DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:46:05 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::93) by PH5P220CA0001.outlook.office365.com
 (2603:10b6:510:34a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 10:46:05 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 10:46:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 5 May
 2026 05:46:04 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 May
 2026 05:46:04 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 05:46:02 -0500
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
 b=AA3Is+R6J31cuKjEDz6gNLSM3scUrfoMCzRkOKkVNNAMK3Oz3rCPCGguFzdD2L+V2WNjSn+KI2YBn6STucH7PXQ84X+ZQC4zHYiHcL1wZiFKaTkTaHpoXttakBwO95Vmdh084h+4Hlyr6wUPJyh7xVFqX3kqixXO3uUPfCMscmGA+Tg0ClMal/NfOWxr/nu35FJmfB6AkGPmqrMgn8pKlYfT77KeiixepREqDgyU5wbLtIPXfNM2uWSR32J4s+eKjj5Spq+GMEbZrf55J8tR7zWoQk7O61qagw9sSA9jFoMTmNdCp4YS96SYWElcMEU4tZEJcsGCEFcCUyD6PrRHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=At9aI7cAJFmzTgqxUBRtEWI6/kc0cQChhrK+Y0HlKII=;
 b=zNT5QujGZ+XkCbaiv9XAlrCIVnbzVAush1d0l95AlGCCgmSeWldNlRKjMciKAjT+tcB/7RmXkdqNaHEBbXD5jMzyiWj4x0GXpa4aM3xXLGGUnO7TZPxp8WbRmSHauXcXdySEOXJGg2VZpExFrrK0QiL0FQMD9FnBoA605AkMfSh2WOAF5ANmZzZ8/zoUlRirmP44UTUPhJV5lxtxoYoEtfb2I4F+1BLZkfAmb7/FgKpms39haglwf8FaY33iL6ZtXjQ4uxfRwxOvOjgvD8/5ybDl2PjnDtUjdg793vEvYL+KECQZZV4pBanMZrNMb3rxmdWGR48YZWA5viAfJC8WUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=At9aI7cAJFmzTgqxUBRtEWI6/kc0cQChhrK+Y0HlKII=;
 b=1IACf5Iyeu6Kp2alKN/AyyjxDK3KN/73KkwHVKgi+l+5W8YxW/AXq2ZTvIiP/2ePqtCn9NGKo7N7i+5KtySmmNCyD/TbpTfk250f/zOmllWV2zHGxVi5s7FzSDKidZQpDXRaLo5TR0P2eLM6AmQvPWQV7MST/wseILTcLKyB7L0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a90db340-e569-4f77-b5df-dd1a1504f8cf@amd.com>
Date: Tue, 5 May 2026 12:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>, Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <afi7HUFoDYabM9VV@macbook.local>
 <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
 <afmYf-ldUxWQXRDL@macbook.local>
 <309b2ff6-c200-47d0-be3f-ec289df641c6@amd.com>
 <0a3583df-2682-426e-a704-aa8711caec0d@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0a3583df-2682-426e-a704-aa8711caec0d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|DS7PR12MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 3042a70b-ba4e-4bb7-e46e-08deaa9381ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B6Xm/2/e1p3QEKXlmNRNJIrT9W2YKjqbdqfqP6L5ko2ELxLxST5LLPmSd8AEAI9EIHYJoVnwer5nvijjEE0FCVVj+vv8akqxID5IIFn+Q0oBN/T9r3CwpfwE/u1EXozhX838+bac6hViUzPfQCJzD+YH5qF+j2Q5V9seZMup3tB3e5iu4XZQxP2WFb+xS7SDkOZPn0gkogJvbIDQZ6LlTyzaG7mDXfqjGC+cbQkELX6aIi2H5stqEXMERuj1oIzAZ9qvxDjiARHJBU1jZXJ5dfu7VAkmIs9uG+ZP8dsFIoqTIEll3Gdt5xDRM49ujHLW4RMH3/lUlLTdtY1f3CrkdkpZANQkkXEsl+1iRg7myIAD6Ow/H4tZriuPE8Fh9vMClLITNTsRRRUx84+tfly+UPhqaO07nKEgyIvqYxror/oQ3SpFcc8/2R0rJYnBA73si0xc5JSq+pQGJIaEwfY3QXEva5tsOh1s3No7tkEmygXJphs1yTw/IOhmP+1cQWxRSg5ZA5zMTYAb2ouSwKBYZt6kS3xaaZtXX/dar56Ts1C8+MpY/w4LlJCUuD/FTvvYd5plAVNTp1kDSrXo8ItqF1edxjnW+dAj4XyrrOuJkrb/en6F9bsaJBU1SE6daWVxbaS2/SbnhzbvfSx1Uwse914u0Tw5WvEwd6DlmkWFjWEvZJkn3ZOJF0FFoaQkE5QgK81O2uk2FAXxo7QpTm/AWZ/L9zfUKOOmnlC/4YerYp4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RhTEiKnVDsApT20JFC+2ZEXbxn84lWwNRZzJcHXq6rsdfqU/hn8aMP/GRyi3xxHZvLkrsMY+x+Ff88hTQM980cVlpBOxYhs+Xz1is3M+qgXrYc3ZvdAK+iT2GCakd7DN8GOou/gp7FLgbuCyTIYW7RtGvDEK+aQhWuECWV2qxWzobxKh7JzOaYVbHr3yft36yKDRsE/mIWu3eUExw1vLoF8lM8geDAHt0Of8OAplA26/WkDiXudHevum3X0qpIwQl0mOrv8PLFgaQEr/My1imDXw4lhn30ieatpsLcxz2hSZF/tX6EXz+Y0JVizDPF7nIceWmnFPQxNFK6rePU5bH7v8dSo8RUzVRWcF7vnBFbpRaa59ijLi9Qd/6a2/oXh0jvp52q5kH1evfRHTWT5l2/Y6dsbgE5rLghUwAKGyukux2GBpXJMhCyuZm/X5C4mC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:46:04.9379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3042a70b-ba4e-4bb7-e46e-08deaa9381ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238
X-purgate-ID: tlsNG-ebf023/1777977971-4BD6C3FF-DD965C9B/0/0
X-purgate-type: clean
X-purgate-size: 3221
X-Rspamd-Queue-Id: 5019F4CBC1D
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]



On 05-May-26 12:40, Jan Beulich wrote:
> On 05.05.2026 09:35, Orzel, Michal wrote:
>> On 05-May-26 09:13, Roger Pau Monné wrote:
>>> On Tue, May 05, 2026 at 08:48:15AM +0200, Orzel, Michal wrote:
>>>> On 04-May-26 17:28, Roger Pau Monné wrote:
>>>>> On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
>>>>>> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
>>>>>> the frame table starts at PDX 0, which is only true on x86. ARM
>>>>>> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
>>>>>> defines it).
>>>>>>
>>>>>> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
>>>>>> to 0 when the arch does not define it. This makes the generic macros
>>>>>> correct for all architectures, even though they are only used on x86
>>>>>> today.
>>>>>
>>>>> Hm, I assume this offset was added because the original mask PDX
>>>>> compression won't (usually) compress the gap between 0 and the start
>>>>> of RAM.  However the newish offset PDX compression should be able to
>>>>> compress from 0 to start of RAM, and hence you don't need to apply
>>>>> an extra PDX offset there?
>>>>>
>>>>> If that's indeed the case it might be better to integrate
>>>>> frametable_base_pdx into the mask compression algorithm itself, so
>>>>> that on some arches it's a mask plus a decrease.
>>>> The offset is needed regardless of whether compression is used. With
>>>> CONFIG_PDX_NONE (no compression, PDX == MFN), if RAM starts at e.g.
>>>> 0x80000000, the first valid PDX is 0x80000.
>>>
>>> OK, so you are doing some (kind of) address space compression (removing
>>> the leading empty range to the first RAM region) even when PDX is
>>> disabled.
>>>
>>>> Without frametable_base_pdx
>>>> the frame table would have to be indexed from 0, wasting
>>>> 0x80000 * sizeof(page_info) of memory just to cover the hole before RAM.
>>>
>>> But you don't really "waste" memory, just address space?  Oh, maybe
>>> not on ARM as it doesn't use pdx_group_valid?  And so you
>>> unconditionally populate the frametable from PDX 0 to max PDX.
>> With pdx_group_valid (which this series adds) we wouldn't waste
>> physical memory for the leading gap. But we'd still waste virtual address
>> space and the FRAMETABLE_NR check (max_pdx > FRAMETABLE_NR) becomes tighter
>> because the full range from PDX 0 must fit. For example with RAM starting at 5TB
>> the virtual offset before the first usable entry would be ~70GB — more than the
>> entire 32GB FRAMETABLE_SIZE on ARM64.
> 
> Yet still - this is exactly one of the situations offset compression means
> to cover. I'm entirely with Roger as to it being undesirable to build a
> special case variant of "offset compression" into "no compression".
In this case, if you don't want to generalize the macros, how should we proceed
on Arm if we still need the offset to cover the PDX_NONE variant that we also
use? In v1 I just created a local override but Julien wanted to generalize the
macros instead. The discussion about switching the default on Arm from mask to
offset that is not even selectable on Arm needs to wait for the new release cycle.

~Michal




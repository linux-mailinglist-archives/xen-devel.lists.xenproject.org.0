Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI+hJcud+WlV+QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 09:35:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED06E4C8086
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 09:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300253.1574776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKAJO-0007sZ-J9; Tue, 05 May 2026 07:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300253.1574776; Tue, 05 May 2026 07:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKAJO-0007q1-Fm; Tue, 05 May 2026 07:35:22 +0000
Received: by outflank-mailman (input) for mailman id 1300253;
 Tue, 05 May 2026 07:35:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wKAJM-0007pv-JR
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 07:35:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKAJL-00Cpvh-JS
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 09:35:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f99da5-e002-0a2a0a5209dd-0a2a4509de12-42
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 09:35:18 +0200
Received: from [52.101.85.49]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f99db5-2497-0a2a45090019-34655531b3e8-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 09:35:18 +0200
Received: from CY5PR13CA0096.namprd13.prod.outlook.com (2603:10b6:930:a::16)
 by SA1PR12MB9492.namprd12.prod.outlook.com (2603:10b6:806:459::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 07:35:14 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:a:cafe::b1) by CY5PR13CA0096.outlook.office365.com
 (2603:10b6:930:a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.14 via Frontend Transport; Tue,
 5 May 2026 07:35:14 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 07:35:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 02:35:08 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 02:35:07 -0500
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
 b=y0It1EC1G3ufCyMA5Ws0UIy+s0NXZPgLIRViRnVrfUZmr6DHQCuPQie3j9oaHC66hon4WZ4iATxyY++q/ovkJh1BkreGYiXpjvo+JItBrLyrYIVj2yRIESHqmb0a00eHRVSLq5fQBbrArCn686mUrYnYD6GACMUBi2ub7kL8UYiotn7Q143SwRZKwGUdrX8evOzNwKNqyL2n7864knzqS9RViXbsMqF+nWG6yk6TGcwGvamydpUF9Odrz2hg9bI1URraSaFZYSrMCV96JpJuwbOK/wUETyfjhwUq6Zaul28Blj/j1AufULo+RBrAdGqWIqvQSh4/St90qLYgdGDXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIQ6B5QXxPXvMZAEqD+pNtNTZG1nBhilZB1wzodtdWQ=;
 b=ohCiVgPOKQ4QKVwjxgRHvYYQ6LNGBMPH0ChSvEJamqm6T30Jw4W+Ti8Vy2mndbzHc3Y5JUuxJObgVIy0PkgvIzL81P1T0vulM4IiDHzJnLXwga30FYzm01rQLjJHPFg3DVzJ3w2BxhRpB5bQXYE5Yi9hEN0iOdxvVrhObNowhU9Hbol+J5rFVnvu0PWkzXizkrpyXmFveYK2DbmBtYGL0r2ZBMMP8nVB5GEYzuzovtV0JpodvKTVVOqEJuK/y0Dn5txrZS6hSWCB5LgA+2Wmg9exCWdXK5yYQ74w/DtoASCksBawes2WBgAbYt4LkP2DUnTStyVKA7j5fVtj6fJMhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIQ6B5QXxPXvMZAEqD+pNtNTZG1nBhilZB1wzodtdWQ=;
 b=vw8uMB/QxiHbyK+iNor5i5aZT/jTv9neGt01MDedjzPP0hUm5iwFWOLMwpdfObURQQ74wVp8+udP7qCbZLhbJEpKMvorsN7LKBYZUyNhWdCxktWzE3YknBLENke1YUCGqKlNLd9sS7ORHCM8CQTKnNATRHO6LUrv2LcecrXShn0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <309b2ff6-c200-47d0-be3f-ec289df641c6@amd.com>
Date: Tue, 5 May 2026 09:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <afi7HUFoDYabM9VV@macbook.local>
 <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
 <afmYf-ldUxWQXRDL@macbook.local>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <afmYf-ldUxWQXRDL@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|SA1PR12MB9492:EE_
X-MS-Office365-Filtering-Correlation-Id: e4444458-816b-42d3-e7f2-08deaa78d8a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jrvBht3DVdMwkvlJt91nj9mZBKfHAeB3Dl+GXPzXJ6Qu/qoinKpjBN+GkV1PB/FQ7oPWsU1CE16u+NY8S7jjDUaB0EpWmP9tmD8F3Px8paWh8PQ9fXt8FXdoEyc6d/91o23v0k1bbhV8Einak/+Emi8qfyewzY9JsAPvwlVFupBvRgDsaayPkHLD1QNpBIeSK6jHIhaA62mqRnjLEaq1OV3dojFHAOm8SMeymRTBeayWCgoMqd82hRyJVlZ49KJLsrUlTA+oJDRnCqQgFB6L8fiUdXKECiPBaSmslHIZkWjTxcISfhjFnyVt/lTDGzzZHLob19OiO+KVOQhRYzFhqhqHMOBabcp0UhYP8rQXFEmImNzryOvmJRk13D62KPLYjVJiZ4F/7+vRZC5wa5WEpzr6v1Nt8EJBGD+jPxUaJ2eOdlQVeSOOrngje7lFxhLTp/4+yVXYFs7INsT9WTPGZ19yWINMpLehqkE76gJWDBFHQ304cONIowjCIhqlR/7yxdNrOdeGtMXkGRJduuWUpTvVVktf+gpWjqk9XTt60N0yxkxOkj0Ko6/1XbHqfOCIQKUsyU7vOb5deHy3GcGQ5x7vkTg1mTQEd55TtHHmfX7b1uH2I6Dls2zpplLIKYa1RyUD/SUmf2C3g0Kn7+NaJ9EcSrjmIh6fBDz0iMYv9EFpC/8GiCC1a9n/XU963fr68zh/pE5zKqaF5jdDZ/zgSbsNgrnB1QFtuzf+YTfPVso=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UCC6pGxMKUHVU6s3G5rEyrJx77K8Phxhkit3D8xfKHkzNkBu81ZZzMfx3qLV2EoL+JpPuWdpdaI4lCgHoyoNqUyUeqlonPFDYQv4IZNwx7Bl9eYDKmEp21lN4n739Rkz0Lj4lzD9tp8oJFRHj18+Ixxa01pSFveTP7Z6oKYPHYCR2ks7vPdqIK93/nsHpR73AiHFyWtaFsrQGrfKZxJMtFfQVc/6Qawraqh484fHWwyYIRGmnjcp0W8NifWVizIEZNYYsf2BhOq88GIoQX1TWs6aJtb8ZbBOfNwrjO7MDzd/dye8sMdtVxVVliGVyLGRfkrJ+qUDYstHuNgjIgxsQ+hp5pJHbFtBwR8eNYiOuFqOW6yv4buuL8hBrBZehNMuVJaabPHqDoegwWNunRzC7+4AZLITN3YOBj3rmp+zxJVmremZlbP4l5l7wS9xtKVr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 07:35:13.9109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4444458-816b-42d3-e7f2-08deaa78d8a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9492
X-purgate-ID: tlsNG-bad1c0/1777966518-486A8A53-D82A06C7/0/0
X-purgate-type: clean
X-purgate-size: 3533
X-Rspamd-Queue-Id: ED06E4C8086
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
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid]



On 05-May-26 09:13, Roger Pau Monné wrote:
> On Tue, May 05, 2026 at 08:48:15AM +0200, Orzel, Michal wrote:
>>
>>
>> On 04-May-26 17:28, Roger Pau Monné wrote:
>>> On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
>>>> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
>>>> the frame table starts at PDX 0, which is only true on x86. ARM
>>>> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
>>>> defines it).
>>>>
>>>> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
>>>> to 0 when the arch does not define it. This makes the generic macros
>>>> correct for all architectures, even though they are only used on x86
>>>> today.
>>>
>>> Hm, I assume this offset was added because the original mask PDX
>>> compression won't (usually) compress the gap between 0 and the start
>>> of RAM.  However the newish offset PDX compression should be able to
>>> compress from 0 to start of RAM, and hence you don't need to apply
>>> an extra PDX offset there?
>>>
>>> If that's indeed the case it might be better to integrate
>>> frametable_base_pdx into the mask compression algorithm itself, so
>>> that on some arches it's a mask plus a decrease.
>> The offset is needed regardless of whether compression is used. With
>> CONFIG_PDX_NONE (no compression, PDX == MFN), if RAM starts at e.g.
>> 0x80000000, the first valid PDX is 0x80000.
> 
> OK, so you are doing some (kind of) address space compression (removing
> the leading empty range to the first RAM region) even when PDX is
> disabled.
> 
>> Without frametable_base_pdx
>> the frame table would have to be indexed from 0, wasting
>> 0x80000 * sizeof(page_info) of memory just to cover the hole before RAM.
> 
> But you don't really "waste" memory, just address space?  Oh, maybe
> not on ARM as it doesn't use pdx_group_valid?  And so you
> unconditionally populate the frametable from PDX 0 to max PDX.
With pdx_group_valid (which this series adds) we wouldn't waste
physical memory for the leading gap. But we'd still waste virtual address
space and the FRAMETABLE_NR check (max_pdx > FRAMETABLE_NR) becomes tighter
because the full range from PDX 0 must fit. For example with RAM starting at 5TB
the virtual offset before the first usable entry would be ~70GB — more than the
entire 32GB FRAMETABLE_SIZE on ARM64.

> 
>> So frametable_base_pdx is really a frame table indexing offset, not
>> something tied to the compression algorithm.
> 
> Right, it just seems odd to do that extra subtraction when using
> offset compression, as in that case the compression logic itself
> should remove that leading gap when RAM doesn't start at 0.
> 
> Instead of generalizing and expanding the usage of frametable_base_pdx
> it might be better to implement support for pdx_group_valid when
> populating the frame table, and switch by default to the offset
> compression method that will already remove any leading unpopulated
> spaces?
Switching the compression method would be a bigger change, and with feature
freeze on Friday I'd prefer not to get into that now. The current approach
is minimal and self-contained and works with mask and no-pdx which is what we
use nowadays: frametable_base_pdx already existed on ARM and PPC, we're just
making the generic macros aware of it as Julien requested (in v1 I just
overwrote the macro in local file). We can revisit the compression strategy as a
follow-up next release.

~Michal



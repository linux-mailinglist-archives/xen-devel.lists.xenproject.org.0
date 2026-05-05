Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCZ2N2UC+ml1HAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 16:44:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407B64CFA88
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 16:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300760.1575251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKH0r-0004gq-7m; Tue, 05 May 2026 14:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300760.1575251; Tue, 05 May 2026 14:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKH0r-0004eO-4r; Tue, 05 May 2026 14:44:41 +0000
Received: by outflank-mailman (input) for mailman id 1300760;
 Tue, 05 May 2026 14:44:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wKH0p-0004eI-Db
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 14:44:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKH0n-006TX7-UK
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 16:44:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fa0254-e002-0a2a0a5209dd-0a2a450595a2-6
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 16:44:37 +0200
Received: from [52.101.201.35]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69fa0253-aaa8-0a2a45050019-3465c923a879-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 16:44:37 +0200
Received: from BY5PR03CA0024.namprd03.prod.outlook.com (2603:10b6:a03:1e0::34)
 by DM4PR12MB6182.namprd12.prod.outlook.com (2603:10b6:8:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 14:44:30 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::ea) by BY5PR03CA0024.outlook.office365.com
 (2603:10b6:a03:1e0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 14:44:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 14:44:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 5 May
 2026 09:44:18 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 5 May 2026 09:44:16 -0500
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
 b=ywCHIiJjsGg6/UHvxY7FvpJjHfKZOce1K8x+Oy0CcPzAZFOomU/Gm7pLizaJFzttOfRQyFqhcRDjMdadRk5qGokpV27Qr5WRv2mASG5QgR13d39LOZHYdY5UiMwQl8UbCJnEHFwhmyOFG2Cl8Q015ZCME+2NtJdCEqSPDrygnIa4ljdDMwcxuvMATBG+7b8kwG+n3WClU656Pr2ag8y2kuZ3CN2MayakibHcMTLBhmGd3UHTWxxM3mTUi6riPzlemDFLMBp/wnjeb2PLl9JYLg0mUDKynRI+3V0py7O1K5sVN2jy3DCvIXhcPZIKH3wM0qeF1Ttnylc8bF00boqSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yO7qNx99grkF/vOrH79fAYI/FiNTtqMG9yzGQ/AZ31Y=;
 b=cZspjhb4Xca2cRI0UXaRIpboGJLMVaiVXJhXwL4rdHpAq42wta+3mHf39AKRbQu8058zqErPfWvCVWluA50a/gT3C72xEtYL6PqKvK4JvdUeBJyUr49q4s5F7Wkgbl64kA1eU/kNj5qLADI2WlEVOb8blPyDCrriGmNAdlVcyedSWuAkyhYkFDewH54bPage1hmIC565bs1tgszd+joW6oPDzZSysMV4sPS3uZIF03d0HYYphg6E/7+AUBlF9j7yWIY4jw7o9Iy00CN6GWfQviQfvilsoT3TzSAHDDjI+WTUuEFnliMIYaMB7rilLE6bCiMo7tnb6Ueab8MhZpEXig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yO7qNx99grkF/vOrH79fAYI/FiNTtqMG9yzGQ/AZ31Y=;
 b=35iq6zI8jEWEmArc/77pMtMsmO0rQ/WmFcILYOGo/VbK8eDjA7C0gmbNimlF9+btNJQY5pg8Tx5cab+eVeDKcsJIj8UivLAjNvXMLakxFyHgbHp4RWzo9kUxI/bjJP2NdTcV3voBwtmifIlr2cOzW9ScUz/tb3vpaw32hBLI5Ds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <323e36d0-63e1-4331-87ad-d84f948feef7@amd.com>
Date: Tue, 5 May 2026 16:44:16 +0200
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
 <a90db340-e569-4f77-b5df-dd1a1504f8cf@amd.com>
 <0267eb6f-1161-45b7-8905-d7aecb78e74c@suse.com>
 <e8218607-26d8-4517-8634-df3c365e5bb2@amd.com>
 <94f1f29c-0430-421a-8b48-398fa0495966@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <94f1f29c-0430-421a-8b48-398fa0495966@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|DM4PR12MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 9978e949-f8d3-4a27-822f-08deaab4d01f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f4vWtIboYdOESLnV5EEeO6Pqd4bmi6NWN4Do4XVnb0q/FmAXec/hG4EFDqqNb6+8q43B7jM8h/+lGCqXPSFQtNKIBIQV7oakrQCu93sC6gzd1n/R+fXpXiYPzkXZUbAzMmBciAEl3HO59X87SoLQ+L5K7DdUPw47dJGJouodGsnssf4vH1e2ZNgkgyyi9v4T8DLwWX4JmsQfDdRACtO1S9njUihx6Rx3ADLrS1oy4zTV++HLsU7vLZ/oOy3zQ7H71AoFitnLHzq/fkwdZIKGRefE5vR61OVx/IxC/0U2XBu30/8pL+PFH+MdySdLnkavx/GF298RWuB2TvS+HCBovzsvl9cawrauJc8/ePscPTFvw0eyZADcS6Fu6148qHaxIpPdURO7zBENCgmwsOptexAkSZymYmn17TxYMBfHuuAwf1Iwvze9bcMxYpMxQ09V8ZGvX1Lvri7Hkk2Y2yg77wyvCZ7dyU4ctQhb9jf1wu0meb0A7YtZaHfd19WAwD5Df3akyfqZm35taPqpkWX+0aqwb3E983RrsCjQjK/VoiOnSnEf0q7wmlUj6Y65YNYiPuaZxH+PwGqeSBU2WTSv5A9PEAdxD8o0uCTX+CJXhgzYkWkIPB7e09CI+ljb8WENdi+J5SxNpqbYoUr2uUhcbBohY4ohs61aK9PcltEfzwCDpMbtPTs0uGVgAUzVc4fGL4iiYNtH6BVZT9WBpIHvkxC50gnBY/G9WaSISMjZ9Bg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iKCQmHXs7g6+nbwYBf9PQfi7lWDnftpnpUyHuznX0xRTSwEW3HdIKhS71DH+tKyYxJcHBF/v0A90DA+nxetx9ZFI/S4ILiXOlR53S2UvnIkc2EkHN9uAL4L4hM4v+ySrKzrRg9nEJPNke/q2vS5Bg1TdpkTBATOTX+9yrO701/2FvQ4b6pAnk0T97XiVRyzCrFpdBBuA1Y6E3YOZqkPUfPTDVRQu9NJ0swfUJyBUVapl6z4kf9vfv63eokoq/QZPXi6Futa2nWbnUdowO0deYJfezeUnnW/tmrn4xxvJVQt8UzIobuuhDvpR59PK1UaD8KuqY2wU2mGC5PWUUmwV3pFLTx7KbRftbnkaICwJLwOVslJp5VCGx7zCrboTdXcyIdw8kqH9iTdxatm3eRbUcn5JvvoiOEabn66W73ZIrQHYsxGkEkUd0xp2iv3stRm7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:44:29.4762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9978e949-f8d3-4a27-822f-08deaab4d01f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6182
X-purgate-ID: tlsNG-c201ff/1777992277-E8DA3443-F5CC4783/0/0
X-purgate-type: clean
X-purgate-size: 5955
X-Rspamd-Queue-Id: 407B64CFA88
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



On 05-May-26 15:00, Jan Beulich wrote:
> On 05.05.2026 13:46, Orzel, Michal wrote:
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
> And as also said before, this really is poor man's offset compression then. That
> may be tolerable if you insist that's best for Arm, yet then I'd suggest to limit
> that offset to just the "no compression" case. It's redundant with offset
> compression, and it may be (possible to make) redundant with mask compression.
> If the latter can't be arranged for, an offset may want introducing there as well.
> But it shouldn't exist independent of the compression scheme used.
Having a single per-scheme mechanism rather than an extra independent offset is
cleaner. But I don't think we can limit frametable_base_pdx to PDX_NONE today:

 - Mask compression doesn't fold a leading [0, first_ram_pdx) zero
   prefix into anything. So the PDX of
   the first RAM frame stays at first_ram_pdx, and without the offset
   the frame table virtual extent is max_pdx * sizeof(page_info)
   rather than (max_pdx - first_ram_pdx) * sizeof(page_info).

   For systems with a high RAM base (the 5TB example I gave earlier
   needs ~70GB just to skip the leading hole, vs. 32GB FRAMETABLE_SIZE
   on arm64) the (max_pdx > FRAMETABLE_NR) check then fails and we
   panic before mapping anything. pdx_group_valid (which patch 2/2
   adds) avoids backing those leading groups with physical memory, but
   it doesn't shrink the virtual extent — only the offset does.

 - With offset compression you're right that the leading hole could be
   absorbed into the lookup table, making the extra offset redundant.
   But Arm doesn't currently select offset compression, it's non-selectable,
untested and switching
   the default is a separate (and bigger) discussion that I don't think
   should block this fix given the state of the release.

So as it stands, the offset is needed on Arm for both PDX_NONE and
PDX_MASK_COMPRESSION. Folding it into the mask scheme (and dropping it
for offset compression) is a reasonable cleanup, but it's a refactor
of the compression layer itself, not something I'd like to mix into
this series.


~Michal



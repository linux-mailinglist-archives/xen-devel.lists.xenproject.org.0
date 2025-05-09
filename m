Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B02DAB0F88
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980019.1366511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDKKc-0001V1-0G; Fri, 09 May 2025 09:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980019.1366511; Fri, 09 May 2025 09:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDKKb-0001Sb-Tn; Fri, 09 May 2025 09:47:49 +0000
Received: by outflank-mailman (input) for mailman id 980019;
 Fri, 09 May 2025 09:47:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Ixy=XZ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uDKKa-0001SQ-Ip
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:47:48 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2414::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a952b6b6-2cba-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 11:47:47 +0200 (CEST)
Received: from DM6PR21CA0003.namprd21.prod.outlook.com (2603:10b6:5:174::13)
 by MN2PR12MB4285.namprd12.prod.outlook.com (2603:10b6:208:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 09:47:42 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:5:174:cafe::29) by DM6PR21CA0003.outlook.office365.com
 (2603:10b6:5:174::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.5 via Frontend Transport; Fri, 9
 May 2025 09:47:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:47:41 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:47:39 -0500
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
X-Inumbo-ID: a952b6b6-2cba-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWumzrbMMy5Lz3B9FAAb5YIhOT1g8MbW9kCjMGwCTVM4PA723JqxhGBq+69Ze2mlbLarea27xZwUHPF4ciWfeUJTyjSjeKfs9U0H/CqOW5rvOS0mfRoOJncXseFF/3TqMlHm3i8g3r0GpfxkpggoRPZCrpIaxltYyDL4LFEsSCXv2P58sE95hKr/wxi/Wgz/tSDscbyFqvngDP7dDY0OkkgMjRlO/jZIzmlccs6CE0JL1iIN4YNnHgHp9Oi74eBnFyBn5CkA/AVhWiREjEIWj+/NYBL8Z1mspnoKT+iRgJakEz50ILQS5iqf7Y+tFwthRh5m/kPukwmIhqyrKMAKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fP5/BJn2vVayGmthZ/RT7iF/lo9PSwS3SPqq2i68XMA=;
 b=noZ3ecnwAi7ZrhK5MHwnCQOzojenTX7h0nvAY/otK/dppR9pnFv4MEZ9ukyV8fMWMN098ndUoY2U6cSqjEyveSfQOMen/bhqdcB1T4YdWwRmKe7FavDrDXPyYuQCMSdmbQ6U6sUjWaHOwX1DkxHwxhfxq4mg09RP2Tk6OJsKptxtD/Krmimz/oORZDB4Sn2jnakwqafsU2hwG4qqz49D/aqKFnhoPQIxeTtIw0teSDALsELBiR+2wR2/r8BWpwc9x5ouwBp33nkjRkug6RwPEWdu9TY44/LOpkA79l6BlPTm8BodBUj8jKw6RressrYfNy9fdj2huoDeuUTcMWjxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP5/BJn2vVayGmthZ/RT7iF/lo9PSwS3SPqq2i68XMA=;
 b=mAgVmPn355enMN4/PA6xO0g6cxqOD/peu90ZsN2clQekuuzSU7sEWc+s37DNI4gl8IZaZGvClDScS/EIWcmt6lZDSJBMsJ5ZM1YhH8oQWeE7XBEjdUbyAUZ76ZCAJKRQzkafKM/po5nwCf8GsZ/EyvWrfcbTXtspbPrC1mPprkQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 9 May 2025 11:47:36 +0200
Message-ID: <D9RJ9PK28QNQ.EKGYRHXWTYZ1@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: Mapping memory into a domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Demi Marie Obenour <demiobenour@gmail.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Xenia Ragiadakou
	<Xenia.Ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
 <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
 <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
 <aBuatoL1dm0tjZ9P@macbook.lan>
 <30243d25-881d-42d3-90c2-f791c3632372@gmail.com>
 <aBxizlMj3D94M3WS@macbook.lan>
 <ae1a35dd-b7b2-426f-b2d5-723bb07b0e79@gmail.com>
In-Reply-To: <ae1a35dd-b7b2-426f-b2d5-723bb07b0e79@gmail.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|MN2PR12MB4285:EE_
X-MS-Office365-Filtering-Correlation-Id: 12051eac-3919-4d39-bf99-08dd8ede8ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXBsRWx5QTZDWjZiWHhURXl2Z0Z1clhuUUgwTnhJRnYzV0Zyd3NoU1dKWXFI?=
 =?utf-8?B?Smo3YVBsYUhnVmc5cDRDcmZlQWExSGhIRnVVQUh4eWVVRFk3RWdZZG5MZ05x?=
 =?utf-8?B?b1JXOWpaZStkTHRza0l4S0ZuV1NndlZrQlUyNjQ1Y08wTFZINnlYVlJmMmMr?=
 =?utf-8?B?ME1SQzR0UnQya0p1MTVkakgrU1FycFdRUXlrZG9IN2FxRUlNUFVScldlbEJF?=
 =?utf-8?B?cVIwM2tia2hGWnhDeDJRT1YzTXp1bWJxcFFOZVZ4VFVQNVQ3VXd5bHNpVmNT?=
 =?utf-8?B?QmdPUFBTYWwwWlk0RnJjSFVQTWdxc1QrYitPQzJSWm9sTU5pYjVEMEE5Ky9K?=
 =?utf-8?B?UFpHVjlNdWRRZDBKZ2FhemhmWGRydGRiREJtbTRlSWxpY3M4Rk11S21ZcmFu?=
 =?utf-8?B?Y1oxSkw3eXdrUDJYZ2JjY1g2Z0RvQm82UXB1Zkt3dm1hMy95VHFFemI3NFFt?=
 =?utf-8?B?ZnR3VUwvdDU3SzI0MDFZK3JNOWRNbXpuSDRVbWhKK1JoWXV5Rkdjay9pU3A0?=
 =?utf-8?B?SThYT3BQeWx3bE9KdkU3UllLZVJkMHptNHpVTzNnSlFmckVEdWNVY01qL0lo?=
 =?utf-8?B?R0dvN1RGZ1FqK3dDT1dwUDBQdUc3dWVjMUlFRTJwNUxuNFF0Qy96MXV6WEUw?=
 =?utf-8?B?SW9hRFlCbER2a0NLQ3BtaWJXT3hITEtOVDFaVDVWdEJrWlNTOGRIU0R5YW1S?=
 =?utf-8?B?TUN1QXh2OUNLVUFDSUhpeXZhblNGUnZOS0xJT1k2WWQ5OXpUVnFoRnoyQjdX?=
 =?utf-8?B?ZVN5TEIyOUpRVlRUcThkQUQ0cG55UEt6cDZVc0JYVWZ4SEo4SlBkSnQydkg4?=
 =?utf-8?B?WlFpOE9NbnFiamhSeW9UMUxZKysxNFVUQ3dVMW1hZnJlMVZaU2xHaEYvZnFk?=
 =?utf-8?B?TUtxOGVyQnoySDdQNUU5S2xsRFlqdkxjaXQybEFGbk1PN1hYMFJNN1pJWW9S?=
 =?utf-8?B?aE1tck9Vd0JxV0ZoSjYxdyt0Z21XVC85TXpKei9SYjUxZkhsamJHT1Bzc2cz?=
 =?utf-8?B?NlpGZVJTUWtHVXFIbTVJRlNyRFphN29KbHdpWlcrSHMxY3pPZ3J3emhNMlUv?=
 =?utf-8?B?Z3MvVFB1S3VnYms1THhYZnBBd3lZN3B1SDVlblUrWlpNdmhXRVk5V291STgv?=
 =?utf-8?B?Z2hqUDFKcnBUNjRlVXp3RldFWjVvU2JBVVhrMEVyQ0p0a3JPUVJSblNwdk5n?=
 =?utf-8?B?RUVXRGJCSW5Da3Y3Yk5KampKcEh1dzBkb01nWUVXSExmMjhHQkpaZ3J5aVox?=
 =?utf-8?B?aHMwVGczVTZGazBHWTNZc2Y4THJEakpzSGxpUnU2L3ROZTFoczFiQmlEdHNi?=
 =?utf-8?B?T0daMGNoWVlXaDA2ck1KQmNPSzRoSHd3SVBjQmNWdHhzNVo4QlJNcEFJMnQ1?=
 =?utf-8?B?TFdQeENKcFc2NzlHSy84eXdjS21uckZLaHpiN2g0ZkV6U1JTTFlxb056bGFW?=
 =?utf-8?B?S1NIeERoWFFTdjZ6NHVvREhNcjMzbjdiWC9kREJleVh0WlVoVEFSbzBVZ0lZ?=
 =?utf-8?B?V3JiakdoNHVFa0Z5ZlFHeEdCTktQcUdZREVyTkNlL05kRHVFRTJXMjE1emcv?=
 =?utf-8?B?cklnSU13aExSZHppVnhNUTlxSGd1Qk9neCsweUR3ZWR1S3M2NUNPL0xKTStV?=
 =?utf-8?B?Zkh2aE5mR1BVWkdaZUpwVTVEUktaaE5PWHJKd2FFV2FMWUxKcGt0M2taQzBT?=
 =?utf-8?B?akwwSlVzTVUvbVRhckkwWUUzZTlkNTJSbTQzSjREb2VyS2ZyM2g5YkNpUkNL?=
 =?utf-8?B?OHJoL3d3SVc1aUpuNjYyYTQwZ0pmbS9nYWdQQU9tbGpsSThDeG9uSXR6bXhs?=
 =?utf-8?B?dkkxZkpiMzl5bHlCa2RtcHNpblFhV25UU0tVQW9wUHU5RW1xemY1ZlBvQUlP?=
 =?utf-8?B?RkRyNFRwZlNRVHRjSVFFZGZBWWlJT3VveTdTZDNVNjEvdUhmTGErbnA4ZnR3?=
 =?utf-8?B?NjFBditReEtMcDJkT0crOHVKVEZiRnR1bFF6WmJKd0doMENNZTVPR1BsRG1n?=
 =?utf-8?B?dk83ejVBZHNDMEJUaHpXZjgzaGdVQ21GWHZ0bFZkNGY0Nmo1ZTZsd2lmeXo5?=
 =?utf-8?Q?yqgtid?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:47:41.7403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12051eac-3919-4d39-bf99-08dd8ede8ac1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4285

>>>>> A Linux driver that needs access to userspace memory
>>>>> pages can get it in two different ways:
>>>>>
>>>>> 1. It can pin the pages using the pin_user_pages family of APIs.
>>>>>    If these functions succeed, the driver is guaranteed to be able
>>>>>    to access the pages until it unpins them.  However, this also
>>>>>    means that the pages cannot be paged out or migrated.  Furthermore=
,
>>>>>    file-backed pages cannot be safely pinned, and pinning GPU memory
>>>>>    isn=E2=80=99t supported.  (At a minimum, it would prevent the page=
s from
>>>>>    migrating from system RAM to VRAM, so all access by a dGPU would
>>>>>    cross the PCIe bus, which would be very slow.)
>>>>
>>>> From a Xen p2m this is all fine - Xen will never remove pages from the
>>>> p2m unless it's requested to.  So the pining, while needed on the Linu=
x
>>>> side, doesn't need to be propagated to Xen I would think.

It might still be helpful to have the concept of pinning to avoid them
being evicted for other reasons (ballooning?). I don't think it'd be
sane to allow returning to Xen a page that a domain ever shared with a
device.

re: being requested. Are there real promises from Xen to that effect? I
could make a hypervisor oversubscribing on memory that swaps non-IOVA
mem in and out to disk, moving it around all the time and it would be
compliant with the current behaviour AIUI, but it wouldn't work with
this scheme, because the mfn's would be off more often than not.

>>>
>>> If pinning were enough things would be simple, but sadly it=E2=80=99s n=
ot.
>>>
>>>>> 2. It can grab the *current* location of the pages and register an
>>>>>    MMU notifier.  This works for GPU memory and file-backed memory.
>>>>>    However, when the invalidate_range function of this callback, the
>>>>>    driver *must* stop all further accesses to the pages.
>>>>>
>>>>>    The invalidate_range callback is not allowed to block for a long
>>>>>    period of time.  My understanding is that things like dirty page
>>>>>    writeback are blocked while the callback is in progress.  My
>>>>>    understanding is also that the callback is not allowed to fail.
>>>>>    I believe it can return a retryable error but I don=E2=80=99t thin=
k that
>>>>>    it is allowed to keep failing forever.
>>>>>
>>>>>    Linux=E2=80=99s grant table driver actually had a bug in this area=
, which
>>>>>    led to deadlocks.  I fixed that a while back.
>>>>>
>>>>> KVM implements the second option: it maps pages into the stage-2
>>>>> page tables (or shadow page tables, if that is chosen) and unmaps
>>>>> them when the invalidate_range callback is called.

I'm still lost as to what is where, who initiates what and what the end
goal is. Is this about using userspace memory in dom0, and THEN sharing
that with guests for as long as its live? And make enough magic so the
guests don't notice the transitionary period in which there may not be
any memory?

Or is this about using domU memory for the driver living in dom0?

Or is this about something else entirely?

For my own education. Is the following sequence diagram remotely accurate?

dom0                              domU
 |                                  |
 |---+                              |
 |   | use gfn3 in the driver       |
 |   | (mapped on user thread)      |
 |<--+                              |
 |                                  |
 |  map mfn(gfn3) in domU BAR       |
 |--------------------------------->|
 |                              +---|
 |              happily use BAR |   |
 |                              +-->|
 |---+                              |
 |   | mmu notifier for gfn3        |
 |   | (invalidate_range)           |
 |<--+                              |
 |                                  |
 |  unmap mfn(gfn3)                 |
 |--------------------------------->| <--- Plus some means to making guest=
=20
 |---+                          +---|      vCPUs pause on access.
 |   | reclaim gfn3    block on |   |
 |<--+                 access   |   |
 |                              |   |
 |---+                          |   |
 |   | use gfn7 in the driver   |   |
 |   | (mapped on user thread)  |   |
 |<--+                          |   |
 |                              |   |
 |  map mfn(gfn7) in domU BAR   |   |
 |------------------------------+-->| <--- Unpause blocked domU vCPUs
 |                                  |

>>> - The switch from =E2=80=9Cemulated MMIO=E2=80=9D to =E2=80=9CMMIO or r=
eal RAM=E2=80=9D needs to
>>>   be atomic from the guest=E2=80=99s perspective.
>>=20
>> Updates of p2m PTEs are always atomic.
> That=E2=80=99s good.

Updates to a single PTE are atomic, sure. But mapping/unmapping sizes
not congruent with a whole superpage size (i.e: 256 KiB, more than a
page, less than a superpage) wouldn't be, as far as the guest is
concerned.

But if my understanding above is correct maybe it doesn't matter? It
only needs to be atomic wrt the hypercall that requests it, so that the
gfn is never reused while the guest p2m still holds that mfn.

Cheers,
Alejandro


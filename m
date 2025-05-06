Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78594AAC520
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:06:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977208.1364256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCI09-0003uh-UX; Tue, 06 May 2025 13:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977208.1364256; Tue, 06 May 2025 13:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCI09-0003t2-Rd; Tue, 06 May 2025 13:06:25 +0000
Received: by outflank-mailman (input) for mailman id 977208;
 Tue, 06 May 2025 13:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4dzw=XW=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uCI08-0003sr-F0
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:06:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2418::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e53a3229-2a7a-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 15:06:18 +0200 (CEST)
Received: from SJ0PR03CA0162.namprd03.prod.outlook.com (2603:10b6:a03:338::17)
 by PH7PR12MB5733.namprd12.prod.outlook.com (2603:10b6:510:1e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 13:06:10 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::22) by SJ0PR03CA0162.outlook.office365.com
 (2603:10b6:a03:338::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Tue,
 6 May 2025 13:06:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 13:06:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 08:06:08 -0500
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
X-Inumbo-ID: e53a3229-2a7a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9UpS4O2oJZDBEjkLkae3ZwOvpzH54ltI74exizIyZoz15kWClGWgItOKemYLN8KFx63CnoqvhEmwrRUG88lGbKaaOAhKqk/iLAJmIVev9pY72RJSnzLdlSA17RjNNhsgJZUiJp7m7FnvLrmy2ewnFy8ly+MMxID932EcKPXPzQW1AM9ECJZI4rIittLqOhxV0zpInfv9VYzAvE4vhecgIm/G9a92TCQeb/J3A+zN7gpfD4cJvAnx7s7GqnS8kdlXBzWVh7kEioFUwGmhYHbBOjkERa/zZAQCDwjiPK3LiIgJ1G9IXkBtBRerXsgZnal7kCjCXhtygfzG9+AaRGEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMTfbjbRSRbJSCz/G78wTXTYJLYG82cA7qT9YHesGnM=;
 b=b+1V5oxBvgpgT4E/Eiy8pRVKUP8mNN0/+285+OtlDSCvBR/zdzAfdx/MBiQztYdQrtGGZoPOkH8c48YTRBvpPcTOyS0xS3CDKquBd7MJUZ7A/qygQ6ipJn0xKV2RuMvOeSex0GMs6SRjamdmXgOL0/3F6ggjcktAR8rHP3HSqB3ijj00nMTWO7XDQqWEgGwuEeQDkGTtdzhyTbvUZHu10BocnqcrfXMPMgiOLZmiBqOxQ1PEcfjVvSBurXa62CDFM8xDUByTvkUrpezT9I1eG0SuEg9Ze1toWH8thpBFikLhiQuILhG86m9ViQbYzgr5wzarLvJrAls1H3xBb3mYow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMTfbjbRSRbJSCz/G78wTXTYJLYG82cA7qT9YHesGnM=;
 b=0gxAUtBYBwAWZLOsF8Z7uJcGJYoVbt4k3ox8HerYAvwQ53x4Zl9i1S+MgOOd1CKHv3TpxXcRGJfwHaBo4X8UdwqUe5eWK3gndXvYCgxRF68/zlPXEIL8f3cRax+E5i5B1JqTlXFOMcAiqxUjLVo8QFuRG8ofvsnIecDYEIfcUzE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 6 May 2025 15:06:06 +0200
Message-ID: <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
	<jgross@suse.com>, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: Mapping memory into a domain
From: Alejandro Vallejo <agarciav@amd.com>
To: Demi Marie Obenour <demiobenour@gmail.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
 <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
In-Reply-To: <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|PH7PR12MB5733:EE_
X-MS-Office365-Filtering-Correlation-Id: 47db2f35-0aac-4075-c269-08dd8c9ec534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkRIS2hNSjZJdnFzYXFkeEVPNzZUelo2Y3VIdUhLemk4SVVIbE55YTVKVlc4?=
 =?utf-8?B?M0ovQ2tSZTE1VmllKzdTaEVabHJPTWpFbmZ5SDJ0K0Y1QWdjRElyWDFJUXNm?=
 =?utf-8?B?OWFQNzZlRUdkNUVTZFVXTm5pYTJtL2hvaVNrcFI1eldXdkpnZzMvUVhLeFZk?=
 =?utf-8?B?ZHlHYS9GTmpkYy9IUGtZNzF0MGc4MHZwRDdQbmJlZEg4bElkYkZRbFMxYVNt?=
 =?utf-8?B?VTM2OXRsM256SzlUZkpSREtkaTIwN2VHU1RFNURnajhhZVJUU0M5byttZVZG?=
 =?utf-8?B?b3FEcGE1SmdndjRacVJKR2JMTXYrcy91cHUwS0dwV25NTE9LOTh3OW1rNktm?=
 =?utf-8?B?SHY0cHdiWjBtNFlUMGFhT0FpQjVoSVRvNUJFZGJvVGxnL0ZFZUEySTQ0UUY3?=
 =?utf-8?B?TG0xY0oycE5uTEE1ZzVrbi9MZXFsa0tTUkNkSUJWNnlYbzVKMHRnT0p5b1k5?=
 =?utf-8?B?a2lMQy9jY29NRzZpc2FteWZMVGdjc1QraG4xeGtoaDlvM2lUZjYwQ0tnV1I4?=
 =?utf-8?B?OGRHVUVBTXBhdGVPK0QvbGxwZXFVdDhoUkNINUkxdWtLbHJnUmFyeEJ2Y1lV?=
 =?utf-8?B?bnZVK0VYcnNzZ1drd0lXQXBzaktOOGgzOGUyQmVmL3Z3Nk5OL0t1Y0lkRW5Y?=
 =?utf-8?B?TTJ5LzB2ZE5YdnY2clBpQWg1dDlDUnc1Z1FocDVnZlBzN21BazhaajZNMFZ5?=
 =?utf-8?B?TXhuMHdKajluSTFjcTdSOWQyNGs4K3BOT0QzbzJabzF3RksvU0svU1Q5eTdm?=
 =?utf-8?B?YmFtLytUUnMzUmIwYmpVck14UVdud09QQW5qeUpaaXdqYk9VK3NESTFTcnVK?=
 =?utf-8?B?eTJTamFodm9zcm13QVNxa0wvT2VCVTMyRWxROFprOWU4STBwazR5c3EwbVlq?=
 =?utf-8?B?cE1oRWhSRWdZckk1elZUUjBMT3pZU2FmNVVGcmV0cmgvRVY4UmhGc0RuTGpX?=
 =?utf-8?B?WXlqaEY0WWFrN1dnME1OTU5MbG9lem12NHZETjFvTjJmTCtLQm0zbUt6YkZk?=
 =?utf-8?B?MXdocG9aZzl5dUdFaVFFdy84SGFmNDJqV3RhUUJDZ0lCRUQ3OWh2T2lIRDY0?=
 =?utf-8?B?N0pSdmpReG9EM2FlODhPZmRzNVBDZnVtRHVCVXN4d0VMYnc2dmt0c3pyVkR3?=
 =?utf-8?B?b0E5NnJsNFRPeitBQjZEZk03MFV2ZmRjVCt0ZEIrUVgvOW1PNDJqc0xxa3JK?=
 =?utf-8?B?Y3ZnVlp5dXc0WWZXUXRYL1o5a2NzUVRMR09BTG9QcnYrenQ4Q1JkRCsvQ21S?=
 =?utf-8?B?RnZ1VTBoVFpvSEd2R3NKZFRDM3V2SWJkWWVzU2NEb0hjYVpSZXpDc0JHd2pq?=
 =?utf-8?B?TlhEV25nVzcyUW9WNWdZdEh6TFNrcU1CTlJkQStXVnRCcHhNWnhvUlE5MmhX?=
 =?utf-8?B?dTF4K2phamk0b0ZkeWtTendWN0hxMWxlZVd6Sjh4bXlCWjQzVE0zeTdCVjZj?=
 =?utf-8?B?YTRXVGllcERtRDFUbi83OVpWUzl3L3ZaMzBvdFFhd0Zia3N5cmwyZklQWTJI?=
 =?utf-8?B?aU1KNm9PSGdUaEJaVitYOHpiRllHZnVaTUdPU1dra0RydVM2b1d4bmphYllV?=
 =?utf-8?B?ZTJlZW5WMGNWbEtkVGM2amZFR1J3OVZPendkK1ppV1VISm9qbURYMW5CVEta?=
 =?utf-8?B?eG5zYWFFYStyS25EeFJhcW9wb3RsRmxGMm5XdDY2bnUxYStCdHhTS1ludjMw?=
 =?utf-8?B?bktHSnlsWkNBL3Z5bDNBSWZiT2lMQ1pvU2JtNEM4blVtY0xxdDlvRXJ2ZWxZ?=
 =?utf-8?B?Q1FZUHVFdTNnLzN4ZTJ3eVl4WFVGWWtuWlVoQUczNS90L2xSeDRqL3p5aEJa?=
 =?utf-8?B?MVM3NnFQbmtaQ093aTNKQWdMQTFyYzVsREhRdjVYVFA1Ui9TRjRPNWRpd1dD?=
 =?utf-8?B?ZnZRSmlNd3lqSVdtVHhYOGgrcFhEUFI1M29qKzlKbmsyME5YOFdkUS9Nekp5?=
 =?utf-8?B?d1pzaG5wMTBZY2FndGpEYU5ROUVCYStZa2dhWTZsNWM1c29pOUZocDFDUW44?=
 =?utf-8?B?dHJPOTJmcU5XQ2M0eGh4RkkvVXV2aEY0cERFNHBVNnIza3dsMUlZQk1UUzla?=
 =?utf-8?B?RnFMRXlVSFhBUitzVGd6UGdGYkdRcDNDOWdiZz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:06:09.6299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47db2f35-0aac-4075-c269-08dd8c9ec534
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5733

On Tue May 6, 2025 at 3:02 AM CEST, Demi Marie Obenour wrote:
> On 5/5/25 7:32 AM, Alejandro Vallejo wrote:
>> I suppose this is still about multiplexing the GPU driver the way we
>> last discussed at Xen Summit?
>>=20
>> On Mon May 5, 2025 at 12:51 AM CEST, Demi Marie Obenour wrote:
>>> What are the appropriate Xen internal functions for:
>>>
>>> 1. Turning a PFN into an MFN?
>>> 2. Mapping an MFN into a guest?
>>> 3. Unmapping that MFN from a guest?
>>=20
>> The p2m is the single source of truth about such mappings.
>>=20
>> This is all racy business. You want to keep the p2m lock for the full
>> duration of whatever operation you wish do, or you risk another CPU
>> taking it and pulling the rug under your feet at the most inconvenient
>> time.
>>=20
>> In general all this faff is hidden under way too many layers beneath
>> copy_{to,from}_guest(). Other p2m manipulation high-level constructs
>> that might do interesting things worth looking at may be {map,unmap}_mmi=
o_region()
>>=20
>> Note that not every pfn has an associated mfn. Not even every valid pfn
>> has necessarily an associated mfn (there's pod). And all of this is
>> volatile business in the presence of a baloon driver or vPCI placing
>> mmio windows over guest memory.
>
> Can I check that POD is not in use? =20

Maybe, but now you're reaching exponential complexity considering each
individual knob of the p2m into account.

>
>> In general anything up this alley would need a cohesive pair for
>> map/unmap and a credible plan for concurrency and how it's all handled
>> in conjunction with other bits that touch the p2m.
>
> Is taking the p2m lock for the entire operation a reasonable approach
> for concurrency?  Will this cause too much lock contention?

Maybe. It'd be fine for a page. Likely not so for several GiB if they
aren't already superpages.

>
>>> The first patch I am going to send with this information is a documenta=
tion
>>> patch so that others do not need to figure this out for themselves.
>>> I remember being unsure even after looking through the source code, whi=
ch
>>> is why I am asking here.
>>=20
>> That's not surprising. There's per-arch stuff, per-p2mtype stuff,
>> per-guesttype stuff. Plus madness like on-demand memory. It's no wonder
>> such helpers don't exist and the general manipulations are hard to
>> explain.
>
> Is this a task that is only suitable for someone who has several years
> experience working on Xen, or is it something that would make sense for
> someone who is less experienced?

The p2m is a very complex beast that integrates more features than I
care to count. It requires a lot of prior knowledge. Whoever does it
must know Xen fairly well in many configurations.

The real problem is finding the right primitives that do what you want
without overcomplicating everything else, preserving system security
invariants and have benign (and ideally clear) edge cases.

This was the last email you sent (I think?). Has any of the requirements
changed in any direction?

  https://lore.kernel.org/xen-devel/Z5794ysNE4KDkFuT@itl-email/

Something I'm missing there is how everything works without Xen. That
might help (me, at least) guage what could prove enough to support the
usecase. Are there sequence diagrams anywhere about how this whole thing
works without Xen? I vaguely remember you showing something last year in
Xen Summit in the design session, but my memory isn't that good :)

Cheers,
Alejandro


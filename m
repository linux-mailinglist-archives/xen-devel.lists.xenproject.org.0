Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2E9DA71A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 12:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844729.1260226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGGWZ-0004NP-IC; Wed, 27 Nov 2024 11:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844729.1260226; Wed, 27 Nov 2024 11:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGGWZ-0004LE-FT; Wed, 27 Nov 2024 11:48:03 +0000
Received: by outflank-mailman (input) for mailman id 844729;
 Wed, 27 Nov 2024 11:48:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KjDT=SW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tGGWY-0004L8-18
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 11:48:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2413::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f66ffda-acb5-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 12:47:54 +0100 (CET)
Received: from MW4P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::13)
 by DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 11:47:50 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::bb) by MW4P221CA0008.outlook.office365.com
 (2603:10b6:303:8b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.21 via Frontend Transport; Wed,
 27 Nov 2024 11:47:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 11:47:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 05:47:47 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Nov 2024 05:47:46 -0600
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
X-Inumbo-ID: 6f66ffda-acb5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjE2IiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjZmNjZmZmRhLWFjYjUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzA4MDc0LjE0Nzk2Miwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMWZkQgrMCoFrv2ur/dvtjL6tQVhQMjh+XoG4jLTf7m7MDNw0rORaXZPJAtlfkPrUupxKniYgjPe2MXocqt4F5mgvSoe85aAxLIqlqffNiK6RnLI1DRP2P6Wu3BQ7jqtrQ9j9IbPgfZseffc0qaaRhbYELhGnjxLghJDlLIHMqo9jwtJ5VslJtOLRTKN+P5jTkHeOfMlEjPDIqA3S/CPVXth1lCRkq5XtgzCNlGX/mhBkILx8pnYkLu2B/Rwfk2DLPNUSihOftHHkfM+4WuWg+VlO6c7QD8pCCHcwInz2kXFOUqOOcNGhgXMR/9O69z1E+9gs0HqOWeRu6SxJnRRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMI2NQsZ6stQEjH0utUjP6bgdByWISlbmqAeVZ5Y1bM=;
 b=Wh314b29HETtsoBVbRf0+Zdk96QBnopS+nwvDjeZBV/nkpya5CC5Xh8kGuYBMUxaTE1+na+in+gRW7PWFPEvW32X8VX+IhG1SN+GyauUbSHYrU00kZX8CdIQR2Q/g+hnhJIvFCwNTgixJGOCyi7KSYHo14uA/Dbzohdma4YcC+yBthMRhY7ycnV+dWyVUpfdpidFLzkbMoTa514jADrnjAIcKVGdFRhq6JxwkIbMbAbBb2Z590NENDTdBuFa4pe1EF9jYiU0JW1fckCw8i23aokgrBz5m0DkEIXtM9Pk7zOGC5H6KD/bgxSE3joXnrCi5SQgNnWAnMuN2SHA/5j4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMI2NQsZ6stQEjH0utUjP6bgdByWISlbmqAeVZ5Y1bM=;
 b=NwwVdjMZpzjynIctlRT3Kxvx6CYQEedMfTAciii2vMsKS3gKoEA2cVG0rqP8M9GYBw1xdfIgZrqkiTt05yMsI2AqWNbXLyVkbB/Dp3kPUQqvGoY42pTY3M/kEjuFB+9CPHhkgFlHGPbPgobOamlALE9c+uo2eqU4zzt9bM8XGk4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <106f7722-2f81-41cf-83a7-c6fe41632a27@amd.com>
Date: Wed, 27 Nov 2024 12:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm32: Get rid of __memzero()
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241127105512.88703-1-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241127105512.88703-1-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|DS7PR12MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: d05f2242-4746-40f0-c310-08dd0ed9516e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qnd6bTU1V2tsTE1ZYjhvTkpFcGNPL2tRUmJGd2F6NmhPVnZoUGVBdHFQQ3hC?=
 =?utf-8?B?TlpnQm11bDlBb216RVdxSkpMVG1ISTE4QlB2WHl0VncyUjRJdG1LUTVZM1JP?=
 =?utf-8?B?ZkNDNktNaVA0ZTVZVFVYZ0pyVEVBdnQ3ZzJJM0VsZHp4bWxSeFd4d3B0SndG?=
 =?utf-8?B?WWo0d1Bwb0drUzlxbDM2YUhhUlI4bmNxcVpHd1o4RTZyUmJrM1Q0NUgxenlj?=
 =?utf-8?B?dStIVjlGYkNxb3RQQ0hucFNuSytHRjJhYWVKNGJzMzVOODZPWXhVN0VRN0NW?=
 =?utf-8?B?MlY0VVNZeDNENGVUdCtZVE54WmVXb1lFb3V1NEE3cXlWYXBKdVVBb1ExaFlw?=
 =?utf-8?B?eEpoMDlaRTNDZFowWFNocW4xd3RST0o5UjNwRVN1Rm11Nk5ScjRXSzBlT3BF?=
 =?utf-8?B?NkZmUko1T2t3dFY4bDR0MlUrTEQ3UGcxWkpPeE56QytYMlZ0SFk0MDBMS3V6?=
 =?utf-8?B?TWJnbllxNUorVHJ4RVlFWmh0RWRmUHNqVFVITmM3bFFxTmFUTnFQditncUli?=
 =?utf-8?B?SnpCSHJKRXZZNjRLc2xPNFBrQ2Mzd3VPcEc1dkVNTWFhOS9GK2ZJbXNhQUpN?=
 =?utf-8?B?cEd0R3ZEWVZWSlVUVGVnSVFLME5URitjUmZqMDRDbFMyNVRmRTBTWTI2eU50?=
 =?utf-8?B?WXUvSFF5T0NneEVUWExOdEFzWFNEcnh2eERsd3FjemZ6VlRTV1pQWmVCb3hP?=
 =?utf-8?B?MVNyT0hYRWRqVk9ubG15dWQ5Nmd3L0w1ZTltSDZGcWhhUGd1UnBaLzdSdW1t?=
 =?utf-8?B?T0lpQ0JnN00rUmEwVWNuZzN6ZEtlOVViS2dpc2U5RGJsTWlGMlFrazZFOVJt?=
 =?utf-8?B?TklqdittaGFiUDcvcGcrdks3dGhjYmg1eXlNMi9LQmk0am01QnJUOFkyR1NO?=
 =?utf-8?B?WUNrdlppWVg3Wldwdkg2OVBrb2llWlhNZXk1RitXTGwzSE9hY05IQi81UTZR?=
 =?utf-8?B?VGN4N3prOWV1T0lCaFFPQmJaSUVRU0VKTGU4K1M3elJudm1qVE00cTE0bVFX?=
 =?utf-8?B?bC9TMG45WW40aktLVzFiQW1PbHdKTkQzN2Rqc1hzZVVDalo5Rkc0cTV6WjF3?=
 =?utf-8?B?Q1dyRzExaWhzdXk0VWtiUm5kem1DeXUwSGNmT1ZoOTRZRERLUWRJRkdpeENG?=
 =?utf-8?B?cW9UOGtIbHpJMDcvUVNGOVZBbnF3QUREUk5iR2VGWW1Eb3dmaU9TMWRVMjR3?=
 =?utf-8?B?OG5kdlpDVzY5Y3hKenpyU0h6dTlMWDR5WVJ4K2YvWm5GcGc5eVBXeU5meVNw?=
 =?utf-8?B?a0J2czQ1OHBQeFpNV3Uwai84K2ExZ3VWN0drdkZlVzZMT0tyWWd0WVptSE83?=
 =?utf-8?B?dzE0bktJKzJtMzlndXR5ekYzSWxpNGJXYURyVGFaWGJBeGF6NlU1UzlMbDl6?=
 =?utf-8?B?a0VaSEVNWnA3QzdabkNQamhJemJQSnJkVk43akFyMTR2TnNCZGVodW5MYko2?=
 =?utf-8?B?b3ZMR2NYbFhrMG9TNVltWEprcFduNDV3OE02V2xrNG9yeHlDcXZ5S2dqNHl2?=
 =?utf-8?B?U01zM1RpeHdPbitqdHVUc3hqcy82R1lIempkNS9HeC9LRFdHNUxqUFNhSjRE?=
 =?utf-8?B?UkFucnlYNVl6TUNMR1ROWG5lVUtxYnFJYjFiVDRhRktQeW9uZm12d3gxdzlY?=
 =?utf-8?B?R2M5czRld0xOWjV5M3FvMlZ6Wmw3VnZ0VE9IV000TWsyVTB4QnJQTkh1NlRJ?=
 =?utf-8?B?VlhFSjZoeW9sczBoY2tvb0tLMzc5d2wxZnpMbGRyODFDTVdXMy9DMktua2dH?=
 =?utf-8?B?cG8rcXRxVXgzVFZmMUdVZlRwUmVLWnlucml5T3RLcVRaK0laZFpLMW9xd09O?=
 =?utf-8?B?cE9aYVdFc3ExWHpxdS9DRE1xZVh5aXhVYlk5S1NLWkZzQzlZaDVMTG1EMTJo?=
 =?utf-8?B?bnJyUGRNWS9EWWluY2VDaFZoQWFiVnY3Wjd6bktzcGlIMWtLZXZ3TzJ6bVJS?=
 =?utf-8?Q?YI+/DW7antKkzWvpCVdO3gNgRMkGRbu5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 11:47:49.1821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d05f2242-4746-40f0-c310-08dd0ed9516e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9525



On 27/11/2024 11:55, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> All the code in arch/arm32/lib/ where copied from Linux 3.16
> and never re-synced since then.
> 
> A few years ago, Linux got rid of __memzero() because the implementation
> is very similar to memset(p,0,n) and the current use of __memzero()
> interferes with optimization. See full commit message from Linux below.
> 
> So it makes sense to get rid of __memzero in Xen as well.
> 
>     From ff5fdafc9e9702846480e0cea55ba861f72140a2 Mon Sep 17 00:00:00 2001
>     From: Nicolas Pitre <nicolas.pitre@linaro.org>
>     Date: Fri, 19 Jan 2018 18:17:46 +0100
>     Subject: [PATCH] ARM: 8745/1: get rid of __memzero()
> 
>     The __memzero assembly code is almost identical to memset's except for
>     two orr instructions. The runtime performance of __memset(p, n) and
>     memset(p, 0, n) is accordingly almost identical.
> 
>     However, the memset() macro used to guard against a zero length and to
>     call __memzero at compile time when the fill value is a constant zero
>     interferes with compiler optimizations.
> 
>     Arnd found tha the test against a zero length brings up some new
>     warnings with gcc v8:
> 
>       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82103
> 
>     And successively rremoving the test against a zero length and the call
>     to __memzero optimization produces the following kernel sizes for
>     defconfig with gcc 6:
> 
>         text     data     bss       dec       hex  filename
>     12248142  6278960  413588  18940690   1210312  vmlinux.orig
>     12244474  6278960  413588  18937022   120f4be  vmlinux.no_zero_test
>     12239160  6278960  413588  18931708   120dffc  vmlinux.no_memzero
> 
>     So it is probably not worth keeping __memzero around given that the
>     compiler can do a better job at inlining trivial memset(p,0,n) on its
>     own. And the memset code already handles a zero length just fine.
> 
>     Suggested-by: Arnd Bergmann <arnd@arndb.de>
>     Signed-off-by: Nicolas Pitre <nico@linaro.org>
>     Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>     Acked-by: Arnd Bergmann <arnd@arndb.de>
>     Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ff5fdafc9e97
> Signed-off-by: Julien Grall <jgrall@amazon.com>
In case you need Arm's ack apart from Jan's Rb:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal



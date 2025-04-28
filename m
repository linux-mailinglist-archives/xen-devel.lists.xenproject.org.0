Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DCDA9EE27
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 12:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970444.1359134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9LvN-0002J0-Kd; Mon, 28 Apr 2025 10:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970444.1359134; Mon, 28 Apr 2025 10:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9LvN-0002Gn-Hl; Mon, 28 Apr 2025 10:41:21 +0000
Received: by outflank-mailman (input) for mailman id 970444;
 Mon, 28 Apr 2025 10:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+1Z=XO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9LvL-0002Es-L8
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 10:41:19 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2418::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50df160b-241d-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 12:41:18 +0200 (CEST)
Received: from MN2PR11CA0001.namprd11.prod.outlook.com (2603:10b6:208:23b::6)
 by CH3PR12MB9170.namprd12.prod.outlook.com (2603:10b6:610:199::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 10:41:13 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:208:23b:cafe::6b) by MN2PR11CA0001.outlook.office365.com
 (2603:10b6:208:23b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Mon,
 28 Apr 2025 10:41:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 10:41:13 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 05:41:11 -0500
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
X-Inumbo-ID: 50df160b-241d-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7Z06qoHn0T/of+I5DVqQrwC+j1AV/8QAK4Lymscf40Xnpr+te9APShmYZ8X+AHNBhEAW9SSsTN0VlIlNSNga1/Z9p4H1fKQnLtkj2ow6eMEFBQrS6OeqVpSZRC84XFWHetTlP5Tb72LKKbMI61cH3yZpCFXVUuZtEZPDvYH22gwj0MzS9VPvbGkrwHHrZK+4tC1iWYO3Zdnrq5f7ohDI4Ii1+Xz8Ranc0dil+I5s51F2NBv8XqW8+worqC/XzX+LvZTRPNNn0TNTPkNnfY96FplN5wi2JHxFwYyRCh4oTFq+iF9uYuhRawyL7yRULzhqv7TY2rjJ6r7H/iph2Zteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3kAo3AB5BRNQwYpw3S9KJQOTJGWIFugK5OLFFCeLtY=;
 b=j7AujUsnShZTd5EItxs0ASsTB+JwP1wYUbx/6/dqwKhtafkOVj4nbKP7bSS6bk/EpDX659OI5NViexbpuE4dPeeLJwa3jWDrIQWTWBMEgvbbmqOUnFY7ZNz/9iZ6c9VleenP7+Lz12Ve9OwU8kDPd+8N2fSdzKqzKCbsVv5zZxK60ZAWCSwSvuBO9ORiNBAjNMW60TuJjjLQ72kaE4MdCjcyqmHw5jzDmjpiIDyFVBjMKF/1eDUYxPrs7ikeYFgLpvi/5HQRAqiqkCsRE5OX+rKUFLQnWHFSSqxsKdgMq9uNVjOXI0eG9g2Cu2Ler2m6V2xgdzSI2dFwhr5WX5vvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ariadne.space smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3kAo3AB5BRNQwYpw3S9KJQOTJGWIFugK5OLFFCeLtY=;
 b=vZu1PjY/1cjW+dIZn26/bihwQdfJzedHxMPxW3p8CMLSjrdOmfgubIQcaiDsyPQCIjZ5c0npy8W9LZ6HvNBJY6dsidkXPlHZXzHNv1Ql5RPp/XOzyR7lMAzMzclatGAlFd84vtdxFSoP7LiBoFkkX3Zi6f16x6d+h2hB9Y1s52I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Apr 2025 11:41:09 +0100
Message-ID: <D9I7IPTW9O0K.2OCSEF8GXP3K7@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Ariadne Conill <ariadne@ariadne.space>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Alexander M . Merritt" <alexander@edera.dev>
Subject: Re: [PATCH v2] x86/hyperv: use dynamically allocated page for
 hypercalls
X-Mailer: aerc 0.20.1
References: <20250425234331.65875-1-ariadne@ariadne.space>
In-Reply-To: <20250425234331.65875-1-ariadne@ariadne.space>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|CH3PR12MB9170:EE_
X-MS-Office365-Filtering-Correlation-Id: d83b120d-b799-4cbe-d979-08dd8641326b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHFZNWlaYzZVaEszNlZtaHBQZUp4K3BuYWkwVldaL0lsMzhVL3QybVYwVmk2?=
 =?utf-8?B?U2J1bmJpUG12VHlHNU02V2tPdkJLWXdKckNqQUV2QjVVamk1cFpaWERjeW9K?=
 =?utf-8?B?U3FrRmpqbzI4bWJEZ2hlV2d1b0xNQlRPaHpHb25zZnZ5TFZFdzVUcEM3TXJ6?=
 =?utf-8?B?dDlMTVdORHNoRlVLRWlBZ2JxZi95L2U0Q3hDRW10VElvYnZ4aVczN2V0aXFX?=
 =?utf-8?B?K3dLSW1aaG4xSVVBY2lrRjkyOGlFVFFHT3paeHlFSThXeEEzU1lIcTl4eFZy?=
 =?utf-8?B?cVdJZUJFZ2REejJmdktic3pHSDVSR0RPWG9oWFlkMjlFZmd6c09hdnp6TUw1?=
 =?utf-8?B?c3ZSY0Y5aWVqc3Uvdng2ZFdBN2JidEV6R0M5aU1lQlhWVTB2b0NSNzVsMDJq?=
 =?utf-8?B?MkUyMUk2YmtxT093MG0wYkFLTW1ROVhFUExoUVFYbjJKRzNFQkUycmNrYUpZ?=
 =?utf-8?B?S1NkbGRFT3U4ckwza1BYR3FoN0tMUGFsaGY5c0pyZDMvUmd3Uk0wMmtUaXZh?=
 =?utf-8?B?VUlKK3B6dmJZbkdUUXZSZTZPUTREOUVGbC9rMk5Bb1pVMERTSHZyempqMVhT?=
 =?utf-8?B?QjJJZ3JJamhxYjFJVWRvVWRiNWNwblRRaXlvMkg0eHc5dThtNGhpSEJ1UzA4?=
 =?utf-8?B?YVYwaFZVZy9JdEtROTB6NGphS2ROWUoxQ09SbFlwMXZtTjZ2SFlqWDViWFVV?=
 =?utf-8?B?SGpqSU9WQllBWElwQVdzYnRrOUc5S3JUbzFFaVBvc1lhcWtMZzJnbjlPTkpY?=
 =?utf-8?B?c1J0dGlab2JqUXR5eUd1cmJNMnVlN1FpT1R4dmQwandJaEl3RGlSTHRIQU5B?=
 =?utf-8?B?ajZqQU1nMHY5dWorM3p5ZXREZGZtYUp4TlNkNzJZVjJhOGNGMXRGQXIxL2NU?=
 =?utf-8?B?dEZKZU1ITk10WmE4VEVVd21Jb2IyUFUxVExWeU56RE5DSG5pTUZ1Sm1CYW5h?=
 =?utf-8?B?b2FzSnRFT083UitjK2kvWStDU3htYVlGVk9vRXE4UDJRV2sybVpXNHdNQ1lr?=
 =?utf-8?B?MDVqNit0NnhVV1N3ZytaTzZvald2YWRFNSs2ZFZueENxZTFJb1RFOWszeWhk?=
 =?utf-8?B?Z0taNUlKZXpQVWFFY1h2VVVaMCtVcWxjdEtmRHBkT1ZLeDEvaFY1U0c1WWgw?=
 =?utf-8?B?N1JVU1NTZjlxMUpaOGlKblZxUHMzWmFGc2c5RmNXZGxaY2VzYnNrSDFwT09R?=
 =?utf-8?B?UlFzeHBEYWNsUGZTcFo5QTBTMjFxLzErUmVLRVB3Y1krMWlmKzZDYnpXbWxl?=
 =?utf-8?B?dWNKWVN4QWx5TysrT296dXV2QzBNWndoTGxiTFowbWNzY3VVVnJVenBhVURZ?=
 =?utf-8?B?bHJudDBTMmx1TGJWTDJZL3ErVEZSVENQRlZwTmNoeDJoNU1ZUytHTjBMNXpo?=
 =?utf-8?B?eVVSS0xwMlhsMnBBTWdaRDRpV21zeTJjYVJzUzd3b2ozcUZ4MVNRNnVyWmpS?=
 =?utf-8?B?VndZYVA2MXF1RHBNOTdMOGpxelNtdTdvQ1JHTENJWlZCNm9TMGFkSTZSclZY?=
 =?utf-8?B?eWtBTWI1ZkhtYVQvcUFnQTNNcDRhV1dPZ0lVaUxILys5bU0xdkFZQjBkTWI1?=
 =?utf-8?B?QXZJR3RHTFR1Y1hPVWJvRGF6WVY1aUVPNGkrRlJRNldhMWRnWUhoLzk2dGxL?=
 =?utf-8?B?UVRsNXdQRTQzRDNzYlBGbjc1bXh6ZmtyMzFkZmRpTjFsOG5oaU5ZZXpscExU?=
 =?utf-8?B?RUF5Q1I2SE9hWDBWbEo0a2NGV3RmeGNCODE1cVBZMHMwa1BVTDkrVmtDMFhH?=
 =?utf-8?B?VVcrNEMyRnFqd08rcWRRbXhXbXZoRXpTWC9ZNGpnSExCQ3NsTHA3U0JOdTVH?=
 =?utf-8?B?azczQWpBZmQyZG5kdUdzZmFvSTFoSHVKUjUzTFFjZGxnaGxZbHRkcVZJdHhz?=
 =?utf-8?B?VzBqRG9QcDJkN0Q5WVIzUkJRc2k0YkxjMHZqSmJmbWNkWlphWDlWc1FrUXMz?=
 =?utf-8?B?eThmK0tVdnZneTFRR3U0V0xlUzczd1U2L1lDcVZ3Zkp6Sjh1L1phQVMwbFV3?=
 =?utf-8?B?YUpFb281eVZxNlVZbUVXR2ZzcmE1Nitkc1N6REswNXVLemRONkVTMEpSUGJv?=
 =?utf-8?Q?mZOetO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 10:41:13.2949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d83b120d-b799-4cbe-d979-08dd8641326b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9170

On Sat Apr 26, 2025 at 12:43 AM BST, Ariadne Conill wrote:
> Previously Xen placed the hypercall page at the highest possible MFN,
> but this caused problems on systems where there is more than 36 bits
> of physical address space.
>
> In general, it also seems unreliable to assume that the highest possible
> MFN is not already reserved for some other purpose.

Thanks for sending this!

Just one more thing on top of what Jan mentioned.

>
> Changes from v1:
> - Continue to use fixmap infrastructure
> - Use panic in Hyper-V setup() function instead of returning -ENOMEM
>   on hypercall page allocation failure
>
> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
> Cc: Alejandro Vallejo <agarciav@amd.com>
> Cc: Alexander M. Merritt <alexander@edera.dev>
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> ---
>  xen/arch/x86/guest/hyperv/hyperv.c      | 17 +++++++----------
>  xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
>  2 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hype=
rv/hyperv.c
> index 6989af38f1..0305374a06 100644
> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> @@ -98,7 +98,13 @@ static void __init setup_hypercall_page(void)
>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>      if ( !hypercall_msr.enable )
>      {
> -        mfn =3D HV_HCALL_MFN;
> +        void *hcall_page =3D alloc_xenheap_page();
> +        if ( !hcall_page )
> +            panic("Hyper-V: Failed to allocate hypercall trampoline page=
");
> +
> +        printk("Hyper-V: Allocated hypercall page @ %p.\n", hcall_page);

We should be printing the mfn (or maddr) rather than the virtual address
out of the allocator, IMO. Especially since we need to remap it anyway.

With that:

  Reviewed-by: Alejandro Vallejo <agarciav@amd.com>

Cheers,
Alejandro


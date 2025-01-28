Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1711A20DD1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 16:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878604.1288798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnzN-00065O-Qq; Tue, 28 Jan 2025 15:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878604.1288798; Tue, 28 Jan 2025 15:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcnzN-00063i-MM; Tue, 28 Jan 2025 15:58:57 +0000
Received: by outflank-mailman (input) for mailman id 878604;
 Tue, 28 Jan 2025 15:58:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZLdl=UU=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1tcnzM-0005yC-J2
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 15:58:56 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20620.outbound.protection.outlook.com
 [2a01:111:f403:240a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4fa4fa0-dd90-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 16:58:54 +0100 (CET)
Received: from BL1PR13CA0211.namprd13.prod.outlook.com (2603:10b6:208:2bf::6)
 by SJ2PR12MB7845.namprd12.prod.outlook.com (2603:10b6:a03:4ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Tue, 28 Jan
 2025 15:58:47 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::26) by BL1PR13CA0211.outlook.office365.com
 (2603:10b6:208:2bf::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14 via Frontend Transport; Tue,
 28 Jan 2025 15:58:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 15:58:46 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 09:58:45 -0600
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
X-Inumbo-ID: c4fa4fa0-dd90-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWv1uFZTBFxu5/AZ40nmMYQXw4ddSHlMfDhgrHR4TIq6GCHqEUQltDYNAqvHBWElRSPd6GPHnqWF/Pd/MmMOTT/sMR8QzAg92xuwNkXg4ZeAtbwI6CoyKtRe6vacjFsvWSzQ/jnK8XWLq81je8g+CFzinTf/fCrdDadpXvGbvS1PzuTtmoElcv2nOgnkE+qSzP7LitED9IywV4akpfh0NDfwlhyg1NEVVJngDNqoqQRzIhwLJYtBWsfYcdfKKnexwgY00UP5cQxlJatDakwcSl7tOD4RVKHTM5NKocKuUmWENlPoF3HHCjpSGS3ntPs1ID7e6tswMOhG6QarHOvMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEhsfYBVZQo4xIDSDB11GyqSin8BWPKS2GpjOm8/svY=;
 b=YyNX74QiTekndLn1W2TP2hnEsMM7fj5p9QW4J0tDwpOFqP8cVPQi0FQGankqsKLTobTKCcdINBv5B+BFOAmkSR7vlibMXhDHmM34I8aSc/salWMnL2aPrJfVY74Wy8i3tjJuQt6GmXzhxAO9ZQTRbzIC8yeUe99zs6I8bn49dL7VO8Q4Pwhf+hpdrdiq0Q7Ig/bqjbGSE2mJ3jeK+nI/BPOEbVcvq0CH/lzZUMvufjLS1P9+uNxGwrCMJ2g9RAVuzyAFzaEKRiFhT4y36WedZGl+cA1ZmUOX8zTK8+VY85qRG0ot7YhsZPXz+SHJX7oC2QmPfL+45pej5f19eo4VXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=aepfle.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEhsfYBVZQo4xIDSDB11GyqSin8BWPKS2GpjOm8/svY=;
 b=aZQmd0vr2SIZohc/BBbWSBpBwX59pRRshOhERXluPURhWJAJRKC2gW+jlvpTdcvM2nWQjFbxDtiyU9Ys3kDyjvp3eb41lcb8JC+ArY8qfVxpc6+r41xqQZaZJQX7hXA1CPPAoKvJyEZJ8BeJVm4IAgZ1qQoH53P/VvGC/HMOZPs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Tue, 28 Jan 2025 16:58:42 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<jgross@suse.com>, Anthony PERARD <anthony@xenproject.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: slow start of Pod HVM domU with qemu 9.1
Message-ID: <Z5j-bkdFZ7riavv7@zapote>
References: <20250128151544.26fc827d.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250128151544.26fc827d.olaf@aepfle.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|SJ2PR12MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: f19e9cb2-8b57-4332-c8f8-08dd3fb4a5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SeUZOXi3aZal8LBQn2cD4iH6o+DTEQTXqTokBaAYYfaOFvxfnZ5zUs0Cydtw?=
 =?us-ascii?Q?tTg0K67OSNxzSeuIdVLA03EM63b8a1DapTJRDrdUp2WWqsGYVIM3G7m8MFRA?=
 =?us-ascii?Q?a66jMkPihL/aXqK7J0t6HmOGUsFw4+UBSNT+nmhxxPQucAa94zpEOffJJYxJ?=
 =?us-ascii?Q?Dgj1tEfdabpVi2/7rOi9PtTtPB2Pdxcr2mLSfN3n3FP8DI8R3l55XZ6eHsEK?=
 =?us-ascii?Q?SCyK/LEYQ7PIzDvm9VhEu4TE/ztNCm/bw6WxH7cY+e9KTXMLw11MVWOOXYCD?=
 =?us-ascii?Q?YsWhGFpWU8yXSQxJYgpsNzUAOYGfwUJxTgGASATCHcaG/HTiB0hohwJ58I/F?=
 =?us-ascii?Q?XvvwceAPXx/s4o8HWfpy1HWS4GCZiGWuTYWyKTq/jAhoNmcltATVy8vqshgX?=
 =?us-ascii?Q?2XfzVUCAlr1DB0dYFZMrsONIwV21t7KtkPUkuJxsAI9ko2CjDObGlqWllgyN?=
 =?us-ascii?Q?LciFYvjkHob6vgTWvEIzLzriZY1WopzLGmi5tOnoCLWMoFwIBTJgJA3knS/y?=
 =?us-ascii?Q?f5I0LUsrZwrnLgI1uFbWVuhBV6eZRUqs6v5dLoEAzr8WTMvX1je+9GNqffqU?=
 =?us-ascii?Q?OKMUV2z2hnqvcdwv9Keb6+6M2pRBrhbXbt+g8KLb4CFVsIH+MXvGERCTxP7C?=
 =?us-ascii?Q?p3loQJV+EFUPoAcaWk6hux8SD6l0ZNu7iioFhOg1ojCgn1xtN8kBmDu8A4PW?=
 =?us-ascii?Q?jXokHD5tis6CqSe6wiAtWUkKAC5sXKgLuW+duJyTuXsJPKysltlhOmoIm9Bq?=
 =?us-ascii?Q?TlXRaLoogADxJJZHWFRNHVTVebskLsIWiXd5oOnCkh+jKDOlOhP8axzx9esp?=
 =?us-ascii?Q?dx3URFRTSO0gz0w75/TTiYEYAQQpf7prFfVcI4VLLtL2bp6OLJCM/gSHdvRY?=
 =?us-ascii?Q?NQeck5uyhqtZuugLFfXppcOofdN+kRqcb+uMEQgKnYUKTyCoCi9m5I34oEtU?=
 =?us-ascii?Q?ZkLtp242Kyn8Z/5q8t0LtDC1NuP6q5BmTX5oMB0IGzqlvktzRvb1VQNQCQSc?=
 =?us-ascii?Q?+lf7avhmccTysPZfbvh0qg1t4LBe9ZuEhhMBZlw+d54s1+T6CKvAWCT2NYXU?=
 =?us-ascii?Q?7J2GWdz/rnjaD77Rha+qisOZwVjAmB0cVk2xGeBHEGWe7kXuPclwbQ775jq3?=
 =?us-ascii?Q?FrTXRStncJNRzVbTD9B4whdLRNGcr+mGhuB9dsxc6jtAbNpcL6jYDU7InxqP?=
 =?us-ascii?Q?KIQUEFfVFbzDmiK+oHlsXhY9lnZT1MThIZsqohOhBrb/eui4yZq52YXWqEav?=
 =?us-ascii?Q?qpGDkWbwqb6z/LM4Y9ZBXu7dl3QkNSDwEOFidOxZabwzzIIbl8WJWj3NbVby?=
 =?us-ascii?Q?OzTkSUFgVJjBKpuGoQ3DawKa4fgrT4OMEmub9hHPTLmcEaZQqh97Xn5524iL?=
 =?us-ascii?Q?6qBm4BpLbHkAPbkSmD3pgBXIWGTTDnLMBfc2sQfYoqym2NFS/fF8LrSMJdAU?=
 =?us-ascii?Q?+alO67uorUcHXqsSn4fmmlzPyVxA2cKcPb63wMM2vkm8fzW21w7eMIG/CpkM?=
 =?us-ascii?Q?AS+7M7neH0eewso=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 15:58:46.3628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f19e9cb2-8b57-4332-c8f8-08dd3fb4a5c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7845

On Tue, Jan 28, 2025 at 03:15:44PM +0100, Olaf Hering wrote:
> Hello,
> 
> starting with qemu 9.1 a PoD HVM domU takes a long time to start.
> Depending on the domU kernel, it may trigger a warning, which prompted me
> to notice this change in behavior:
> 
> [    0.000000] Linux version 4.12.14-120-default (geeko@buildhost) (gcc version 4.8.5 (SUSE Linux) ) #1 SMP Thu Nov 7 16:39:09 UTC 2019 (fd9dc36)
> ...
> [    1.096432] HPET: 3 timers in total, 0 timers will be used for per-cpu timer
> [    1.101636] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [    1.104051] hpet0: 3 comparators, 64-bit 62.500000 MHz counter
> [   16.136086] random: crng init done
> [   31.712052] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 30s!
> [   31.716029] Showing busy workqueues and worker pools:
> [   31.721164] workqueue events: flags=0x0
> [   31.724054]   pwq 2: cpus=1 node=0 flags=0x0 nice=0 active=2/256
> [   31.728000]     in-flight: 17:balloon_process
> [   31.728000]     pending: hpet_work
> [   31.728023] workqueue mm_percpu_wq: flags=0x8
> [   31.732987]   pwq 2: cpus=1 node=0 flags=0x0 nice=0 active=1/256
> [   31.736000]     pending: vmstat_update
> [   31.736024] pool 2: cpus=1 node=0 flags=0x0 nice=0 hung=30s workers=2 idle: 34
> [   50.400102] clocksource: Switched to clocksource xen
> [   50.441153] VFS: Disk quotas dquot_6.6.0
> ...
> 
> With qemu 9.0 and older, this domU will start the /init task after 8 seconds.
> 
> The change which caused this commit is qemu.git commit 9ecdd4bf08dfe4a37e16b8a8b228575aff641468
> Author:     Edgar E. Iglesias <edgar.iglesias@amd.com>
> AuthorDate: Tue Apr 30 10:26:45 2024 +0200
> Commit:     Edgar E. Iglesias <edgar.iglesias@amd.com>
> CommitDate: Sun Jun 9 20:16:14 2024 +0200
> 
>     xen: mapcache: Add support for grant mappings
> 
> As you can see, v4 instead of v5 was apparently applied.
> This was probably unintentional, but would probably not change the result.

Hi Olaf,

It looks like v8 was applied, or am I missing something?


> 
> With this change the domU starts fast again:
> 
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -522,6 +522,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>      ram_addr_t addr;
>  
>      addr = xen_ram_addr_from_mapcache_single(mapcache, ptr);
> +    if (1)
>      if (addr == RAM_ADDR_INVALID) {
>          addr = xen_ram_addr_from_mapcache_single(mapcache_grants, ptr);
>      }
> @@ -626,6 +627,7 @@ static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_t *buffer)
>  static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
>  {
>      xen_invalidate_map_cache_entry_single(mapcache, buffer);
> +    if (1)
>      xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
>  }
>  
> @@ -700,6 +702,7 @@ void xen_invalidate_map_cache(void)
>      bdrv_drain_all();
>  
>      xen_invalidate_map_cache_single(mapcache);
> +    if (0)
>      xen_invalidate_map_cache_single(mapcache_grants);
>  }
>  
> I did the testing with libvirt, the domU.cfg equivalent looks like this:
> maxmem = 4096
> memory = 2048
> maxvcpus = 4
> vcpus = 2
> pae = 1
> acpi = 1
> apic = 1
> viridian = 0
> rtc_timeoffset = 0
> localtime = 0
> on_poweroff = "destroy"
> on_reboot = "destroy"
> on_crash = "destroy"
> device_model_override = "/usr/lib64/qemu-9.1/bin/qemu-system-i386"
> sdl = 0
> vnc = 1
> vncunused = 1
> vnclisten = "127.0.0.1"
> vif = [ "mac=52:54:01:23:63:29,bridge=br0,script=vif-bridge" ]
> parallel = "none"
> serial = "pty"
> builder = "hvm"
> kernel = "/bug1236329/linux"
> ramdisk = "/bug1236329/initrd"
> cmdline = "console=ttyS0,115200n8 quiet ignore_loglevel""
> boot = "c" 
> disk = [ "format=qcow2,vdev=hda,access=rw,backendtype=qdisk,target=/bug1236329/sles12sp5.qcow2" ]
> usb = 1
> usbdevice = "tablet"
> 
> Any idea what can be done to restore boot times?


A guess is that it's taking a long time to walk the grants mapcache
when invalidating (in QEMU). Despite it being unused and empty. We
could try to find a way to keep track of usage and do nothing when
invalidating an empty/unused cache.

Best regards,
Edgar


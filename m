Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C47A21B4E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 11:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879082.1289304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td5ht-0007FT-BU; Wed, 29 Jan 2025 10:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879082.1289304; Wed, 29 Jan 2025 10:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td5ht-0007D9-7p; Wed, 29 Jan 2025 10:54:05 +0000
Received: by outflank-mailman (input) for mailman id 879082;
 Wed, 29 Jan 2025 10:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AXM0=UV=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1td5hr-0007D3-Sd
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 10:54:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5893bb2a-de2f-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 11:54:01 +0100 (CET)
Received: from BLAP220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::9)
 by CYYPR12MB8891.namprd12.prod.outlook.com (2603:10b6:930:c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 10:53:55 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::8e) by BLAP220CA0004.outlook.office365.com
 (2603:10b6:208:32c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.22 via Frontend Transport; Wed,
 29 Jan 2025 10:53:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 10:53:55 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Jan
 2025 04:53:54 -0600
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
X-Inumbo-ID: 5893bb2a-de2f-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dob1yXzAGPcEHr4VACS79SW6iDMoCT+9o18ZPOWXMiS77xq0CdIED1Iad1GWHQmCL36js0GPmpFGtNvWdvZWLSGMfSVD46uX5ljZG77sEpmn/iPghcGZUy5jnpZe3AXY6SfRcPV1MmYswF5flN7hUcOrNDYlwT61jKM2Fa/43SrrcvLrKUCvsAX0g/t/vhjvQkmIVmm8rEZ/c05NYi1lqRz3f+536Q6LQjSEcd7V8KThIZTtbFSdWVyiD/YN59D7iDKNIeoR0W7Jd6CpfDbEwT1UaFzCfjGkxuCzGeqHlCOTUvomUJWcM1aGtFpCTiYI5i6s2xbV+iCQM8HhliaDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vz8mutcAwbkjWFcYhZiURoRr/ACP7Y1DWywHwfkv+lo=;
 b=d40i/gvLuyyFwDbJqnKqlARBeCMp7fUJ5jfJuI3RCgpzSfKb/OpM9vpS0CBFLV4wr6KFXSSwD3LZ5nQn4imhEnaYpaDS4EBwoNYtaBeFSLEADvVXjg/htWJVivLDldBouk/2wqH9Yfk6RfH+SYJvNwRu65O+0xGBJm6GU8Czva9EmjxprXZjpcHA670Nm6xFuxHx07FWAK6HnAhjDisB6ofdmPxrzV94sSW8PEcKAHZTslFXQq2rCMKnmOqQGy3WbO3bLHT8+Pt5iPdypiO6onpu3ZJwKxNEF0wKXBFpbzPzzE99CN5C98lJBjFheztGOKc4jWx/VlzepeqXnypc2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vz8mutcAwbkjWFcYhZiURoRr/ACP7Y1DWywHwfkv+lo=;
 b=xY0ejVBMXmAOksc7nhMxstnb+pkS+M64H4LV1t4NIap0OZD5c3V84I9HsNKGS0/AAKDIoDsvWMmRtmYRrjrfMB4+C5R+91rxpi9E95bH5ES6MVFH0vY2lTtBVHerkjgjmyYaL4WoNE1ReZx0jnY9cgQ6NGDlOResvzU2nHxxFPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Wed, 29 Jan 2025 11:53:49 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>,
	<jgross@suse.com>, Anthony PERARD <anthony@xenproject.org>, Paul Durrant
	<paul@xen.org>, <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<roger.pau@citrix.com>
Subject: Re: slow start of Pod HVM domU with qemu 9.1
Message-ID: <Z5oIvUINVDfrrVla@zapote>
References: <20250128151544.26fc827d.olaf@aepfle.de>
 <Z5j-bkdFZ7riavv7@zapote>
 <alpine.DEB.2.22.394.2501281543580.3264561@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2501281543580.3264561@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|CYYPR12MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: d342580a-2b02-4149-62a0-08dd405339dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PGEsJdTlGVlNbj1Hr9o52Mkq5Vu10Mv5GzCpWdbQA6o3TL1+7mWpAvFsQZKY?=
 =?us-ascii?Q?z5POg9E9+NLr0FbszvA/A1or7FRis8ZsLFT78/LSdOZqn5TAvW4O3hOr/B2q?=
 =?us-ascii?Q?Gp9GftgCQztWTCToDSI5rSjF1eohkrXT6AdkeAZNumvefDKeOp9Iog2GevBG?=
 =?us-ascii?Q?Zjz7nh2DBpGAfpxtbBWMZVOhzzvVXWtK18HVCEe14iQIMJL35Bu1vxfUNjoT?=
 =?us-ascii?Q?UQJRP1iMdK4WpJdECioeru+p9YzDKjS7bJwCX9IKqkmq7yZRQk+YpOlyvPyQ?=
 =?us-ascii?Q?Rwd5Lys0OWhhlA3uHeZii+Hw8gNUacLDalJJs0dhVdalq8unj4KsU0huZS2/?=
 =?us-ascii?Q?5/qjY4RPu4AGjMnDAq3wO3zwWWfdYoz6mmpOoLz9ToMSPU7E94vGTelgJXes?=
 =?us-ascii?Q?g+uUduKhPWO7CZZniuW2imNzR6RpgIH3LQwKNDeQLuQ62q+Me1CdFzTpo87H?=
 =?us-ascii?Q?EunTUiblmqU0xxZHwbPfJAZopqV2eftUEff3rjDCajuWApt1yB+yq3WC0Nox?=
 =?us-ascii?Q?mufm4vlRFtSV0JSjqBXh7Ar0vwxcDz3ZeHpcgqZJk+S42vF04Vw32TpfQu2J?=
 =?us-ascii?Q?SKL635M/qaJmuiIaivNG7qJsNf2WiWLhFGCcFULrLjtXg4zE6FD8PI2sRTx0?=
 =?us-ascii?Q?SElfyg2DC68R49KAvv1Td30c9SX+K/ETGOZ5E/w0Xc6nhnPcrrMPaa9jBW0a?=
 =?us-ascii?Q?S2xEuxiZZm16MJzNc2MD+6G4EoHUn6g3MglTObkZmBgom/lXt4R+3hcBorco?=
 =?us-ascii?Q?Sj3VKBBQuxYfd1/nDKy2O/bl82gITugOC06sanECtXFr8UbN1rjRJHfUPIsF?=
 =?us-ascii?Q?ZFufJ/5srB2/HIbqZ/Yb/tqQez/BoKK7orrapYLvaaz6WXLajcALZMcUY/yf?=
 =?us-ascii?Q?zH7XtLKTyTJ9N4v7WmQBbU7/RTr92lEbpN3mhhhxwGjQVBEA5zb88YTVjW/K?=
 =?us-ascii?Q?zO9d0tqKHXgRbtL1cSGLNNBAUPj1SFH0Dy8sYl1gDOAGI9xrAflRkV0tlurt?=
 =?us-ascii?Q?oJksfEig34LUUN8St3vpFJA0KPBR3AuUFyUezQ0VY4l/7Ad2I4Gp07Ko0IPp?=
 =?us-ascii?Q?AL5yANlE4MP6Q/37CzGfFqQ9h1mwtZmo95NKx858/9ifgmUxrMGxk5jDhCXu?=
 =?us-ascii?Q?28BGNmoUAf5P+DD7V0vG7pFfupplFQawePd2nSQfMzVE8VEh0tz7BqD/y/XI?=
 =?us-ascii?Q?EjGOP5v011J1rzWle8LVzkfwxVWEtVh5t96VIMnV+iUNpQnw9ZmptGor2Rbr?=
 =?us-ascii?Q?TC7BLRCiA8jLEu3Xd+qUoqglQwt0eF5tuMgqDR5q+zrIMfhGOsu9BrSmBjPF?=
 =?us-ascii?Q?aSL3kacLPjvBgbgPJVNSYAQtUF1Q6u0hL0cu+mwjju+OO0eUVYHy69ty/UeH?=
 =?us-ascii?Q?Fl167/O7Do8WHVxM1AJp9MJnJFvmR0HXFgqPuvVLR+BDqCvP5M9Gqx9kgQ6M?=
 =?us-ascii?Q?dKMnd0vcv/aiuKxMNYdQaWSpWpAtftnSfDMMT/KZrX660+93PxOLXahhBVeX?=
 =?us-ascii?Q?HPoogpIaUc4ij5E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 10:53:55.3061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d342580a-2b02-4149-62a0-08dd405339dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8891

On Tue, Jan 28, 2025 at 03:58:14PM -0800, Stefano Stabellini wrote:
> On Tue, 28 Jan 2025, Edgar E. Iglesias wrote:
> > On Tue, Jan 28, 2025 at 03:15:44PM +0100, Olaf Hering wrote:
> > > Hello,
> > > 
> > > starting with qemu 9.1 a PoD HVM domU takes a long time to start.
> > > Depending on the domU kernel, it may trigger a warning, which prompted me
> > > to notice this change in behavior:
> > > 
> > > [    0.000000] Linux version 4.12.14-120-default (geeko@buildhost) (gcc version 4.8.5 (SUSE Linux) ) #1 SMP Thu Nov 7 16:39:09 UTC 2019 (fd9dc36)
> > > ...
> > > [    1.096432] HPET: 3 timers in total, 0 timers will be used for per-cpu timer
> > > [    1.101636] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> > > [    1.104051] hpet0: 3 comparators, 64-bit 62.500000 MHz counter
> > > [   16.136086] random: crng init done
> > > [   31.712052] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 30s!
> > > [   31.716029] Showing busy workqueues and worker pools:
> > > [   31.721164] workqueue events: flags=0x0
> > > [   31.724054]   pwq 2: cpus=1 node=0 flags=0x0 nice=0 active=2/256
> > > [   31.728000]     in-flight: 17:balloon_process
> > > [   31.728000]     pending: hpet_work
> > > [   31.728023] workqueue mm_percpu_wq: flags=0x8
> > > [   31.732987]   pwq 2: cpus=1 node=0 flags=0x0 nice=0 active=1/256
> > > [   31.736000]     pending: vmstat_update
> > > [   31.736024] pool 2: cpus=1 node=0 flags=0x0 nice=0 hung=30s workers=2 idle: 34
> > > [   50.400102] clocksource: Switched to clocksource xen
> > > [   50.441153] VFS: Disk quotas dquot_6.6.0
> > > ...
> > > 
> > > With qemu 9.0 and older, this domU will start the /init task after 8 seconds.
> > > 
> > > The change which caused this commit is qemu.git commit 9ecdd4bf08dfe4a37e16b8a8b228575aff641468
> > > Author:     Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > AuthorDate: Tue Apr 30 10:26:45 2024 +0200
> > > Commit:     Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > CommitDate: Sun Jun 9 20:16:14 2024 +0200
> > > 
> > >     xen: mapcache: Add support for grant mappings
> > > 
> > > As you can see, v4 instead of v5 was apparently applied.
> > > This was probably unintentional, but would probably not change the result.
> > 
> > Hi Olaf,
> > 
> > It looks like v8 was applied, or am I missing something?
> > 
> > 
> > > 
> > > With this change the domU starts fast again:
> > > 
> > > --- a/hw/xen/xen-mapcache.c
> > > +++ b/hw/xen/xen-mapcache.c
> > > @@ -522,6 +522,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> > >      ram_addr_t addr;
> > >  
> > >      addr = xen_ram_addr_from_mapcache_single(mapcache, ptr);
> > > +    if (1)
> > >      if (addr == RAM_ADDR_INVALID) {
> > >          addr = xen_ram_addr_from_mapcache_single(mapcache_grants, ptr);
> > >      }
> > > @@ -626,6 +627,7 @@ static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_t *buffer)
> > >  static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
> > >  {
> > >      xen_invalidate_map_cache_entry_single(mapcache, buffer);
> > > +    if (1)
> > >      xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
> > >  }
> > >  
> > > @@ -700,6 +702,7 @@ void xen_invalidate_map_cache(void)
> > >      bdrv_drain_all();
> > >  
> > >      xen_invalidate_map_cache_single(mapcache);
> > > +    if (0)
> > >      xen_invalidate_map_cache_single(mapcache_grants);
> > >  }
> > >  
> > > I did the testing with libvirt, the domU.cfg equivalent looks like this:
> > > maxmem = 4096
> > > memory = 2048
> > > maxvcpus = 4
> > > vcpus = 2
> > > pae = 1
> > > acpi = 1
> > > apic = 1
> > > viridian = 0
> > > rtc_timeoffset = 0
> > > localtime = 0
> > > on_poweroff = "destroy"
> > > on_reboot = "destroy"
> > > on_crash = "destroy"
> > > device_model_override = "/usr/lib64/qemu-9.1/bin/qemu-system-i386"
> > > sdl = 0
> > > vnc = 1
> > > vncunused = 1
> > > vnclisten = "127.0.0.1"
> > > vif = [ "mac=52:54:01:23:63:29,bridge=br0,script=vif-bridge" ]
> > > parallel = "none"
> > > serial = "pty"
> > > builder = "hvm"
> > > kernel = "/bug1236329/linux"
> > > ramdisk = "/bug1236329/initrd"
> > > cmdline = "console=ttyS0,115200n8 quiet ignore_loglevel""
> > > boot = "c" 
> > > disk = [ "format=qcow2,vdev=hda,access=rw,backendtype=qdisk,target=/bug1236329/sles12sp5.qcow2" ]
> > > usb = 1
> > > usbdevice = "tablet"
> > > 
> > > Any idea what can be done to restore boot times?
> > 
> > 
> > A guess is that it's taking a long time to walk the grants mapcache
> > when invalidating (in QEMU). Despite it being unused and empty. We
> > could try to find a way to keep track of usage and do nothing when
> > invalidating an empty/unused cache.
> 
> If mapcache_grants is unused and empty, the call to
> xen_invalidate_map_cache_single(mapcache_grants) should be really fast?

Yes, I agree but looking at the invalidation code it looks like if we're
unconditionally walking all the buckets in the hash-table...


> 
> I think probably it might be the opposite: mapcache_grants is utilized,
> so going through all the mappings in xen_invalidate_map_cache_single
> takes time.

The reason I don't think it's being used is because we've only enabled
grants for PVH machines and Olaf runs HVM machines, so QEMU would never
end up mapping grants for DMA.


> 
> However, I wonder if it is really needed. At least in the PoD case, the
> reason for the IOREQ_TYPE_INVALIDATE request is that the underlying DomU
> memory has changed. But that doesn't affect the grant mappings, because
> those are mappings of other domains' memory.
> 
> So I am thinking whether we should remove the call to
> xen_invalidate_map_cache_single(mapcache_grants) ?

Good point!

> 
> Adding x86 maintainers: do we need to flush grant table mappings for the
> PV backends running in QEMU when Xen issues a IOREQ_TYPE_INVALIDATE
> request to QEMU?

Cheers,
Edgar


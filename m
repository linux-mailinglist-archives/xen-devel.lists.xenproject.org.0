Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DADA21C1A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 12:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879102.1289324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td6Aq-000464-Sk; Wed, 29 Jan 2025 11:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879102.1289324; Wed, 29 Jan 2025 11:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td6Aq-00043N-PJ; Wed, 29 Jan 2025 11:24:00 +0000
Received: by outflank-mailman (input) for mailman id 879102;
 Wed, 29 Jan 2025 11:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AXM0=UV=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1td6Ao-000439-TJ
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 11:23:58 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:2417::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87144ceb-de33-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 12:23:57 +0100 (CET)
Received: from BN0PR02CA0046.namprd02.prod.outlook.com (2603:10b6:408:e5::21)
 by IA1PR12MB8465.namprd12.prod.outlook.com (2603:10b6:208:457::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Wed, 29 Jan
 2025 11:23:53 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::39) by BN0PR02CA0046.outlook.office365.com
 (2603:10b6:408:e5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Wed,
 29 Jan 2025 11:23:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 11:23:52 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Jan
 2025 05:23:51 -0600
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
X-Inumbo-ID: 87144ceb-de33-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjeEViTWqyglQUSVBd/x0vRrAGzi7Hf+dhPTvOUybrsB7Em/pctcyDHvCuttkaVGpLLtlE7Nfmk+ocbV5GPglisrbvXJgO89AoaXUR5/IJ8HozJ/Td4gT05/qpvYSSYcnYEjkAEaJwWgbqrJl/30q7c82WW7ThbiNSfSBuKycY5ah16TCq9WdgNK4xmvHANsCy299yKIRmf+MpbkLTESzgUHw5h5JkMbmgbbcqE8JEWsxy316QBOxT9phs659NQbuQz2pz1k6X5M8nnbhYyNFppUaRA9OLKm4fuWCkZrZ3avsARGxBSgnM34WDH42TvQrjqylWsgZo5MsF3iIUDeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI9yDiljzJ+q6XSv4LqL9UWFdllKHvicSiPtw0OJEDc=;
 b=IPht/4RheLWbWHWwySgZKFKzPRXcnQ5g+uzLNsb7sjU07rxwKmUQYJpIXKmDDJq5iuTwidk1wTiVoSI+X1cYc8Fl3HCnO3fz2A5Kdwe6/Y9RgOIiO+LJfrSII/xG7jhGkd1yg8vOnyUCAPJn+NLiLx2e8oyleJVJfPMAqnK3dzC9QHJ87KzwKXX6cXkIUx6BekbIZtowL3qTKE+KRrVDpKYlq8za9Gx2SnfUpEK8IqIGh19dxU2Q81MWew8cPrjaFDP+FnHyhiEAeSwiwI5o1gatNgxpExLCYkF2XqtUg5ASOkIsjaOJjo+BaHdCR74UDukGEVHbUt6nTa05VwSvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dI9yDiljzJ+q6XSv4LqL9UWFdllKHvicSiPtw0OJEDc=;
 b=4AFHrcN1dsp+KX6qY+bTHq3qc23CFCEq2N/nf+Bjk59++fL1fmQLKvq1/cn6ToFHu9Q26KyFf9+GdWCWfZEh3c8/FHW2me0mb3pMzNL0XLbV8Epys/L8dlakCiB8n6I7AwMcvKI5yZ276hnx0zYi5sbaIQDZQ9j0OmoMVE5Qw5Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Wed, 29 Jan 2025 12:23:46 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Olaf Hering <olaf@aepfle.de>,
	<xen-devel@lists.xenproject.org>, <jgross@suse.com>, Anthony PERARD
	<anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>
Subject: Re: slow start of Pod HVM domU with qemu 9.1
Message-ID: <Z5oPwthxmLfIbjSE@zapote>
References: <20250128151544.26fc827d.olaf@aepfle.de>
 <Z5j-bkdFZ7riavv7@zapote>
 <alpine.DEB.2.22.394.2501281543580.3264561@ubuntu-linux-20-04-desktop>
 <b4ccccbb-f3ee-44fe-a5e2-780195cbbc0e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b4ccccbb-f3ee-44fe-a5e2-780195cbbc0e@suse.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|IA1PR12MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d63df6-0f35-45a1-d049-08dd40576940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LIEWNCLXSi4MEEt/57DuEfhGERtryREiVSKyGK+bppFmCh9kJ4kbum9Wj4Jr?=
 =?us-ascii?Q?L44PAhyWlsjdyUTOPZwhNzOq84OFdV5CaoQOX8W/QQ9o4qWZEhQOHEF8CANs?=
 =?us-ascii?Q?ms6KnuWuta2GaYd6/EzSgtX29ips9dk5YeF4Y6nBNA4IsT9TndxaxI+QGoAq?=
 =?us-ascii?Q?8eyRu9UuOVpa24zCccMvk/244sDbg0CLTr8EyXigPDdigIliFQrfMqvygUIt?=
 =?us-ascii?Q?Mcu1JH5TOk4Dt+5kyTYlB63ZI3vPnJrALJ0OwintG+YZwTn1XH6B4e8qqJOe?=
 =?us-ascii?Q?C2IXIJI/TsINGxHxWxytD0ktsnoqAL4qgMuQuQl+OpDWcetn2CJj9Pqz4ahF?=
 =?us-ascii?Q?EILAaiL73Q9jUhKipkj2mpIvcPwihJnmDZYEPN4H9I82K892V4wcLYROjnpo?=
 =?us-ascii?Q?2javnpPPWPYvmJzGh3gycnDEu8pHV6imBE/iTlKY3z58kCkGqoY1z7wgtnG+?=
 =?us-ascii?Q?pieAjZh1WftmLd4KSica2do2AzRB4qjVB17HBQ4NeZvgsLuRdC6Dbxq6H1dp?=
 =?us-ascii?Q?yK8yUGifLD2mauoqVpvgbsucfI1h1BM3HfWsLbU4RzgpbfBcmKg8cmNITymq?=
 =?us-ascii?Q?kviHKG5KQmCbpjzDSIAUDR/tcVbNnVqUcxI3YK9AiRUFXGFRm5+dtSX3GXWk?=
 =?us-ascii?Q?qNPpcjvWqBcsLLJrZWDfDRr+MxU09ujJy7rcXoVNYDTQderOaYnWDsYSlXSw?=
 =?us-ascii?Q?gz2kpFoiM3wIgYXn4OlUELJc/1fVSJGYLdz4i8fZRA8JqnB9YcUv3W+TjBn9?=
 =?us-ascii?Q?aAKEUIPWlRSSw1y2COywi3HVs9RAPUjsMezYXvwWI7TbtySX4CLWQH+sGGQb?=
 =?us-ascii?Q?gy/0CZ9qiLNp15fvMt+V3KOC6HJxMXyazxlg/SyyxWsbBt71eHb637ZDf0LX?=
 =?us-ascii?Q?xRWqC5RgpYIiFexFIpV9bmn0fWwz06iHmU0fYSVrgYcyDCjl3KM9zykxvMhI?=
 =?us-ascii?Q?phHkE8OaOyXmQAw88bfjNkxV5L8QRApFi/hI8aao+poMYcDrguLzWITdSZrt?=
 =?us-ascii?Q?BkyTKbkXuH582Str6KIuuMn7R1wVXwZdR63FdLHoqlTCI9sDVe8Emv/sSLYG?=
 =?us-ascii?Q?8zcuXfK4cIc+7+VSmkI4mg8eYwT/Y8AcEhuYrdyMSch6HoY2OKgkM+K7xA4b?=
 =?us-ascii?Q?O7GM3hCZeNLx7AMZDnjUjWP8OQ7JqWVgfUOWngHGrvYAH7fr31sAcegobKqa?=
 =?us-ascii?Q?jIKnbwiosG1sPxTzEaQ1CFiNOGabFyholQK2AO2wiVqY0kNzHVmSYIvgIRwC?=
 =?us-ascii?Q?dmaF4cr7LojDXuIzGDTSgl0Nfi9S1vgGhnVbQ/GA6pemRE7oDYkT1ywtxe+z?=
 =?us-ascii?Q?bWngMUa/2r86o/3NUPAZQpG6dG+SkVyx52GkbNpH4LMdCI19AYWmq7n0DSZr?=
 =?us-ascii?Q?KD3z1KLpTdl2BLx9rG0inkbeGW6pmb+Kj0eDbEJj/+gIVTXeWFAjahzZyeRI?=
 =?us-ascii?Q?GQgRNeYwcnR2w0Si7vl9xyYmr78pOCX6CcCb3VQPOeAT79mmsHLj+5khMjtW?=
 =?us-ascii?Q?p/8MRdzpqUjBfSU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 11:23:52.8041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d63df6-0f35-45a1-d049-08dd40576940
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8465

On Wed, Jan 29, 2025 at 09:52:19AM +0100, Jan Beulich wrote:
> On 29.01.2025 00:58, Stefano Stabellini wrote:
> > On Tue, 28 Jan 2025, Edgar E. Iglesias wrote:
> >> On Tue, Jan 28, 2025 at 03:15:44PM +0100, Olaf Hering wrote:
> >>> With this change the domU starts fast again:
> >>>
> >>> --- a/hw/xen/xen-mapcache.c
> >>> +++ b/hw/xen/xen-mapcache.c
> >>> @@ -522,6 +522,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> >>>      ram_addr_t addr;
> >>>  
> >>>      addr = xen_ram_addr_from_mapcache_single(mapcache, ptr);
> >>> +    if (1)
> >>>      if (addr == RAM_ADDR_INVALID) {
> >>>          addr = xen_ram_addr_from_mapcache_single(mapcache_grants, ptr);
> >>>      }
> >>> @@ -626,6 +627,7 @@ static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_t *buffer)
> >>>  static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
> >>>  {
> >>>      xen_invalidate_map_cache_entry_single(mapcache, buffer);
> >>> +    if (1)
> >>>      xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
> >>>  }
> >>>  
> >>> @@ -700,6 +702,7 @@ void xen_invalidate_map_cache(void)
> >>>      bdrv_drain_all();
> >>>  
> >>>      xen_invalidate_map_cache_single(mapcache);
> >>> +    if (0)
> >>>      xen_invalidate_map_cache_single(mapcache_grants);
> >>>  }
> >>>  
> >>> I did the testing with libvirt, the domU.cfg equivalent looks like this:
> >>> maxmem = 4096
> >>> memory = 2048
> >>> maxvcpus = 4
> >>> vcpus = 2
> >>> pae = 1
> >>> acpi = 1
> >>> apic = 1
> >>> viridian = 0
> >>> rtc_timeoffset = 0
> >>> localtime = 0
> >>> on_poweroff = "destroy"
> >>> on_reboot = "destroy"
> >>> on_crash = "destroy"
> >>> device_model_override = "/usr/lib64/qemu-9.1/bin/qemu-system-i386"
> >>> sdl = 0
> >>> vnc = 1
> >>> vncunused = 1
> >>> vnclisten = "127.0.0.1"
> >>> vif = [ "mac=52:54:01:23:63:29,bridge=br0,script=vif-bridge" ]
> >>> parallel = "none"
> >>> serial = "pty"
> >>> builder = "hvm"
> >>> kernel = "/bug1236329/linux"
> >>> ramdisk = "/bug1236329/initrd"
> >>> cmdline = "console=ttyS0,115200n8 quiet ignore_loglevel""
> >>> boot = "c" 
> >>> disk = [ "format=qcow2,vdev=hda,access=rw,backendtype=qdisk,target=/bug1236329/sles12sp5.qcow2" ]
> >>> usb = 1
> >>> usbdevice = "tablet"
> >>>
> >>> Any idea what can be done to restore boot times?
> >>
> >>
> >> A guess is that it's taking a long time to walk the grants mapcache
> >> when invalidating (in QEMU). Despite it being unused and empty. We
> >> could try to find a way to keep track of usage and do nothing when
> >> invalidating an empty/unused cache.
> > 
> > If mapcache_grants is unused and empty, the call to
> > xen_invalidate_map_cache_single(mapcache_grants) should be really fast?
> > 
> > I think probably it might be the opposite: mapcache_grants is utilized,
> > so going through all the mappings in xen_invalidate_map_cache_single
> > takes time.
> > 
> > However, I wonder if it is really needed. At least in the PoD case, the
> > reason for the IOREQ_TYPE_INVALIDATE request is that the underlying DomU
> > memory has changed. But that doesn't affect the grant mappings, because
> > those are mappings of other domains' memory.
> > 
> > So I am thinking whether we should remove the call to
> > xen_invalidate_map_cache_single(mapcache_grants) ?
> > 
> > Adding x86 maintainers: do we need to flush grant table mappings for the
> > PV backends running in QEMU when Xen issues a IOREQ_TYPE_INVALIDATE
> > request to QEMU?
> 
> Judging from two of the three uses of ioreq_request_mapcache_invalidate()
> in x86'es p2m.c, I'd say no. The 3rd use there is unconditional, but
> maybe wrongly so.
> 
> However, the answer also depends on what qemu does when encountering a
> granted page. Would it enter it into its mapcache? Can it even access it?
> (If it can't, how does emulated I/O work to such pages? If it can, isn't
> this a violation of the grant's permissions, as it's targeted at solely
> the actual HVM domain named in the grant?)
>

QEMU will only map granted pages if the guest explicitly asks QEMU to
DMA into granted pages. Guests first need to grant pages to the domain
running QEMU, then pass a cookie/address to QEMU with the grant id. QEMU
will then map the granted memory, enter it into a dedicated mapcache
(mapcache_grants) and then emulate device DMA to/from the grant.

So QEMU will only map grants intended for QEMU DMA devices, not any grant
to any domain.

Details:
https://github.com/torvalds/linux/blob/master/drivers/xen/grant-dma-ops.c

Cheers,
Edgar


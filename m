Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F58AC0CCC
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 15:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993945.1377021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI5za-0005lA-OK; Thu, 22 May 2025 13:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993945.1377021; Thu, 22 May 2025 13:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI5za-0005j8-LC; Thu, 22 May 2025 13:29:50 +0000
Received: by outflank-mailman (input) for mailman id 993945;
 Thu, 22 May 2025 13:29:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t8MG=YG=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1uI5zZ-0005iy-Hm
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 13:29:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2416::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3705959-3710-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 15:29:47 +0200 (CEST)
Received: from BN6PR17CA0054.namprd17.prod.outlook.com (2603:10b6:405:75::43)
 by CH3PR12MB8484.namprd12.prod.outlook.com (2603:10b6:610:158::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 13:29:42 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:405:75:cafe::8f) by BN6PR17CA0054.outlook.office365.com
 (2603:10b6:405:75::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.32 via Frontend Transport; Thu,
 22 May 2025 13:29:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 13:29:42 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 08:29:41 -0500
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
X-Inumbo-ID: d3705959-3710-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVNsksL4pXgVb/5A6/5z+yIPFLJzG9XKGt4nlznWq5ls5WOBzzCUEmha9pc1Ibd6JzZej8njPrsALl5jFgwJWPdHIoCt3PVdyUola2bXZFWqoK5hDcBWahCHSsf2TGajOoxzLj6hrzg7daM+QcTZgRZbpow2wt6AEKORCMSRspujeCtdKOSklmz2kexYHWAym9zbrB3Q6nEulHET1isCVShNQysIZy0J87So80jGZ8dMxtVDfUQtXux9I0+0KsM5MqkI8OsSw+VjpTAxCdzhEd0hxzeDUKlsE0sRYKRqMqZYjhEHfW0UFJjhcL10iV13MSt4LcxGr8APktsiVzmXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q48z1X16UrwC5dEANiAHs0bWd3cvCyH1Z5pCnzkrAEY=;
 b=Sx8Jmt2wWUt//Gz2+T/hq7QEMSKUfbRm7mjNHJ1pTgdf9twqo54qJ5C55Q98DtuzIlqxjljNqJ583HkU/dI8H9umf6R2+/3u+P3aOA6eVgiHICOf/3aV1nY13s9tmlrABNvycXY0zIx/5072ka0erf6uFRsliBm3Gw3Po8vyTp+vbywsokU0i2vdGPfkurIC0JYWWlDx7slpfVGwa47VLgmp8tnh3Ypdes+QYQai2C36kH+5Ogpx5BKDGZKd+qTxVeBt7X7X4YRXJCPX37y5AX1URbLqhfwQXoncoo2aXxrMGbRKUBebVwMVETLnZlIqeZR1BkW8SemuIYdBW9lFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q48z1X16UrwC5dEANiAHs0bWd3cvCyH1Z5pCnzkrAEY=;
 b=oh2IH4gx5jFv7UaGlmg/HGuwEJRgFqbYssx4wp9mAvQdaEg7vOodXQ5jUPqO1FK+yytzl94m86ijYMQo0vfuRGkWBArUlhtaf/EWLpN7+a0f4/B2ifE+e/uWwfAF9IqdfQW5KyXpUdJjbyBY4OYQm11UJx3NcX6/hTHFSCJJr1U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Thu, 22 May 2025 15:29:40 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, <xen-devel@lists.xenproject.org>
Subject: Re: xen/arm: Virtio-PCI for dom0less on ARM
Message-ID: <aC8mw5BHQEvw7V9p@zapote>
References: <aCw3ddB2CZUeEtyF@zapote>
 <ad31707f-4558-4ebb-89ef-da9ef4083d7a@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad31707f-4558-4ebb-89ef-da9ef4083d7a@xen.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|CH3PR12MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 695c3515-7812-42f8-fecf-08dd9934b5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjltL2R6UXZ5emRYb2VQbytzbUNNQnVBUUdSaEZpdTFIWkNFUEpTQmlqakJr?=
 =?utf-8?B?VWR3UnY0MmdzcmVZc25DYWgzVmNxRE80U3QveUFlUklmc1BEMTBCcjhKSEtR?=
 =?utf-8?B?bWV5SkRFVnhOeGZ5Qmh4RmhzOWNDQTBxS2piWmhybFNLcXJCVVc3dUF5S2N0?=
 =?utf-8?B?dzk3RnFoNXRIenlKVDUyUlVFZ0hHanVNMTdzQWRvNStpOWFnM0ZBeVZwdzQ2?=
 =?utf-8?B?akJMTmNZTUhzSzVtNWNZMTRmVkkxSlhzakM5WTA3VFFTN0Z6TlBQMUI5R0tr?=
 =?utf-8?B?V2tGaVlETVpOcWNsdzlPVmt6cVJzVGdibnl4TkcrQ3dXQ0RBK21nalZ3SmEy?=
 =?utf-8?B?cWlRbm1pTVNiYytWWU1IN3FRT1ZqWlVnL04vaXZROTc4VFJzU3FETHFIbFRs?=
 =?utf-8?B?Z0dtb1NEeXliaGpaNW1xclcweDJvTDAzaDVObk5vMFpYUmF0TDRZUmRHWGxZ?=
 =?utf-8?B?NXRDc2J6Mis4ek8rWTUrYWRYYTZ4cEg3bUs5bHBEd2VSNjFLMm5qODNDQW56?=
 =?utf-8?B?L0EzRGFjQ2UxYXdUYkFaM1RoVzhiZGVERkQ3VE5EOW1qZEplZHJZUWN1eEZn?=
 =?utf-8?B?QmdjRUdKb3d6QXgydmc5aVVRSmphMnlyOTd6dElNellRbmEwbjVCR3A3cDYx?=
 =?utf-8?B?Mk1Qc2ZGWmZSTTdpVHNkaE50cnZMcU1zd1NudjJuTUd0MmJHNnhFNjVZWEUw?=
 =?utf-8?B?TnFqbmlCVW1remF3Z1Z6NkV1QUtqQVlaWWJkc0g3clZRUWVhK2N4UERKTGhu?=
 =?utf-8?B?YWRzZlFmZ0xmbUpsMkxKSTBjd1RIL0U2bzhNYUZoZVNIL2xINWtubmVQY1Bx?=
 =?utf-8?B?bHZ4WlllWFBiTVZRaUcwT3lwRXU5L1hFY1lhcW5CRExncTR4U3ZkU0xyQUNI?=
 =?utf-8?B?S0U2aWNWc1hpMkRvTURGSnJjbWJNMzNMRjA3dmEwOGJ4KzVtSHBtSXlPZ0RQ?=
 =?utf-8?B?L05YazFjY0M4cU9PZmVkeW11ZVUzcDJValNkWGJTRmZhRHZWSXZyNDRMc3Yy?=
 =?utf-8?B?Q2lqUHIvQUJxaWttdG8wS2ZBZzZxNmNqbEZpVkUwOWk1eXlzTGUvZXY4bmd4?=
 =?utf-8?B?dFllZlh1MHNkM0cxVWVidXltZkpFRTFIRmZOaXdTTWN1UlE2a0dzZFEyVUF4?=
 =?utf-8?B?WTZaV0pIbnpFUDBtK0gra2pqYTFSalFUZWswbEFPcnE1U3J5YllqODlWNk1v?=
 =?utf-8?B?eDNxZ2dRaUlZdVhVbG50dytpem1yNURZNlpJa0NXcC9SYmpmMm94b3pQSG53?=
 =?utf-8?B?cnJHdnFZcXBwYzNndlJMRmc5TVZ1QzBudThuVVpxQjNocUF0NHdaZUJMTjZo?=
 =?utf-8?B?Szl4em1NVzZMS0YrTTFPMlNYVjFwZURhbWFVNGRpRGRoRDE5cVl6dG9kR0Ro?=
 =?utf-8?B?Ny91N2U0S0xKYTdrR2lWQ1doeXZpSzZQbzdYa2ovaktUTklpelNjQ2R1NXVt?=
 =?utf-8?B?b1ltQXI4dHFLN1U3US9DUEI3a3paaThUVzlqd1VBbnBkTlkwSnJWcEZlVjUz?=
 =?utf-8?B?Ym9mVjJyeTQ1cTZGSE43S0JTSXE4Y01sRjB4SHRVSGo0VjRIZ3NEMldNUE4x?=
 =?utf-8?B?bjFRYVBoVUw2QnlmR0FpbGxoME9QejZQUzMvaUtoSFVkQUlydHd2OFZCTTZn?=
 =?utf-8?B?d00rUURvcFMwN0FnRTF5MzdLYTVUelMzaWphNFIrYm52c0llMWROWFZYVlND?=
 =?utf-8?B?aWdsMzR5TWJDMm5zRFRacHJTLzlqSk9IZHRJRXZldVdMemVpV3hpaGlERlBD?=
 =?utf-8?B?em5oTWVLMFNLNWhRMlBPbkF6NXFUMm8ycU1OREZoSHZvOFpDcmg5NnovQTZJ?=
 =?utf-8?B?NVZDUm9NN2JLMWdhVm5XTlZZWWZkcVVTVjZsdzRpV1BDUW9DcVZFcDk3S1gw?=
 =?utf-8?B?S0NXL0tMa2gxOXY5VEFURGZtVDBacHFHMG1qL0pBSWJxc25FYkdXS3l6R2Yr?=
 =?utf-8?B?aW9KQVpHTjNoOE9kbC9tL0RQRGRrL2RqRzMrTnpXcFlDSDB6bGZMSmtXT1U5?=
 =?utf-8?B?RkZQUm5RUmphSTBwSmJ0Z3h0TkRYcmpPK0cxYktGMGJnQnVaVXhFSVdLYWlX?=
 =?utf-8?B?aDVmcGkrM1pNYXVUNWd1bm0yaE1YdUFQQ3dMUT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:29:42.2591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 695c3515-7812-42f8-fecf-08dd9934b5be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8484

On Wed, May 21, 2025 at 01:22:11PM +0100, Julien Grall wrote:
> Hi Edgar,
> 
> Thanks for the write-up.
> 

Thanks for commenting!


> On 20/05/2025 09:04, Edgar E. Iglesias wrote:
> > Hi all,
> > 
> > Following up on the ARM virtio-pci series I posted a while back ago.
> > 
> > There have been some concerns around the delayed and silent apperance of
> > devices on the ECAM area. The spec is not super clear wether this is OK or
> > not but I'm providing some references to the PCI specs and to some real cases
> > where this is used for FPGAs.
> > 
> > There are two options how to implement virtio-pci that we've discussed:
> > 1. VPCI + IOREQ
> > 2. IOREQ only
> > 
> > There are pros and cons with both. For example with #1, has the benefit that
> > we would only have a single PCIe RC (in Xen) and we could emulate a hotplug
> > capable expansion port with a standard way to notify when PCI devices plug in.
> > Approach #2 has the benefit that there is (almost) no additional complexity
> > or code added to Xen, almost everything lives outside.
> > IMO, both options have merit and both could co-exist.
> > > For dynamic xl flows, options #2 already works without modifications to
> Xen.
> > Users need to pass the correct command-line options to QEMU and a device-tree
> > fragment with the pci-generic-ecam-host device.
> 
> IIUC, in approach #2, QEMU will emulate the host controller. In Xen, we also
> support multiple IOREQ servers. For instance IOREQ A may emulate a GPU
> device, whereas IOREQ B could emulate a disk. This is usuful in case where
> one may want a separate domain to handle GPUs.
> 
> With the approach #2, it sounds like you will end up to have one host
> controller per IOREQ server. The user will also need to know them in
> advance. Is my understanding correct? If so, then it feels like this is
> defeating the purpose of IOREQ.

I don't think that is necessarily the case.

Option #2 would have the controller outside of Xen and an implementation
is free to split it up into multiple processes each with an IOREQ server.
It is also free to do a monolithic implementation or some kind of mix.

Today, QEMU supports 3 ways:
1. A monolithic PCI host bridge + PCI Endpoints all in the same process.
2. A PCI host bridge in one process and distributed PCI Endpoints in separate
   processes (vfio-user).
3. A PCI host bridge with partial virtio-PCI transports in a single process
   + distributed virtio backends (over vhost-user) in separate processes.

If you refer to guest's knowing about PCIe controllers in advance, yes but
I don't see why we couldn't use something like dt-overlays and kernel
modules to enable them at runtime. For PCI endpoints behind the controller,
an expansion port with hotplug can be emulated allowing the hot plugin of
devices at runtime.

With regards to isolation, I don't really see a benefit with option #1.


> 
> This is the first reason why I feel approach #1 is more suitable.
> 
> > 
> > For static dom0less flows, we can do the same as for xl flows but we have the
> > additional problem of domU's PCI bus enumeration racing with QEMU.
> > On x86, when domU's access a memory range that has not yet got IOREQ's
> > connected to it, the accesses succeeds with reads returning 0xFFFFFFFF and
> > writes ignored. This makes it easy for guests to wait for IOREQ devices to
> > pop up since guests will find an empty bus and can initiate a rescan later
> > when QEMU attaches. On ARM, we trap on these accesses.
> > > If we on ARM add support for MMIO background regions with a default
> read value,
> > i.e mmio handlers that have lower priority than IOREQs and that are
> > read-const + writes-ignored, we could support the same flow on ARM.
> > This may be generally useful for other devices as well (e.g virtio-mmio or
> > something else). We could also use this to defer PCI enumeration.
> 
> Regardless what I wrote above, if we are going down the route of returning
> 0xFFFFFFFF, I would just do it for every IOs rather than the one specify in
> the device-tree. This could still behind a per-domain option, but it would
> at least make simpler to setup the system (AFAIU, in your current proposal,
> we would need to specify the range in multiple places).

Yes, the range would go into Xen's static domain config node and into the
passthrough fragment describing the PCI host bridge. Typically only one
range is needed (ECAM).

In my prototype, I've got this for the static domain config:
domU1 {
  compatible = "xen,domain";
  ...
  mmio-background-regions = < 0xf1 0x0                // Base
                              0x0 0x10000000          // Size
                              0xffffffff 0xffffffff   // Read-value

                              // Additional ranges may follow
                              >;
};

> 
> > 
> > So the next versions of this series I was thinking to remove the PCI specifics
> > and instead add FDT bindings to ARM dom0less enabling setup of user
> > configurable (by address-range and read-value) background mmio regions.
> > Xen would then support option #2 without any PCI specifics added.
> > 
> > Thoughts?
> > 
> > Cheers,
> > Edgar
> > 
> > # References to spec
> > 
> > PCI express base specification:
> > 7.5.1.1.1 Vendor ID Register (Offset 00h)
> > The Vendor ID register is HwInit and the value in this register identifies the manufacturer of the Function. In keeping with
> > PCI-SIG procedures, valid vendor identifiers must be allocated by the PCI-SIG to ensure uniqueness. Each vendor must
> > have at least one Vendor ID. It is recommended that software read the Vendor ID register to determine if a Function is
> > present, where a value of FFFFh indicates that no Function is present.
> > 
> > PCI Firmware Specification:
> > 3.5 Device State at Firmware/Operating System Handoff
> > Page 34:
> > The operating system is required to configure PCI subsystems:
> >  During hotplug
> >  For devices that take too long to come out of reset
> >  PCI-to-PCI bridges that are at levels below what firmware is designed to configure
> > 
> > Page 36:
> > Note: The operating system does not have to walk all buses during boot. The kernel can
> > automatically configure devices on request; i.e., an event can cause a scan of I/O on demand.
> 
> I am not sure why you quote this. To me it reads like this is up to the OS
> to decide when to access the PCI bus. As we don't control the OS, this
> doesn't seem a behavior Xen can rely on.
> 
> > 
> > FPGA's can be programmed at runtime and appear on the ECAM bus silently.
> > An PCI rescan needs to be triggered for the OS to discover the device:
> > Intel FPGAs:
> > https://www.intel.com/content/www/us/en/docs/programmable/683190/1-3-1/how-to-rescan-bus-and-re-enable-aer.html
> 
> To clarify, you are saying the ECAM bus may be completely empty (e.g.
> everything is reading as ~0) and some part of the ECAM will return a non ~0
> value when the FPGA run.
> 
> That said, the FPGA behavior is IMHO slightly different. I would expect for
> FPGA, one would now when the device is present because they would have
> programmed the FPGA. In our case, we are trying to solve a race introduce by
> Xen (not the user itself). So it feels wrong to ask the user to "probe in a
> loop until it works".
> 
> This is the other reason why the approach #1 looks more appealing to me.

FPGA's loading has many scenarios, it can be done by the user that also
triggers the PCI rescan or it can by done at boot by another machine or
by another VM. There are ways to get the PCI link up quickly at boot
but they are not always used, introducing a similar problem as the one
with virtio-pci in Xen.

Note that approach #1 does not remove boot dependencies.
For example if a guest wants to boot from a virtio-blk disk, it will get
notified when the disk gets hot-plugged but the kernel may have already
failed to mount the disk. We would need a way to configure guests to
wait for a specific device to appear.

Cheers,
Edgar


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26900986677
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 20:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804521.1215529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stWyZ-0001Fk-I1; Wed, 25 Sep 2024 18:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804521.1215529; Wed, 25 Sep 2024 18:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stWyZ-0001E3-Eh; Wed, 25 Sep 2024 18:42:59 +0000
Received: by outflank-mailman (input) for mailman id 804521;
 Wed, 25 Sep 2024 18:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L/LJ=QX=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1stWyY-0001Du-6H
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 18:42:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2413::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa8b2cdd-7b6d-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 20:42:56 +0200 (CEST)
Received: from BY5PR13CA0006.namprd13.prod.outlook.com (2603:10b6:a03:180::19)
 by SJ2PR12MB8740.namprd12.prod.outlook.com (2603:10b6:a03:53f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 18:42:51 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:180:cafe::48) by BY5PR13CA0006.outlook.office365.com
 (2603:10b6:a03:180::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Wed, 25 Sep 2024 18:42:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.0 via Frontend Transport; Wed, 25 Sep 2024 18:42:50 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Sep
 2024 13:42:49 -0500
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
X-Inumbo-ID: fa8b2cdd-7b6d-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZpYRcBYoXZFPCrDdDlEfrvE7Fd+fvL3nVV11M+QFt/A5g+XKgEZmatWAgqyrQP2/D+oHKzTYPJSgGnx+M72wJjmk0D2ESU9mHEAmqcKtp//bfOudlyC72Sl1dZHM2Jl3poFhTaN9oNTW+4gMPu/acKKUfmSUlbenIgyEyfqctzQ5XDC8d14OxPRqkGTdAtV6yhrSkb3COLwo+yzCtdENMvPtsZH0bY1pAhK3lHByizZKIafl6FjfTBgQjLz1GzF+mCZkFh09OfJGt4rL5aQZeGvqJpqifSkmc/XIih/dFtI7+VBQV0SABehaYf0VYv5CGcdINo8EAB8mgubASPp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gF+fFrEso9/fjxDZdl6NhLRF2N0Q+8TzCX9EpMt+s1c=;
 b=Vepp+eHzFG1ALlArnGCIADJa7rCScfN7n5yp7rBBV35CdlAZtG9859iTOY7+EMBlma37WcEOdmesb9q2I9GEnu+EpIf6K9VVMfehELGIBlvllts2JnI7SDS76Qd4jpWWJ/sXW9shUgVVCxxg6BnD1kne/U3QRC0dc417ixM9E2fScsOEbOxqmIXlyKxsjHkAu/Zif/Xx40XPJ8NrtIq4M/ATPpX4rCRlz2rLSt57eK/767exdmucYB01ZTbw+3OpwGG38v9/V+C8eeqYmC45PLFCeeuqr3AXgNQvi/QHSXiyctCvjTzr5D6jJXs36KqkWBeODgSqgwcP0gpWHkU3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gF+fFrEso9/fjxDZdl6NhLRF2N0Q+8TzCX9EpMt+s1c=;
 b=0muZNhZ01irnpek/r5L/AkKdSnS0Qcg4VMi4SJR7kvXDC0qbaksLPJ/ZHoms0w1gCDTD80rgCdUqzD3A1rI1Y4Px+jPSdVSv6C1xVgGseYyO9+UNv0f4/uLqZOqSudg9quK95hKlWut0wMJPL4Ru2hhQWrgQoy/O4jj2/PmZuWw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Wed, 25 Sep 2024 20:42:45 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Julien Grall <julien@xen.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	<xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <dpsmith@apertussolutions.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
Message-ID: <ZvRYvdt9twTbNlhm@zapote>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com>
 <ce21a173-61f4-42d5-aa72-5b50135e6d76@xen.org>
 <ZvQ7mf9MbmSyC6RB@zapote>
 <d897124b-29c7-4aac-86bf-f1bec1aeade4@xen.org>
 <ZvQ-AK--W7sWom7r@zapote>
 <CAJy5ezpLVciE0ENGYtC4cwJ7U4rPTR4E68M+vq=2jBgK2it3zg@mail.gmail.com>
 <f7f6cf0a-5828-4053-bce2-f27df0727ab1@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7f6cf0a-5828-4053-bce2-f27df0727ab1@xen.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|SJ2PR12MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 508c4f09-479b-4c6a-1c7e-08dcdd91dc02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkxNUFhrdW5WOCtHdVZTdDhEMDM4Rk8yTkF5cllraEJvcDY5Lzc3b21tcTNN?=
 =?utf-8?B?cmw1RDJ4ZjJZK3lXVTROYUhZTWc5Q211anQ5WE9tTVYwVkVlaFM1UW1kRlVs?=
 =?utf-8?B?WkJIN29YSkVpUSsxTDR5RHM0aEd5UmdSOTFMb2ZiNjB2bW1POHdhUnd4bk1L?=
 =?utf-8?B?ZURJSHo4WFVUdlhMTzRCMzZmZ0lDOXA3TjFvdDRxV2cxcDYxcUQ1OEM5ZFlo?=
 =?utf-8?B?SDlWVGZTMW1IWEZFUGZNRnllVmM0VkJ3RWRzRkhMSFQvanpCeElDL1drWkRR?=
 =?utf-8?B?dm1BcWQ1UkZ1YVo3cGZBWmFuZGpSZ1dYNUFUUFhwS2Z5bkhDTHEzd05xcVo4?=
 =?utf-8?B?cGViQ3hkbGlyZE9qOVhhd04xOVJIWDljM1Y0eHpkUUhnbjBrVzIyNGd3bmN3?=
 =?utf-8?B?a3dac3p3cnRqQnViWFlUVS9JTGdEaklTSDJHbzBlcDI2YVB6c2VmTHh3OGhx?=
 =?utf-8?B?a2lDOGVCb1FtVkQrQTRab3pEalhrLzZnYjRVUVdVck9jaXp5NStpMlNMUkxY?=
 =?utf-8?B?MVJKWStTblRIcWtRSStWeEt2aFQ1SFp6L25CcTgxL0QzL0xpMFdGMVh3Z0or?=
 =?utf-8?B?MmhFdmJkNkRXanRIRUs3a0kwQmowOTkzTGh6eDhvOFVEZTNCejMrNnFFYTFC?=
 =?utf-8?B?VjZnRmhoWEVJOGZaT3pNb1kvYURiZjh0NXphU2UrTTFLdkdSMFFNMElPMWFT?=
 =?utf-8?B?YTNrdForQUVpUXJsNkExWVNNRkNsS1hqb2xZeTlpazBRQnBkbEw0OXJkRUJo?=
 =?utf-8?B?U3d2M2REWm5WSXB5Q3BoYjBqeUs4TDZvcXJKNG1DSWQzTmZBOFBRZk9QNUxG?=
 =?utf-8?B?bzI3emd1NnVMMXBTenp5Q0ZqWTdaYllUM0MwQlZUbTFMZ28zc3N5VkRTU2Na?=
 =?utf-8?B?cUhqQmFSNUhpa3FhUHRZRUxOdHhGWk42VDdjb280WEFoeDFMdEN6RG53RGpY?=
 =?utf-8?B?Wml4TGcySUlUZEtpclBzaW5BOHp2bWlWSnE0UGx4bWx0M0xKSmc3cGVzZGdX?=
 =?utf-8?B?ektUOUFrbXp1Sm1RS01nSllnUFZpUmpCQkFvOWlmWmZhakFsVER0ZE9ISXJs?=
 =?utf-8?B?bXhsbDM0R25INjZWNGZPVDRYNmVlcUJEVm1wQXA4ODRlOFBrRUhUdVJjZXRQ?=
 =?utf-8?B?TkZOemhYb3gxNmlKdSt5ZXg2VkMzUm5yLzNOZzJSWi90aWZVYWpSaU40bHdR?=
 =?utf-8?B?Q1lDQlUvMzk4dFFtbExyTllBcUo5TEozdVVmdG9CZlJjdmZ1NUFzRHpDc0xu?=
 =?utf-8?B?eS9NSjNvL2ZVcFE3QkwxUXlpYXdBcmE3NXFsRzNHTlJaZjNXMGFyOC9XRWFF?=
 =?utf-8?B?em1qYW1PYlVSQm5WWDlxTzZBRktKMlJsaWhRZ1VnVGxXNXNyaDExOGgyRTJV?=
 =?utf-8?B?ZjljQ1BkSzNBN0ZBZlVtN2hhUW11cWZzaGhFQmtROFR4aUF1ZDgwUUs2dUNP?=
 =?utf-8?B?SWUvM2FreXhRdVhrWGxUZDhDcUZuT0J0KzBSZE1MRWZkbXU4YXBOZG9Bb2tW?=
 =?utf-8?B?OEFQR0JDZnpIVEhiR0FsNENqQ1lJWEFiUEY0cUpSWWNuZUxIY1VlOFdxUWR2?=
 =?utf-8?B?NmNOcysySTZTcGR4c0NOa1dMMVhXU0czMFVHYm9jVU9wR3RTUUhuSTlvSmdu?=
 =?utf-8?B?cTRRbVdMbjYrRHowQyttT0ZxYmZtcXBLSmRzSi9rSlQ2VndBZ2JLTUZ5WTNj?=
 =?utf-8?B?S2J1Z1VlUVpmUlVkUDNMd0pPRzA1bGNyTGNEZ2Q3cDF6ZlBwc3NLRThaU2NI?=
 =?utf-8?B?S2dkc0wzaUM2NmRHMnllVm1TR2UrWXFmOVJkUDI2eC9HWkNqNlNGbU1FMStm?=
 =?utf-8?B?UFhuVC9WZExFdU0rSWhNeGI0TDVxT1U2WWlDeGluL040RzdOUWhoYmd5VWY3?=
 =?utf-8?Q?fP+AA9m03yecK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 18:42:50.7921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 508c4f09-479b-4c6a-1c7e-08dcdd91dc02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8740

On Wed, Sep 25, 2024 at 06:45:19PM +0100, Julien Grall wrote:
> Hi Edgar,
> 
> On 25/09/2024 17:49, Edgar E. Iglesias wrote:
> > On Wed, Sep 25, 2024 at 10:44 AM Edgar E. Iglesias <edgar.iglesias@amd.com>
> > wrote:
> > 
> > > On Wed, Sep 25, 2024 at 05:38:13PM +0100, Julien Grall wrote:
> > > > Hi Edgar,
> > > > 
> > > > On 25/09/2024 17:34, Edgar E. Iglesias wrote:
> > > > > On Wed, Sep 25, 2024 at 08:44:41AM +0100, Julien Grall wrote:
> > > > > > Hi,
> > > > > > On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> > > > > > > From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > > > > > > 
> > > > > > > When virtio-pci is specified in the dom0less domU properties,
> > > create a
> > > > > > > virtio-pci node in the guest's device tree. Set up an mmio handler
> > > with
> > > > > > > a register for the guest to poll when the backend has connected and
> > > > > > > virtio-pci bus is ready to be probed. Grant tables may be used by
> > > > > > > specifying virtio-pci = "grants";.
> > > > > > > 
> > > > > > > [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI specs).
> > > > > > >     Make grants iommu-map cover the entire PCI bus.
> > > > > > >     Add virtio-pci-ranges to specify memory-map for direct-mapped
> > > guests.
> > > > > > >     Document virtio-pci dom0less fdt bindings.]
> > > > > > > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > > > > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > > > > ---
> > > > > > >     docs/misc/arm/device-tree/booting.txt |  21 +++
> > > > > > >     xen/arch/arm/dom0less-build.c         | 238
> > > ++++++++++++++++++++++++++
> > > > > > >     xen/arch/arm/include/asm/kernel.h     |  15 ++
> > > > > > >     3 files changed, 274 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/docs/misc/arm/device-tree/booting.txt
> > > b/docs/misc/arm/device-tree/booting.txt
> > > > > > > index 3a04f5c57f..82f3bd7026 100644
> > > > > > > --- a/docs/misc/arm/device-tree/booting.txt
> > > > > > > +++ b/docs/misc/arm/device-tree/booting.txt
> > > > > > > @@ -276,6 +276,27 @@ with the following properties:
> > > > > > >         passed through. This option is the default if this property
> > > is missing
> > > > > > >         and the user does not provide the device partial device
> > > tree for the domain.
> > > > > > > +- virtio-pci
> > > > > > 
> > > > > > Similar question to the other patches, why is this specific to
> > > virtio PCI?
> > > > > > QEMU (or another device module) is free to emulate whatever it wants
> > > behind
> > > > > > the PCI hosbtridge.
> > > > > 
> > > > > There's no hard limitatino to only virtio-pci devices it's more of a
> > > > > recommendation that PVH guests should not use "emulated" devices but
> > > > > there's nothing stopping it.
> > > > 
> > > > Could you provide a bit more details where this requirement is coming
> > > from?
> > > > For instance, I would expect we would need to do some emulation to boot
> > > > Windows on Arm.
> > > > 
> > > 
> > > I see. I guess it just came from my mental model, I thought part of the
> > > philosophy behind PVH was to avoid emulated devices and use
> > > paravirualized (virtio or something else) or passthrough whereever
> > > possible (except for the basic set of devices needed like vGIC, vuart,
> > > MMU).
> > > 
> > 
> > For  example, we would recommend users to use virtio-net in favor of an
> > emulated eepro1000 or whatever other NIC models available in QEMU.
> 
> Indeed. I would always recommend user to use virtio-net over eepro1000.
> 
> > But there is no hard requirement nor limitation, a user can connect any
> > available PCI device from the QEMU set.
> 
> We need to be clear about what we are exposing to the guest. With this patch
> we will describe a PCI hostbridge in Device Tree (well it is an empty region
> we hope the Device Model to emulate at some point). But the hypervisor will
> not create the device model. Instead, you expect the user/integrator to have
> extra script to launch a Device Model (So it may not even be a hostbridge).

Right OK, I'll try make it clearer in the next versions allthough the
interface may change a bit if we go with your second suggestion below.

> 
> > 
> > Another thing we're looking to do is to minimize the QEMU build (Kconfig +
> > configure flags) to create a small build with only the stuff needed for
> > virtio-pci.
> 
> It is nice to have a cut down version of QEMU :). However, Xen doesn't care
> about the device model used for the emulation. I have seen some specialized
> DM in the wild (and used them while I was working on disaggregating the DM).
> 
> Anyway, while I understand this approach works in tailored environment, I am
> not convinced this works for a more general approach. The two options I
> would rather consider are:
>   1. Allow the device model to receive access for a single PCI device (IOW
> hook into vPCI).
>   2. Find a way to let the user provide the binding (maybe in a partial
> device-tree) + the list of Interrupts/MMIO that would be emulated by QEMU.
> 
> The second approach might be another way to get a second hostbridge in your
> use case while giving a bit more flexibility in what can be done (thinking
> about disagreggated environment).
>

Thanks, it makes sense and I like that it makes the FDT setup more explicit,
i.e user providing an FDT fragment rather than Xen implicitly generating
it behind the scene.

I'll wait for more comments but if folks don't disagree I will explore this
second option.

Cheers,
Edgar


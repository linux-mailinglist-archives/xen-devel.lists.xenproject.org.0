Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8596798651A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804416.1215390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stV8W-0002N4-6G; Wed, 25 Sep 2024 16:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804416.1215390; Wed, 25 Sep 2024 16:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stV8W-0002Ku-22; Wed, 25 Sep 2024 16:45:08 +0000
Received: by outflank-mailman (input) for mailman id 804416;
 Wed, 25 Sep 2024 16:45:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L/LJ=QX=amd.com=Edgar.Iglesias@srs-se1.protection.inumbo.net>)
 id 1stV8U-0002Km-LT
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 16:45:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2009::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80d35440-7b5d-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 18:45:04 +0200 (CEST)
Received: from MW3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:303:2b::32)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 16:44:54 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::bb) by MW3PR05CA0027.outlook.office365.com
 (2603:10b6:303:2b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.16 via Frontend
 Transport; Wed, 25 Sep 2024 16:44:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Wed, 25 Sep 2024 16:44:53 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Sep
 2024 11:44:51 -0500
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
X-Inumbo-ID: 80d35440-7b5d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMkhxqo8gzWBQi3FISw/ey5GSUwQR1NedXqw5t8to4aUaTC4f+KAIzWX8R9RPTHbjQsO4oGuHZgXzd3bO2BQOCg8QeOngm6Oze7GFjFDA/Rn3DYI1gdst0zRogEy4UHsok/Pf24snLJWIbyCDEFctxauPxqUfEZuN4JLSV7VcGCQG4aWfy1cZ+KxQhiulUWmiiE3mBGOl811qeqRSOR7Ggly0V/FoHES70l6iG96RlNmad10kqrTRM9NjJ7SsM6d08wBbCvNI+8FgM1dvGqd73/Dsd67Me9Fav9qDbtkNtboipVRBDcUMA9LbSh85FX+GWkDuWCyXrNdpXhDyl8NrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGa9G+s4wuh9sewcJ9qrBfnGYHmZI3RIb8YYb1qOMVo=;
 b=S5dyTtLiEvL8iAF0E9W61IsTFezNb0e0THRDXookodcqeSheNrDGW231kwPYZNvP37+Pdx7d/4iVIq7JsBMPx2nohPa4jgNuUOTyJHCrrcBVxjzN+VF0Ot/PFzL3V8/AtIWgtUOWUA1KTsmKvD7spKsZgel90B77XKcO4NtRtusoMA8tB9KRO6bk9ky5v0RViFNmrDkILQQwddgdFvjc7fIkkgHkZLMW4LYf6FLQiQebTO/m50nPlUceU8b6CQVLclltTc/NvGkQYvSglN7qbsF6gzhNbeGr6pkk+1midxE4Ttkjh2YODGpwLdOA+Klt/YOonUo+twjVEEl8uT17ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGa9G+s4wuh9sewcJ9qrBfnGYHmZI3RIb8YYb1qOMVo=;
 b=dTs+MeopYggV1asERaabqrfuffFCZaRkAABi02sE1UBg8i04tHkj5s98NTMAhkZMRFmTQfPO7eOYwweVOGD1g4bV32cEPsCrsUTnZS3vc+zLQKukuM78UFCMnadbo+cCXVJKCnUUmhpKUS1vr/hcXDPQdGioJtl92ywtBd4VyJk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Wed, 25 Sep 2024 18:44:48 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Julien Grall <julien@xen.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	<xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <dpsmith@apertussolutions.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
Message-ID: <ZvQ-AK--W7sWom7r@zapote>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com>
 <ce21a173-61f4-42d5-aa72-5b50135e6d76@xen.org>
 <ZvQ7mf9MbmSyC6RB@zapote>
 <d897124b-29c7-4aac-86bf-f1bec1aeade4@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d897124b-29c7-4aac-86bf-f1bec1aeade4@xen.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 584b5bff-fde8-42ad-db52-08dcdd81616d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xF0rpYXS6UToBRWpYblLutIkeb7E2IaUYeZ0aErYn9VOCe5bi4oLu+VAc/By?=
 =?us-ascii?Q?jjy9OA8w8SZScYDaSj1yTU9SxojjHQYtZotcVJX2x1Ym3dJQcJ0ahSh16sXD?=
 =?us-ascii?Q?XkFZ4LPPEpP+/mwMCvPELRTT7IjkgEqE1Prj54aqyy2E8WFCdEvTOTa57JAW?=
 =?us-ascii?Q?8uAcEbAOgi+WniT+uD9cLXumJ4SYhvS+E1afHRPPw29UbT9NyEVdRF250SJm?=
 =?us-ascii?Q?0TryqQAS+3A3rtHq6Hq1pEmlTArUL3cj5ckdy4mGmk9oAJIStehACtaGVJQg?=
 =?us-ascii?Q?bRPpHAUATMy1KJLYjQwFYUIUJ/fcZFQ1ZvlR0z0uapTVSMW8/5x7j/OkZROt?=
 =?us-ascii?Q?EX58AY/JI+xZLM0eWDGLa5+To87DSpp706Y9PrkdDHQP642L4Ib4GI0Ttf6y?=
 =?us-ascii?Q?XKJqXPMTbelLBEDqg5/oPktdSRdkYs2lb12pdyJ4gKWDkE1K45I6MBINN2wv?=
 =?us-ascii?Q?EF2FvkWwvqIka+y7shPuaap6vYI/jzA52T/aRPiXRId8uxUUHdwPBzHObYe5?=
 =?us-ascii?Q?XhXlkYAYEOV7D0JB40LF6VtKoOg5oC30fXXXu7oTbZ+tplFr6qviFXdRewNi?=
 =?us-ascii?Q?YGqz6VwRWUF3l9R9jZhv2hmu14Ty2IUIxG9Xh9TsL3wEW2LMQChjup9ktbWt?=
 =?us-ascii?Q?9FVlWw53uKEdzYpmc2fThvw6prNEjtF+fzDagsHA92sII7OoiIC9lZxxRh6X?=
 =?us-ascii?Q?5HKh9V1IX62bz8BzjdDthmJ6nII4Zm1gN3FGu2CMlO3zM63fzi3O068hskUQ?=
 =?us-ascii?Q?qpNpS4c/PKa0xu4MQx0PlM86WoqyFdsr5szvM9Ue2K9AugZKPKwMGBZAc7fT?=
 =?us-ascii?Q?m848rC1Y/v11HhJ4HfY9A+B+HuX0IHQFYQLeIvsEhxTYR159D0EhbpTht1fE?=
 =?us-ascii?Q?tU5EiYmLsz106HVS9vI/1dZHWMC4Mu7LJsWzDuxxxpWnex7pvsxeL/kUZPwJ?=
 =?us-ascii?Q?ejtfC+cQVjb+0hP1HDBi8j7k2etGqYL9ZomzqVQWOT1G7mnPFH9MNqmwy+Ah?=
 =?us-ascii?Q?gCv8GfATUoRwxdTI0o6SrjE8JHaIM/NX8RumeI1F5hpKOS6GrbJht4kWn7BV?=
 =?us-ascii?Q?rQAHtrugzBZGizdmaGU8NtWiPcf/bIqmZ+yq326y9pG7/YorlIy7BGHqA7Lq?=
 =?us-ascii?Q?/lnmjBi40Dc1RkdLTCnKauj6ieDVGNLyrgjvZUpiuTaWrvLdxGxyEKvMntu8?=
 =?us-ascii?Q?AaU4n0AraC4RRasoNlRXAHYKMJLlGFg1eZwZQ51I2HTaikg68I99S3QCy8PX?=
 =?us-ascii?Q?W/p2c4oZGiH63ZyuXCHCjkQS5HpkXK+H5l7Z5trjcqAsEzKoTbDgLlND785Z?=
 =?us-ascii?Q?WPq32+ZQGaldV8qVZDivpkTjOPU2ULZ05nCQb74b42keg+WeAgXV6sJxUkj0?=
 =?us-ascii?Q?sd7bmZ7wuB1+kbiXzI2UrFuev6xA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:44:53.3470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 584b5bff-fde8-42ad-db52-08dcdd81616d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055

On Wed, Sep 25, 2024 at 05:38:13PM +0100, Julien Grall wrote:
> Hi Edgar,
> 
> On 25/09/2024 17:34, Edgar E. Iglesias wrote:
> > On Wed, Sep 25, 2024 at 08:44:41AM +0100, Julien Grall wrote:
> > > Hi,
> > > On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> > > > From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > > > 
> > > > When virtio-pci is specified in the dom0less domU properties, create a
> > > > virtio-pci node in the guest's device tree. Set up an mmio handler with
> > > > a register for the guest to poll when the backend has connected and
> > > > virtio-pci bus is ready to be probed. Grant tables may be used by
> > > > specifying virtio-pci = "grants";.
> > > > 
> > > > [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI specs).
> > > >    Make grants iommu-map cover the entire PCI bus.
> > > >    Add virtio-pci-ranges to specify memory-map for direct-mapped guests.
> > > >    Document virtio-pci dom0less fdt bindings.]
> > > > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > ---
> > > >    docs/misc/arm/device-tree/booting.txt |  21 +++
> > > >    xen/arch/arm/dom0less-build.c         | 238 ++++++++++++++++++++++++++
> > > >    xen/arch/arm/include/asm/kernel.h     |  15 ++
> > > >    3 files changed, 274 insertions(+)
> > > > 
> > > > diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> > > > index 3a04f5c57f..82f3bd7026 100644
> > > > --- a/docs/misc/arm/device-tree/booting.txt
> > > > +++ b/docs/misc/arm/device-tree/booting.txt
> > > > @@ -276,6 +276,27 @@ with the following properties:
> > > >        passed through. This option is the default if this property is missing
> > > >        and the user does not provide the device partial device tree for the domain.
> > > > +- virtio-pci
> > > 
> > > Similar question to the other patches, why is this specific to virtio PCI?
> > > QEMU (or another device module) is free to emulate whatever it wants behind
> > > the PCI hosbtridge.
> > 
> > There's no hard limitatino to only virtio-pci devices it's more of a
> > recommendation that PVH guests should not use "emulated" devices but
> > there's nothing stopping it.
> 
> Could you provide a bit more details where this requirement is coming from?
> For instance, I would expect we would need to do some emulation to boot
> Windows on Arm.
>

I see. I guess it just came from my mental model, I thought part of the
philosophy behind PVH was to avoid emulated devices and use
paravirualized (virtio or something else) or passthrough whereever
possible (except for the basic set of devices needed like vGIC, vuart,
MMU).

Cheers,
Edgar


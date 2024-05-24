Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A788CDF7C
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729026.1134159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKgd-0001Nt-Ut; Fri, 24 May 2024 02:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729026.1134159; Fri, 24 May 2024 02:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKgd-0001M7-Rm; Fri, 24 May 2024 02:29:39 +0000
Received: by outflank-mailman (input) for mailman id 729026;
 Fri, 24 May 2024 02:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAKX0-0004I4-Vq
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:19:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 134734f7-1974-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 04:19:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B6B9562FBA;
 Fri, 24 May 2024 02:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760C6C2BD10;
 Fri, 24 May 2024 02:19:38 +0000 (UTC)
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
X-Inumbo-ID: 134734f7-1974-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716517179;
	bh=fJq2+WWu20TIMSRKeUvrIZ8uc1GT9bi5wl+3P9HWW68=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qbJgtNjSQTOo3YAFdn+5GuA/tamyUEE2tI3r0TpiRUpyj9pyNUMIZ8uBhnNmvNObF
	 keFmwHLlLPliizXSj7DLpG11WeKHHqW01LV4NXDuV8lpL7Gh5NxmzNmd26/BSxm6VH
	 Gkcm+YX7dJdkhcV1dRVCche4AIJcOvdXs+GBpuws0J3xthN80aC401a9bLCUq+s1Zu
	 AvTA5ZzFtuw+dkeYSWpnzFVIuD27Ygq47fqDOuL/TAR1ML7GsOoqJgoUB0fIQ9NvGM
	 X51+LblZOypdDg1fDIX8HfJD0/OUPwcTBMyhmMaNZYWqa2d4PCUSbncPGjjUSReCAe
	 nkEBZAixbxaIg==
Date: Thu, 23 May 2024 19:19:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 9/9] docs: Add device tree overlay documentation
In-Reply-To: <a437fe4c-bb21-456f-acf3-53ae8916f4f6@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405231835090.2557291@ubuntu-linux-20-04-desktop>
References: <20240523074040.1611264-1-xin.wang2@amd.com> <20240523074040.1611264-10-xin.wang2@amd.com> <a437fe4c-bb21-456f-acf3-53ae8916f4f6@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 May 2024, Julien Grall wrote:
> Hi Henry,
> 
> On 23/05/2024 08:40, Henry Wang wrote:
> > From: Vikram Garhwal <fnu.vikram@xilinx.com>
> > 
> > Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > ---
> > v4:
> > - No change.
> > v3:
> > - No change.
> > v2:
> > - Update the content based on the changes in this version.
> > ---
> >   docs/misc/arm/overlay.txt | 99 +++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 99 insertions(+)
> >   create mode 100644 docs/misc/arm/overlay.txt
> > 
> > diff --git a/docs/misc/arm/overlay.txt b/docs/misc/arm/overlay.txt
> > new file mode 100644
> > index 0000000000..811a6de369
> > --- /dev/null
> > +++ b/docs/misc/arm/overlay.txt
> > @@ -0,0 +1,99 @@
> > +# Device Tree Overlays support in Xen
> > +
> > +Xen now supports dynamic device assignment to running domains,
> 
> This reads as we "support" the feature. I would prefer if we write "Xen
> expirementally supports..." or similar.

Done


> > +i.e. adding/removing nodes (using .dtbo) to/from Xen device tree, and
> > +attaching/detaching them to/from a running domain with given $domid.
> > +
> > +Dynamic node assignment works in two steps:
> > +
> > +## Add/Remove device tree overlay to/from Xen device tree
> > +
> > +1. Xen tools check the dtbo given and parse all other user provided
> > arguments
> > +2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
> > +3. Xen hypervisor applies/removes the dtbo to/from Xen device tree.
> > +
> > +## Attach/Detach device from the DT overlay to/from domain
> > +
> > +1. Xen tools check the dtbo given and parse all other user provided
> > arguments
> > +2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
> > +3. Xen hypervisor attach/detach the device to/from the user-provided $domid
> > by
> > +   mapping/unmapping node resources in the DT overlay.
> > +
> > +# Examples
> > +
> > +Here are a few examples on how to use it.
> > +
> > +## Dom0 device add
> > +
> > +For assigning a device tree overlay to Dom0, user should firstly properly
> > +prepare the DT overlay. More information about device tree overlays can be
> > +found in [1]. Then, in Dom0, enter the following:
> > +
> > +    (dom0) xl dt-overlay add overlay.dtbo
> > +
> > +This will allocate the devices mentioned in overlay.dtbo to Xen device
> > tree.
> > +
> > +To assign the newly added device from the dtbo to Dom0:
> > +
> > +    (dom0) xl dt-overlay attach overlay.dtbo 0
> > +
> > +Next, if the user wants to add the same device tree overlay to dom0
> > +Linux, execute the following:
> > +
> > +    (dom0) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
> > +    (dom0) cat overlay.dtbo >
> > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
> > +
> > +Finally if needed, the relevant Linux kernel drive can be loaded using:
> > +
> > +    (dom0) modprobe module_name.ko
> > +
> > +## Dom0 device remove
> > +
> > +For removing the device from Dom0, first detach the device from Dom0:
> > +
> > +    (dom0) xl dt-overlay detach overlay.dtbo 0
> > +
> > +NOTE: The user is expected to unload any Linux kernel modules which
> > +might be accessing the devices in overlay.dtbo before detach the device.
> > +Detaching devices without unloading the modules might result in a crash.
> > +
> > +Then remove the overlay from Xen device tree:
> > +
> > +    (dom0) xl dt-overlay remove overlay.dtbo
> > +
> > +## DomU device add/remove
> > +
> > +All the nodes in dtbo will be assigned to a domain; the user will need
> > +to prepare the dtb for the domU. For example, the `interrupt-parent`
> > property
> > +of the DomU overlay should be changed to the Xen hardcoded value `0xfde8`.
> > +Below assumes the properly written DomU dtbo is `overlay_domu.dtbo`.
> > +
> > +User will need to create the DomU with below properties properly configured
> > +in the xl config file:
> > +- `iomem`
> 
> I don't quite understand how the user can specify the MMIO region if the
> device is attached after the domain is created.

I think this was meant for a domain about to be created (not already
running). I clarified.


> 
> > +- `passthrough` (if IOMMU is needed)
> > +
> > +User will also need to modprobe the relevant drivers.
> > +
> > +Example for domU device add:
> > +
> > +    (dom0) xl dt-overlay add overlay.dtbo            # If not executed
> > before
> > +    (dom0) xl dt-overlay attach overlay.dtbo $domid
> 
> Can how clarify how the MMIO will be mapped? Is it direct mapped? If so,
> couldn't this result to clash with other part of the address space (e.g.
> RAM?).

Yes, it is reusing the same code as dom0, which makes the code nice but
it doesn't support non-1:1 mappings. I think those should be done via
the xen,reg property. My suggestion would be this:

- if xen,reg is present, use it
- if xen,reg is not present, fall back to 1:1 mapping based on reg

For the next version of the series, I'd just document the current
limitation of the implementation. I added this to patch #4:

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 0f8b25ccb4..c2b03865a7 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -845,7 +845,7 @@ static long handle_attach_overlay_nodes(struct domain *d,
                                         uint32_t overlay_fdt_size)
 {
     int rc;
-    unsigned int j;
+    unsigned int j, len;
     struct overlay_track *entry;
 
     rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
@@ -888,6 +888,12 @@ static long handle_attach_overlay_nodes(struct domain *d,
             goto out;
         }
 
+        if ( dt_get_property(overlay_node, "xen,reg", &len) )
+        {
+            printk(XENLOG_ERR "xen,reg not supported yet in overlay\n");
+            rc = -EOPNOTSUPP;
+            goto out;
+        }
         write_lock(&dt_host_lock);
         rc = handle_device(d, overlay_node, p2m_mmio_direct_c,
                            entry->iomem_ranges, entry->irq_ranges);



> > +    (dom0) xl console $domid                         # To access $domid
> > console
> > +
> > +Next, if the user needs to modify/prepare the overlay.dtbo suitable for
> > +the domU:
> > +
> > +    (domU) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
> > +    (domU) cat overlay_domu.dtbo >
> > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
> > +
> > +Finally, if needed, the relevant Linux kernel drive can be probed:
> > +
> > +    (domU) modprobe module_name.ko
> > +
> > +Example for domU overlay remove:
> > +
> > +    (dom0) xl dt-overlay detach overlay.dtbo $domid
> > +    (dom0) xl dt-overlay remove overlay.dtbo
> 
> I assume we have safety check in place to ensure we can't remove the device if
> it is already attached. Is that correct?

I'll remove this part of the doc.


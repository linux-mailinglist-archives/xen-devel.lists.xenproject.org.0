Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F9E8CE3EA
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 11:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729244.1134389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sARen-00021h-KS; Fri, 24 May 2024 09:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729244.1134389; Fri, 24 May 2024 09:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sARen-0001zV-Gv; Fri, 24 May 2024 09:56:13 +0000
Received: by outflank-mailman (input) for mailman id 729244;
 Fri, 24 May 2024 09:56:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sARem-0001wi-BK
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 09:56:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sARel-0006lq-Hl; Fri, 24 May 2024 09:56:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sARel-0005Nv-A1; Fri, 24 May 2024 09:56:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=EEDfjkRt6blO2trxyslNclOy3h3ZXVBkdsotf+FX3lI=; b=ZX2EtO9odUk1nDPpIKW0BWyc56
	9Rg93BrHoNv4kph7p61Q7Y2hA4KMDIkuP+cm/+QXnvPHO8iaSyNu28F9wxj//RDSrUsGUjEA34dSe
	ZrfwVK6muhKssUFvQR7F8r8wwmejBHzTWEGdwVRXNcb45VAOGII6fTsIrPD8Rt0tREx0=;
Message-ID: <a7a0456d-9eac-4db4-8782-ae94c7e338b1@xen.org>
Date: Fri, 24 May 2024 10:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] docs: Add device tree overlay documentation
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: anthony@xenproject.org, sstabellini@kernel.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Henry Wang <xin.wang2@amd.com>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
 <20240524021814.2666257-7-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240524021814.2666257-7-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/05/2024 03:18, Stefano Stabellini wrote:
> From: Vikram Garhwal <fnu.vikram@xilinx.com>
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>   docs/misc/arm/overlay.txt | 82 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
>   create mode 100644 docs/misc/arm/overlay.txt
> 
> diff --git a/docs/misc/arm/overlay.txt b/docs/misc/arm/overlay.txt
> new file mode 100644
> index 0000000000..0a2dee951a
> --- /dev/null
> +++ b/docs/misc/arm/overlay.txt
> @@ -0,0 +1,82 @@
> +# Device Tree Overlays support in Xen
> +
> +Xen experimentally supports dynamic device assignment to running
> +domains, i.e. adding/removing nodes (using .dtbo) to/from Xen device
> +tree, and attaching them to a running domain with given $domid.
> +
> +Dynamic node assignment works in two steps:
> +
> +## Add/Remove device tree overlay to/from Xen device tree
> +
> +1. Xen tools check the dtbo given and parse all other user provided arguments
> +2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
> +3. Xen hypervisor applies/removes the dtbo to/from Xen device tree.
> +
> +## Attach device from the DT overlay to domain
> +
> +1. Xen tools check the dtbo given and parse all other user provided arguments
> +2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
> +3. Xen hypervisor attach the device to the user-provided $domid by
> +   mapping node resources in the DT overlay.
> +
> +# Examples
> +
> +Here are a few examples on how to use it.
> +
> +## Dom0 device add
> +
> +For assigning a device tree overlay to Dom0, user should firstly properly
> +prepare the DT overlay. More information about device tree overlays can be
> +found in [1]. Then, in Dom0, enter the following:
> +
> +    (dom0) xl dt-overlay add overlay.dtbo
> +
> +This will allocate the devices mentioned in overlay.dtbo to Xen device tree.
> +
> +To assign the newly added device from the dtbo to Dom0:
> +
> +    (dom0) xl dt-overlay attach overlay.dtbo 0
> +
> +Next, if the user wants to add the same device tree overlay to dom0
> +Linux, execute the following:
> +
> +    (dom0) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
> +    (dom0) cat overlay.dtbo > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
> +
> +Finally if needed, the relevant Linux kernel drive can be loaded using:
> +
> +    (dom0) modprobe module_name.ko
> +
> +## DomU device add/remove
> +
> +All the nodes in dtbo will be assigned to a domain; the user will need
> +to prepare the dtb for the domU.

s/dtb/dtbo/? But I am little bit confused with the wording. I think you 
may want to add *different dtbo* so it clarifies from the start (this 
only becomes obvious at the end of the section) that the user is not 
meant to use the same for all the commands.

  For example, the `interrupt-parent`
> +property of the DomU overlay should be changed to the Xen hardcoded
> +value `0xfde8`, and the xen,reg property should be added to specify the
> +address mappings. 
> If xen,reg is not present, it is assumed 1:1 mapping.

Repeating an earlier comment here. I think xen,reg should be mandatory 
for non-direct mapped domain.

Also, can you clarify what is the expect property layout for xen,reg?

> +Below assumes the properly written DomU dtbo is `overlay_domu.dtbo`.
> +
> +For new domains to be created, the user will need to create the DomU
> +with below properties properly configured in the xl config file:
> +- `iomem`

I looked at your reply in v4 and I am afraid I still don't understand 
why we are mentioning 'iomem'. If we want to use the commands below, 
then the domain needs to be created in advance. So you can't yet know 
'iomem'.

You could avoid "xl dt-overlay attach" but then you need the user to 
specify both "irqs" and "iomem". From a user point of view, it would be 
easier to add a new propery in the configuration file listing the 
overlays. Something like:

dt_overlays = [ "overlay.dtbo", ... ]

Anyway, that somewhat separate. For now, I think we want to drop 'iomem' 
from the list and reword this paragraph to say that the 'passthrough' 
property needs to be set if you plan to use DT overlay and devices 
requiring the IOMMU.

> +- `passthrough` (if IOMMU is needed)

This property is required at the start because we don't support enabling 
the IOMMU lazily.

> +
> +User will also need to modprobe the relevant drivers. For already
> +running domains, the user can use the xl dt-overlay attach command,
> +example:
> +
> +    (dom0) xl dt-overlay add overlay.dtbo            # If not executed before
> +    (dom0) xl dt-overlay attach overlay.dtbo $domid
> +    (dom0) xl console $domid                         # To access $domid console
> +
> +Next, if the user needs to modify/prepare the overlay.dtbo suitable for
> +the domU:
> +
> +    (domU) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
> +    (domU) cat overlay_domu.dtbo > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
> +
> +Finally, if needed, the relevant Linux kernel drive can be probed:
> +
> +    (domU) modprobe module_name.ko
> +
> +[1] https://www.kernel.org/doc/Documentation/devicetree/overlay-notes.txt

Cheers,

-- 
Julien Grall


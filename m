Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79078CEC9D
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 01:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730031.1135403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAe5x-0005DF-7o; Fri, 24 May 2024 23:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730031.1135403; Fri, 24 May 2024 23:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAe5x-0005AH-4d; Fri, 24 May 2024 23:13:05 +0000
Received: by outflank-mailman (input) for mailman id 730031;
 Fri, 24 May 2024 23:13:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAe5w-00058v-10
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 23:13:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAe5v-0004Fy-KG; Fri, 24 May 2024 23:13:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAe5v-0004Vg-FB; Fri, 24 May 2024 23:13:03 +0000
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
	bh=RL4ZX7klA5U0PTSL6uIu8UyuYsdsyCmM2AhccTjf8pM=; b=iqnRXM4ynJoYV+BoE75/fDllwU
	OMv7ohPnDZ45KU6nbaKaq+zXov8TWX0vzYbeYb5nM/PAc2ZCHiEiULtvQGTCIcOFd5NHhA79+L+uv
	O0W7fctweS8KO5zt4MhZvuf40w70X4ardH0c/RjhluWEWr+K9Sqz4XHaxlmswe6QTsIw=;
Message-ID: <0bd12ab7-98e3-4ef6-8305-5c78e95cab76@xen.org>
Date: Sat, 25 May 2024 00:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] docs: Add device tree overlay documentation
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: anthony@xenproject.org, sstabellini@kernel.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Henry Wang <xin.wang2@amd.com>
References: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
 <20240524221647.2860711-7-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240524221647.2860711-7-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/05/2024 23:16, Stefano Stabellini wrote:
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
> index 0000000000..ef3ef792f7
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
> +All the nodes in dtbo will be assigned to one domain. The user will need
> +to prepare a different dtbo for the domU. For example, the
> +`interrupt-parent` property of the DomU overlay should be changed to the
> +Xen hardcoded value `0xfde8` and the xen,reg property should be added to
> +specify the address mappings. If the domain is not 1:1 mapped, xen,reg
> +must be present. See the xen,reg format description in
> +docs/misc/arm/passthrough.txt. Below assumes the properly written DomU
> +dtbo is `overlay_domu.dtbo`.
> +
> +You need to set the `passthrough` property in the xl config file if you

s/You need/The user needs/ to match the rest of the documentation.

With that addresed:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


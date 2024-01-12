Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889082B8A3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 01:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666587.1037325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO5WK-0007XI-En; Fri, 12 Jan 2024 00:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666587.1037325; Fri, 12 Jan 2024 00:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO5WK-0007VZ-Bh; Fri, 12 Jan 2024 00:35:36 +0000
Received: by outflank-mailman (input) for mailman id 666587;
 Fri, 12 Jan 2024 00:35:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KDsp=IW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rO5WI-0007VT-Qn
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 00:35:34 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cd885f3-b0e2-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 01:35:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E0606CE1D6F;
 Fri, 12 Jan 2024 00:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EA3C433C7;
 Fri, 12 Jan 2024 00:35:23 +0000 (UTC)
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
X-Inumbo-ID: 7cd885f3-b0e2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705019725;
	bh=GRV66zm4ivMh+EQxjFowUDR+P94FxzumS/2bUb/lpfM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kGW8kKdouJdzpBXQBnPvDM42IVSdT7TW84d2QVvCF77ZqzIuV1YU5JiVI4i6tVaB8
	 +MvTV2Q8GkbuXhlf1YgSLSTl73DwmPZt4d8UgKvvc+dLUX+a8KltXl2/P8Sm8X/xsy
	 IrtFGMgfrqO3jhHfKrxOFIVlcoJuXtsEY3/VaX1qXznJHQG9SnS3P6Qu1zB+dwgu0A
	 w+DVIXwgIflLmsKuChaMYITxar41PoWq5EQepDnWwuMp7ER7UqJsLSMjBT31q4mHCH
	 t/Ovjz1y2skqrFtJHo1Dqw8I48rPaVCSjbetaMrWFAXVHpzYOlNjcLcnMOfisP4aAe
	 NpuIJ1R9zIiSg==
Date: Thu, 11 Jan 2024 16:35:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, 
    "olekstysh@gmail.com" <olekstysh@gmail.com>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, vikram.garhwal@amd.com, 
    Bertrand.Marquis@arm.com, michal.orzel@amd.com, Artem_Mygaiev@epam.com
Subject: Re: [VirtIO] Support for various devices in Xen
In-Reply-To: <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2401111627360.3675@ubuntu-linux-20-04-desktop>
References: <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-964746296-1705019297=:3675"
Content-ID: <alpine.DEB.2.22.394.2401111628250.3675@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-964746296-1705019297=:3675
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2401111628251.3675@ubuntu-linux-20-04-desktop>

Hi Andrei,

Great that you are working with Xen and virtio. We at AMD are very
interested in it as well.

I'll let Artem (CCed) and his team comment about the xen-troops
repository.

I can share that from our side we are working toward adding complete
support for using QEMU as virtio-backends provider. Vikram (CCed)
managed to get virtio-net to work with the backend in QEMU. He should be
able to provide instructions. We want to get those patches upstream in
Xen and QEMU as soon as possible.

The libxl changes are lagging behind a bit and you might have to use
device_model_args to enable virtio backends in QEMU.

For SCMI, I'll let Bertrand (CCed) comment.

Cheers,

Stefano


On Thu, 11 Jan 2024, Andrei Cherechesu (OSS) wrote:
> Hello,
> 
> As I've mentioned in previous discussion threads in the xen-devel
> community, we are running Xen 4.17 (uprev to 4.18 in progress) on NXP
> S32G automotive processors (Cortex-A53 cores) and we wanted to know more
> about the support for various VirtIO device types in Xen.
> 
> In the Xen 4.17 release notes, the VirtIO standalone backends mentioned
> as supported and tested are: virtio-disk, virtio-net, virtio-i2c and
> virtio-gpio.
> 
> However, we've only managed to successfully set up and try some
> use-cases with the virtio-disk standalone backend [0] (which Olexandr
> provided) based on the virtio-mmio transport.
> 
> As such, we have a few questions, which we haven't been able to figure
> out from the mailing list discussions and/or code:
>     1. Are there any plans for the virtio-disk repo to have a stable
>     version? Is it going to be long-term hosted and maintained in the
>     xen-troops github repo? Or was it just an one-time PoC implementation
> 
>     and the strategy for future VirtIO devices will be based on a more generic
> 
>     approach (i.e., without need for a specific standalone app)?
> 
> 
>     2. With regards to the other backends, we want to try out and provide PV
> 
>     networking to a DomU based on virtio-net, but we haven't found any available
> 
>     resources for it (e.g., the standalone backend implementation if needed for
> 
>     control plane, configuration examples, presentations, demos, docs). Does it
> 
>     rely on the QEMU virtio-net or vhost implementation? Are there any examples
> 
>     on how to set it up? Any required Xen/Linux Kernel/QEMU versions?
> 
> 
>     3. What other VirtIO device types are there planned to be supported in Xen?
> 
>     I'm supposing libxl will also need changes to accomodate new configuration
> 
>     parameters for each of them. Or is there something I'm missing?
> 
> 
>     4. Also, while we're at it, are there any plans regarding SCMI
>     awareness for Xen (e.g., SCMI Mediator - where the RFC thread from 2022
> 
>     seems discontinued)? Or is the preferred approach for sharing SCMI access
> 
>     to guests through virtio-scmi?
> 
> Thank you very much for the support, once again, and we're also looking
> forward to the progress on the rust-vmm initiative.
> 
> Regards,
> Andrei Cherechesu,
> NXP Semiconductors
> 
> [0] https://github.com/xen-troops/virtio-disk
> 
> 
> 
--8323329-964746296-1705019297=:3675--


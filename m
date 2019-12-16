Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB79121EB8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 00:08:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igzQs-0001an-AA; Mon, 16 Dec 2019 23:05:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=swpo=2G=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1igzQq-0001ai-R9
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 23:05:40 +0000
X-Inumbo-ID: 93b6c61c-2058-11ea-9433-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93b6c61c-2058-11ea-9433-12813bfff9fa;
 Mon, 16 Dec 2019 23:05:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0ED612465E;
 Mon, 16 Dec 2019 23:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576537539;
 bh=076Qv4Xn1lznPr2gG/EmfGj9EKR8DDhzZpclYLDqWuU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=zIfYk7uH/fasaRfHnc2L1UiMyFXCEMQXCtmcN/3ubzDPW4dXrShOkeozgQ6Ff6Lsk
 ZhNC8yAnF/AeXAWVwEaxhxcJs2gOhPZpT0gE3HQYoipZiu34bmziadUQa0MuNP5pE3
 uqzNXX+qmtwJnyKAbYFTnkE0bb+PJBnhzWuPG6LQ=
Date: Mon, 16 Dec 2019 15:05:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <766fc278-d729-ae7c-1abb-053f938eb8aa@xen.org>
Message-ID: <alpine.DEB.2.21.1912161450550.13474@sstabellini-ThinkPad-T480s>
References: <AM6PR04MB42465A5C5405FE85DA1F6FB0F9510@AM6PR04MB4246.eurprd04.prod.outlook.com>
 <766fc278-d729-ae7c-1abb-053f938eb8aa@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1111285209-1576537213=:13474"
Content-ID: <alpine.DEB.2.21.1912161500150.13474@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] Xen ARM Dom0less passthrough without IOMMU
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1111285209-1576537213=:13474
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1912161500151.13474@sstabellini-ThinkPad-T480s>

On Mon, 16 Dec 2019, Julien Grall wrote:
> On 16/12/2019 18:02, Andrei Cherechesu wrote:
> > Hello,
> 
> Hello,
> 
> > My name is Andrei Cherechesu and I'm a Software Engineer at NXP
> > 
> > Semiconductors in the Automotive department, Linux BSP Team.
> > 
> > I would like to tell you have done a great job so far with Xen.
> 
> Thank you for your interest in Xen on Arm.

Yes, thank you!!


> > Thus, we have ported and integrated Xen ARM in the Linux BSP for our
> > 
> > boards.
> > 
> > Currently, we are trying to passthrough devices in order to statically
> > 
> > assign them to different DomUs at boot time (Dom0less configuration).
> > 
> > Our boards do not have an IOMMU and so our work is only possible
> > 
> > with the help of the patches submitted by Stefano Stabellini that
> > 
> > implemented "xen,force-assign-without-iommu" property in the
> > 
> > partial device trees used for passthrough.
> > 
> > I made a configuration in order to setup the dtb /chosen
> > 
> > node to boot a Dom0less VM in parallel with Dom0, with a
> > 
> > peripherical device statically assigned to it.
> > 
> > However, only if I advertise the passthrough dtb node in u-boot,
> > 
> > when I boot Xen, I am given the following error:
> > 
> > (XEN) *** LOADING DOMAIN 0 ***
> > 
> > (XEN) Loading d0 kernel from boot module @ 00000000be800000
> > 
> > (XEN) Loading ramdisk from boot module @ 00000000b1000000
> > 
> > (XEN) Allocating 1:1 mappings totalling 512MB for dom0:
> > 
> > (XEN) BANK[0] 0x000000d0000000-0x000000f0000000 (512MB)
> > 
> > (XEN) Grant table range: 0x00000080200000-0x00000080240000
> > 
> > (XEN) Allocating PPI 16 for event channel interrupt
> > 
> > (XEN) Loading zImage from 00000000be800000 to
> > 00000000d0080000-00000000d0930008
> > 
> > (XEN) Loading dom0 initrd from 00000000b1000000 to
> > 0x00000000d8200000-0x00000000e01fffff
> > 
> > (XEN) Loading dom0 DTB to 0x00000000d8000000-0x00000000d800596a
> > 
> > (XEN) Initial low memory virq threshold set at 0x4000 pages.
> > 
> > (XEN) Scrubbing Free RAM in background
> > 
> > (XEN) Std. Loglevel: All
> > 
> > (XEN) Guest Loglevel: All
> > 
> > (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> > 
> > (XEN) domain.c:322: IOMMU is not enabled
> > 
> > (XEN)
> > 
> > (XEN) ****************************************
> > 
> > (XEN) Panic on CPU 0:
> > 
> > (XEN) Error creating domain domU1
> > 
> > (XEN) ****************************************
> > 
> > My Xen is taken from Stefano’s tree
> > (http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git)
> > 
> > that he specified in this
> > <https://lists.xenproject.org/archives/html/xen-devel/2019-10/msg00414.html>
> > thread index, and only has the additional commits
> > 
> > that add support for our boards applied by myself.
> 
> This series as been merged in the upcoming release of Xen. I would therefore
> recommend to use the upstream staging/master in case bugs may have been fixed
> there.
> 
> > 
> >  From what I've read on the mailing lists, the Dom0less Device
> > 
> > Passthrough Without IOMMU feature is supported, at least,
> > 
> > on boards that do have a physical IOMMU but have some devices that
> > 
> > are not behind it.
> > 
> > My question is: In the way that it is currently implemented,
> > 
> > is the Dom0less Device Passthrough feature currently supported
> > 
> > on boards that do not have an IOMMU at all?
> 
> Looking at the code, there are a few issues in current Xen that would prevent
> passthrough without IOMMU to work.
> 
> For a first, Xen is requesting to create instiate an IOMMU context for the
> domain if a partial DT is present (see create_domUs()). The following path
> should get rid of the panic above (/!\ it is a gross hack and not for
> upstream/production):
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index dd9c3b73ba..5700b992df 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2474,9 +2474,6 @@ void __init create_domUs(void)
>              panic("Missing property 'cpus' for domain %s\n",
>                    dt_node_name(node));
> 
> -        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
> -            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> -
>          if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
>          {
>              d_cfg.arch.nr_spis = gic_number_lines() - 32;
> 
> But even with this patch, RAM in DomU is not direct mapped (i.e Guest Physical
> Address == Host Physical Address). This means that DMA-capable device would
> not work properly in DomU.
> 
> We could theoritically map DomU direct mapped, but this would break the
> isolation provided by the hypervisor.

Yes, being able to map the DomU memory 1:1 can be pretty useful for some
very embedded dom0less configurations, in fact I was surprised that a
couple of Xilinx users asked me for that recently. Typically, the users
are aware of the consequences but they still find them better than the
alternative (i.e. the lack of isolation is bad but is tolerable in their
configuration.)

From an implementation perspective, it should be a matter of calling
allocate_memory_11 instead of allocate_memory from construct_domU. I
wanted to experiment with it myself but I haven't had the time. If
nothing else, it would be useful to have a patch around to do it if
needed.
--8323329-1111285209-1576537213=:13474
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1111285209-1576537213=:13474--


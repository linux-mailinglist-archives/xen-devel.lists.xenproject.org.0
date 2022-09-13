Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2285B64AC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 02:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406073.648462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXu8u-0002J5-Hz; Tue, 13 Sep 2022 00:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406073.648462; Tue, 13 Sep 2022 00:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXu8u-0002G2-Ec; Tue, 13 Sep 2022 00:51:12 +0000
Received: by outflank-mailman (input) for mailman id 406073;
 Tue, 13 Sep 2022 00:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVF+=ZQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oXu8s-0002Fw-Qg
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 00:51:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26bfde7d-32fe-11ed-9760-273f2230c3a0;
 Tue, 13 Sep 2022 02:51:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADF5E60F21;
 Tue, 13 Sep 2022 00:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87521C433D6;
 Tue, 13 Sep 2022 00:51:05 +0000 (UTC)
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
X-Inumbo-ID: 26bfde7d-32fe-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663030266;
	bh=3GDVqr6ZFBQTMhXWnaF9L7B9qBdNmsR1PeWUnVoRMvk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Bgq4+0ZNb+Q4NKS/DEl8BU8oRQ07prRFZiAHmirWljJMgHfsZMs6FSqEzhTgu4GC9
	 kGqPm/IngMbJc4Ewiy35bteiBP1jcuwgRHx6WzODJvq86yz8aUSAgf+X6g0PC55CZB
	 KcmhJZnqEr/KDdTUn35W86sFUY4wynh63EHVWDm9qkDLq+piwy1bXxyfemuV7aUkjQ
	 R2ha2rP+IMYy3B579kz9uJZdzEzkQ85Snd4e2MPZJuPIfBXNJvNdTDhpc6w0+rT5L+
	 bWt/D6Nv1CXM9rOiCo8tiKuA0nEQwvrxsTU0SvwP0F7VfwwmfbxQo9XdKROGoTyOSU
	 82RONVSlBcJWA==
Date: Mon, 12 Sep 2022 17:51:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org
Subject: Re: [ImageBuilder] Update README.md
In-Reply-To: <e2a9619b-5334-59ff-a060-459a2d6b6216@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209121750550.157835@ubuntu-linux-20-04-desktop>
References: <20220912115918.19496-1-michal.orzel@amd.com> <e2a9619b-5334-59ff-a060-459a2d6b6216@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Sep 2022, Ayan Kumar Halder wrote:
> On 12/09/2022 12:59, Michal Orzel wrote:
> > Get rid of references to XEN_PASSTHROUGH_PATHS, as there is no such option
> > and it should be replaced with DOMU_PASSTHROUGH_PATHS[number].
> > 
> > Update PASSTHROUGH_DTS_REPO example. The directory storing partial device
> > trees is now device-trees-2021.2/zcu102 instead of device-trees-2021.2.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> >   README.md | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/README.md b/README.md
> > index 041818349954..da9ba788a3bf 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -34,7 +34,7 @@ BOOT_CMD="booti"
> >   DEVICE_TREE="mpsoc.dtb"
> >   XEN="xen"
> >   XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1
> > bootscrub=0 vwfi=native sched=null"
> > 
> > -PASSTHROUGH_DTS_REPO="git@github.com:Xilinx/xen-passthrough-device-trees.git
> > device-trees-2021.2"
> > +PASSTHROUGH_DTS_REPO="git@github.com:Xilinx/xen-passthrough-device-trees.git
> > device-trees-2021.2/zcu102"
> >   DOM0_KERNEL="Image-dom0"
> >   DOM0_CMD="console=hvc0 earlycon=xen earlyprintk=xen clk_ignore_unused"
> >   DOM0_RAMDISK="dom0-ramdisk.cpio"
> > @@ -99,9 +99,9 @@ Where:
> >     - PASSTHROUGH_DTS_REPO specifies the git repository and/or the directory
> >     which contains the partial device trees. This is optional. However, if
> > -  this is specified, then XEN_PASSTHROUGH_PATHS need to be specified.
> > +  this is specified, then DOMU_PASSTHROUGH_PATHS[number] need to be
> > specified.
> >     uboot-script-gen will compile the partial device trees which have
> > -  been specified in XEN_PASSTHROUGH_PATHS.
> > +  been specified in DOMU_PASSTHROUGH_PATHS[number].
> >     - DOM0_KERNEL specifies the Dom0 kernel file to load.
> >     For dom0less configurations, the parameter is optional.
> 


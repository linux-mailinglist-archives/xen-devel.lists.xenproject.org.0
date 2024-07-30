Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB922941A43
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 18:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767991.1178699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpv0-0000Kk-De; Tue, 30 Jul 2024 16:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767991.1178699; Tue, 30 Jul 2024 16:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpv0-0000H9-9x; Tue, 30 Jul 2024 16:41:46 +0000
Received: by outflank-mailman (input) for mailman id 767991;
 Tue, 30 Jul 2024 16:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYpuy-0000H0-Ch
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 16:41:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98a4d667-4e92-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 18:41:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F16FECE10CA;
 Tue, 30 Jul 2024 16:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B74CC4AF0C;
 Tue, 30 Jul 2024 16:41:33 +0000 (UTC)
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
X-Inumbo-ID: 98a4d667-4e92-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722357694;
	bh=K1c8SiNmSZPoF32cfEUeisu352p6Y7h9pCU+ay/GViQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MQ0SOcUlXOfoAoggAHkCAjomYx/3hNOTXFq/yfNTZ/Kg20TjBAG2KYQ26GQNjJuzP
	 ctuuI/HytvVf4jmzVPW6wPBd9+PwcWuPVrhqMl7Xr3DJ+rs/HQssIibN/jPUOuoV/t
	 L8GEkRva/CQWDXW1rC5icdhzxAMWhn+unRqs/rmGyq44UNggp/rYuvnuGVr7qt3SHO
	 Ijn+Nh2HFn7WUur20w3by8kD95GqKyGUqbwU9s8WcGJn6NGjOIpagQiMKov0d50jYP
	 HE3GR5y4uJzxhlc2oAmzXYRnuHQ3afk0hRo8htO3WMEcfxhu0lgu20IUszHpfamHJW
	 h/oAPqpc0DSBw==
Date: Tue, 30 Jul 2024 09:41:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com
Subject: Re: [PATCH v2] automation: upgrade Yocto to scarthgap
In-Reply-To: <e9230d77-24f0-42a1-8728-e9d6478a071e@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2407300941090.4857@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2407261639190.4857@ubuntu-linux-20-04-desktop> <ZqjuvjUtmNU7Ud8g@mail-itl> <9be4e130-c202-459d-bd58-d589b72af1c2@citrix.com> <Zqjzn5eM0z0njNF2@mail-itl> <alpine.DEB.2.22.394.2407300851390.4857@ubuntu-linux-20-04-desktop>
 <e9230d77-24f0-42a1-8728-e9d6478a071e@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-444777817-1722357694=:4857"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-444777817-1722357694=:4857
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 30 Jul 2024, Andrew Cooper wrote:
> On 30/07/2024 4:55 pm, Stefano Stabellini wrote:
> > On Tue, 30 Jul 2024, Marek Marczykowski-Górecki wrote:
> >> On Tue, Jul 30, 2024 at 03:01:52PM +0100, Andrew Cooper wrote:
> >>> On 30/07/2024 2:46 pm, Marek Marczykowski-Górecki wrote:
> >>>> On Fri, Jul 26, 2024 at 05:19:42PM -0700, Stefano Stabellini wrote:
> >>>>> Upgrade Yocto to a newer version. Use ext4 as image format for testing
> >>>>> with QEMU on ARM and ARM64 as the default is WIC and it is not available
> >>>>> for our xen-image-minimal target.
> >>>>>
> >>>>> Also update the tar.bz2 filename for the rootfs.
> >>>>>
> >>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >>>> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >>>>
> >>>>> ---
> >>>>>
> >>>>> all yocto tests pass:
> >>>>> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1390081173
> >>> That test ran on gitlab-docker-pug, not qubes-ambrosia, so doesn't
> >>> confirm the fix to the xattr issue.
> >> There is one on ambrosia too:
> >> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7423043016
> > Yes indeed: I tested it in a previous run. The last test I let it run
> > without additional constraints. But as far as I can tell the patch is
> > 100% tested.
> >
> >
> >>> Seeing as I'm going to need to rebuild the container anyway, I'll see
> >>> about forcing this and double checking.
> >> But double-checking is a good idea anyway.
> > I did update the x86, arm64 and arm32 containers. Feel free to rebuild
> > any of them.
> >
> > I'll commit the patch this afternoon if you don't get to it sooner :-)
> 
> Just the x86 container rebuild has been going on for the entirety of the
> MISRA meeting...
> 
> If you've got one to hand already, please deploy it.

I deployed the three yocto containers
--8323329-444777817-1722357694=:4857--


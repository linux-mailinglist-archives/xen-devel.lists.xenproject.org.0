Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4545286A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 04:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226064.390555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmowZ-00008O-OC; Tue, 16 Nov 2021 03:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226064.390555; Tue, 16 Nov 2021 03:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmowZ-00005Z-KL; Tue, 16 Nov 2021 03:15:35 +0000
Received: by outflank-mailman (input) for mailman id 226064;
 Tue, 16 Nov 2021 03:15:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMVQ=QD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mmowY-00005T-AO
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 03:15:34 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73eccd89-468b-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 04:15:31 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A56A61C12;
 Tue, 16 Nov 2021 03:15:29 +0000 (UTC)
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
X-Inumbo-ID: 73eccd89-468b-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637032529;
	bh=5uyM56K9C3JTNnFzlCkzis1xhtvK/qU6Vafr+c5TmAc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KRTYrpXmOePMmv+Ce7MvMiyuZIJ7Dbg6kE4ohqK3HOPH0HuCifLCNiufgGA8HSTkB
	 ih5LK1Ceb4pB43t+26SFXdje/v8W8irf2mDVE4zVz2uGnNVyHOUJZo2AEGk8T4wH62
	 AQV5IoUu/nQTKhcxU7D7kfVYsdglRZ9ZB2gGidJN9gYmoUtKE1gTogNiZhX7zm9x04
	 c+KtzY3BXfnthckPFoxqcglO3Gr/oaRkmK55Mn8jZb6rFGHt2KYdv4asx0GJPcfXH3
	 fH+5mtmIXUdQF8ue2ocnpH685cYdFNtFqm6AMwPPbM/IlAR5zOhIc5ogAa4dtHqKUW
	 aNLr38W6dg3Dg==
Date: Mon, 15 Nov 2021 19:15:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Vikram Garhwal <fnu.vikram@xilinx.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, bertrand.marquis@arm.com, 
    volodymyr_babchuk@epam.com
Subject: Re: [XEN][RFC PATCH v4 1/1] Update libfdt to v1.6.1
In-Reply-To: <57d10284-cbd0-2867-2c09-9f1f7824d938@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111151415020.1412361@ubuntu-linux-20-04-desktop>
References: <1636702040-116895-1-git-send-email-fnu.vikram@xilinx.com> <1636702040-116895-2-git-send-email-fnu.vikram@xilinx.com> <AE30D3B0-0863-465C-AFBC-8DEB28919A8A@arm.com> <alpine.DEB.2.22.394.2111121400280.1412361@ubuntu-linux-20-04-desktop>
 <57d10284-cbd0-2867-2c09-9f1f7824d938@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-810334440-1637014827=:1412361"
Content-ID: <alpine.DEB.2.22.394.2111151420430.1412361@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-810334440-1637014827=:1412361
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2111151420431.1412361@ubuntu-linux-20-04-desktop>

On Mon, 15 Nov 2021, Julien Grall wrote:
> On 12/11/2021 22:01, Stefano Stabellini wrote:
> > On Fri, 12 Nov 2021, Luca Fancellu wrote:
> > > > On 12 Nov 2021, at 07:27, Vikram Garhwal <fnu.vikram@xilinx.com> wrote:
> > > > 
> > > > Update libfdt to v1.6.1 of libfdt taken from
> > > > git://github.com/dgibson/dtc.
> > > > This update is done to support device tree overlays.
> > > > 
> > > > A few minor changes are done to make it compatible with Xen:
> > > >     fdt_overlay.c: overlay_fixup_phandle()
> > > > 
> > > >         Replace strtoul() with simple_strtoul() as strtoul() is not
> > > > available in
> > > >         Xen lib and included lib.h.
> > > > 
> > > >         Change char *endptr to const char *endptr. This change is
> > > > required for
> > > >         using simple_strtoul().
> > > > 
> > > >     libfdt_env.h:
> > > >         Remaining Xen changes to libfdt_env.h carried over from existing
> > > >         libfdt (v1.4.0)
> > > 
> > > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> > > 
> > > I’ve also tested it on FVP and on a Juno board, starting few guests and it
> > > worked.
> > > 
> > > Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> > 
> > Thanks Luca! The patch also passes the gitlab-ci tests and looks OK to
> > me. I'll let Julien ack it as he was the one with a couple of comments
> > before.
> 
> The next version addressed my comments. So:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> I have also queued the patch in a temporary branch for-next/4.17:
> 
> https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/for-next/4.17
> 
> The patch will land in staging when the tree re-opens.

Hey Julien,

Thanks for that!

Do you think it would make sense to keep "for-next/4.17" under
xen-integration [1] so that we can easily trigger gitlab-ci runs on it?

I cannot setup an automatic mirror of your branch on xen-integration
because xen-integration is already mirroring upstream xen.git. For now,
I have just manually pushed:
https://gitlab.com/xen-project/fusa/xen-integration/-/tree/for-next/4.17

Which triggered (all green):
https://gitlab.com/xen-project/fusa/xen-integration/-/pipelines/409417946

FYI you should have full rights to push and make edits on
xen-integration.


[1] https://gitlab.com/xen-project/fusa/xen-integration
--8323329-810334440-1637014827=:1412361--


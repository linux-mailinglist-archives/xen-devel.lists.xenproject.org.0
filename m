Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64B54538FF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 18:57:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226512.391448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn2h8-0007yk-PS; Tue, 16 Nov 2021 17:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226512.391448; Tue, 16 Nov 2021 17:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn2h8-0007xI-LX; Tue, 16 Nov 2021 17:56:34 +0000
Received: by outflank-mailman (input) for mailman id 226512;
 Tue, 16 Nov 2021 17:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMVQ=QD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mn2h7-0007wR-DF
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 17:56:33 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86e5dc52-4706-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 18:56:31 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E216613A3;
 Tue, 16 Nov 2021 17:56:29 +0000 (UTC)
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
X-Inumbo-ID: 86e5dc52-4706-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637085389;
	bh=rkAU9DJ2/oJbdOPHTg4bVICVVdes5dS2MJWP33TRod0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t3+5pOGcewpLd4fXGoqCYueuUo1lvVaU/n7+PVD3V9Drh8R/IZHrzUeXCS5dsUKJB
	 8rKDXIP5yiXewzkpdg81OJeeASIPVIjok5DPr8Byl0sn8h0XlIRynE8WWmeV8NRTLs
	 w1rozpxpltm1azrUDvLZweNAcXr3ImTx4CXr8WbFcSkueA256wPtlxwjq8usL/oLqs
	 FmkLBbqce1vPPFUiO/i4ugeucDVrcHJ7b3XDohBLYoKAyn6inF9edU5M1bblecxBR8
	 BaVrH8muVWCFU3swiW07Wi+EfnM02fdOI+tg8s/+JpHCbNvGvzGaZSQKehq3tuNINg
	 3u2QlzfgWO/Ow==
Date: Tue, 16 Nov 2021 09:56:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Vikram Garhwal <fnu.vikram@xilinx.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, bertrand.marquis@arm.com, 
    volodymyr_babchuk@epam.com
Subject: Re: [XEN][RFC PATCH v4 1/1] Update libfdt to v1.6.1
In-Reply-To: <3fb62abf-5a72-fd70-3130-2505b8b42aad@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111160951150.1412361@ubuntu-linux-20-04-desktop>
References: <1636702040-116895-1-git-send-email-fnu.vikram@xilinx.com> <1636702040-116895-2-git-send-email-fnu.vikram@xilinx.com> <AE30D3B0-0863-465C-AFBC-8DEB28919A8A@arm.com> <alpine.DEB.2.22.394.2111121400280.1412361@ubuntu-linux-20-04-desktop>
 <57d10284-cbd0-2867-2c09-9f1f7824d938@xen.org> <alpine.DEB.2.22.394.2111151415020.1412361@ubuntu-linux-20-04-desktop> <3fb62abf-5a72-fd70-3130-2505b8b42aad@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-654614941-1637085389=:1412361"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-654614941-1637085389=:1412361
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 16 Nov 2021, Julien Grall wrote:
> On 16/11/2021 03:15, Stefano Stabellini wrote:
> > On Mon, 15 Nov 2021, Julien Grall wrote:
> > > On 12/11/2021 22:01, Stefano Stabellini wrote:
> > > > On Fri, 12 Nov 2021, Luca Fancellu wrote:
> > > > > > On 12 Nov 2021, at 07:27, Vikram Garhwal <fnu.vikram@xilinx.com>
> > > > > > wrote:
> > > > > > 
> > > > > > Update libfdt to v1.6.1 of libfdt taken from
> > > > > > git://github.com/dgibson/dtc.
> > > > > > This update is done to support device tree overlays.
> > > > > > 
> > > > > > A few minor changes are done to make it compatible with Xen:
> > > > > >      fdt_overlay.c: overlay_fixup_phandle()
> > > > > > 
> > > > > >          Replace strtoul() with simple_strtoul() as strtoul() is not
> > > > > > available in
> > > > > >          Xen lib and included lib.h.
> > > > > > 
> > > > > >          Change char *endptr to const char *endptr. This change is
> > > > > > required for
> > > > > >          using simple_strtoul().
> > > > > > 
> > > > > >      libfdt_env.h:
> > > > > >          Remaining Xen changes to libfdt_env.h carried over from
> > > > > > existing
> > > > > >          libfdt (v1.4.0)
> > > > > 
> > > > > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> > > > > 
> > > > > I’ve also tested it on FVP and on a Juno board, starting few guests
> > > > > and it
> > > > > worked.
> > > > > 
> > > > > Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> > > > 
> > > > Thanks Luca! The patch also passes the gitlab-ci tests and looks OK to
> > > > me. I'll let Julien ack it as he was the one with a couple of comments
> > > > before.
> > > 
> > > The next version addressed my comments. So:
> > > 
> > > Reviewed-by: Julien Grall <jgrall@amazon.com>
> > > 
> > > I have also queued the patch in a temporary branch for-next/4.17:
> > > 
> > > https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=shortlog;h=refs/heads/for-next/4.17
> > > 
> > > The patch will land in staging when the tree re-opens.
> > 
> > Hey Julien,
> > 
> > Thanks for that!
> > 
> > Do you think it would make sense to keep "for-next/4.17" under
> > xen-integration [1] so that we can easily trigger gitlab-ci runs on it?
> 
> It would be good to have gitlab-ci running on the branch. However...
> 
> > 
> > I cannot setup an automatic mirror of your branch on xen-integration
> > because xen-integration is already mirroring upstream xen.git. For now,
> > I have just manually pushed:
> > https://gitlab.com/xen-project/fusa/xen-integration/-/tree/for-next/4.17
> > 
> > Which triggered (all green):
> > https://gitlab.com/xen-project/fusa/xen-integration/-/pipelines/409417946
> > 
> > FYI you should have full rights to push and make edits on
> > xen-integration.
> 
> ... AFAICT the tree can be edited by non-committers as well. I don't expect
> anyone in the list to mess up with the branch, but part of me would prefer if
> only you and I can modify it.

Yeah, unfortunately I haven't found a way in gitlab UI to explicitly
specify the people that have commit access to a repository. It can be
done at the https://gitlab.com/xen-project level but not for
xen-integration only. 

Unrelated but FYI, I also haven't found a way to let someone just
trigger gitlab-ci runs without also being able to commit to a tree.


> That said, I can push manually to xen-integration to trigger the CI everytime
> we need to update it.

That's good enough I think.
--8323329-654614941-1637085389=:1412361--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E3794160A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 17:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767960.1178669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpCQ-0007Fv-GC; Tue, 30 Jul 2024 15:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767960.1178669; Tue, 30 Jul 2024 15:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYpCQ-0007Cr-DR; Tue, 30 Jul 2024 15:55:42 +0000
Received: by outflank-mailman (input) for mailman id 767960;
 Tue, 30 Jul 2024 15:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYpCP-0007CN-Af
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 15:55:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a561ceb-4e8c-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 17:55:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9854A61FF9;
 Tue, 30 Jul 2024 15:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801B9C32782;
 Tue, 30 Jul 2024 15:55:36 +0000 (UTC)
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
X-Inumbo-ID: 2a561ceb-4e8c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722354937;
	bh=n4C2aHMSzMnnREBkTjbXutmDjlS0h6LYfba/Y+C1zok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ql/CG1sqOr3vNTAwWKWLiZ3cUnNrrSlBE+zdNDxteSYuq1VbiDDsUj4fBzR3OrMj4
	 ZR+NDDsIXXv/M5Rj9ypqWAgPhY730sW7aRFsxkCQoAbFpxh8k4PZP0SGN1t6MFclYN
	 E4uZyfbiBTFCz36BQGXCe+LapyJzalYIvUUHF7Sto/czP6+K1e9erAorAbFCzvgHPL
	 A8kPErBprnWuFTHbUZt3bdM7z9FszK7ETRkrpaCiI5F0JZansONrGjRr0vshWgJrZN
	 hnyjLtyB14leZMripKZPh/kBIgemvIyYR4kzQ69MoLFaxeFL/SF+wpbun8ibKGA0o+
	 UTB5km9lY92Kg==
Date: Tue, 30 Jul 2024 08:55:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com
Subject: Re: [PATCH v2] automation: upgrade Yocto to scarthgap
In-Reply-To: <Zqjzn5eM0z0njNF2@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2407300851390.4857@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2407261639190.4857@ubuntu-linux-20-04-desktop> <ZqjuvjUtmNU7Ud8g@mail-itl> <9be4e130-c202-459d-bd58-d589b72af1c2@citrix.com> <Zqjzn5eM0z0njNF2@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1649060210-1722354791=:4857"
Content-ID: <alpine.DEB.2.22.394.2407300853391.4857@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1649060210-1722354791=:4857
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2407300853392.4857@ubuntu-linux-20-04-desktop>

On Tue, 30 Jul 2024, Marek Marczykowski-Górecki wrote:
> On Tue, Jul 30, 2024 at 03:01:52PM +0100, Andrew Cooper wrote:
> > On 30/07/2024 2:46 pm, Marek Marczykowski-Górecki wrote:
> > > On Fri, Jul 26, 2024 at 05:19:42PM -0700, Stefano Stabellini wrote:
> > >> Upgrade Yocto to a newer version. Use ext4 as image format for testing
> > >> with QEMU on ARM and ARM64 as the default is WIC and it is not available
> > >> for our xen-image-minimal target.
> > >>
> > >> Also update the tar.bz2 filename for the rootfs.
> > >>
> > >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > >
> > >> ---
> > >>
> > >> all yocto tests pass:
> > >> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1390081173
> > 
> > That test ran on gitlab-docker-pug, not qubes-ambrosia, so doesn't
> > confirm the fix to the xattr issue.
> 
> There is one on ambrosia too:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7423043016

Yes indeed: I tested it in a previous run. The last test I let it run
without additional constraints. But as far as I can tell the patch is
100% tested.


> > Seeing as I'm going to need to rebuild the container anyway, I'll see
> > about forcing this and double checking.
> 
> But double-checking is a good idea anyway.

I did update the x86, arm64 and arm32 containers. Feel free to rebuild
any of them.

I'll commit the patch this afternoon if you don't get to it sooner :-)
--8323329-1649060210-1722354791=:4857--


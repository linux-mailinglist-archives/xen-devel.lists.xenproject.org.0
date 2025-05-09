Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4575AB1FD3
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 00:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980433.1366894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDW0F-0000an-GD; Fri, 09 May 2025 22:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980433.1366894; Fri, 09 May 2025 22:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDW0F-0000YG-D9; Fri, 09 May 2025 22:15:35 +0000
Received: by outflank-mailman (input) for mailman id 980433;
 Fri, 09 May 2025 22:15:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDW0D-0000We-MI
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 22:15:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c9a6419-2d23-11f0-9ffb-bf95429c2676;
 Sat, 10 May 2025 00:15:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A85C5C7062;
 Fri,  9 May 2025 22:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9319C4CEE4;
 Fri,  9 May 2025 22:15:25 +0000 (UTC)
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
X-Inumbo-ID: 1c9a6419-2d23-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828926;
	bh=e8kb9IkMVIJV0XkJJnVYKBVSrbE3PE9bH504Cm+jTsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HH5xor1zG86YkbkqAxIoqGrZrqIsS4/nOZHNMUgZaHSgi1guHpMNd0mv/CCezdLwZ
	 uHcWWWeQgeS11ayx1ljxTNFjvxasvrpYHDhDTwlVDX0gMSgSlDLMaVmI+g43FDAurr
	 pHzL8Ja3H3U3pfB+OVpajVees++BwzGMDxkbT5VvoazE6UCDUnsDAnd6+pKruw3dS4
	 8E9Scj1pymGt5ZNOAyclGEgwNYXgHHtoiPv6wMIApj3Kd+GkiW2WMNKDVRByWoFT5S
	 IHjw1ssdTCbFHfNjaWNy5vL1r12OrMfH4fBz65RGrx03SypNaNnKLCWaHvL4rS+64W
	 oGoPUO+CFf7tw==
Date: Fri, 9 May 2025 15:15:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH TEST-ARTEFACTS] Drop legacy jobs
In-Reply-To: <a02eeaca-a007-40e9-83a0-8cf2ad3d2e30@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505091515190.3879245@ubuntu-linux-20-04-desktop>
References: <20250509215123.2953401-1-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2505091508590.3879245@ubuntu-linux-20-04-desktop> <a02eeaca-a007-40e9-83a0-8cf2ad3d2e30@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1820674848-1746828926=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1820674848-1746828926=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 9 May 2025, Andrew Cooper wrote:
> On 09/05/2025 11:10 pm, Stefano Stabellini wrote:
> > On Fri, 9 May 2025, Andrew Cooper wrote:
> >> The CI improvements have been backported to all Xen branches.
> >>
> >> Remove the transitionary tar/cpio parameter in scripts/alpine-rootfs.sh
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Anthony PERARD <anthony.perard@vates.tech>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >> ---
> >>  .gitlab-ci.yml               | 27 +---------------
> >>  scripts/alpine-rootfs.sh     | 23 ++++---------
> >>  scripts/x86_64-argo-linux.sh | 63 ------------------------------------
> >>  3 files changed, 8 insertions(+), 105 deletions(-)
> >>  delete mode 100755 scripts/x86_64-argo-linux.sh
> >>
> >> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> >> index dcf76db6ec62..2e1aad800b95 100644
> >> --- a/.gitlab-ci.yml
> >> +++ b/.gitlab-ci.yml
> >> @@ -52,7 +52,7 @@ linux-6.6.86-arm64:
> >>  alpine-3.18-x86_64-rootfs:
> >>    extends: .x86_64-artifacts
> >>    script:
> >> -    - ./scripts/alpine-rootfs.sh cpio
> >> +    - ./scripts/alpine-rootfs.sh
> >>    variables:
> >>      CONTAINER: alpine:3.18-x86_64-base
> > There is one survivor just above:
> >
> > alpine-3.18-arm64-rootfs:
> >   extends: .arm64-artifacts
> >   script:
> >     - ./scripts/alpine-rootfs.sh cpio
> >   variables:
> >     CONTAINER: alpine:3.18-arm64-base
> >
> >
> > Makes sense to fix it as well?
> 
> Yeah, that wants to be dropped too.  (It happens to be a nop.)
> 
> Fixed up locally.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1820674848-1746828926=:3879245--


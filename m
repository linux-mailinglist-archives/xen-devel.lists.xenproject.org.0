Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A9A698926
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 01:15:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496291.766966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSRvR-00014L-CS; Thu, 16 Feb 2023 00:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496291.766966; Thu, 16 Feb 2023 00:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSRvR-00012d-9M; Thu, 16 Feb 2023 00:15:01 +0000
Received: by outflank-mailman (input) for mailman id 496291;
 Thu, 16 Feb 2023 00:14:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXCi=6M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pSRvP-00012X-Pb
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 00:14:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f18f9394-ad8e-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 01:14:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C56E61DEB;
 Thu, 16 Feb 2023 00:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A08BC433D2;
 Thu, 16 Feb 2023 00:14:55 +0000 (UTC)
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
X-Inumbo-ID: f18f9394-ad8e-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676506495;
	bh=YL6UqIB+dkLUTsHgyQsFUs2HhAbjJocPWSrkbGVoHXc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZjokTIi0zExmlOTtuMfwIPmoZ53Z//8FCODVTL9+EUHVI7f8OP3r0piCgDxhPu8oD
	 E2RLpypRuBfPnFXc5q1C/tGTa6cDrbd2RO26fsQUuMIC+zrEAoL5N1cX/Bp2QyG5Il
	 AzesDPrS9pPzjWgXtQGFzUUAB6Sj87I124/EkCgzPaFlYfQpPEMxCftp/LCdMOqoHF
	 AI7XRpluIERNQBUaMpIzSpxcqHNWJ0l+BKy4LswIDHYOFDgq7cNe5MSaH2HDKSGXeE
	 825AGepSrTV0TuAIwCUY0nyJ1gDRz3Dyi3tX/SVxKSbpJ7380q1QDD6z8aYFYRKHKP
	 I+OUgwY+eok1w==
Date: Wed, 15 Feb 2023 16:14:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 3/4] automation: Remove expired root certificates
 used to be used by let's encrypt
In-Reply-To: <3caee35d-3c0d-7e28-dc66-6f422568edad@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2302151608320.2127160@ubuntu-linux-20-04-desktop>
References: <20230215120208.35807-1-anthony.perard@citrix.com> <20230215120208.35807-4-anthony.perard@citrix.com> <3caee35d-3c0d-7e28-dc66-6f422568edad@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-652203529-1676506495=:2127160"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-652203529-1676506495=:2127160
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 15 Feb 2023, Andrew Cooper wrote:
> On 15/02/2023 12:02 pm, Anthony PERARD wrote:
> > While the Let's Encrypt root certificate ISRG_Root_X1.crt is already
> > present, openssl seems to still check for the root certificate
> > DST_Root_CA_X3.crt which has expired. This prevent https connections.
> >
> > Removing DST_Root_CA_X3 fix the issue.
> >
> > centos: found the filter by looking for "DST Root" in `trust list`.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >  automation/build/centos/7.2.dockerfile         | 5 +++++
> >  automation/build/centos/7.dockerfile           | 5 +++++
> >  automation/build/debian/jessie-i386.dockerfile | 5 +++++
> >  automation/build/debian/jessie.dockerfile      | 5 +++++
> >  automation/build/ubuntu/trusty.dockerfile      | 5 +++++
> >  5 files changed, 25 insertions(+)
> >
> > diff --git a/automation/build/centos/7.2.dockerfile b/automation/build/centos/7.2.dockerfile
> > index 4baa097e31..27244fd002 100644
> > --- a/automation/build/centos/7.2.dockerfile
> > +++ b/automation/build/centos/7.2.dockerfile
> > @@ -50,3 +50,8 @@ RUN rpm --rebuilddb && \
> >          bzip2 \
> >          nasm \
> >      && yum clean all
> > +
> > +# Remove expired certificate that Let's Encrypt certificates used to relie on.
> 
> rely.
> 
> And really (to all of these modifications)?  This seems outragously
> hacky to be deploying into production...
> 
> Honestly, I think I'd prefer to drop all of these legacy versions...

Good timing! It just so happens that we need to shave some of the old
container tests as we have too many build tests on x86 :-)

I would remove Jessie as it reached EOL years ago. Do we really need
both Centos 7 and 7.2? If not, we could remove 7.

That leaves us with Trusty and Centos 7.2 among these. I would be
tempted to keep Trusty and add the sed hack of this patch to make it
work. For Centos 7.2, the hack looks even worse. Would it solve the
problem to upgrade to the latest Centos 7.x subrelease? Is there really
no other way to solve the problem?
--8323329-652203529-1676506495=:2127160--


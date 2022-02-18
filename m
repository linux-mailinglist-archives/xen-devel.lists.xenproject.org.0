Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0804BBD77
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 17:29:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275570.471506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL67C-0007J9-4Y; Fri, 18 Feb 2022 16:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275570.471506; Fri, 18 Feb 2022 16:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL67C-0007Fg-0J; Fri, 18 Feb 2022 16:28:14 +0000
Received: by outflank-mailman (input) for mailman id 275570;
 Fri, 18 Feb 2022 16:28:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/tq=TB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nL67B-0007Fa-6F
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 16:28:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2ea28c8-90d7-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 17:28:11 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C285861F55;
 Fri, 18 Feb 2022 16:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6951C340E9;
 Fri, 18 Feb 2022 16:28:08 +0000 (UTC)
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
X-Inumbo-ID: c2ea28c8-90d7-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645201689;
	bh=tu/rlcE4PGLfIX332wCU3ndCRs3Cg+5vl0zzYUA9bec=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H73x7oyUe+hzzSJMir/3qnUxce5JRG5fNL2ZbaF6+wR8x/zT1Nbk1qvJl41wdFqKE
	 H5AlZVUVCGj2RCfmEBh3hL2Al0WPUPqhiXfe7NtPSmOTPQHVHLlftwr03ugl96iu0C
	 XmVvqxQFRDuy26YZtQWGl65k+oUmQ2msl1YAaO9iXRny/MepkyyG4/pOWio1CTYXS3
	 s6tu+FSA6CAidso92NTMxkFNbiGzSwRZwbtDNerISOLnid79yafefIerD8tlEzryHl
	 /MybXsUsar1wt/nx6nOOnqNvw86xlYw4V5HgnAyBV5RKLVkzGqXYvPpIzdlesNbP4X
	 J+2n3Wyz/yoJA==
Date: Fri, 18 Feb 2022 08:28:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] CI: Add gnu grep to alpine containers
In-Reply-To: <Yg+vmEsWzurilMNy@perard.uk.xensource.com>
Message-ID: <alpine.DEB.2.22.394.2202180826310.239973@ubuntu-linux-20-04-desktop>
References: <20220218131740.30922-1-andrew.cooper3@citrix.com> <Yg+vmEsWzurilMNy@perard.uk.xensource.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-574380469-1645201597=:239973"
Content-ID: <alpine.DEB.2.22.394.2202180827140.239973@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-574380469-1645201597=:239973
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2202180827141.239973@ubuntu-linux-20-04-desktop>

On Fri, 18 Feb 2022, Anthony PERARD wrote:
> On Fri, Feb 18, 2022 at 01:17:40PM +0000, Andrew Cooper wrote:
> > A forthcoming change is going to want more support than busybox's grep can
> > provide.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Doug Goldstein <cardoe@cardoe.com>
> > CC: Wei Liu <wl@xen.org>
> > CC: Anthony PERARD <anthony.perard@citrix.com>
> > CC: Roger Pau Monné <roger.pau@citrix.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Jan Beulich <JBeulich@suse.com>
> > 
> > I've already rebuilt the containers and confirmed that the build is still fine.
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Good for me too. Out of curiousity, what is that is not working with
busybox's grep? Is it regex?
--8323329-574380469-1645201597=:239973--


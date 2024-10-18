Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B49A325F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 04:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821517.1235384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1cIn-0001Xs-3X; Fri, 18 Oct 2024 02:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821517.1235384; Fri, 18 Oct 2024 02:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1cIm-0001Vo-V0; Fri, 18 Oct 2024 02:01:16 +0000
Received: by outflank-mailman (input) for mailman id 821517;
 Fri, 18 Oct 2024 02:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WtqF=RO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t1cIl-00019V-0c
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 02:01:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da43950f-8cf4-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 04:01:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 974055C596B;
 Fri, 18 Oct 2024 02:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171EDC4CEC3;
 Fri, 18 Oct 2024 02:01:11 +0000 (UTC)
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
X-Inumbo-ID: da43950f-8cf4-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729216872;
	bh=IRb4Eps7fyqDJ127qmXjYcblzj8KsfLlIhVHmWFGf5o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HW4vggLNLRtd/3KbdmwUqXpdXUymxKaUM8o5dLWnk3hu8paS5NA0vujuZTca8twEd
	 UuVAmy8ncRT7k1ciq9WftbhI8uedS/Rvi22Q88V110JHKf0/PB2umt6zJZnqAiW+vc
	 BzCQLg1cZnavHppWdnmKmS+VEtPX3YCW8tvpRwx385kXAxohjX92VC3jt5bNh7K4Kb
	 AbNkP/sLXlu9I+ZnemPiW0+ePqJJa4aLfAQy8IxsW35KP83X3R3wr8xJeTBp7z/9HN
	 R4Rsr6qIkHQrfoGoGMzstVPkKLbRySGR9Lcfl88cqWthEgAyd7+LhRw6ZvoYkZ3D3A
	 yjHLBFVeWl+tw==
Date: Thu, 17 Oct 2024 19:01:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 1/3] automation: Fix URL to the gitlab container
 registry documentation
In-Reply-To: <ZxFDN0rRfsg0iNBj@l14>
Message-ID: <alpine.DEB.2.22.394.2410171901020.2416588@ubuntu-linux-20-04-desktop>
References: <cover.1729170005.git.javi.merino@cloud.com> <5ebb776792a345724b43b0843aa41c21febcc843.1729170005.git.javi.merino@cloud.com> <ZxFDN0rRfsg0iNBj@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Oct 2024, Anthony PERARD wrote:
> On Thu, Oct 17, 2024 at 05:20:19PM +0100, Javi Merino wrote:
> > The gitlab documentation is now at
> > https://docs.gitlab.com/ee/administration/packages/container_registry.html
> 
> This link seems to be for self-managed instance of gitlab, but the link
> in the patch looks fine.
> 
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> 
> The patch description could be removed, so:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>


Acked-by: Stefano Stabellini <sstabellini@kernel.org>

 
> > ---
> >  automation/build/README.md | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/automation/build/README.md b/automation/build/README.md
> > index bd0c0e041804..ecc898680c91 100644
> > --- a/automation/build/README.md
> > +++ b/automation/build/README.md
> > @@ -110,7 +110,7 @@ make -C automation/build opensuse/tumbleweed-x86_64 PUSH=1
> >  
> >  [BuildKit]: https://docs.docker.com/build/buildkit/
> >  [registry]: https://gitlab.com/xen-project/xen/container_registry
> > -[registry help]: https://gitlab.com/help/user/project/container_registry
> > +[registry help]: https://docs.gitlab.com/ee/user/packages/container_registry/
> >  
> >  
> >  Building/Running container for a different architecture
> 
> -- 
> 
> Anthony Perard | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 


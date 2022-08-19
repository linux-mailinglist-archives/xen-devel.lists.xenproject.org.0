Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03B259A8D3
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 00:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390539.628058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAs8-0007EZ-5h; Fri, 19 Aug 2022 22:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390539.628058; Fri, 19 Aug 2022 22:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAs8-0007B8-0c; Fri, 19 Aug 2022 22:53:48 +0000
Received: by outflank-mailman (input) for mailman id 390539;
 Fri, 19 Aug 2022 22:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Kg=YX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oPAs6-0007Az-HW
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 22:53:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6de22c0-2011-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 00:53:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C33256182A;
 Fri, 19 Aug 2022 22:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E32C433D6;
 Fri, 19 Aug 2022 22:53:42 +0000 (UTC)
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
X-Inumbo-ID: c6de22c0-2011-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660949623;
	bh=IX9iTtH6CdRCNsZvbtch/A3HX3p7VZ2urzrnqYdaneE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zkyp25MBnqdFDp53s4r+j3FlXXbkf4qP+rTl694ZbNu52LBXU4Y2ypNJa+Ucey/y4
	 uiEW7jZVwzAE6XydQsxF1i4VCOYk81wEcu5f8guV7PoBTQ4s6x7akl/uQ7GhZ01OJn
	 OYV7mustykpqpy2ORZO2asAqophzttqSd7R6RGajr/ejjH/rfc+LnaZo4HEW7DKsZj
	 VqX2q0Wx2Kx6Qn+EnGLndWn4u9S1es7bH8fo2iMhWLXLWzQcYSfGagvUDlzDO/3Jki
	 2pXVTimjlDttsNZEecEc+m9KiwFwrg4N+yYqu4adhGtbPLnBX/LzqQUllVkSKXBmXA
	 Gi8xiv/akB4fw==
Date: Fri, 19 Aug 2022 15:53:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, wl@xen.org, 
    jbeulich@suse.com, george.dunlap@citrix.com, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
Subject: Re: [PATCH v2 3/3] add SPDX to arch/arm/*.c
In-Reply-To: <61b01c8b-1f98-e559-f971-f081a25e0b93@xen.org>
Message-ID: <alpine.DEB.2.22.394.2208191528050.3790@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop> <20220818220320.2538705-3-stefano.stabellini@amd.com> <61b01c8b-1f98-e559-f971-f081a25e0b93@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Julien Grall wrote:
> On 18/08/2022 23:03, Stefano Stabellini wrote:
> > Add SPDX license information to all the *.c files under arch/arm.
> 
> There are some of the files below that didn't have copyright. It would be
> worth explaining in the commit message which license you selected and how.
> AFAICT you assumed they were GPLv2 but I am not sure this is correct at least
> one of them.

My goal is not to change the existing license on any of the files, even
if the existing license is imprecise. By what is written under COPYING,
everything not explicitly listed is GPL-2.0. I only reflected today's
reality. I think it is best if we keep mechanical changes separate from
"smart" changes, especially on a series like this introducing many
mechanical changes.  More on this at the bottom.


> [...]
> 
> > diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> > index f5f6562600..2537dbebc1 100644
> > --- a/xen/arch/arm/decode.c
> > +++ b/xen/arch/arm/decode.c
> > @@ -1,3 +1,4 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> 
> This license is not part of LICENSES. Was it intended?

It is: the tag is described as part of LICENSES/GPL-2.0.


> If yes, this should be mentioned in one of the commit message (possible patch
> #2) and maybe in CONTRIBUTING (to tell user to not use it for new files)
> because one could expect all the LICENSES to be listed.

It could make sense to say that:

/* SPDX-License-Identifier: GPL-2.0 */

is recommended for new files.


> >   /*
> >    * xen/arch/arm/decode.c
> >    *
> > @@ -5,16 +6,6 @@
> >    *
> >    * Julien Grall <julien.grall@linaro.org>
> >    * Copyright (C) 2013 Linaro Limited.
> > - *
> > - * This program is free software; you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License as published by
> > - * the Free Software Foundation; either version 2 of the License, or
> > - * (at your option) any later version.
> > - *
> > - * This program is distributed in the hope that it will be useful,
> > - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > - * GNU General Public License for more details.
> >    */
> >     #include <xen/guest_access.h>
> 
> [...]
> 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 3fd1186b53..b29bdf3aa6 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -1,3 +1,4 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> 
> AFAIU, the assumption is all the files with no copyright are GPLv2. That works
> here. But ...
> 
> >   #include <xen/init.h>
> >   #include <xen/compile.h>
> >   #include <xen/lib.h>
> > diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
> > index 71182575f9..47405e0866 100644
> > --- a/xen/arch/arm/domain_page.c
> > +++ b/xen/arch/arm/domain_page.c
> > @@ -1,3 +1,4 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> 
> .... this file was split from mm.c which is gpl-2.0-or-later. So I don't think
> we can use GPL-2.0 here.

Well spotted! Effectively this file is now declared as GPL 2.0 only,
given what is stated in COPYING. The code in domain_page has lost "or
later" with the loss of the copyright header.

So if there were new contributions to this file after its creation, they
would have been GPL-2.0 only contributions, and it would have been
impossible to go back to GPL-2.0-or-later without asking the copyright
owners of the new changes.

In this case thankfully there are no new contributions since the split
of the file, so I can fix it by using the SPDX GPL-2.0-or-later tag
without problems. I'll do it in the next version of the series.

Xen is not saying: "if there is no copyright header it might be GPLv2
but you need to look it up". Xen is actively saying: "if there is no
copyright header it is GPLv2". Not up for discussion. Given that as a
whole Xen is GPLv2, the only possibility is that the file without a
copyright header used to be:
- GPLv2 or later
- dual license GPL and another compatible license (e.g. BSD)

Either way, with the loss of the copyright header, the file becomes
immediately GPLv2 only.

Does it make sense?

This is why I think it is best to keep copyright discussions out of the
SPDX patches review and limit ourselves to mechanical changes.


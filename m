Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A9A53487E
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 03:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337424.562021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu2l1-0002ml-Jr; Thu, 26 May 2022 01:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337424.562021; Thu, 26 May 2022 01:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu2l1-0002k3-Fn; Thu, 26 May 2022 01:57:47 +0000
Received: by outflank-mailman (input) for mailman id 337424;
 Thu, 26 May 2022 01:57:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nu2kz-0002jx-UG
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 01:57:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3afef0c3-dc97-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 03:57:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 581A161830;
 Thu, 26 May 2022 01:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC77C34113;
 Thu, 26 May 2022 01:57:41 +0000 (UTC)
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
X-Inumbo-ID: 3afef0c3-dc97-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653530261;
	bh=noBuLfnEfqstfqk1d/Cax29+AR4MGTO/yzggDEsvn7Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JiciWRWHflBIBbfVY7iqKRsP3LNAwqXupCitTvkfPurnzq1wnujB7GMUwTs0xoDJn
	 6X7J0/yja/ChfdaLlNKh8gyeOruBnZCNOFRU4aWZLfCfDj4YJncl8iRmwvEUub0q3U
	 yq4W/dhI+2GJeHDHQ3yAEjMwGfBkM6RfSvmTIi9eu/cc5HAgVCJVWTHBupKaRymXHD
	 QxGGgOR7bOTLP8NB7mwjZ2BdvsGPzFzNJukNburrogXtHuauqFS0NWwbYEb09MqTwM
	 0yLLecC/suwmjtMcpOsNZvN/TvEhXSqzR94mcl+cPnLaeHpyV+v87QlsRczFH55/41
	 PFSbPmAy5Xu6Q==
Date: Wed, 25 May 2022 18:57:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    Roger Pau Monne <roger.pau@citrix.com>, "julien@xen.org" <julien@xen.org>, 
    "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
In-Reply-To: <eec293b7-f6a9-181a-5674-9081f83667ea@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2205251823090.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop> <20220525003505.304617-1-sstabellini@kernel.org> <eec293b7-f6a9-181a-5674-9081f83667ea@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-914675212-1653528626=:1905099"
Content-ID: <alpine.DEB.2.22.394.2205251830310.1905099@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-914675212-1653528626=:1905099
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2205251830311.1905099@ubuntu-linux-20-04-desktop>

On Wed, 25 May 2022, Andrew Cooper wrote:
> On 25/05/2022 01:35, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >
> > Introduce a list of MISRA C rules that apply to the Xen hypervisor. The
> > list is in RST format.
> >
> > Add a mention of the new list to CODING_STYLE.
> >
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Some comments on syntax/layout, unrelated to the specific content.
> 
> You can check the rendered content with either `make -C docs
> sphinx-html` locally, or by pointing readthedocs at your repo.  (e.g.
> https://andrewcoop-xen.readthedocs.io/en/docs-devel/ is a very out of
> date WIP branch of some in-development content.)

Thanks I did that and I can see that the layout needs a lot of
improvements.


> Whatever gets committed will be rendered at
> https://xenbits.xen.org/docs/latest/ once the cronjob catches up.
> 
> > ---
> >  CODING_STYLE         |  6 ++++
> >  docs/misra/rules.rst | 65 ++++++++++++++++++++++++++++++++++++++++++++
> 
> At minimum there needs to be an addition to a toctree directive in on of
> the existing index.rst's
> 
> But  this looks like it ought to be part of the hypervisor guide ?

I would keep the actual MISRA files in their own top-level directory
under docs/ but we can certainly link to them from docs/index.rst or
from hypervisor guide. What about the following added to docs/index.rst:

MISRA C coding guidelines
-------------------------

MISRA C rules and directive to be used as coding guidelines when writing
Xen hypervisor code.

.. toctree::
   :maxdepth: 2

   misra/rules



> >  2 files changed, 71 insertions(+)
> >  create mode 100644 docs/misra/rules.rst
> >
> > diff --git a/CODING_STYLE b/CODING_STYLE
> > index 9f50d9cec4..1ef35ee8d0 100644
> > --- a/CODING_STYLE
> > +++ b/CODING_STYLE
> > @@ -235,3 +235,9 @@ callstack between the initial function call and the failure, no error
> >  is returned.  Using domain_crash() requires careful inspection and
> >  documentation of the code to make sure all callers at the stack handle
> >  a newly-dead domain gracefully.
> > +
> > +MISRA C
> > +-------
> > +
> > +The Xen Project hypervisor follows the MISRA C coding rules and
> > +directives listed under docs/misra/rules.rst.
> 
> I think this would be clearer to follow as:
> 
> "The Xen Hypervisor follows some MISRA C coding rules.  See ... for
> details."
> 
> because otherwise there is an implication that we follow all rules. 
> Also, "Xen Project" might be the name of our legal entity name, but the
> hypervisor's name is Xen, not "Xen Project".

Yep, I can do that


> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > new file mode 100644
> > index 0000000000..c0ee58ab25
> > --- /dev/null
> > +++ b/docs/misra/rules.rst
> > @@ -0,0 +1,65 @@
> 
> All Sphinx content needs to be
> 
> .. SPDX-License-Identifier: CC-BY-4.0
> 
> so it specifically can be vendored/tailored by downstream entities.
> 
> > +=====================
> > +MISRA C rules for Xen
> > +=====================
> 
> And the prevailing style is without the === overline.
> 
> > +
> > +**IMPORTANT** All MISRA C rules, text, and examples are copyrighted by the
> > +MISRA Consortium Limited and used with permission.
> > +
> > +Please refer to https://www.misra.org.uk/ to obtain a copy of MISRA C, or for
> > +licensing options for other use of the rules.
> 
> .. note::
> 
> and then with the two paragraphs indented to be a part of the note block.
> 
> > +
> > +The following is the list of MISRA C rules that apply to the Xen Project
> > +hypervisor.
> > +
> > +- Rule: Dir 2.1
> > +  - Severity:  Required
> > +  - Summary:  All source files shall compile without any compilation errors
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c
> 
> This wants to be .. list-table::  See
> docs/guest-guide/x86/hypercall-abi.rst for an example.

Ah yes, thank you



> Also, the URL wants to use the ext-links plugin.  See
> https://lore.kernel.org/xen-devel/20191003205623.20839-4-andrew.cooper3@citrix.com/

It looks like that patch didn't make it upstream? But I can just use the
following format and it works with make -C docs sphinx-html:


   * - `Dir 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c>`_
     - Required
     - All source files shall compile without any compilation errors
     -

the format is `description <link>`_
--8323329-914675212-1653528626=:1905099--


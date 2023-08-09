Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0E774FF2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 02:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580617.908960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTXIg-0003vz-Gc; Wed, 09 Aug 2023 00:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580617.908960; Wed, 09 Aug 2023 00:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTXIg-0003tU-Dn; Wed, 09 Aug 2023 00:43:46 +0000
Received: by outflank-mailman (input) for mailman id 580617;
 Wed, 09 Aug 2023 00:43:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTXIf-0003tO-OG
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 00:43:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9c7b0d6-364d-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 02:43:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 608DA62E77;
 Wed,  9 Aug 2023 00:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8C4C433C8;
 Wed,  9 Aug 2023 00:43:39 +0000 (UTC)
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
X-Inumbo-ID: c9c7b0d6-364d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691541820;
	bh=oVABKR76DoWqzsGRz1snuwY40T+DoDY/s5F1RUNNCuY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MszJN5RH230+Ij2IPlb0zpY1xRocUEdH8HvMm7s09CqV9JeHyQZ0FAgZF92gn9PSL
	 8BIhpRN6W7rXtkb4aa3uNOIDzh9/b0jW7M7qQkMFUiD1SVTJoNBNuGWjM7HPCTIZWb
	 oFU3tzUI3hIvuFyncNMnNwIAALf3yl/SZpwFj+Tx5NmT+win9/97s0q/8cv2IDVgLl
	 gVhRNytjOM5Rp7afgDEpx4hQtv0LEkiooSfDKoV7OtOhU6b9vwMYQ+5UkzhWImCfbV
	 YXaZZbcpnqc9Mjln0Me7vGz9TsntjkAtXoGWsaBAdCbYoW8oZKHx7BWRRz3GgANq56
	 ydu4+aSbgAp9A==
Date: Tue, 8 Aug 2023 17:43:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
In-Reply-To: <bdbf125d-b772-404b-e2d1-79d40090a100@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308081640190.2127516@ubuntu-linux-20-04-desktop>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com> <20230803104438.24720-2-dpsmith@apertussolutions.com> <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com> <65e62111-7997-de4d-cf12-15d89ec87471@apertussolutions.com>
 <alpine.DEB.2.22.394.2308031620160.2127516@ubuntu-linux-20-04-desktop> <bdbf125d-b772-404b-e2d1-79d40090a100@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Daniel P. Smith wrote:
> On 8/3/23 19:38, Stefano Stabellini wrote:
> > On Thu, 3 Aug 2023, Daniel P. Smith wrote:
> > > > Also, what is the plan for the existing dom0less dt properties?
> > > > Will they need to be moved to new /hypervisor node or we will have to
> > > > parse
> > > > both /chosen and /hypervisor nodes?
> > > 
> > > In the proposal I sent to xen-devel in response to Luca's RFC for
> > > rebranding
> > > dom0less features under hyperlaunch, that is the purpose of this commit.
> > > Get
> > > this document up to date with what was done in v1 along with what we are
> > > planning/working on for hyperlaunch. One could think of this as
> > > effectively
> > > the API to the capabilities hyperlaunch will provide. Not just how to
> > > construct a domain, but what kinds of domains can be constructed by
> > > hyperlaunch. Step one of the proposal is to publish a patch upon which we
> > > all
> > > can iterate over and get to an agreement on a suitable interface for all.
> > > The
> > > next step would be the introduction of hyperlaunch dom0less compatibility
> > > mode, that would see the moving of the parsing logic for the existing
> > > dom0less
> > > nodes under /xen/common/domain-builder. It would continue to exist there
> > > even
> > > after hyperlaunch proper is merged and can remain there for backward
> > > compatibility until there is a decision to retire the compatibility
> > > interface.
> > 
> > I like this plan. The two interfaces are so similar that it is basically
> > one interface with a couple of tiny differences.
> > 
> > So I expect we would move the existing dom0less parsing code to common/,
> > add a couple of extensions (such as parsing /hypervisor in addition to
> > /chosen) and use it as it.
> 
> Do you mean /chosen/hypervisor?

I meant /hypervisor as in "the node under which the hyperlaunch
configuration is presented". If HyperLaunch uses /chosen/hypervisor,
then that's what I meant :-)


> > Later on, after a few years of using /hypervisor instead of /chosen, if
> > nobody is using /chosen anymore, we could retire /chosen completely. But
> > this is just one DT node/property that gets retired (there are a couple
> > of others). I don't imagine we'll have a full new implementation of the
> > DT parsing logic that supersedes the existing implementation of it
> > (especially considering the difficulty of maintaining 2 different parsing
> > logics in the hypervisor for similar interfaces).
> 
> +1
> 
> > Same thing for the DT interface documentation. I don't think we need two
> > DT interface docs? We could start with the existing dom0less interface
> > (docs/misc/arm/device-tree/booting.txt), and move it somewhere common
> > like docs/misc/device-tree.
> 
> So in the plan that I sent, patch series 3 was were I was going to consolidate
> docs/design/launch/hyperlaunch-devicetree.rst and
> docs/misc/arm/device-tree/booting.txt into a single document under
> docs/features/hyperlaunch/device-tree.rst along with moving
> docs/features/dom0less.pandoc to
> docs/features/hyperlaunch/dom0less-compatibility-mode.pandoc. The thinking
> here was to get all the feature documentation together in a single place, but
> I would be open to putting the suggested consolidated device-tree.rst
> mentioned above into docs/misc/device-tree/hyperlaunch.rst if that is
> preferred.

Yes I think we should have a single consolidated document, because it is
not a good idea to support very similar but subtly different interfaces
on ARM/x86. docs/misc/device-tree/hyperlaunch.rst should work fine.

And I think we should try to minimize differences and have a single
common parsing code.

Any role definition introduced by hyperlaunch originally for x86 would
undoubtedly be useful on ARM. Conversely, all the existing ARM dom0less
tools (ImageBuilder) might be useful on x86 too. RISC-V might use it too
in the near future.


> > Then add any changes or extensions required by other architecture, such
> > as x86 and RISC-V.
> > 
> > For sure for x86 we need "module-index". I don't know if anything else
> > is must-have to get it to work on x86 but if there is, we should add
> > those too.
> 
> Hmm good point, since in the suggested patch series 3 from the plan, this
> probably should get cropped down to what we actually have implemented for x86
> hyperlaunch and then get expanded as it becomes feature complete.

Yes exactly. So I think the best way to move forward is something along
these lines:
a) work on a single arch-neutral hyperlaunch/dom0less DT interface
   document for ARM/x86/RISC-V
b) in parallel, move dom0less parsing code to common (AMD might be able
   to work on this, to be confirmed)
c) add x86 features as needed to the code and to the interface doc,
   "module-index" would probably be among the first ones
d) as we add more features, we expand the hyperlaunch/dom0less DT
   interface document


I think a) only really needs the smallest amount of changes to make it
work on non-ARM architectures


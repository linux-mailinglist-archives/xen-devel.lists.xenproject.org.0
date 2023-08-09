Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ABB774FF1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 02:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580618.908970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTXIn-0004DU-OP; Wed, 09 Aug 2023 00:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580618.908970; Wed, 09 Aug 2023 00:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTXIn-0004Ar-Ko; Wed, 09 Aug 2023 00:43:53 +0000
Received: by outflank-mailman (input) for mailman id 580618;
 Wed, 09 Aug 2023 00:43:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTXIm-0004AJ-Me
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 00:43:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce663524-364d-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 02:43:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BCC262E76;
 Wed,  9 Aug 2023 00:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B89C433C7;
 Wed,  9 Aug 2023 00:43:47 +0000 (UTC)
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
X-Inumbo-ID: ce663524-364d-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691541828;
	bh=eG7pqWOuk/Rfgfwp5QpRzBlLDZJCfn0qFLVG7dJSE8w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GbpR13/9PJ1OaBNjBiTIczndcpTnEQhfo3B9lBcQqGICDp/2BH0UhCT5Z59ObXUIx
	 SyF2q/KPx0X45DEfMTR5cVwK56u456T3CPTD373vZTIFGBNMs2Ec/u8QM0fWSVZMRC
	 yYLbdCX03n78zOA8M7Q2Sko9qgQMnAovsg2j47dK8YjmOWDFeb43t66hbkGbG4C7dg
	 59u8Z6F5UXOhMi5x+101Vj2OB1CpqDXxBWzdyD382XFPx4g1lbJ3s5K35ni1TYsp2Z
	 n7mpPcoFl1jXSYw0GP4f6jRxbs6thOnPBm8N1/loYdSagLGywJGSjBLmHqTmFS3gnN
	 rP184+0U/P/sw==
Date: Tue, 8 Aug 2023 17:43:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
In-Reply-To: <fc91ad7b-df94-a1ec-abe1-9472337024b6@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308081652280.2127516@ubuntu-linux-20-04-desktop>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com> <20230803104438.24720-2-dpsmith@apertussolutions.com> <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com> <65e62111-7997-de4d-cf12-15d89ec87471@apertussolutions.com>
 <alpine.DEB.2.22.394.2308031620160.2127516@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2308031709070.2127516@ubuntu-linux-20-04-desktop> <fc91ad7b-df94-a1ec-abe1-9472337024b6@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Daniel P. Smith wrote:
> On 8/3/23 20:09, Stefano Stabellini wrote:
> > On Thu, 3 Aug 2023, Stefano Stabellini wrote:
> > > On Thu, 3 Aug 2023, Daniel P. Smith wrote:
> > > > > Also, what is the plan for the existing dom0less dt properties?
> > > > > Will they need to be moved to new /hypervisor node or we will have to
> > > > > parse
> > > > > both /chosen and /hypervisor nodes?
> > > > 
> > > > In the proposal I sent to xen-devel in response to Luca's RFC for
> > > > rebranding
> > > > dom0less features under hyperlaunch, that is the purpose of this commit.
> > > > Get
> > > > this document up to date with what was done in v1 along with what we are
> > > > planning/working on for hyperlaunch. One could think of this as
> > > > effectively
> > > > the API to the capabilities hyperlaunch will provide. Not just how to
> > > > construct a domain, but what kinds of domains can be constructed by
> > > > hyperlaunch. Step one of the proposal is to publish a patch upon which
> > > > we all
> > > > can iterate over and get to an agreement on a suitable interface for
> > > > all. The
> > > > next step would be the introduction of hyperlaunch dom0less
> > > > compatibility
> > > > mode, that would see the moving of the parsing logic for the existing
> > > > dom0less
> > > > nodes under /xen/common/domain-builder. It would continue to exist there
> > > > even
> > > > after hyperlaunch proper is merged and can remain there for backward
> > > > compatibility until there is a decision to retire the compatibility
> > > > interface.
> > > 
> > > I like this plan. The two interfaces are so similar that it is basically
> > > one interface with a couple of tiny differences.
> > > 
> > > So I expect we would move the existing dom0less parsing code to common/,
> > > add a couple of extensions (such as parsing /hypervisor in addition to
> > > /chosen) and use it as it.
> > > 
> > > Later on, after a few years of using /hypervisor instead of /chosen, if
> > > nobody is using /chosen anymore, we could retire /chosen completely. But
> > > this is just one DT node/property that gets retired (there are a couple
> > > of others). I don't imagine we'll have a full new implementation of the
> > > DT parsing logic that supersedes the existing implementation of it
> > > (especially considering the difficulty of maintaining 2 different parsing
> > > logics in the hypervisor for similar interfaces).
> > > 
> > > Same thing for the DT interface documentation. I don't think we need two
> > > DT interface docs? We could start with the existing dom0less interface
> > > (docs/misc/arm/device-tree/booting.txt), and move it somewhere common
> > > like docs/misc/device-tree.
> > > 
> > > Then add any changes or extensions required by other architecture, such
> > > as x86 and RISC-V.
> > > 
> > > For sure for x86 we need "module-index". I don't know if anything else
> > > is must-have to get it to work on x86 but if there is, we should add
> > > those too.
> > 
> > 
> > For clarity, I think we should definitely have
> > docs/design/launch/hyperlaunch.rst, and maybe we should also have
> > hyperlaunch-devicetree.rst as an overview description and user guide.
> > That's useful.
> > 
> > But in terms of official device tree bindings interface description
> > (basically what in Linux would go under
> > Documentation/devicetree/bindings/), I think it would be best to only
> > have a single document. The current one is
> > docs/misc/arm/device-tree/booting.txt.
> 
> Does the proposal to your first message align with your follow-up here?

You are referring to a common docs/misc/device-tree/hyperlaunch.rst,
right? Then yes.


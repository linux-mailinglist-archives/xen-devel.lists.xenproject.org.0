Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6177076F663
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 02:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576657.903029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRiNl-0007l1-Ra; Fri, 04 Aug 2023 00:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576657.903029; Fri, 04 Aug 2023 00:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRiNl-0007iJ-OO; Fri, 04 Aug 2023 00:09:29 +0000
Received: by outflank-mailman (input) for mailman id 576657;
 Fri, 04 Aug 2023 00:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRiNk-0007iC-NX
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 00:09:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bab1b06-325b-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 02:09:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D98B61EF2;
 Fri,  4 Aug 2023 00:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0C3C433C8;
 Fri,  4 Aug 2023 00:09:22 +0000 (UTC)
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
X-Inumbo-ID: 2bab1b06-325b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691107763;
	bh=KsskHdlsOakz1lNpgxVEJJ+yy4KW2vSLGBoEznyVgDU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f1M24UJdRvENNOAeV1T3ssJE81ggMsECHyHG/oW+BlC6GvGlFRVQ/oM2Pk4f75kDl
	 80UzLvhv8Kh1xawiJ3cA+PDB1DbOCN0o/g0auuRwIzr9u6hrEux+n48lTf/u5cJ/tq
	 uJl0KTteU9g3i35R1zoo7xmSFu90tOc/k4fMbHxTXWeFpFdBjphx9aNY7KQnU6mFQx
	 W3i42NcHGpOcURALTPvYviDdkXUAwPyufR1kS3RIvYtyX/nECeyUJGRGgHs1ZLsVRf
	 zrRzHMJs6n8LrUUm4MO+71t009Obz3/+Vr5LzkgPc1F0aDuzOYJSeg39zAuYS140ku
	 eIa+SxOicTGxA==
Date: Thu, 3 Aug 2023 17:09:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
In-Reply-To: <alpine.DEB.2.22.394.2308031620160.2127516@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2308031709070.2127516@ubuntu-linux-20-04-desktop>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com> <20230803104438.24720-2-dpsmith@apertussolutions.com> <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com> <65e62111-7997-de4d-cf12-15d89ec87471@apertussolutions.com>
 <alpine.DEB.2.22.394.2308031620160.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Daniel P. Smith wrote:
> > > Also, what is the plan for the existing dom0less dt properties?
> > > Will they need to be moved to new /hypervisor node or we will have to parse
> > > both /chosen and /hypervisor nodes?
> > 
> > In the proposal I sent to xen-devel in response to Luca's RFC for rebranding
> > dom0less features under hyperlaunch, that is the purpose of this commit. Get
> > this document up to date with what was done in v1 along with what we are
> > planning/working on for hyperlaunch. One could think of this as effectively
> > the API to the capabilities hyperlaunch will provide. Not just how to
> > construct a domain, but what kinds of domains can be constructed by
> > hyperlaunch. Step one of the proposal is to publish a patch upon which we all
> > can iterate over and get to an agreement on a suitable interface for all. The
> > next step would be the introduction of hyperlaunch dom0less compatibility
> > mode, that would see the moving of the parsing logic for the existing dom0less
> > nodes under /xen/common/domain-builder. It would continue to exist there even
> > after hyperlaunch proper is merged and can remain there for backward
> > compatibility until there is a decision to retire the compatibility interface.
> 
> I like this plan. The two interfaces are so similar that it is basically
> one interface with a couple of tiny differences.
> 
> So I expect we would move the existing dom0less parsing code to common/,
> add a couple of extensions (such as parsing /hypervisor in addition to
> /chosen) and use it as it.
> 
> Later on, after a few years of using /hypervisor instead of /chosen, if
> nobody is using /chosen anymore, we could retire /chosen completely. But
> this is just one DT node/property that gets retired (there are a couple
> of others). I don't imagine we'll have a full new implementation of the
> DT parsing logic that supersedes the existing implementation of it
> (especially considering the difficulty of maintaining 2 different parsing
> logics in the hypervisor for similar interfaces).
> 
> Same thing for the DT interface documentation. I don't think we need two
> DT interface docs? We could start with the existing dom0less interface
> (docs/misc/arm/device-tree/booting.txt), and move it somewhere common
> like docs/misc/device-tree.
> 
> Then add any changes or extensions required by other architecture, such
> as x86 and RISC-V.
> 
> For sure for x86 we need "module-index". I don't know if anything else
> is must-have to get it to work on x86 but if there is, we should add
> those too.


For clarity, I think we should definitely have
docs/design/launch/hyperlaunch.rst, and maybe we should also have
hyperlaunch-devicetree.rst as an overview description and user guide.
That's useful.

But in terms of official device tree bindings interface description
(basically what in Linux would go under
Documentation/devicetree/bindings/), I think it would be best to only
have a single document. The current one is
docs/misc/arm/device-tree/booting.txt.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418E774FFD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 02:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580633.908991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTXK7-0005bW-GB; Wed, 09 Aug 2023 00:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580633.908991; Wed, 09 Aug 2023 00:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTXK7-0005ZR-Cr; Wed, 09 Aug 2023 00:45:15 +0000
Received: by outflank-mailman (input) for mailman id 580633;
 Wed, 09 Aug 2023 00:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTXK5-0003tO-O7
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 00:45:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id feb17dce-364d-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 02:45:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92715621E5;
 Wed,  9 Aug 2023 00:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1B0C433C8;
 Wed,  9 Aug 2023 00:45:08 +0000 (UTC)
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
X-Inumbo-ID: feb17dce-364d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691541910;
	bh=Mnkd2lJGxIDT+8evqkZP6daLEcD0abcyJwr+5/uqVg0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=K6ITTMi0PDiSS0e0r8RtzRLyvG2AzWAkENpL4+TrukpQoJ5nQYVOwemdFJ07q1EOJ
	 lg7o2IpCfEvOv98o5Aa6G6Qy48CvjC/fLOrKJnhC5JlTQYac8ssPxPJyPU/AoGyE+H
	 roBjqgOUXEojUm9C0kyMADysrTfdK+P2fs2Pr8rqz4by328gA8ePa9yqvc3+gh+DHB
	 QHN21dVnuDTVGIFgEqS+jqrlIl4pdqbqaYTPgBQ8k+ekNC1v9F64G+/Pvjni+gJI+P
	 IcxlBR/wDcoLTw6bXgRvWnUCowXQ1jNud2R4YVCf/U8uGRyzFxxtNQw14KnFDYYwPr
	 6qWpIDdNxyKfA==
Date: Tue, 8 Aug 2023 17:45:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
In-Reply-To: <c692fa5e-e2c4-6779-1fa6-172f11b51e30@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308081720530.2127516@ubuntu-linux-20-04-desktop>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com> <20230803104438.24720-2-dpsmith@apertussolutions.com> <cec087cd-7ac7-5680-b931-feabe7aef261@amd.com> <65e62111-7997-de4d-cf12-15d89ec87471@apertussolutions.com> <2a72cbf1-a9d7-6edf-37f6-5197c9d40452@amd.com>
 <c692fa5e-e2c4-6779-1fa6-172f11b51e30@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Daniel P. Smith wrote:
> On 8/4/23 03:06, Michal Orzel wrote:
> > Hi Daniel,
> > 
> > On 03/08/2023 18:57, Daniel P. Smith wrote:
> > > 
> > > 
> > > On 8/3/23 07:45, Michal Orzel wrote:
> > > > Hi Daniel,
> > > > 
> > > > On 03/08/2023 12:44, Daniel P. Smith wrote:
> > > > > 
> > > > > 
> > > > > With on going development of hyperlaunch, changes to the device tree
> > > > > definitions
> > > > > has been necessary. This commit updates the specification for all
> > > > > current changes
> > > > > along with changes expected to be made in finalizing the capability.
> > > > > 
> > > > > This commit also adds a HYPERLAUNCH section to the MAINTAINERS file
> > > > > and places
> > > > > this documentation under its purview. It also reserves the path
> > > > > `xen/common/domain-builder` for the hyperlaunch domain builder code
> > > > > base.
> > > > > 
> > > > > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > 
> > [...]
> > > > > +
> > > > >    memory
> > > > > -  The amount of memory to assign to the domain, in KBs.
> > > > > +  The amount of memory to assign to the domain, in KBs. This field
> > > > > uses a DTB
> > > > > +  Reg which contains a start and size. For memory allocation start
> > > > > may or may
> > > > > +  not have significance but size will always be used for the amount
> > > > > of memory
> > > > >      Required.
> > > > > 
> > > > > +  Format: String  min:<sz> | max:<sz> | <sz>, e.g. "256M"
> > > > There is a mismatch between the description and above format:
> > > > - KB vs MB
> > > > - string vs reg format
> > > > - the x86 example uses string and Arm uses reg format
> > > 
> > > Hmmm. I missed this in the hyperlaunch v1 update. In the original design
> > > that came from the working group it was going to use a reg as suggest by
> > > dom0less. During development of v1, we found it was not rich enough to
> > > express how Dom0 could be allocated memory and switched to a string to
> > > mirror the dom0 memory hypervisor command line parameter.
> > On Arm, dom0_mem cmdline parameter is used to specify only size (no min,max)
> 
> I understand. For general domain construction, these are legitimate values and
> hyperlaunch is meant to be able to fully construct a running environment just
> as if it was constructed by a toolstack.

This is a good goal to have.


> We must also be able to handle
> situations where a general configuration is being reused across systems and
> must be able to express the minimum memory each domain must have, how much
> should be attempted to be allocated, and if ballooning is enabled, being able
> to articulate that to the hyperlaunch domain builder.

I agree and most of those can already be specified in dom0less. The
minimum/maximum memory amounts are an exception.


> I did not say this in reply to Julien, but I am not opposed to three separate
> parameters if that is what the conscience arrives at. I found the existing
> parser and the structure it creates as a useful and reusable component for
> obtaining and storing the values.

Yes, if they are required we just need to agree on a format to specify
minimum/maximum. We have options.


> > > A question for those involved with dom0less, is what are the opinions
> > > about using this form for memory allocation. Is it required/possible to
> > > be able to instruct the hypervisor what physical address to use as the
> > > start of a domain's memory?
> > "memory" dt property is used to specify just amount of memory for domain in
> > KBs using reg format.
> > It is not used to specify the static memory region (with start and size).
> > For that, we have another property called "xen,static-mem".
> > Therefore, it would be possible to switch memory to string but it would not
> > be compatible with the current use anymore.
> 
> It would be compatible in the sense that dom0less-compatibility-mode could
> still accept it as just amount of memory. Which brings up a good point,
> whether I do it here or it is done in the patch series that will introduce
> dom0less-compatibilty-mode, there probably will need to be a top level flag
> under the hypervisor node to indicate it is a dom0less compatible
> configuration.

I don't think is a good idea to have a dom0less-compatibility-mode. I
think we should have a single interface between dom0less and
hyperlaunch. I think we should start with the existing dom0less
interface and add anything missing (e.g.  module-index, min/max).


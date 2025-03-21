Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ADDA6C52D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 22:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924482.1327650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvjwa-0003BT-RO; Fri, 21 Mar 2025 21:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924482.1327650; Fri, 21 Mar 2025 21:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvjwa-00038N-OY; Fri, 21 Mar 2025 21:30:20 +0000
Received: by outflank-mailman (input) for mailman id 924482;
 Fri, 21 Mar 2025 21:30:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tvjwY-00038H-TZ
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 21:30:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ade95860-069b-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 22:30:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DAC845C60F9;
 Fri, 21 Mar 2025 21:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64694C4CEE3;
 Fri, 21 Mar 2025 21:30:13 +0000 (UTC)
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
X-Inumbo-ID: ade95860-069b-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742592614;
	bh=tJgY9P75t6In3qTqoWRUAmb9g3c291mpcCz/c3f8oBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qThT3BxTMuO5uRF1AwnJ6ZKuVFT+m0u4qmR+Wh3tN4PNIqTY9PlJ6xtqrQzv/ZbKC
	 ezBaBfwlHfvSFNpAoWY3gfxmUq2Hj8ZlqUyTmYIOTO1IZ3AZ1hqpr2yhBFkF4/YnpG
	 R50ovDg/Ud7rhGV+5zqWawDkxVXSpzhDRprbtwXCwV9YhhxaX7EE30hASBVU9Aqhwv
	 Wg8Rr4I1/g3K41FwcjEWmP4wWpeMs785swFroJRhjWIo5plW4rZLTIpp5uDnh6TwkE
	 +dnirFusfLKChjFkaayn3aHJgYpe0Tf2LInJu8kHPmGg1SG/co0LTVOsre3E1uXcnE
	 j0I+TVUo5Jnyw==
Date: Fri, 21 Mar 2025 14:30:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: add kconfig for event_fifo
In-Reply-To: <646ad800-c01d-4971-ad89-842745a21f2f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503211425250.2325679@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2503181637100.2000798@ubuntu-linux-20-04-desktop> <646ad800-c01d-4971-ad89-842745a21f2f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Mar 2025, Jan Beulich wrote:
> On 19.03.2025 00:40, Stefano Stabellini wrote:
> > Evtchn fifos are not needed on smaller systems; the older interface is
> > lightweight and sufficient. Make it possible to disable evtchn fifo.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Let me ask a more general question, before considering whether to ack:
> When kconfig was introduced into Xen, the expectation was (iirc) that
> we wouldn't grow its use to the fine grained granularity that it has
> been having in Linux. The more build-time controls we have, the harder
> it is to know whether a certain piece of code was actually included in
> a build someone, say, reports a problem with. Are we knowingly moving
> away from that earlier position? evtchn_fifo.c isn't actually that
> much code to exclude, after all ...


I think we need to be more flexible with build-time controls. The extent
to which we should be flexible is an interesting discussion to have.

However, this patch is not for code size. This code causes unnecessary
runtime anonymous memory allocations, which are highly undesirable. In
fact, it is the primary source of such allocations. Additionally, it
exposes an extra interface to the guest, which is also undesirable
unless necessary.

In other words, the issue is not the size of the code, but its impact.


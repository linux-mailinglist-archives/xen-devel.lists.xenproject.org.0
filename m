Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D748B4119
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 23:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713126.1114130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0T7L-0002DW-HB; Fri, 26 Apr 2024 21:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713126.1114130; Fri, 26 Apr 2024 21:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0T7L-0002Au-E5; Fri, 26 Apr 2024 21:28:27 +0000
Received: by outflank-mailman (input) for mailman id 713126;
 Fri, 26 Apr 2024 21:28:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0T7K-0002Ao-07
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 21:28:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e53cf7e1-0413-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 23:28:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D3475CE1C9E;
 Fri, 26 Apr 2024 21:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25230C113CD;
 Fri, 26 Apr 2024 21:28:12 +0000 (UTC)
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
X-Inumbo-ID: e53cf7e1-0413-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714166893;
	bh=ZW0mA8Ak4IKnvCKJ1Xi2x4ShhsV40j5L0rxBl/3sO7s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FvzcK2qOdfT2DbIpsfezAsqJcuIYkLD+A9LiJ/prLgfAh6YJsMpIRbR+QdCPwnpVg
	 Jpxx30tnj+HZGzduEmMn0DRrQkwlnqkO6B9EBivQT0pLzdQiU7/gEnzfUS5kk7a96o
	 ONSio2NM/aKs8s5SSso4M6N5EW5lLbUSL6txRqT3+kFXMWvLCQJ7PazIyJb5C9ragU
	 n7crK9nUyT2RuXgSg7ZZEj/CCkkW/avvILllzuq34EWox/iUy324+6jvdpeeqy61kH
	 VKX7cVPAyTWqvx269gH2MkKlRoThmLJO5eL/Kq19Ksf3RaGA5X40BEf+KslE/OM9IZ
	 6XFFxt6J/R5Ow==
Date: Fri, 26 Apr 2024 14:28:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] public: xen: Define missing guest handle for int32_t
In-Reply-To: <90a25857-af9b-45ac-a6d6-e46ed1fb0609@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404261424340.3940@ubuntu-linux-20-04-desktop>
References: <20240417121442.56178-1-michal.orzel@amd.com> <be95f6be-0404-4c43-926f-d011782a02db@xen.org> <alpine.DEB.2.22.394.2404171148060.2257106@ubuntu-linux-20-04-desktop> <29afd327-a66c-4b4e-b076-ee6ecb70807e@xen.org>
 <alpine.DEB.2.22.394.2404251538250.3940@ubuntu-linux-20-04-desktop> <90a25857-af9b-45ac-a6d6-e46ed1fb0609@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-507727055-1714166718=:3940"
Content-ID: <alpine.DEB.2.22.394.2404261426150.3940@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-507727055-1714166718=:3940
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2404261426151.3940@ubuntu-linux-20-04-desktop>

On Fri, 26 Apr 2024, Jan Beulich wrote:
> On 26.04.2024 00:39, Stefano Stabellini wrote:
> > On Mon, 22 Apr 2024, Julien Grall wrote:
> >> Hi Stefano,
> >>
> >> On 17/04/2024 19:49, Stefano Stabellini wrote:
> >>> On Wed, 17 Apr 2024, Julien Grall wrote:
> >>>> Hi Michal,
> >>>>
> >>>> On 17/04/2024 13:14, Michal Orzel wrote:
> >>>>> Commit afab29d0882f ("public: s/int/int32_t") replaced int with int32_t
> >>>>> in XEN_GUEST_HANDLE() in memory.h but there is no guest handle defined
> >>>>> for it. This results in a build failure. Example on Arm:
> >>>>>
> >>>>> ./include/public/arch-arm.h:205:41: error: unknown type name
> >>>>> ‘__guest_handle_64_int32_t’
> >>>>>     205 | #define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ##
> >>>>> name
> >>>>>         |                                         ^~~~~~~~~~~~~~~~~~
> >>>>> ./include/public/arch-arm.h:206:41: note: in expansion of macro
> >>>>> ‘__XEN_GUEST_HANDLE’
> >>>>>     206 | #define XEN_GUEST_HANDLE(name)
> >>>>> __XEN_GUEST_HANDLE(name)
> >>>>>         |                                         ^~~~~~~~~~~~~~~~~~
> >>>>> ./include/public/memory.h:277:5: note: in expansion of macro
> >>>>> ‘XEN_GUEST_HANDLE’
> >>>>>     277 |     XEN_GUEST_HANDLE(int32_t) errs;
> >>>>>
> >>>>> Fix it. Also, drop guest handle definition for int given no further use.
> >>>>>
> >>>>> Fixes: afab29d0882f ("public: s/int/int32_t")
> >>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >>>
> >>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>>
> >>>
> >>>> So it turned out that I committed v1 from Stefano. I was meant to commit
> >>>> the
> >>>> patch at all, but I think I started with a dirty staging :(. Sorry for
> >>>> that.
> >>>>
> >>>> I have reverted Stefano's commit for now so we can take the correct patch.
> >>>>
> >>>> Now, from my understanding, Andrew suggested on Matrix that this solution
> >>>> may
> >>>> actually be a good way to handle GUEST_HANLDEs (they were removed in v2).
> >>>> Maybe this can be folded in Stefano's patch?
> >>>
> >>> v1 together with Michal's fix is correct. Also v2 alone is correct, or
> >>> v2 with Michal's fix is also correct.
> >>
> >> I am slightly confused, v2 + Michal's fix means that XEN_GUEST_HANDLE(int) is
> >> removed and we introduce XEN_GUEST_INT(int32_t) with no user. So wouldn't this
> > 
> > You are right I apologize. I looked at Michal's patch too quickly and
> > I thought it was just adding XEN_GUEST_INT(int32_t) without removing
> > anything.
> > 
> > In that case, if you are OK with it, please ack and commit v2 only.
> 
> Just to mention it: Committing would apparently be premature, as I can't spot
> any response to comments I gave to the patch. I'm okay with those being
> addressed verbally only, but imo they cannot be dropped on the floor.

I agree with your comments but I prefer to keep this patch smaller and
focused on doing one thing only. I don't want to mix non-mechanical
changes with the mechanical substitutions. For sure, there will be
follow ups to address your comments and other outstanding issues.
--8323329-507727055-1714166718=:3940--


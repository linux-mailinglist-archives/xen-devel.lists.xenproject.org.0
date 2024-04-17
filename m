Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A78A8B93
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 20:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707689.1105818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxAMB-00028A-NZ; Wed, 17 Apr 2024 18:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707689.1105818; Wed, 17 Apr 2024 18:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxAMB-00026X-Ja; Wed, 17 Apr 2024 18:50:07 +0000
Received: by outflank-mailman (input) for mailman id 707689;
 Wed, 17 Apr 2024 18:50:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jr4=LW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rxAMA-0001xI-5m
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 18:50:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ca98784-fceb-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 20:50:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B9DFECE147B;
 Wed, 17 Apr 2024 18:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C51C072AA;
 Wed, 17 Apr 2024 18:49:56 +0000 (UTC)
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
X-Inumbo-ID: 4ca98784-fceb-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379797;
	bh=QEnBWHsX8FgokPMcnFsZrLvkPh9Jho8Pqiss4uIUVRQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CNRahsMTTPtDFQWVMGfhQ2KsMVW2C/T159kx1xVlgqjS6+2KHj3M6maSNNZiyS173
	 aM9Day/Oz3/FO2RVGke8VCg1KPlCu5MT1TGy3o7W+e/Lr68qYJVp1LHrcV99y6Ea3L
	 R3n2DSU5F/VWTL7K80LkGE32JuL3ABN269jmonQUFcWgN8065SiuE/jXwwrmwoZQ8t
	 /J8WMv4qF5gV8LWN460BzeQBxNaVBh4aIPfRh/tkVNf4J8Luq6KiaHWy98/jtS6ny5
	 QWKLPus624C70H0FAQBLNkL+cmHAq1LjSyhOIv0nwPu9NIh0q2cyPP8syKZlE3VHT5
	 nhvtvIRS+XAiw==
Date: Wed, 17 Apr 2024 11:49:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] public: xen: Define missing guest handle for int32_t
In-Reply-To: <be95f6be-0404-4c43-926f-d011782a02db@xen.org>
Message-ID: <alpine.DEB.2.22.394.2404171148060.2257106@ubuntu-linux-20-04-desktop>
References: <20240417121442.56178-1-michal.orzel@amd.com> <be95f6be-0404-4c43-926f-d011782a02db@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-765210862-1713379797=:2257106"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-765210862-1713379797=:2257106
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 17 Apr 2024, Julien Grall wrote:
> Hi Michal,
> 
> On 17/04/2024 13:14, Michal Orzel wrote:
> > Commit afab29d0882f ("public: s/int/int32_t") replaced int with int32_t
> > in XEN_GUEST_HANDLE() in memory.h but there is no guest handle defined
> > for it. This results in a build failure. Example on Arm:
> > 
> > ./include/public/arch-arm.h:205:41: error: unknown type name
> > ‘__guest_handle_64_int32_t’
> >    205 | #define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
> >        |                                         ^~~~~~~~~~~~~~~~~~
> > ./include/public/arch-arm.h:206:41: note: in expansion of macro
> > ‘__XEN_GUEST_HANDLE’
> >    206 | #define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
> >        |                                         ^~~~~~~~~~~~~~~~~~
> > ./include/public/memory.h:277:5: note: in expansion of macro
> > ‘XEN_GUEST_HANDLE’
> >    277 |     XEN_GUEST_HANDLE(int32_t) errs;
> > 
> > Fix it. Also, drop guest handle definition for int given no further use.
> > 
> > Fixes: afab29d0882f ("public: s/int/int32_t")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> So it turned out that I committed v1 from Stefano. I was meant to commit the
> patch at all, but I think I started with a dirty staging :(. Sorry for that.
> 
> I have reverted Stefano's commit for now so we can take the correct patch.
> 
> Now, from my understanding, Andrew suggested on Matrix that this solution may
> actually be a good way to handle GUEST_HANLDEs (they were removed in v2).
> Maybe this can be folded in Stefano's patch?

v1 together with Michal's fix is correct. Also v2 alone is correct, or
v2 with Michal's fix is also correct.

My preference is v2 with Michal's fix, they can be committed as separate
patches. Also the others options are fine.
--8323329-765210862-1713379797=:2257106--


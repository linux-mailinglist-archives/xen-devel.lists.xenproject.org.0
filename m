Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4E784D4F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 01:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588780.920384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYaiu-0004ns-VW; Tue, 22 Aug 2023 23:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588780.920384; Tue, 22 Aug 2023 23:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYaiu-0004lY-Ru; Tue, 22 Aug 2023 23:23:44 +0000
Received: by outflank-mailman (input) for mailman id 588780;
 Tue, 22 Aug 2023 23:23:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gk3p=EH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYait-0004lQ-Rv
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 23:23:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed77c1b2-4142-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 01:23:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9FCF62236;
 Tue, 22 Aug 2023 23:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0049BC433C7;
 Tue, 22 Aug 2023 23:23:37 +0000 (UTC)
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
X-Inumbo-ID: ed77c1b2-4142-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692746619;
	bh=EBY87oWIPn3k66W6fK7Ox2GKasMHen2d4O315s4l+cM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lud944Crnd0V5cRJbUTBYFL+1R+ELe81Njv1/pC1hmNKgmxWKwcUIVnDyE0WZ4Pm7
	 0bWYa0Uf9Dxdu4/0fTl/kmjzKjsIrv5t2gwSu6RjmxRO7MC0YTw9lso8RI/t7pUY7R
	 Gf7NnKZVecAJkV3wfWMYZ7xIRQgGcVUYG9Zigxzj1Qne2+vfAA1k+h7yTqglEvipem
	 rImbObu7pgVOkOY4gWCVXJG/8pTu6HNUjyiMrnbZDfFQAz53FJEZfNiRmWFy4BOMvy
	 9QgK83a7g6Ww2+9gHIbajGNOQa9wEXfFVZLxoYyGb/tYek2Sr0ADWT5KlPveD70Vsd
	 uK7GtlbAGz80A==
Date: Tue, 22 Aug 2023 16:23:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: add exceptions to rules
In-Reply-To: <370dd885-0f80-5d18-62b9-9ccbc2696d28@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308221623250.6458@ubuntu-linux-20-04-desktop>
References: <20230822013014.2523202-1-sstabellini@kernel.org> <370dd885-0f80-5d18-62b9-9ccbc2696d28@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Aug 2023, Jan Beulich wrote:
> On 22.08.2023 03:30, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > During the discussions that led to the acceptable of the Rules, we
> 
> Nit: acceptance
> 
> > decided on a few exceptions that were not properly recorded in
> > rules.rst. Other times, the exceptions were decided later when it came
> > to enabling a rule in ECLAIR.
> > 
> > Either way, update rules.rst with appropriate notes.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >[...]
> > @@ -239,13 +256,16 @@ maintainers if you want to suggest a change.
> >       - Required
> >       - All declarations of an object or function shall use the same
> >         names and type qualifiers
> > -     -
> > +     - The type ret_t maybe be deliberately used and defined as int or
> > +       long depending on the type of guest to service
> >  
> >     * - `Rule 8.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_04.c>`_
> >       - Required
> >       - A compatible declaration shall be visible when an object or
> >         function with external linkage is defined
> > -     -
> > +     - Allowed exceptions: asm-offsets.c (definitions for asm modules
> > +       not called from C code), gcov_base.c (definitions only used in
> > +       non-release builds)
> 
> Doesn't this want to be
> 
>      - Allowed exceptions: asm-offsets.c, definitions for asm modules
>        not called from C code, and gcov_base.c (definitions only used in
>        non-release builds)
> 
> ? As to coverage: Why "only used in non-release builds"? COVERAGE doesn't
> depend on DEBUG, and people may actually want to enable it for release
> builds. Just likely not for production ones.
> 
> If you agree with and make respective adjustments:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Yes I agree to the changes and I made them on commit


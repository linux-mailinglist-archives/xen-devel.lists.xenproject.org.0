Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D8B7FCD7B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 04:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643632.1004057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8BDB-00057m-Ng; Wed, 29 Nov 2023 03:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643632.1004057; Wed, 29 Nov 2023 03:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8BDB-00055P-Kg; Wed, 29 Nov 2023 03:26:05 +0000
Received: by outflank-mailman (input) for mailman id 643632;
 Wed, 29 Nov 2023 03:26:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+r8=HK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8BDB-00055J-45
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 03:26:05 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0616bf0c-8e67-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 04:26:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 809A0B827AD;
 Wed, 29 Nov 2023 03:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8961C433CA;
 Wed, 29 Nov 2023 03:26:00 +0000 (UTC)
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
X-Inumbo-ID: 0616bf0c-8e67-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701228361;
	bh=7K85jJi3+m8P+nn+lkj3Q5XxMXxD6/+ZoJefV4TjPKY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W/DKfzwIE9PSKV2fVJoJaxeqdhkfoOruRt2LaTGhonZLsXk56Mmw54Q76Uk8lFoBc
	 jwTtI5kYVIRZK1jDIDQ7wx1N3Todq78ZoKJ0uwBtllIPJu4WzB17n0wy+YXKSkcm3l
	 pAXzpDgdS3+qjQ6XMsGHihr4RV4QZ5UBSeGnB6zWEZazjZhlGLRcVC2lEqVQeXE0iL
	 MiAkOxlqVdcTVZdfUwpiIAdY+2p4ROfnCoRnn+tUWnXSd9KilE4tGIF95g+0ixHM7Z
	 xWdyyOxO71+87aDBBEJ1yNu+H8pcf02y37FwNGCDFlKgBYVhUveLQWimaFOcMgJFFJ
	 w/KevDiI92v+A==
Date: Tue, 28 Nov 2023 19:26:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper3 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Xen Devel <xen-devel@lists.xenproject.org>
Subject: Re: MISRA: Compatible declarations for sort and bsearch
In-Reply-To: <5ebb62b5485bb1a0c4e805af6580ab6d@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311281923170.3533093@ubuntu-linux-20-04-desktop>
References: <f60a702c838c3274cf9e1193964222f4@bugseng.com> <ca540835e3cce50a852fdf2b3956205a@bugseng.com> <b3e14bf0-def2-4e1c-83f6-a94a203c7b8d@suse.com> <5ebb62b5485bb1a0c4e805af6580ab6d@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Nov 2023, Nicola Vetrini wrote:
> > > /*
> > >   * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
> > >   * is required because the dummy helpers are using it.
> > >   */
> > > extern mfn_t first_valid_mfn;
> > > 
> > > it should probably be deviated.
> > 
> > NUMA work is still in progress for Arm, I think, so I'd rather wait with
> > deviating.
> > 
> 
> +Stefano
> 
> I can leave it as is, if that's indeed going to become static at some point.

I see the point in waiting given the TODO comment, but I wouldn't want
this issue to be the only thing standing between us and zero violation
of Rule 8.4 on ARM. So I think we should add SAF to the comment and
remove it when not necessary any longer. 


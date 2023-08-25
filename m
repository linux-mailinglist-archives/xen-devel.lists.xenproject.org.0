Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177C77890C6
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 23:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591013.923396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZejW-0004LM-CF; Fri, 25 Aug 2023 21:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591013.923396; Fri, 25 Aug 2023 21:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZejW-0004Iu-9f; Fri, 25 Aug 2023 21:52:46 +0000
Received: by outflank-mailman (input) for mailman id 591013;
 Fri, 25 Aug 2023 21:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmKO=EK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZejU-0004Io-V6
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 21:52:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b75dcaf0-4391-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 23:52:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C7563647F3;
 Fri, 25 Aug 2023 21:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4F7C433C8;
 Fri, 25 Aug 2023 21:52:40 +0000 (UTC)
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
X-Inumbo-ID: b75dcaf0-4391-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693000361;
	bh=PwMJLmZrGwJD0f3gjcP9ZJU83u5dBsH0BlhB5NdXjNQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UwAMOkERwqgGBTbXbzlm/qRmgTu3hlMVKFYBY9ruJBfBud6YxlR27zzBEom0L0OQe
	 3RZ8JenoSE3oV0YQDl3xNeMgzV1OEGtGXU4LoA/ryk+zjV9U+QXE00jnuYXpuHsmIl
	 CDe1PE6cmIp5WurbneCk4hYbWLJcE6+khy7pRDNbu3+543m9idjkw0JZb/xszyWzMG
	 0/JKQq8ecyK4nYoHw3VIXLksqLLoZHhnXCs0ScJE/3dJABkDnpkh/vRYugiZasDP/+
	 tkojRjMjChoNZqWH6EDNbfROoooXbcRE7tAYlswb+MSVZfA1OxKMzpZtNYYr9SF2Eh
	 rP3DYfuug6oig==
Date: Fri, 25 Aug 2023 14:52:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, luca.fancellu@arm.com, 
    nicola.vetrini@bugseng.com, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com
Subject: Re: xen-analysis ECLAIR support
In-Reply-To: <aec70a33-b5b7-0bcb-52db-15162407c8bb@amd.com>
Message-ID: <alpine.DEB.2.22.394.2308251450370.6458@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop> <aec70a33-b5b7-0bcb-52db-15162407c8bb@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Aug 2023, Michal Orzel wrote:
> Hi Stefano,
> 
> On 25/08/2023 00:24, Stefano Stabellini wrote:
> > 
> > 
> > Hi Luca,
> > 
> > We are looking into adding ECLAIR support for xen-analysis so that we
> > can use the SAF-n-safe tags also with ECLAIR.
> > 
> > One question that came up is about multi-line statements. For instance,
> > in a case like the following:
> > 
> > diff --git a/xen/common/inflate.c b/xen/common/inflate.c
> > index 8fa4b96d12..8bdc9208da 100644
> > --- a/xen/common/inflate.c
> > +++ b/xen/common/inflate.c
> > @@ -1201,6 +1201,7 @@ static int __init gunzip(void)
> >      magic[1] = NEXTBYTE();
> >      method   = NEXTBYTE();
> > 
> > +    /* SAF-1-safe */
> >      if (magic[0] != 037 ||
> >          ((magic[1] != 0213) && (magic[1] != 0236))) {
> >          error("bad gzip magic numbers");
> > 
> > 
> > Would SAF-1-safe cover both 037, and also 0213 and 0213?
> > Or would it cover only 037?
> > 
> > We haven't use SAFE-n-safe extensively through the codebase yet but
> > my understanding is that SAFE-n-safe would cover the entire statement of
> > the following line, even if it is multi-line. Is that also your
> > understanding? Does it work like that with cppcheck?
> Looking at the docs and the actual script, only the single line below SAF comment is excluded.
> So in your case you would require:
> 
> /* SAF-1-safe */
> if (magic[0] != 037 ||
>     /* SAF-1-safe */
>     ((magic[1] != 0213) && (magic[1] != 0236))) {
>     error("bad gzip magic numbers");
> 
> I guess this was done so that it is clear that someone took all the parts of the statements into account
> and all of them fall into the same justification (which might not be the case).
 
Ops! In that case there is no difference between xen-analysis, cppcheck
and ECLAIR behaviors.


> BTW. I don't think we have also covered the case where there is more than one violation in a single line
> that we want to deviate (e.g. sth like /* SAF-1-safe, SAF-2-safe */

Good point. Yes we need to make sure that case is covered as well
one way or the other.


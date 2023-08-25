Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6709A7890E7
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 23:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591020.923407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZen4-0004wx-RK; Fri, 25 Aug 2023 21:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591020.923407; Fri, 25 Aug 2023 21:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZen4-0004vH-Od; Fri, 25 Aug 2023 21:56:26 +0000
Received: by outflank-mailman (input) for mailman id 591020;
 Fri, 25 Aug 2023 21:56:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmKO=EK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZen4-0004vB-34
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 21:56:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b006f8f-4392-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 23:56:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C680618AF;
 Fri, 25 Aug 2023 21:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E673EC433C7;
 Fri, 25 Aug 2023 21:56:20 +0000 (UTC)
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
X-Inumbo-ID: 3b006f8f-4392-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693000581;
	bh=e89rRB1z+4ovPsky8aVI8ZIyqfGPTm21oElqqG3zT2Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QSat1+rd/9ha81e0/Ft/FLARyel78oSTFItNUNgTHC9s7zYmqHWTZG7VKnHA90EJj
	 jyOMLqL/O/ZF4KJUa9msJJbzH0UbHnrZmeIbDV0w4ucwMUoynpI3MgsHwcxNqBckXG
	 ZcrpMiCxpDEPcUB7OmDjj6UpDHmo1pLatOJddT03ZTtyCF/xkFX8d65B5hphQE6jlK
	 URNy4+TValuyBB6/lr9x1YNAMZ6mhyvp38mRKzg/RSrH41NGclRnajNBswzgIiUsjM
	 6JKr/Ffk3IAJKAonoiblvUVu2pZ6ljF+w35fjbn+Sm1+GMrsKRu1kIp3T0DVKm6kXu
	 yviaB/btJhYNw==
Date: Fri, 25 Aug 2023 14:56:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, luca.fancellu@arm.com, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com
Subject: Re: xen-analysis ECLAIR support
In-Reply-To: <da8dce5678814f7e0805522a5111b09e@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308251455070.6458@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop> <da8dce5678814f7e0805522a5111b09e@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Aug 2023, Nicola Vetrini wrote:
> On 25/08/2023 00:24, Stefano Stabellini wrote:
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
> > 
> > 
> > It looks like ECLAIR requires a written-down number of lines of code to
> > deviate if it is more than 1 line. In this example it would be 2 lines:
> > 
> >      /* SAF-1-safe 2 */
> >      if (magic[0] != 037 ||
> >          ((magic[1] != 0213) && (magic[1] != 0236))) {
> > 
> > One option that I was thinking about is whether we can add the number of
> > lines automatically in xen-analysis based on the number of lines of the
> > next statement. What do you think?
> > 
> > It seems fragile to actually keep the number of lines inside the SAF
> > comment in the code. I am afraid it could get out of sync due to code
> > style refactoring or other mechanical changes.
> > 
> 
> Having the number of lines automatically inferred from the code following the
> comment
> does not seem that robust either, given the minimal information in the SAF
> comments
> (e.g., what if the whole if statement needs to be deviated, rather
> than the controlling expression?).
> 
> An alternative proposal could be the following:
>       /* SAF-n-safe begin */
>       if (magic[0] != 037 ||
>           ((magic[1] != 0213) && (magic[1] != 0236))) {
>       /* SAF-n-safe end */
> 
> which is translated, for ECLAIR, into:
> 
>     /* -E> safe <Rule ID> 2 <free text> */
>     if (magic[0] != 037 ||
>           ((magic[1] != 0213) && (magic[1] != 0236))) {
> 
> this will deviate however many lines are between the begin and end markers.

I think this could be a good way to solve the problem when multi-line
deviation support is required. In this case, like Jan suggested, it
is easier to put everything on a single line, but in other cases it
might not be possible.


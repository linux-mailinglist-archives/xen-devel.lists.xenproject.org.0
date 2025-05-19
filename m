Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41918ABC9B4
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 23:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990316.1374273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH87r-0005iG-Rq; Mon, 19 May 2025 21:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990316.1374273; Mon, 19 May 2025 21:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH87r-0005fq-P4; Mon, 19 May 2025 21:34:23 +0000
Received: by outflank-mailman (input) for mailman id 990316;
 Mon, 19 May 2025 21:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=klDL=YD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uH87q-0005fk-Bx
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 21:34:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05c1774f-34f9-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 23:34:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9947AA462CA;
 Mon, 19 May 2025 21:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8D4C4CEE4;
 Mon, 19 May 2025 21:34:18 +0000 (UTC)
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
X-Inumbo-ID: 05c1774f-34f9-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690459;
	bh=uNIR9J8IYYLSDr8BnTHVoT33K0GNLeYQ5Ei7ULPdl+4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=stI53RA/WkY9416R1XTyO+DyubcProOGBuVyzwFF9e34TjFojI/hKivJbnMDGTNA5
	 +31nONVUyJ0dzJJeDVRXaQYxYG2lv8al0hicJxBGtPONHPJhTpYigwMfaISPsLyFWZ
	 VsLQd6qqHHxmZ2vVkhM/OpwvMSfFntwtrOrIspdA6Mmc49EDxNkE/zjKivtxlG6gyS
	 SVortkk/HAQdg6nLFx857I46u+p88WsB8L01mcksquW6hnOgcnF9IF+9Hou27kEPZH
	 yNdfjWorgJ09nbsO+wY+tjmrpJaCuLXHaaJIPy4y9VDsexvAe1G+uBtLYgp1NNqKYY
	 aypALreIUMjyg==
Date: Mon, 19 May 2025 14:34:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Give compile.h header guards
In-Reply-To: <a967e60c-0474-46ac-87c0-d1d6ce5ce289@suse.com>
Message-ID: <alpine.DEB.2.22.394.2505191431140.145034@ubuntu-linux-20-04-desktop>
References: <20250519135227.27386-1-andrew.cooper3@citrix.com> <a967e60c-0474-46ac-87c0-d1d6ce5ce289@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 May 2025, Jan Beulich wrote:
> On 19.05.2025 15:52, Andrew Cooper wrote:
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Is this to please Misra in some way?
> 
> > --- a/xen/include/xen/compile.h.in
> > +++ b/xen/include/xen/compile.h.in
> > @@ -1,3 +1,6 @@
> > +#ifndef XEN_COMPILE_H
> > +#define XEN_COMPILE_H
> > +
> >  #define XEN_COMPILE_DATE	"@@date@@"
> >  #define XEN_COMPILE_TIME	"@@time@@"
> >  #define XEN_COMPILE_BY		"@@whoami@@"
> > --- a/xen/tools/process-banner.sed
> > +++ b/xen/tools/process-banner.sed
> > @@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
> >  
> >  # Trailing \ on all but the final line.
> >  $!s_$_ \\_
> > +
> > +# Append closing header guard
> > +$a\
> > +\
> > +#endif /* XEN_COMPILE_H */
> 
> This split of #ifndef and #endif is ugly. Can't we switch to something
> more conventional, like
> 
> #define XEN_BANNER		"@@banner@@"
> 
> with the first sed invocation then replacing this by the result of
> a nested sed invocation using process-banner.sed (which of course would
> need adjusting some)? (Maybe the double quotes would need omitting here,
> for process-banner.sed to uniformly apply them.)

While I agree with Jan that this is kind of ugly, it is a unique case
and I would prefer an ugly but simple solution than a more complex
solution. This would be different if we were talking about a widespread
pattern, in which case the price for complexity would be worth it.

My 2 cents in this case are in favor of the simplest approach. I would
ack this patch.


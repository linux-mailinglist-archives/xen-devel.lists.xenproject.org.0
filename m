Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A484A350A6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 22:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888068.1297485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tih36-0000Ep-Qj; Thu, 13 Feb 2025 21:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888068.1297485; Thu, 13 Feb 2025 21:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tih36-0000DN-Nq; Thu, 13 Feb 2025 21:47:08 +0000
Received: by outflank-mailman (input) for mailman id 888068;
 Thu, 13 Feb 2025 21:47:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tih35-0000Bj-AN
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 21:47:07 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 108a2fc4-ea54-11ef-9896-31a8f345e629;
 Thu, 13 Feb 2025 22:47:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 210EFA420AE;
 Thu, 13 Feb 2025 21:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616D3C4CED1;
 Thu, 13 Feb 2025 21:47:03 +0000 (UTC)
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
X-Inumbo-ID: 108a2fc4-ea54-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739483224;
	bh=4+KLx3CK73Q/uF3YueFqe+YbwNrB0T6+t3G2XYAFxIM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JwngfL5loJim41GDGJz42xjlHBFtGCdcc26Xl9eVXqM3QNFihsP23rtlaZQTwNYPK
	 1FxBzmhoRbW5eo5vECdXJwsB3CcMvxNCa/Iujn+pnT6s1tMDNCmcx36GYRUK/eciM8
	 1JG4WcfL5dmpgjIJ+Wmzaw4xswef65Dy98O8gycu9ZyzqVUQxEeUbGPwERS2YCB4V0
	 hKQuOpE4PKWTp6mTYqcdt1GGkbnVL6fsXeMdU+BnQqG7NdawYWiZmMbbGXm5K/Jenh
	 rMcXBFW4ajj1Sfo84jv4MoRLP/+/Wt+z0yTypWmYyUrJLKRZu2Frxpud0uBlUyLX4M
	 DwIunKechgc2A==
Date: Thu, 13 Feb 2025 13:47:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: struct mctelem_cookie missing definition
In-Reply-To: <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop> <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com> <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-957282637-1739482437=:619090"
Content-ID: <alpine.DEB.2.22.394.2502131334000.619090@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-957282637-1739482437=:619090
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2502131334001.619090@ubuntu-linux-20-04-desktop>

On Thu, 13 Feb 2025, Jan Beulich wrote:
> On 13.02.2025 03:00, Stefano Stabellini wrote:
> > On Wed, 12 Feb 2025, Stefano Stabellini wrote:
> >> On Thu, 13 Feb 2025, Andrew Cooper wrote:
> >>> On 13/02/2025 1:25 am, Stefano Stabellini wrote:
> >>>> Hi all,
> >>>>
> >>>> I am looking through the few remaining MISRA violations that we have
> >>>> left.  One of them is R11.2:
> >>>>
> >>>> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/9118578464/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}
> >>>>
> >>>> Specifically, mctelem_cookie_t is a pointer to incomplete type and
> >>>> therefore COOKIE2MCTE triggers a "conversion between a pointer to an
> >>>> incomplete type and any other type".
> >>>>
> >>>> mctelem_cookie_t is defined as:
> >>>>
> >>>> typedef struct mctelem_cookie *mctelem_cookie_t;
> >>>>
> >>>> I am looking through the code and I genuinely cannot find the definition
> >>>> of struct mctelem_cookie.
> >>>>
> >>>> If mctelem_cookie_t is only used as a pointer, wouldn't it make more
> >>>> sense to do:
> >>>>
> >>>> typedef struct mctelem_ent *mctelem_cookie_t;
> >>>>
> >>>> ?
> >>>>
> >>>> What am I missing?
> >>>
> >>> Nothing.  Or perhaps the twisted thinking of the original author.
> >>>
> >>> It is genuinely a pointer type (== known size) which you can't deference
> >>> (because there is no definition), and can only operate on by casting to
> >>> an integer.  Except the code also requires it to be a uint64_t which is
> >>> why there's some fun disabling of relevant hypercalls for compat guests.
> >>>
> >>> If someone could find the time to file it in /dev/null and replace it
> >>> with literally anything else, I'd be very thankful.
> >>
> >> Are you OK with typedefing mctelem_cookie_t to uint64_t instead?
> > 
> > I confirm that the following resolves the MISRA violations
> > 
> > diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
> > index f4c5ff848d..2ccd490e5d 100644
> > --- a/xen/arch/x86/cpu/mcheck/mctelem.h
> > +++ b/xen/arch/x86/cpu/mcheck/mctelem.h
> > @@ -52,7 +52,7 @@
> >   * the element from the processing list.
> >   */
> >  
> > -typedef struct mctelem_cookie *mctelem_cookie_t;
> > +typedef uint64_t *mctelem_cookie_t;
> 
> Yet that makes it possible to de-reference the pointer. Which, as Andrew
> explained, is intended to be impossible. If this could be properly
> replaced (not exactly what Andrew indicated by "file it in /dev/null"),
> fine. Truly purging the code (i.e. as Andrew suggests) may still be an
> option, with appropriate justification. But simply adjusting the type
> and then moving on is too little, imo. Even if you used void * (to make
> de-referencing impossible) I'd view it as largely papering over an issue;
> then converting to other pointers (without explicit cast, and hence
> without making apparent the badness of doing so) would become possible.

What about converting to uintptr_t (not a pointer)?


In general, there are quite a few MISRA rules that we could mark as
blocking (clean) in our GitLab scan with just a few code changes like
this one. My goal is to make these rules blocking as soon as possible.
If I can improve the code in the process, that is even better, but it is
not mandatory. And I would rather spend one more hour marking a second
rule as blocking instead. 

What I mean is that I believe it would be acceptable to make some
compromises and accept non-perfect changes to the code if it helps us
enforce more rules as blocking in GitLab CI.
--8323329-957282637-1739482437=:619090--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FAF30465F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 19:36:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75415.135798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4TCO-0001nj-AB; Tue, 26 Jan 2021 18:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75415.135798; Tue, 26 Jan 2021 18:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4TCO-0001nK-6y; Tue, 26 Jan 2021 18:36:20 +0000
Received: by outflank-mailman (input) for mailman id 75415;
 Tue, 26 Jan 2021 18:36:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4TCM-0001nF-OG
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 18:36:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81878779-f497-449d-b86b-bdf5411dcd8c;
 Tue, 26 Jan 2021 18:36:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 932B52223D;
 Tue, 26 Jan 2021 18:36:15 +0000 (UTC)
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
X-Inumbo-ID: 81878779-f497-449d-b86b-bdf5411dcd8c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611686176;
	bh=dECGD91J/43G+hs/4Mr0VUrDj9V9sxLE8+UZotzToYI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a/ZAELOPZnXyQ3G/69M7LV4GI12V2bCitjK2ndDNnEaxivN1/2o94yVUpOBsmAnjY
	 FQzkiKNY6Z+Zn1Ctik6bXIDJU+ho7D3d/mYFJYtPygKyJ/9OwTY1bnY+Z96ZatgEAp
	 wU+yqWaIJlNwvoYeY2BHD9RUkaZScvE8mJ0tZYdH9Y1lWpChpCZaEE7a7GoP5A2S89
	 FCoiVRRczjSnfSIKUkYtC1kGw0gPxHBpGPsUEXqSCMPCyUesnj7MxTmayKEM2vapwW
	 AMFS5xG3TT6mYOEoBbunVo041sSLOQ7EP+WuvWOzETXdNAw7UkTdyDY6/zOK0p0jlo
	 ORcrtPel/mWGw==
Date: Tue, 26 Jan 2021 10:36:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org, 
    julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/2] xen: add (EXPERT) to one-line descriptions when
 appropriate
In-Reply-To: <61899bf7-dbd0-dd38-473f-b0a88cb6e87a@suse.com>
Message-ID: <alpine.DEB.2.21.2101261033100.20638@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s> <20210125212747.26676-2-sstabellini@kernel.org> <61899bf7-dbd0-dd38-473f-b0a88cb6e87a@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Jan 2021, Jan Beulich wrote:
> On 25.01.2021 22:27, Stefano Stabellini wrote:
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -103,7 +103,7 @@ config HVM
> >  	  If unsure, say Y.
> >  
> >  config XEN_SHSTK
> > -	bool "Supervisor Shadow Stacks"
> > +	bool "Supervisor Shadow Stacks (EXPERT)"
> >  	depends on HAS_AS_CET_SS && EXPERT
> >  	default y
> >  	---help---
> 
> I agree with this addition, but I'm afraid I'm at least uncertain
> about all the other ones made here, where ...
> 
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -12,7 +12,7 @@ config CORE_PARKING
> >  	bool
> >  
> >  config GRANT_TABLE
> > -	bool "Grant table support" if EXPERT
> > +	bool "Grant table support (EXPERT)" if EXPERT
> >  	default y
> 
> ... like e.g. here, it's only the prompt that's conditional. IOW
> like with the respective uses of UNSUPPORTED in some of the Arm
> changes in patch 1, especially when the option's default is "yes"
> it's not the feature that is an expert one, but its turning off
> is considered an expert change. Which I don't think should be
> expressed this way.

That's a good point actually. It makes sense to add the EXPERT tag to
the one-line description of options that depends on EXPERT. Not where
only the prompt depends on EXPERT and the option is actually default y.

Which really narrows it down to XEN_SHSTK only. I'll reduce the patch
to do just that.


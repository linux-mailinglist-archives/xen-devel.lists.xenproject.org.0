Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9FFA38F7D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 00:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891007.1300110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkAHc-000713-7E; Mon, 17 Feb 2025 23:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891007.1300110; Mon, 17 Feb 2025 23:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkAHc-0006za-4e; Mon, 17 Feb 2025 23:12:12 +0000
Received: by outflank-mailman (input) for mailman id 891007;
 Mon, 17 Feb 2025 23:12:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LnTS=VI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkAHb-0006zU-Hy
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 23:12:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c0f76bb-ed84-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 00:12:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE47C5C5892;
 Mon, 17 Feb 2025 23:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB5CC4CED1;
 Mon, 17 Feb 2025 23:12:05 +0000 (UTC)
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
X-Inumbo-ID: 9c0f76bb-ed84-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739833926;
	bh=wUyQyIeug0o3UP0su8D7xJGgJKtWuYG32/c6DeobZjg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ic927tNERRovP3O89tF3jIiY5Yt9hYx14AQGsNNT/wwmFrAWwwGvkbRm/Y1ZuzPEL
	 KN44kigFk00Pfso0sar011HLUBSFV9cW3qgoWlHewtELk6aVVEFAZ7fvi5zrTxNgOV
	 UgvLzZk3Dq1W9hoF+93DuxU2vA1tnnSaq/L65OY2ojCVicF3wyvg5qYdizF86J2+qt
	 AJAonbRiR31EZy77wk+8Gu1/MOl5FaiMZCcTj5WwDajFDtSC0Fwg+HCU0lzo06wMtt
	 ZkJMXFgmRgb+Cv1T/VbXbDsMJYGWmHFJdvzzWUsi+hlsLybHZAk7pQ1yROXbGdPcsD
	 yfqTAFXHSC+6A==
Date: Mon, 17 Feb 2025 15:12:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com, 
    xen-devel@lists.xenproject.org
Subject: Re: xen/x86: resolve the last 3 MISRA R16.6 violations
In-Reply-To: <daaf4284-102c-4fc4-819c-2231705ab572@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502171509330.1085376@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502141811180.3858257@ubuntu-linux-20-04-desktop> <daaf4284-102c-4fc4-819c-2231705ab572@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Feb 2025, Jan Beulich wrote:
> On 15.02.2025 03:16, Stefano Stabellini wrote:
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -3797,22 +3797,14 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
> >  {
> >      ASSERT(v == current || !vcpu_runnable(v));
> >  
> > -    switch ( reg )
> > -    {
> > -    default:
> > -        return alternative_call(hvm_funcs.get_reg, v, reg);
> > -    }
> > +    return alternative_call(hvm_funcs.get_reg, v, reg);
> >  }
> >  
> >  void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
> >  {
> >      ASSERT(v == current || !vcpu_runnable(v));
> >  
> > -    switch ( reg )
> > -    {
> > -    default:
> > -        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
> > -    }
> > +    return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
> >  }
> 
> Both of these were, iirc, deliberately written using switch(), to ease
> possible future changes.

To be honest, I do not see any value in the way they are currently
written. However, if you prefer, I can add a deviation for this, with
one SAF comment for each of these two. The reason for the deviation
would be "deliberate to ease possible future change". Please let me know
how you would like to proceed.


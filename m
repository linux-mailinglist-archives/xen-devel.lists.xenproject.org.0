Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BF9770910
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 21:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577302.904321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS0Uh-0008Sj-1x; Fri, 04 Aug 2023 19:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577302.904321; Fri, 04 Aug 2023 19:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS0Ug-0008QS-Ve; Fri, 04 Aug 2023 19:29:50 +0000
Received: by outflank-mailman (input) for mailman id 577302;
 Fri, 04 Aug 2023 19:29:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS0Uf-0008QJ-7A
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 19:29:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 453391c4-32fd-11ee-b271-6b7b168915f2;
 Fri, 04 Aug 2023 21:29:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15197620F9;
 Fri,  4 Aug 2023 19:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C5EC433C7;
 Fri,  4 Aug 2023 19:29:44 +0000 (UTC)
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
X-Inumbo-ID: 453391c4-32fd-11ee-b271-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691177385;
	bh=CTBpVm4g/vfOsKl1JRh9HFCJ7Vgsh5L+DgB4rAP/jUw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AlpLzj6AR0q2oesQZ4mGGa0d0Ysq4oWOv+37r2KW846tWzNIiVLKk70c+gIEgwx0D
	 T4fDleDfohMlwwDsk4g9LVaAJXo3bpsQ5ECSoI3xaSZOLngr8xrJ9eWcpoO4Kn7pgq
	 Oq4rNH1P/bkvUXXp3Sa3iCZBS0uHIDqLn39TIMRDeTRkm2IvxYypP10yy6SmHa+bXd
	 7myNuIHzhnkoH9xXHUwRho4H5pj0Vy8iKq4Hb4fqgZtsEXOHQilpViBq3z8UZPO33X
	 ZPTvQT1h8SU1DMXHxl76cOKJaW2RHlD2dVkWADTd9LDIEUs4YPCXxEED+P5QlAwLQr
	 qfjUzKHBAMmDA==
Date: Fri, 4 Aug 2023 12:29:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, bertrand.marquis@arm.com, 
    roberto.bagnara@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add always_inline to C-language-toolchain
In-Reply-To: <c8b78e9a-8aa8-dafc-bcda-b6a2101113cb@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308041227190.2127516@ubuntu-linux-20-04-desktop>
References: <20230804013438.2894725-1-sstabellini@kernel.org> <c8b78e9a-8aa8-dafc-bcda-b6a2101113cb@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Jan Beulich wrote:
> On 04.08.2023 03:34, Stefano Stabellini wrote:
> > --- a/docs/misra/C-language-toolchain.rst
> > +++ b/docs/misra/C-language-toolchain.rst
> > @@ -84,6 +84,8 @@ The table columns are as follows:
> >            see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
> >         __const__, __inline__, __inline:
> >            see Section "6.48 Alternate Keywords" of GCC_MANUAL.
> > +       always_inline:
> > +          see Section "6.45 An Inline Function is As Fast As a Macro" of GCC_MANUAL.
> >         typeof, __typeof__:
> >            see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
> >         __alignof__, __alignof:
> 
> This is the "Non-standard tokens" section. What you add is a macro of our
> own. In its expansion we don't use the similarly named attribute in this
> very spelling, but with underscores prefixed and suffixed to it.
> 
> If we mean to enumerate __attribute__(()) identifier tokens here as well,
> then I think we should add all of them that we use. But that's going to
> be an ever expanding list.

Ah! Now it makes sense. I missed this:

#define always_inline __inline__ __attribute__ ((__always_inline__))

That is why it wasn't already listed in the document: we didn't list all
the __attribute__(()) and this is just one of them. They are clearly
marked extensions so there is no strict need to list them also here.

I'll drop the patch.


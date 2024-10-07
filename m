Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB9993853
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 22:33:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812442.1225194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuQ0-0002GK-7P; Mon, 07 Oct 2024 20:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812442.1225194; Mon, 07 Oct 2024 20:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuQ0-0002Ep-4i; Mon, 07 Oct 2024 20:33:24 +0000
Received: by outflank-mailman (input) for mailman id 812442;
 Mon, 07 Oct 2024 20:33:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QHG9=RD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sxuPz-0002Eg-1E
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 20:33:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63fb8196-84eb-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 22:33:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C10F5C5A26;
 Mon,  7 Oct 2024 20:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B901C4CECD;
 Mon,  7 Oct 2024 20:33:18 +0000 (UTC)
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
X-Inumbo-ID: 63fb8196-84eb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728333199;
	bh=KKoeqB5aOXHUbcC90JrwS5UQpKJt2Bo1JG6b30Iqi4g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FRxfPgR/n6jsuq5w9CxwGLLKyA/nN+2BA52c5+UTWUoBgP91GgIRP7iWyt609c5VQ
	 3SweDOqs5GhdJQDGcnaDAHO7iRhYKE7KaqL1tVW0ZRROBOh56tG/SDf87ljtPcGZGR
	 qlHBulQvNELWVjfWbyyGtplxTMZmUx8gBGkSU0fxN5T/Mf7x8mD3MtLgK8ZO4sr5JZ
	 eavRPGyPnn2QiJ7GaZRf/81l1KPLN+tCQjZ2ecIs+fVy2wWCZEd16gp+MbwwCIR1QI
	 BJp04MBgItv9coQCO/7nNV4Fvm50qv5mOtWIUcMdPlq8sLlRHwXgB8BYJyZ0LTTyRw
	 DttRHBy0V3whg==
Date: Mon, 7 Oct 2024 13:33:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: use PYTHON for qemu-deps-check.py
In-Reply-To: <e7f552d7-f9c3-4f22-8a18-68294324a676@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2410071330210.3512606@ubuntu-linux-20-04-desktop>
References: <20241007152259.1353-1-olaf@aepfle.de> <e7f552d7-f9c3-4f22-8a18-68294324a676@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1500325137-1728333199=:3512606"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1500325137-1728333199=:3512606
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 7 Oct 2024, Andrew Cooper wrote:
> On 07/10/2024 4:22 pm, Olaf Hering wrote:
> > This enables use of something else than the system 'python3' binary.
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > ---
> >  automation/scripts/build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index 34416297a4..5d806c235a 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -93,7 +93,7 @@ else
> >  
> >      # Qemu requires Python 3.8 or later, and ninja
> >      # and Clang 10 or later
> > -    if ! type python3 || ! python3 automation/scripts/qemu-deps-check.py \
> > +    if ! type "${PYTHON:-python3}" || ! "${PYTHON:-python3}" automation/scripts/qemu-deps-check.py \
> >              || [[ "$cc_is_clang" == y && "$cc_ver" -lt 0x0a0000 ]] \
> >              || ! type ninja; then
> >          cfgargs+=("--with-system-qemu=/bin/false")
> >
> 
> Thanks, but I'm just about to delete this whole construct in order to
> avoid wasting so much CI time doing redundant builds of QEMU.
> 
> I expect the end result to with your adjustment to the Leap container,
> with no change necessary here.
> 
> While I think it's useful to have Leap able to do builds of QEMU given
> how easy it is to fix, I'll be removing it by default from Gitlab runs. 
> We spend more than ~50% of wallclock time building QEMU, when 99% of
> changes aren't even liable to change the interaction with QEMU.

I agree with you 100%.

We could switch the default so that QEMU is not built unless explicitely
requested, maybe via a job variable similar to "debug" or
"HYPERVISOR_ONLY".
--8323329-1500325137-1728333199=:3512606--


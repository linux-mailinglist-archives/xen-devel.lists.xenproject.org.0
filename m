Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0040A3CEEB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 02:50:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893468.1302345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkvht-0000Ww-V4; Thu, 20 Feb 2025 01:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893468.1302345; Thu, 20 Feb 2025 01:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkvht-0000Ts-Rk; Thu, 20 Feb 2025 01:50:29 +0000
Received: by outflank-mailman (input) for mailman id 893468;
 Thu, 20 Feb 2025 01:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1Y=VL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkvhs-0000Tm-Eb
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 01:50:28 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b99cbcc-ef2d-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 02:50:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D946761254;
 Thu, 20 Feb 2025 01:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B30C4CED1;
 Thu, 20 Feb 2025 01:50:19 +0000 (UTC)
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
X-Inumbo-ID: 0b99cbcc-ef2d-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740016221;
	bh=qNuJM83904KqbX1uIS9/5U2LNQUWnjQU+xLe0odq8W0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nw5fXF6ov8D12i4TWU9WO6THZD/+gOQkIN7biCUA0mOj3LVGKMADV4qdynSA7Qims
	 ia7VNZA0DpcUaujaiE587q6CaDlKlEh+Ahb4B8Bu+qqAUqddb3n+oruTKW9dReVL2z
	 u4+TuFPqA19gYNenxTa9qNvisaWpJs2EWudHd7GvaDS2p5PV4Qa43zGo9wzedWCV34
	 Yen6A8csZcC6oEKOqkF5NarhtN7kTRWQhnlhxcuzpZNd07jEmtZachkWZhwWVYOqHP
	 82iAr5r93Piw1PTglzJ7po/GX+QSuN1DgtyuBTix2c16ykZTo0YNev3UfDT0V0mdBI
	 bzrqBwGE8SRiA==
Date: Wed, 19 Feb 2025 17:50:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <stefano@stabellini.net>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, oleksii.kurochko@gmail.com
Subject: Re: [PATCH] x86/MCE-telem: adjust cookie definition
In-Reply-To: <84298eb0-42cb-4967-b382-71cb309a7359@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2502191748470.1791669@ubuntu-linux-20-04-desktop>
References: <bd74b357-b254-4c43-a417-f26434361340@suse.com> <84298eb0-42cb-4967-b382-71cb309a7359@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Feb 2025, Andrew Cooper wrote:
> On 19/02/2025 10:00 am, Jan Beulich wrote:
> > struct mctelem_ent is opaque outside of mcetelem.c; the cookie
> > abstraction exists - afaict - just to achieve this opaqueness. Then it
> > is irrelevant though which kind of pointer mctelem_cookie_t resolves to.
> > IOW we can as well use struct mctelem_ent there, allowing to remove the
> > casts from COOKIE2MCTE() and MCTE2COOKIE(). Their removal addresses
> > Misra C:2012 rule 11.2 ("Conversions shall not be performed between a
> > pointer to an incomplete type and any other type") violations.
> >
> > No functional change intended.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9181587757
> 
> Eclair does appear to be happy with this approach (assuming I stripped
> down to only checking R11.2 correctly, and making it fatal).
> 
> For the change itself, it's an almost identical binary, differing only
> in the string section which I expect means some embedded line numbers.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thank you very much Jan for writing the patch, and thank you Andrew for
running the pipeline. It is great that resolves all the 11.2 issues!

Oleksii, may I ask for a release-ack? I'll follow up with a patch to
mark 11.2 as clean.


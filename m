Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F297E7569
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 01:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629854.982376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Ewm-00036Q-47; Fri, 10 Nov 2023 00:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629854.982376; Fri, 10 Nov 2023 00:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Ewm-00033d-1A; Fri, 10 Nov 2023 00:00:28 +0000
Received: by outflank-mailman (input) for mailman id 629854;
 Fri, 10 Nov 2023 00:00:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1Ewk-00014F-Vn
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 00:00:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 255c03f9-7f5c-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 01:00:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E20DCCE13E7;
 Fri, 10 Nov 2023 00:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C7CC433C7;
 Fri, 10 Nov 2023 00:00:20 +0000 (UTC)
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
X-Inumbo-ID: 255c03f9-7f5c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699574422;
	bh=By+pMrXemlq7cVeYwvlSeGT+b8QGbikZMi2gAEywrKI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A/bFUlvw7GdxpkqFgoanvvw9/Fo9QzYOQsjj0n3CkxZI0iLut7SeOk6fTYbgUpWLx
	 /BnEQC67A560dpc4dk3dVQ+DnSetvPDpRzqIoIKI/1pp+Q6/FQszGAHKSth9t5/QOV
	 lr7eQ8itdE0pwlWkSpIndecG6LgwjSWNvWi2koW8JrRr2CJ+4W069atZIheW3yb5Pd
	 oBOIY48Et6BjwWtRZH0OrhzumoaKn3kz6ZJSltw3FcePPUMwuIFapQWxoAD+OMUM79
	 wmOBfc+Cuavv6cBfEffb8mvgXIbCfjzZFLmLWHDT3PeVwoU1KRcCxFoUosh0z4Obho
	 jSVoYN6Ra/tiQ==
Date: Thu, 9 Nov 2023 16:00:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18 2/3] docs/sphinx: Fix syntax issues in
 exclude-list.rst
In-Reply-To: <4477F755-39D5-4560-98F1-92D37343088F@arm.com>
Message-ID: <alpine.DEB.2.22.394.2311091600120.3478774@ubuntu-linux-20-04-desktop>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com> <20231108152727.58764-3-andrew.cooper3@citrix.com> <4477F755-39D5-4560-98F1-92D37343088F@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Nov 2023, Luca Fancellu wrote:
> > On 8 Nov 2023, at 15:27, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> > 
> > sphinx-build reports:
> > 
> >  docs/misra/exclude-list.rst:47: WARNING: Unexpected indentation.
> >  docs/misra/exclude-list.rst:50: WARNING: Inline emphasis start-string without end-string.
> > 
> > Nested lists require newlines as delimiters, and * either needs escaping, or
> > put in a literal block.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> 
> Thanks for that.
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EBA4466A1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 17:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222524.384775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1dX-00077Z-BD; Fri, 05 Nov 2021 16:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222524.384775; Fri, 05 Nov 2021 16:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj1dX-000752-7L; Fri, 05 Nov 2021 16:00:15 +0000
Received: by outflank-mailman (input) for mailman id 222524;
 Fri, 05 Nov 2021 16:00:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mj1dV-00074d-Li
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 16:00:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mj1dV-0002ct-L2
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 16:00:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mj1dV-0006UQ-K5
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 16:00:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mj1dQ-0006XM-F7; Fri, 05 Nov 2021 16:00:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=cuLXzqj2MTmxb5XVYiKnZ8/NeOInZqx3U7QuSrUiu7Q=; b=xFB5ePKfoiTfnK3LbJnyG129G2
	ygSXrAy4V9VjIXgL4MOtdpjdXvXdAPrgLGctfTlK3sdlsfzl4lW7sMth7eyjRTv6bjX5qJLCmHXri
	CikbpbREkdU3w3uAMYIe6X6AScF7q5VquudWZfJ11KH3L1bEYI3P47GGz9hVUAYBrGH8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24965.21767.924957.937812@mariner.uk.xensource.com>
Date: Fri, 5 Nov 2021 16:00:07 +0000
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei  Chen <Wei.Chen@arm.com>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Volodymyr  Babchuk <Volodymyr_Babchuk@epam.com>,
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH-4.16 v4] xen/efi: Fix Grub2 boot on arm64
In-Reply-To: <445836DF-C831-4478-B4C7-2D98E2258FD2@arm.com>
References: <20211105130728.30648-1-luca.fancellu@arm.com>
	<445836DF-C831-4478-B4C7-2D98E2258FD2@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("Re: [PATCH-4.16 v4] xen/efi: Fix Grub2 boot on arm64"):
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks all, pushed.

Ian.


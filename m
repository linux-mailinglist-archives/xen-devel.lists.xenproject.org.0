Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B191311D
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 02:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745694.1152845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKoOC-00015G-JR; Sat, 22 Jun 2024 00:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745694.1152845; Sat, 22 Jun 2024 00:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKoOC-00012j-GF; Sat, 22 Jun 2024 00:13:56 +0000
Received: by outflank-mailman (input) for mailman id 745694;
 Sat, 22 Jun 2024 00:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wyV=NY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKoOA-00012d-N5
 for xen-devel@lists.xenproject.org; Sat, 22 Jun 2024 00:13:54 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cd1f1cc-302c-11ef-b4bb-af5377834399;
 Sat, 22 Jun 2024 02:13:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 97895CE2F7A;
 Sat, 22 Jun 2024 00:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C156EC2BBFC;
 Sat, 22 Jun 2024 00:13:46 +0000 (UTC)
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
X-Inumbo-ID: 4cd1f1cc-302c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719015227;
	bh=7yhRQT5eBXXEddwfBMGGPFjRWUfBzhE8kFFVp2IGuk0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TzTYSkzeqKT0DsucOOR5bLwPxtevcyJZRAvLfZKiZuHb2lDzLIO4jRULqcKbysIwC
	 u7QD59QmwzYpnYWQ/3DTWVbU31Ho4FFr/8gCaibQ1lAlJjxa6fqBTMyF1GIfSzwJ+B
	 mD9MmZNDonexhZu/hloPJEDkxp+ww57zUrmzauG2q3IMMroBDwiGQwgEuHaTIzzn7T
	 hrpRQUKrYXxgBw47mZssBQnxZ9p+e10oAK9Rb+4fqdrr+Jlnn6IQolZw6mXs3v0Cay
	 U0ehkW6/tJ+NANQ+QVj3ESaXIxJ7OB8ojhXeds9HiaJZGxXVLL42UL1GZiio3Hesp2
	 wR+Aj4viwMEPg==
Date: Fri, 21 Jun 2024 17:13:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com, 
    bertrand.marquis@arm.com, roger.pau@citrix.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: rules for mass adoption
In-Reply-To: <19073c21-d878-4d8d-95d8-90f567688ed5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406211711410.2572888@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405221822500.1052252@ubuntu-linux-20-04-desktop> <19073c21-d878-4d8d-95d8-90f567688ed5@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 May 2024, Jan Beulich wrote:
> On 23.05.2024 03:26, Stefano Stabellini wrote:
> > @@ -725,12 +787,25 @@ maintainers if you want to suggest a change.
> >       - The Standard Library function system of <stdlib.h> shall not be used
> >       -
> >  
> > +   * - `Rule 22.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_01.c>`_
> > +     - Required
> > +     - All resources obtained dynamically by means of Standard Library
> > +       functions shall be explicitly released
> > +     -
> > +     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
> 
> The empty sub-bullet-point looks stray here.

Good catch, thanks!


> > @@ -748,6 +823,31 @@ maintainers if you want to suggest a change.
> >         stream has been closed
> >       -
> >  
> > +   * - `Rule 22.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_07.c>`_
> > +     - Required
> > +     - The macro EOF shall only be compared with the unmodified return
> > +       value from any Standard Library function capable of returning EOF
> > +     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
> 
> Shouldn't this remark also be replicated ...
> 
> > +   * - `Rule 22.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_08.c>`_
> > +     - Required
> > +     - The value of errno shall be set to zero prior to a call to an
> > +       errno-setting-function
> > +     -
> > +
> > +   * - `Rule 22.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_09.c>`_
> > +     - Required
> > +     - The value of errno shall be tested against zero after calling an
> > +       errno-setting-function
> > +     -
> > +
> > +   * - `Rule 22.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_10.c>`_
> > +     - Required
> > +     - The value of errno shall only be tested when the last function to
> > +       be called was an errno-setting-function
> > +     -
> 
> ... for all three of these, seeing that errno is something a (standard) library
> would provide? Or alternatively should remarks here say that we simply have no
> errno?

I'll replicate the full message


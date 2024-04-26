Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65348B412F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 23:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713129.1114140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0T9a-0003bM-Sh; Fri, 26 Apr 2024 21:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713129.1114140; Fri, 26 Apr 2024 21:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0T9a-0003Zq-Pd; Fri, 26 Apr 2024 21:30:46 +0000
Received: by outflank-mailman (input) for mailman id 713129;
 Fri, 26 Apr 2024 21:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0T9Z-0003Zk-JO
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 21:30:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b8a372d-0414-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 23:30:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E694BCE1C9E;
 Fri, 26 Apr 2024 21:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 150CFC113CD;
 Fri, 26 Apr 2024 21:30:38 +0000 (UTC)
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
X-Inumbo-ID: 3b8a372d-0414-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714167040;
	bh=KuZrzePDx3IQeSR3GmLLHPypu6d2IF939/mGwfk6B14=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o7PasOOj1G/Z0TRnLcZwYzoUI8NxoGZfBGbgWr88Kc2WcTJKeJV0zxfYTXD0gkEDR
	 7qcs27AuvhmL0SGnd1OlXE/DZHiB2fl5T0vFeKj8edEeyld8kbRZNzXgtq6gWtzMjD
	 GcCJ/8z+AIw/H52KUK+cDByvmwWovX+nrOzBGqGiPaW3As511BzJ8NHZ1VZserezVs
	 5LCOmbthYvcTTZ63BCGxcwQwy/dYzEBIYEhAYsidp3x38HxNvG81TkN/wurgJp4aYV
	 NRsRnIaJHHEYl7GBzoC2RYwhQTaMtlZ4bKk8srT3LOKq+xpceUCt1FQCMS/5ZxknPR
	 AsEJeQ1ziq2Yw==
Date: Fri, 26 Apr 2024 14:30:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: add R21.6 R21.9 R21.10 R21.14 R21.15
 R21.16
In-Reply-To: <d620ef7a-661a-4706-8a05-1724e28e2d4f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404261429370.3940@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404251629570.3940@ubuntu-linux-20-04-desktop> <d620ef7a-661a-4706-8a05-1724e28e2d4f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Apr 2024, Jan Beulich wrote:
> On 26.04.2024 01:31, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -652,12 +652,72 @@ maintainers if you want to suggest a change.
> >         declared
> >       - See comment for Rule 21.1
> >  
> > +   * - `Rule 21.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_06.c>`_
> > +     - Required
> > +     - The Standard Library input/output routines shall not be used
> > +     - Xen doesn't provide, use, or link against any Standard Library.
> > +       Xen implements itself a few functions with names that match the
> > +       corresponding function names of the Standard Library for
> > +       developers' convenience. These functions are part of the Xen code
> > +       and subject to analysis.
> > +
> > +   * - `Rule 21.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_09.c>`_
> > +     - Required
> > +     - The library functions bsearch and qsort of <stdlib.h> shall not be used
> > +     - Xen doesn't provide, use, or link against any Standard Library.
> > +       Xen implements itself a few functions with names that match the
> > +       corresponding function names of the Standard Library for
> > +       developers' convenience. These functions are part of the Xen code
> > +       and subject to analysis.
> > +
> > +   * - `Rule 21.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_10.c>`_
> > +     - Required
> > +     - The Standard Library time and date routines shall not be used
> > +     - Xen doesn't provide, use, or link against any Standard Library.
> > +       Xen implements itself a few functions with names that match the
> > +       corresponding function names of the Standard Library for
> > +       developers' convenience. These functions are part of the Xen code
> > +       and subject to analysis.
> > +
> >     * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_13.c>`_
> >       - Mandatory
> >       - Any value passed to a function in <ctype.h> shall be representable as an
> >         unsigned char or be the value EOF
> >       -
> 
> Up to here, did you consider adding a short reference to some common blob
> (footnote or alike), rather than repeating the same text verbatim several
> times?

I can look into it


> > +   * - `Rule 21.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_14.c>`_
> > +     - Required
> > +     - The Standard Library function memcmp shall not be used to compare
> > +       null terminated strings
> > +     - Xen doesn't provide, use, or link against any Standard Library.
> > +       Xen implements itself a few functions with names that match the
> > +       corresponding function names of the Standard Library for
> > +       developers' convenience. These functions are part of the Xen code
> > +       and subject to analysis.
> > +
> > +   * - `Rule 21.15 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_15.c>`_
> > +     - Required
> > +     - The pointer arguments to the Standard Library functions memcpy,
> > +       memmove and memcmp shall be pointers to qualified or unqualified
> > +       versions of compatible types
> > +     - Xen doesn't provide, use, or link against any Standard Library.
> > +       Xen implements itself a few functions with names that match the
> > +       corresponding function names of the Standard Library for
> > +       developers' convenience. These functions are part of the Xen code
> > +       and subject to analysis.
> > +
> > +   * - `Rule 21.16 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_16.c>`_
> > +     - Required
> > +     - The pointer arguments to the Standard Library function memcmp
> > +       shall point to either a pointer type, an essentially signed type,
> > +       an essentially unsigned type, an essentially Boolean type or an
> > +       essentially enum type
> > +     - void* arguments are allowed. Xen doesn't provide, use, or link
> > +       against any Standard Library.  Xen implements itself a few
> > +       functions with names that match the corresponding function names
> > +       of the Standard Library for developers' convenience. These
> > +       functions are part of the Xen code and subject to analysis.
> 
> For all three of these I'm not convinced the remark is appropriate. These
> talk about specific properties of the functions, which aren't related to
> risks associated with particular (and hence potentially varying) library
> implementations.

Good point


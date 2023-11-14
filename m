Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBE77EB97D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 23:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633369.988102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r322c-0001pa-Ob; Tue, 14 Nov 2023 22:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633369.988102; Tue, 14 Nov 2023 22:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r322c-0001nn-K6; Tue, 14 Nov 2023 22:37:54 +0000
Received: by outflank-mailman (input) for mailman id 633369;
 Tue, 14 Nov 2023 22:37:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r322b-0001nh-BA
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 22:37:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 712443b3-833e-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 23:37:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E53E2614BE;
 Tue, 14 Nov 2023 22:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F600C433C9;
 Tue, 14 Nov 2023 22:37:47 +0000 (UTC)
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
X-Inumbo-ID: 712443b3-833e-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700001469;
	bh=yOE4bTOxcIO+/lKvnL6+2Wwcmz1beT1Zmcaf1EQj4TE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gIM1RGIaBipC2M41XT3S1Zx/1MDGNaZSU3hnhqHnI962A7Lj7dJlI2UsmkB9nhZ++
	 ZyRSmyrsHzIVFg6lzEWIx1YR1HWRRgpcW076zx5/c+i5XTnM1vBJJoLYdjf8ND3KmJ
	 KbIWaz1WyEExlSCJ5NvPxGWJr+HJd5TleFSoGtJ45/Cgr0p+Lvss2tH3Rn0uxcQxm7
	 1Nk7zE0cx6hjS96ikr53Md0r7QgBsnHmOzSafSVxgZbtxaUWZEOk25AhNME0nvs/tp
	 cNBWzhKxqHDnUqtSKiwqCVMgfF38+ylwsxmNOTyi3cuX+27fxe3u5qV0m8zuRzunag
	 EFigo1tbK/VeQ==
Date: Tue, 14 Nov 2023 14:37:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add R11.1 R11.2 R11.3 R11.6
In-Reply-To: <6695fcfb-0762-e48b-69d2-3871a3acaad6@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311141431090.160649@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2311131540490.160649@ubuntu-linux-20-04-desktop> <6695fcfb-0762-e48b-69d2-3871a3acaad6@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Nov 2023, Jan Beulich wrote:
> On 14.11.2023 00:44, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -383,6 +383,38 @@ maintainers if you want to suggest a change.
> >  
> >         CFLAGS="-Warith-conversion -Wno-error=arith-conversion" make -C xen
> >  
> > +   * - `Rule 11.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_01.c>`_
> > +     - Required
> > +     - Conversions shall not be performed between a pointer to a
> > +       function and any other type
> > +     - All conversions to integer types are permitted if the destination
> > +       type has enough bits to hold the entire value. Conversions to
> > +       bool and void* are permitted.
> > +
> > +   * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_02.c>`_
> > +     - Required
> > +     - Conversions shall not be performed between a pointer to an
> > +       incomplete type and any other type
> > +     - All conversions to integer types are permitted if the destination
> > +       type has enough bits to hold the entire value. Conversions to
> > +       bool and void* are permitted.
> 
> Assuming the rule's exception 2 really means void, not void*, the mentioning
> of void* here is still fine.
> 
> > +   * - `Rule 11.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_03.c>`_
> > +     - Required
> > +     - A cast shall not be performed between a pointer to object type
> > +       and a pointer to a different object type
> > +     - All conversions to integer types are permitted if the destination
> > +       type has enough bits to hold the entire value. Conversions to
> > +       bool and void* are permitted.
> 
> Here and ...
> 
> > +   * - `Rule 11.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_06.c>`_
> > +     - Required
> > +     - A cast shall not be performed between pointer to void and an
> > +       arithmetic type
> > +     - All conversions to integer types are permitted if the destination
> > +       type has enough bits to hold the entire value. Conversions to
> > +       bool and void* are permitted.
> 
> ... here, however I consider its mentioning misleading: "void" is neither
> an object type nor an arithmetic one.

Yes I think here it is misleading. I'll remove the mention of void* for
Rule 11.6. I'll keep it for Rule 11.1 and 11.2.

For Rule 11.3, I think I should remove the entire note as it is not
helpful.


---
[PATCH v2] docs/misra: add R11.1 R11.2 R11.3 R11.6

Add MISRA C Rules 11.1, 11.2, 11.3, 11.6 as discussed.

Explicitly add in the notes that conversions to integer types are
permitted if the destination type has enough bits to hold the entire
value. GCC gives enough guarantees in terms of preserving the bit
content in such situations.

Also allow for bool conversions (e.g. to check if a function point is
valid).

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index aa65eb4dd0..da343ab3ac 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -383,6 +383,36 @@ maintainers if you want to suggest a change.
 
        CFLAGS="-Warith-conversion -Wno-error=arith-conversion" make -C xen
 
+   * - `Rule 11.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_01.c>`_
+     - Required
+     - Conversions shall not be performed between a pointer to a
+       function and any other type
+     - All conversions to integer types are permitted if the destination
+       type has enough bits to hold the entire value. Conversions to
+       bool and void* are permitted.
+
+   * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_02.c>`_
+     - Required
+     - Conversions shall not be performed between a pointer to an
+       incomplete type and any other type
+     - All conversions to integer types are permitted if the destination
+       type has enough bits to hold the entire value. Conversions to
+       bool and void* are permitted.
+
+   * - `Rule 11.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_03.c>`_
+     - Required
+     - A cast shall not be performed between a pointer to object type
+       and a pointer to a different object type
+     -
+
+   * - `Rule 11.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_06.c>`_
+     - Required
+     - A cast shall not be performed between pointer to void and an
+       arithmetic type
+     - All conversions to integer types are permitted if the destination
+       type has enough bits to hold the entire value. Conversions to
+       bool are permitted.
+
    * - `Rule 11.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_07.c>`_
      - Required
      - A cast shall not be performed between pointer to object and a noninteger arithmetic type


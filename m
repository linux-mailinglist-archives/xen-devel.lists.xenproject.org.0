Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5FCA9BA18
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 23:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966960.1357001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u84O0-0008LM-8T; Thu, 24 Apr 2025 21:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966960.1357001; Thu, 24 Apr 2025 21:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u84O0-0008Ju-5o; Thu, 24 Apr 2025 21:45:36 +0000
Received: by outflank-mailman (input) for mailman id 966960;
 Thu, 24 Apr 2025 21:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TIdu=XK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u84Nz-0008Jo-EB
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 21:45:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7160a5d4-2155-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 23:45:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E9DF5C6455;
 Thu, 24 Apr 2025 21:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D04C4CEE3;
 Thu, 24 Apr 2025 21:45:27 +0000 (UTC)
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
X-Inumbo-ID: 7160a5d4-2155-11f0-9eb2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745531129;
	bh=NH2QybXHWDNMEW5RZOv6zK78L8kGBZTir3hPbfvNj7A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LdGYiODovzAWuHWGmq/KWgJoYmyyHqLkxLYcjt2KgHV7A6thdD7839nJaGRwNPsco
	 dt94tMtDJ60+HeQusjKYNgDjnwvt4+TDCN6SEREv9QLv9WHFlX3IYEUazIdjroy5ca
	 Cj8aqOXhsuXHj4qNEN0LQzFnvbrKpoQL+F7W/JkIoTut/DIZU5RRwV2t0e7cgweYTd
	 l0VmSpI9k/8KpjVEL1rPm0mViwLZNsKB1BUZlASxY5QT0OA/M6bPr9sKB1elg3vBNZ
	 GkqDWC58v9PinoWM+rFFE6vbooK8/9QAQc/Cuy4W0eIrmxDIUx7CCGfphlC6EaNScl
	 k/D/rgvS3utoQ==
Date: Thu, 24 Apr 2025 14:45:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
In-Reply-To: <f5d35582-9270-4816-84c2-f078afeee711@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504241443550.785180@ubuntu-linux-20-04-desktop>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com> <f5d35582-9270-4816-84c2-f078afeee711@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Apr 2025, Jan Beulich wrote:
> On 23.04.2025 19:54, victorm.lira@amd.com wrote:
> > From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > MISRA C Rules 21.1 ("#define and #undef shall not be used on a
> > reserved identifier or reserved macro name") and R21.2 ("A reserved
> > identifier or reserved macro name shall not be declared") violations
> > are not problematic for Xen, as it does not use the C or POSIX
> > libraries.
> > 
> > Xen uses -fno-builtin and -nostdinc to ensure this, but there are still
> > __builtin_* functions from the compiler that are available so
> > a deviation is formulated for all identifiers not starting with
> > "__builtin_".
> > 
> > The missing text of a deviation for Rule 21.2 is added to
> > docs/misra/deviations.rst.
> > 
> > To avoid regressions, tag both rules as clean and add them to the
> > monitored set.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > Signed-off-by: Victor Lira <victorm.lira@amd.com>
> 
> While the rule is in the library section, ...
> 
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
> >         construct is deviated only in Translation Units that present a violation
> >         of the Rule due to uses of this macro.
> >       - Tagged as `deliberate` for ECLAIR.
> > -
> > +
> > +   * - R21.1
> > +     - Rule 21.1 reports identifiers reserved for the C and POSIX standard
> > +       libraries. Xen does not use such libraries and all translation units
> > +       are compiled with option '-nostdinc', therefore there is no reason to
> > +       avoid to use `#define` or `#undef` on such identifiers except for those
> > +       beginning with `__builtin_` for which compilers may perform (wrong)
> > +       optimizations.
> > +     - Tagged as `safe` for ECLAIR.
> 
> ... I'd like to ask that it be explicitly clarified here that it's solely
> the library (and not e.g. the compiler itself) that are of concern here.

The language can be clarified:

- Rule 21.1 reports identifiers reserved for the C and POSIX standard
  libraries. Xen does not use such libraries and all translation units
  are compiled with option '-nostdinc', therefore there is no reason to
  avoid to use `#define` or `#undef` on C and POSIX standard libraries
  identifiers except for those beginning with `__builtin_` for which
  compilers may perform (wrong) optimizations.



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB51546F36
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 23:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346739.572645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzm7r-0007fu-DE; Fri, 10 Jun 2022 21:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346739.572645; Fri, 10 Jun 2022 21:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzm7r-0007dV-9J; Fri, 10 Jun 2022 21:25:03 +0000
Received: by outflank-mailman (input) for mailman id 346739;
 Fri, 10 Jun 2022 21:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tsmg=WR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nzm7p-0007dM-RN
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 21:25:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8498ad1-e903-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 23:25:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49949B83755;
 Fri, 10 Jun 2022 21:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6A4C34114;
 Fri, 10 Jun 2022 21:24:56 +0000 (UTC)
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
X-Inumbo-ID: c8498ad1-e903-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654896298;
	bh=8vEeMnpQVQgn+XTr3cOzHqPBLBaipdXvRgKvW91D8h0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C3+UbP9yiqyz+XDayfuDgvITF2N4I36PMINj/jO6GWC8MfX2i04juB6Z1Q4b1nbCh
	 Dx6LkNeFBwGpXLwR0bISrz9RmAVBQ14zBeKXLaKMkIktYv8K/36SvF01lC04BCAyeB
	 aTWxBbJD6XplS0E5mnxKSooHGOCDxkX9h9ZzRw5ncGdciisxQHaCIeCLHf2xcqWKIG
	 Yoxmtuu+X4qNlNyTkKF+Jgj0TGjhz17B5RI80+tV4quO8olZqCnCzgJcVTYeEybhCa
	 5Ru1eq3yGYspXW/m69oPoc204MlBRHgvW1pFVglyEvefc/d9ENI6U+2BDHz0u32nZs
	 rO2W9KMeOnnyw==
Date: Fri, 10 Jun 2022 14:24:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, George.Dunlap@citrix.com, 
    roger.pau@citrix.com, Artem_Mygaiev@epam.com, Andrew.Cooper3@citrix.com, 
    julien@xen.org, Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] add more MISRA C rules to docs/misra/rules.rst
In-Reply-To: <c61f607b-bfdd-3162-7b26-b4681b4cce59@suse.com>
Message-ID: <alpine.DEB.2.22.394.2206101420290.756493@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop> <c61f607b-bfdd-3162-7b26-b4681b4cce59@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Jun 2022, Jan Beulich wrote:
> On 10.06.2022 02:48, Stefano Stabellini wrote:
> > +   * - `Rule 5.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_03.c>`_
> > +     - Required
> > +     - An identifier declared in an inner scope shall not hide an
> > +       identifier declared in an outer scope
> > +     - Using macros as macro parameters at invocation time is allowed,
> > +       e.g. MAX(var0, MIN(var1, var2))
> 
> I think the connection between the example and the rule could be made more
> clear, e.g. by adding "... even if both macros use identically named local
> variables".

Yep, I'll add


> > +   * - `Rule 14.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_01.c>`_
> > +     - Required
> > +     - A loop counter shall not have essentially floating type
> 
> This looks to be missing "point"?

I am not sure what you mean. Do you mean "floating-point" instead of
"floating" ?

This is the actual headline for Rule 14.1. MISRA defines "Essential
types" (8.10.2), so in this case it is referring to the type
"essentially floating", which includes float, double and long double.

If you meant something different, I'll address it in the next version of
the patch.

Cheers,

Stefano


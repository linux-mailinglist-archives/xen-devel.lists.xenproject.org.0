Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B5945279
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 20:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769918.1180797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZa5w-0005Gu-Bs; Thu, 01 Aug 2024 18:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769918.1180797; Thu, 01 Aug 2024 18:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZa5w-0005F1-8d; Thu, 01 Aug 2024 18:00:08 +0000
Received: by outflank-mailman (input) for mailman id 769918;
 Thu, 01 Aug 2024 18:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SIAI=PA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sZa5u-0003yj-QB
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 18:00:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e10c8e31-502f-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 20:00:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4BF4628B2;
 Thu,  1 Aug 2024 18:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52ECFC32786;
 Thu,  1 Aug 2024 18:00:02 +0000 (UTC)
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
X-Inumbo-ID: e10c8e31-502f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722535203;
	bh=9vXy1lbBgI84RpBNbMnqBJhbGyNY0ZEyIqugp0pKwUA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u1hMsOAOMjETrDcYHbRtpzgnwrS0cjKnvdTtAAzVl2bGFi5NlQA9YNZeBTCSlDwXM
	 B7UqrY2uSu4hG6L1WgdCujT3tF74OC9VKv6i0+ftSJkGeBqYvKXbrMhQYKI1dGEJKh
	 qiqdYYIVCj5pT4Nz6lFrr7YcmlSVn/xiVGFj2GWLEfv9xcld0jtSNL8VGHgfaaOUSU
	 Mt8IdC9OLt1ajVhqFJkG1vaQ/2t0zw+IKe4kCu2ojHwyhZYdA6k6ntKba2vxALY1Ft
	 ClwRQI1dwGU4nDcj32+28TAHFMAVSXWHpTCuMc/oX/nSe3FyOddjKUeX4Qx7Qduywh
	 KJHZZuoegPkiA==
Date: Thu, 1 Aug 2024 11:00:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] docs/misra: add R13.2 and R18.2 to rules.rst
In-Reply-To: <83ABB601-629D-4D95-B124-E50896EB12B0@arm.com>
Message-ID: <alpine.DEB.2.22.394.2408011044050.4857@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2407301626460.4857@ubuntu-linux-20-04-desktop> <6575beb5-645a-470a-89a1-8485adeace60@suse.com> <alpine.DEB.2.22.394.2407311647170.4857@ubuntu-linux-20-04-desktop> <83ABB601-629D-4D95-B124-E50896EB12B0@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Aug 2024, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 1 Aug 2024, at 01:50, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 31 Jul 2024, Jan Beulich wrote:
> >> On 31.07.2024 01:30, Stefano Stabellini wrote:
> >>> --- a/docs/misra/rules.rst
> >>> +++ b/docs/misra/rules.rst
> >>> @@ -462,6 +462,15 @@ maintainers if you want to suggest a change.
> >>>      - Initializer lists shall not contain persistent side effects
> >>>      -
> >>> 
> >>> +   * - `Rule 13.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_02.c>`_
> >>> +     - Required
> >>> +     - The value of an expression and its persistent side-effects shall
> >>> +       be the same under all permitted evaluation orders
> >>> +     - Be aware that the static analysis tool Eclair might report
> >>> +       several findings for Rule 13.2 of type "caution". These are
> >>> +       instances where Eclair is unable to verify that the code is valid
> >>> +       in regard to Rule 13.2. Caution reports are not violations.
> >> 
> >> Which doesn't make clear what our take is towards new code people may
> >> submit.
> > 
> > Good point, see my comment below
> > 
> > 
> >>> @@ -583,6 +592,15 @@ maintainers if you want to suggest a change.
> >>>        submitting new patches please try to decrease the number of
> >>>        violations when possible.
> >>> 
> >>> +   * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_02.c>`_
> >>> +     - Required
> >>> +     - Subtraction between pointers shall only be applied to pointers
> >>> +       that address elements of the same array
> >>> +     - Be aware that the static analysis tool Eclair might report
> >>> +       several findings for Rule 18.2 of type "caution". These are
> >>> +       instances where Eclair is unable to verify that the code is valid
> >>> +       in regard to Rule 18.2. Caution reports are not violations.
> >> 
> >> And while the same wording is used here, I think it is pretty clear for
> >> this that we'd reject changes where bad subtractions are used. IOW even
> >> more so important to clarify the (possibly different) positions on what
> >> is going to be added into the code base.
> > 
> > In both of these cases, we would reject code that doesn't follow R13.2
> > and R18.2. I'll change it to the following:
> > 
> > 
> > Be aware that the static analysis tool Eclair might report several
> > findings for Rule 18.2 of type "caution". These are instances where
> > Eclair is unable to verify that the code is valid in regard to Rule
> > 18.2. Caution reports are not violations. Regardless, new code is
> > expected to follow this rule.
> 
> I think that in both cases it is wrong to state that "cautions reported are
> not violations" where those are cases where the tool is not sure so they
> might be or not violations.
> So I would change the sentence to "cautions might not be violations. The
> rule should be followed in any case in new code submitted".

I am happy with your wording, I'll make the change


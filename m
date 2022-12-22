Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050DB653A73
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 03:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468174.727244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Au0-00070o-LU; Thu, 22 Dec 2022 02:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468174.727244; Thu, 22 Dec 2022 02:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Au0-0006z3-Hu; Thu, 22 Dec 2022 02:01:44 +0000
Received: by outflank-mailman (input) for mailman id 468174;
 Thu, 22 Dec 2022 02:01:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpfT=4U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p8Aty-0006yx-K0
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 02:01:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 938804d6-819c-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 03:01:41 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F7A6B81B9C;
 Thu, 22 Dec 2022 02:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB0FC433EF;
 Thu, 22 Dec 2022 02:01:37 +0000 (UTC)
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
X-Inumbo-ID: 938804d6-819c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671674498;
	bh=KO2wtHGuQouw8GsBu6ZJV6YyKnOe9jmopODWHN89s9s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ADTx7vW7DXr+yUsFgiVA7kGRmyUGbZok6C7L7OzE8+AgXkOqvawSMTWFsagw0Anbz
	 mqnSqBf47u3woJvz3BxOYRDTpp/n6kSx3udfQs+mgq7FICk4/JFfhpFefBkfVfRL9I
	 Tak/stTf2e00p/Kem2tXd9Mq77dLYjZzfs93dvX+wTZSXjhlMaN0S22dwEu0jo0IVC
	 vjm0H7Fi/eC8IcUxA3V3mFimn3ApnOi2+0IDKZUk8Z76RVXilKZKALFOXMuj2qhOxV
	 1/NA5uwHA2GTFVkMLsRoLnEZFiQGngZWRAnHtuRGAU1YsDqewypPZgpyl9NlD+2tn3
	 /tu+WBWZeNvDQ==
Date: Wed, 21 Dec 2022 18:01:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org, 
    wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 01/18] arm: cppcheck: misra rule 20.7 deviations for
 alternative.h
In-Reply-To: <072a9427-57aa-81ef-1f7e-7f0b5f26e5c6@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212211731450.4079@ubuntu-linux-20-04-desktop>
References: <20221220085100.22848-1-luca.fancellu@arm.com> <20221220085100.22848-2-luca.fancellu@arm.com> <072a9427-57aa-81ef-1f7e-7f0b5f26e5c6@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Dec 2022, Julien Grall wrote:
> Hi Luca,
> 
> On 20/12/2022 08:50, Luca Fancellu wrote:
> > Cppcheck reports violations of rule 20.7 in two macros of
> > alternative.h.
> > 
> > The first one is in the __ALT_PTR macro where cppcheck wants to have
> > parentheses on the second operand of a member access operator, which
> > is not allowed from the c language syntax, furthermore, the macro
> > parameter is never used as an expression, hence we can suppress the
> > finding.
> 
> Looking at the Misra Rule 20.7 examples [1], this looks similar to
> GET_MEMBER(). So I don't understand why cppcheck is complaining.
> 
> > 
> > The second finding is in the __ALTERNATIVE_CFG macro, where cppcheck
> > wants to have parentheses on the macro arguments, but the macro
> > parameters are never used as expressions and are used only for text
> > substitution, so cppcheck is not taking into account the context of
> > use of the macro arguments and adding parenthesis would break the
> > code, so we can suppress the finding.
> 
> This reads like you want to report a bug against cppcheck.

+1

 
> > No error was shown by eclair and coverity for those lines.
> > 
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > ---
> >   docs/misra/false-positive-cppcheck.json | 14 ++++++++++++++
> >   xen/arch/arm/include/asm/alternative.h  |  2 ++
> 
> This file is meant to be close to Linux. From my understanding of the
> discussion yesterday, we didn't want to add deviation there.

Yeah. We are still finalizing the list of Linux files in Xen
(https://marc.info/?l=xen-devel&m=166859007703945) so we don't have a
programmatic way to check if something should be scanned or not. At the
moment it is easy to make mistakes. I hope will get it committed soon,
then we can blacklist anything listed under
docs/misra/external-files.txt (automatically ask cppcheck to avoid
scanning files listed in docs/misra/external-files.txt).


> >   2 files changed, 16 insertions(+)
> > 
> > diff --git a/docs/misra/false-positive-cppcheck.json
> > b/docs/misra/false-positive-cppcheck.json
> > index 5d4da2ce6170..5e7d9377f60b 100644
> > --- a/docs/misra/false-positive-cppcheck.json
> > +++ b/docs/misra/false-positive-cppcheck.json
> > @@ -3,6 +3,20 @@
> >       "content": [
> >           {
> >               "id": "SAF-0-false-positive-cppcheck",
> > +            "violation-id": "misra-c2012-20.7",
> > +            "tool-version": "2.7",
> > +            "name": "R20.7 second operand of member-access operator",
> > +            "text": "The second operand of a member access operator shall
> > be a name of a member of the type pointed to, so in this particular case it
> > is wrong to use parentheses on the macro parameter."
> > +        },
> > +        {
> > +            "id": "SAF-1-false-positive-cppcheck",
> > +            "violation-id": "misra-c2012-20.7",
> > +            "tool-version": "2.7",
> > +            "name": "R20.7 C macro parameters used only for text
> > substitution",
> > +            "text": "The macro parameters used in this case are not part of
> > an expression, they are used for text substitution."
> > +        },
> In both cases the constructs are commonly used in Xen to generate code. So I
> am a bit concerned to have to add deviation everywhere cppcheck is wrong.
> 
> More generally, we are still at the beginning of MISRA in Xen and I don't
> think we should start with adding deviations from bugs in the tools. Instead,
> we should report those bugs and hopefully by the time Xen is mostly MISRA
> complaint the tools will not report the false positive.
> 
> If they are still then we can decide to add deviations.

I also think we should report cppcheck bugs.

That said, I think the reason why Luca submitted this series is that we
are actually not far from having cppcheck running automatically as part
of gitlab-ci to scan staging and new patches.

Enabling automatic cppcheck scans is something within our reach, I'd say
it is only few weeks away. That's actually going to start giving some
concrete benefits for our work on MISRA C. We'll get automatic bug
reports and quality reports, which is pretty cool.

Aside from the list of Linux files, we also need to deal with false
positives otherwise the reports will be too "noisy". If we correctly
silence the outstanding false-positive cppcheck reports, we can actually
have a clean "zero issues" report by cppcheck on staging with the
current list of MISRA C rules supported by docs/misra/rules.rst.

And there are only few cppcheck false positives to deal with. Most of
them are for Rule 20.7. During the last FuSa call, I actually suggested
to skip Rule 20.7 when it comes to scanning for issues (i.e. blacklist
Rule 20.7).

Luca suggested that before doing that we could at least try to
fix/deviate the violations reported by cppcheck (they are far fewer than
the ones reported by Eclair). So here we are :-)



So in short:

- This is not the first of many series flooding xen-devel adding
  deviations; this is the only series we need to get zero
  false-positives from cppcheck now

- With this series, and with the linux files to skip, we could add
  cppcheck to gitlab-ci today

- Alternatively, we could disable rule 20.7 for now

- We could wait for cppcheck to improve and address our bug reports, but
  it is likely not going to enable us to make progress quickly. If we
  want to wait, I would rather disable 20.7 until cppcheck improves so
  that we can still add cppcheck to gitlab-ci soon. I think that would
  be OK too


What do you guys think? Nice automatic 20.7 scans for all patches and
for staging, but with the undesirable false-positive comments, or
no-20.7 scans but no comments in the tree?


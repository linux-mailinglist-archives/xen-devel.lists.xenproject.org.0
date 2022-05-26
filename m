Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E7553542D
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 21:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337727.562407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuJc4-0002ZU-Kp; Thu, 26 May 2022 19:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337727.562407; Thu, 26 May 2022 19:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuJc4-0002W6-Gy; Thu, 26 May 2022 19:57:40 +0000
Received: by outflank-mailman (input) for mailman id 337727;
 Thu, 26 May 2022 19:57:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nuJc2-0002Vw-Hp
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 19:57:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1674e34f-dd2e-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 21:57:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE2CC618EC;
 Thu, 26 May 2022 19:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FE4C385A9;
 Thu, 26 May 2022 19:57:31 +0000 (UTC)
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
X-Inumbo-ID: 1674e34f-dd2e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653595054;
	bh=mjbEiFlqfvN+ed8od2LCKNRZ1yCNibfLU700yFG6aOk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LV+CC89jKUn9TVfsrJLE+1lp5NSlBLfljb2guhPUUUgatZwMItgxr+DoGebDQaZhe
	 gqaOx6u1dU40wKgyf0LM/TE1ns3VoEj5tJ0sc9XXf9gdTFvNKOCd7vl7o2r6pXHMQm
	 EECZl9TLKfUUzgDEEY6/8IxP1yEXdFcyXdwQjrUn7lYxExZw0JkmSB6QJdX3ecIB7q
	 VlaFdbIndNCQoDxpga9HTcXqUR6rwJhp9LL89/lup/3wBiMX8NB3fF+1chKkwGCjr0
	 Kc5e4HWIxX/NwoMxj8jQVICsySreg3Wm2IYKWT/Q0MPvJZ2QdP0aY6Htdfmo4QSUKj
	 6nMAhH4Gr4HmA==
Date: Thu, 26 May 2022 12:57:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
In-Reply-To: <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205261233000.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop> <20220525003505.304617-1-sstabellini@kernel.org> <a19d22ca-33ef-b348-ac88-490010464bad@xen.org> <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
 <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com> <D9A44AC3-A959-442F-A94C-C9EFB359BEF1@arm.com> <da68ca4d-3498-ec6a-7a5d-040f23dd41a6@suse.com> <765738F2-97E9-40EF-A50E-2912C7D2A286@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1293857561-1653593990=:1905099"
Content-ID: <alpine.DEB.2.22.394.2205261239580.1905099@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1293857561-1653593990=:1905099
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2205261239581.1905099@ubuntu-linux-20-04-desktop>

On Thu, 26 May 2022, Bertrand Marquis wrote:
> > On 26 May 2022, at 11:15, Jan Beulich <jbeulich@suse.com> wrote:
> > On 26.05.2022 11:54, Bertrand Marquis wrote:
> >>> On 26 May 2022, at 10:43, Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 26.05.2022 03:02, Stefano Stabellini wrote:
> >>>> On Wed, 25 May 2022, Julien Grall wrote:
> >>>>> On 25/05/2022 01:35, Stefano Stabellini wrote:
> >>>>>> +- Rule: Dir 4.7
> >>>>>> + - Severity: Required
> >>>>>> + - Summary: If a function returns error information then that error
> >>>>>> information shall be tested
> >>>>>> + - Link:
> >>>>>> https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c
> >>>>> 
> >>>>> 
> >>>>> ... this one. We are using (void) + a comment when the return is ignored on
> >>>>> purpose. This is technically not-compliant with MISRA but the best we can do
> >>>>> in some situation.
> >>>>> 
> >>>>> With your proposed wording, we would technically have to remove them (or not
> >>>>> introduce new one). So I think we need to document that we are allowing
> >>>>> deviations so long they are commented.
> >>>> 
> >>>> Absolutely yes. All of these rules can have deviations as long as they
> >>>> make sense and they are commented. Note that we still have to work out
> >>>> a good tagging system so that ECLAIR and cppcheck can recognize the
> >>>> deviations automatically but for now saying that they need to be
> >>>> commented is sufficient I think.
> >>>> 
> >>>> So I'll add the following on top of the file:
> >>>> 
> >>>> """
> >>>> It is possible that in specific circumstances it is best not to follow a
> >>>> rule because it is not possible or because the alternative leads to
> >>>> better code quality. Those cases are called "deviations". They are
> >>>> permissible as long as they are documented with an in-code comment.
> >>>> """
> >>> 
> >>> Hmm, so you really mean in-code comments. I don't think this will scale
> >>> well (see e.g. the DCE related intended deviation), and it also goes
> >>> against the "no special casing for every static analysis tool" concern
> >>> I did voice on the call.
> >> 
> >> On this subject the idea was more to define a “xen” way to document
> >> deviations in the code and do it in a way so that we could easily substitute
> >> the “flag” to adapt it for each analyser using tools or command line options.
> > 
> > I think the basic scheme of something like this would want laying out
> > before doc changes like the one here actually go in, so that it's clear
> > what the action is if a new deviation needs adding for whatever reason
> > (and also allowing interested people to start contributing patches to
> > add respective annotations).
> 
> We will work on that but if we wait for everything to be solved we will
> never progress.
> I have a task on my side (ie at arm) to work on that and Luca Fancellu
> will start working on it next month.
> Now I do not think that this should block this patch, agreeing on rules does
> not mean will respect all of them in the short term so we can wait a bit as I
> definitely think that how to document violations in the code and in general
> will be a work package on its own and will require some discussion.

Right.

In general, we'll need to document these deviations and ideally they
would be documented as in-code comments because they are easier to keep
in sync with the code. But we won't be able to do that in all cases.

We'll also need a special TAG to mark the deviation. Nobody wants
multiple tagging systems for different tools (ECLAIR, cppcheck,
Coverity, etc.) We'll come up with one tagging system and introduce
conversion scripts as needed. Roberto offered to help on the call to
come up with a generic tagging system.

In some cases in-code comments for every deviation would be too verbose.
We'll want to handle it in another way. It could be a document
somewhere else, or simply disabling the Rules check in ECLAIR/cppcheck
(but that partially defeats the purpose.) We'll have to see. I think
it is going to be on a case by case basis.


In short, I don't think we have all the info and expertise to come up
with a good deviation system right now. We need to make more progress
and analize a few specific examples before we can do that. But to gain
that expertise we need to agree on a set of rules we want to follow
first, which is this patch series.


So, I think this is the best way we can start the process. We can
clarify further with the comment on top of this file, and we could even
remove the specific part about the "in-code comment" with an open-ended
statement until we come up with a clear deviation strategy. For
instance:

"""
It is possible that in specific circumstances it is best not to follow a
rule because it is not possible or because the alternative leads to
better code quality. Those cases are called "deviations". They are
permissible as long as they are documented.

The existing codebase is not 100% compliant with the rules. Some of the
violations are meant to be documented as deviations, while some others
should be fixed. Both compliance and documenting deviations on the
existing codebase is work-in-progress.
"""
--8323329-1293857561-1653593990=:1905099--


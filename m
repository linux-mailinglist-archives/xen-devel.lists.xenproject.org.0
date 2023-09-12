Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA15E79C12B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 02:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599832.935412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfrTv-0007KM-EL; Tue, 12 Sep 2023 00:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599832.935412; Tue, 12 Sep 2023 00:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfrTv-0007I9-B2; Tue, 12 Sep 2023 00:42:19 +0000
Received: by outflank-mailman (input) for mailman id 599832;
 Tue, 12 Sep 2023 00:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+51=E4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qfrTu-0007I3-C4
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 00:42:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 392009a8-5105-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 02:42:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5AC65B81639;
 Tue, 12 Sep 2023 00:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99158C116A3;
 Tue, 12 Sep 2023 00:42:13 +0000 (UTC)
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
X-Inumbo-ID: 392009a8-5105-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694479335;
	bh=t73kD1q/yvqJbqZ+PaZx835057nLC1L7h3e08Qd3rqk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LKqiwsS9vuIFKqj5/Eu/6ETKz2WjKuzdWCxsb8/5RfDTBudZ7DJgzb/lkBGQbRZpb
	 oeDmakMu3g3/TQ1Qxeoq309NlW5b3Zc5iU8MmtXDP2Z80oXhDneQsrP0EuE/weJlAl
	 hXrbTZRnnXI0Ry5VPId5X5Kk/kkMwG81LY88LX7zKZEfLmnUwOqbphxnJvxASp+E25
	 BLUNCbXn8lyusZrIwOyZJSYD/Ks49qDROTYR6/YtxLEHeHsJQivIuGlUPz2PuS/28h
	 HICOqBYf+bVy8HjDfT7amZc3gwnaKPHOP7n+2+yuA6Gm2CkaAMqNpvEmI7/OAXGBva
	 2KNT+ju3AVyOw==
Date: Mon, 11 Sep 2023 17:42:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: nicola.vetrini@bugseng.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, roberto.bagnara@bugseng.com, julien@xen.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
In-Reply-To: <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org>
Message-ID: <alpine.DEB.2.22.394.2309111740160.1847660@ubuntu-linux-20-04-desktop>
References: <20230908230318.1719290-1-sstabellini@kernel.org> <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Sep 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 09/09/2023 00:03, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > During the discussions that led to the acceptance of Rule 2.1, we
> > decided on a few exceptions that were not properly recorded in
> > rules.rst. Add them now.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Nicola, does this work with ECLAIR?
> > 
> > I am referring to the locations of the SAF-2-safe tag on top of
> > call_psci_system_off, BUG, etc.
> > 
> > Changes in v3:
> > - added SAF-2-safe to safe.json
> > - added a few SAF-2-safe examples
> > ---
> >   docs/misra/rules.rst    | 13 ++++++++++++-
> >   docs/misra/safe.json    |  8 ++++++++
> >   xen/arch/arm/psci.c     |  1 +
> >   xen/arch/x86/shutdown.c |  1 +
> >   xen/include/xen/bug.h   |  2 ++
> >   5 files changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index 34916e266a..82de4c645d 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -107,7 +107,18 @@ maintainers if you want to suggest a change.
> >      * - `Rule 2.1
> > <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
> >        - Required
> >        - A project shall not contain unreachable code
> > -     -
> > +     - The following are allowed:
> > +         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM))
> > { S; }
> > +         - Switch with a controlling value statically determined not to
> > +           match one or more case statements
> > +         - Functions that are intended to be referenced only from
> > +           assembly code (e.g. 'do_trap_fiq')
> > +         - Deliberate unreachability caused by certain macros/functions,
> > +           e.g. BUG, assert_failed, panic, etc. See safe.json.
> > +         - asm-offsets.c, as they are not linked deliberately, because
> > +           they are used to generate definitions for asm modules
> > +         - Declarations without initializer are safe, as they are not
> > +           executed
> >        * - `Rule 2.6
> > <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
> >        - Advisory
> > diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> > index 39c5c056c7..fc96a99fd5 100644
> > --- a/docs/misra/safe.json
> > +++ b/docs/misra/safe.json
> > @@ -20,6 +20,14 @@
> >           },
> >           {
> >               "id": "SAF-2-safe",
> > +            "analyser": {
> > +                "eclair": "MC3R1.R2.1"
> > +            },
> > +            "name": "Rule 2.1: deliberate unreachability",
> > +            "text": "Macro or function designed to be unreachable."
> > +        },
> > +        {
> > +            "id": "SAF-3-safe",
> >               "analyser": {},
> >               "name": "Sentinel",
> >               "text": "Next ID to be used"
> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> > index 695d2fa1f1..2a8527cacc 100644
> > --- a/xen/arch/arm/psci.c
> > +++ b/xen/arch/arm/psci.c
> > @@ -59,6 +59,7 @@ void call_psci_cpu_off(void)
> >       }
> >   }
> >   +/* SAF-2-safe */
> 
> I think any use of SAF-2-safe should be accompanied with an attribute...
> 
> >   void call_psci_system_off(void)
> 
> ... noreturn for function or ...
> 
> >   {
> >       if ( psci_ver > PSCI_VERSION(0, 1) )
> > diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
> > index 7619544d14..47e0f59024 100644
> > --- a/xen/arch/x86/shutdown.c
> > +++ b/xen/arch/x86/shutdown.c
> > @@ -118,6 +118,7 @@ static inline void kb_wait(void)
> >               break;
> >   }
> >   +/* SAF-2-safe */
> >   static void noreturn cf_check __machine_halt(void *unused)
> >   {
> >       local_irq_disable();
> > diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> > index e8a4eea71a..d47c54f034 100644
> > --- a/xen/include/xen/bug.h
> > +++ b/xen/include/xen/bug.h
> > @@ -117,6 +117,7 @@ struct bug_frame {
> >   #endif
> >     #ifndef BUG
> > +/* SAF-2-safe */
> >   #define BUG() do {                                              \
> >       BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
> >       unreachable();                                              \
> 
> ... unreachable for macros. But the /* SAF-2-safe */ feels a little bit
> redundant when a function is marked as 'noreturn'.
> 
> Is there any way to teach eclair about noreturn?

Actually I had the same thought while writing this patch. If we can
adopt unreachable and noreturn consistently maybe we don't need
SAF-2-safe. If the checker can support it.

Nicola, what do you think?


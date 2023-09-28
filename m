Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EEF7B101D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 02:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609225.948182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlf5P-0007dk-6m; Thu, 28 Sep 2023 00:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609225.948182; Thu, 28 Sep 2023 00:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlf5P-0007ab-3A; Thu, 28 Sep 2023 00:40:59 +0000
Received: by outflank-mailman (input) for mailman id 609225;
 Thu, 28 Sep 2023 00:40:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlf5N-0007aP-F0
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 00:40:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad38f90a-5d97-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 02:40:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F2D73B81819;
 Thu, 28 Sep 2023 00:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CFDC433C7;
 Thu, 28 Sep 2023 00:40:49 +0000 (UTC)
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
X-Inumbo-ID: ad38f90a-5d97-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695861651;
	bh=qb+nZ2Ty5fH2BLL7h8de8y+xiHmeW6hV0wyqPScchAQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DXq9rSQQ7t0hWMa9Ec9oSpv3yb//joLxqbgPQ9DddVpSwFNGRZ+uqKpLlVQdqttKq
	 hAP+8LDug4fS/IUUnuWNz/wrd83yvVG7RbZ2UTbkqMpcQP81OdSyTLeVACvwfgZTe8
	 sY0VsGgOsko8pYWbJPGjCyjrMmdWBN3or0F1LsOGAwwNLB7GCjxVfiXA6KScZo/kWM
	 6PVb9Ig8tSjphQf6Dii34Q/b69LqCevamzofozZcBOLmnBhCLW+VM1f42B7j8/ege/
	 VqjIZvOowf7jyCzUG89LAG4kMR6WgY+/3Mtz1zSL1wZ/HB04ZDZnJJTyPuOAeIGtqC
	 7qPlPB4C8+0XA==
Date: Wed, 27 Sep 2023 17:40:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, 
    "julien@xen.org" <julien@xen.org>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, Henry.Wang@arm.com
Subject: Re: [PATCH v3] docs/misra: add rule 2.1 exceptions
In-Reply-To: <BEAF1369-C1FE-4B81-A0A1-5A4F39426E9E@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309271740280.1996340@ubuntu-linux-20-04-desktop>
References: <20230908230318.1719290-1-sstabellini@kernel.org> <91d5ea6d-bdfa-45bf-a54b-5acdf1784ec4@xen.org> <alpine.DEB.2.22.394.2309111740160.1847660@ubuntu-linux-20-04-desktop> <156fac1ee8e37cddac95813f72a108e0@bugseng.com>
 <BEAF1369-C1FE-4B81-A0A1-5A4F39426E9E@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Sep 2023, Bertrand Marquis wrote:
> > On 27 Sep 2023, at 09:53, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> > 
> >>> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> >>> > index 695d2fa1f1..2a8527cacc 100644
> >>> > --- a/xen/arch/arm/psci.c
> >>> > +++ b/xen/arch/arm/psci.c
> >>> > @@ -59,6 +59,7 @@ void call_psci_cpu_off(void)
> >>> >       }
> >>> >   }
> >>> >   +/* SAF-2-safe */
> >>> I think any use of SAF-2-safe should be accompanied with an attribute...
> >>> >   void call_psci_system_off(void)
> >>> ... noreturn for function or ...
> >>> >   {
> >>> >       if ( psci_ver > PSCI_VERSION(0, 1) )
> >>> > diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
> >>> > index 7619544d14..47e0f59024 100644
> >>> > --- a/xen/arch/x86/shutdown.c
> >>> > +++ b/xen/arch/x86/shutdown.c
> >>> > @@ -118,6 +118,7 @@ static inline void kb_wait(void)
> >>> >               break;
> >>> >   }
> >>> >   +/* SAF-2-safe */
> >>> >   static void noreturn cf_check __machine_halt(void *unused)
> >>> >   {
> >>> >       local_irq_disable();
> >>> > diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> >>> > index e8a4eea71a..d47c54f034 100644
> >>> > --- a/xen/include/xen/bug.h
> >>> > +++ b/xen/include/xen/bug.h
> >>> > @@ -117,6 +117,7 @@ struct bug_frame {
> >>> >   #endif
> >>> >     #ifndef BUG
> >>> > +/* SAF-2-safe */
> >>> >   #define BUG() do {                                              \
> >>> >       BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
> >>> >       unreachable();                                              \
> >>> ... unreachable for macros. But the /* SAF-2-safe */ feels a little bit
> >>> redundant when a function is marked as 'noreturn'.
> >>> Is there any way to teach eclair about noreturn?
> >> Actually I had the same thought while writing this patch. If we can
> >> adopt unreachable and noreturn consistently maybe we don't need
> >> SAF-2-safe. If the checker can support it.
> >> Nicola, what do you think?
> > 
> > A couple of remarks:
> > - if you put the noreturn attribute on some functions, then surely the code after those is
> > reported as unreachable. ECLAIR should pick up all forms of noreturn automatically; otherwise, a simple configuration can be used.
> > 
> > - Note that the cause of unreachability in the vast majority of cases is the call to
> > __builtin_unreachable(), therefore a textual deviation on the definition of unreachable, plus
> > a bit of ECLAIR configuration, can deviate it (to be clear, just the SAF comment is not
> > sufficient, since deviations comments are meant to be applied at the top expansion location,
> > which is not on the macro definition).
> > This is what it should look like, roughly:
> > 
> > -config=MC3R1.R2.1,reports+={deliberate, "any_area(any_loc(text(^<REGEX>$, -1)))"}
> > 
> > #if (!defined(__clang__) && (__GNUC__ == 4) && (__GNUC_MINOR__ < 5))
> > /* SAF-2-safe */
> > #define unreachable() do {} while (1)
> > #else
> > /* SAF-2-safe */
> > #define unreachable() __builtin_unreachable()
> > #endif
> > 
> > where REGEX will match the translation of SAF-2-safe.
> > 
> > However, this will then entail that *some* SAF comments are treated specially and, moreover,
> > that some modification to the definition of unreachable won't work
> > (e.g.
> > #define M() __builtin_unreachable()
> > /* SAF-2-safe */
> > #define unreachable() M()
> > 
> > My opinion is that it's far easier for this to be an eclair configuration (which has the
> > advantage not to depend on the exact definition of unreachable) and then perhaps a comment
> > above it explaining the situation.
> 
> I agree here and it is easier to make an overall exception where we list the cases
> where this is acceptable (ie all flavors of unreacheable) and document that eclair
> was configured using "xxxx" to handle this.

In that case it looks like we all agree that we can go ahead with this
patch with just the changes to docs/misra/rules.rst to add rule 2.1 and
remove everything else. Which is v2 of this patch:
https://marc.info/?l=xen-devel&m=169283027729298

Henry, can I get one more release-ack for v2 of this patch (only changes
to docs/misra, no code changes)?

Also Bertrand can you provide a formal Ack for v2?


I do think we should have a document to track this kind of deviations
that are not managed by safe.json or exclude-list.json. But I think for
now the rules.rst notes and the ECLAIR config file (which is under
xen.git) will suffice.


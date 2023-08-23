Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543F6784DC5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 02:24:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588824.920445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYbfL-0006dD-4J; Wed, 23 Aug 2023 00:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588824.920445; Wed, 23 Aug 2023 00:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYbfL-0006a1-0M; Wed, 23 Aug 2023 00:24:07 +0000
Received: by outflank-mailman (input) for mailman id 588824;
 Wed, 23 Aug 2023 00:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q6w=EI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYbfJ-0006Xe-Dy
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 00:24:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b3fdff9-414b-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 02:24:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D37B60FBC;
 Wed, 23 Aug 2023 00:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0483EC433C8;
 Wed, 23 Aug 2023 00:23:57 +0000 (UTC)
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
X-Inumbo-ID: 5b3fdff9-414b-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692750239;
	bh=A75RqVeGHuBNiHFToPKHR8bPx5v5AC123F8DAsHbQYo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KoH29ZoaJLbTjHrv1TLgSZV4dy0m3EeArepZWUlwnWIuHlS6/C6Rs+hRQYXo6s6If
	 eOj4ffRRc9VLI9H0mtuH+YbEI0NHRIPmRrew7TlpkEjlDbKPnHAfRKPazNC1/8eNeQ
	 BitZiHKHVXVFcKoXl67rFGvyyc4POHyKk0THxxpGINkl2O+R8FIpTr/vb4v2L/VuO9
	 LicEjeZ3FLz5hpqeRelLRLkMyyrYxIy5s6zEgJtVEh6Ts2e2GJJHkad0s4hkGcIn2f
	 9JXN0fstBCjqc3W4siKwqAI/C5g2OO8rffHCma0V7uaSbp6cVPGnXOo8Az7pPb1JKw
	 IOYYe1DFtkToQ==
Date: Tue, 22 Aug 2023 17:23:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, bertrand.marquis@arm.com, 
    nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add exceptions to rules
In-Reply-To: <1fd0b3b6-0771-66ad-9b3d-85358ab4102c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308221712070.6458@ubuntu-linux-20-04-desktop>
References: <20230819012410.1754839-1-sstabellini@kernel.org> <5400f672-5ae6-4559-920f-5244bcd83c57@suse.com> <alpine.DEB.2.22.394.2308211803170.6458@ubuntu-linux-20-04-desktop> <1fd0b3b6-0771-66ad-9b3d-85358ab4102c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Aug 2023, Jan Beulich wrote:
> On 22.08.2023 03:40, Stefano Stabellini wrote:
> > On Mon, 21 Aug 2023, Jan Beulich wrote:
> >> On 19.08.2023 03:24, Stefano Stabellini wrote:
> >>> @@ -106,7 +107,23 @@ maintainers if you want to suggest a change.
> >>>     * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
> >>>       - Required
> >>>       - A project shall not contain unreachable code
> >>> -     -
> >>> +     - The following are allowed:
> >>> +         - Invariantly constant conditions (e.g. while(0) { S; })
> >>
> >> When (and why) was this decided? The example given looks exactly like what
> >> Misra wants us to not have.
> > 
> > This covers things like:
> > 
> > if (IS_ENABLED(CONFIG_HVM))
> > 
> > which could resolve in if (0) in certain configurations. I think we gave
> > feedback to Roberto that we wanted to keep this type of things as is.
> 
> Ah, I see. But then perhaps mention that rather than plain 0 here?

Yes, I'll do


> See below as to whether a complete list of excepted constructs is
> wanted.

[...]

> >>> +         - Unreachability caused by the following macros/functions is
> >>> +           deliberate: BUG, assert_failed, ERROR_EXIT, ERROR_EXIT_DOM,
> >>> +           PIN_FAIL, __builtin_unreachable, panic, do_unexpected_trap,
> >>> +           machine_halt, machine_restart, machine_reboot,
> >>> +           ASSERT_UNREACHABLE
> >>
> >> Base infrastructure items like BUG() are imo fine to mention here. But
> >> specific items shouldn't be; the more we mention here, the more we invite
> >> the list to be grown. Note also how you mention items which no longer
> >> exist (ERROR_EXIT{,_DOM}, PIN_FAIL).
> > 
> > The question is whether we want this list to be exhaustive (so we want
> > to mention everything for which we make an exception) or only an example
> > (in which case just BUG is fine.)
> > 
> > Let's say we only mention BUG. Where should we keep the exhaustive list?
> > Is it OK if it only lives as an ECLAIR config file under
> > automation/eclair_analysis? There is another very similar question
> > below.
> 
> First and foremost we need to have a single place where everything is
> recorded, or where at least a pointer exists to where further details
> are. As to this being the Eclair config file: Shouldn't any such
> constructs rather be listed in the deviations file, such that e.g.
> cppcheck can also benefit?

Yes, you are right. Basically the choice is whether we want a
project-wide deviation, something like a change in how we interpret the
rules, or a regular deviation for one macro or one function.

After reading your comments, I also think that all the macros above
should be covered by safe.json and in-code comments instead.



> > BTW I think both options are OK.
> > 
> > If we only mention BUG, we are basically saying that as a general rule
> > only BUG is an exception. Then we have a longer more detailed list for
> > ECLAIR because in practice things are always complicated.
> > 
> > On the other hand if we have the full list here, then the documentation
> > is more precise, but it looks a bit "strange" to see such a detailed
> > list in this document and also we need to make sure to keep the list
> > up-to-date.
> 
> Thing is: This list shouldn't grow very long anyway, and also better
> would grow / change much over time.

+1


> >>> @@ -167,7 +184,7 @@ maintainers if you want to suggest a change.
> >>>     * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
> >>>       - Required
> >>>       - A typedef name shall be a unique identifier
> >>> -     -
> >>> +     - BOOLEAN, UINT{8,32,64} and INT{8,32,64} are allowed
> >>
> >> I think this permission needs to be limited as much as possible.
> > 
> > Maybe we should take this out completely given that they should be
> > limited to efi and acpi code that is excepted anyway
> 
> I would favor that, yes.
> 
> >>> @@ -183,7 +200,10 @@ maintainers if you want to suggest a change.
> >>>     * - `Rule 7.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_01.c>`_
> >>>       - Required
> >>>       - Octal constants shall not be used
> >>> -     -
> >>> +     - Usage of the following constants is safe, since they are given
> >>> +       as-is in the inflate algorithm specification and there is
> >>> +       therefore no risk of them being interpreted as decimal constants:
> >>> +       ^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$
> >>
> >> This is a very odd set of exceptions, which by stating them here you then
> >> grant to be exercised everywhere. Once again I don't think special cases
> >> dealing with a single source or sub-component should be globally named.
> > 
> > Actually I agree with you there. The problem is where to put them.
> 
> safe.json?

Yes you are right

 
> > Right now we have docs/misra/rules.rst with the list of accepted rules
> > and their special interpretations by Xen Project. We also have the
> > ECLAIR configuration under automation/eclair_analysis with a bunch of
> > ECLAIR specific config files.
> > 
> > Is it OK if the constants above only live under
> > automation/eclair_analysis and nowhere else? Or should we have another
> > rst document under docs/misra for special cases dealing with a single
> > source? 
> 
> As per above, I think putting anything in Eclair's config file should
> only ever be a last resort. Wherever possible we should try to put stuff
> in files which aren't tool specific. Where necessary special tool
> settings can then be (machine-)derived from there.

I agree. I'll send out another patch to update rules.rst. And later as a
follow-up I'll see what I can do to update safe.json.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B2078378B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 03:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588031.919459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGO5-0005kU-1C; Tue, 22 Aug 2023 01:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588031.919459; Tue, 22 Aug 2023 01:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGO4-0005hQ-Tv; Tue, 22 Aug 2023 01:40:52 +0000
Received: by outflank-mailman (input) for mailman id 588031;
 Tue, 22 Aug 2023 01:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gk3p=EH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYGO3-0005hK-OW
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 01:40:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc2b388-408c-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 03:40:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 751DF62301;
 Tue, 22 Aug 2023 01:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D520C433C7;
 Tue, 22 Aug 2023 01:40:46 +0000 (UTC)
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
X-Inumbo-ID: ebc2b388-408c-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692668447;
	bh=FlRsgH0jiWAFYSD8qTsL+JVQ+9L0OQUNEhW6Yxu0G9c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RsJHMc3u4z5s7NpNMkFc78vdUsbEViwXMqL+8qLONXlRUrcpoE9y7BCwS/BNeE5UF
	 Oi7b060dmnta7J2rtOjLK8lM19SFsZB9LbdNgDjYc9gPonHgjOlxaDSz2X6JuWHsFB
	 s3Agi5kTmmlHIddKAZBd8w/zdQXesb0QGdLsN027uQ9qJ+UYMtdyV0xl/kDW+m2P/w
	 hkgxhqmrSiEWvMhP0kE2RHUbNI/ZSKYjSnI82FiWIykTFayWHQNZtBlSDN2fqD0qyU
	 Bbuz7V7Csd0NzRfJaZGlMEc3vfXNEFyo/3YYr5/bYjlAcHvThZqdpt0q7C2TrFmYB7
	 3GGcFuhZozSoA==
Date: Mon, 21 Aug 2023 18:40:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, bertrand.marquis@arm.com, 
    nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add exceptions to rules
In-Reply-To: <5400f672-5ae6-4559-920f-5244bcd83c57@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308211803170.6458@ubuntu-linux-20-04-desktop>
References: <20230819012410.1754839-1-sstabellini@kernel.org> <5400f672-5ae6-4559-920f-5244bcd83c57@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Aug 2023, Jan Beulich wrote:
> On 19.08.2023 03:24, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > During the discussions that led to the acceptable of the Rules, we
> > decided on a few exceptions that were not properly recorded in
> > rules.rst. Other times, the exceptions were decided later when it came
> > to enabling a rule in ECLAIR.
> 
> In a number of cases I'm unaware of such decisions. May be worth splitting
> the patch into a controversial and an uncontroversial part, such that the
> latter can go in while we discuss the former.

yes, I'll extract a couple of non-controversial changes and send them
out


> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -59,7 +59,8 @@ maintainers if you want to suggest a change.
> >       - Required
> >       - Precautions shall be taken in order to prevent the contents of a
> >         header file being included more than once
> > -     -
> > +     - Files that are intended to be included more than once do not need to
> > +       conform to the directive (e.g. autogenerated or empty header files)
> 
> Auto-generated isn't a reason for an exception here. The logic generating
> the header can very well be adjusted. Same for empty headers - there's no
> reason they couldn't gain guards. An exception is needed for headers which
> we deliberately include more than once, in order to have a single central
> place for attributes, enumerations, and alike.

OK


> > @@ -106,7 +107,23 @@ maintainers if you want to suggest a change.
> >     * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
> >       - Required
> >       - A project shall not contain unreachable code
> > -     -
> > +     - The following are allowed:
> > +         - Invariantly constant conditions (e.g. while(0) { S; })
> 
> When (and why) was this decided? The example given looks exactly like what
> Misra wants us to not have.

This covers things like:

if (IS_ENABLED(CONFIG_HVM))

which could resolve in if (0) in certain configurations. I think we gave
feedback to Roberto that we wanted to keep this type of things as is.


> > +         - Switch with a controlling value incompatible with labeled
> > +           statements
> 
> What does this mean?

I am not certain about this one actually. It could be when we have:

switch (var) {
  case 1:
      something();
      break;
  case 2:
      something();
      break;
}

and var could be 3 in theory?

Nicola, please confirm.


> > +         - Functions that are intended to be never referenced from C
> > +           code, or are referenced in builds not under analysis (e.g.
> > +           'do_trap_fiq' for the former and 'check_for_unexpected_msi'
> > +           for the latter)
> 
> I agree with the "not referenced from C", but I don't see why the other
> kind couldn't be properly addressed.

I think you have a point


> > +         - Unreachability caused by the following macros/functions is
> > +           deliberate: BUG, assert_failed, ERROR_EXIT, ERROR_EXIT_DOM,
> > +           PIN_FAIL, __builtin_unreachable, panic, do_unexpected_trap,
> > +           machine_halt, machine_restart, machine_reboot,
> > +           ASSERT_UNREACHABLE
> 
> Base infrastructure items like BUG() are imo fine to mention here. But
> specific items shouldn't be; the more we mention here, the more we invite
> the list to be grown. Note also how you mention items which no longer
> exist (ERROR_EXIT{,_DOM}, PIN_FAIL).

The question is whether we want this list to be exhaustive (so we want
to mention everything for which we make an exception) or only an example
(in which case just BUG is fine.)

Let's say we only mention BUG. Where should we keep the exhaustive list?
Is it OK if it only lives as an ECLAIR config file under
automation/eclair_analysis? There is another very similar question
below.

BTW I think both options are OK.

If we only mention BUG, we are basically saying that as a general rule
only BUG is an exception. Then we have a longer more detailed list for
ECLAIR because in practice things are always complicated.

On the other hand if we have the full list here, then the documentation
is more precise, but it looks a bit "strange" to see such a detailed
list in this document and also we need to make sure to keep the list
up-to-date.


> > +         - asm-offsets.c, as they are not linked deliberately, because
> > +           they are used to generate definitions for asm modules
> > +         - pure declarations (i.e. declarations without
> > +           initialization) are safe, as they are not executed
> 
> I don't think "pure declarations" is a term used in the spec. Let's better
> call it the way it is called elsewhere - declarations without initializer
> (where, as mentioned before, the term "unreachable code" is questionable
> anyway).

OK


> > @@ -167,7 +184,7 @@ maintainers if you want to suggest a change.
> >     * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
> >       - Required
> >       - A typedef name shall be a unique identifier
> > -     -
> > +     - BOOLEAN, UINT{8,32,64} and INT{8,32,64} are allowed
> 
> I think this permission needs to be limited as much as possible.

Maybe we should take this out completely given that they should be
limited to efi and acpi code that is excepted anyway


> > @@ -183,7 +200,10 @@ maintainers if you want to suggest a change.
> >     * - `Rule 7.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_01.c>`_
> >       - Required
> >       - Octal constants shall not be used
> > -     -
> > +     - Usage of the following constants is safe, since they are given
> > +       as-is in the inflate algorithm specification and there is
> > +       therefore no risk of them being interpreted as decimal constants:
> > +       ^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$
> 
> This is a very odd set of exceptions, which by stating them here you then
> grant to be exercised everywhere. Once again I don't think special cases
> dealing with a single source or sub-component should be globally named.

Actually I agree with you there. The problem is where to put them.

Right now we have docs/misra/rules.rst with the list of accepted rules
and their special interpretations by Xen Project. We also have the
ECLAIR configuration under automation/eclair_analysis with a bunch of
ECLAIR specific config files.

Is it OK if the constants above only live under
automation/eclair_analysis and nowhere else? Or should we have another
rst document under docs/misra for special cases dealing with a single
source? 

 
> > @@ -239,13 +259,16 @@ maintainers if you want to suggest a change.
> >       - Required
> >       - All declarations of an object or function shall use the same
> >         names and type qualifiers
> > -     -
> > +     - The type ret_t is deliberately used and defined as int or long
> > +       depending on the architecture
> 
> That's not depending on the architecture, but depending on the type of
> guest to service. I'd also suggest "may", not "is".

OK


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142F52ED0AB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 14:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62897.111565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVL9-0006zQ-LX; Thu, 07 Jan 2021 13:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62897.111565; Thu, 07 Jan 2021 13:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVL9-0006z1-Ho; Thu, 07 Jan 2021 13:28:35 +0000
Received: by outflank-mailman (input) for mailman id 62897;
 Thu, 07 Jan 2021 13:28:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PbtA=GK=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kxVL7-0006yw-RD
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 13:28:33 +0000
Received: from MTA-07-4.privateemail.com (unknown [68.65.122.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a2d11c8-97d4-4d20-b038-ce7d685bc439;
 Thu, 07 Jan 2021 13:28:32 +0000 (UTC)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 86E566011C
 for <xen-devel@lists.xenproject.org>; Thu,  7 Jan 2021 08:28:31 -0500 (EST)
Received: from mail-wr1-f49.google.com (unknown [10.20.151.234])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 4B06B60118
 for <xen-devel@lists.xenproject.org>; Thu,  7 Jan 2021 13:28:31 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id 91so5640242wrj.7
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 05:28:31 -0800 (PST)
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
X-Inumbo-ID: 9a2d11c8-97d4-4d20-b038-ce7d685bc439
X-Gm-Message-State: AOAM533HQmenRwFjz04zuEML9CEC0piFwv6S/NrMgoer/SG31efuCcIR
	x+03GJdcc9Gzd0XZ6RBdOaU0cuR15X6EEPhZSQk=
X-Google-Smtp-Source: ABdhPJxkQ71lQdayjoYMX7Q8TIZDpVeJtyWt9ChGy5tgT1AzoziUpxW2pJuPpnZfteJtchhjC3+pfpJNQfNerVGCrIQ=
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr8952306wrw.386.1610026109700;
 Thu, 07 Jan 2021 05:28:29 -0800 (PST)
MIME-Version: 1.0
References: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
 <19aab6220bf191a31902488ed38c51d239572269.1609781242.git.tamas.lengyel@intel.com>
 <158cf7ca-17cf-c886-20e8-b53519bec1b5@suse.com> <CABfawhn3OBbpHW9e1Dd9n4UCOe_KaymBS0QwnJC2tLr-oAnBmg@mail.gmail.com>
 <a3f12f54-926e-9810-f78f-534f057449de@suse.com> <CABfawh=+nd+Lm59Ofy31yDVvcQ9fYXNbm_NBNvu8xsnxti+8sQ@mail.gmail.com>
 <ba51a8bf-a2cb-0572-8f8d-4c4246580b59@suse.com> <CABfawhk6NPYeCbiXZ00gy+iyESrXu5ciWg0bvsUeCUL9q0k1Qg@mail.gmail.com>
 <c0657049-bb1b-7397-45b4-aeaf8e8c15e8@suse.com>
In-Reply-To: <c0657049-bb1b-7397-45b4-aeaf8e8c15e8@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 7 Jan 2021 08:27:53 -0500
X-Gmail-Original-Message-ID: <CABfawh=bgzJfb-VgrsLKtOn5pNa3JO3SBRwAa_hcuCeRh4Q3-g@mail.gmail.com>
Message-ID: <CABfawh=bgzJfb-VgrsLKtOn5pNa3JO3SBRwAa_hcuCeRh4Q3-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/hap: Resolve mm-lock order violations when
 forking VMs with nested p2m
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Jan 7, 2021 at 7:56 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 07.01.2021 13:43, Tamas K Lengyel wrote:
> > On Thu, Jan 7, 2021 at 7:26 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 06.01.2021 17:26, Tamas K Lengyel wrote:
> >>> On Wed, Jan 6, 2021 at 11:11 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 06.01.2021 16:29, Tamas K Lengyel wrote:
> >>>>> On Wed, Jan 6, 2021 at 7:03 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>> On 04.01.2021 18:41, Tamas K Lengyel wrote:
> >>>>>>> --- a/xen/arch/x86/mm/p2m.c
> >>>>>>> +++ b/xen/arch/x86/mm/p2m.c
> >>>>>>> @@ -1598,8 +1598,17 @@ void
> >>>>>>>  p2m_flush_nestedp2m(struct domain *d)
> >>>>>>>  {
> >>>>>>>      int i;
> >>>>>>> +    struct p2m_domain *p2m;
> >>>>>>> +
> >>>>>>>      for ( i = 0; i < MAX_NESTEDP2M; i++ )
> >>>>>>> -        p2m_flush_table(d->arch.nested_p2m[i]);
> >>>>>>> +    {
> >>>>>>> +        p2m = d->arch.nested_p2m[i];
> >>>>>>
> >>>>>> Please move the declaration here, making this the variable's
> >>>>>> initializer (unless line length constraints make the latter
> >>>>>> undesirable).
> >>>>>
> >>>>> I really don't get what difference this would make.
> >>>>
> >>>> Both choice of (generally) inappropriate types (further up)
> >>>> and placement of declarations (here) (and of course also
> >>>> other style violations) can set bad precedents even if in a
> >>>> specific case it may not matter much. So yes, it may be
> >>>> good enough here, but it would violate our desire to
> >>>> - use unsigned types when a variable will hold only non-
> >>>>   negative values (which in the general case may improve
> >>>>   generated code in particular on x86-64),
> >>>> - limit the scopes of variables as much as possible, to
> >>>>   more easily spot inappropriate uses (like bypassing
> >>>>   initialization).
> >>>>
> >>>> This code here actually demonstrates such a bad precedent,
> >>>> using plain int for the loop induction variable. While I
> >>>> can't be any way near sure, there's a certain chance you
> >>>> actually took it and copied it to
> >>>> __mem_sharing_unshare_page(). The chance of such happening
> >>>> is what we'd like to reduce over time.
> >>>
> >>> Yes, I copied it from p2m.c. All I meant was that such minor changes
> >>> are generally speaking not worth a round-trip of sending new patches.
> >>> I obviously don't care whether this is signed or unsigned. Minor stuff
> >>> like that could be changed on commit and is not even worth having a
> >>> discussion about.
> >>
> >> I'm sorry, but no. Committing ought to be a purely mechanical
> >> thing. It is a _courtesy_ of the committer if they offer to
> >> make adjustments. If us offering this regularly gets taken as
> >> "expected behavior", I'm afraid I personally would stop making
> >> such an offer, and instead insist on further round trips.
> >
> > So you requested changes I consider purely cosmetic, no objections to
> > any of them. It would be faster if you just made those changes -
> > literally 2 seconds - instead of insisting on this back and forth. I
> > really have no idea under what metric this saves *you* time. Now you
> > have to write emails to point out the issues and review the patch
> > twice, including the lag time of when the sender has time to do the
> > changes and resend the patches.
>
> For one, I didn't talk about either process saving time, I don't
> think. Then I had comments beyond these purely cosmetic ones.
> Therefore I didn't think it was justified to offer making the
> mechanical adjustments at commit time. Making such an offer will
> please remain subject to the individual's judgement, without
> having to justify _at all_ when not making such an offer.
>
> As to time savings - even if I had offered making these changes,
> I'd still have to give the respective comments. Both for your
> awareness (after all I'd be changing your patch, and you might
> not like me doing so), and to hopefully have the effect that in
> future submissions you'd take care of such aspects yourself
> right away (plus same for any possible observers of the thread).
>
> > I think this process is just bad for
> > everyone involved. And now you are saying out of principle you would
> > be insisting on more of this just to prove a point? Yea, that would
> > certainly solve the problem of commit lag and backlog of reviewing
> > patches. But it's your call, I really don't care enough to argue any
> > more about it.
>
> I have to admit that I find this odd: If there's disagreement,
> wouldn't it generally be better to get it resolved?
>

I don't see where the disagreement was, I had no objections to the
changes you requested. I don't like this unnecessary back and forth on
trivia. But v2 is sent. I'm moving on.

Tamas


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ADF2CF4AB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 20:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45035.80520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klGf2-000882-3L; Fri, 04 Dec 2020 19:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45035.80520; Fri, 04 Dec 2020 19:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klGf1-00087d-Vw; Fri, 04 Dec 2020 19:22:31 +0000
Received: by outflank-mailman (input) for mailman id 45035;
 Fri, 04 Dec 2020 19:22:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFnI=FI=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1klGf0-00087Y-Hm
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 19:22:30 +0000
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d24ba10b-1fc0-4efe-8960-61b4f6b10542;
 Fri, 04 Dec 2020 19:22:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k14so6396526wrn.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 11:22:29 -0800 (PST)
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
X-Inumbo-ID: d24ba10b-1fc0-4efe-8960-61b4f6b10542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U2r/GetwmXYgHPqz3uMBX3bV+rng2hbj+1NDhSnegOk=;
        b=BkPXYCGj8BrbumW/i/cfLOlPlRpXEAfc+g9HVmv5dw+vpVEQcn5Pa+7CFSiHZcAQ5J
         UnKJUlw0bkv3np1kUrdvzSgL/RfOwPSavL0PldrFvQT2LxfRaX7BcqYuXV0zhBcNxs2D
         HpsdQzrT88T7yR0FSaATtj8w1ok3fqf8AKAcTTwO3yhxW5Z99lw4C4b05BLBWJvNMWJ9
         ZxAgu+wWgnQo58jaj7xFvf/KK1RG8oDx8JkNWioijsAtvGP+ev79E6HaxSOrXmjx/IgG
         5SOtwMfqjH67BIT2JL9bLIRhopCKsP6ZmUg+JqQVSsprSFup+oupsPMutejNDkv0FmVA
         7pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U2r/GetwmXYgHPqz3uMBX3bV+rng2hbj+1NDhSnegOk=;
        b=h7mqt5ZTRaJKlIXMsCq0YpfrRU9i0iA5M5vYNe18hSnUJ1TRV2MKT+7dcV67UTg0NX
         EHfD5/AbRh5M5zSyYKUSKN4cSxIgOok8IHlXKhXGK3NLO6kX/lP6vCDV+9EhgZsAh99D
         YC5LGxDhPnWbtxG5SRpVGbcIFyVa9SZx1vzaStRcwUe7iLt1tuyy2NsUvW/ldzl07uSA
         lBZsOta1H2nTQ68OrMlQwu6NpW1P7LoxuXoR7rhQmkFckcFsroHHUWjO13+iTXp5CP47
         sU88WJQqJPY5m57sM4qHa8xhkA7AgOS3bU0FJOsqOFdaeZPdS1YIfspADU8zNiql8FVi
         h6aQ==
X-Gm-Message-State: AOAM532JH68Qg5oKzcNtI14IBCKU2ZNarlzUgP5qKMsJOwUCAMYaAs0l
	vbAsfrOF3WeJ7POvSrxLX3Oya1IyzU4m2MAAbVw=
X-Google-Smtp-Source: ABdhPJxlFwBeu2JJ6+d7r5NEFIMvlPxH6ytkM4SCA8GWAmdkJAL2Isuy4IR1G4KDNDSMhEzUBQVsbl5p+3pezL3vXuU=
X-Received: by 2002:a5d:51c2:: with SMTP id n2mr6684408wrv.326.1607109748651;
 Fri, 04 Dec 2020 11:22:28 -0800 (PST)
MIME-Version: 1.0
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com> <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com> <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
 <CABfawhkQcUD4f62zpg0cyrdQgG82XtpYRZZ_-50hjagooT530A@mail.gmail.com>
 <5862eb24-d894-455a-13ac-61af54f949e7@xen.org> <CABfawhkWQiOhLL8f3NzoWbeuag-f+YOOK0i_LJzZq5Yvoh=oHQ@mail.gmail.com>
In-Reply-To: <CABfawhkWQiOhLL8f3NzoWbeuag-f+YOOK0i_LJzZq5Yvoh=oHQ@mail.gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 4 Dec 2020 19:22:17 +0000
Message-ID: <CAJ=z9a2yEsvUcu8c=pjv5ymLgLHebZCJcTh7c+yeW44J6jDgWw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <lengyelt@ainfosec.com>, 
	Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Dec 2020 at 19:15, Tamas K Lengyel <tamas.k.lengyel@gmail.com> wrote:
>
> On Fri, Dec 4, 2020 at 10:29 AM Julien Grall <julien@xen.org> wrote:
> >
> >
> >
> > On 04/12/2020 15:21, Tamas K Lengyel wrote:
> > > On Fri, Dec 4, 2020 at 6:29 AM Julien Grall <julien@xen.org> wrote:
> > >>
> > >> Hi Jan,
> > >>
> > >> On 03/12/2020 10:09, Jan Beulich wrote:
> > >>> On 02.12.2020 22:10, Julien Grall wrote:
> > >>>> On 23/11/2020 13:30, Jan Beulich wrote:
> > >>>>> While there don't look to be any problems with this right now, the lock
> > >>>>> order implications from holding the lock can be very difficult to follow
> > >>>>> (and may be easy to violate unknowingly). The present callbacks don't
> > >>>>> (and no such callback should) have any need for the lock to be held.
> > >>>>>
> > >>>>> However, vm_event_disable() frees the structures used by respective
> > >>>>> callbacks and isn't otherwise synchronized with invocations of these
> > >>>>> callbacks, so maintain a count of in-progress calls, for evtchn_close()
> > >>>>> to wait to drop to zero before freeing the port (and dropping the lock).
> > >>>>
> > >>>> AFAICT, this callback is not the only place where the synchronization is
> > >>>> missing in the VM event code.
> > >>>>
> > >>>> For instance, vm_event_put_request() can also race against
> > >>>> vm_event_disable().
> > >>>>
> > >>>> So shouldn't we handle this issue properly in VM event?
> > >>>
> > >>> I suppose that's a question to the VM event folks rather than me?
> > >>
> > >> Yes. From my understanding of Tamas's e-mail, they are relying on the
> > >> monitoring software to do the right thing.
> > >>
> > >> I will refrain to comment on this approach. However, given the race is
> > >> much wider than the event channel, I would recommend to not add more
> > >> code in the event channel to deal with such problem.
> > >>
> > >> Instead, this should be fixed in the VM event code when someone has time
> > >> to harden the subsystem.
> > >
> > > I double-checked and the disable route is actually more robust, we
> > > don't just rely on the toolstack doing the right thing. The domain
> > > gets paused before any calls to vm_event_disable. So I don't think
> > > there is really a race-condition here.
> >
> > The code will *only* pause the monitored domain. I can see two issues:
> >     1) The toolstack is still sending event while destroy is happening.
> > This is the race discussed here.
> >     2) The implement of vm_event_put_request() suggests that it can be
> > called with not-current domain.
> >
> > I don't see how just pausing the monitored domain is enough here.
>
> Requests only get generated by the monitored domain.

If that's the case, then why is vm_event_put_request() able to
deal with a non-current domain?

I understand that you are possibly trusting who may call it, but this
looks quite fragile.

Cheers,

---


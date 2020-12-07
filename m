Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341D02D17A6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 18:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46899.83092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKR5-0001Vl-P4; Mon, 07 Dec 2020 17:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46899.83092; Mon, 07 Dec 2020 17:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKR5-0001VM-Le; Mon, 07 Dec 2020 17:36:31 +0000
Received: by outflank-mailman (input) for mailman id 46899;
 Mon, 07 Dec 2020 17:36:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Ca2=FL=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1kmKR4-0001VC-6g
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 17:36:30 +0000
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45ef6e1b-efe0-49d5-9720-17dcc621cc72;
 Mon, 07 Dec 2020 17:36:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v14so9270wml.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 09:36:29 -0800 (PST)
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
X-Inumbo-ID: 45ef6e1b-efe0-49d5-9720-17dcc621cc72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=44+jLF9ikTDp4rQKpwAdEvxyTfg13sgfo2WXJoKpSGs=;
        b=gy4FeTkIEwm9rPiKrFw5XITuv2Nn2ynlfPJDZzvFkYnTh+RI6/Eo6rFn0eXPp7Apow
         FZU4mYFJ6tNUbSxIWwObkGk3kjAu+UILfS46MoKS8yHn/gRatsgS1w3XA/e6kLvEfXqw
         zynWUzqsMJA8C2b9CduItN5y4SeI6snGctPcLgBkvVigWCVl6J+X6el5kQ+kJVV+9lqq
         af2iGW/G7MGFZJ6jiuLfXcIj1RLS98BGimIkzBarIxL6chhdUJNkPPRoCivGeHr6TQOl
         +4vXnET/zloKnXyIqyZ4/h2XuYzGOeoxrOxNqbBaueSYpM7yk+ZEraAhXGKOf6XwBcfS
         fuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=44+jLF9ikTDp4rQKpwAdEvxyTfg13sgfo2WXJoKpSGs=;
        b=mosWabCcII410HCJH8DJZHvkpl9OUMskTXtxdQ2r8oXiPNXcSSeB8pATiQRmT3LuAP
         0NzuiIAS6AF+ZyF9/148FpWbuZpjkv4edQ5YHK7sOXWZJ8rrI46z0GpfAkcZ1DzTDct4
         Dk+9NDvwxmgpQGIyzSxkGsOXOeS0O+/CKQrNzB2NKXUn1q9QynSCYw0aFdRhDWJYCJrU
         UqUON0uAuTDY7Z1OJhISkEUMIpcJW9LRtHtib1GmzxgsUlWotq799oYzdZHGVw/wZnUs
         UNZje3XeKY7jPrwOdVScIaRAojcPvcdqRlUXukRRToRi3q9hKyDD64rgmthkxjsw2GA8
         3VkQ==
X-Gm-Message-State: AOAM530NDbY4X2SSdDzI1b24G9rC0FshyCMcEEZX9+fVr5eKK+ebgWO0
	SSRuLhWAt7gFso/+h0rSK8djx7P0iQcqMlNXfV0=
X-Google-Smtp-Source: ABdhPJwrteo10U0BkrPMW2DDXr7730Ns+a+ona8pG2RkgNuTYPsEjpHyVLzV4606kvyfOtzBLinVnR7sN8FC+WTAl04=
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr19690029wmh.51.1607362588389;
 Mon, 07 Dec 2020 09:36:28 -0800 (PST)
MIME-Version: 1.0
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com> <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com> <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
 <CABfawhkQcUD4f62zpg0cyrdQgG82XtpYRZZ_-50hjagooT530A@mail.gmail.com>
 <5862eb24-d894-455a-13ac-61af54f949e7@xen.org> <CABfawhkWQiOhLL8f3NzoWbeuag-f+YOOK0i_LJzZq5Yvoh=oHQ@mail.gmail.com>
 <fd384990-376e-40f4-f0b8-1a889b3a0c51@suse.com> <9ee6016a-d3b3-c847-4775-0e05c8578110@xen.org>
In-Reply-To: <9ee6016a-d3b3-c847-4775-0e05c8578110@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 7 Dec 2020 12:35:52 -0500
Message-ID: <CABfawhkcHX+FSRRfYwUNd8DweW04=91sSg2PTWy7vjq_DXwMQg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <lengyelt@ainfosec.com>, 
	Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 7, 2020 at 12:30 PM Julien Grall <julien@xen.org> wrote:
>
> Hi Jan,
>
> On 07/12/2020 15:28, Jan Beulich wrote:
> > On 04.12.2020 20:15, Tamas K Lengyel wrote:
> >> On Fri, Dec 4, 2020 at 10:29 AM Julien Grall <julien@xen.org> wrote:
> >>> On 04/12/2020 15:21, Tamas K Lengyel wrote:
> >>>> On Fri, Dec 4, 2020 at 6:29 AM Julien Grall <julien@xen.org> wrote:
> >>>>> On 03/12/2020 10:09, Jan Beulich wrote:
> >>>>>> On 02.12.2020 22:10, Julien Grall wrote:
> >>>>>>> On 23/11/2020 13:30, Jan Beulich wrote:
> >>>>>>>> While there don't look to be any problems with this right now, the lock
> >>>>>>>> order implications from holding the lock can be very difficult to follow
> >>>>>>>> (and may be easy to violate unknowingly). The present callbacks don't
> >>>>>>>> (and no such callback should) have any need for the lock to be held.
> >>>>>>>>
> >>>>>>>> However, vm_event_disable() frees the structures used by respective
> >>>>>>>> callbacks and isn't otherwise synchronized with invocations of these
> >>>>>>>> callbacks, so maintain a count of in-progress calls, for evtchn_close()
> >>>>>>>> to wait to drop to zero before freeing the port (and dropping the lock).
> >>>>>>>
> >>>>>>> AFAICT, this callback is not the only place where the synchronization is
> >>>>>>> missing in the VM event code.
> >>>>>>>
> >>>>>>> For instance, vm_event_put_request() can also race against
> >>>>>>> vm_event_disable().
> >>>>>>>
> >>>>>>> So shouldn't we handle this issue properly in VM event?
> >>>>>>
> >>>>>> I suppose that's a question to the VM event folks rather than me?
> >>>>>
> >>>>> Yes. From my understanding of Tamas's e-mail, they are relying on the
> >>>>> monitoring software to do the right thing.
> >>>>>
> >>>>> I will refrain to comment on this approach. However, given the race is
> >>>>> much wider than the event channel, I would recommend to not add more
> >>>>> code in the event channel to deal with such problem.
> >>>>>
> >>>>> Instead, this should be fixed in the VM event code when someone has time
> >>>>> to harden the subsystem.
> >>>>
> >>>> I double-checked and the disable route is actually more robust, we
> >>>> don't just rely on the toolstack doing the right thing. The domain
> >>>> gets paused before any calls to vm_event_disable. So I don't think
> >>>> there is really a race-condition here.
> >>>
> >>> The code will *only* pause the monitored domain. I can see two issues:
> >>>      1) The toolstack is still sending event while destroy is happening.
> >>> This is the race discussed here.
> >>>      2) The implement of vm_event_put_request() suggests that it can be
> >>> called with not-current domain.
> >>>
> >>> I don't see how just pausing the monitored domain is enough here.
> >>
> >> Requests only get generated by the monitored domain. So if the domain
> >> is not running you won't get more of them. The toolstack can only send
> >> replies.
> >
> > Julien,
> >
> > does this change your view on the refcounting added by the patch
> > at the root of this sub-thread?
>
> I still think the code is at best fragile. One example I can find is:
>
>    -> guest_remove_page()
>      -> p2m_mem_paging_drop_page()
>       -> vm_event_put_request()
>
> guest_remove_page() is not always call on the current domain. So there
> are possibility for vm_event_put_request() to happen on a foreign domain
> and therefore wouldn't be protected by the current hypercall.
>
> Anyway, I don't think the refcounting should be part of the event
> channel without any idea on how this would fit in fixing the VM event race.

If the problematic patterns only appear with mem_paging I would
suggest just removing the mem_paging code completely. It's been
abandoned for several years now.

Tamas


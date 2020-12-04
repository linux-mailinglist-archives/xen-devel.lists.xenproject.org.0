Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771852CF094
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 16:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44892.80316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klCuT-0006IT-DO; Fri, 04 Dec 2020 15:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44892.80316; Fri, 04 Dec 2020 15:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klCuT-0006I4-A9; Fri, 04 Dec 2020 15:22:13 +0000
Received: by outflank-mailman (input) for mailman id 44892;
 Fri, 04 Dec 2020 15:22:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VOLy=FI=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1klCuR-0006Hz-RP
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 15:22:11 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4db20e5d-84bf-4a5f-841e-8e079aedb096;
 Fri, 04 Dec 2020 15:22:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k14so5704547wrn.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 07:22:10 -0800 (PST)
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
X-Inumbo-ID: 4db20e5d-84bf-4a5f-841e-8e079aedb096
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QUeOFftGxRLW9PKuJNKArkPnQ1h/QDbCkiM1yo1Bi10=;
        b=I0IIGRq9limyEPu5zReHeh4uQmINXn8c79MoYumI3/PVqt33ELgb5pQJq6WbiHQ3uq
         vTNBWPbQvyiOurs4JbaYMe60lqVMtm/o+NStYwA9jdSgHii272MYdZK2TJKg4TuyJdo5
         VaYJl9fIk0G7DVFT6KPtJvgM8CKOkbEvk7ne4ipF3R6e1whJw8sfUMYGZcq0pblA9nt0
         79jQZYSALJopVyn9gFBlbM6QrcbTCy3DpaXVeYnnmXK9XrzW1EACrCaiXNJwuOGaqzir
         7YZPkJNgCTYqPSzTNaEjlz41c4fvUdotBm2VBbaHHzg0BFEpyu3xzG+f870SKp9abLU0
         6nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QUeOFftGxRLW9PKuJNKArkPnQ1h/QDbCkiM1yo1Bi10=;
        b=j1Wii2Hc+Rg949YC8ztsAQULxzrdtpF6XsUEi+E+WkYCy/DD8r7c2sLsiLrYcSyaKs
         5K4P+xi5Vf4kw3z2AuO45P5XYkbkaY4nsBFFaeqIgnPm/JQjb2JkZ0W2Xbf5yBaZ5ufS
         JVdBinJtnPFaJ3P4hJrHBFe1uHIQIIgXyOW9O/rn9E4niyfPvrDYu47Z46ky+TDchg0n
         V6hjpBo57uT4dYjKfmwPYzS/l2Yqw5NphA1KBsAr4QK5/rAXXFj0aTutusWUtiAlhyfO
         jStnoyz7wyFLFDimL8FN4cU7qgb2zFKccrhItNyxlXzH6Zj9pN3o5PwfNdrm5TjUTLxW
         p3hA==
X-Gm-Message-State: AOAM532IGx4Om/486Pe1yYz1JYAKesFkKKjOrAxKR3R3FAsxbF0WliKX
	Fjl3oXogWy2nN1C96F5imjmD11DAoCxdB4EPyC4=
X-Google-Smtp-Source: ABdhPJwNDiMyt7HazIIMyu5+0kK9tqgCNzVO1Du9W4h0ZaWZwzYOXC1KzBwtfuhxYDqfBEcLzkmJZk12AFjdF+hLtwY=
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr5432865wrm.259.1607095330018;
 Fri, 04 Dec 2020 07:22:10 -0800 (PST)
MIME-Version: 1.0
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d821c715-966a-b48b-a877-c5dac36822f0@suse.com> <17c90493-b438-fbc1-ca10-3bc4d89c4e5e@xen.org>
 <7a768bcd-80c1-d193-8796-7fb6720fa22a@suse.com> <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
In-Reply-To: <1a8250f5-ea49-ac3a-e992-be7ec40deba9@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 4 Dec 2020 10:21:34 -0500
Message-ID: <CABfawhkQcUD4f62zpg0cyrdQgG82XtpYRZZ_-50hjagooT530A@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tamas K Lengyel <lengyelt@ainfosec.com>, 
	Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 4, 2020 at 6:29 AM Julien Grall <julien@xen.org> wrote:
>
> Hi Jan,
>
> On 03/12/2020 10:09, Jan Beulich wrote:
> > On 02.12.2020 22:10, Julien Grall wrote:
> >> On 23/11/2020 13:30, Jan Beulich wrote:
> >>> While there don't look to be any problems with this right now, the lock
> >>> order implications from holding the lock can be very difficult to follow
> >>> (and may be easy to violate unknowingly). The present callbacks don't
> >>> (and no such callback should) have any need for the lock to be held.
> >>>
> >>> However, vm_event_disable() frees the structures used by respective
> >>> callbacks and isn't otherwise synchronized with invocations of these
> >>> callbacks, so maintain a count of in-progress calls, for evtchn_close()
> >>> to wait to drop to zero before freeing the port (and dropping the lock).
> >>
> >> AFAICT, this callback is not the only place where the synchronization is
> >> missing in the VM event code.
> >>
> >> For instance, vm_event_put_request() can also race against
> >> vm_event_disable().
> >>
> >> So shouldn't we handle this issue properly in VM event?
> >
> > I suppose that's a question to the VM event folks rather than me?
>
> Yes. From my understanding of Tamas's e-mail, they are relying on the
> monitoring software to do the right thing.
>
> I will refrain to comment on this approach. However, given the race is
> much wider than the event channel, I would recommend to not add more
> code in the event channel to deal with such problem.
>
> Instead, this should be fixed in the VM event code when someone has time
> to harden the subsystem.

I double-checked and the disable route is actually more robust, we
don't just rely on the toolstack doing the right thing. The domain
gets paused before any calls to vm_event_disable. So I don't think
there is really a race-condition here.

Tamas


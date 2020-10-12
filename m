Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72F828B1F8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 12:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5880.15265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRujP-0003Eg-4C; Mon, 12 Oct 2020 10:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5880.15265; Mon, 12 Oct 2020 10:07:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRujP-0003EH-0Q; Mon, 12 Oct 2020 10:07:03 +0000
Received: by outflank-mailman (input) for mailman id 5880;
 Mon, 12 Oct 2020 10:07:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K42p=DT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kRujN-0003EC-Jd
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 10:07:01 +0000
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5333952d-ab81-4640-96ce-a4d3ff65e0b3;
 Mon, 12 Oct 2020 10:07:00 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id x7so12250009eje.8
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 03:07:00 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id q14sm10390603ejo.53.2020.10.12.03.06.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Oct 2020 03:06:59 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=K42p=DT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kRujN-0003EC-Jd
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 10:07:01 +0000
X-Inumbo-ID: 5333952d-ab81-4640-96ce-a4d3ff65e0b3
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5333952d-ab81-4640-96ce-a4d3ff65e0b3;
	Mon, 12 Oct 2020 10:07:00 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id x7so12250009eje.8
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=iLqiTpZxgc/OLVw6/LsTqY/o+SmgB8y8C7ZiDO+xLT0=;
        b=vHPfGfgg/bEhxH5IY6ovi2jaZ3v0L2k7uWVY64++h97w5A2Tqkej6tHgmS0T/jzFlT
         XDy33GrpbhdDy2SxhxEYxn6mYRi85/v+NE3xeLVa31hg34bbwnUMC1bSYUHBqjgpJ79M
         jYu+OJ9xx20ewTuzaj9qy1NWucVIYUivqPK7LytBiNYD6RCuYr3B8/kuxHg0MOqLjuSY
         O18zTbRGO0y2ARJM4YSvFIQP30G+Spq5aeAFubleBIgQsUlrD3lqLPeO8LxwvsC16Hhu
         Z56KDIn2pGFJQJXYEByEXu+z0JkVJxWK4XE20sk9i6sAuV/q9ltuoTt1cGQydRCNJw3m
         PCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=iLqiTpZxgc/OLVw6/LsTqY/o+SmgB8y8C7ZiDO+xLT0=;
        b=cKV1fDx9QfeYs1W0JBjk3ecGe16ICPrmrrC3fLsYxhItMDbny4HtRVFIbr+rESu9pH
         yub/0+4si4Bmi9XCxlnI6nWk5/8SAlaT2KT6hD2zOi8cnFAVuwnKZNJdtSSvEPspffQG
         o3y/U4nV0cqyMHq383Jn1mlNAeleg4rbsrjtgG3plrBtFLcbFgk87QuhCs129bAdaE8K
         5/uv826YHTJviFKFdrxE50cuqHYtHAz7cFZQbrkOgAwmH//FtmMj50GfSPGYxVfYwM8z
         OLW4+ZpUg2sOSmQSjdwLRpWz6fHXbocSZOIXa0vn5tgy2lTk9Kdni/7/1+ShFuB/mxQ7
         DzAA==
X-Gm-Message-State: AOAM530EKdUuZhx4kZMgXwenbeL8QoW2IaaJ5Q03o2jAhQydkFwUIn0b
	d+/LHOsH0Ypu4TOTY6BVQo4=
X-Google-Smtp-Source: ABdhPJzeLZcEUDCJplATepx+CwwQ8Fwe38PL9VJqG557e3dj9YIJ6WjG/+iT/eirgJnx/wkkXujhkg==
X-Received: by 2002:a17:906:f0d8:: with SMTP id dk24mr27043057ejb.492.1602497219695;
        Mon, 12 Oct 2020 03:06:59 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
        by smtp.gmail.com with ESMTPSA id q14sm10390603ejo.53.2020.10.12.03.06.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2020 03:06:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>
References: <20201012092740.1617-1-jgross@suse.com> <20201012092740.1617-2-jgross@suse.com> <001101d6a07c$cf7c7f80$6e757e80$@xen.org> <4fec0346-6048-723c-f5c6-50c3f68f508a@suse.com>
In-Reply-To: <4fec0346-6048-723c-f5c6-50c3f68f508a@suse.com>
Subject: RE: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id together
Date: Mon, 12 Oct 2020 11:06:58 +0100
Message-ID: <001201d6a07f$6c3d0f40$44b72dc0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJ57sLa/Hg8NzwnPjAH3Ul9dW38wQCnOCG/Al1KAfICVpOi4qgiSBTw

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 12 October 2020 10:56
> To: paul@xen.org; xen-devel@lists.xenproject.org
> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Ian
> Jackson' <iwj@xenproject.org>; 'Jan Beulich' <jbeulich@suse.com>; =
'Julien Grall' <julien@xen.org>;
> 'Stefano Stabellini' <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH v2 1/2] xen/events: access last_priority and =
last_vcpu_id together
>=20
> On 12.10.20 11:48, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of Juergen Gross
> >> Sent: 12 October 2020 10:28
> >> To: xen-devel@lists.xenproject.org
> >> Cc: Juergen Gross <jgross@suse.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George Dunlap
> >> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Jan =
Beulich <jbeulich@suse.com>;
> Julien
> >> Grall <julien@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> >> Subject: [PATCH v2 1/2] xen/events: access last_priority and =
last_vcpu_id together
> >>
> >> The queue for a fifo event is depending on the vcpu_id and the
> >> priority of the event. When sending an event it might happen the
> >> event needs to change queues and the old queue needs to be kept for
> >> keeping the links between queue elements intact. For this purpose
> >> the event channel contains last_priority and last_vcpu_id values
> >> elements for being able to identify the old queue.
> >>
> >> In order to avoid races always access last_priority and =
last_vcpu_id
> >> with a single atomic operation avoiding any inconsistencies.
> >>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> ---
> >>   xen/common/event_fifo.c | 25 +++++++++++++++++++------
> >>   xen/include/xen/sched.h |  3 +--
> >>   2 files changed, 20 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
> >> index fc189152e1..fffbd409c8 100644
> >> --- a/xen/common/event_fifo.c
> >> +++ b/xen/common/event_fifo.c
> >> @@ -42,6 +42,14 @@ struct evtchn_fifo_domain {
> >>       unsigned int num_evtchns;
> >>   };
> >>
> >> +union evtchn_fifo_lastq {
> >> +    u32 raw;
> >> +    struct {
> >> +        u8 last_priority;
> >> +        u16 last_vcpu_id;
> >> +    };
> >> +};
> >
> > I guess you want to s/u32/uint32_t, etc. above.
>=20
> Hmm, yes, probably.
>=20
> >
> >> +
> >>   static inline event_word_t *evtchn_fifo_word_from_port(const =
struct domain *d,
> >>                                                          unsigned =
int port)
> >>   {
> >> @@ -86,16 +94,18 @@ static struct evtchn_fifo_queue =
*lock_old_queue(const struct domain *d,
> >>       struct vcpu *v;
> >>       struct evtchn_fifo_queue *q, *old_q;
> >>       unsigned int try;
> >> +    union evtchn_fifo_lastq lastq;
> >>
> >>       for ( try =3D 0; try < 3; try++ )
> >>       {
> >> -        v =3D d->vcpu[evtchn->last_vcpu_id];
> >> -        old_q =3D &v->evtchn_fifo->queue[evtchn->last_priority];
> >> +        lastq.raw =3D read_atomic(&evtchn->fifo_lastq);
> >> +        v =3D d->vcpu[lastq.last_vcpu_id];
> >> +        old_q =3D &v->evtchn_fifo->queue[lastq.last_priority];
> >>
> >>           spin_lock_irqsave(&old_q->lock, *flags);
> >>
> >> -        v =3D d->vcpu[evtchn->last_vcpu_id];
> >> -        q =3D &v->evtchn_fifo->queue[evtchn->last_priority];
> >> +        v =3D d->vcpu[lastq.last_vcpu_id];
> >> +        q =3D &v->evtchn_fifo->queue[lastq.last_priority];
> >>
> >>           if ( old_q =3D=3D q )
> >>               return old_q;
> >> @@ -246,8 +256,11 @@ static void evtchn_fifo_set_pending(struct =
vcpu *v, struct evtchn *evtchn)
> >>           /* Moved to a different queue? */
> >>           if ( old_q !=3D q )
> >>           {
> >> -            evtchn->last_vcpu_id =3D v->vcpu_id;
> >> -            evtchn->last_priority =3D q->priority;
> >> +            union evtchn_fifo_lastq lastq;
> >> +
> >> +            lastq.last_vcpu_id =3D v->vcpu_id;
> >> +            lastq.last_priority =3D q->priority;
> >> +            write_atomic(&evtchn->fifo_lastq, lastq.raw);
> >>
> >
> > You're going to leak some stack here I think. Perhaps add a 'pad' =
field between 'last_priority' and
> 'last_vcpu_id' and zero it?
>=20
> I can do that, but why? This is nothing a guest is supposed to see at
> any time.

True, but it would also be nice if the value of 'raw' was at least =
predictable. I guest just adding '=3D {}' to the declaration would =
actually be easiest.

  Paul

>=20
>=20
> Juergen



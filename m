Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470D27F9D2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 09:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051.3518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNsZJ-0001CI-FO; Thu, 01 Oct 2020 06:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051.3518; Thu, 01 Oct 2020 06:59:57 +0000
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
	id 1kNsZJ-0001Bw-CP; Thu, 01 Oct 2020 06:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1051;
 Thu, 01 Oct 2020 06:59:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=937a=DI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNsZH-0001Br-Ol
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 06:59:55 +0000
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6533c48-da5e-41da-8d3a-298a2425e4db;
 Thu, 01 Oct 2020 06:59:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id w2so1769306wmi.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 23:59:54 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id t203sm7160772wmg.43.2020.09.30.23.59.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 23:59:52 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=937a=DI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNsZH-0001Br-Ol
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 06:59:55 +0000
X-Inumbo-ID: b6533c48-da5e-41da-8d3a-298a2425e4db
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b6533c48-da5e-41da-8d3a-298a2425e4db;
	Thu, 01 Oct 2020 06:59:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id w2so1769306wmi.1
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 23:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=/2QLOoIB2PGnNVH5UAQp2lhtkL+ccrvHD5Cl+TFmmWc=;
        b=Gy8OB9RLLg/qKRM9xSuEyp1GLAzt4XYRQvz4hNJVjeMPnu7PeHaEvNb8WihROhEDL6
         hRd8gzDYiBFBdSVBQ+fOiCPgqPQZ3XmZGNxSwxzPnxzdK5JlJTNz1rZ6XYlf19xUECvX
         gHoalGtxSYBIpr2WpzoFxatvFGHRUaAgfetcRnoKpL7YzL31MaJYO698qOPzvcO2q+xl
         i3uh4q4lEE/3Yfexy/HxeSPYZgTNauApBB68cTZ4uTathgURt0FUJ0/tWwKs+d9ZE/uz
         k4gPiWTIj6ck3K0UOowoPy613qgnCF0zSrRCm0ouotlV68HH8nKpFvrIOYlhh89eB9uU
         lduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=/2QLOoIB2PGnNVH5UAQp2lhtkL+ccrvHD5Cl+TFmmWc=;
        b=XHZbfx8gL7ARG643kuAzdXzAedKrcPubD/1M6dB+/b0K2aA3CfIxmrbI90xZq2nFgf
         SwXnf22MbY/4aGFjBfd0Vhlu/wP8a/2S5ZT9vs9/F/yB4bkntQtjsQrlZayRZ/O6hzPM
         0bXGF7WZlu106Eikrx65xokuvWMCbyALfbTWj7sOWyN+kKnbz9dR2IT9n5OQ7vcWfB4a
         Is2xL0OYZUXlYjya9WXxhFAR3DGhVvld7w3MyjYHSnJDXj8wvl2OmDoRf2MP2UOuL+vu
         S81yXuk6Qr7jcqdvkN5AhRMD9CABTdzQyzcHqNWVa896Q9vqZvvS0gwRHKYfyQwZoDos
         mhuQ==
X-Gm-Message-State: AOAM533gtL+cifAaDZRKiz+L2JV5dD+bOUSdRP+vKu4hMriVlLbspMw8
	Ca9y6NhaGgtbV6hwEwNrtM0=
X-Google-Smtp-Source: ABdhPJz3ZLvC+5lBbW/R/WXDQrx4i75tnvS2iYuoZFMiY7aGj5t+2TOuuztNSCyoqdhQRIt0Zoz+iw==
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr6667378wmc.148.1601535593389;
        Wed, 30 Sep 2020 23:59:53 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id t203sm7160772wmg.43.2020.09.30.23.59.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 23:59:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	"'Oleksandr'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <ian.jackson@eu.citrix.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Jun Nakajima'" <jun.nakajima@intel.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	"'Tim Deegan'" <tim@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com> <1599769330-17656-3-git-send-email-olekstysh@gmail.com> <3997a705-ccb1-4b8f-41ca-c5507360c759@xen.org> <000201d69314$97bd8fa0$c738aee0$@xen.org> <c9131bce-f028-2824-9ffc-b4db08017569@gmail.com> <2cbe7efd-f356-0f1b-0bb1-bfb2243f180c@xen.org>
In-Reply-To: <2cbe7efd-f356-0f1b-0bb1-bfb2243f180c@xen.org>
Subject: RE: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
Date: Thu, 1 Oct 2020 07:59:51 +0100
Message-ID: <008701d697c0$763c32e0$62b498a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIQ4beZ3sUmYihKXwfoVgy4BRIJGwHfeJxHAedMvHMBMIgdOgK34vRDAgTQpPuowBZCsA==

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 30 September 2020 18:48
> To: Oleksandr <olekstysh@gmail.com>; xen-devel@lists.xenproject.org
> Cc: paul@xen.org; 'Oleksandr Tyshchenko' =
<oleksandr_tyshchenko@epam.com>; 'Andrew Cooper'
> <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Ian Jackson'
> <ian.jackson@eu.citrix.com>; 'Jan Beulich' <jbeulich@suse.com>; =
'Stefano Stabellini'
> <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>; 'Roger Pau =
Monn=C3=A9' <roger.pau@citrix.com>; 'Jun
> Nakajima' <jun.nakajima@intel.com>; 'Kevin Tian' =
<kevin.tian@intel.com>; 'Tim Deegan' <tim@xen.org>;
> 'Julien Grall' <julien.grall@arm.com>
> Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature =
common
>=20
> Hi,
>=20
> On 30/09/2020 14:39, Oleksandr wrote:
> >
> > Hi Julien
> >
> > On 25.09.20 11:19, Paul Durrant wrote:
> >>> -----Original Message-----
> >>> From: Julien Grall <julien@xen.org>
> >>> Sent: 24 September 2020 19:01
> >>> To: Oleksandr Tyshchenko <olekstysh@gmail.com>;
> >>> xen-devel@lists.xenproject.org
> >>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew
> >>> Cooper <andrew.cooper3@citrix.com>;
> >>> George Dunlap <george.dunlap@citrix.com>; Ian Jackson
> >>> <ian.jackson@eu.citrix.com>; Jan Beulich
> >>> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; =
Wei
> >>> Liu <wl@xen.org>; Roger Pau
> >>> Monn=C3=A9 <roger.pau@citrix.com>; Paul Durrant <paul@xen.org>; =
Jun
> >>> Nakajima <jun.nakajima@intel.com>;
> >>> Kevin Tian <kevin.tian@intel.com>; Tim Deegan <tim@xen.org>; =
Julien
> >>> Grall <julien.grall@arm.com>
> >>> Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature =
common
> >>>
> >>>
> >>>
> >>> On 10/09/2020 21:21, Oleksandr Tyshchenko wrote:
> >>>> +static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t =
*p)
> >>>> +{
> >>>> +    unsigned int prev_state =3D STATE_IOREQ_NONE;
> >>>> +    unsigned int state =3D p->state;
> >>>> +    uint64_t data =3D ~0;
> >>>> +
> >>>> +    smp_rmb();
> >>>> +
> >>>> +    /*
> >>>> +     * The only reason we should see this condition be false is
> >>>> when an
> >>>> +     * emulator dying races with I/O being requested.
> >>>> +     */
> >>>> +    while ( likely(state !=3D STATE_IOREQ_NONE) )
> >>>> +    {
> >>>> +        if ( unlikely(state < prev_state) )
> >>>> +        {
> >>>> +            gdprintk(XENLOG_ERR, "Weird HVM ioreq state =
transition
> >>>> %u -> %u\n",
> >>>> +                     prev_state, state);
> >>>> +            sv->pending =3D false;
> >>>> +            domain_crash(sv->vcpu->domain);
> >>>> +            return false; /* bail */
> >>>> +        }
> >>>> +
> >>>> +        switch ( prev_state =3D state )
> >>>> +        {
> >>>> +        case STATE_IORESP_READY: /* IORESP_READY -> NONE */
> >>>> +            p->state =3D STATE_IOREQ_NONE;
> >>>> +            data =3D p->data;
> >>>> +            break;
> >>>> +
> >>>> +        case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} ->
> >>>> IORESP_READY */
> >>>> +        case STATE_IOREQ_INPROCESS:
> >>>> +            wait_on_xen_event_channel(sv->ioreq_evtchn,
> >>>> +                                      ({ state =3D p->state;
> >>>> +                                         smp_rmb();
> >>>> +                                         state !=3D prev_state; =
}));
> >>>> +            continue;
> >>> As I pointed out previously [1], this helper was implemented with =
the
> >>> expectation that wait_on_xen_event_channel() will not return if =
the vCPU
> >>> got rescheduled.
> >>>
> >>> However, this assumption doesn't hold on Arm.
> >>>
> >>> I can see two solution:
> >>>      1) Re-execute the caller
> >>>      2) Prevent an IOREQ to disappear until the loop finish.
> >>>
> >>> @Paul any opinions?
> >> The ioreq control plane is largely predicated on there being no
> >> pending I/O when the state of a server is modified, and it is =
assumed
> >> that domain_pause() is sufficient to achieve this. If that =
assumption
> >> doesn't hold then we need additional synchronization.
>=20
> I don't think this assumption even hold on x86 because domain_pause()
> will not wait for I/O to finish.
>=20
> On x86, the context switch will reset the stack and therefore
> wait_on_xen_event_channel() is not going to return. Instead,
> handle_hvm_io_completion() will be called from the tail callback in
> context_switch(). get_pending_vcpu() would return NULL as the IOREQ
> server disappeared. Although, it is not clear whether the vCPU will
> continue to run (or not).
>=20
> Did I miss anything?
>=20
> Regarding the fix itself, I am not sure what sort of synchronization =
we
> can do. Are you suggesting to wait for the I/O to complete? If so, how
> do we handle the case the IOREQ server died?
>=20

s/IOREQ server/emulator but that is a good point. If domain_pause() did =
wait for I/O to complete then this would have always been a problem so, =
with hindsight, it should have been obvious this was not the case.

Digging back, it looks like things would have probably been ok before =
125833f5f1f0 "x86: fix ioreq-server event channel vulnerability" =
because, wait_on_xen_event_channel() and the loop condition above it did =
not dereference anything that would disappear with IOREQ server =
destruction (they used the shared page, which at this point was always a =
magic page and hence part of the target domain's memory). So things have =
probably been broken since 2014.

To fix the problem I think it is sufficient that we go back to a wait =
loop that can tolerate the IOREQ server disappearing between iterations =
and deals with that as a completed emulation (albeit returning f's for =
reads and sinking writes).

  Paul

> > May I please clarify whether a concern still stands (with what was =
said
> > above) and we need an additional synchronization on Arm?
>=20
> Yes the concern is still there (See above).
>=20
> Cheers,
>=20
> --
> Julien Grall



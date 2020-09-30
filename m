Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C891C27E42E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 10:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.504.1632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNXqh-0006kX-Jd; Wed, 30 Sep 2020 08:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504.1632; Wed, 30 Sep 2020 08:52:31 +0000
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
	id 1kNXqh-0006k8-GU; Wed, 30 Sep 2020 08:52:31 +0000
Received: by outflank-mailman (input) for mailman id 504;
 Wed, 30 Sep 2020 08:52:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNXqg-0006k1-1X
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:52:30 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d17d9d3d-9dac-40bb-84f9-104a5b60bc7a;
 Wed, 30 Sep 2020 08:52:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k10so838781wru.6
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 01:52:29 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id l5sm1553452wmf.10.2020.09.30.01.52.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 01:52:27 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNXqg-0006k1-1X
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 08:52:30 +0000
X-Inumbo-ID: d17d9d3d-9dac-40bb-84f9-104a5b60bc7a
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d17d9d3d-9dac-40bb-84f9-104a5b60bc7a;
	Wed, 30 Sep 2020 08:52:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k10so838781wru.6
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=TwUH+pU1DVZzCGdT9oWxRp///fL2X4MDZMTcYomBQg0=;
        b=LDtBQV52xDgkFkwsS036XBOhrj9wj/koDtu2gbyUdKl3Xh+kyriFwQVTOqec69F3Nb
         pbOzXCxocpuowlfxvl0H6zpATHPFf+10dEmLeiROkQq8fBfFVXxguvtPiBipjKTUqI85
         tJAGZYnaxLMT5S5o0p6TePRbIIk/L/R1ZMd2cgm2yfabXJC7HdSah88zk0H/3qVdh0kF
         ZBb70rl4h2wbl6U9q6LRvI3UF/sNwinl+pjwc20HhyW3AiHT7suutlfRX3UC0KQc1PDy
         a5YtO8GRAm5SYcZtDJbLNVS626p4FzpQOHRNFqChG8qh2gB4JJCICC1gD6yZ7kYVz7A8
         8oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=TwUH+pU1DVZzCGdT9oWxRp///fL2X4MDZMTcYomBQg0=;
        b=J0HOfGAZLTsAdwbbtWf2MWWXgAdpUdrGZYGJc5/KmUvGnJmGG/y5eVjeNDAsAM3Qdp
         ejNqsBzlWkGQTK6SEu7pux3lv0jCVz5l/Vvhqclb5EzyWQhF+mESvJxwY5yqosmljO7M
         5AyVoMMt55SSANr5EW960233QajS7xHIFLMBVhjiE47cJC2fTOCDW7Np5iBke+uch/Jf
         dHUy0DMSk3KTJiiu926D0kTpxQNoRR2FWSLH4PU8YzKt1A9QL/OG2RFncldxzCPs941l
         Is2CfE5p8nazvMDyqT0mfpdKETxQ+kKNOt3t6jSZajXm6TymfkhWbcgibclpgretCqrw
         Nm7A==
X-Gm-Message-State: AOAM532e2gVkD97tZG0Y4YgJ+H5aHwB16/Mr3GoVouVioN0zOCQNJQuK
	faK+gi24UwM2O3YJKhSyeSk=
X-Google-Smtp-Source: ABdhPJwdmxsy/KziiOqpK5nXYrgRSGhQszCx+MhYMPxdpF3UM417U4V2aKUC0Q9OKlzvDGaq1NZy1A==
X-Received: by 2002:a05:6000:1c8:: with SMTP id t8mr1876220wrx.3.1601455948407;
        Wed, 30 Sep 2020 01:52:28 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id l5sm1553452wmf.10.2020.09.30.01.52.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 01:52:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com> <004b01d696ff$76873e50$6395baf0$@xen.org> <92d2714b-d762-2f15-086f-58257e3336a8@suse.com>
In-Reply-To: <92d2714b-d762-2f15-086f-58257e3336a8@suse.com>
Subject: RE: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
Date: Wed, 30 Sep 2020 09:52:26 +0100
Message-ID: <006401d69707$062a5090$127ef1b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgJbMrw1AUa5QAcBYA4Y66kguybw

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 30 September 2020 09:37
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'George Dunlap'
> <George.Dunlap@eu.citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; =
'Julien Grall' <julien@xen.org>;
> 'Wei Liu' <wl@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>
> Subject: Re: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
>=20
> On 30.09.2020 09:58, Paul Durrant wrote:
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of Jan Beulich
> >> Sent: 28 September 2020 12:02
> >>
> >> @@ -334,6 +334,12 @@ void _spin_unlock_recursive(spinlock_t *
> >>      }
> >>  }
> >>
> >> +void _rw_barrier(rwlock_t *lock)
> >> +{
> >> +    check_barrier(&lock->lock.debug);
> >> +    do { smp_mb(); } while ( _rw_is_locked(lock) );
> >> +}
> >
> > Should you not have a cpu_relax() somewhere in here?
> >
> > TBH though, the fact this lock is never taken as a writer makes me
> > wonder whether there needs to be a lock at all.
>=20
> For both of these - see the discussion Julien and I also had. The
> construct will now move to the subsequent patch anyway, and change
> as per Julien's request.
>=20

OK.

Looking again, given that both send_guest_vcpu_virq() and =
send_guest_global_virq() (rightly) hold the evtchn lock before calling =
evtchn_port_set_pending() I think you could do away with the virq lock =
by adding checks in those functions to verify evtchn->state =3D=3D =
ECS_VIRQ and u.virq =3D=3D virq after having acquired the channel lock =
but before calling evtchn_port_set_pending().

  Paul

> Jan



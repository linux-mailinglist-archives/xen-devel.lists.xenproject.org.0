Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF96327E2A6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 09:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.453.1408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNWZt-0005my-QY; Wed, 30 Sep 2020 07:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453.1408; Wed, 30 Sep 2020 07:31:05 +0000
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
	id 1kNWZt-0005ma-NQ; Wed, 30 Sep 2020 07:31:05 +0000
Received: by outflank-mailman (input) for mailman id 453;
 Wed, 30 Sep 2020 07:31:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNWZr-0005mV-RM
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:31:03 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c16bfc4-8e7a-4ccb-af19-c342fdf97962;
 Wed, 30 Sep 2020 07:31:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id q9so577655wmj.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 00:31:02 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id f6sm1379521wro.5.2020.09.30.00.31.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 00:31:01 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNWZr-0005mV-RM
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:31:03 +0000
X-Inumbo-ID: 5c16bfc4-8e7a-4ccb-af19-c342fdf97962
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5c16bfc4-8e7a-4ccb-af19-c342fdf97962;
	Wed, 30 Sep 2020 07:31:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id q9so577655wmj.2
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=UTEBG2tc55Qjs9bfWnybOVmbymgyWNTP2UpH9kLEKlI=;
        b=spHrRpYz4XM86aF4JIGrEg6hG6aV5PgoYo2IWOYGIpJxT9qQfnERRfOTIbnuSBYcXB
         xeuUXwRdnwWPAliatSnwsPjcEE2H0bU7VYawV/o5XbQEjALOBUlNDQ0W+S2TOkZKiobh
         UEKvSBpYnq2sWB1ey/UCQK+g/XsiR1fNu0hSlX2OHjVeLuibOrNl3Ym5QthTbn+pbGzR
         uC8NE2mCMsIXdPgI21lRomEmw4tGJhwmHkm1I8ebOW9cAw4sjnVzU8GCUDljyx4FByS8
         4iBoO2zWuBvWnF7jlMvpTsTnKxO6YCvkT9gCvNfu8PdEDiUT2mi6nNEwYbskAx1LjxlC
         iN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=UTEBG2tc55Qjs9bfWnybOVmbymgyWNTP2UpH9kLEKlI=;
        b=fXQJZUMpDjTshfq70Hsmy/QgRMRrRBfMXSbxXy7d+q3BbZ2UvBmQhk9j5mrt10VaVY
         tJ21M2iAPoRW9N0WtLuVbu1+3SGSXjV32RIN8wED5hwyAK0vmYz/blR77GvKHP0yd9cz
         TlRJh4Yeo3qDRGV8MIvMyA5W/bOvBrhFScBohle+Eq+kruegLd9+1x4f1oMTluPK0PoD
         WrS7rjnv1JiO3TOFO8Xx6VB2nhAYbbc2Y04ltQPfV/b+TaT6MLF0RuZIAQSp+A/mSxvA
         VY4nJ5A8g0lcuW/YEgSZJNevvGfDTk9w/3rFdY5ve+f52+GAomELl4PlsyFfUjYyWA+z
         RW/A==
X-Gm-Message-State: AOAM531Mwna4YkWL4KYMOq74kiPFxTIQoC/s8EwzARn56QyTgpdrrAzu
	Ae9eflgM5yfL21duTfMtvWU=
X-Google-Smtp-Source: ABdhPJysXMvIVgG1kbqHAGn+S/SPKhCS1roEZ23gnwDA1Kv/z2EIX8r8ZEHWJAFXVAfVyKNbWB4GGQ==
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr1430810wmi.107.1601451062118;
        Wed, 30 Sep 2020 00:31:02 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id f6sm1379521wro.5.2020.09.30.00.31.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 00:31:01 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com>
In-Reply-To: <5b1700a8-7900-9450-1c21-323bcde1fccc@suse.com>
Subject: RE: [PATCH 04/12] evtchn: evtchn_set_priority() needs to acquire the per-channel lock
Date: Wed, 30 Sep 2020 08:31:00 +0100
Message-ID: <004201d696fb$a5bd90b0$f138b210$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgH3Y/QXqTj8y8A=

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 30 September 2020 07:42
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'George Dunlap'
> <George.Dunlap@eu.citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; =
'Julien Grall' <julien@xen.org>;
> 'Wei Liu' <wl@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>
> Subject: Re: [PATCH 04/12] evtchn: evtchn_set_priority() needs to =
acquire the per-channel lock
>=20
> On 29.09.2020 18:31, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of Jan Beulich
> >> Sent: 28 September 2020 11:58
> >> To: xen-devel@lists.xenproject.org
> >> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<George.Dunlap@eu.citrix.com>; Ian
> >> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei =
Liu <wl@xen.org>; Stefano
> Stabellini
> >> <sstabellini@kernel.org>
> >> Subject: [PATCH 04/12] evtchn: evtchn_set_priority() needs to =
acquire the per-channel lock
> >>
> >> evtchn_fifo_set_pending() (invoked with the per-channel lock held) =
has
> >> two uses of the channel's priority field.
> >
> > AFAICT it is invoked with only the sending end's lock held...
> >
> >> The field gets updated by
> >> evtchn_fifo_set_priority() with only the per-domain event_lock =
held,
> >> i.e. the two reads may observe two different values. While the 2nd =
use
> >> could - afaict - in principle be replaced by q->priority, I think
> >> evtchn_set_priority() should acquire the per-channel lock in any =
event.
> >>
> >
> > ... so how is this going to help?
>=20
> I guess the reasoning needs to change here - it should focus solely
> on using the finer grained lock here (as holding the per-domain one
> doesn't help anyway). It would then be patch 10 which addresses the
> (FIFO-specific) concern of possibly reading inconsistent values.
>=20

Yes, it looks like patch #10 should ensure consistency.

Prior to ad34d0656fc at least the first layer of calls done in =
evtchn_send() didn't take the evtchn itself as an arg. Of course, =
evtchn_set_pending() then looked up the evtchn and passed it to =
evtchn_port_set_pending() without any locking in the interdomain case. I =
wonder whether, to make reasoning easier, there ought to be a rule that =
ABI entry points are always called with the evtchn lock held?

  Paul

> Jan



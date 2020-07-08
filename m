Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 936EC2188DD
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 15:21:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtA0X-0007UF-SD; Wed, 08 Jul 2020 13:21:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sx7s=AT=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jtA0W-0007UA-A5
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 13:21:04 +0000
X-Inumbo-ID: df9a59ca-c11d-11ea-bb8b-bc764e2007e4
Received: from mail-io1-xd2e.google.com (unknown [2607:f8b0:4864:20::d2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df9a59ca-c11d-11ea-bb8b-bc764e2007e4;
 Wed, 08 Jul 2020 13:21:03 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id l1so4979983ioh.5
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2020 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=el09H0U7lna7w0VKAPojZ6lb1UMQcOdSFaycVKQzoT4=;
 b=n4/LIKVJIbbiYWHP3HF5WJZjRsL8vzat4uIwgZbXkvqaCgRSyf7ZEfIuByGXNhy+jh
 3XIou23lW5FaMpYxZZINSgBypG5Dl8YEIADuV2FKTBO6MCAgLJSAzeyMqUfZQgfxxOcV
 0LAL1jBygbjmJxEPIv/4fesxE5BZiSsZkpKjhASn+NPW3sh4/KuPepchuMPiY223NbGb
 ygoICg1FDuYpigWHU94hnGr+3ptTMCtRJMJWt1isyiuyBLOowDCZqONBZT2RIuEGXi+5
 9tP+4enLNipDjRJvt5BUrlniwkLRfgHr7hJaMbX1jHKR54mmsTbhUR0lmB5VbHdxPWym
 qhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=el09H0U7lna7w0VKAPojZ6lb1UMQcOdSFaycVKQzoT4=;
 b=lKWyAD5UIAFlEcdy8hYMOrvglSvCWB7X4M7+CrTAIYTeelfNY5J0iZBC7sh+HCyZb+
 +y7opesN6YDDZVTQTOFvdDu9DuZzUJAgFOlS5mR3BeEANscv4BJ9+HNsJ5k285AkZnIS
 xqKwD5qMrjuaW0PzHW1rRYxJlZ6XkZ5daAfo+B1Wb5gQXP/WFVFR0YvKfYq2YMZWoi3X
 /7+6xZbBHBxZqlW3L8KSuPd3OUJctW9Tkc8gbMov7BckBiUqyAznGN/wrDYKxuUx7Lnz
 dQuaq1A4NTR9vKfY92GfuwWoDld6KepYBWArecZRyLTHpGNKalIjXg8CrhaFDOzeEJ4U
 5ghA==
X-Gm-Message-State: AOAM533WDr14IBye1+iyoegbPVDpyri9PGZElEXIDL3kToJJSJMFtsWM
 8MI42Bf9UBSNzL3lY2Q00s0pqn0+Fj8o4D30D5s=
X-Google-Smtp-Source: ABdhPJydVMch3lmCTd03PLZjeyKB3p6GcgVtB1SuyB6p7MElZVVeHSD/5You4P5Cn2d8KCHts0sJcegDCGCfD/c8n5I=
X-Received: by 2002:a05:6638:dd3:: with SMTP id
 m19mr67790322jaj.106.1594214463549; 
 Wed, 08 Jul 2020 06:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKPFMGtDLzc2RiEZR6KCcbPL6wumm+V5SNdxNf7fAowcBQ@mail.gmail.com>
 <20200708131150.GD7191@Air-de-Roger>
In-Reply-To: <20200708131150.GD7191@Air-de-Roger>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Jul 2020 06:11:13 -0700
Message-ID: <CAKmqyKOhW=YJ-WW28v-Ddt5yDDfVfCJKwijfsXo0oWAcvfrg2w@mail.gmail.com>
Subject: Re: Xen and RISC-V Design Session
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 8, 2020 at 6:11 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>
> Adding George in case he can help with the session placement.
>
> On Wed, Jul 08, 2020 at 05:55:06AM -0700, Alistair Francis wrote:
> > Hey,
> >
> > I'm not sure if there is a better way to suggest a design session but
> > can we have a Xen on RISC-V discussion tomorrow at the Xen Design
> > Summit?
>
> I think that would be interesting!
>
> > Preferably in a later slot as the early slots are very early for me.
>
> You have to register it at: https://design-sessions.xenproject.org/

Thanks!

I don't have a verification code unfortunately. Is it possible to get one?

Alistair

>
> Roger.


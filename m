Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B63218A3B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 16:35:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtB9b-00057E-7e; Wed, 08 Jul 2020 14:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I9ua=AT=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1jtB9Z-000579-TQ
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 14:34:29 +0000
X-Inumbo-ID: 210e0640-c128-11ea-8496-bc764e2007e4
Received: from mail-pg1-x530.google.com (unknown [2607:f8b0:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 210e0640-c128-11ea-8496-bc764e2007e4;
 Wed, 08 Jul 2020 14:34:29 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id e18so21759038pgn.7
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2020 07:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Yb7cX4ea2fPkbfiHgqV02jbgj81wzxI3uvVH5pLvZwk=;
 b=CPtKHGglkJqqmRyR9C8qoQL4AoMYiCDpXR6XIrWzo+w5yb9HiLwEATY+5iMA5n+3vQ
 amqA6xNKjgtObwGk/NFoQvdv20Z7XYASLWQSb6WtaNFuYfGfn81Kkd6aihWDvRoTknP3
 U9lB4b0Xv61X/8nbYkfk/yVWoB8UG/7NjgE7EK8XPRu27dBbqoZSdJqgzMdQZ3Qw2Ivq
 J8203Ftsbn6qwrd5EPG8gxTzfKKVN2471lKtUPa2GWBz32aRaG6BxO/20ITemX/0Rtbf
 CLZMRV2FtzbL0WlbQJOyeXPTL1q1p1S43GOcyMkw1wDuFDtokFbHG/RNcyoAjQGHuT18
 5jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yb7cX4ea2fPkbfiHgqV02jbgj81wzxI3uvVH5pLvZwk=;
 b=g8T1N99/W7di7RCZVKs21HZXiiEpk/NO6okVsWE9ipPAJtBib5TT72b9nosNwy8570
 FGCeErQqxofA3wkJxHdFtoI1Tjk64s3At8Q+AYoPQrT6TeaR/TOxe8qhnnezo85jPM+p
 RuUgboBmIqW0N4riaEFLNUcCC9feKPsUGicQtxBfJA4PDS7Eu+eeWUbifv8HMQwBHLwg
 xbrXB5tjwl6Og9r3kfdDnhnumZI0Oj9bUqf4BxaWCc3sQIg+quVBjl+nacQ9QbywzEEF
 Dr3hXwmSN2x2Ev+DfrDR2PZ59mbGRwYtuZaFlrU5FAhmXpStTuhZk+y/6xEOAWv0fkem
 y9Gg==
X-Gm-Message-State: AOAM531fvD9kcehWqIrvu8jOBxRSF+mB6BsUMFX59/AgDey3/lFZP+R8
 mJTILZtj0zvENaKhwFJfMu4=
X-Google-Smtp-Source: ABdhPJzyouzTBoWX0PV+jsigo+PfoifWL165NGaAWJZJXwa6vhTJZymHfyoZwHagFLkaMavI2RaHtQ==
X-Received: by 2002:a62:58c4:: with SMTP id
 m187mr51230914pfb.216.1594218868085; 
 Wed, 08 Jul 2020 07:34:28 -0700 (PDT)
Received: from piano ([2601:1c2:4f00:c640:fc6:7318:8185:4d2d])
 by smtp.gmail.com with ESMTPSA id n137sm102963pfd.194.2020.07.08.07.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 07:34:27 -0700 (PDT)
Date: Wed, 8 Jul 2020 07:34:20 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: Xen and RISC-V Design Session
Message-ID: <20200708143420.GA8562@piano>
References: <CAKmqyKPFMGtDLzc2RiEZR6KCcbPL6wumm+V5SNdxNf7fAowcBQ@mail.gmail.com>
 <20200708131150.GD7191@Air-de-Roger>
 <CAKmqyKOhW=YJ-WW28v-Ddt5yDDfVfCJKwijfsXo0oWAcvfrg2w@mail.gmail.com>
 <6CE81465-9F87-486F-A3CC-08857C9C4332@citrix.com>
 <CAKmqyKP5j7tQLZ8ka=CoN93X87a1LQhnMTxSeYfFo0jviMzP-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKP5j7tQLZ8ka=CoN93X87a1LQhnMTxSeYfFo0jviMzP-w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 08, 2020 at 06:20:47AM -0700, Alistair Francis wrote:
> 
> Thanks! Just submitted the proposal.
> 
> It would be really great to have Bobby attend (on CC) as he has been
> working on it. I'm not sure what timezone he is in though.
> 

Hey Alistair,

I am on the west coast in the USA, so some of the later slots would work best
for me too.

Best,
Bobby


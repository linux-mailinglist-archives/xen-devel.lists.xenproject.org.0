Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF73BA3C3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 19:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149276.276000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzNKl-0004fD-AF; Fri, 02 Jul 2021 17:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149276.276000; Fri, 02 Jul 2021 17:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzNKl-0004dO-6z; Fri, 02 Jul 2021 17:52:11 +0000
Received: by outflank-mailman (input) for mailman id 149276;
 Fri, 02 Jul 2021 17:52:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rO+z=L2=gmail.com=fontaine.fabrice@srs-us1.protection.inumbo.net>)
 id 1lzNKj-0004dI-5y
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 17:52:09 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15aaf7df-18c3-4cf0-912f-c7bf1e1679f1;
 Fri, 02 Jul 2021 17:52:08 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id d25so14364479lji.7
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jul 2021 10:52:07 -0700 (PDT)
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
X-Inumbo-ID: 15aaf7df-18c3-4cf0-912f-c7bf1e1679f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G2DWgRozu9su2algE9H6/nQBT1eyOu01WcxyUE3AsBE=;
        b=mkMCV75SY8+wfIzunLgxIV5LXUF2CB5nOsK2zV4hdpp0m8XgvifkpIL+0iykiRL1BQ
         wYBndNe1f9mTDwnR7fjXWBF8stpg/t6PS2p+81Gz0vO/kgoVDPNHyX292uy+nPte/j/3
         N+HXt3RoaDwJXTy1TFQ3b/j6gy9th8pmX7sx5OQfyCHniSxYt79e956lQUOw51T6tCKO
         eJSLjd+xNCgzE988kA3X5CmQk2R9qnqr0S8Ijet//OvYD8mBTBbgTSh6WOZ/MiqQ/aLk
         RC13BxEX7FfT8rwW/AYhvkHyJcUMfNMdvZD4hn+mNl6UB5kybZF7xi5hG2GggH8/ITT+
         c05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G2DWgRozu9su2algE9H6/nQBT1eyOu01WcxyUE3AsBE=;
        b=krnoGug4ZVRRv0Y9Cdhs3x5Fa0VWLdG4RJO/lZyWsWC2kWvTk6D4EtkBQruB7G8SBo
         Z7Za6ZXDOmBptWx965gMZO1Zs0n0mMANqk+Gc7+vSp+bx5oEtHUiUoOYnhLK8SLr4r2a
         UjItmV5bcmIi9/Z7VFj1/kd9xSc+q5iRlsOn3oQaUKdaK4MjMvxF+0FustV8t3l6F6Qg
         lZWibOA9bR6L6Q2eNc8xk2i/SMe7AmQZEOlJk3L0D/Lqgr3KdxV4YXS2C6nph4OdO9WS
         C7/C2cajK4S4mcUjBXJaZ9Wus7HKzWCFP+otEUGmWc2PrLJof1tIUK0lN0X2fPV+/dZY
         FLgQ==
X-Gm-Message-State: AOAM5311qwZusUVD1Nzu6BKw/tJC0SyE+vpYuRyDrnkwV3lf2z7AT6lT
	TxoMVvjfP23aUv24CJZAqMKbcsEoym9hOtAlxdQ=
X-Google-Smtp-Source: ABdhPJzVpDWXuKaemUBNBmQ/eQiF1wV5SuMI0cEswVjNX2AgvVfmgRZZgPYnNu4xANi3guT/pupNAUBsjS100xr5InU=
X-Received: by 2002:a2e:6e09:: with SMTP id j9mr470491ljc.319.1625248326760;
 Fri, 02 Jul 2021 10:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210702170602.890817-1-fontaine.fabrice@gmail.com> <b920b793-734a-5f1f-6c4c-0d31ed27d01c@citrix.com>
In-Reply-To: <b920b793-734a-5f1f-6c4c-0d31ed27d01c@citrix.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 2 Jul 2021 19:51:55 +0200
Message-ID: <CAPi7W81h=81ztVG6X0kh0+KEn9ryxAwXtK7-BWxonrXLJBZXaw@mail.gmail.com>
Subject: Re: [PATCH] xen/Makefile: drop -Werror
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 2 juil. 2021 =C3=A0 19:34, Andrew Cooper
<andrew.cooper3@citrix.com> a =C3=A9crit :
>
> On 02/07/2021 18:06, Fabrice Fontaine wrote:
> > Drop -Werror to avoid the following build failure with -DNDEBUG:
> >
> > In file included from <command-line>:0:0:
> > /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/xen=
-4.14.2/xen/include/xen/config.h:94:0: error: "NDEBUG" redefined [-Werror]
> >  #define NDEBUG
> >
> > <command-line>:0:0: note: this is the location of the previous definiti=
on
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/66573ad0abc4244c0dfeac8b684a7=
bfcc31c0d4d
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> For better or worse, It is Xen's policy that -Werror will remain.  95%
> of the time, it is the right thing.  We will however build failures
> whenever they crop up.
>
> This one is weird though.  How is NDEBUG getting in twice?  What does
> the rest of this build environment look like?
NDEBUG is added by buildroot in the command line if the user sets
BR2_ENABLE_RUNTIME_DEBUG to false since
https://git.buildroot.net/buildroot/commit/?id=3D5a8c50fe05afacc3cbe8e7347e=
238da9f242fab0

I do agree that setting -Werror is generally perfectly valid for upstream.
However, for downstream packager, it is generally seen as an issue as
it will always raise unexepected build failures with older, newer, or
exotic toolchains, see
https://embeddedartistry.com/blog/2017/05/22/werror-is-not-your-friend.
It would be good to, at least, have an option to disable -Werror for
example through a XEN_DISABLE_WERROR.
>
> ~Andrew
Best Regards,

Fabrice


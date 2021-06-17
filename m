Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63F93AB78A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 17:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144069.265246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttxq-0000Qf-86; Thu, 17 Jun 2021 15:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144069.265246; Thu, 17 Jun 2021 15:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttxq-0000O3-4n; Thu, 17 Jun 2021 15:29:54 +0000
Received: by outflank-mailman (input) for mailman id 144069;
 Thu, 17 Jun 2021 15:29:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3s9=LL=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lttxo-0000Nx-TZ
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 15:29:52 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08626f12-41aa-432b-b4c0-39abd642500d;
 Thu, 17 Jun 2021 15:29:52 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id r16so9579815ljk.9
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jun 2021 08:29:52 -0700 (PDT)
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
X-Inumbo-ID: 08626f12-41aa-432b-b4c0-39abd642500d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MOWl3IAqrrwnAU0hsuDFbTkOCTHdMe2wVXNAlkpef0w=;
        b=JzpUmQOWgG5shPDKBd2Sa70R/KH6xMMbA0cphWSAd98japYuj3ZH1TOsWSG3FEUbbJ
         uRKD16hELc7hcrLM59oGnk9II9KBYpseIQzJ+MBe7aO3WcpR1uX5omMDLzXVVSCCAQKa
         eMcH6om2J2JH/fG1rpRGhUERRORZOF+bt8eOt78pmQOPAVBauB7hMs0b/B9u1btr22zv
         QyRtGDlJPUsZNKj+PDXBJfZowxh5FFWU/Gm4AHxg6KSrLxZAQa+Z0lje6JutMpCv9COP
         YEI8PgwNHNPESh9DBDbCSiZO+y+hcp2ZSyQq3rtTrfAxooD26Zg2eHFTthodKq3XVfus
         G5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MOWl3IAqrrwnAU0hsuDFbTkOCTHdMe2wVXNAlkpef0w=;
        b=GlfQJPTveXu8T+4QKcZWa/vwSvBdsJtSewrIsl84Cm3f4KtK4sq9TMk69g02xmSjfb
         ujlOl4s+XzCcGNoMXgo6x6IVjtsJHIBTdRN+xw2QRI72Zyo635QaZE2/ct10EFk6K80P
         M6NDNc5Jfr4TU7UfCZe+wXIvF/afZLVmiPsDrDTPzQj/Vgrc0n3LPZpzH/majPu4KE+J
         QVteRuhIW/vH9o/qkZ/wE6zuWDkUaP8iLN6HmlDJFY8yRP8831WVWzoTpYYTHtN6NXb2
         AGAzoKK/aZZ+xGChxnaS5HX3n0DQM15SFhkW/uBCZPPzsLj/naNU87QYpdrldp0i0ovZ
         yl8Q==
X-Gm-Message-State: AOAM533obDuXbSLCfP1CwbjAc9IM6nIT6//BNidUk6fFX/Q3xa2xr1zV
	A01anwyW/G2pNMkX4SbTWR/xp5bXBY7q5m5gGvoOVDMw3U4=
X-Google-Smtp-Source: ABdhPJysFBEqHzH6Rcu+cn1HdCZdjoqC/nil0GmfT4y9O22b+zsaPIiQ9iaCz3jN0Z4NO7/PHoCfGvqJYn1bUbQ4gvM=
X-Received: by 2002:a2e:7311:: with SMTP id o17mr5171980ljc.415.1623943790921;
 Thu, 17 Jun 2021 08:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 17 Jun 2021 11:29:39 -0400
Message-ID: <CAEBZRScBQHKHL5xzxdL_Wct5fOOjTww2_ZEbQ3p3iqDUPr5nDA@mail.gmail.com>
Subject: Re: [RESEND PATCH 00/12] golang/xenlight: domain life cycle support
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 24, 2021 at 4:37 PM Nick Rosbrook <rosbrookn@gmail.com> wrote:
>
> The primary goal of this patch series is to allow users of the xenlight
> package to manage a full domain life cycle. In particular, it provides
> support for receiving domain death events so that domain shutdown,
> reboot, destroy, etc. can be handled. And, it addresses issues found
> when using the package to boot domains with various configurations.
>
> These patches address several things (e.g. bug fixes, code style,
> conveniences, new wrapper functions), but are all work towards the final
> goal of allowing a package user to manage a full domain life cycle.
>

George,

I know you have leave coming up, and are likely very busy preparing
for that. Is there any chance this series will get attention before
then?

Thanks,
NR


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BE53D0EE3
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 14:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159325.293062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6BYb-0006oR-Cx; Wed, 21 Jul 2021 12:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159325.293062; Wed, 21 Jul 2021 12:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6BYb-0006ln-9w; Wed, 21 Jul 2021 12:42:37 +0000
Received: by outflank-mailman (input) for mailman id 159325;
 Wed, 21 Jul 2021 12:42:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tag6=MN=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1m6BYZ-0006lh-3Z
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 12:42:35 +0000
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7409b751-8688-4bf0-8dd2-2cb61298e9b1;
 Wed, 21 Jul 2021 12:42:34 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id b16so1589796ljq.9
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jul 2021 05:42:34 -0700 (PDT)
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
X-Inumbo-ID: 7409b751-8688-4bf0-8dd2-2cb61298e9b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EvXJROZuF2EAdblB+X9vzbezoxTpCfdIfWe+jWRmLJ8=;
        b=XUI5JoO20GvayvnkcLMOai1SmW8xYkg0JLJb4/dzgcZ6s49SIS0k+JnpgEBOThfb1C
         1VvVPRw8vCkMSGMH8H6gcr9+nC4m7vH8HZ/cA5ZGpEDnkPGXf7gdSR2CnorIeS1YKCM9
         J8ZLiFTmYeinSfDmU3u/M8xpzZaH7Zl77BRX61yvw1Ei3sxaOzK3Zlo/RlhKTdmCd3tE
         1MCIg1CssQeJyiN/rnGAlnAFfHrG+STRGpBejWQ45X0gN6ezdsh9LjQ2aJfcX3HZ4DBx
         ZPY1x4kWPf7qoMAJn9PcgYXUEzkn5fIgoQhSU4Rf1gG3I4wW67+Te4cCcKOmSvPOYSAx
         TLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EvXJROZuF2EAdblB+X9vzbezoxTpCfdIfWe+jWRmLJ8=;
        b=jJ5VjbtsaG4uDvABPWGqrDiIjICe0W9aDfw2lIEyuLzOvbTD4J1XOeAn2XYEoPzZHe
         YmFRl81ytc3liyLnEQfkEL5W2alEr6DiuBVL8M15dtcKdrYJK9GTDGcFCehusHThMkKl
         vDRX36XQskFM/cmPKeuQKYgeVpOhGHgw5oQuZooFGI+q+sFRq6nyJVPIsJj1Fmn4JESO
         hlbBBWFrM7g/qDP9nG0CqAnGlYF402yLMDy3aEH8uxbUhmkpb+V0pG2EZhJlDBn2HJF/
         r7qp/CQTuVhbzGH/thopwMRedL8BbnKu9QaR6V/39FGy9WVSbiGxOJ5UgyVYi6Vgu1P5
         IG8Q==
X-Gm-Message-State: AOAM533V/LEkMyGty2OBTJ74B+GQs1YtAEWXagmBQ5PjViS2ecJAmQZp
	gAeoUlkq5zx7oXdEx0vfM5d0jQaxZUh3qEoP7cQ=
X-Google-Smtp-Source: ABdhPJzMRlgZiVugjiGxgJODWTmheD6B91jU3qaRDfAQIR2mdXbfjfkEfBpDXFGq4DKH4cK8NcWGn85g2itTHSLWc3o=
X-Received: by 2002:a2e:7f0c:: with SMTP id a12mr31386164ljd.378.1626871353073;
 Wed, 21 Jul 2021 05:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
In-Reply-To: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 21 Jul 2021 08:42:21 -0400
Message-ID: <CAKf6xpucqRp5Db6z0J7PLbTVxBZThn7j2Mjvjn9z7nJ5Lf5F_g@mail.gmail.com>
Subject: Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
To: Scott Davis <scottwd@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 1:57 PM Scott Davis <scottwd@gmail.com> wrote:
>
> This adds an option to the xl domain configuration file syntax for specifying
> a kernel command line for device-model stubdomains. It is intended for use with
> Linux-based stubdomains.
>
> Signed-off-by: Scott Davis <scott.davis@starlab.io>
> ---
>  docs/man/xl.cfg.5.pod.in             | 4 ++++
>  tools/golang/xenlight/helpers.gen.go | 3 +++
>  tools/golang/xenlight/types.gen.go   | 1 +
>  tools/libs/light/libxl_dm.c          | 1 +
>  tools/libs/light/libxl_types.idl     | 1 +
>  tools/xl/xl_parse.c                  | 2 ++
>  6 files changed, 12 insertions(+)
>
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 56370a37db..6c777cad5c 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2742,6 +2742,10 @@ In case of B<qemu-xen-traditional> it is expected to be MiniOS-based stubdomain
>  image, in case of B<qemu-xen> it is expected to be Linux-based stubdomain
>  kernel.
>
> +=item B<stubdomain_cmdline="STRING">
> +
> +Append B<STRING> to the device-model stubdomain kernel command line.

I think this option actually sets the string, so you want "Set
B<STRING> as the device-model stubdomain kernel command line." or
something equivalent?

With a suitable change,
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA005692FA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 22:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362500.592545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9BEP-0003ai-VZ; Wed, 06 Jul 2022 20:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362500.592545; Wed, 06 Jul 2022 20:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9BEP-0003Xw-Sj; Wed, 06 Jul 2022 20:02:41 +0000
Received: by outflank-mailman (input) for mailman id 362500;
 Wed, 06 Jul 2022 20:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gE00=XL=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1o9BEO-0003Xq-AZ
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 20:02:40 +0000
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [2607:f8b0:4864:20::a2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95d47ad5-fd66-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 22:02:39 +0200 (CEST)
Received: by mail-vk1-xa2a.google.com with SMTP id r184so1124573vkg.9
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 13:02:39 -0700 (PDT)
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
X-Inumbo-ID: 95d47ad5-fd66-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AXLWtANm01GM5VLt1ZcmE4zffRDaqpad1U8GZvOJct0=;
        b=W8Wcnuk2DEp18S8viFXMwYS09eKwwZ8xVuIzLuXO1yTdKu0VV6uL3vWbBVWM/WKbMa
         qzFzEvyW88D0j+lPegsCiR727eZSYWAEGw8sO2ZCouCw9HJlvjvapHAs6pLQmGYb6ExJ
         FnASKIUwtc+1tuxismJCFaQB7vXUXEqg9SDhLHkMchbEg4HvWIX5+CtA/wWcM5llweCy
         fi0Gqee6u2oivOjrD/6NM9T/dVEb9bnWGAteMeSHBH9eslvAJQT8jNOvA7NuXucoaJjV
         IN4liS29+0lLvZU2z1UfSMquee9bsX7hNOiLVPbdZUI/7/guvc6AB9gdfyRsGTzMhzrL
         hoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXLWtANm01GM5VLt1ZcmE4zffRDaqpad1U8GZvOJct0=;
        b=CVbAEof0HFzViFa9hlClQZtpLMa8D5+Tf12dIvvT26ne/brnZpSkS8xpsvPoveYeE5
         vCiBV91Vi0soS8MZeMbnUsCTjtNpooh+NO7BDCzLZyOoJ1Bw/GMXh7YOLI8IDLt9Uis8
         I3auqgq1XtohTTwzkVLeRRqbR97y7JIt+YYdSPBMjQXU1AX4EtS2Y1FySnfm6FSzmBRn
         TCrJ5tE6khMdLLLGTn24yUpY2kysdHCHlL7vxLzYux1U9j6fG/4/PxxvQZgU6nudryCG
         PjqeHi5Q5Nj1WBPQMiUDQJC6ButBNDFQIwv2YfqLgls3WAx27vot17ttNeQcPv8N86yn
         yWPw==
X-Gm-Message-State: AJIora9kqP9V5uEC8F7hsuoQKJ2apn/soTA7VYope7Koy9raEzD17AXm
	bQubjRCXet8lns/ssrbgSBza0Xca5+0eVjWbZCA=
X-Google-Smtp-Source: AGRyM1s0UIW9qynCHn6vzim6vYN1TcqJjFk7sO6j3/okKreFl9FkUzWfd7oKBxf6kZ2TGjM+zEydx5THqZX+//4Dbno=
X-Received: by 2002:ac5:c5ba:0:b0:36b:f95a:85ae with SMTP id
 f26-20020ac5c5ba000000b0036bf95a85aemr24340608vkl.1.1657137757981; Wed, 06
 Jul 2022 13:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220706135245.64915-1-george.dunlap@citrix.com>
In-Reply-To: <20220706135245.64915-1-george.dunlap@citrix.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 6 Jul 2022 13:02:27 -0700
Message-ID: <CACMJ4GYVsqMqyhGSqHoPZjYrWfhheGU7ybYwxRGezb__jx4yzQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Make Daniel P. Smith sole XSM maintainer
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 6, 2022 at 6:53 AM George Dunlap <george.dunlap@citrix.com> wrote:
>

Some alternative text for consideration for this patch:

Patch subject line: MAINTAINERS: Reassign XSM maintainership

> While mail hasn't been bouncing, Daniel De Graaf has not been
> responding to patch submissions or otherwise interacting with the
> community for several years.  Daniel Smith has at least been working
> with the code, and is a regular member of our community; and he has
> agreed to step up into the role.

Daniel Smith is experienced with the XSM code, is an active participant in our
community, and has accepted the invitation to become the sole maintainer.

Thanks to Daniel De Graaf for his contributions to Xen.

>
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a99526784..e12c499a28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -649,8 +649,7 @@ F:  xen/common/trace.c
>  F:     xen/include/xen/trace.h
>
>  XSM/FLASK
> -M:     Daniel De Graaf <dgdegra@tycho.nsa.gov>
> -R:     Daniel P. Smith <dpsmith@apertussolutions.com>
> +M:     Daniel P. Smith <dpsmith@apertussolutions.com>
>  S:     Supported
>  F:     tools/flask/
>  F:     xen/include/xsm/
> --
> 2.25.1
>
>

Christopher


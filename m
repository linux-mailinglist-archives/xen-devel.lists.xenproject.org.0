Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AF31B5B18
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 14:10:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRag0-0002xy-JF; Thu, 23 Apr 2020 12:09:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TH3x=6H=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1jRafz-0002xt-AF
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 12:09:55 +0000
X-Inumbo-ID: 57532b80-855b-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57532b80-855b-11ea-b4f4-bc764e2007e4;
 Thu, 23 Apr 2020 12:09:54 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r16so4145021edw.5
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7XMAgNjSorNlAUmUg02GEUGsSbSZXZVuIUIfkf0XsX4=;
 b=JDqIPQQz8zebf82mcb7rGH3oc7u2L+IOHDqYQ602vq5FjXXZc94ZixXw3Pevpx+Dmr
 Y6essChB0Au976+PM4wPb8RZANtnYxCeLZDQlJX9h0i3sscUUBGV+M15OKX5W4z6OxX1
 gaHo5dz2Wub7OSBb6fAVWlvXHnjLXkR6lU0K8CezryS77t5h+nGIDR/0ENLNleM5cDgh
 /SeCJ0qU74zlPINYeZpD8B3HhdDxF9tEEI3X63eJdYu6ggfMdPAx/BQX08tKPHk7b0YY
 4nv1g0ilEOKYA3wDwo3eSmDQBzb7OBC8D2v01dOgOe+LRZp74P1r99SN4D7u6ef9teRa
 tKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7XMAgNjSorNlAUmUg02GEUGsSbSZXZVuIUIfkf0XsX4=;
 b=iqS4gCCnEKmZ7WoDhxBwaxXvzM9F+5eEN6pK5UdvPsTgnFGLhR8fnoFguWIUHB15mD
 m8dPGH8jsccBz/g01j4qsbEsYSPVCuc+wEQdyq1CLf8nSi/hzrbl08wPAyoLN5Bv3sSn
 MURmPejTIICxnz6lJNXhsnFpm7lGTPevP2YIUZTaO608J+xKyPbaCcMmvfy4NpZ5j7GY
 /WlisN/g3UeVGD/Rl4qc7LeFLfUm+ruW4Mzv2zGgA5S75FZCPihZfwiFVvaNrYqXXIXr
 jg+Ojm96GCXLOGmSEhnJAc+QlAroo0zQE4AjWoPmwIMQjppKT6nMLyD3xR9osMvyOBQX
 Wj1g==
X-Gm-Message-State: AGi0PubbiN8GVNv7NvujGF9Ec5Dw43UurdMcr0gWrwwoVB79i1KHdb2a
 k6pKLqj55XCoFJJ64EcGpPIpowICiNAtRJLGULM=
X-Google-Smtp-Source: APiQypL5gRH+bOxF2S63MKn9ILZsflRdH4IFWDOLVv3cL8fBh7ENohh05SyxklVAbo0HH3pGrMiKYf5kFC3EmUhOWJ0=
X-Received: by 2002:a50:d90f:: with SMTP id t15mr2365667edj.209.1587643793888; 
 Thu, 23 Apr 2020 05:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
 <c2d966b43313c9df64551b0ce31462c176445b70.1587599095.git.rosbrookn@ainfosec.com>
 <20200423102538.vxuo7s2lamkxhoo7@debian>
In-Reply-To: <20200423102538.vxuo7s2lamkxhoo7@debian>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 23 Apr 2020 13:09:43 +0100
Message-ID: <CAFLBxZbWtLLeYr_pQ54zuy1RTq0Xmts5473Ueac6PG9cv9HUOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools: build golang tools if go compiler is present
To: Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000005d592305a3f42034"
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000005d592305a3f42034
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 23, 2020 at 11:25 AM Wei Liu <wl@xen.org> wrote:

> On Wed, Apr 22, 2020 at 08:25:25PM -0400, Nick Rosbrook wrote:
> > By default, if the go compiler is found by the configure script, build
> > the golang tools. If the compiler is not found, and
> > --enable-golang_tools was not explicitly set, do not build to the golang
>
> --enable-golang-tools here.
>
> > tools.
> >
> > The new corresponding make variable is CONFIG_GOLANG_TOOLS. Remove
> > CONFIG_GOLANG from tools/Rules.mk since the new variable is set by
> > configure.
> >
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
>
> Acked-by: Wei Liu <wl@xen.org>
>
> Note to self: fix commit message and maybe rerun autogen.sh.
>

It doesn't look like that's a typo -- if you want it to be `-` instead of
`_`, the patch needs to be changed (at least as far as I can tell w/ my
admittedly limited automake-foo).

 -George

--0000000000005d592305a3f42034
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2020 at 11:25 AM Wei =
Liu &lt;<a href=3D"mailto:wl@xen.org">wl@xen.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Apr 22, 2020 at 08:=
25:25PM -0400, Nick Rosbrook wrote:<br>
&gt; By default, if the go compiler is found by the configure script, build=
<br>
&gt; the golang tools. If the compiler is not found, and<br>
&gt; --enable-golang_tools was not explicitly set, do not build to the gola=
ng<br>
<br>
--enable-golang-tools here.<br>
<br>
&gt; tools.<br>
&gt; <br>
&gt; The new corresponding make variable is CONFIG_GOLANG_TOOLS. Remove<br>
&gt; CONFIG_GOLANG from tools/Rules.mk since the new variable is set by<br>
&gt; configure.<br>
&gt; <br>
&gt; Signed-off-by: Nick Rosbrook &lt;<a href=3D"mailto:rosbrookn@ainfosec.=
com" target=3D"_blank">rosbrookn@ainfosec.com</a>&gt;<br>
<br>
Acked-by: Wei Liu &lt;<a href=3D"mailto:wl@xen.org" target=3D"_blank">wl@xe=
n.org</a>&gt;<br>
<br>
Note to self: fix commit message and maybe rerun autogen.sh.<br></blockquot=
e><div><br></div><div>It doesn&#39;t look like that&#39;s a typo -- if you =
want it to be `-` instead of `_`, the patch needs to be changed (at least a=
s far as I can tell w/ my admittedly limited automake-foo).</div><div><br><=
/div><div>=C2=A0-George<br></div></div></div>

--0000000000005d592305a3f42034--


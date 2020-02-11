Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA31158EDF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 13:47:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Uu3-0000Dh-6d; Tue, 11 Feb 2020 12:44:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fDue=37=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1j1Uu1-0000Da-GU
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 12:44:33 +0000
X-Inumbo-ID: 391f6e48-4ccc-11ea-a96e-bc764e2007e4
Received: from mail-ed1-x531.google.com (unknown [2a00:1450:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 391f6e48-4ccc-11ea-a96e-bc764e2007e4;
 Tue, 11 Feb 2020 12:44:21 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e10so4444200edv.9;
 Tue, 11 Feb 2020 04:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iDWuii/zfe4GgbIfH1wMCIRclcZzouS9voyvgx61kAQ=;
 b=e3sNhb5CfwKSfjOROJFYtYvkffLlB28N4jBBOoEoyZIm2pWH8/cnpZTE4uv1WAmWY1
 rum55qG+9xAkCcRzjrOaKjyreK9in2oXqRgXpBN0ngqiXQU1SbxnUQv3lPb946NhHult
 T584VsUp81bdRHKhwAtQxzXdUFybNJX/WRe6BU2CwZ90aa2H0TMmtFT+e0Hlb/O1kLg8
 byBQ8j9nsJs4Br7zOOu8H0SuI0lfdpeFy/cqeQF9ht9SgXVOtmRqh2xg7xl0ay/N2GGM
 1LhOfif3njtyvjAUd9YIMfQk0XirxGac68/j0m+/+qf/35M6DP8O+LIylx3Ho0sD91ot
 pNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDWuii/zfe4GgbIfH1wMCIRclcZzouS9voyvgx61kAQ=;
 b=h9ARkQ/O8H3YmDR+IDnIJP1KPBHasOlf5LruLOsB5W4OczrdZkArbK/Uo7OfGn/mnH
 Foy+XKJbdxuW4OKipfbNbzTeAJkAPsRkqsDeHvU4XE2Ow3Sd3yoMUIK7ISeL3n8bWveo
 WGTLYw752xXq4Auz9fum8e1guUfXw4u2ndkn6mJ7CsCwicr9idGa/1SWD8huu5Brt9Gm
 QsGVzoPIL4z5cQGSiiEfjB+2LNVOy8RdyH2UvUGRK8BtDIK/ZXeEWIzG9JQvZ5zlCiuJ
 +28DEBBA6dX482zwE+U7Nt3LhNqrddvo3vfhtpDnXmOax9DB8TKBczQ+h91iNm0f/3Zv
 Qh+w==
X-Gm-Message-State: APjAAAW1GFfRxgpGZoBTF+lspPJ80/CTqOndZPjSzp/BJlADwm6c05Zc
 olQYh2laZif0qwBjfzW0pER7Rry7t5paCMK1ros=
X-Google-Smtp-Source: APXvYqzkmD3DPUNzAWRo4Yg+DqiRX+apOIA073wHzNiL2AVG6LhUIaO6fWEGJXSGGM7vhikx5AhCHUJihYkq6feiD8s=
X-Received: by 2002:a17:906:4e46:: with SMTP id
 g6mr5581994ejw.309.1581425059996; 
 Tue, 11 Feb 2020 04:44:19 -0800 (PST)
MIME-Version: 1.0
References: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
In-Reply-To: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Tue, 11 Feb 2020 12:44:08 +0000
Message-ID: <CAFLBxZYkFdQMM56KRSetj6yLfMoWz0JyzpVope3tfRJQ6x-csw@mail.gmail.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: [Xen-devel] UPDATE [Vote] For Xen Project Code of Conduct (deadline
 March 31st)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3664258500172813755=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3664258500172813755==
Content-Type: multipart/alternative; boundary="000000000000f0a836059e4c36ae"

--000000000000f0a836059e4c36ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI, If you have voted in private for this (by replying directly to Lars),
you'll need to re-send your vote to <community.manager@xenproject.org>
(which is currently being redirected to Ian Jackson and myself).

 -George

On Fri, Jan 17, 2020 at 7:13 PM Lars Kurth <lars.kurth@citrix.com> wrote:

> I propose to tally the votes after March 31st. You can reply via
> +1: for proposal
> -1: against proposal
> in public or private.
>
> Votes will be tallied by subproject =E2=80=93 aka the Hypervisor and XAPI=
 project
> by %
> for the proposal - and then averaged across sub-projects that achieved th=
e
> quorum. The vote needs to achieve a 2/3 majority to pass.
>
> Sub-project needs to achieve the following quorum of votes in favour for
> the
> sub-project=E2=80=99s vote to count
> Hypervisor: 3 + votes
> XAPI: 2 + votes
> Windows PV Drivers: 1 + votes
>
>

--000000000000f0a836059e4c36ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>FYI, If you have voted in private for this (by replyi=
ng directly to Lars), you&#39;ll need to re-send your vote to &lt;<a href=
=3D"mailto:community.manager@xenproject.org">community.manager@xenproject.o=
rg</a>&gt; (which is currently being redirected to Ian Jackson and myself).=
<br></div><div><br></div><div>=C2=A0-George<br></div><div><br></div><div>On=
 Fri, Jan 17, 2020 at 7:13 PM Lars Kurth &lt;<a href=3D"mailto:lars.kurth@c=
itrix.com">lars.kurth@citrix.com</a>&gt; wrote:</div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">I propose to tally t=
he votes after March 31st. You can reply via<br>
+1: for proposal<br>
-1: against proposal<br>
in public or private.<br>
<br>
Votes will be tallied by subproject =E2=80=93 aka the Hypervisor and XAPI p=
roject by %<br>
for the proposal - and then averaged across sub-projects that achieved the<=
br>
quorum. The vote needs to achieve a 2/3 majority to pass.<br>
<br>
Sub-project needs to achieve the following quorum of votes in favour for th=
e<br>
sub-project=E2=80=99s vote to count<br>
Hypervisor: 3 + votes<br>
XAPI: 2 + votes<br>
Windows PV Drivers: 1 + votes<br>
<br>
</blockquote></div></div>

--000000000000f0a836059e4c36ae--


--===============3664258500172813755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3664258500172813755==--


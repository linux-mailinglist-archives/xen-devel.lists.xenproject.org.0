Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D948663A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 15:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254079.435585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5TyI-0003pj-78; Thu, 06 Jan 2022 14:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254079.435585; Thu, 06 Jan 2022 14:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5TyI-0003nC-48; Thu, 06 Jan 2022 14:42:30 +0000
Received: by outflank-mailman (input) for mailman id 254079;
 Thu, 06 Jan 2022 14:42:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qsn0=RW=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1n5TyG-0003n6-CU
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 14:42:28 +0000
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [2607:f8b0:4864:20::b34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd5766e7-6efe-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 15:42:26 +0100 (CET)
Received: by mail-yb1-xb34.google.com with SMTP id k69so8030793ybf.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jan 2022 06:42:26 -0800 (PST)
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
X-Inumbo-ID: dd5766e7-6efe-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p6d71foSY8ZG72V2o+8sUcsCilnZIhZ7ZfgLPmZn9cg=;
        b=HTuSqrr7xiWK7BTUgOWw9TQmJYhe3o2sXgb8wvE2DxhNjKKGkBYJqiuDZBAvFE08JK
         B7kW4FoeQGF6dDn8ktWjbeJkOo/cP6KgWBUhNVp/rIN1bMzui7iig9Bz6aiiaAzxbpQK
         qxdj9jyf+SOWsfMWQ3c++qfUHaiGzqHbSa2lI5Z6CneQJGUwpIegHOd9Jc2chTWZZaH/
         0yC9YTPintbBPGer3qkR5pEzoE8AnvvPF9wwExm7a14Y37eWjeei7U5PQ0SRiwTYubfM
         L2pD02QguLzSIAJoD0pbkJVMO55kvcp72VRgbrFaumZFwVP6BXFS+4mv4Y3+RA0Xbr3N
         MgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p6d71foSY8ZG72V2o+8sUcsCilnZIhZ7ZfgLPmZn9cg=;
        b=a0a/CUiGJYgvmS6FtmRVjZph2gw7RK+inFBfUaQ6OdOLdZxfeuTJJf1ka8GWfISTqv
         u4zCwpwXLDwUABHOyyA7R82h85W8ZS/iHBbgQXXC/NsXLfyoCMLJtnwCH2Mpt3/E2v0/
         lknjZ+sU80MJdZNhyZVsDWDLidUAOpEXlsSay69PENtWRqYmo8DcKXn5Nt0ueqRcsUnv
         /c4ub1RgTKCD/hJMVo08Ykp+h2vGbJAR60SvwIuNgT7IBgQFg1jf9BzJPq4DqPfuIk1T
         8kvZD+Q66S1ejeBY2ZmBxInE0Qh5DdET8vaZlSBRRacqe3T8snSebDjipHtNRtYDd2Jz
         WvDw==
X-Gm-Message-State: AOAM533J3hNvT3KY6q6sNFjeIPctwkmk1Zpx3vjAe6MR5Gv7P5UPtU9f
	9CyXqAsOkFhaHKO8zfgbepQbcTv0dz6uL+oekyY=
X-Google-Smtp-Source: ABdhPJwNiPlepERenxqMwq0Vg2TZnk6YpTdeiLjc16zFFgdVQRCsm4cC5DT1ensjeGrw7AvKa7/L5VuZkQtgmKHtSCk=
X-Received: by 2002:a25:b108:: with SMTP id g8mr23854237ybj.277.1641480145188;
 Thu, 06 Jan 2022 06:42:25 -0800 (PST)
MIME-Version: 1.0
References: <CAN2gxUQmsa=ONQqj0-3PZ2oxp-QVMgsm0BQ+q=-LWwmWTqwMZg@mail.gmail.com>
 <CAFLBxZazbQUF5bXw=yxM7+48KVVz_rJoi8UWrH83Ln-j40u9PA@mail.gmail.com> <CAN2gxUQ_h79Sy006NBcRkFzj9PDAjn8JA3UjQo4L81xo7ShgbA@mail.gmail.com>
In-Reply-To: <CAN2gxUQ_h79Sy006NBcRkFzj9PDAjn8JA3UjQo4L81xo7ShgbA@mail.gmail.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 6 Jan 2022 14:42:14 +0000
Message-ID: <CAFLBxZZX9escoCP92dLMCqQGv1-CHaEOzX7NAzvHs_heXYxfhg@mail.gmail.com>
Subject: Re: scheduler credit capture
To: amir masoud noohi <highlimner@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000f5ba6305d4eae067"

--000000000000f5ba6305d4eae067
Content-Type: text/plain; charset="UTF-8"

[Adding back in xen-devel to the cc' list]

On Thu, Jan 6, 2022 at 1:41 PM amir masoud noohi <highlimner@gmail.com>
wrote:

> yes exactly, I want to see the changes of a credit for each vCPU
>

(FYI we respond in-line on the Xen mailing lists rather than top posting.)

Your best bet is to look into xentrace & xenalyze, and the trace or TRACE
calls found in xen.git/xen/common/sched/credit[2].c.  It looks like you can
get the info you want for credit2, but not for credit1 unless you add some
trace points in.

You can find a video introduction to Xen tracing here:
https://vimeo.com/33655967

It's a bit old but that system hasn't changed much.

 -George


>
> On Thu, Jan 6, 2022 at 2:32 PM George Dunlap <dunlapg@umich.edu> wrote:
>
>>
>>
>> On Wed, Jan 5, 2022 at 2:45 PM amir masoud noohi <highlimner@gmail.com>
>> wrote:
>>
>>> Hi Everyone,
>>>
>>> Today I'm looking for capturing vCPU credit for both credit1 and
>>> credit2.
>>> How can I do that?
>>>
>>
>> Can you explain what you mean by "capture vCPU credit"?  Do you mean you
>> want to log or sample changes to it?
>>
>>  -George
>>
>
>
> --
> *Regards*
> *Noohi*
> *noohi.org <https://noohi.org>*
>

--000000000000f5ba6305d4eae067
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>[Adding back in xen-devel to the cc&#39; list]<br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Jan 6, 2022 at 1:41 PM amir masoud noohi &lt;<a href=3D"mailto:highlim=
ner@gmail.com">highlimner@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div style=3D"font-fami=
ly:trebuchet ms,sans-serif">yes exactly, I want to see the changes of a cre=
dit for each vCPU</div></div></blockquote><div><br></div><div><div class=3D=
"gmail_quote"><div>(FYI we respond in-line on the Xen mailing lists rather =
than top posting.)<br></div><div><br></div>Your
 best bet is to look into xentrace &amp; xenalyze, and the trace or=20
TRACE calls found in xen.git/xen/common/sched/credit[2].c.=C2=A0 It looks=
=20
like you can get the info you want for credit2, but not for credit1=20
unless you add some trace points in.</div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">You can find a video introduction to Xen tra=
cing here: <a href=3D"https://vimeo.com/33655967">https://vimeo.com/3365596=
7</a></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=
It&#39;s a bit old but that system hasn&#39;t changed much.<br></div><div c=
lass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=C2=A0-George</di=
v></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Jan 6, 2022 at 2:32 PM George Dunlap &lt;<a href=3D"mailto:dunlapg@umich.=
edu" target=3D"_blank">dunlapg@umich.edu</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Jan 5, 2022 at 2:45 PM amir masoud noohi &lt;<a href=3D"mailto:h=
ighlimner@gmail.com" target=3D"_blank">highlimner@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div style=3D"font-family:&quot;trebuchet ms&quot;,sans-serif">Hi Everyone=
,</div><div style=3D"font-family:&quot;trebuchet ms&quot;,sans-serif"><br><=
/div><div style=3D"font-family:&quot;trebuchet ms&quot;,sans-serif">Today I=
&#39;m looking for capturing vCPU credit for both credit1 and credit2.=C2=
=A0</div><div style=3D"font-family:&quot;trebuchet ms&quot;,sans-serif">How=
 can I do that?=C2=A0</div></div></blockquote><div><br></div><div>Can you e=
xplain what you mean by &quot;capture vCPU credit&quot;?=C2=A0 Do you mean =
you want to log or sample changes to it?<br></div><div><br></div><div>=C2=
=A0-George<br></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><b><font color=3D"#999999">=
Regards</font></b></div><div dir=3D"ltr"><font color=3D"#999999"><b>Noohi</=
b></font></div><div dir=3D"ltr"><b><a href=3D"https://noohi.org" target=3D"=
_blank"><font color=3D"#999999">noohi.org</font></a></b></div></div></div><=
/div></div></div></div></div></div></div></div>
</blockquote></div></div>

--000000000000f5ba6305d4eae067--


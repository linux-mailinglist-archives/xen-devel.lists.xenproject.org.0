Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71773486B9A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 22:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254202.435813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Zwd-0008SY-RJ; Thu, 06 Jan 2022 21:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254202.435813; Thu, 06 Jan 2022 21:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Zwd-0008Q7-O5; Thu, 06 Jan 2022 21:05:11 +0000
Received: by outflank-mailman (input) for mailman id 254202;
 Thu, 06 Jan 2022 21:05:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4l4=RW=gmail.com=highlimner@srs-se1.protection.inumbo.net>)
 id 1n5Zwc-0008Q1-5d
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 21:05:10 +0000
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [2607:f8b0:4864:20::933])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53fc74db-6f34-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 22:05:08 +0100 (CET)
Received: by mail-ua1-x933.google.com with SMTP id v12so6727764uar.7
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jan 2022 13:05:08 -0800 (PST)
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
X-Inumbo-ID: 53fc74db-6f34-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xj/++dpfvQtxhLef1zLyrPPbbMaJ1KQQqACCUa6jBV0=;
        b=SWOuoczxDPpq5IpyQElGXmpT3eK2AcFUBIrLN6vWU1K6VZSABChG5PXuwe7t2AfIar
         AsMIcoVVASdhtKz0M01UcaK80FGhbhqqcWAY+vPt1CQXCn4p9DhrVyHpe/y9jKkZS0yC
         YxVdX/sum650rZipVHxt1FLBxQaQELZBHD0IgYF5HFDlmhxblajj8UQp8exYm6xK0r0Q
         vh/wIIXOrJlUrN/vyLHFcdgGSedbwdRamD7iPJmbenzdeYCIGj5L/pbrjonJ4lISYQum
         zpIXLrQgoah4s7KIY6ddmQiXFyDd5VA/0O++3b3XeYJsv321NK6Sw7ygs2y1OarSaeFf
         mDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xj/++dpfvQtxhLef1zLyrPPbbMaJ1KQQqACCUa6jBV0=;
        b=CNclu1wfnE68IcYbph/LYG7CheT9sFTMSkdGRFaM0lbMOcmIV606xhXK+Ri3btqcP2
         zXQHj7LBxMoMeoFlVaJpf+MKW/XA2nqK4dPybFchl4/iZfOxmJfM3MMyn4Y31B6OAlrl
         troJY+1j+bd5ZUi60kyPO/XqxM4DGKKuD0lKYkO3Fn9cG22MTmRIgB1cuf7MulTePT3k
         d6kQY6tFSl7mSsrHwr6/LhVeBsfONoC+B0tGZ+vIIo2C3RXM1zXs2hJ6mkS/2mlyOoud
         v7e18uKLkXHi8ZvFDN81HOKjhh3v/yDZGaCKrXg6sB5yRNYfQq6Eiprrf3B4u2KvZkD7
         wLKw==
X-Gm-Message-State: AOAM532AY8tVMrTsCiEQxx8Cpj7Nc8iqBFx0EuE/zawJ8miVJEcAbDIT
	Gq8QbBlIta4myeMuh/sehUJpcU0yOzuIsph0haQmuiPMdBx6ddgsmVU=
X-Google-Smtp-Source: ABdhPJyc6JAMDVApwzAKn6Lue5Le0Uu+Y1F+VwuJzpVzN0wqmd/JmfWqfUkk85m1EYSXMoa6CHi+0zaNFFkoExngECo=
X-Received: by 2002:a05:6102:3ed2:: with SMTP id n18mr38590vsv.72.1641503107379;
 Thu, 06 Jan 2022 13:05:07 -0800 (PST)
MIME-Version: 1.0
References: <CAN2gxUQmsa=ONQqj0-3PZ2oxp-QVMgsm0BQ+q=-LWwmWTqwMZg@mail.gmail.com>
 <CAFLBxZazbQUF5bXw=yxM7+48KVVz_rJoi8UWrH83Ln-j40u9PA@mail.gmail.com>
 <CAN2gxUQ_h79Sy006NBcRkFzj9PDAjn8JA3UjQo4L81xo7ShgbA@mail.gmail.com> <CAFLBxZZX9escoCP92dLMCqQGv1-CHaEOzX7NAzvHs_heXYxfhg@mail.gmail.com>
In-Reply-To: <CAFLBxZZX9escoCP92dLMCqQGv1-CHaEOzX7NAzvHs_heXYxfhg@mail.gmail.com>
From: amir masoud noohi <highlimner@gmail.com>
Date: Fri, 7 Jan 2022 00:34:29 +0330
Message-ID: <CAN2gxUSL8f=osqSn89CGfMgdwcoosj9Cwk=rQjycOt_z95S_Mg@mail.gmail.com>
Subject: Re: scheduler credit capture
To: George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000009cf61305d4f03903"

--0000000000009cf61305d4f03903
Content-Type: text/plain; charset="UTF-8"

>
> It looks like you can get the info you want for credit2


How?

On Thu, Jan 6, 2022 at 6:12 PM George Dunlap <dunlapg@umich.edu> wrote:

> [Adding back in xen-devel to the cc' list]
>
> On Thu, Jan 6, 2022 at 1:41 PM amir masoud noohi <highlimner@gmail.com>
> wrote:
>
>> yes exactly, I want to see the changes of a credit for each vCPU
>>
>
> (FYI we respond in-line on the Xen mailing lists rather than top posting.)
>
> Your best bet is to look into xentrace & xenalyze, and the trace or TRACE
> calls found in xen.git/xen/common/sched/credit[2].c.  It looks like you can
> get the info you want for credit2, but not for credit1 unless you add some
> trace points in.
>
> You can find a video introduction to Xen tracing here:
> https://vimeo.com/33655967
>
> It's a bit old but that system hasn't changed much.
>
>  -George
>
>
>>
>> On Thu, Jan 6, 2022 at 2:32 PM George Dunlap <dunlapg@umich.edu> wrote:
>>
>>>
>>>
>>> On Wed, Jan 5, 2022 at 2:45 PM amir masoud noohi <highlimner@gmail.com>
>>> wrote:
>>>
>>>> Hi Everyone,
>>>>
>>>> Today I'm looking for capturing vCPU credit for both credit1 and
>>>> credit2.
>>>> How can I do that?
>>>>
>>>
>>> Can you explain what you mean by "capture vCPU credit"?  Do you mean you
>>> want to log or sample changes to it?
>>>
>>>  -George
>>>
>>
>>
>> --
>> *Regards*
>> *Noohi*
>> *noohi.org <https://noohi.org>*
>>
>

-- 
*Regards*
*Noohi*
*noohi.org <https://noohi.org>*

--0000000000009cf61305d4f03903
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><span st=
yle=3D"color:rgb(51,51,51);font-family:Arial,sans-serif;font-size:12px;back=
ground-color:rgb(233,234,234)">It looks like you can get the info you want =
for credit2</span></blockquote><div><br></div><div class=3D"gmail_default" =
style=3D"font-family:&quot;trebuchet ms&quot;,sans-serif">How?</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Jan 6, 2022 at 6:12 PM George Dunlap &lt;<a href=3D"mailto:dunlapg@umich.e=
du">dunlapg@umich.edu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div>[Adding back in xen-devel to the=
 cc&#39; list]<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Jan 6, 2022 at 1:41 PM amir masoud noohi &lt;<a h=
ref=3D"mailto:highlimner@gmail.com" target=3D"_blank">highlimner@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div style=3D"font-family:&quot;trebuchet ms&quot;,sans-ser=
if">yes exactly, I want to see the changes of a credit for each vCPU</div><=
/div></blockquote><div><br></div><div><div class=3D"gmail_quote"><div>(FYI =
we respond in-line on the Xen mailing lists rather than top posting.)<br></=
div><div><br></div>Your
 best bet is to look into xentrace &amp; xenalyze, and the trace or=20
TRACE calls found in xen.git/xen/common/sched/credit[2].c.=C2=A0 It looks=
=20
like you can get the info you want for credit2, but not for credit1=20
unless you add some trace points in.</div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">You can find a video introduction to Xen tra=
cing here: <a href=3D"https://vimeo.com/33655967" target=3D"_blank">https:/=
/vimeo.com/33655967</a></div><div class=3D"gmail_quote"><br></div><div clas=
s=3D"gmail_quote">It&#39;s a bit old but that system hasn&#39;t changed muc=
h.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"=
>=C2=A0-George</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Jan 6, 2022 at 2:32 PM George Dunlap &lt;<a href=3D"mai=
lto:dunlapg@umich.edu" target=3D"_blank">dunlapg@umich.edu</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jan 5, 2022 at 2:45 PM amir masoud noohi &lt;<=
a href=3D"mailto:highlimner@gmail.com" target=3D"_blank">highlimner@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div style=3D"font-family:&quot;trebuchet ms&quot;,sans-=
serif">Hi Everyone,</div><div style=3D"font-family:&quot;trebuchet ms&quot;=
,sans-serif"><br></div><div style=3D"font-family:&quot;trebuchet ms&quot;,s=
ans-serif">Today I&#39;m looking for capturing vCPU credit for both credit1=
 and credit2.=C2=A0</div><div style=3D"font-family:&quot;trebuchet ms&quot;=
,sans-serif">How can I do that?=C2=A0</div></div></blockquote><div><br></di=
v><div>Can you explain what you mean by &quot;capture vCPU credit&quot;?=C2=
=A0 Do you mean you want to log or sample changes to it?<br></div><div><br>=
</div><div>=C2=A0-George<br></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><b><font color=3D"#999999">=
Regards</font></b></div><div dir=3D"ltr"><font color=3D"#999999"><b>Noohi</=
b></font></div><div dir=3D"ltr"><b><a href=3D"https://noohi.org" target=3D"=
_blank"><font color=3D"#999999">noohi.org</font></a></b></div></div></div><=
/div></div></div></div></div></div></div></div>
</blockquote></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><=
b><font color=3D"#999999">Regards</font></b></div><div dir=3D"ltr"><font co=
lor=3D"#999999"><b>Noohi</b></font></div><div dir=3D"ltr"><b><a href=3D"htt=
ps://noohi.org" target=3D"_blank"><font color=3D"#999999">noohi.org</font><=
/a></b></div></div></div></div></div></div></div></div></div></div></div>

--0000000000009cf61305d4f03903--


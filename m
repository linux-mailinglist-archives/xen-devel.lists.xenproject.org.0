Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DF8AAE77
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 00:27:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i60AM-0001tD-6m; Thu, 05 Sep 2019 22:23:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6p4L=XA=andrew.cmu.edu=jtuminar@srs-us1.protection.inumbo.net>)
 id 1i60AK-0001t5-UX
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 22:23:45 +0000
X-Inumbo-ID: d1c10db4-d02b-11e9-a337-bc764e2007e4
Received: from mail-io1-xd29.google.com (unknown [2607:f8b0:4864:20::d29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1c10db4-d02b-11e9-a337-bc764e2007e4;
 Thu, 05 Sep 2019 22:23:43 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id s21so8436485ioa.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2019 15:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andrew-cmu-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=o4Agb1hZkvkOQ9+BK0onieWxWSinHOt+XSj1a5demSo=;
 b=Xb9D9NIbPrL0oEMLXzVTDyzKdYWewdph0EzNChA3Q7TGNkrdPxW0CmPqkSwqB8/qQQ
 pJx9HTx2Mo53aog45n3Ur0X97pxOFDC8ULwOgRS462m1yrOS2zOGQkjyDIz0+AIxSe4n
 pRJggeAL1j3B3CAU9CnDgBGjydPSQExxdq8CXGRQ2RZjGKB2a8aae6V72kKfJlLSzNEf
 TkPPakrn7VFrzhgEE7hcJ4VOwaoBa1fB3ST2uPp9qPz1wxOW0vKDilNENF/ttybBLLio
 vI1Z6EcyWDL8bHxXR5SJAGOiB+t9n7dem2hrsOKwlCeuap6eX+oSCaABUuNo2ZeicNoN
 CPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=o4Agb1hZkvkOQ9+BK0onieWxWSinHOt+XSj1a5demSo=;
 b=d2XbPqJGr9xyboJgFDcfTsL9Ux4niCwZdxjplgSPWZS0eEbgBqOrUFGk6Oc9fgxzD5
 jRj+DRPg7YTkc9z/5H3EmOLtn49IG2NJRPPTJPFXDNA6afUFWSkLh+XtpgdDd0Clm/4D
 tTe+DR11QeDD+v5y+E3m5m+8S1JresUlPCg2Qy8zbJiJtb5CMEbJFlenqGxbGzTvWl8n
 ozTL7w7IjB9br+54KJbpGCwOeSX5X6MUG/RgskzMI5Ll5Ax8BwDu4FOM0menDPwr1UBf
 wboUiu2VfM8XXNEf+4O6f4Jd9CqIuAC5fDoBFxxz0JtFhacFZqzbu1Vs+1MFhIjHtme8
 06sw==
X-Gm-Message-State: APjAAAXVv58TaAlNx7VSTnA4tT+ihGRwGF+LpUaOJ6DMok9hX7vOS4a0
 L8a8Swucob7AiQLWVmS8L483dAOf+6Zmtgpp3ai5z9NFtVA=
X-Google-Smtp-Source: APXvYqxSFhjWdThIDQqkWpVUB3yDq19OwgYiW64WspkueGU8HK48SNT5NSlIOW6YzpUJ3Atx/8lc2AbbtVeZnZYT2X0=
X-Received: by 2002:a02:7044:: with SMTP id f65mr6919324jac.37.1567722222790; 
 Thu, 05 Sep 2019 15:23:42 -0700 (PDT)
MIME-Version: 1.0
From: Julian Tuminaro <jtuminar@andrew.cmu.edu>
Date: Thu, 5 Sep 2019 16:23:32 -0600
Message-ID: <CAKan5DCdRvofdAWaL3js9wmWBsiKWt9DAyguOpy0qv=33tdUwQ@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] Looking for Semester long Project
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
Content-Type: multipart/mixed; boundary="===============7410623403088863490=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7410623403088863490==
Content-Type: multipart/alternative; boundary="000000000000323b500591d5c692"

--000000000000323b500591d5c692
Content-Type: text/plain; charset="UTF-8"

Hi,

We (a group of 2 students) are interested in doing a hypervisor related
project for the next 10-12 weeks as part of one of our courses this
semester. We have taken a look at this year's GSoC project list (
https://wiki.xenproject.org/wiki/Outreach_Program_Projects). We were
interested in learning more about the "KDD (Windows Debugger Stub)
enhancements" project and Xen on ARM based projects. Yet, on irc we were
told that this list is outdated. If there are any other project suggestions
or list, we would be interesting in learning more about them.

Andrew Cooper suggested on irc the following project: Context Switching
with CR0.TS in HVM Guest. We would like to possible know more about this
project in terms of difficulty, potential estimate on time required. Andrew
also mentioned a slighter bigger xen/linux project and we would like to
know more detail about this one as well.

Thanks,

Julian

--000000000000323b500591d5c692
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><span st=
yle=3D"font-family:Helvetica,Arial,sans-serif;color:rgb(68,73,80);font-size=
:13px;white-space:pre-wrap">Hi,</span></span><div><span style=3D"background=
-color:rgb(255,255,255)"><span style=3D"font-family:Helvetica,Arial,sans-se=
rif;color:rgb(68,73,80);font-size:13px;white-space:pre-wrap"><br></span></s=
pan></div><div><span style=3D"background-color:rgb(255,255,255)"><span styl=
e=3D"font-family:Helvetica,Arial,sans-serif;color:rgb(68,73,80);font-size:1=
3px;white-space:pre-wrap"> We (a group of 2 students) are interested in doi=
ng a hypervisor related project for the next 10-12 weeks as part of one of =
our courses this semester. We have taken a look at this year&#39;s GSoC pro=
ject list (</span></span><a href=3D"https://wiki.xenproject.org/wiki/Outrea=
ch_Program_Projects">https://wiki.xenproject.org/wiki/Outreach_Program_Proj=
ects</a>)<span style=3D"color:rgb(68,73,80);font-family:Helvetica,Arial,san=
s-serif;font-size:13px;white-space:pre-wrap">. We were interested in learni=
ng more about the </span><span style=3D"color:rgb(68,73,80);font-family:Hel=
vetica,Arial,sans-serif;font-size:13px;white-space:pre-wrap">&quot;KDD (Win=
dows Debugger Stub) enhancements&quot; project and Xen on ARM based project=
s. Yet, on irc we were told that this list is outdated. If there are any ot=
her project suggestions or list, we would be interesting in learning more a=
bout them. </span></div><div><span style=3D"color:rgb(68,73,80);font-family=
:Helvetica,Arial,sans-serif;font-size:13px;white-space:pre-wrap"><br></span=
></div><div><span style=3D"color:rgb(68,73,80);font-family:Helvetica,Arial,=
sans-serif;font-size:13px;white-space:pre-wrap">Andrew Cooper suggested on =
irc the following project: Context Switching with CR0.TS in HVM Guest. We w=
ould like to possible know more about this project in terms of difficulty, =
potential estimate on time required. Andrew also mentioned a slighter bigge=
r xen/linux project and we would like to know more detail about this one as=
 well. </span></div><div><br></div><div>Thanks,</div><div><br></div><div>Ju=
lian=C2=A0</div></div>

--000000000000323b500591d5c692--


--===============7410623403088863490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7410623403088863490==--


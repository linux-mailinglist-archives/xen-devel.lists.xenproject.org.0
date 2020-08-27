Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB67254656
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 15:59:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBIPx-0001Gq-Vv; Thu, 27 Aug 2020 13:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7dK=CF=gmail.com=marietto2008@srs-us1.protection.inumbo.net>)
 id 1kBIKu-0001Ap-Fo
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 13:53:04 +0000
X-Inumbo-ID: 834ba0ca-abee-4115-993e-c52cfbca517b
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 834ba0ca-abee-4115-993e-c52cfbca517b;
 Thu, 27 Aug 2020 13:53:03 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t6so6499013ljk.9
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/Ovy4jl5wCSO7Ooia3lNs8bmx9IQHKe6QxibmHcuC2E=;
 b=htAq1R0uaHHa4vnn2ALYgNpUdAMQ8JMDmt8v+Mfibig4JS2wTSEVy2Y77Y9iCQXrCB
 537gPReX37qRMYUrUA7PmYwHlS2ukE+q8u74d0ptpyArq/41KptyZHzA04mIhkf9goMI
 hOUbHGy2Q4UIqfagAI+LlkCkvPHG7mFXfpODU4XJp4zaNQAgJFO+UQ3IrxwbVpIu/++f
 NB4M8GhEPhB9Gpkorir+SimLSek2EngDKGgvyxTbDbXbcs3rpB7ab5QTfRHM1Z50oUSU
 i5KFbdJmnqQaZOjdL9d5egRU+zhfoKx7b0fsrJE/ajG0RUOMXquo5XNmlFC0Lz41mluI
 q0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/Ovy4jl5wCSO7Ooia3lNs8bmx9IQHKe6QxibmHcuC2E=;
 b=lmjfOhF56+x7R/zKR01VyO8rEUxtBUjuYd0tdfFjqSiGlAjs8EF7brAkd3kRTzS9N1
 LlmbecjuiwBdiqEbDBL/EybQufE/n50qlZk0oJXWGLr6JsJUmdYrk7bqnHJPL8Svh2Y4
 QynidTBeh18x5ZfKGp9voiFMpYYeq0wRg2UlrSccAY2B3e5mbWE8uEefEyPlDS2o1JaX
 kmLpQFnU+yyr4RVVDyOjkoLLguSjNFtGmDAo4mc0B1fo7GGTBZaaAIjXXfbgzXWVAET+
 ZSs6cHPczHvPNDobFZe3dBl8+bHi/aAcysJS3P0dDzkA/lHywm6t9oKfaWpEccrcyHam
 cqoA==
X-Gm-Message-State: AOAM532pGrCEMMDXVYp3YKCH86kcXBaJA5Z/vPpivX1s6AaGpJ8HbpPj
 yjJ0u7kSJtuD7T2xIdUt+oj8uZrrYXigSqb1qAY=
X-Google-Smtp-Source: ABdhPJw/7Wfz2Pg4Sjw51cYKAknQqON8HGVhiZAkEo65HXcdm6X6KAiwu6mUJT0tR4uX1iptfw/oX4n199GW0GIsF1I=
X-Received: by 2002:a05:651c:1103:: with SMTP id
 d3mr9440773ljo.99.1598536381679; 
 Thu, 27 Aug 2020 06:53:01 -0700 (PDT)
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Thu, 27 Aug 2020 15:52:25 +0200
Message-ID: <CA+1FSihpq_i-poiihdF0srE3fGXnncGtCMYqAGmNZu7fjNcY=w@mail.gmail.com>
Subject: Various problems for the Xen for XenGT code and guide.
To: terrence.xu@intel.com, igvt-g@lists.01.org, xen-devel@lists.xenproject.org,
 xen-devel@lists.xen.org, intel-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, "Li, Susie" <susie.li@intel.com>, 
 "Tian, Kevin" <kevin.tian@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>, 
 "Li, Weinan Z" <weinan.z.li@intel.com>, "Downs, Mike" <mike.downs@intel.com>
Content-Type: multipart/alternative; boundary="00000000000030cd6205addc4111"
X-Mailman-Approved-At: Thu, 27 Aug 2020 13:58:16 +0000
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000030cd6205addc4111
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

I would like to pass the integrated gpu from the host os (ubuntu 20.04) to
the windows 10 guest os with xen. This is because xen works great for
me,better than qemu-kvm for my specific needs and because I have only two
graphic cards. The nvidia rtx 2080 ti that I have already passed to the
guest,and the intel UHD 630,that can be duplicated from the host to the
guest so that it can be used in both places without interruptions. So I'm
trying to build this repository :

https://github.com/intel/gvt-linux/wiki/GVTg_Setup_Guide#332-build-qemu--xe=
n-for-xengt

I have to say that this guide is totally not very well written. And the
code is full of unpatched bugs. It's a month that I'm working on
that,trying to fix the bugs that are came out from the 2015 until today.
This is not my job. This is my hobby. But,I need to activate the pass
through for my integrated GPU so I don't to give up. I'm also very angry wi=
th
those coders who do not do their job well and with those coders who do not
respond to help messages. It is not enough to write good code to be a good
programmer. It is also important to keep the documentation updated, to help
those who cannot get the code to work. Anyway,I've documented every step
that I did to make it work here :

https://github.com/intel/gvt-linux/issues/168

right now I'm trying to fix the bug n. 434544,that you can see below.

CC util/qemu-error.o
/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c: In function
=E2=80=98vreport=E2=80=99:
/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:201:5: error:
=E2=80=98GTimeVal=E2=80=99 is deprecated: Use 'GDateTime' instead
[-Werror=3Ddeprecated-declarations]
201 | GTimeVal tv;
| ^~~~~~~~
In file included from /usr/include/glib-2.0/glib/galloca.h:32,
from /usr/include/glib-2.0/glib.h:30,
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/include/glib-compat.h:19,
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/include/qemu/osdep.h:107,
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:13:
/usr/include/glib-2.0/glib/gtypes.h:547:8: note: declared here
547 | struct




















*GTimeVal | ^~~~~~~~~
/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:205:9: error:
=E2=80=98g_get_current_time=E2=80=99 is deprecated: Use 'g_get_real_time' i=
nstead
[-Werror=3Ddeprecated-declarations] 205 | g_get_current_time(&tv); |
^~~~~~~~~~~~~~~~~~ In file included from
/usr/include/glib-2.0/glib/giochannel.h:33, from
/usr/include/glib-2.0/glib.h:54, from
/etc/xen/igvtg-xen/tools/qemu-xen-dir/include/glib-compat.h:19, from
/etc/xen/igvtg-xen/tools/qemu-xen-dir/include/qemu/osdep.h:107, from
/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:13:
/usr/include/glib-2.0/glib/gmain.h:679:8: note: declared here 679 | void
g_get_current_time (GTimeVal result); | ^~~~~~~~~~~~~~~~~~
/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:206:9: error:
=E2=80=98g_time_val_to_iso8601=E2=80=99 is deprecated: Use 'g_date_time_for=
mat' instead
[-Werror=3Ddeprecated-declarations] 206 | timestr =3D
g_time_val_to_iso8601(&tv); | ^~~~~~~ In file included from
/usr/include/glib-2.0/glib.h:88, from
/etc/xen/igvtg-xen/tools/qemu-xen-dir/include/glib-compat.h:19, from
/etc/xen/igvtg-xen/tools/qemu-xen-dir/include/qemu/osdep.h:107, from
/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:13:
/usr/include/glib-2.0/glib/gtimer.h:73:10: note: declared here 73 | gchar
g_time_val_to_iso8601 (GTimeVal *time*) G_GNUC_MALLOC;
| ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
any help is appreciated.  Someone must help me, thanking me for all the
efforts I am making to make work a code full of errors. I would also know
if I can activate the passthrough of the intel integrated gpu using the
precompiled xen-hypervisor package that's on ubuntu. Right now I tried to
compile it from scratch because I've thought that it was a necessary
step,as described on the guide. But Im not sure on this point.

--=20
Mario.

--00000000000030cd6205addc4111
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-js-vote-count gmail-grid--cell gmail-f=
c-black-500 gmail-fs-title gmail-grid gmail-fd-column gmail-ai-center"><tab=
le><tbody><tr><td valign=3D"top">Hello.</td><td></td><td valign=3D"top"></t=
d></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr></tbody></table></div><=
div class=3D"gmail-postcell gmail-post-layout--right"><div class=3D"gmail-p=
ost-text"><p>I would like to pass the integrated gpu from the host os (ubun=
tu=20
20.04) to the windows 10 guest os with xen. This is because xen works=20
great for me,better than qemu-kvm for my specific needs and because I=20
have only two graphic cards. The nvidia rtx 2080 ti that I have already=20
passed to the guest,and the intel UHD 630,that can be duplicated from=20
the host to the guest so that it can be used in both places without=20
interruptions. So I&#39;m trying to build this repository :</p>
<p><a href=3D"https://github.com/intel/gvt-linux/wiki/GVTg_Setup_Guide#332-=
build-qemu--xen-for-xengt" rel=3D"nofollow noreferrer">https://github.com/i=
ntel/gvt-linux/wiki/GVTg_Setup_Guide#332-build-qemu--xen-for-xengt</a></p>
<p>I have to say that this guide is totally not very well written. And the =
code is full of unpatched bugs. It&#39;s a month that I&#39;m working on th=
at,trying to fix the bugs that are came out from the 2015 until today. This=
 is not my job. This is my hobby. But,I need to activate the pass through f=
or my integrated GPU so I don&#39;t to give up. I&#39;m also very angry <sp=
an lang=3D"en">with those coders who do not do their job well and with</spa=
n><span lang=3D"en"> those coders who do not respond to help messages. </sp=
an><span lang=3D"en">It is not enough to write good code to be a good progr=
ammer. It is also important to keep</span><span lang=3D"en"> the documentat=
ion updated, to help those who cannot get the code to work. Anyway,I&#39;ve=
 documented every step that I did to make it work here :</span></p><p><span=
 lang=3D"en"><a href=3D"https://github.com/intel/gvt-linux/issues/168">http=
s://github.com/intel/gvt-linux/issues/168</a></span></p><p><span lang=3D"en=
">right now I&#39;m trying to fix the bug n. 434544,that you can see below.=
<br></span></p><p><span lang=3D"en">CC      util/qemu-error.o<br>
/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c: In function =E2=80=
=98vreport=E2=80=99:<br>
/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:201:5: error:=20
=E2=80=98GTimeVal=E2=80=99 is deprecated: Use &#39;GDateTime&#39; instead=
=20
[-Werror=3Ddeprecated-declarations]<br>
201 |     GTimeVal tv;<br>
|     ^~~~~~~~<br>
In file included from /usr/include/glib-2.0/glib/galloca.h:32,<br>
from /usr/include/glib-2.0/glib.h:30,<br>
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/include/glib-compat.h:19,<br>
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/include/qemu/osdep.h:107,<br>
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:13:<br>
/usr/include/glib-2.0/glib/gtypes.h:547:8: note: declared here<br>
547 | struct <em>GTimeVal<br>
|        ^~~~~~~~~<br>
/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:205:9: error:=20
=E2=80=98g_get_current_time=E2=80=99 is deprecated: Use &#39;g_get_real_tim=
e&#39; instead=20
[-Werror=3Ddeprecated-declarations]<br>
205 |         g_get_current_time(&amp;tv);<br>
|         ^~~~~~~~~~~~~~~~~~<br>
In file included from /usr/include/glib-2.0/glib/giochannel.h:33,<br>
from /usr/include/glib-2.0/glib.h:54,<br>
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/include/glib-compat.h:19,<br>
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/include/qemu/osdep.h:107,<br>
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:13:<br>
/usr/include/glib-2.0/glib/gmain.h:679:8: note: declared here<br>
679 | void   g_get_current_time                 (GTimeVal       <em>result)=
;<br>
|        ^~~~~~~~~~~~~~~~~~<br>
/etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:206:9: error:=20
=E2=80=98g_time_val_to_iso8601=E2=80=99 is deprecated: Use &#39;g_date_time=
_format&#39; instead=20
[-Werror=3Ddeprecated-declarations]<br>
206 |         timestr =3D g_time_val_to_iso8601(&amp;tv);<br>
|         ^~~~~~~<br>
In file included from /usr/include/glib-2.0/glib.h:88,<br>
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/include/glib-compat.h:19,<br>
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/include/qemu/osdep.h:107,<br>
from /etc/xen/igvtg-xen/tools/qemu-xen-dir/util/qemu-error.c:13:<br>
/usr/include/glib-2.0/glib/gtimer.h:73:10: note: declared here<br>
73 | gchar</em>   g_time_val_to_iso8601   (GTimeVal    *time</em>) G_GNUC_M=
ALLOC;<br>
|          ^~~~~~~~~~~~~~~~~~~~~<br>
cc1: all warnings being treated as errors</span></p></div></div><div>any he=
lp is appreciated.=C2=A0 <span lang=3D"en">Someone must help me, thanking m=
e for all the efforts I am making to make work a code full of errors. I wou=
ld also know</span> if I can activate the passthrough of the intel=20
integrated gpu using the precompiled xen-hypervisor package that&#39;s on=
=20
ubuntu. Right now I tried to compile it from scratch because I&#39;ve=20
thought that it was a necessary step,as described on the guide. But Im not =
sure on this point.<span lang=3D"en"></span></div><div><br></div><div>-- </=
div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature">Mario.<br></div></div>

--00000000000030cd6205addc4111--


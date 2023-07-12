Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1563C7508EB
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 14:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562481.879169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZOy-0007of-2i; Wed, 12 Jul 2023 12:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562481.879169; Wed, 12 Jul 2023 12:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZOy-0007mz-00; Wed, 12 Jul 2023 12:57:04 +0000
Received: by outflank-mailman (input) for mailman id 562481;
 Wed, 12 Jul 2023 12:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0TT=C6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qJZOw-0007mt-Km
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 12:57:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97285f52-20b3-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 14:57:00 +0200 (CEST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by support.bugseng.com (Postfix) with ESMTPSA id 051E84EE073E
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 14:57:00 +0200 (CEST)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-44358c019ddso2580061137.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 05:56:59 -0700 (PDT)
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
X-Inumbo-ID: 97285f52-20b3-11ee-8611-37d641c3527e
X-Gm-Message-State: ABy/qLZD0UtpXJT1MKVvjpYFEMw+n6zuDIBokJh2pQgaTbmfOFovybmh
	BBIOzvl368HvFeakaiRQnagYNIYq/n/BRxX+nhk=
X-Google-Smtp-Source: APBJJlH/I1pPS+txKz4GmAGBQSlpaGeiOwzM7KI9TpAQ4/OduLPc9+3jzsrDKsrklh5c//ETeCuHKSJ5R4OKJJXFffg=
X-Received: by 2002:a67:e90b:0:b0:443:6cd7:6dc3 with SMTP id
 c11-20020a67e90b000000b004436cd76dc3mr9503763vso.5.1689166618811; Wed, 12 Jul
 2023 05:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com> <73977cf1-b38a-4eb8-4bac-cf2656535cb0@suse.com>
In-Reply-To: <73977cf1-b38a-4eb8-4bac-cf2656535cb0@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Wed, 12 Jul 2023 14:56:47 +0200
X-Gmail-Original-Message-ID: <CAFHJcJu8Z7Lwv6RJuGnqovV0OGK1ehhm3y6xCevfLrniLJN4uQ@mail.gmail.com>
Message-ID: <CAFHJcJu8Z7Lwv6RJuGnqovV0OGK1ehhm3y6xCevfLrniLJN4uQ@mail.gmail.com>
Subject: Re: Violations of mandatory MISRA C:2012 Rule 19.1 in X86_64 build
To: Jan Beulich <jbeulich@suse.com>
Cc: Roberto Bagnara <roberto.bagnara@bugseng.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000047e28b060049c0a1"

--00000000000047e28b060049c0a1
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 12 lug 2023 alle ore 14:50 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 11.07.2023 18:40, Roberto Bagnara wrote:
> > Mandatory Rule 19.1 (An object shall not be assigned or copied to an
> > overlapping object) is directly targeted at two undefined behaviors,
> > one of which is the subject of 6.5.16.1p3, namely:
> >
> >    If the value being stored in an object is read from another object
> >    that overlaps in any way the storage of the first object, then the
> >    overlap shall be exact and the two objects shall have qualified or
> >    unqualified versions of a compatible type; otherwise, the behavior
> >    is undefined.
> >
> > You can see a number of definite violations in the X86_64 build
> > at this link:
> >
> >
> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/149/PROJECT.ecd;/by_service/MC3R1.R19.1.html
>
> Hmm, gives me "Unauthorized".
>

Please try again, now it should work.

Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--00000000000047e28b060049c0a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno mer 12 lug 2023 alle ore 14=
:50 Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com<=
/a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 11.07.2023 18:40, Roberto Bagnara wrote:<br>
&gt; Mandatory Rule 19.1 (An object shall not be assigned or copied to an<b=
r>
&gt; overlapping object) is directly targeted at two undefined behaviors,<b=
r>
&gt; one of which is the subject of 6.5.16.1p3, namely:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 If the value being stored in an object is read from anoth=
er object<br>
&gt;=C2=A0 =C2=A0 that overlaps in any way the storage of the first object,=
 then the<br>
&gt;=C2=A0 =C2=A0 overlap shall be exact and the two objects shall have qua=
lified or<br>
&gt;=C2=A0 =C2=A0 unqualified versions of a compatible type; otherwise, the=
 behavior<br>
&gt;=C2=A0 =C2=A0 is undefined.<br>
&gt; <br>
&gt; You can see a number of definite violations in the X86_64 build<br>
&gt; at this link:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://saas.eclairit.com:3787/fs/var/local/ec=
lair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/149/PROJECT.ecd;/by_=
service/MC3R1.R19.1.html" rel=3D"noreferrer" target=3D"_blank">https://saas=
.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/stagin=
g/X86_64-Set1/149/PROJECT.ecd;/by_service/MC3R1.R19.1.html</a><br>
<br>
Hmm, gives me &quot;Unauthorized&quot;.<br></blockquote><div><br></div></di=
v><div>Please try again, now it should work.<br></div><div><br></div><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Simone Ballarin, M.Sc=
.<br><br><div>Field Application Engineer, BUGSENG (<a href=3D"http://bugsen=
g.com" target=3D"_blank">https://bugseng.com</a>)</div></div></div></div>

--00000000000047e28b060049c0a1--


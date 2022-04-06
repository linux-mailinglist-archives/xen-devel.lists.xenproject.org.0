Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B6D4F5829
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 11:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299748.510899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1Wa-0003Mv-6p; Wed, 06 Apr 2022 09:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299748.510899; Wed, 06 Apr 2022 09:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1Wa-0003Kl-3R; Wed, 06 Apr 2022 09:00:24 +0000
Received: by outflank-mailman (input) for mailman id 299748;
 Wed, 06 Apr 2022 09:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITwm=UQ=gmail.com=trigger.huang@srs-se1.protection.inumbo.net>)
 id 1nc1WY-0003Kd-Fd
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 09:00:22 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcaae1d6-b587-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 11:00:21 +0200 (CEST)
Received: by mail-pg1-x534.google.com with SMTP id k14so1721165pga.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Apr 2022 02:00:21 -0700 (PDT)
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
X-Inumbo-ID: fcaae1d6-b587-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=4ai1600hTFj5xUYHJYsI1cDmlSJc0jGDB27PJST9lyM=;
        b=Sf7ygPQ1D3qLCwUml+T79i2dDew+Xiz82oPiL/5d8eeevaYUZzvDQDXhSQ65eqeAc4
         oUgbyWRKdIUqSHmsRpxm+g0sLGJf5ERMzeER7RusATjSGxIhwydjfp5wIsK6ZRg438Ou
         AdRgDJShdP8t58+s2jZYgUqKpMNkraWwohOZ80ZBpM+pzS58ckWvCmF0wVRwECocpNs7
         C3ED1PikWn7jvS0t2zjVX3gF7LJBEKmuEkR+0gKUErMGkGk8GROzCz8wrYuplvxbTMjz
         2+vwhUagZzC74aAG4z7nPbMF8+Q5OAvPjl7yFvGeqAShA8Lhkz1Uj5hZEu8pYaMV5Oim
         0KnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=4ai1600hTFj5xUYHJYsI1cDmlSJc0jGDB27PJST9lyM=;
        b=AYuV9LwxXNs65x+mSqEL6IgGZ07XhBNFmqTJ3QntT+4mY+qkYe02pR17GqyQn5J9nZ
         UBbAtucSr+oLazRh10QJvwDhj8Xi/cqod79R/SOptuQxO82JnBy/u+eBhk38W2mLR5SQ
         5KQsp3PBsDXiaF+KGzdJzv1EemWh2TXHl5zfgMfP88Iq64jiuDEUlZoexkLHb/OxLEHJ
         QIqO9Tz/6snyNJB5GSPSZvmadjA9VOuR2eT+NCFRfLFaXVjCeeDTuDAyuJRXN6P/i1zt
         8mlHtdsJb6tGs2xo37QgL+Wua+IXI65kbhEPJJV10GPWLkggl0w38KdKhN/QoHXXH91U
         rrkQ==
X-Gm-Message-State: AOAM533VcZaxi+OiCdkrsc+qZTfdFCQeGou3VZaAHbkAPrFIImLymvXg
	iafizHXoNtJ5N5Al3Y7UawFyAeUt05oJ5XVBxBB7ImLnMWE=
X-Google-Smtp-Source: ABdhPJzstcNLwZUV3HSgjQatn8l2ZaB1ToeZspbdOC45ca3mBPRWEtVWcEea/32jd3dh3zerB3fjfpEjJFBt+h+IBm4=
X-Received: by 2002:a63:8c5a:0:b0:387:6367:c08a with SMTP id
 q26-20020a638c5a000000b003876367c08amr6281876pgn.155.1649235619821; Wed, 06
 Apr 2022 02:00:19 -0700 (PDT)
MIME-Version: 1.0
From: Trigger Huang <trigger.huang@gmail.com>
Date: Wed, 6 Apr 2022 17:00:08 +0800
Message-ID: <CANH0Q9k=csOJktNmr29XhQRC0niBTBU0Z_J=qKoAAV9u2v2oWA@mail.gmail.com>
Subject: qemu-system-i386: -mem-path not supported with Xen when try to use
 memory-backend-memfd to share the memory with external processes on qemu-xen stable-4.16
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000453a6105dbf8974d"

--000000000000453a6105dbf8974d
Content-Type: text/plain; charset="UTF-8"

Hello,

The QEMU Documentation suggests to use memory-backend-memfd to share the
memory with external processes, so I  add the following patch to
libxl__build_device_model_args_new() @ tools/libs/light/libxl_dm.c

*+               flexarray_append_pair(dm_args, "-object",
"memory-backend-memfd,id=mem1,size=4G");+
flexarray_append_pair(dm_args, "-machine", "memory-backend=mem1");*

However, I always got error '*qemu-system-i386: -mem-path not supported
with Xen*'
After check the qemu-xen source, the error is from
'qemu_ram_alloc_from_fd() @ softmmu/physmem.c



* if (xen_enabled()) {        error_setg(errp, "-mem-path not supported
with Xen");        return NULL;    }*

So, any suggestions on how to enable  *-mem-path* on Xen?

Thanks,
Trigger

--000000000000453a6105dbf8974d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, <br></div><div><br></div><div>The QEMU Documen=
tation suggests to use memory-backend-memfd to share the memory with extern=
al processes, so I=C2=A0 add the following patch to libxl__build_device_mod=
el_args_new() @ tools/libs/light/libxl_dm.c</div><div><i>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flexarray_append_pair(dm_args, <span sty=
le=3D"color:rgb(0,0,255)"><b>&quot;-object&quot;, &quot;memory-backend-memf=
d,id=3Dmem1,size=3D4G&quot;</b></span>);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 flexarray_append_pair(dm_args, &quot;<span style=3D"co=
lor:rgb(0,0,255)"><b>-machine&quot;, &quot;memory-backend=3Dmem1</b></span>=
&quot;);</i><br></div><div><br></div><div>However, I always got error &#39;=
<b><span style=3D"color:rgb(255,0,0)">qemu-system-i386: -mem-path not suppo=
rted with Xen</span></b>&#39;</div><div>After check the qemu-xen source, th=
e error is from &#39;qemu_ram_alloc_from_fd() @ softmmu/physmem.c</div><div=
>=C2=A0=C2=A0=C2=A0<i> if (xen_enabled()) {<br>=C2=A0=C2=A0 =C2=A0 =C2=A0=
=C2=A0 error_setg(errp, &quot;-mem-path not supported with Xen&quot;);<br>=
=C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0 return NULL;<br>=C2=A0=C2=A0=C2=A0 }</i></=
div><div><br></div><div>So, any suggestions on how to enable=C2=A0 <span st=
yle=3D"color:rgb(0,0,255)"><b>-mem-path</b></span> on Xen?<br></div><div><b=
r></div><div>Thanks,</div><div>Trigger<br></div></div>

--000000000000453a6105dbf8974d--


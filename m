Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8CD6BCF8F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 13:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510561.788411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmnV-0001BA-My; Thu, 16 Mar 2023 12:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510561.788411; Thu, 16 Mar 2023 12:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcmnV-00017u-K5; Thu, 16 Mar 2023 12:33:33 +0000
Received: by outflank-mailman (input) for mailman id 510561;
 Thu, 16 Mar 2023 12:33:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AWu8=7I=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pcmnU-00017o-6g
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 12:33:32 +0000
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id c16d6937-c3f6-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 13:33:31 +0100 (CET)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173]) by
 95303ccc4d02 with SMTP id 64130c984699828fae7672ed (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Thu, 16 Mar 2023 12:33:28 GMT
Received: by mail-yb1-f173.google.com with SMTP id u32so1666131ybi.6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 05:33:28 -0700 (PDT)
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
X-Inumbo-ID: c16d6937-c3f6-11ed-87f5-c1b5be75604c
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1678970008; x=1678977208; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=0bHaTbt3nUR1/J8GfDwTJUxbkQ9r+yXVy745SvVBSQE=;
 b=U8qIkq04TbwIQN0qe1EOQe+JCyWHh5SUtUWKhhnKeZxDCuqbchXQcVSMXAjYYfy85eXAV/PukF4qGXBJk/+Kt5gWNHf58J7JRroZKbrbJRCNYSjxY0Gkie25yKQh/SF5kGSf5NMjK6/IzEi9QNPlbRJ83RnTXvnT2RVLWHyJ50CwC7H2LBOw8OePtjT/uezTD7sc5FR3xBFD2/GgJf7UK/9OcIdgWLEJHTSqmjvqomaRLm01YsNcNJP0++ujRnvgeH0EKjd6I+pN1kNj4SlUkD0qHbvP/qcMlBzcBQcwmJdKwOvS7sMfRt+tRLdFm1Z23yrdKrJZqJQyF++Gcn+LyA==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKXA0ET8qaNb6l6eUVzgg40nw++PuXKwdF+rmSfo0XxdedQe2xss
	sl76KQ0SPcHhG/weiwe719OC153lJc/Pws880vs=
X-Google-Smtp-Source: AK7set82+1wgfzNy9t5cGC1bAXFSmQmPmxfZXFggYMshbbnD5gkNPvtHezxRvcV7wrJqTl+9h045lMTtde/PAb2MSaU=
X-Received: by 2002:a05:6902:1541:b0:b4c:9333:295 with SMTP id
 r1-20020a056902154100b00b4c93330295mr4567563ybu.6.1678970007860; Thu, 16 Mar
 2023 05:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <aab9c8ae059d5f584516d0b6466e57ce0981dadc.1678904818.git.isaikin-dmitry@yandex.ru>
In-Reply-To: <aab9c8ae059d5f584516d0b6466e57ce0981dadc.1678904818.git.isaikin-dmitry@yandex.ru>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 16 Mar 2023 08:32:51 -0400
X-Gmail-Original-Message-ID: <CABfawhmTsGmdaThwVwu7yhE2zB-VmdPei2FcZ1_UZH9EU9Cvbg@mail.gmail.com>
Message-ID: <CABfawhmTsGmdaThwVwu7yhE2zB-VmdPei2FcZ1_UZH9EU9Cvbg@mail.gmail.com>
Subject: Re: [XEN PATCH v2] x86/monitor: Add new monitor event to catch I/O instructions
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Anton Belousov <abelousov@ptsecurity.com>
Content-Type: multipart/alternative; boundary="000000000000e83b5405f703aa30"

--000000000000e83b5405f703aa30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 2:55=E2=80=AFPM Dmitry Isaykin <isaikin-dmitry@yand=
ex.ru>
wrote:
>
> Adds monitor support for I/O instructions.
>
> Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

--000000000000e83b5405f703aa30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Mar 15, 2023 at 2:55=E2=80=AFPM Dmitry Isa=
ykin &lt;<a href=3D"mailto:isaikin-dmitry@yandex.ru">isaikin-dmitry@yandex.=
ru</a>&gt; wrote:<br>&gt;<br>&gt; Adds monitor support for I/O instructions=
.<br>&gt;<br>&gt; Signed-off-by: Dmitry Isaykin &lt;<a href=3D"mailto:isaik=
in-dmitry@yandex.ru">isaikin-dmitry@yandex.ru</a>&gt;<br>&gt; Signed-off-by=
: Anton Belousov &lt;<a href=3D"mailto:abelousov@ptsecurity.com">abelousov@=
ptsecurity.com</a>&gt;<br><div><br></div><div>Acked-by: Tamas K Lengyel &lt=
;<a href=3D"mailto:tamas@tklengyel.com">tamas@tklengyel.com</a>&gt;<br></di=
v></div>

--000000000000e83b5405f703aa30--


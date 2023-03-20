Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D6F6C25E9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 00:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512153.791907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pePAX-0007BX-BU; Mon, 20 Mar 2023 23:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512153.791907; Mon, 20 Mar 2023 23:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pePAX-00078m-7q; Mon, 20 Mar 2023 23:44:01 +0000
Received: by outflank-mailman (input) for mailman id 512153;
 Mon, 20 Mar 2023 23:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4LM=7M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1pePAV-00078c-L4
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 23:43:59 +0000
Received: from so254-35.mailgun.net (so254-35.mailgun.net [198.61.254.35])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id 151fb4a8-c779-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 00:43:58 +0100 (CET)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169]) by
 7a2039c4603b with SMTP id 6418efbca30a5ed72569b589 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Mon, 20 Mar 2023 23:43:56 GMT
Received: by mail-yb1-f169.google.com with SMTP id k17so4467488ybm.11
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 16:43:56 -0700 (PDT)
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
X-Inumbo-ID: 151fb4a8-c779-11ed-87f5-c1b5be75604c
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1679355836; x=1679363036; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=Ss9SZAIfLoBmgPZ+I3riaZwjUT2RVhV59wXQsNNOMvA=;
 b=ynCyfLBKs2K2eD8ocPN6/Uql+vmprFz4QzVxHMjWx6yQKY1vArX56iLk+ZKH7NV/DxUBAiSSp5amtB3teSlutga9x+hxVoBsmB4apwfS+A3SUp85HsnEGTEy07/mNj6dYCu11feVOlx2zycx/wYrcbNWGKGAd5ebXbvI9Iss97iVjbKKwysa6LP6YGQS0j2uNIDK9iszgq7TmpcO12yueQEUqDBF3FChrlP02dShqbSo9V830ok4+uBc1LsWeFs5ZuGz1tFRDXVChC/gQQhyJve+06uzGNVBMoJ0HXb+gswqS4haoyoh9P11Z98kT/QLyjc/YUpPR0aoq/BKZPfIvg==
X-Mailgun-Sending-Ip: 198.61.254.35
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AAQBX9fpqgK3DnSXxEsF3s1tW7m30Z+p8jLnFrxh/fMDDjA5xHa+fBFs
	MlCH1GlpHwuQNNmvti6RDGx0fTZrrwc5WE1ggVY=
X-Google-Smtp-Source: AKy350YkEZ7DPocvQmWFKLrVI1fJDIIt2oyxGcJb6z8oonIKkl82GeA1p0fu9/GFHQkxK0XyjZBf8kx7WJhgtoDcESo=
X-Received: by 2002:a05:6902:72d:b0:b6b:6a39:949c with SMTP id
 l13-20020a056902072d00b00b6b6a39949cmr157310ybt.6.1679355836264; Mon, 20 Mar
 2023 16:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru> <CABfawhncTLzRvHYF3SyhdidfobP9PB3YOZ9oTjRREjKs07KtXQ@mail.gmail.com>
 <c5ea0f53-8cc9-509e-6c82-deea00f1ed74@list.ru> <615872d7-b118-374c-a89a-3d46b5e5f2f8@citrix.com>
In-Reply-To: <615872d7-b118-374c-a89a-3d46b5e5f2f8@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Mar 2023 19:43:20 -0400
X-Gmail-Original-Message-ID: <CABfawhnvMEcD-az1o=C7ae0Wy9XZLFHJMWpVudVX3Q3pqM0wsA@mail.gmail.com>
Message-ID: <CABfawhnvMEcD-az1o=C7ae0Wy9XZLFHJMWpVudVX3Q3pqM0wsA@mail.gmail.com>
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>, 
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Content-Type: multipart/alternative; boundary="00000000000012776605f75d805f"

--00000000000012776605f75d805f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 3:34=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com>
wrote:
>
> On 20/03/2023 7:22 pm, =D0=9A=D0=BE=D0=B2=D0=B0=D0=BB=D1=91=D0=B2 =D0=A1=
=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 wrote:
> >
> > 21.03.2023 1:51, Tamas K Lengyel wrote:
> >> On Mon, Mar 20, 2023 at 12:32=E2=80=AFPM =D0=9A=D0=BE=D0=B2=D0=B0=D0=
=BB=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 <valor@list.ru
> >> <mailto:valor@list.ru>> wrote:
> >>  >
> >>  > gva_to_gfn command used for fast address translation in LibVMI
> >> project.
> >>  > With such a command it is possible to perform address translation i=
n
> >>  > single call instead of series of queries to get every page table.
> >>
> >> You have a couple assumptions here:
> >>   - Xen will always have a direct map of the entire guest memory -
> >> there are already plans to move away from that. Without that this
> >> approach won't have any advantage over doing the same mapping by LibVM=
I
> >
> > Thanks! I didn't know about the plan.
>
> To be clear, "not mapping the guest by default" is for speculative
> safety/hardening reasons.
>
> Xen will always need to be capable of mapping arbitrary parts of the
> guest, even if only transiently, so there's no relevant interaction with
> this new proposed hypercall.
>
>
> The truth is that Xen will always be able to do a single pagewalk faster
> than libvmi can do it (via mappings, or otherwise), but if libvmi does
> properly maintain a cache of mappings then it will be faster that
> repeated hypercalls into Xen.  Where the split lies depends heavily on
> the libvmi workload.
>
> I don't see a problem in principle with a hypercall like this - it is
> "just" a performance optimisation over capabilities that libvmi already
> has - but the version presented here is overly simplistic.

For debugging purposes sure it would be fine to have this hypercall but I
wouldn't set it as the default for LibVMI. Oftentimes the lookup needs to
be more nuanced then what Xen understands about paging. For example, on
Windows guests you can have transition pages that don't have the present
bit set yet are perfectly valid for introspection purposes (
https://citeseerx.ist.psu.edu/document?repid=3Drep1&type=3Dpdf&doi=3D3311ed=
0c63d4ca707c49256655e401f37f25ec50).
Xen would need to be enlightened about this type of OS-specific tidbits for
which I think LibVMI is a much better place to keep the logic for.

Tamas

--00000000000012776605f75d805f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Mar 20, 2023 at 3:34=E2=80=AFPM Andrew Coo=
per &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.=
com</a>&gt; wrote:<br>&gt;<br>&gt; On 20/03/2023 7:22 pm, =D0=9A=D0=BE=D0=
=B2=D0=B0=D0=BB=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 wrote:<br>=
&gt; &gt;<br>&gt; &gt; 21.03.2023 1:51, Tamas K Lengyel wrote:<br>&gt; &gt;=
&gt; On Mon, Mar 20, 2023 at 12:32=E2=80=AFPM =D0=9A=D0=BE=D0=B2=D0=B0=D0=
=BB=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 &lt;<a href=3D"mailto:=
valor@list.ru">valor@list.ru</a><br>&gt; &gt;&gt; &lt;mailto:<a href=3D"mai=
lto:valor@list.ru">valor@list.ru</a>&gt;&gt; wrote:<br>&gt; &gt;&gt; =C2=A0=
&gt;<br>&gt; &gt;&gt; =C2=A0&gt; gva_to_gfn command used for fast address t=
ranslation in LibVMI<br>&gt; &gt;&gt; project.<br>&gt; &gt;&gt; =C2=A0&gt; =
With such a command it is possible to perform address translation in<br>&gt=
; &gt;&gt; =C2=A0&gt; single call instead of series of queries to get every=
 page table.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; You have a couple assumption=
s here:<br>&gt; &gt;&gt; =C2=A0 - Xen will always have a direct map of the =
entire guest memory -<br>&gt; &gt;&gt; there are already plans to move away=
 from that. Without that this<br>&gt; &gt;&gt; approach won&#39;t have any =
advantage over doing the same mapping by LibVMI<br>&gt; &gt;<br>&gt; &gt; T=
hanks! I didn&#39;t know about the plan.<br>&gt;<br>&gt; To be clear, &quot=
;not mapping the guest by default&quot; is for speculative<br>&gt; safety/h=
ardening reasons.<br>&gt;<br>&gt; Xen will always need to be capable of map=
ping arbitrary parts of the<br>&gt; guest, even if only transiently, so the=
re&#39;s no relevant interaction with<br>&gt; this new proposed hypercall.<=
br>&gt;<br>&gt;<br>&gt; The truth is that Xen will always be able to do a s=
ingle pagewalk faster<br>&gt; than libvmi can do it (via mappings, or other=
wise), but if libvmi does<br>&gt; properly maintain a cache of mappings the=
n it will be faster that<br>&gt; repeated hypercalls into Xen.=C2=A0 Where =
the split lies depends heavily on<br>&gt; the libvmi workload.<br>&gt;<br>&=
gt; I don&#39;t see a problem in principle with a hypercall like this - it =
is<br>&gt; &quot;just&quot; a performance optimisation over capabilities th=
at libvmi already<br>&gt; has - but the version presented here is overly si=
mplistic.<br><div><br></div><div>For debugging purposes sure it would be fi=
ne to have this hypercall but I wouldn&#39;t set it as the default for LibV=
MI. Oftentimes the lookup needs to be more nuanced then what Xen understand=
s about paging. For example, on Windows guests you can have transition page=
s that don&#39;t have the present bit set yet are perfectly valid for intro=
spection purposes (<a href=3D"https://citeseerx.ist.psu.edu/document?repid=
=3Drep1&amp;type=3Dpdf&amp;doi=3D3311ed0c63d4ca707c49256655e401f37f25ec50">=
https://citeseerx.ist.psu.edu/document?repid=3Drep1&amp;type=3Dpdf&amp;doi=
=3D3311ed0c63d4ca707c49256655e401f37f25ec50</a>). Xen would need to be enli=
ghtened about this type of OS-specific tidbits for which I think LibVMI is =
a much better place to keep the logic for.<br></div><div><br></div><div>Tam=
as<br></div></div>

--00000000000012776605f75d805f--


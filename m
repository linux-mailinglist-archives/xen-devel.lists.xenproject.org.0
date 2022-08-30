Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055C15A648E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 15:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395050.634616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT1CI-0006Al-Iq; Tue, 30 Aug 2022 13:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395050.634616; Tue, 30 Aug 2022 13:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT1CI-00068r-G7; Tue, 30 Aug 2022 13:22:30 +0000
Received: by outflank-mailman (input) for mailman id 395050;
 Tue, 30 Aug 2022 13:06:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8i5b=ZC=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1oT0wq-0004MW-QR
 for xen-devel@lists.xen.org; Tue, 30 Aug 2022 13:06:32 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9094321d-2864-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 15:06:31 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id j5so7169057plj.5
 for <xen-devel@lists.xen.org>; Tue, 30 Aug 2022 06:06:31 -0700 (PDT)
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
X-Inumbo-ID: 9094321d-2864-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=8LHc0WpHLu9wlZtjdiUeM67gKfqRlIHOCxKlnTrSOK8=;
        b=ajAxEpml0f2QRLsiciAQ6IfS4JKXWGLoiwjU3WAp3qFHg6AQ3MnoBP1XBUN7g6lgNE
         MM+6ciTInr+tQmUElIuH4+HfCI4WtenQ36f/Do9GszVgXMNVYptOoEsZJzYHkDrf9mhT
         7jB+BJTqhMXFNLyUviBhQMEOUri4m11cvMwdPKSmbUasW7yKWeTxMbMBKr7sRmFqup9s
         0HfIsQqDfZGHND9CnDZMWcvrkPkmjgSm/7sxdauOiWR1K3aNzYvvCqwwQG70kKR7krpe
         aXf2znYbg5LOwvqxU6GNHcapW04IYRhPz72qzB43/KGNy84g5xCRkjqrI9WI+7v5H8PK
         MicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=8LHc0WpHLu9wlZtjdiUeM67gKfqRlIHOCxKlnTrSOK8=;
        b=XadAtDaZAXFEZgwyyXeIDiLq5hQnbqZGsKtN9az2zRamTid2KJ07PAvdjeRnlqn+7T
         siA4MFtpOslhVppSVtVIBwiBZDSeQRXuWzbD4cSHC8m1fuLYcLFp7GgI7acoJphI3Qtq
         uBMSOlmuLkd1YY+4E/Z/UMCTxeKLxX9g28zC9tZSR5r5fKHeTZ35K5LhgmiME3VHoHDo
         TFWEYGHkmMm1qu+i935BxkJoLZV9FyueHtSLSyuGUw5U9r3AF7bjbLPMVJlLVZFD+PeB
         S7yR/UobqZvJ5obYAuUN2TUqSoXNiA4VR5OId1anDNnXGqK3K0GtKSL5EYKO6kA9LXXM
         PyPw==
X-Gm-Message-State: ACgBeo3ZIneHKSWS5w7NmC6z3oF4UXgVWCoQZRxmQ5PXNEeZs7qJIV6p
	3NuVlzSmJETmegMJQn+x9ClVVrLu6+s8Wi9N/pnojGdSeRpT+A==
X-Google-Smtp-Source: AA6agR4jnShZCZroGR4L87MWGkf2IxfhhPgCjlB72kpmwK3tM+2eu+mMxZKCjeK+3ysZMq0xhWV4R/ENsN4/UrrASCk=
X-Received: by 2002:a17:90a:7644:b0:1fd:ecc8:9975 with SMTP id
 s4-20020a17090a764400b001fdecc89975mr7128895pjl.219.1661864789589; Tue, 30
 Aug 2022 06:06:29 -0700 (PDT)
MIME-Version: 1.0
From: Oleshii Wood <oleshiiwood@gmail.com>
Date: Tue, 30 Aug 2022 16:09:49 +0300
Message-ID: <CA+SAi2s6ZfY87dR2noYkKiH_QwJMXKbj_6404Hmru-t==vSAhw@mail.gmail.com>
Subject: Xen in ARM environment networking overload issue
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="00000000000072c5a405e7750c05"

--00000000000072c5a405e7750c05
Content-Type: text/plain; charset="UTF-8"

Hello guys,

The same issue migh be found by link
https://xen.markmail.org/message/3w4oqeu5z7ryfbsb?q=xen_add_phys_to_mach_entry&page=1

DOM0/DOMU kernels version 5.15.19

Two XENified guests. They are equal. They both have the same configuration.
It is enough to have one DomU and Dom0.

Part of DomU configuration.
type = "pvh"
memory = 1024
vcpus = 1

It is not necessary to repeat full custom board configuration with all the
bridges.
It is enough to connect DomU with some external machine or with Dom0
through the network.

You should have a perf3 compiled package on both ends.
on Dom0 or external host you issue command:
perf3 -s &

on DomU you issue the command:
perf3 -c [Dom0 or external host ip address] -k 400K -b 0

After enough short time you will see in your DomU kernel messages or in
your xen console something like
[ 2385.999011] xen_add_phys_to_mach_entry: cannot add
pfn=0x000000000003e0de -> mfn=0x00000000008031f2: pfn=0x000000000003e0de ->
mfn=0x00000000008044a0 already exists
[ 2355.968172] xen_add_phys_to_mach_entry: cannot add
pfn=0x000000000003bfca -> mfn=0x000000000080319c: pfn=0x000000000003bfca ->
mfn=0x0000000000803276 already exists
[ 2323.002652] xen_add_phys_to_mach_entry: cannot add
pfn=0x000000000003b80e -> mfn=0x000000000080447d: pfn=0x000000000003b80e ->
mfn=0x00000000008032a7 already exists
[ 2302.036336] xen_add_phys_to_mach_entry: cannot add
pfn=0x000000000003e0de -> mfn=0x0000000000803105: pfn=0x000000000003e0de ->
mfn=0x00000000008044a0 already exists
[ 2273.758169] xen_add_phys_to_mach_entry: cannot add
pfn=0x000000000003b80e -> mfn=0x00000000008033fc: pfn=0x000000000003b80e ->
mfn=0x00000000008032a7 already exists
[ 2252.254857] xen_add_phys_to_mach_entry: cannot add
pfn=0x000000000003b80e -> mfn=0x00000000008032f0: pfn=0x000000000003b80e ->
mfn=0x00000000008032a7 already exists

You will have a lot of those messages.

Involved files
arch/arm/xen/p2m.c
drivers/net/xen-netback/netback.c
drivers/net/xen-netback/common.h

This problem arrived in the p2m.c file in the xen_add_phys_to_mach_entry
function
This function adds a new mapping XEN page pfn to the DomU gfn.
It does via red/black tree
Xen netback adapter structure placed in the common.h file. It contains
xenvif_queue structure.
There are some involved members from this structure.

struct xenvif_queue {
...
struct page *mmap_pages[MAX_PENDING_REQS];
pending_ring_idx_t pending_cons;
...
u16 pending_ring[MAX_PENDING_REQS];
...
struct page *pages_to_map[MAX_PENDING_REQS];
...
}

All the pages are stored in the xenvif_queue->mmap_pages
They are allocated by their indexes. Those ones are stored
sequentially in the xenvif_queue->pending_ring.
Pages allocation depends on xenvif_queue->pending_cons.
This value rounded up to MAX_PENDING_REQS value.
Pages allocated for the request cyclically.
When an intensive network traffic is in progress especially
when a packets flow density has been growing, sooner or later
we will run into the case when we do not have enough free pages.
MAX_PENDING_REQS in our case is 256
This case arrives in the netback.c xenvif_tx_action->gnttab_map_refs call.
Main work is in the xenvif_tx_build_gops.
xenvif_tx_action is issued in NAPI context.
So we could say it is something like the interrupt bottom half.
This message is produced when the issued pfn is presented in the red/black
tree.
It is produced unconditionally. In  the above mentioned condition this
output
degrades the performance drastically.
I may offer a patch which decreases the amount of messages.

Regards,
Oleg

--00000000000072c5a405e7750c05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello guys,<br></div><div><br></div>The same issue mi=
gh be found by link<br><a href=3D"https://xen.markmail.org/message/3w4oqeu5=
z7ryfbsb?q=3Dxen_add_phys_to_mach_entry&amp;page=3D1">https://xen.markmail.=
org/message/3w4oqeu5z7ryfbsb?q=3Dxen_add_phys_to_mach_entry&amp;page=3D1</a=
><br><br>DOM0/DOMU kernels version	5.15.19<br><br>Two XENified guests. They=
 are equal. They both have the same configuration. It is enough to have one=
 DomU and Dom0.<br><br>Part of DomU configuration.<br>type =3D &quot;pvh&qu=
ot;<br>memory =3D 1024<br>vcpus =3D 1<br><br>It is not necessary to repeat =
full custom board configuration with all the bridges.<br>It is enough to co=
nnect DomU with some external machine or with Dom0 through the network.<br>=
<br>You should have a perf3 compiled package on both ends.<br>on Dom0 or ex=
ternal host you issue command:<br>perf3 -s &amp;<br><br>on DomU you issue t=
he command:<br>perf3 -c [Dom0 or external host ip address] -k 400K -b 0<br>=
<br>After enough short time you will see in your DomU kernel messages or in=
 your xen console something like<br>[ 2385.999011] xen_add_phys_to_mach_ent=
ry: cannot add pfn=3D0x000000000003e0de -&gt; mfn=3D0x00000000008031f2: pfn=
=3D0x000000000003e0de -&gt; mfn=3D0x00000000008044a0 already exists<br>[ 23=
55.968172] xen_add_phys_to_mach_entry: cannot add pfn=3D0x000000000003bfca =
-&gt; mfn=3D0x000000000080319c: pfn=3D0x000000000003bfca -&gt; mfn=3D0x0000=
000000803276 already exists<br>[ 2323.002652] xen_add_phys_to_mach_entry: c=
annot add pfn=3D0x000000000003b80e -&gt; mfn=3D0x000000000080447d: pfn=3D0x=
000000000003b80e -&gt; mfn=3D0x00000000008032a7 already exists<br>[ 2302.03=
6336] xen_add_phys_to_mach_entry: cannot add pfn=3D0x000000000003e0de -&gt;=
 mfn=3D0x0000000000803105: pfn=3D0x000000000003e0de -&gt; mfn=3D0x000000000=
08044a0 already exists<br>[ 2273.758169] xen_add_phys_to_mach_entry: cannot=
 add pfn=3D0x000000000003b80e -&gt; mfn=3D0x00000000008033fc: pfn=3D0x00000=
0000003b80e -&gt; mfn=3D0x00000000008032a7 already exists<br>[ 2252.254857]=
 xen_add_phys_to_mach_entry: cannot add pfn=3D0x000000000003b80e -&gt; mfn=
=3D0x00000000008032f0: pfn=3D0x000000000003b80e -&gt; mfn=3D0x0000000000803=
2a7 already exists<br><br>You will have a lot of those messages.<br><br>Inv=
olved files<br>arch/arm/xen/p2m.c<br>drivers/net/xen-netback/netback.c<br>d=
rivers/net/xen-netback/common.h<br><br>This problem arrived in the p2m.c fi=
le in the xen_add_phys_to_mach_entry function<br>This function adds a new m=
apping XEN page pfn to the DomU gfn.<br>It does via red/black tree<br>Xen n=
etback adapter structure placed in the common.h file. It contains xenvif_qu=
eue structure.<br>There are some involved members from this structure.<br><=
br>struct xenvif_queue {<br>	...<br>	struct page *mmap_pages[MAX_PENDING_RE=
QS];<br>	pending_ring_idx_t pending_cons;<br>	...<br>	u16 pending_ring[MAX_=
PENDING_REQS];<br>	...<br>	struct page *pages_to_map[MAX_PENDING_REQS];<br>=
	...<br>}<br><div><br></div><div>All the pages are stored in the xenvif_que=
ue-&gt;mmap_pages</div>They are allocated by their indexes. Those ones are =
stored<br>sequentially in the xenvif_queue-&gt;pending_ring.<br>Pages alloc=
ation depends on xenvif_queue-&gt;pending_cons.<br>This value rounded up to=
 MAX_PENDING_REQS value.<br>Pages allocated for the request cyclically.<br>=
When an intensive network traffic is in progress especially<br>when a packe=
ts flow density has been growing, sooner or later<br>we will run into the c=
ase when we do not have enough free pages.<br>MAX_PENDING_REQS in our case =
is 256<br>This case arrives in the netback.c xenvif_tx_action-&gt;gnttab_ma=
p_refs call.<br>Main work is in the xenvif_tx_build_gops.<br>xenvif_tx_acti=
on is issued in NAPI context.<br>So we could say it is something like the i=
nterrupt bottom half.<br>This message is produced when the issued pfn is pr=
esented in the red/black tree.<br>It is produced unconditionally. In =C2=A0=
the above mentioned condition this output<br>degrades the performance drast=
ically.<br>I may offer a patch which decreases the amount of messages.<br><=
br><div>Regards,</div><div>Oleg<br></div></div>

--00000000000072c5a405e7750c05--


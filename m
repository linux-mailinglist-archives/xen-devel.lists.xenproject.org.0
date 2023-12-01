Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3A580141F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:13:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645717.1007989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99tO-0006dI-6K; Fri, 01 Dec 2023 20:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645717.1007989; Fri, 01 Dec 2023 20:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99tO-0006am-2x; Fri, 01 Dec 2023 20:13:42 +0000
Received: by outflank-mailman (input) for mailman id 645717;
 Fri, 01 Dec 2023 20:13:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cfBb=HM=proton.me=renewin@srs-se1.protection.inumbo.net>)
 id 1r99tM-0006Ze-U0
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:13:41 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d5fd425-9086-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 21:13:39 +0100 (CET)
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
X-Inumbo-ID: 1d5fd425-9086-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1701461617; x=1701720817;
	bh=wxipLpn4DcncRcYud0TNKvU0FfhJVWPopR3Y2aJ3Sro=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=N6GP6ctTIcCnOvm7ErXHzmQgtyq299kIBNUvtk8SMg6RVhdnnLQADY7eM5sjSYNSm
	 5vWrP+6gBN7GVwLtGQq/rfvhlO9FrzPOQq1QcxaXzmyNL8MfmcBe82f41crDvAsTaj
	 dPbI5rDDTcHZZZQrz1pJl5os5Ibwgb0KLI92zH3q8zXuGRizvdvQzOQHZodwRh0eTq
	 SYBJPGGSASPCf7Vk3i4mWNMLysDj91x62q6cFDSL98wnWhpKRR4fKlK2j3mgf8NdUT
	 nzhezV2gLHNCQp11A49I24+Eu1AcWJAWSwJmcv+g24ZiCUcY6/df0FYfiM2Dpxsn9V
	 BexSH0UxHeEaA==
Date: Fri, 01 Dec 2023 20:13:31 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: =?utf-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Subject: Moving domain from credit2 to credit cpupool crash xen
Message-ID: <dnfWU_V9cXmbF4wNEEzLue_FUJefwMiic1J0gTnWryyEIiB3hV-h3zC_CjBeBJkcQS8ZMA5ZdkTbJBK2hf_1a1oY3GJvteqG8NqEduCjCrY=@proton.me>
Feedback-ID: 45853758:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------b7c8c37d6c8c00cab76247cdb285c174ab952ff5e9c2eaa4d9ae9ac98d036df5"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------b7c8c37d6c8c00cab76247cdb285c174ab952ff5e9c2eaa4d9ae9ac98d036df5
Content-Type: multipart/mixed;boundary=---------------------85214eeef1a9fb476d4ccecfae78b72c

-----------------------85214eeef1a9fb476d4ccecfae78b72c
Content-Type: multipart/alternative;boundary=---------------------71a8de1d06e4c5373a854d57bf402ab6

-----------------------71a8de1d06e4c5373a854d57bf402ab6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

When I move a domain from pool0 with credit2 to any pool with credit(1) I =
get the following crash.


Software: Xen-4.17.3 / Qubes OS 4.2.0-RC5
Firmware: Dasharo 0.9.0 - Z790P
Hardware: 13900K
(XEN) Xen BUG at common/sched/credit.c:1051(XEN) ----[ Xen-4.17.3-pre =C2=A0=
x86_64 =C2=A0debug=3Dy =C2=A0Not tainted ]----
(XEN) CPU: =C2=A0 =C2=A02
(XEN) RIP: =C2=A0 =C2=A0e008:[<ffff82d040237cfd>] credit.c#csched_free_uda=
ta+0x12/0x14
(XEN) RFLAGS: 0000000000010202 =C2=A0 CONTEXT: hypervisor (d0v2)
(XEN) rax: ffff82d040237ceb =C2=A0 rbx: 0000000000000014 =C2=A0 rcx: 00000=
00000000013
(XEN) rdx: ffff831087d7ffff =C2=A0 rsi: ffff830ad80e8da0 =C2=A0 rdi: ffff8=
30ad80e8da0
(XEN) rbp: 0000000000000000 =C2=A0 rsp: ffff831087d7fc90 =C2=A0 r8: =C2=A0=
ffff830e2d6a49b0
(XEN) r9: =C2=A0ffff831087d7fbe0 =C2=A0 r10: ffff83107c481068 =C2=A0 r11: =
0000002cfd1c274a
(XEN) r12: ffff830ad80e8c80 =C2=A0 r13: ffff83107c45bee0 =C2=A0 r14: 00000=
00000000000
(XEN) r15: ffff82d0405a9288 =C2=A0 cr0: 0000000080050033 =C2=A0 cr4: 00000=
00000b526e0
(XEN) cr3: 00000009284d8000 =C2=A0 cr2: 00007fb535181240
(XEN) fsb: 00007fb534c5f380 =C2=A0 gsb: ffff8881b9d00000 =C2=A0 gss: 00000=
00000000000
(XEN) ds: 0000 =C2=A0 es: 0000 =C2=A0 fs: 0000 =C2=A0 gs: 0000 =C2=A0 ss: =
e010 =C2=A0 cs: e008
(XEN) Xen code around <ffff82d040237cfd> (credit.c#csched_free_udata+0x12/=
0x14):
(XEN) =C2=A075 06 e8 19 74 ff ff c3 <0f> 0b f3 0f 1e fa 53 48 8b 5f 18 48 =
85 db 74 2b
(XEN) Xen stack trace from rsp=3Dffff831087d7fc90:
(XEN) =C2=A0 =C2=A0ffff82d040247503 0000001300002030 ffff830ad80e8bf0 ffff=
82d0405a9288
(XEN) =C2=A0 =C2=A0ffff83107f59aa80 ffff830ad80e8c80 ffff83107c45bee0 ffff=
830ad80e8bf0
(XEN) =C2=A0 =C2=A0ffff831000af1010 ffff83107c45bee0 ffff830ad80ed000 ffff=
83107c45bee0
(XEN) =C2=A0 =C2=A00000000000000000 ffff82d04045d5d8 ffff82d0405ae680 ffff=
82d040235303
(XEN) =C2=A0 =C2=A0ffff831087d7fe20 00000000fffffffe ffff82d040236ec3 ffff=
830ad80ed000
(XEN) =C2=A0 =C2=A00000000000000000 00007fb535230010 ffff831087d7ffff 0000=
000000000000
(XEN) =C2=A0 =C2=A0ffff82d04045d5d8 ffff82d040234763 00000000c0000102 0000=
000000000000
(XEN) =C2=A0 =C2=A00000000000000000 00000000c0000102 0000000d00000000 ffff=
ffff8101ede6
(XEN) =C2=A0 =C2=A0000000000000e033 0000000000011082 ffffc90046ebba90 0000=
00000000e02b
(XEN) =C2=A0 =C2=A05a33a1a65352beef feadf9effdf1beef 122ae2fa736bbeef 4602=
3e9af174beef
(XEN) =C2=A0 =C2=A0ffff82d040227cc6 ffff831087d7fe48 0000000000000000 0000=
000000011082
(XEN) =C2=A0 =C2=A00000000000000000 ffff831087d7ffff 0000000000000000 ffff=
ffff8101ede4
(XEN) =C2=A0 =C2=A0ffff82d0403495d0 0000001500000012 0000000100000006 0000=
000d00000000
(XEN) =C2=A0 =C2=A000007ffdf93fb3fc 0000000000431042 000000000043d990 0000=
00000043d9b0
(XEN) =C2=A0 =C2=A000007fb534eb8434 00007ffdf93fb400 0000000000000013 0000=
000002361838
(XEN) =C2=A0 =C2=A004457fe81f7cf300 0000000002360870 ffffffffffffff80 0000=
000000000000
(XEN) =C2=A0 =C2=A000007ffdf93fc652 000000000043d980 ffff831087d7fef8 0000=
000000000023
(XEN) =C2=A0 =C2=A0ffff83107f544000 0000000000000000 0000000000000000 0000=
000000000000
(XEN) =C2=A0 =C2=A0ffff82d0402dd07f ffff83107f544000 0000000000000000 0000=
000000000000
(XEN) =C2=A0 =C2=A0ffff82d0402012b7 0000000000000000 ffff88811abbc100 0000=
7ffdf93fb2c0
(XEN) Xen call trace:
(XEN) =C2=A0 =C2=A0[<ffff82d040237cfd>] R credit.c#csched_free_udata+0x12/=
0x14
(XEN) =C2=A0 =C2=A0[<ffff82d040247503>] S sched_move_domain+0x5b0/0x5cc
(XEN) =C2=A0 =C2=A0[<ffff82d040235303>] S cpupool.c#cpupool_move_domain_lo=
cked+0x1d/0x3b
(XEN) =C2=A0 =C2=A0[<ffff82d040236ec3>] S cpupool_do_sysctl+0x725/0x760
(XEN) =C2=A0 =C2=A0[<ffff82d040234763>] S do_sysctl+0x827/0x1269
(XEN) =C2=A0 =C2=A0[<ffff82d040227cc6>] S timer.c#timer_lock+0x69/0x143
(XEN) =C2=A0 =C2=A0[<ffff82d0403495d0>] S x86_emulate_wrapper+0x24/0x56
(XEN) =C2=A0 =C2=A0[<ffff82d0402dd07f>] S pv_hypercall+0x3a2/0x4a9
(XEN) =C2=A0 =C2=A0[<ffff82d0402012b7>] S lstar_enter+0x137/0x140
(XEN)
(XEN) debugtrace_dump() global buffer starting
(XEN) wrap: 0
(XEN) debugtrace_dump() global buffer finished
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 2:
(XEN) Xen BUG at common/sched/credit.c:1051
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

/rene
-----------------------71a8de1d06e4c5373a854d57bf402ab6
Content-Type: multipart/related;boundary=---------------------40be745a0eb8977dafd876f237b486ff

-----------------------40be745a0eb8977dafd876f237b486ff
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZTogMTRweDsgY29sb3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjogcmdi
KDI1NSwgMjU1LCAyNTUpOyI+V2hlbiBJIG1vdmUgYSBkb21haW4gZnJvbSBwb29sMCB3aXRoIGNy
ZWRpdDIgdG8gYW55IHBvb2wgd2l0aCBjcmVkaXQoMSkgSSBnZXQgdGhlIGZvbGxvd2luZyBjcmFz
aC48YnI+PC9kaXY+PGRpdiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAy
NTUpOyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5Ok1lbmxvLCBDb25zb2xhcywgQ291cmllciBO
ZXcsIG1vbm9zcGFjZSI+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJiYWNrZ3JvdW5kLWNv
bG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6TWVubG8s
IENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9ub3NwYWNlIj5Tb2Z0d2FyZTogWGVuLTQuMTcuMyAv
IFF1YmVzIE9TIDQuMi4wLVJDNTwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJiYWNrZ3JvdW5kLWNv
bG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6TWVubG8s
IENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9ub3NwYWNlIj5GaXJtd2FyZTogRGFzaGFybyAwLjku
MCAtIFo3OTBQPC9zcGFuPjwvZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiByZ2Io
MjU1LCAyNTUsIDI1NSk7Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6TWVubG8sIENvbnNvbGFz
LCBDb3VyaWVyIE5ldywgbW9ub3NwYWNlIj5IYXJkd2FyZTogMTM5MDBLPC9zcGFuPjwvc3Bhbj48
ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jayAiIHN0eWxlPSJmb250LWZhbWls
eTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsiPjxkaXYgY2xhc3M9InByb3Rv
bm1haWxfc2lnbmF0dXJlX2Jsb2NrLXVzZXIgIj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuIHN0
eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9ub3NwYWNl
OyI+KFhFTikgWGVuIEJVRyBhdCBjb21tb24vc2NoZWQvY3JlZGl0LmM6MTA1MTwvc3Bhbj48ZGl2
PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywg
bW9ub3NwYWNlOyI+KFhFTikgLS0tLVsgWGVuLTQuMTcuMy1wcmUgJm5ic3A7eDg2XzY0ICZuYnNw
O2RlYnVnPXkgJm5ic3A7Tm90IHRhaW50ZWQgXS0tLS08L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1vbm9zcGFj
ZTsiPihYRU4pIENQVTogJm5ic3A7ICZuYnNwOzI8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHls
ZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1vbm9zcGFjZTsi
PihYRU4pIFJJUDogJm5ic3A7ICZuYnNwO2UwMDg6WyZsdDtmZmZmODJkMDQwMjM3Y2ZkJmd0O10g
Y3JlZGl0LmMjY3NjaGVkX2ZyZWVfdWRhdGErMHgxMi8weDE0PC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25v
c3BhY2U7Ij4oWEVOKSBSRkxBR1M6IDAwMDAwMDAwMDAwMTAyMDIgJm5ic3A7IENPTlRFWFQ6IGh5
cGVydmlzb3IgKGQwdjIpPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5
OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25vc3BhY2U7Ij4oWEVOKSByYXg6IGZm
ZmY4MmQwNDAyMzdjZWIgJm5ic3A7IHJieDogMDAwMDAwMDAwMDAwMDAxNCAmbmJzcDsgcmN4OiAw
MDAwMDAwMDAwMDAwMDEzPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5
OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25vc3BhY2U7Ij4oWEVOKSByZHg6IGZm
ZmY4MzEwODdkN2ZmZmYgJm5ic3A7IHJzaTogZmZmZjgzMGFkODBlOGRhMCAmbmJzcDsgcmRpOiBm
ZmZmODMwYWQ4MGU4ZGEwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5
OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25vc3BhY2U7Ij4oWEVOKSByYnA6IDAw
MDAwMDAwMDAwMDAwMDAgJm5ic3A7IHJzcDogZmZmZjgzMTA4N2Q3ZmM5MCAmbmJzcDsgcjg6ICZu
YnNwO2ZmZmY4MzBlMmQ2YTQ5YjA8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1m
YW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1vbm9zcGFjZTsiPihYRU4pIHI5
OiAmbmJzcDtmZmZmODMxMDg3ZDdmYmUwICZuYnNwOyByMTA6IGZmZmY4MzEwN2M0ODEwNjggJm5i
c3A7IHIxMTogMDAwMDAwMmNmZDFjMjc0YTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJm
b250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9ub3NwYWNlOyI+KFhF
TikgcjEyOiBmZmZmODMwYWQ4MGU4YzgwICZuYnNwOyByMTM6IGZmZmY4MzEwN2M0NWJlZTAgJm5i
c3A7IHIxNDogMDAwMDAwMDAwMDAwMDAwMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJm
b250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9ub3NwYWNlOyI+KFhF
TikgcjE1OiBmZmZmODJkMDQwNWE5Mjg4ICZuYnNwOyBjcjA6IDAwMDAwMDAwODAwNTAwMzMgJm5i
c3A7IGNyNDogMDAwMDAwMDAwMGI1MjZlMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJm
b250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9ub3NwYWNlOyI+KFhF
TikgY3IzOiAwMDAwMDAwOTI4NGQ4MDAwICZuYnNwOyBjcjI6IDAwMDA3ZmI1MzUxODEyNDA8L3Nw
YW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywg
Q291cmllciBOZXcsIG1vbm9zcGFjZTsiPihYRU4pIGZzYjogMDAwMDdmYjUzNGM1ZjM4MCAmbmJz
cDsgZ3NiOiBmZmZmODg4MWI5ZDAwMDAwICZuYnNwOyBnc3M6IDAwMDAwMDAwMDAwMDAwMDA8L3Nw
YW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywg
Q291cmllciBOZXcsIG1vbm9zcGFjZTsiPihYRU4pIGRzOiAwMDAwICZuYnNwOyBlczogMDAwMCAm
bmJzcDsgZnM6IDAwMDAgJm5ic3A7IGdzOiAwMDAwICZuYnNwOyBzczogZTAxMCAmbmJzcDsgY3M6
IGUwMDg8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBD
b25zb2xhcywgQ291cmllciBOZXcsIG1vbm9zcGFjZTsiPihYRU4pIFhlbiBjb2RlIGFyb3VuZCAm
bHQ7ZmZmZjgyZDA0MDIzN2NmZCZndDsgKGNyZWRpdC5jI2NzY2hlZF9mcmVlX3VkYXRhKzB4MTIv
MHgxNCk6PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywg
Q29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25vc3BhY2U7Ij4oWEVOKSAmbmJzcDs3NSAwNiBlOCAx
OSA3NCBmZiBmZiBjMyAmbHQ7MGYmZ3Q7IDBiIGYzIDBmIDFlIGZhIDUzIDQ4IDhiIDVmIDE4IDQ4
IDg1IGRiIDc0IDJiPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBN
ZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25vc3BhY2U7Ij4oWEVOKSBYZW4gc3RhY2sg
dHJhY2UgZnJvbSByc3A9ZmZmZjgzMTA4N2Q3ZmM5MDo8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1vbm9zcGFj
ZTsiPihYRU4pICZuYnNwOyAmbmJzcDtmZmZmODJkMDQwMjQ3NTAzIDAwMDAwMDEzMDAwMDIwMzAg
ZmZmZjgzMGFkODBlOGJmMCBmZmZmODJkMDQwNWE5Mjg4PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25vc3Bh
Y2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7ZmZmZjgzMTA3ZjU5YWE4MCBmZmZmODMwYWQ4MGU4Yzgw
IGZmZmY4MzEwN2M0NWJlZTAgZmZmZjgzMGFkODBlOGJmMDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
IHN0eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9ub3Nw
YWNlOyI+KFhFTikgJm5ic3A7ICZuYnNwO2ZmZmY4MzEwMDBhZjEwMTAgZmZmZjgzMTA3YzQ1YmVl
MCBmZmZmODMwYWQ4MGVkMDAwIGZmZmY4MzEwN2M0NWJlZTA8L3NwYW4+PC9kaXY+PGRpdj48c3Bh
biBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1vbm9z
cGFjZTsiPihYRU4pICZuYnNwOyAmbmJzcDswMDAwMDAwMDAwMDAwMDAwIGZmZmY4MmQwNDA0NWQ1
ZDggZmZmZjgyZDA0MDVhZTY4MCBmZmZmODJkMDQwMjM1MzAzPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25v
c3BhY2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7ZmZmZjgzMTA4N2Q3ZmUyMCAwMDAwMDAwMGZmZmZm
ZmZlIGZmZmY4MmQwNDAyMzZlYzMgZmZmZjgzMGFkODBlZDAwMDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9u
b3NwYWNlOyI+KFhFTikgJm5ic3A7ICZuYnNwOzAwMDAwMDAwMDAwMDAwMDAgMDAwMDdmYjUzNTIz
MDAxMCBmZmZmODMxMDg3ZDdmZmZmIDAwMDAwMDAwMDAwMDAwMDA8L3NwYW4+PC9kaXY+PGRpdj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1v
bm9zcGFjZTsiPihYRU4pICZuYnNwOyAmbmJzcDtmZmZmODJkMDQwNDVkNWQ4IGZmZmY4MmQwNDAy
MzQ3NjMgMDAwMDAwMDBjMDAwMDEwMiAwMDAwMDAwMDAwMDAwMDAwPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBt
b25vc3BhY2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7MDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMGMw
MDAwMTAyIDAwMDAwMDBkMDAwMDAwMDAgZmZmZmZmZmY4MTAxZWRlNjwvc3Bhbj48L2Rpdj48ZGl2
PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywg
bW9ub3NwYWNlOyI+KFhFTikgJm5ic3A7ICZuYnNwOzAwMDAwMDAwMDAwMGUwMzMgMDAwMDAwMDAw
MDAxMTA4MiBmZmZmYzkwMDQ2ZWJiYTkwIDAwMDAwMDAwMDAwMGUwMmI8L3NwYW4+PC9kaXY+PGRp
dj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcs
IG1vbm9zcGFjZTsiPihYRU4pICZuYnNwOyAmbmJzcDs1YTMzYTFhNjUzNTJiZWVmIGZlYWRmOWVm
ZmRmMWJlZWYgMTIyYWUyZmE3MzZiYmVlZiA0NjAyM2U5YWYxNzRiZWVmPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3
LCBtb25vc3BhY2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7ZmZmZjgyZDA0MDIyN2NjNiBmZmZmODMx
MDg3ZDdmZTQ4IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAxMTA4Mjwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5l
dywgbW9ub3NwYWNlOyI+KFhFTikgJm5ic3A7ICZuYnNwOzAwMDAwMDAwMDAwMDAwMDAgZmZmZjgz
MTA4N2Q3ZmZmZiAwMDAwMDAwMDAwMDAwMDAwIGZmZmZmZmZmODEwMWVkZTQ8L3NwYW4+PC9kaXY+
PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBO
ZXcsIG1vbm9zcGFjZTsiPihYRU4pICZuYnNwOyAmbmJzcDtmZmZmODJkMDQwMzQ5NWQwIDAwMDAw
MDE1MDAwMDAwMTIgMDAwMDAwMDEwMDAwMDAwNiAwMDAwMDAwZDAwMDAwMDAwPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIg
TmV3LCBtb25vc3BhY2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7MDAwMDdmZmRmOTNmYjNmYyAwMDAw
MDAwMDAwNDMxMDQyIDAwMDAwMDAwMDA0M2Q5OTAgMDAwMDAwMDAwMDQzZDliMDwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVy
IE5ldywgbW9ub3NwYWNlOyI+KFhFTikgJm5ic3A7ICZuYnNwOzAwMDA3ZmI1MzRlYjg0MzQgMDAw
MDdmZmRmOTNmYjQwMCAwMDAwMDAwMDAwMDAwMDEzIDAwMDAwMDAwMDIzNjE4Mzg8L3NwYW4+PC9k
aXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmll
ciBOZXcsIG1vbm9zcGFjZTsiPihYRU4pICZuYnNwOyAmbmJzcDswNDQ1N2ZlODFmN2NmMzAwIDAw
MDAwMDAwMDIzNjA4NzAgZmZmZmZmZmZmZmZmZmY4MCAwMDAwMDAwMDAwMDAwMDAwPC9zcGFuPjwv
ZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJp
ZXIgTmV3LCBtb25vc3BhY2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7MDAwMDdmZmRmOTNmYzY1MiAw
MDAwMDAwMDAwNDNkOTgwIGZmZmY4MzEwODdkN2ZlZjggMDAwMDAwMDAwMDAwMDAyMzwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3Vy
aWVyIE5ldywgbW9ub3NwYWNlOyI+KFhFTikgJm5ic3A7ICZuYnNwO2ZmZmY4MzEwN2Y1NDQwMDAg
MDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDA8L3NwYW4+
PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291
cmllciBOZXcsIG1vbm9zcGFjZTsiPihYRU4pICZuYnNwOyAmbmJzcDtmZmZmODJkMDQwMmRkMDdm
IGZmZmY4MzEwN2Y1NDQwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwPC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENv
dXJpZXIgTmV3LCBtb25vc3BhY2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7ZmZmZjgyZDA0MDIwMTJi
NyAwMDAwMDAwMDAwMDAwMDAwIGZmZmY4ODgxMWFiYmMxMDAgMDAwMDdmZmRmOTNmYjJjMDwvc3Bh
bj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBD
b3VyaWVyIE5ldywgbW9ub3NwYWNlOyI+KFhFTikgWGVuIGNhbGwgdHJhY2U6PC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIg
TmV3LCBtb25vc3BhY2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7WyZsdDtmZmZmODJkMDQwMjM3Y2Zk
Jmd0O10gUiBjcmVkaXQuYyNjc2NoZWRfZnJlZV91ZGF0YSsweDEyLzB4MTQ8L3NwYW4+PC9kaXY+
PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBO
ZXcsIG1vbm9zcGFjZTsiPihYRU4pICZuYnNwOyAmbmJzcDtbJmx0O2ZmZmY4MmQwNDAyNDc1MDMm
Z3Q7XSBTIHNjaGVkX21vdmVfZG9tYWluKzB4NWIwLzB4NWNjPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25v
c3BhY2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7WyZsdDtmZmZmODJkMDQwMjM1MzAzJmd0O10gUyBj
cHVwb29sLmMjY3B1cG9vbF9tb3ZlX2RvbWFpbl9sb2NrZWQrMHgxZC8weDNiPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIg
TmV3LCBtb25vc3BhY2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7WyZsdDtmZmZmODJkMDQwMjM2ZWMz
Jmd0O10gUyBjcHVwb29sX2RvX3N5c2N0bCsweDcyNS8weDc2MDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9u
b3NwYWNlOyI+KFhFTikgJm5ic3A7ICZuYnNwO1smbHQ7ZmZmZjgyZDA0MDIzNDc2MyZndDtdIFMg
ZG9fc3lzY3RsKzB4ODI3LzB4MTI2OTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250
LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9ub3NwYWNlOyI+KFhFTikg
Jm5ic3A7ICZuYnNwO1smbHQ7ZmZmZjgyZDA0MDIyN2NjNiZndDtdIFMgdGltZXIuYyN0aW1lcl9s
b2NrKzB4NjkvMHgxNDM8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6
IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1vbm9zcGFjZTsiPihYRU4pICZuYnNwOyAm
bmJzcDtbJmx0O2ZmZmY4MmQwNDAzNDk1ZDAmZ3Q7XSBTIHg4Nl9lbXVsYXRlX3dyYXBwZXIrMHgy
NC8weDU2PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywg
Q29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25vc3BhY2U7Ij4oWEVOKSAmbmJzcDsgJm5ic3A7WyZs
dDtmZmZmODJkMDQwMmRkMDdmJmd0O10gUyBwdl9oeXBlcmNhbGwrMHgzYTIvMHg0YTk8L3NwYW4+
PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291
cmllciBOZXcsIG1vbm9zcGFjZTsiPihYRU4pICZuYnNwOyAmbmJzcDtbJmx0O2ZmZmY4MmQwNDAy
MDEyYjcmZ3Q7XSBTIGxzdGFyX2VudGVyKzB4MTM3LzB4MTQwPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25v
c3BhY2U7Ij4oWEVOKSA8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6
IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1vbm9zcGFjZTsiPihYRU4pIGRlYnVndHJh
Y2VfZHVtcCgpIGdsb2JhbCBidWZmZXIgc3RhcnRpbmc8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1vbm9zcGFj
ZTsiPihYRU4pIHdyYXA6IDA8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1p
bHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1vbm9zcGFjZTsiPihYRU4pIGRlYnVn
dHJhY2VfZHVtcCgpIGdsb2JhbCBidWZmZXIgZmluaXNoZWQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bh
biBzdHlsZT0iZm9udC1mYW1pbHk6IE1lbmxvLCBDb25zb2xhcywgQ291cmllciBOZXcsIG1vbm9z
cGFjZTsiPihYRU4pIDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTog
TWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9ub3NwYWNlOyI+KFhFTikgKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0
eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBDb3VyaWVyIE5ldywgbW9ub3NwYWNl
OyI+KFhFTikgUGFuaWMgb24gQ1BVIDI6PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZv
bnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25vc3BhY2U7Ij4oWEVO
KSBYZW4gQlVHIGF0IGNvbW1vbi9zY2hlZC9jcmVkaXQuYzoxMDUxPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBt
b25vc3BhY2U7Ij4oWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29s
YXMsIENvdXJpZXIgTmV3LCBtb25vc3BhY2U7Ij4oWEVOKSA8L3NwYW4+PC9kaXY+PHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5OiBNZW5sbywgQ29uc29sYXMsIENvdXJpZXIgTmV3LCBtb25vc3BhY2U7
Ij4oWEVOKSBSZWJvb3QgaW4gZml2ZSBzZWNvbmRzLi4uPC9zcGFuPjxicj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogTWVubG8sIENvbnNvbGFzLCBD
b3VyaWVyIE5ldywgbW9ub3NwYWNlOyI+L3JlbmU8L3NwYW4+PGJyPjwvZGl2PjwvZGl2PgogICAg
CiAgICAgICAgICAgIDxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXByb3Rv
biBwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay1lbXB0eSI+CiAgICAgICAgCiAgICAgICAgICAg
IDwvZGl2Pgo8L2Rpdj4K
-----------------------40be745a0eb8977dafd876f237b486ff--
-----------------------71a8de1d06e4c5373a854d57bf402ab6--
-----------------------85214eeef1a9fb476d4ccecfae78b72c
Content-Type: application/pgp-keys; filename="publickey - renewin@proton.me - 0x43C32E54.asc"; name="publickey - renewin@proton.me - 0x43C32E54.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - renewin@proton.me - 0x43C32E54.asc"; name="publickey - renewin@proton.me - 0x43C32E54.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FWWxmZy9oWUpLd1lCQkFI
YVJ3OEJBUWRBOWhrZnlRblEzVlVETWZsT3FPZU1sc1o0N252eml1cmoKbXJnZTFCd040d3pOSlhK
bGJtVjNhVzVBY0hKdmRHOXVMbTFsSUR4eVpXNWxkMmx1UUhCeWIzUnZiaTV0ClpUN0Nqd1FRRmdv
QUlBVUNZbGZnL2dZTENRY0lBd0lFRlFnS0FnUVdBZ0VBQWhrQkFoc0RBaDRCQUNFSgpFQXRxSisz
WXh1S1hGaUVFUThNdVZIeDNmREZGcnZqSEMyb243ZGpHNHBkYUtBRC9WMnNlNk5lTGJ0VkkKVzVB
ck1XRHdJN21xZ0dNSDgrQ3ZCelh1RUE5Y2xrOEEvUkNLbjdzRE1HZVJzWVNENWNFRXdidVRLK01B
CkZ4T2owaEZGOS9PNHRxQUd6amdFWWxmZy9oSUtLd1lCQkFHWFZRRUZBUUVIUUlmc3ozdGNhVElk
MWp2YQpZVG12NURmdUVRVGY4V2s3RmtGVG5LNHltMjRJQXdFSUI4SjRCQmdXQ0FBSkJRSmlWK0Qr
QWhzTUFDRUoKRUF0cUorM1l4dUtYRmlFRVE4TXVWSHgzZkRGRnJ2akhDMm9uN2RqRzRwZDZpUUQr
TzVrR0w2ZjhndktJCmlpSStidS94NkFacytvNGZERmVlc052bS9TWkFRZUVBLzBxbEw1RHR2ckJD
TjY5b2xZMERlRjQ1d0R0bQpEbDlIZ2dtc09sdXRTYzRCCj1xUFNVCi0tLS0tRU5EIFBHUCBQVUJM
SUMgS0VZIEJMT0NLLS0tLS0K
-----------------------85214eeef1a9fb476d4ccecfae78b72c--

--------b7c8c37d6c8c00cab76247cdb285c174ab952ff5e9c2eaa4d9ae9ac98d036df5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmVqPk8JkAtqJ+3YxuKXFiEEQ8MuVHx3fDFFrvjHC2on7djG
4pcAAI2TAQDwNLXyqpQetVlNej+UIW0HpMIPHxdH3tZqWx3aCm2/HAD/RTGh
Es/Ag+mU0UVYQLOTXb96IRIZqLFQ1cgUf3aq7gE=
=aLlb
-----END PGP SIGNATURE-----


--------b7c8c37d6c8c00cab76247cdb285c174ab952ff5e9c2eaa4d9ae9ac98d036df5--



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43C5665662
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 09:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475116.736648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFWiC-00082I-1t; Wed, 11 Jan 2023 08:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475116.736648; Wed, 11 Jan 2023 08:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFWiB-0007zu-Uj; Wed, 11 Jan 2023 08:43:55 +0000
Received: by outflank-mailman (input) for mailman id 475116;
 Wed, 11 Jan 2023 08:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZOV=5I=yahoo.com=hack3rcon@srs-se1.protection.inumbo.net>)
 id 1pFWiB-0007zo-5E
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 08:43:55 +0000
Received: from sonic309-13.consmr.mail.bf2.yahoo.com
 (sonic309-13.consmr.mail.bf2.yahoo.com [74.6.129.123])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10683819-918c-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 09:43:50 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.bf2.yahoo.com with HTTP; Wed, 11 Jan 2023 08:43:49 +0000
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
X-Inumbo-ID: 10683819-918c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673426629; bh=VoekXF/Cd5va2LLTczOOjyYZgThCQF3kMuFP7XQ81TQ=; h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=G9z4wLQrRMYIWI5UaKX9/g/77+ubmKhYHJD4NlHQFz1SX2B3MeM7wndtbkwlp+7WH62K0Y9zfGICOYexCe/V9e6DNFiijTuzrCOI3b8nvLLjfYqId9d71kuj1SbU85KNWHXiGy9obj5KL5LGrEoTsiApHpZ94vgeQ3EyVlAc8zVmVyfRChqmHpgCtblCDRByecUql4zhnOLgmXdDxDelRFBHKlAk6TKPxUXl9mqLGpOY4x6e8T00zbp8VUcBGygT3mK5+vzeV6Dj2iu403m3zAArbi5qhVjfYJp5UGtatFLFc/3WQPgm3wHv7kYQftAxocbdfgy35ZGUCRH8U5I8sg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673426629; bh=CJ4lJtf1Bl/l8OtddRDgBx6qzxht4WP6MLLJKMmo+1Q=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Lt5Vf4ZqlEonPCn4KKe2lr4Lv7UTL8VIfJ9Y3VaAc0qDtNO8OR8NJfrHwih0H17W4l/I6+anIRh9FdPtG/zsWZNY2bx5CokF8R4IaDHJ8t9YSOgLrI0m6iA5gh3jTx5/FjPZxLR/3Com0Mb9KLANH1cLptROKplQv4WGrWDcC6IWYVnsiv+r70wEsTmL8c60kd7+GZW4Kd7LLFNNBoxB3kLPdYN5MPMG4nwn8O33qGNNKhketlh9YVyvVRPe9zKDvWNj2dh6i47EDIbPsboD3y/UyCV4rHZdh8eBa08x/A5MGJ1cOWNPS+SZ+ex06GYWr4rFxu8q1PVtX1TMKdM86Q==
X-YMail-OSG: MJRqsm4VM1luKBx.fvru._khTqXq9mlDA4F16VP_rcGUUzLETySH9suTbj5v7vt
 1d4Et18vYapNYZ9JhTQzNTwYanJ2bP3oZigByZc8LNnqF87rsYiHxYPR2HKymGfMKfTlJcK2xuOP
 jtNfd7ERajSgQIxEIha4SbU4eETTp59PBcBs3c1x_oVMRS5k.qcpREUf7IQ8K0c0Cbwz8jyAGhZl
 AyfC1gk5k6wY4Qjsr6S69Bj86kr4.IDBN0U_WkSazTnTX_d2WvsNhsylZmiJ_XNRLi4cO3uwF5BR
 cznuuRB3G0pFWEG7R0IxkVjJQT4QSrd6UIR9.0KzJmkKzx5fr7z51j7lTeuoyQdaqY1IdoewU01X
 D16WE8Tlz.gbDLk2NNAAHyhUA60c41qqEDyHNjTa6yi4NqeU9eCPT_Sr2tdy2CApHhX3ISs9Esq2
 j_xWdI5pOBGc_R3m870wIVpKgMB7m0YZs9XWJDS6N._sHjwFX_5pp72nKf82p1Wo6l0YOSrNR4Jg
 Mgtqsd0mVWfBNvORy0vJFIC68dW22KpqvNAFYQUdo0eVyq8COzeOT3sf44y.qexKYgSdi0kQXDgt
 1wciSueAmGUg8KG8Uko9gVsf_bRtayO3ic6EQ_xv1T1qiOIh71lLfN7fQHBleOo1HOQYfAc2JyH2
 qvDGsw9GT_Hi9dnv6gO6MJV_80qwM0dXaQrPlbxWj1MmLVfYRrSMhBXhp3t.YOeq3X0_dcW0k0kF
 cLlPmSHLAEPnu4i.ZeEw7UnINGPqeIwG02s7O9Qr2FT42DyfmC2j2zKR1FHePmFmcB7rOixCnf2X
 ETeuhvcXzDJ9RGCiZSiMnqbiy_OzXRluLfBbT4PfCT3Z3EujbLx.4rp.iRk_5UhmzCkJbnq44dLr
 ET2hY7SVv5PoSENyw5O.tgznUu_WXM7F2ShLxi.kurNHomWy2W7k0LIaHXu8uW_Tx1zwhaGAh370
 OJHNNAGLrJRoouZ7vMM4NGU14JBTju.jspj4BKeE0WJ.qGXjyB49mp2i_TG8HBA_6qVDwletph6j
 LBqEFRoHKo7fdQdYPgyC0vX.1o44od1h_N.SdO5vXcF7dd3w1B6uEfuX1XwyMMFkLZTvUbgdw76q
 .ZbrLjOsr.f8kPiCTNyoAm7o7ZKWjaXTKH7MBfeGSiLiSmXC51Ygu90a2Ah1oea4suaWF6o4.PA6
 EnHCZ2iCfzGls9vLf7u7zGZnzB6u2f5NzDYaiclVK6OmG_JmtxYhmub1Em1zbZw1E_9J7ekEG0K.
 jHJkRC_QoO9XRemsCAFdtpe5VQWNBCKSXBNq08B2gi.kaMBIElJm8NocBXC_0aLd42tOUSWhVyRP
 UUBuyO7ADNgtMzapYYd1FZJgMqALNidRhRMPWfBY5KVyIbTppfMh3cIFxrqpPgs4d230KsmxYI47
 vZXKEo0f.HzUKdM0oX68aavIg01Y5RfePwzTL0dSvvKpaMGvKUltVd3kJnPBB82..puDS22NjfQh
 MshCmUWIuGcyk.8SybsP37nViBjrzTMuTH6.VOaHBTiFTJguh8FIcKmvlXSF1rP8O42vYOIbPxMJ
 oBSwnV1vVUQAozHhQZWrd5JRopou9g4fHi8wF9384BNEHX.OE5kQ.Ey2yBO8gEz6YGltLIda5ewp
 wpmV5ghTdt7iTVuDyM67V34d16s31wC0cpy6AJMr4._UsRO9N11DutXm1iIKm01CXqNZ4l4eV7YT
 wqcjDXXafDogA3iwaVX2_aMq29z1ZY5rVH3J7yOLplfQa_vjK3zvADeRcnIBpu.uRzJ2lPMH0lYT
 .Q08hRTn4OHYOdC_DVDVqIcHYoYL4fpcz9Ze67nxYxeb0GKho9wtJ7YxkVKoWZ6Lcn9Tpr1Alne6
 ekm5K6cQfZTsJ9pb_6zdwDikhVO6YIaIJL8FR8chw1Y4yaJxcqiJHHk6xCVViGDUPyDPfsgmqqlv
 Ot_AFzN83EyGo9MU9WJktgBWxB1YJSt3TmlyGO7UHthErFMVFCYRgrtrOJ.ud.7mS1wdF.8XoLIg
 nz2z8t3dbwZlJt0O_Gb2CbwsS5pZcKmwXZPhox1mZG_qdf2bcihxhK6944omvzbvp08QaVXW38b9
 .NPX67fgjYei_Id93etsKXWhdJs0jDD0MPcwbljBp6MmJSE.RSHTD872babfDUQwdcseCx5IRo4w
 YFsQr.miaW9Hz2dCaQMb2Ibc0vX9XwdNFe0lGMZmjdCD7OFceknlI62Frv6kp7Q_k.lRi2tjp370
 VEfJwHww0b2bJHHQ_ZMPFC6y8CJA-
X-Sonic-MF: <hack3rcon@yahoo.com>
Date: Wed, 11 Jan 2023 08:43:48 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <437182837.4659385.1673426628212@mail.yahoo.com>
In-Reply-To: <741943497.1243882.1671532529734@mail.yahoo.com>
References: <741943497.1243882.1671532529734.ref@mail.yahoo.com> <741943497.1243882.1671532529734@mail.yahoo.com>
Subject: Re: No package 'pixman-1' found
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.20982 YMailNorrin

Hello,
I installed the=C2=A0pixman package, but Xen can't find it.




On Tuesday, December 20, 2022 at 02:05:48 PM GMT+3:30, Jason Long <hack3rco=
n@yahoo.com> wrote:=20





Hello,
How to solve the pixman error:


$ sudo ./configure
checking build system type... x86_64-pc-solaris2.11
checking host system type... x86_64-pc-solaris2.11
Will build the following subsystems:
=C2=A0=C2=A0xen
=C2=A0=C2=A0tools
=C2=A0=C2=A0stubdom
=C2=A0=C2=A0docs
configure: creating ./config.status
config.status: creating config/Toplevel.mk
config.status: creating config/Paths.mk
=3D=3D=3D configuring in tools (/home/Hypervisor/xen-4.16.2/tools)
configure: running /bin/sh ./configure --disable-option-checking '--prefix=
=3D/usr/local'=C2=A0=C2=A0--cache-file=3D/dev/null --srcdir=3D.
checking build system type... x86_64-pc-solaris2.11
checking host system type... x86_64-pc-solaris2.11
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking for gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to accept ISO C89... (cached) none needed
checking whether make sets $(MAKE)... yes
checking for a BSD-compatible install... /usr/bin/install -c
checking for flex... /usr/bin/flex
checking for abi-dumper... no
checking for perl... /usr/bin/perl
checking for awk... /usr/bin/awk
checking for ocamlc... no
checking for ocaml... no
checking for ocamldep... no
checking for ocamlmktop... no
checking for ocamlmklib... no
checking for ocamldoc... no
checking for ocamlbuild... no
checking for ocamlfind... no
checking for gawk... /usr/bin/awk
checking for go... no
checking for checkpolicy... no
checking for bash... /usr/bin/bash
checking for python3... python3
checking for python3... /usr/bin/python3
checking for python3... /usr/bin/python3
checking for python version >=3D 2.6 ... yes
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... /usr/bin/ggrep
checking for egrep... /usr/bin/ggrep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for python3-config... /usr/bin/python3-config
checking Python.h usability... yes
checking Python.h presence... yes
checking for Python.h... yes
checking for PyArg_ParseTuple... yes
checking whether Python setup.py brokenly enables -D_FORTIFY_SOURCE... no
checking for iasl... /usr/sbin/iasl
checking uuid/uuid.h usability... yes
checking uuid/uuid.h presence... yes
checking for uuid/uuid.h... yes
checking for uuid_clear in -luuid... yes
checking uuid.h usability... no
checking uuid.h presence... no
checking for uuid.h... no
checking curses.h usability... yes
checking curses.h presence... yes
checking for curses.h... yes
checking for clear in -lcurses... yes
checking ncurses.h usability... no
checking ncurses.h presence... no
checking for ncurses.h... no
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for glib... yes
checking for pixman... no
configure: error: Package requirements (pixman-1 >=3D 0.21.8) were not met:

No package 'pixman-1' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables pixman_CFLAGS
and pixman_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
configure: error: ./configure failed for tools



Thank you.



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEFF651EE6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 11:35:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466955.725936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZyE-0001Au-2M; Tue, 20 Dec 2022 10:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466955.725936; Tue, 20 Dec 2022 10:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7ZyD-00018R-Un; Tue, 20 Dec 2022 10:35:37 +0000
Received: by outflank-mailman (input) for mailman id 466955;
 Tue, 20 Dec 2022 10:35:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QgRy=4S=yahoo.com=hack3rcon@srs-se1.protection.inumbo.net>)
 id 1p7ZyD-00018J-9y
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 10:35:37 +0000
Received: from sonic304-56.consmr.mail.bf2.yahoo.com
 (sonic304-56.consmr.mail.bf2.yahoo.com [74.6.128.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0962d581-8052-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 11:35:36 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.bf2.yahoo.com with HTTP; Tue, 20 Dec 2022 10:35:34 +0000
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
X-Inumbo-ID: 0962d581-8052-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1671532534; bh=4YehdZ8mV7sp4p3Kh6hUvhlIz16IRXtZcETfRClCZow=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=KRYBU5waEFJGQYkqX2YPul4jLlI1fGZCzo9ArUa9+xzz7CvTH7AjZzxlTAJNIL2VTx7g5JqBUlu0yYJFsMGQLuOqXJvKCQlNJ49IpLuzzTCMOs97QzjMqy5ZZLnC9zfFBwOqC+tfsB23o72o97Vs12ufAUyPIjs4Y4z881KjgtCs7wNz2Wk6C6gk3GL3RlzgDhhZOZlcXA/tfUntDAZIxCjkJH5X7rC5Hvn5OKtdByG3ramIZbSZiShXz71jVUE6ziOnedO97KpQjfLsgY0x+OhTtB5+Q5p3js8QJuTEsfDZj+rlqfWv3jSykYv6QWdn3+U4zXsL+AOK+IXjV7Xxkw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1671532534; bh=uoN7YBXRnZqvP4lC3HnM5cobur4d+Pq+Y0nEH+UNasK=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=bG1xiqsE9jXeSbSp5smARi9hZb6UVoazrkvsgbYd88E0S11uM4E7zEd03r/j5xlxEdEXhADV3RHU+4BmsQGhu8O9Wx28+2yGxjr5nWOg4DtS79FCaBlAl7Adn9sFYOj/xxXg2OBPovTMHvZAUNX/5CZ4DwOKaSRT4olYGoTxC37jMeriDAxHyMIwdKko4zD0IZTEFuXXIv6UcsPV6+jv8S2j31V58rNHkQ8ExURzU0TVmsjLnMvL8nraHXZWqS2IVj6/dZG9TZEXd4ziC19rktJhpxfUO6YzHl/ycSqIAJ3LwBIK8vgv5i/Cf07UDizJhirWLrpXJC+V2FockwvD3Q==
X-YMail-OSG: fvQjB.oVM1le2pJme8Kxa.PeoL28gEFBhsTMCiUWIjwpdXx2CaFK7bFsIqJGj9b
 UvQdj2pGzHb60SSmGVKeXAfb4LM5o_PxYjwjf7NsuA9N3FHLg7IeDHTe6OUG9cugXc5wcm1HPsGk
 wtkXuwpdCuaVImI94D61CqhpQs6gjshA858DIMD4c1fu0O_Fxx7C0fV.LBNPxNw2QaKjIPqvzGfk
 RyhLMuAUsJhu0szseLyKSgNimf_7MJOhG01zew8_MfIfEmYuorHsaEiuos__oGw06q.ZKHMnppFN
 1HwcLOIyo.ppiqiGzDcRXr38VnYZ77f7By0B8M_NIlTOKviXpb5s.8sjNKFvZqMdUddQpAX.7c2p
 iNGNBgizpRDtDbAiDlQRk0gQdQ8RZ1uN_4PX3xOTvlSkX5PsHjypiAHKQ_0ZdwqJt.WSIpKGajmu
 pVP.yd7qU71hSseqzlR03.KTACxqI6s0D0gXZZcp5khKsjy2bM30VCpqxcKgwhr_rKt6QnS8wtAB
 1Dd2LQK5yzb.SYfuachyQybLWdSDE5_GRCXEc.6dEHbvflnJMNnvwr4uqW3w2SnZjATfTsjdkA3A
 8JmabzBX0Le_v2MFKe5Usde1Eh92az4KjqkZ4xb5gHsH55ypCBrqq5YJyTKBvC1DT3kBg1SSuwFQ
 2F_Llkh3nnQXUWqBE2Ux7IlXitXGkU7tRJkGGDfzVYwbTdyZC1pqzrZBpB0aKvI47CW2GBxIvWdX
 Txj94m94bGeEPT8_QVEunmJdeaV9HCiXgwMyFlTw5vtF9U3y3aznM7JSXbwEAOUPt7On2.b1I1El
 q35.Y_jmCPBoDy2y8W1.hx5LtE938X9ukan8v_crWNmzDpURMbIXQSPFN3idYiIXxQvBVL_oiwwJ
 lc5MD_mhM5n7T_KMIiIATe.u6jXK8NyXOSxfvDU3w_vrAA1KpYgA_2TZs3QW4.zSsqFqZy2luaQg
 3LlXqxIeHAIJcRoDdYRlP_FXeQGiWel1YKcnXnCTtyByNVoYCxXgokgDCN5CuYVJpVz1CL04URyw
 .v.229wL4QmBh1LxsuURvbX6ZsBdfg.OB3PV0cSgCNTHFWPJNI4z.SVA.2jB51dUfGe1cigPsVfM
 pPzdgC2MEnBA9xLXGAmzYbGxOO7ki0kDGuosvM1t6PvFGxhlVKvQJnoApfGhZomNQhEqS2Eck_nv
 xESzCIr4T0sQdWDivl7TvdrBMNHIe1nRKTAV_PQsxaq_8TryO3Djt.2.lMaMoY3amF2kZLJSvRY2
 J4CXl5Viu1xSvgofRLIub5Ddlc814yJpVxTGw3FlxrmHTryNq2z0kE8xLQdS1mgHwKZ0KtfAvwfA
 1AkVMVcmaQQCU3mBiicyMW7PAsrjaKBvOxUxw83acZb7B.ZzecacCOjeSmMkML.L0L1jJJ260JOR
 vEghqop2cWFfcfjK.Y8EJWqw_ZbC3RgwT.TjKhTLO951uJc.oexWnB3JveKI4EHmGEcXhAGdGnvF
 xG4IoLkHtwXAC5LishKiVR_7T.iciABi_iGLDhPaa2sg_ZcAWEcGdRNItUJekUrVmMPpCJRPRT3o
 FX3Vyt34qUFrocgn9iRri9l7a1nBlr1HpfWEFd2fJ6yOqcUnZdhLpB4W5rixowYJXl9PM43zYbQN
 0vHxVGtaO7Z5wi3lIcOkfqxhM5iqg0QUC0vVDqVkfaNuyV7X7aryHWK6D.CdPaLCqfOmS84RcHSe
 9IJJ8YDhCrVd.S_KFFkA9Y9mgczZwLWQXu13n_s9Ed83zoenfDNhbslpney1QqAiOvjM80E3dokN
 mxKTacFhV21NboxGiXHgmGi0uHXMlIriv9DqDfOzBILG1ACtQ5qEGu8qx9aHnFrFnI5kbOhP.Pma
 JBMT4GJUIh0i1hD0JSuKjQrxefj.XHLUFr0hb6rqiZAfevfmx.1ivtuF883TawW6sig1bCAOMudh
 f4AsNDT9DusRqhZ_0y6tlw70ZHaCb5zvJ12CE68FHPCEwO482kMd9A6dyDJmR4DtgLBljJw4TEmp
 JL7x20I_J_p0aR81WhumymS9j5.5.ADydoKu5nb6OIZncDFOautQVGSahx3veB_Yr5J6atcdGPND
 VMlHO_kF23XAksiVp8._wP_W_F29hCg6QgEklYyiq0fwBC2OcM3eZwbIFso1XHxXExi2wYenCvsA
 I0X_kXg2G_WokjUib8PLkX.WMXMpVds2HWEaGzqb9hCuNMhtam78mh0DSujtYryKHzmoSe3W.SBm
 63HSaiVdawXM_AVGRiBeYUw--
X-Sonic-MF: <hack3rcon@yahoo.com>
Date: Tue, 20 Dec 2022 10:35:29 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <741943497.1243882.1671532529734@mail.yahoo.com>
Subject: No package 'pixman-1' found
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <741943497.1243882.1671532529734.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20982 YMailNorrin

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


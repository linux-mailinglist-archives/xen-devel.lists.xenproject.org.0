Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33809A9AEAC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 15:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966302.1356559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7wP5-0007wC-2N; Thu, 24 Apr 2025 13:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966302.1356559; Thu, 24 Apr 2025 13:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7wP4-0007uW-Vg; Thu, 24 Apr 2025 13:14:10 +0000
Received: by outflank-mailman (input) for mailman id 966302;
 Thu, 24 Apr 2025 13:14:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YKuC=XK=tum.de=f.specht@srs-se1.protection.inumbo.net>)
 id 1u7wP3-0007uQ-HL
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 13:14:09 +0000
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [129.187.255.137])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00b0724d-210e-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 15:14:07 +0200 (CEST)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
 by postout1.mail.lrz.de (Postfix) with ESMTP id 4ZjxJG6VsfzyZg;
 Thu, 24 Apr 2025 15:14:06 +0200 (CEST)
Received: from postout1.mail.lrz.de ([127.0.0.1])
 by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id HlZ1plk49MFf; Thu, 24 Apr 2025 15:14:06 +0200 (CEST)
Received: from localhost (unknown [IPv6:2001:4ca0:0:f297:754:306c:a470:cbec])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (Client did not present a certificate)
 by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4ZjxJG1hH8zyZp;
 Thu, 24 Apr 2025 15:14:06 +0200 (CEST)
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
X-Inumbo-ID: 00b0724d-210e-11f0-9eb2-5ba50f476ded
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tum.de; h=
	in-reply-to:content-transfer-encoding:content-disposition
	:content-type:content-type:mime-version:references:message-id
	:subject:subject:from:from:date:date:received:received; s=
	tu-postout21; t=1745500446; bh=NYmCpO7c5e4FUCtGBLASRh5aVXe1xTdNm
	7J7Qh3h864=; b=h0SeKLukXASfnISwKyIgsykdlUHo/T4SLih3L3BiiV+Dq1+ij
	LfYRKPxJDhYadRnYDNsPHYslC8eGEe8+uRLbIyenLunR/NE0OXF1B1R6gwhJHQtU
	xL1zm7UsvV4ckeOIe+ls8rXFTFMwvSs5G0id3OdoC9BeaQDi5vzFVRqbHmSfed9W
	R/LXE9ZkpCKebepM9mBYJon6n2zo9RKxQE/xXfzlEm+BHj8b1Hd3jjL0zC7XMEUK
	S10yzmx777z8/wSTHxWuXJgvRsfQJM8WY1F0M/s7S6shlhXnPfrbRuensF+sETAW
	wvD+x7MyCi8aGu3gLPGhslgAOOYbTeirE8oTw==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.872
X-Spam-Level:
X-Spam-Status: No, score=-2.872 tagged_above=-999 required=5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
 DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
 LRZ_CT_PLAIN_ISO8859_1=0.001, LRZ_DMARC_FAIL=0.001,
 LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
 LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
 LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
 LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001, LRZ_FROM_HAS_A=0.001,
 LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
 LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
 LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
 LRZ_HAS_CT=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_MIME_VERSION=0.001,
 LRZ_HAS_SPF=0.001, LRZ_MSGID_LONG_50=0.001, LRZ_MSGID_NO_FQDN=0.001,
 LRZ_NO_UA_HEADER=0.001, LRZ_SUBJ_FW_RE=0.001] autolearn=no autolearn_force=no
Date: Thu, 24 Apr 2025 15:13:58 +0200
From: Fabian Specht <f.specht@tum.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>, 
	xen-devel@lists.xenproject.org
Cc: manuel.andreas@tum.de
Subject: Re: UBSan bug in real mode fpu emulation
Message-ID: <lfakyg5jqdnbm6kleldta52xm6pzdy2fikr6ydxw5rs4wplefv@ymabtpq6fdvq>
References: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
 <7e3b941d-ec4e-4158-8844-a3cf236c8d4d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e3b941d-ec4e-4158-8844-a3cf236c8d4d@citrix.com>

> > if ( !s->rex_prefix )
> > {
> > 	/* Convert 32-bit real/vm86 to 32-bit prot format. */
> > 	unsigned int fip = fpstate.env.mode.real.fip_lo +
> > 					   (fpstate.env.mode.real.fip_hi << 16);
> > 	unsigned int fdp = fpstate.env.mode.real.fdp_lo +
> > 					   (fpstate.env.mode.real.fdp_hi << 16);
> > 	unsigned int fop = fpstate.env.mode.real.fop;
> >
> > 	fpstate.env.mode.prot.fip = fip & 0xf;
> > 	fpstate.env.mode.prot.fcs = fip >> 4;
> > 	fpstate.env.mode.prot.fop = fop;
> > 	fpstate.env.mode.prot.fdp = fdp & 0xf;
> > 	fpstate.env.mode.prot.fds = fdp >> 4;
> > }

> Several things.  First, please always the UBSAN analysis from the crash.

(XEN) UBSAN: Undefined behaviour in arch/x86/x86_emulate/blk.c:87:66
(XEN) left shift of 65535 by 16 places cannot be represented in type 'int'
(XEN) ----[ Xen-4.20.0  x86_64  debug=y ubsan=y  Tainted:     H  ]----
(XEN) CPU:    2
(XEN) RIP:    e008:[<ffff82d04031fe8d>] common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
(XEN) RFLAGS: 0000000000010092   CONTEXT: hypervisor (d1v0)
(XEN) rax: 0000000000000000   rbx: ffff830176baf6c8   rcx: 00000000000004ce
(XEN) rdx: ffff830176baffd0   rsi: 0000000000000002   rdi: ffff830176baf6c8
(XEN) rbp: ffff830176baf660   rsp: ffff830176baf650   r8:  00000000ffffffff
(XEN) r9:  0000000000000000   r10: ffff830176baf670   r11: 0000000000000000
(XEN) r12: ffff82d040877992   r13: 0000000000000010   r14: 000000000000ffff
(XEN) r15: ffff82d040877992   cr0: 0000000080050033   cr4: 00000000003506e0
(XEN) cr3: 000000010089c000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0033   gs: 0033   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d04031fe8d> (common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2):
(XEN)  89 e5 41 54 53 48 89 fb <0f> 0b 48 8d 3d 3a b6 36 00 e8 f3 95 00 00 48 85
(XEN) Xen stack trace from rsp=ffff830176baf650:
(XEN)    ffffffffffffffff ffff82d040877992 ffff830176baf6f8 ffff82d040320d8e
(XEN)    ffff82d0405603e3 ffff003533353536 ffff830176bafe10 ffff830176baf728
(XEN)    ffff82d04056076d ffff82e002017b00 0000000776003631 ffff830100882000
(XEN)    ffff830176baf770 0000000000000117 ffff830176baf778 0000000000000202
(XEN)    ffff830100bd8fd0 000000000000ffff 000000000000001c 00000000ffffffff
(XEN)    000000000000ffff ffff830176baf7b8 ffff82d04053c6a0 ffff830176bafce8
(XEN)    0000000000117fd0 0000000000000001 ffffffff76bafe08 ffffffffffffffff
(XEN)    ffffffffffffffff ffffffffffffffff ffff830176baf770 0000000100000001
(XEN)    ffff83010095b000 0000000000000001 0000000000117fd0 0000000076bafd68
(XEN)    ffff82e002017b00 0000000000117fd0 0000000300000003 0000000000000117
(XEN)    0000000000000001 000000000000001c ffff830100bd8fd0 ffff830176bafce8
(XEN)    ffff830176bafaa0 ffff830176baf808 ffff82d0404176a8 ffff830176bafba8
(XEN)    0000000000000000 0000000000117fd0 ffff830176bafce8 ffff830176bafaa0
(XEN)    ffff82d0404175e8 ffff830176bafa30 000000000000001c ffff830176baf880
(XEN)    ffff82d040545817 ffff830176bafce8 ffff830100000000 ffff82d07fffc140
(XEN)    ffff830176bafb18 ffff830176bafba8 ffff830100000080 0000000000010010
(XEN)    ffff83010000000b 0000000000000001 ffff830176bafef8 0000000000000000
(XEN)    ffff8301795d0010 0000000000000000 ffff830176bafc10 ffff82d0405e8400
(XEN)    ffff830176bafa9c ffff830176bafa24 ffff830176baf9c0 0000000000000000
(XEN)    0000000000000000 ffff830176bafc30 ffff82d0405d8d6b ffff830176baf968
(XEN) Xen call trace:
(XEN)    [<ffff82d04031fe8d>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
(XEN)    [<ffff82d040320d8e>] F __ubsan_handle_shift_out_of_bounds+0x11c/0x1d1
(XEN)    [<ffff82d04053c6a0>] F x86_emul_blk+0x3d8/0x117d
(XEN)    [<ffff82d0404176a8>] F arch/x86/hvm/emulate.c#hvmemul_blk+0xc0/0x138
(XEN)    [<ffff82d040545817>] F x86emul_fpu+0x207e/0x819b
(XEN)    [<ffff82d0405e8400>] F x86_emulate+0x1527b/0x3ecb3
(XEN)    [<ffff82d040615d2a>] F x86_emulate_wrapper+0x87/0x216
(XEN)    [<ffff82d040418c41>] F arch/x86/hvm/emulate.c#_hvm_emulate_one+0x256/0x60f
(XEN)    [<ffff82d04041900c>] F hvm_emulate_one+0x12/0x14
(XEN)    [<ffff82d04042d239>] F hvm_ud_intercept+0x1e7/0x4c1
(XEN)    [<ffff82d0403dbd90>] F svm_vmexit_handler+0x1bc1/0x2d70
(XEN)    [<ffff82d040203540>] F svm_stgi_label+0x5/0x15
(XEN) 

> There are several different ways that shifts go wrong, and I suspect
> this is a shift into a sign bit, which is notable given the unsigned
> underlying type.

Might be, but I am not entirely sure. Either way, it should be fixed
through a simple cast to unsigned int I think.

> Also, are you aware that the test isn't properly in Real Mode?  It's in
> so-called unreal mode (not actually a real mode, but a consequence of
> how the segment registers work), which is relevant to how you manage to
> re-enter the emulator for FLDENV.

Yes I am aware. But the bug should be triggered regardless of the
current mode, right?

~Fabian


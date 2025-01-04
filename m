Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875DCA01228
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865192.1276482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvGJ-0004EQ-05; Sat, 04 Jan 2025 03:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865192.1276482; Sat, 04 Jan 2025 03:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvGI-0004Cz-Sw; Sat, 04 Jan 2025 03:55:42 +0000
Received: by outflank-mailman (input) for mailman id 865192;
 Sat, 04 Jan 2025 03:55:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvGH-0004Ct-LZ
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:55:41 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c37ac730-ca4f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 04:55:40 +0100 (CET)
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
X-Inumbo-ID: c37ac730-ca4f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735962939; x=1736222139;
	bh=2NT8pp05G/zcayAYEzlqfKma0fASg5Tomhj1OaplymI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=M8Ae0MUPGqAjN7t3f4n1nGhWcL8sJftHihBzQRDf+VerKBcbtlyhSF2rBxQZocyyu
	 oNfe9CwqINzZWF6BrOL5QKmfrAX4P85XBlY/NzvoXkgkIee7p3fOiNwNpfYxOyHDy0
	 KKao8MUHBdIDXsVPXNRkgCRlc+ciWeuDjOTY2RwhuniDNe+OxrYN21O2wDguhatvai
	 LmuTh6M8+isi7/Zr8K+17NoLvudCQXZDE2Dkv+stefbiX9LtHy0eR0rVVveWnVM+AC
	 Ez4b/2vLgtyRK7m9szP2vO44xeZQUhGcAmJHFGnd1m/AjRwTSUMq+ks7i2PHxKh56U
	 j8t2+F6j577PQ==
Date: Sat, 04 Jan 2025 03:55:36 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 09/35] x86/domain: print emulation_flags
Message-ID: <cJwn8RzlboPNq5c-CSjWNhInbzNFsT2y6W8102sBz09ev7aAbiRmjubWmdus-2XbUaDEP41X2Yfk9nX0qE3i7IFxTJvPpU9u9dJc2Tl5HiE=@proton.me>
In-Reply-To: <d64d0e24-6e88-44d5-a5c8-36f4296489bf@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-9-e9aa923127eb@ford.com> <d64d0e24-6e88-44d5-a5c8-36f4296489bf@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: debc92c920df0fdcd072ca875caf3ac8303be71d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, December 10th, 2024 at 5:30 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > Print d->arch.emulation_flags on the console for better traceability wh=
ile
> > debugging in-hypervisor hardware emulators.
>
>
> Personally I disagree with such extra printing. And that would in this ca=
se

I plumbed this printout into 'q' keyhandler which looks much better place
to host this printout.

> even apply if you used dprintk() or gdprintk(). However, if others suppor=
t
> the idea, I don't mean to stand in the way. Just that ...
>
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -818,11 +818,15 @@ int arch_domain_create(struct domain *d,
> >
> > if ( !emulation_flags_ok(d, emflags) )
> > {
> > - printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
> > + printk(XENLOG_G_ERR "d%d: Xen does not allow %s %sdomain creation "
> > "with the current selection of emulators: %#x\n",
> > - d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
> > + d->domain_id,
>
>
> ... if already you touch this, please switch to %pd and also ...
>
> > + is_hvm_domain(d) ? "HVM" : "PV",
> > + is_hardware_domain(d) ? "(hardware) " : "",
> > + emflags);
> > return -EOPNOTSUPP;
> > }
> > + printk(XENLOG_G_INFO "d%d: emulation_flags %#x\n", d->domain_id, emfl=
ags);
>
>
> .. use that here.

Oh, that's nice! Thank you.
Fixed.

>
> Jan




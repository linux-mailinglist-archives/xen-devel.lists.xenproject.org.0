Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64970A011EB
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864918.1276182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtpd-0002Sq-4b; Sat, 04 Jan 2025 02:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864918.1276182; Sat, 04 Jan 2025 02:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtpd-0002Po-1f; Sat, 04 Jan 2025 02:24:05 +0000
Received: by outflank-mailman (input) for mailman id 864918;
 Sat, 04 Jan 2025 02:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTtpa-0002OU-S0
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 02:24:03 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f50cbf7d-ca42-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 03:24:00 +0100 (CET)
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
X-Inumbo-ID: f50cbf7d-ca42-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735957437; x=1736216637;
	bh=KRsMOD7cWh6r4AKjDf2Nvy/9Dgh4BquvQEdy8dgQi2s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=W6nOml9r54O5arICTMjQ/XgKWNc6Fzdm1LeHXzW+b8Py9PGMJCo0GuafRik3wkEw4
	 QeM/TVfMaMDhSytt5OIHBHnvhtSfulxKCGDjdHlvF4nlWzpXihSrpjlDEOED8NIU1y
	 DUJtn7RVgjmAZGCLMbkBT+zMThhMq48dqKP2VzRob8mqL2LOilrgu/nP6VvYAHhubm
	 8EIQXx+XEWdL/E5Rpx3hJOSi/QlquX+tRCBLZx/XqoN9g5i3ybocjnkT8n1wwbeurr
	 Tubefhxa7jOpJgbFTB+yo+g2JuCJiE5DujQEkM/BqvkpylYdfYDg23NIM/+qcqWZ6M
	 gFa3T2ZLx8dpw==
Date: Sat, 04 Jan 2025 02:23:53 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 01/35] xen: introduce resource.h
Message-ID: <AwhNFJq_zvjM-hNjnnwObYwKHMsEosrv3QRiGvw14turAtLTNHYYoJJCO8RegKITzlX0iAgzt0muh_2ndPr9uavCA6__ysmRZzAh87hEJlA=@proton.me>
In-Reply-To: <a6442bb6-ac06-47e4-a981-512314c8c8b9@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-1-e9aa923127eb@ford.com> <a6442bb6-ac06-47e4-a981-512314c8c8b9@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 06013afdbe706550e0de627ccce4cf775196f41e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 5:13 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > --- /dev/null
> > +++ b/xen/include/xen/resource.h
> > @@ -0,0 +1,40 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>
>
> GPL-2.0-only

Fixed.

>
> > +/*
> > + * System resource description.
> > + *
> > + * Reference:
> > + * include/linux/ioport.h
>
>
> I'm unsure of the usefulness of such a reference.

These definitions are taken from Linux'es
  include/linux/ioport.h

I think reference to the original code may help developers to borrow more
missing declarations in the future.

But sure, removed.

>
> > + */
> > +#if !defined(XEN__RESOURCE_H)
>
>
> Nit: #ifdef / #ifndef please whenever possible (as long as not inconsiste=
nt
> with adjacent code).

Sure.

>
> > +#define XEN__RESOURCE_H
> > +
> > +#define IORESOURCE_BITS 0x000000FFU /* Bus-specific bits /
> > +
> > +#define IORESOURCE_TYPE_BITS 0x00001F00U / Resource type /
> > +#define IORESOURCE_IO 0x00000100U / PCI/ISA I/O ports /
> > +#define IORESOURCE_MEM 0x00000200U
> > +#define IORESOURCE_REG 0x00000300U / Register offsets /
> > +#define IORESOURCE_IRQ 0x00000400U
> > +#define IORESOURCE_DMA 0x00000800U
> > +#define IORESOURCE_BUS 0x00001000U
> > +
> > +#define IORESOURCE_PREFETCH 0x00002000U / No side effects */
> > +#define IORESOURCE_READONLY 0x00004000U
> > +#define IORESOURCE_CACHEABLE 0x00008000U
> > +#define IORESOURCE_RANGELENGTH 0x00010000U
> > +#define IORESOURCE_SHADOWABLE 0x00020000U
> > +
> > +#define IORESOURCE_UNKNOWN (~0U)
> > +
> > +struct resource {
> > + paddr_t addr;
> > + paddr_t size;
> > + unsigned int type;
> > +};
> > +
> > +#define resource_size(res) (res)->size;
>
>
> The semicolon surely was wrong before and is wrong now. Plus Misra
> demands that such macro expansions be parenthesized, I think.

Fixed.

>
> > +#define foreach_resource(res) \
> > + for (; res && res->type !=3D IORESOURCE_UNKNOWN; res++)
>
>
> This one isn't being moved, but is being added. It's not used here,
> which makes it difficult to judge its correctness. Perhaps better to
> introduce this when its first needed, and then right away with the
> required parentheses around uses of the macro parameter.

I moved that hunk into the place where it is first used (the emulator
patch).

>
> > +#endif /* #if !defined(XEN__RESOURCE_H) */
>
>
> Just the guard identifier in the comment please.

Done.

>
> Jan




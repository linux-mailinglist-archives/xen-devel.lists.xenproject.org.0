Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5442937BF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 11:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9004.24210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUnj2-0006I6-3C; Tue, 20 Oct 2020 09:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9004.24210; Tue, 20 Oct 2020 09:14:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUnj1-0006Hh-WF; Tue, 20 Oct 2020 09:14:36 +0000
Received: by outflank-mailman (input) for mailman id 9004;
 Tue, 20 Oct 2020 09:14:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kUnj0-0006Hc-Rt
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:14:34 +0000
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 648354df-1dee-4118-8ffb-f5f869deb208;
 Tue, 20 Oct 2020 09:14:34 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id 33so1039262edq.13
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 02:14:33 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id b8sm1651263edv.20.2020.10.20.02.14.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 02:14:32 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dZuW=D3=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kUnj0-0006Hc-Rt
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 09:14:34 +0000
X-Inumbo-ID: 648354df-1dee-4118-8ffb-f5f869deb208
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 648354df-1dee-4118-8ffb-f5f869deb208;
	Tue, 20 Oct 2020 09:14:34 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id 33so1039262edq.13
        for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2020 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=W4N5mWRts6PavQ4l3YyiTpohks7cMtr9uYUq5R+2IFQ=;
        b=t+YpzKmAb0+LVML1n5jCCspqoOHFiuwJJRQoLYdqTUY7QMYdn+6rIVX1Pbae2dRcFF
         LciwftYB3g1G/EF0yIWXiEvq8qPH0LajSVXOamRu9CzOjBT55SVgHbzfObSznIbhtiUy
         Zl78jywPL69+n0ZrmgFTbuT9mi9Q/dg+aoO6Yc6QsDv+V7kyTX/VBHGd1x56bxo+sB8v
         sJTBUCM26MC7F8zi6cnb5nLAdop97D1GVWwdCk0i5+a+Fa7NCNV/jUv6QihSnN6DAv8n
         r6uSi5/jk+1Qwe0gSlqOT8J2ygNIpLxsgx8M/23NfzqvFgnLF83MNV+WMQQVXYiKv298
         Ve0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=W4N5mWRts6PavQ4l3YyiTpohks7cMtr9uYUq5R+2IFQ=;
        b=OgAdbOoaja+MgLg3cfjYeiUF1zBsMsUCt433k5wS0/ymjcvQ+XIRSQiCsuEfEaeaNz
         0ITZmvX1dybgIiluHGg9DJ4dRxxPVgXn3PDyhm5x7y8nCuKzNBBBFxeWP7rUPtX5YF1Q
         xdJs5R6b3hxdkv7zFwoRQhgmE34Ft+p54CLc0K3pliyloPAaxpG35Q4bTw+Qw9kkAgSy
         CRbdNwV5NFOTW/homCZr/0ioH9wCYEy2tEl769tJmO0PlsmHbsXG7djtuH/DgEs+fYcC
         Eu0WXsFDbB1W75GzpPDJn8tSyC2dq61U8NYkmIELzQKmtIC2RtymkKq1hUz8fQoENRTd
         osQA==
X-Gm-Message-State: AOAM531UKmQEfrMC9QCe7VIIMNYWMm1hygCqgkWYauUXiNWY3Stdms99
	/xtjD15PL0yBePYaj12DiHw=
X-Google-Smtp-Source: ABdhPJxKKj56OW/luoAHEz7Pu9q7uY2e/6elN5KrRgGIxiVxtgfb9MuSWL556BmYYIcAu3OqCC1uTw==
X-Received: by 2002:a05:6402:31af:: with SMTP id dj15mr1691550edb.275.1603185273175;
        Tue, 20 Oct 2020 02:14:33 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id b8sm1651263edv.20.2020.10.20.02.14.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 02:14:32 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <1602780274-29141-5-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1602780274-29141-5-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V2 04/23] xen/ioreq: Provide alias for the handle_mmio()
Date: Tue, 20 Oct 2020 10:14:31 +0100
Message-ID: <004701d6a6c1$6c09f860$441de920$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFqp5MaNUj6MKEiN9RM6S6pfA5bVAG4T9I6qmpcqnA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Oleksandr Tyshchenko
> Sent: 15 October 2020 17:44
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Julien Grall =
<julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V2 04/23] xen/ioreq: Provide alias for the =
handle_mmio()
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> The IOREQ is a common feature now and Arm will have its own
> implementation.
>=20
> But the name of the function is pretty generic and can be confusing
> on Arm (we already have a try_handle_mmio()).
>=20
> In order not to rename the function (which is used for a varying
> set of purposes on x86) globally and get non-confusing variant on Arm
> provide an alias ioreq_complete_mmio() to be used on common and
> Arm code.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> Changes RFC -> V1:
>    - new patch
>=20
> Changes V1 -> V2:
>    - remove "handle"
>    - add Jan's A-b
> ---
>  xen/common/ioreq.c              | 2 +-
>  xen/include/asm-x86/hvm/ioreq.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index c89df7a..29ad48e 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -200,7 +200,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
>          break;
>=20
>      case HVMIO_mmio_completion:
> -        return handle_mmio();
> +        return ioreq_complete_mmio();
>=20
>      case HVMIO_pio_completion:
>          return handle_pio(vio->io_req.addr, vio->io_req.size,
> diff --git a/xen/include/asm-x86/hvm/ioreq.h =
b/xen/include/asm-x86/hvm/ioreq.h
> index a3d8faa..a147856 100644
> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -181,6 +181,8 @@ static inline bool arch_hvm_ioreq_destroy(struct =
domain *d)
>  #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
>  #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
>=20
> +#define ioreq_complete_mmio   handle_mmio
> +

A #define? Really? Can we not have a static inline?

  Paul

>  #endif /* __ASM_X86_HVM_IOREQ_H__ */
>=20
>  /*
> --
> 2.7.4
>=20




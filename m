Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6251F2054
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 21:55:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiNqr-0003NI-0W; Mon, 08 Jun 2020 19:54:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHsk=7V=gmail.com=th.huth@srs-us1.protection.inumbo.net>)
 id 1jiNqp-0003ND-93
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 19:54:31 +0000
X-Inumbo-ID: dd40cc72-a9c1-11ea-b2b2-12813bfff9fa
Received: from mail-ej1-f66.google.com (unknown [209.85.218.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd40cc72-a9c1-11ea-b2b2-12813bfff9fa;
 Mon, 08 Jun 2020 19:54:30 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id f7so19730182ejq.6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 12:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+sqv/n+dHdqVQBBv8HoeSPhIX6ntoKrWvEWJ5bo+JBY=;
 b=tbns1qQ7FlY18q+sWAGMpUedxC32xdLmTjzsHSZuB0KSjDU5VQbzSvfJQgD+G+/vom
 FjDY/hCvF8RUviUUbVQiv9z3KF8C1cHIHaHcTz4fGNbXA1ZfnY1F6ArheJLyYbbLCKEV
 AnLd5gVFle2dWlNhIDupusBTdqJA9olySiZykZwQF/Q9/MqWGKUCrXL1Pi9zhOHGXOZA
 CnN5szYEGpW2Jwz2AQPeeMvRWE8HzCbmcafDMnYAloTKprUuqivtcMMTBnkRX7S5mpI5
 P5kMIhOX87tfar6Gbq6URuOSk+jdNYsvg6HUm59ZsMb1D3PcoZ0QSrLUINMNMdpiXcy5
 EEkA==
X-Gm-Message-State: AOAM532Xh//6c417l0jtEMd9i/8wUjfT1146b9hcgcPi1SvZ5TjXMs77
 pPVRi1Gu8KMDF/hnIKKpe1o=
X-Google-Smtp-Source: ABdhPJyCrlier8KckyArgpVfsoeX+3W0TZBdF5noENbZMiCB7EHb731EzfTxbYKJrA1Y2+nQa+g7kQ==
X-Received: by 2002:a17:906:d9dc:: with SMTP id
 qk28mr14717135ejb.6.1591646068901; 
 Mon, 08 Jun 2020 12:54:28 -0700 (PDT)
Received: from thl530.multi.box (p5791d09b.dip0.t-ipconnect.de.
 [87.145.208.155])
 by smtp.gmail.com with ESMTPSA id bg21sm11672524ejb.90.2020.06.08.12.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 12:54:28 -0700 (PDT)
Date: Mon, 8 Jun 2020 21:54:21 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 22/35] hw/m68k/mcf520x: Emit warning when old code
 is used
Message-ID: <20200608215421.6322016c@thl530.multi.box>
In-Reply-To: <20200608160044.15531-23-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-23-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Am Mon,  8 Jun 2020 18:00:31 +0200
schrieb Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>:

> This code hasn't been QOM'ified yet. Warn the user.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/m68k/mcf5206.c | 5 +++++
>  hw/m68k/mcf5208.c | 3 +++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
> index a2fef04f8e..ec0d176674 100644
> --- a/hw/m68k/mcf5206.c
> +++ b/hw/m68k/mcf5206.c
> @@ -16,6 +16,7 @@
>  #include "qemu/timer.h"
>  #include "hw/ptimer.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/qdev-deprecated.h"
> =20
>  /* General purpose timer module.  */
>  typedef struct {
> @@ -144,6 +145,8 @@ static m5206_timer_state
> *m5206_timer_init(qemu_irq irq) {
>      m5206_timer_state *s;
> =20
> +    qdev_warn_deprecated_function_used();
> +
>      s =3D g_new0(m5206_timer_state, 1);
>      s->timer =3D ptimer_init(m5206_timer_trigger, s,
> PTIMER_POLICY_DEFAULT); s->irq =3D irq;
> @@ -566,6 +569,8 @@ qemu_irq *mcf5206_init(MemoryRegion *sysmem,
> uint32_t base, M68kCPU *cpu) m5206_mbar_state *s;
>      qemu_irq *pic;
> =20
> +    qdev_warn_deprecated_function_used();
> +
>      s =3D g_new0(m5206_mbar_state, 1);

Ok, it's quite obvious what you refer to here...

>      memory_region_init_io(&s->iomem, NULL, &m5206_mbar_ops, s,
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index 2ab9701ad6..72627f6833 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -26,6 +26,7 @@
>  #include "hw/sysbus.h"
>  #include "elf.h"
>  #include "exec/address-spaces.h"
> +#include "hw/qdev-deprecated.h"
> =20
>  #define SYS_FREQ 166666666
> =20
> @@ -191,6 +192,8 @@ static void mcf5208_sys_init(MemoryRegion
> *address_space, qemu_irq *pic) m5208_timer_state *s;
>      int i;
> =20
> +    qdev_warn_deprecated_function_used();
> +
>      /* SDRAMC.  */
>      memory_region_init_io(iomem, NULL, &m5208_sys_ops, NULL,
> "m5208-sys", 0x00004000); memory_region_add_subregion(address_space,
> 0xfc0a8000, iomem);

... but it is not so obvious what you refer to here. I think that new
function should maybe have a "char *what" parameter that contains the
name of the struct you refer to. Or at least add a comment in front of
the function with a short description?

 Thomas


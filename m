Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71C29C2AC7
	for <lists+xen-devel@lfdr.de>; Sat,  9 Nov 2024 07:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833080.1248359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9fB4-0001qO-1U; Sat, 09 Nov 2024 06:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833080.1248359; Sat, 09 Nov 2024 06:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9fB3-0001nP-UV; Sat, 09 Nov 2024 06:42:33 +0000
Received: by outflank-mailman (input) for mailman id 833080;
 Sat, 09 Nov 2024 06:42:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JlmF=SE=gmail.com=th.huth@srs-se1.protection.inumbo.net>)
 id 1t9fB2-0001nJ-Eg
 for xen-devel@lists.xenproject.org; Sat, 09 Nov 2024 06:42:32 +0000
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca0f4595-9e65-11ef-a0c6-8be0dac302b0;
 Sat, 09 Nov 2024 07:42:29 +0100 (CET)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5c95a962c2bso4216312a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 22:42:29 -0800 (PST)
Received: from tpx1 (ip-109-42-51-55.web.vodafone.de. [109.42.51.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0deeed0sm326761966b.139.2024.11.08.22.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 22:42:27 -0800 (PST)
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
X-Inumbo-ID: ca0f4595-9e65-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwOS44NS4yMDguNDgiLCJoZWxvIjoibWFpbC1lZDEtZjQ4Lmdvb2dsZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImNhMGY0NTk1LTllNjUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMTM0NTQ5LjIyNDc0MSwic2VuZGVyIjoidGguaHV0aEBnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731134549; x=1731739349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/H2qO36ATbxDWZ4mWVuZziP41ISPn6jJdrrP3YzKMY=;
        b=dOEw7eCUXpjdHvYai1BZFPxD4WtkyjuQJiRyqlNMohP0KWQVmWnMUtjhIU8LLUskQR
         3DQbXJHrkS1UDrGfKkQa3AtwLOfjCbrKNi9KkZvglURCu2NLQV+/IlymczFeFF+ElB4W
         wrfyiQngt4zlrysil6tm6LZ5AC48eR/WoO6Tb42tSGtHlmWGFl0/7FBfr2qLmSuuO9vP
         uU8GYFl63uTlhHxCpz7d7oXRLC1cpsDJMGv4w+SUMb9/L0oKZJ3rFceM8OUAhJWq4jUq
         aa7eSxhOo7GoT0/5Z1AoPUiAgRvVwspI+/Esl+9+H12L9uoRHZITGpPpCPpd+GDEn8j+
         aP7A==
X-Forwarded-Encrypted: i=1; AJvYcCVMJVW6MixubeprIrvejZyNrEIaOsZ9Bw7Qja/+hC5eB8vC6J0h8xUtTDaTNA72vh3wNgxrrhbgF/Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVpebxpWU8B9RJlC829AyLPfCfk7aWU4ZVz33+Myg6OSsTkJxa
	C8yHFzHMtaXxZjy8R4LOiMR3SN5AmwVHoFEGDZDQyWf+O/6SCJuX
X-Google-Smtp-Source: AGHT+IEpCDirefYJ1XvSvyjemP96RQwc9BT4xA6vRnMS9LAvfGorR3mF478Lf6M0MQqE1Secs8gIDA==
X-Received: by 2002:a17:907:60cf:b0:a9a:1253:4d81 with SMTP id a640c23a62f3a-a9eefff1ffemr431963466b.47.1731134548441;
        Fri, 08 Nov 2024 22:42:28 -0800 (PST)
Date: Sat, 9 Nov 2024 07:42:25 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Richard Henderson
 <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org, Paolo
 Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Anthony PERARD <anthony@xenproject.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jia Liu <proljc@gmail.com>, Stafford
 Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 4/5] hw/openrisc: Mark devices as big-endian
Message-ID: <20241109074225.76e0e4ad@tpx1>
In-Reply-To: <20241106184612.71897-5-philmd@linaro.org>
References: <20241106184612.71897-1-philmd@linaro.org>
	<20241106184612.71897-5-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed,  6 Nov 2024 18:46:11 +0000
schrieb Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>:

> These devices are only used by the OpenRISC target, which is
> only built as big-endian. Therefore the DEVICE_NATIVE_ENDIAN
> definition expand to DEVICE_BIG_ENDIAN (besides, the
> DEVICE_LITTLE_ENDIAN case isn't tested). Simplify directly
> using DEVICE_BIG_ENDIAN.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/openrisc/openrisc_sim.c | 2 +-
>  hw/openrisc/virt.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index 9fb63515ef..794c175bdb 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -266,7 +266,7 @@ static void openrisc_sim_serial_init(Or1ksimState *st=
ate, hwaddr base,
>      }
>      serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
>                     serial_hd(OR1KSIM_UART_COUNT - uart_idx - 1),
> -                   DEVICE_NATIVE_ENDIAN);
> +                   DEVICE_BIG_ENDIAN);
> =20
>      /* Add device tree node for serial. */
>      nodename =3D g_strdup_printf("/serial@%" HWADDR_PRIx, base);
> diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
> index 47d2c9bd3c..ede57fe391 100644
> --- a/hw/openrisc/virt.c
> +++ b/hw/openrisc/virt.c
> @@ -236,7 +236,7 @@ static void openrisc_virt_serial_init(OR1KVirtState *=
state, hwaddr base,
>      qemu_irq serial_irq =3D get_per_cpu_irq(cpus, num_cpus, irq_pin);
> =20
>      serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
> -                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +                   serial_hd(0), DEVICE_BIG_ENDIAN);
> =20
>      /* Add device tree node for serial. */
>      nodename =3D g_strdup_printf("/serial@%" HWADDR_PRIx, base);

According to https://openrisc.io/or1k.html the openrisc CPU could be
implemented as little endian, too ... so would it make sense to use
a runtime detected value here instead?

 Thomas


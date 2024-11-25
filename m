Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94919D8311
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 11:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842370.1257746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFW1Q-0003LN-0y; Mon, 25 Nov 2024 10:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842370.1257746; Mon, 25 Nov 2024 10:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFW1P-0003JN-Tj; Mon, 25 Nov 2024 10:08:47 +0000
Received: by outflank-mailman (input) for mailman id 842370;
 Mon, 25 Nov 2024 10:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Yv=SU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tFW1O-0003JH-Cr
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 10:08:46 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fc6b25e-ab15-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 11:08:42 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa549f2f9d2so149475966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 02:08:42 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b28dd72sm448858666b.21.2024.11.25.02.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 02:08:41 -0800 (PST)
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
X-Inumbo-ID: 3fc6b25e-ab15-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNmYzZiMjVlLWFiMTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTI5MzIyLjYwODE5MSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732529322; x=1733134122; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e3g2EivWzN4m0Vp+gsK7zXQUhZ+7+mXJ43tz7vBCduw=;
        b=npNRrWi+dkToBm0Dtr3Rf62CtWq5lTz2tHd9s0wHgnnthA3MTvHX4MZczSyuqGtDjb
         PjSDkna4vtDi1vgEN3gRRVyiLNbKrEoBTJrHX4TiYT+HYsv9A1DD7nvxvcjsMqJ2fErn
         VKByYIDc41EVEx3cZ8gg2BmT6jMxWuZmStEf36OF6tylAQF+mU0B7omFnXLxQiUPmAQk
         4oCNEOWmkF4EfgjVOs7Nvvck7RxP7tarr91flCdyvVFz3+861AzzE8OlhImU5VOgykMz
         CKcm1qL+vtDhGlEykAdFzOcQ3DrFNh4v6Ydl0i7qOOh/V7s66DLbIadrdsuMRI2DfjrQ
         p1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732529322; x=1733134122;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3g2EivWzN4m0Vp+gsK7zXQUhZ+7+mXJ43tz7vBCduw=;
        b=AJzVYjS0fH8Y0bG3ChoBhXg+Li4EaB48bfoKoUv6hta11OnuTc7G6UohQEALjVEJuU
         BFpxic6WxcOn7VZ4ScULFvbJwMeetPL3KoPxmTYcYQzPreige6DzwECsHma7PIlmUgkz
         RxmbaemC8OKYV0QBWReE1zJUQsYghT4I/XoNAZv7mqlrn+3l5Zu7+txpu93oAqcdg5ws
         EvoNUqNzyTPorKWw/vwM/05+5IWblog9FE5DXg2+9IAIy6rUjXAcKaBKpmMGRlZaAiEJ
         ndY2kfF2YGn3o6W/mr2CjxWjC1QEjSiBCB4OD/5RhmnR5CaXq2ww3FtAjiNDRK9+JbEF
         cPBw==
X-Forwarded-Encrypted: i=1; AJvYcCXj1lRMJUrLB1O6JT8kGtGQUriwxVkyOdOkLNX0z1kS1cPHMQ+mqZe7qW9tsfvoim4pMk+chWMcOdE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1ikZdBwYvSILXGnMQcyntkdwHjAu1NBMtAWrpuhReGFVzOyUA
	iSW+68+fP/vjeC95jl4t8aeHmBB6ORisSowcRz0ewk46rA3WWkZr
X-Gm-Gg: ASbGncvDoprW6vb7mtiGEE1acY4aTVFGYAJO0jJ4oNEaqfhz7GsojoGffZIHDT0tJ/I
	GLDpM21kQeCjcAJ2Et7zwcDfWsqzWc6rMjlaDvRT16ltpj/hVxIMJW+EKvkosRLQrTnV5O2Sha/
	99wCyW8dT60Pxrw0UkK6SMwyen/Tm+Ae7ZEjl5PxqfxbtYqsJXDs/xSC2O3eLxIgg5lpaWiCk+p
	hhNmvs4c3Bb8RGIDY+JygQa1VprVLf+9Y7phPvgFgEnAUqiN92XzSYVA/vWzqQ=
X-Google-Smtp-Source: AGHT+IEJV+fNYaqQUMulFX3hEzu0aWiCD/bsH+WGDJwjQKgbvkYMVyfbN0nAHZhmHv2BjpaTZj48Ow==
X-Received: by 2002:a17:907:780f:b0:aa5:241a:dc71 with SMTP id a640c23a62f3a-aa5241adf23mr931801466b.41.1732529321808;
        Mon, 25 Nov 2024 02:08:41 -0800 (PST)
Message-ID: <bd0adc17a2c288f0ab0a076def649b2d0d6bec4a.camel@gmail.com>
Subject: Re: [PATCH 3/3] xen: riscv: enable stack protector feature
From: oleksii.kurochko@gmail.com
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 25 Nov 2024 11:08:40 +0100
In-Reply-To: <20241122210719.2572072-4-volodymyr_babchuk@epam.com>
References: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
	 <20241122210719.2572072-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Fri, 2024-11-22 at 21:07 +0000, Volodymyr Babchuk wrote:
> Enable previously added CONFIG_STACK_PROTECTOR feature for RISC-V
> platform. Here we can call boot_stack_chk_guard_setup() in
> start_xen()
> function, because it never returns, so stack protector code will not
> be triggered because of changed canary.
>=20
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>=20
> ---
>=20
> I tested this patch for buildability, but didn't verified that Xen
> really boots on RISC-V when this feature is enabled. So I am asking
> RISC-V maintainers to provide feedback on it.
> ---
I've tested on staging and on downstream branches everything is fine:
Tested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> =C2=A0xen/arch/riscv/Kconfig | 1 +
> =C2=A0xen/arch/riscv/setup.c | 3 +++
> =C2=A02 files changed, 4 insertions(+)
>=20
> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> index 1858004676..1481f23b66 100644
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -5,6 +5,7 @@ config RISCV
> =C2=A0	select HAS_DEVICE_TREE
> =C2=A0	select HAS_PMAP
> =C2=A0	select HAS_VMAP
> +	select HAS_STACK_PROTECTOR
> =C2=A0
> =C2=A0config RISCV_64
> =C2=A0	def_bool y
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index e29bd75d7c..cd71748d2c 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -7,6 +7,7 @@
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/mm.h>
> =C2=A0#include <xen/shutdown.h>
> +#include <xen/stack_protector.h>
> =C2=A0
> =C2=A0#include <public/version.h>
> =C2=A0
> @@ -55,6 +56,8 @@ void __init noreturn start_xen(unsigned long
> bootcpu_id,
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( !boot_fdt_info(device_tree_flattened, dtb_a=
ddr) )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG();
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 boot_stack_chk_guard_setup();
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 cmdline =3D boot_fdt_cmdline(device_tree_flatten=
ed);
> =C2=A0=C2=A0=C2=A0=C2=A0 printk("Command line: %s\n", cmdline);
> =C2=A0=C2=A0=C2=A0=C2=A0 cmdline_parse(cmdline);



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9619C2AA3
	for <lists+xen-devel@lfdr.de>; Sat,  9 Nov 2024 07:29:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833057.1248328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9exc-0006bv-Dh; Sat, 09 Nov 2024 06:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833057.1248328; Sat, 09 Nov 2024 06:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9exc-0006Yp-8A; Sat, 09 Nov 2024 06:28:40 +0000
Received: by outflank-mailman (input) for mailman id 833057;
 Sat, 09 Nov 2024 06:28:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JlmF=SE=gmail.com=th.huth@srs-se1.protection.inumbo.net>)
 id 1t9exa-0006Yj-5T
 for xen-devel@lists.xenproject.org; Sat, 09 Nov 2024 06:28:38 +0000
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7e147c0-9e63-11ef-99a3-01e77a169b0f;
 Sat, 09 Nov 2024 07:28:33 +0100 (CET)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso435923566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 22:28:33 -0800 (PST)
Received: from tpx1 (ip-109-42-51-55.web.vodafone.de. [109.42.51.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2f063sm320647166b.203.2024.11.08.22.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 22:28:32 -0800 (PST)
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
X-Inumbo-ID: d7e147c0-9e63-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwOS44NS4yMTguNDUiLCJoZWxvIjoibWFpbC1lajEtZjQ1Lmdvb2dsZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImQ3ZTE0N2MwLTllNjMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMTMzNzEzLjQ0MjI4LCJzZW5kZXIiOiJ0aC5odXRoQGdtYWlsLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731133713; x=1731738513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNJVGivY9x2lfWzH3SyeTmuDvzlThAkBFU1sZtixOO0=;
        b=QY2loqGeqbb6hSHde62EV2WMXTpE/hyIn9E6sDpiJPnbihqTi/QcJU/LYGLZ/DGv71
         fc4Lv1fwglqR2ZJ4K5DZMVVhMHymX9110UoXRMRAKrUyDPME/ID80Wzp5ikWZtdKgwnB
         t6S3dgrJFuvaazKgoHMbcJ8ffMAPpMNWOgeQWKzQbCZMTefOG+YXCg+p6OUMZTxhZwdv
         LXEyuDJBBqpMRRLKQT7W8K8m8hcQM5bie6CzemZViNTN8SDyLqcK/H6Fzl3Fb/4Zec1Z
         qqMvTogIIfsuw0YJfhNFeBmGZNmRA4wJiarP5uc+HSBA6LpjFTg9PEjJMNixJHaABumQ
         BDpA==
X-Forwarded-Encrypted: i=1; AJvYcCWmocCCrvnENNfc+l5OUF7WyWSxA5jowPYuy2lKPyCvTQRDmGtFNUhVCVO2YUOsdubccc2fJ+wZQys=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJVSoIQrxrj/2AVDE9mBTfgPG6+lwdNxAOEP+B7426pSJNOsuq
	8ncRUPnhJ1gOO2AqI+f/i/DyF0k4VBtYyYeI8xDgLsI3rMouIKdg
X-Google-Smtp-Source: AGHT+IEXPsP9CoMFa89mHLDjCHOdfjCyiUp6wyrPn1p/n+U5kkK9z9pYi0Eb3KM4Dr6nz3QLxzMJgQ==
X-Received: by 2002:a17:907:3e88:b0:a9a:662f:ff4a with SMTP id a640c23a62f3a-a9eec5823a8mr587122166b.0.1731133712484;
        Fri, 08 Nov 2024 22:28:32 -0800 (PST)
Date: Sat, 9 Nov 2024 07:28:29 +0100
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
Subject: Re: [PATCH 3/5] hw/m68k: Mark devices as big-endian
Message-ID: <20241109072829.205680ca@tpx1>
In-Reply-To: <20241106184612.71897-4-philmd@linaro.org>
References: <20241106184612.71897-1-philmd@linaro.org>
	<20241106184612.71897-4-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed,  6 Nov 2024 18:46:10 +0000
schrieb Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>:

> These devices are only used by the M68K target, which is only
> built as big-endian. Therefore the DEVICE_NATIVE_ENDIAN
> definition expand to DEVICE_BIG_ENDIAN (besides, the
> DEVICE_LITTLE_ENDIAN case isn't tested). Simplify directly
> using DEVICE_BIG_ENDIAN.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/m68k/mcf5206.c  | 2 +-
>  hw/m68k/mcf5208.c  | 6 +++---
>  hw/m68k/mcf_intc.c | 2 +-
>  hw/m68k/next-kbd.c | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


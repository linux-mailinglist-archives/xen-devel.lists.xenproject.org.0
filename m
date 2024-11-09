Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999619C2AB9
	for <lists+xen-devel@lfdr.de>; Sat,  9 Nov 2024 07:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833074.1248349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9f7x-0000LO-JF; Sat, 09 Nov 2024 06:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833074.1248349; Sat, 09 Nov 2024 06:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9f7x-0000Is-G8; Sat, 09 Nov 2024 06:39:21 +0000
Received: by outflank-mailman (input) for mailman id 833074;
 Sat, 09 Nov 2024 06:39:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JlmF=SE=gmail.com=th.huth@srs-se1.protection.inumbo.net>)
 id 1t9f7v-0008EF-Vx
 for xen-devel@lists.xenproject.org; Sat, 09 Nov 2024 06:39:19 +0000
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57a92353-9e65-11ef-a0c6-8be0dac302b0;
 Sat, 09 Nov 2024 07:39:17 +0100 (CET)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d473c4bb6so2471329f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 22:39:17 -0800 (PST)
Received: from tpx1 (ip-109-42-51-55.web.vodafone.de. [109.42.51.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0deef4bsm324372866b.138.2024.11.08.22.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 22:39:14 -0800 (PST)
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
X-Inumbo-ID: 57a92353-9e65-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwOS44NS4yMjEuNDEiLCJoZWxvIjoibWFpbC13cjEtZjQxLmdvb2dsZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjU3YTkyMzUzLTllNjUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMTM0MzU3LjQxOTEwMiwic2VuZGVyIjoidGguaHV0aEBnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731134357; x=1731739157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0bCOe3u0gtgRNy9hKRvSdASo+/BgARCB/z16A9uSDU=;
        b=T3bX8NGdFPBDNLt/msUoiA1JQLKbjLcfoWvdiizwK0qK5udJffUGCxJS4hx5fqro92
         mkoM7qxyLTMZPeEXU2tqI16bgR5e/7LT/6qOO8VKeJqb2FsfFTr5vhF++uy/hhoiHFAN
         AaBOQJTuZFzZ+3zYi92aL0erL8wu1VGLJ0WazmhfIrd4Dzu1qxyJDv70X1iEPkXeh6nP
         SJFBgm1ca6L7Uw4wiVWPliZ/l0KGhDEN/pQctAe0uGZQI58PkuAwty/HupFgq981CEy7
         OadJtdpWB+x5i2zXkFqTmrFNbpBUEso/n9ptTVN0tfC5+VoC9LMa/u0I23vVeuet5LQ5
         Xt7A==
X-Forwarded-Encrypted: i=1; AJvYcCXuY7QhETef8VL2p7Io51S/ibiu8fgCKX6IXz4yRpQK8WDyRKtxD1cJ+z+8E9jZ4p4Pl+mgZx7RO80=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyToqBGXN3DX5pKDmSVeVsyk8B46VoM0JnsOSRRIlNW9mLbsIIJ
	bPxBNY04nsAhKgtsEzEodobgLq4BhkN65UyFvYyTYFeUBTGnlBNr
X-Google-Smtp-Source: AGHT+IGzVbwX9id1Pl7vidS2UUBLfPO0kJyH3hRsr2sBMlSE6+jJdE0A7qwElRUZVOCsCCSoj+zjZQ==
X-Received: by 2002:a5d:5886:0:b0:37d:5130:b380 with SMTP id ffacd0b85a97d-381f186cbbemr5239484f8f.23.1731134355294;
        Fri, 08 Nov 2024 22:39:15 -0800 (PST)
Date: Sat, 9 Nov 2024 07:39:12 +0100
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
Subject: Re: [PATCH 1/5] hw/i386: Mark devices as little-endian
Message-ID: <20241109073912.711357a8@tpx1>
In-Reply-To: <20241106184612.71897-2-philmd@linaro.org>
References: <20241106184612.71897-1-philmd@linaro.org>
	<20241106184612.71897-2-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed,  6 Nov 2024 18:46:08 +0000
schrieb Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>:

> These devices are only used by the X86 targets, which are only
> built as little-endian. Therefore the DEVICE_NATIVE_ENDIAN
> definition expand to DEVICE_LITTLE_ENDIAN (besides, the
> DEVICE_BIG_ENDIAN case isn't tested). Simplify directly using
> DEVICE_LITTLE_ENDIAN.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/i386/kvm/apic.c         | 2 +-
>  hw/i386/pc.c               | 4 ++--
>  hw/i386/vapic.c            | 2 +-
>  hw/i386/xen/xen_apic.c     | 2 +-
>  hw/i386/xen/xen_platform.c | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


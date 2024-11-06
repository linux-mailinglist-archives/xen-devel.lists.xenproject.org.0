Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8859BF58D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 19:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831300.1246514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l2r-0001eF-Pc; Wed, 06 Nov 2024 18:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831300.1246514; Wed, 06 Nov 2024 18:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8l2r-0001c3-MO; Wed, 06 Nov 2024 18:46:21 +0000
Received: by outflank-mailman (input) for mailman id 831300;
 Wed, 06 Nov 2024 18:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aqLR=SB=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1t8l2p-0001bx-KG
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 18:46:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66f5e7cb-9c6f-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 19:46:15 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9ed49ec0f1so13034966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 10:46:15 -0800 (PST)
Received: from localhost.localdomain ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16f8c5asm317692666b.90.2024.11.06.10.46.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 10:46:14 -0800 (PST)
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
X-Inumbo-ID: 66f5e7cb-9c6f-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY2ZjVlN2NiLTljNmYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTE4Nzc1LjY4Njk4LCJzZW5kZXIiOiJwaGlsbWRAbGluYXJvLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730918775; x=1731523575; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XmhWRZXxp83O2InQlFonyaildfIoabED880hXmnDZ7g=;
        b=EFA7nX9LG6bOF840RMX4qfxecakA6p//UHWwuxOU1RpDGDwyPsxAaBVatU+e/pDDzB
         mmMlk/QRkcZSzXx1jeBBoms12pth+WvzV/CoEBQ5ibujGCmVgC1G1pRYguVgMyY4XZKX
         MP8xNRutVK/K/5T91o9mfsiC+tA9yRhA5YicbTqiCA7rbAcF2l7Q2Gne8pdtADR+YTTh
         RPxXTnl60XcId3LThCs7+WlFHLGbSX/c3DugcCOYkSDLDWvsqE/H7C9G0x63YSssteVV
         RgIrVDmh0Pje7wqrCayKinNSw/zSEIlv/0rOApOtC8s/L83IxsA/1EV6zg98VpQwwy6r
         2z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918775; x=1731523575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmhWRZXxp83O2InQlFonyaildfIoabED880hXmnDZ7g=;
        b=syjnZAb/GmEZwdFmdZXlYpBoUKE+6lcJFVYlEbcO936HUapOiVIqQmlxzuYJ+Jj1A4
         w79b18be/Q43VTFJNeyZw/hE5I5g1COGjg4F4lD+J93+feY6trlQR2gYRFCyyGCg2boL
         Fgr2VL3ppRrY65kQFX85vL14cVA/UalaN74ifDEavtOTMewuvzWA9ELw2Nk3JoVAe88G
         A+hQH0X0CxWa0qUMAkgbf368uw6YWH6dW2FcIT0a53L/5LSGYkwdh/69n2W228h+A2In
         q1TSgJCNKDB71VuiJRdPblY9DgraekHDD0cOnY/F3Q6CLHNskLk1/mvAybcUBU2oR4Kk
         mm+g==
X-Forwarded-Encrypted: i=1; AJvYcCUN8qSp6ItOGSQNi08wr7y9tFjEEsUqud8tI8eLuyRFDSSlRQoVX41To97CinldG7y4HGc86SFwA4Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjNHtGra5iuxu4vHrz+ORdCc6IP2dVtGrSoIhxWfUDpmJDaZ2/
	7cK5nFNpevoiMNwJidU4NsvoeZTUdZhIA9G6PHxCMEWMMwIepeQrFUfSsgjFDEo=
X-Google-Smtp-Source: AGHT+IF3aqIXCddVzxdTkCqTIT+QsXKTqG9THVwgPVGSC1f3F5fPhTl2w+fvLxGmqJxqNY6o2pGfbg==
X-Received: by 2002:a17:906:f34a:b0:a9e:c696:8f78 with SMTP id a640c23a62f3a-a9ec6969260mr306265266b.51.1730918775010;
        Wed, 06 Nov 2024 10:46:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony PERARD <anthony@xenproject.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Jia Liu <proljc@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] hw: Mark architecture specific devices with specific endianness
Date: Wed,  6 Nov 2024 18:46:07 +0000
Message-ID: <20241106184612.71897-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

When a device is only built for an architecture built for
a particular endianness, we can simplify the device to not
use the "target native endianness" definition and directly
use the proper target endianness.

Philippe Mathieu-Daudé (5):
  hw/i386: Mark devices as little-endian
  hw/tricore: Mark devices as little-endian
  hw/m68k: Mark devices as big-endian
  hw/openrisc: Mark devices as big-endian
  hw/sparc: Mark devices as big-endian

 hw/i386/kvm/apic.c              | 2 +-
 hw/i386/pc.c                    | 4 ++--
 hw/i386/vapic.c                 | 2 +-
 hw/i386/xen/xen_apic.c          | 2 +-
 hw/i386/xen/xen_platform.c      | 2 +-
 hw/m68k/mcf5206.c               | 2 +-
 hw/m68k/mcf5208.c               | 6 +++---
 hw/m68k/mcf_intc.c              | 2 +-
 hw/m68k/next-kbd.c              | 2 +-
 hw/openrisc/openrisc_sim.c      | 2 +-
 hw/openrisc/virt.c              | 2 +-
 hw/sparc/sun4m_iommu.c          | 2 +-
 hw/sparc64/sun4u.c              | 2 +-
 hw/tricore/tricore_testdevice.c | 2 +-
 14 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.45.2



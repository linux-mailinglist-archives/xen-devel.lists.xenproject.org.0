Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JagGmFJzmlRmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:48:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7CF387E04
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271519.1559632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaD-00041j-7m; Thu, 02 Apr 2026 10:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271519.1559632; Thu, 02 Apr 2026 10:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaD-0003z7-4m; Thu, 02 Apr 2026 10:47:29 +0000
Received: by outflank-mailman (input) for mailman id 1271519;
 Thu, 02 Apr 2026 10:47:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w8FaB-0003yl-8z
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FaA-00EiuO-LB
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:47:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce493d-2eae-0a2a0a5409dd-0a2a450be30c-2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:26 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce493e-bca8-0a2a450b0019-d155da35e825-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:26 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so122347466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:47:26 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3d028955sm76392366b.61.2026.04.02.03.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 03:47:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126845; x=1775731645; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lTzPtWY93Ld+V54zoC04jqY3UY+XBvaAgSHzfOFCgx8=;
        b=H10uUo8+EILPV4xBcSUbz9SQjNiyIgaFGxL3nmX79r7W9zXR8ekud61IgxpZHP4o7b
         wJwLuUCNK7UuARE5O/0OmZSXUH1dypjiM1wYyvGzwgUhFUTtwe2ubN9PB4dYsIlga6Vc
         f3WkGMwAmqgobwGsLhIg2ts2m4lnBzosI3n/wpvkpw2BQoiaiyAYbSuPCfQpLnj0Ws08
         eGHEteHUXd4yMCG+cGDeFvQ4+1eL2NE6ynV102OgX+FHY17HXwgfnlNnv3DOCpx8zI5m
         C+a9tehmgyXQz5/ZhHQbG05iOithWDnG6rr0WxzrvTtHktcaxZWBjVo8tY3AZiRz6el8
         oy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126845; x=1775731645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTzPtWY93Ld+V54zoC04jqY3UY+XBvaAgSHzfOFCgx8=;
        b=RR//slf3g0g351eImPuQIevZdGm4RiFRjrupadltfEAj2mriwDbGM+Wb+Gllicm2Oi
         9ps04tQ4nOw+zAtVQTLvMXqdmUT2dQiAU4HXgbyxCOBW0/KdWaN+tK0UIeHU51CuelqN
         SS7PBkwov30K7SaKzj9Bb6/U5wZsnZkiqhdCJvwo2tLnKpHJq+8ZqacrUGAD0a3s1AY/
         QdOtpEJ7nVETELt8Ary7HjcUDC7jZZkwyW091/eO8GbJDR7YLzKAJ0/XlO+tgS/iULXd
         6XSXC7XfWcLmZHYF3/ZAni0g4B7HJLgWTaVp8dyjneHFkBPfXaG/JaJIUpYA/tZWEt5S
         4pCA==
X-Gm-Message-State: AOJu0YxMsbQ/KqjCQ8qDDJUSbgziTNBDbiD3GGKE4hFRRuflXc5NaQoV
	7HyKHLMIlxdKlcGxGXZFKYoz1OYZCOrih80Pu++7OiZ3C8w/5MVfUNSqlYGIwcwQ
X-Gm-Gg: ATEYQzxS78jUNqRfdshIXvfpf/sK8Q8LzM3Cmson6EFXC7hHzO9HtYGu3TdjqivOahG
	h33iALkr9lmW+WVFHVuD7WTh8G3oRO9nlS4wZ8jXeTr8MgUJnPTLJbMIIzBoOFzQdqWtq2VWyRH
	jbz5CoinSB4lY/DHfTAqWCksh8pvh4+YSvirrdoOExs1qkfvdJEVK/GPOQbvG25EnU9t5vzO2Pc
	BLpHNhizTD/fOrnTmklKlmXj17FB3N3//6vT/EApPf4gxJvA+tCS9ZrTAypVlZ3ukKOZugqhnNW
	qzQqV44Luy3LHuZKFYqK8gZR5wrQQT0LWAOTQninrzU34wSnW2OnorHeWGUzG0yhQFq790Pre5z
	jy+SORHnF4lzYMPLsofzP8StwQE/qN8+hI+aUCO+uyLDAr6bXSWhy1ppoIo4O+qBVNQD2gcXwm2
	wbqk9sPotvGyfyYZxrWxNpFhR7T4SY+/Ttc0Vc
X-Received: by 2002:a17:907:a688:b0:b98:549d:8367 with SMTP id a640c23a62f3a-b9c13902737mr477342166b.17.1775126845041;
        Thu, 02 Apr 2026 03:47:25 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v8 00/13] Add initial Xen Suspend-to-RAM support on ARM64
Date: Thu,  2 Apr 2026 13:45:01 +0300
Message-ID: <cover.1775125380.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775126846-EF9412A1-304DDA15/0/0
X-purgate-type: clean
X-purgate-size: 5285
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jens.wiklander@linaro.org,m:rahul.singh@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1D7CF387E04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

This is part 2 of version 8 of the ARM Xen system suspend/resume patch
series, based on earlier work by Mirela Simonovic and Mykyta Poturai.

The first part is in mainline.

NOTE: Most of the code is guarded by CONFIG_SYSTEM_SUSPEND, which can
currently only be selected when UNSUPPORTED is set, and thus the
functionality is neither enabled by default nor even built.

This version is ported to Xen master and includes extensive improvements
based on reviewer feedback. The patch series restructures code to improve
robustness, maintainability, and implements system Suspend-to-RAM support
on ARM64 hardware/control domains.

Key updates in this series:
 - Introduced architecture-specific suspend/resume infrastructure
 - Integrated GICv2/GICv3 suspend and resume, including memory-backed context
   save/restore with error handling
 - Added time and IRQ suspend/resume hooks, ensuring correct timer/interrupt
   state across suspend cycles
 - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
 - Improved state management and recovery in error cases during suspend/resume
 - Added support for IPMMU-VMSA/SMMUv3 context save/restore
 - Added support for GICv3 eSPI registers context save/restore
 - Added support for ITS registers context save/restore
---

TODOs:
 - Enable "xl suspend" support on ARM
 - Add suspend/resume CI test for ARM (QEMU if feasible)
 - PCI suspend ?
---

Detailed changelogs can be found in each patch.

Changes in v8:
- Rebased to latest master and refreshed the series accordingly.
- Added a new GICv3 patch to tolerate retained redistributor LPI state
  across CPU_OFF/CPU_ON.
- GICv2 suspend now disables the CPU interface and distributor before
  saving state.
- GICv3 suspend/resume fixes the redistributor base used for LPI state.
- ITS and SMMUv3 suspend/resume paths were tightened, with safer
  restore/rollback handling and stricter fatal-error handling.
- System suspend now checks that all domains are already in
  SHUTDOWN_suspend before proceeding, and renames the hardware-domain
  suspend capability/helper for clearer semantics.
- Fixed alignment/cleanup issues in the low-level suspend/resume code.

Changes in v7:
- Timer helper renamed/clarified; virtual/hyper/phys handling documented.
- GICv2 uses one context block; restore saved CTLR; panic on alloc failure.
- GICv3/eSPI/ITS always suspend/resume; restore LPI/eSPI; rdist timeout.
- IPMMU suspend context allocated before PCI setup.
- System suspend: control domain drives host suspend.
- Dropped v6 IRQ descriptor restore patches; use setup_irq and re-register
  local IRQs on resume instead.

For earlier changelogs, please refer to the previous cover letters.

Mirela Simonovic (6):
  xen/arm: Add suspend and resume timer helpers
  xen/arm: gic-v2: Implement GIC suspend/resume functions
  xen/arm: Resume memory management on Xen resume
  xen/arm: Save/restore context on suspend/resume
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
  xen/arm: Add support for system suspend triggered by hardware domain

Mykola Kvach (6):
  xen/arm: gic-v3: tolerate retained redistributor LPI state across
    CPU_OFF
  xen/arm: gic-v3: Implement GICv3 suspend/resume functions
  xen/arm: gic-v3: add ITS suspend/resume support
  xen/arm: tee: keep init_tee_secondary() for hotplug and resume
  xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
  arm/smmu-v3: add suspend/resume handlers

Oleksandr Tyshchenko (1):
  iommu/ipmmu-vmsa: Implement suspend/resume callbacks

 xen/arch/arm/Kconfig                     |   2 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/arm64/head.S                | 112 ++++++++
 xen/arch/arm/gic-v2.c                    | 132 +++++++++
 xen/arch/arm/gic-v3-its.c                | 126 +++++++-
 xen/arch/arm/gic-v3-lpi.c                |  80 +++++-
 xen/arch/arm/gic-v3.c                    | 349 ++++++++++++++++++++++-
 xen/arch/arm/gic.c                       |  29 ++
 xen/arch/arm/include/asm/gic.h           |  12 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   1 +
 xen/arch/arm/include/asm/gic_v3_its.h    |  24 ++
 xen/arch/arm/include/asm/mm.h            |   2 +
 xen/arch/arm/include/asm/psci.h          |   1 +
 xen/arch/arm/include/asm/suspend.h       |  31 ++
 xen/arch/arm/include/asm/time.h          |   5 +
 xen/arch/arm/mmu/smpboot.c               |   2 +-
 xen/arch/arm/psci.c                      |  23 +-
 xen/arch/arm/suspend.c                   | 195 +++++++++++++
 xen/arch/arm/tee/ffa_notif.c             |  63 +++-
 xen/arch/arm/tee/tee.c                   |   2 +-
 xen/arch/arm/time.c                      |  44 ++-
 xen/arch/arm/vpsci.c                     |  12 +-
 xen/common/Kconfig                       |   3 +
 xen/common/domain.c                      |   7 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 305 +++++++++++++++++++-
 xen/drivers/passthrough/arm/smmu-v3.c    | 172 ++++++++---
 xen/drivers/passthrough/arm/smmu.c       |  10 +
 xen/include/xen/list.h                   |  14 +
 28 files changed, 1670 insertions(+), 89 deletions(-)
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.43.0


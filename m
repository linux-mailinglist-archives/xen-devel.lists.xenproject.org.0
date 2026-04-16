Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDbpAZPb4Gk/mwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:52:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B5040E652
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 14:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283395.1565643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMCo-0004gh-Hj; Thu, 16 Apr 2026 12:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283395.1565643; Thu, 16 Apr 2026 12:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMCo-0004dp-Eg; Thu, 16 Apr 2026 12:52:26 +0000
Received: by outflank-mailman (input) for mailman id 1283395;
 Thu, 16 Apr 2026 12:52:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wDMCn-0004dR-3x
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 12:52:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDMCm-00DzLI-H3
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:52:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e0db77-bab6-0a2a0a5309dd-0a2a4503d362-46
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:52:24 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69e0db88-672d-0a2a45030019-d155da34ecc3-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:52:24 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ba36357195bso36984866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 05:52:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1776343943; cv=none;
        d=google.com; s=arc-20240605;
        b=UGGQ2R3idi9zBB+6LF/xl4FdYg1krC3JzjE0y4CoHTrso6WPr/pIcoFdS9fB5X7E9R
         AWi8CDPWaZkyprK47cJplQUNjD6tCpgkhUmqfa5ELbeGVF0TSQJdrEXw7GttTcj6sdAL
         LJoXVQVpzcGM973JEIkwI/Gk3Hxht94DtwJElVt0LKbuFAIoBqB25QEDwh9aGbFr2aIa
         e0NBRKj9QqDfbMidmpn6YbEKANNH5fH6U2X1vduJMupk3+D4hv67SNlSlyC0OhcTBo9r
         hn4zfUG1pQfA89lh4faIspe1UNJX6hRDrYVo2KjvF5dBv9pRah1km4twUHoSJqkk1DQT
         mf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uWWJ9mP4NDk9cmYvS5SgrgvtiEhcfJ12dbTuCvEl8X0=;
        fh=dZ9oml7XyeCtxAH+8uRnDuAOsN3Lv1FdXWdZkBigAWY=;
        b=QOREVp+EL19glrBFJR0RsaIubStSa8+S1uZui1nw4+syGdl98eJz1GqDWBi32bfrme
         olIuYUNXEIPdbm6W1wFusq4+ehoJ7TVPpyvOK55A2043sekEgx2SaUNH/Rtf3i/fqHNv
         jvyT7iOCpT+skmEpNQdk18/YJQvs+3Vl8Sex4St+v4eEINPSym7DcQZc9yUbQ+zNGLjB
         VC2zA5/RJYYH0HZneaymYYHUFAV2xf8Twbll8tLv4PazrUmMhPjtNITKB3iUWZP/LumQ
         Tl74sthq8/YBpJcSnyjMGRbZDErmSTxWsCjPFmnF8iY+NnVqY8OtBHyljI0ttv9PQKBK
         /3rg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776343943; x=1776948743; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWWJ9mP4NDk9cmYvS5SgrgvtiEhcfJ12dbTuCvEl8X0=;
        b=NDohTHnLJr+ILyY+26VrQsugWJkmQyT5VmGKpclksopG2t3pt9AMiEiBT2V8yUbWhx
         xrekRJD3Uz5KvLoXFBIFa0jseNpUMLO3bx9ihlvu0B7r9104rc1jlOsBdWhQGWiNLxhK
         k2Iv+bHCteU0jbV0qO8bPlYRuCZnGVMxipuwRmEl7yjpuUH9HV5tJtJSbdzotqwwTr6x
         Ds/DMFxIpAmME6gMX307HVoDQy/2V6S/rppzzmiUZecPwi1QC7ju1LsEvztXQn/1RSDn
         iHefTlOQu83uMhVq40kzN2nEWQqIYkaUws5uP4Aj3SjrRg5Gx61M5Zi6oHlyLLP58eg4
         +k1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776343943; x=1776948743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWWJ9mP4NDk9cmYvS5SgrgvtiEhcfJ12dbTuCvEl8X0=;
        b=gheKULU/9KczvaiNQygFD8OWNA/WRzn7XucnmIQHCnzHf2wWUGi9yCnO8XkZTNpSGF
         5J8Fvbd9DCexOrvyqHwEs4MPUY8nF12gApg4b4gcdQLZLk7I/kUk7S7P80vyr+sTu3mN
         S6Ow1QzTkAMt3wvCkqQYg+Ts98i0ea+YCzYs1Usz7Lpmd3LdNNeqZjDFMKEb4ebVVH06
         Cvgzu3l6B8hkw+vG9pQJsp6d4QTlgK58Op5hCC1zt0Jbf+j1s+xe8qBK6Snag3mwOTWz
         0cvw/ASYNnLNdfFwqml7DfDFZpM99Mh0RZjryAGkRFC4z4LWZiIdX2z8m8kOViYiIX/Z
         Z08A==
X-Gm-Message-State: AOJu0Yyo7T5YoSrUH167xdOzPYdUk5NShxFApNUw08zkf22WwBdLN+0P
	lwCh5yPDy2Lpatgu3dy/olMwgE7u6VZ9zZKVT8RYRlfKxGpBjdoiBmHn4U3OK3EK8j6EG+aEKA0
	ewX6v7X+iZBkIAAdiO+1L2jw+NDfjWruYVH32AvI=
X-Gm-Gg: AeBDievqI3rL7STiAbMMUtAYRFxxmw9Ycys0zi9UoghP0ootnHcTpaIgKMaBXKuo9BD
	fxXvjaXE3GAlJVEvdvT5jwJhIP/uq5xFNYkTqzGES5xRxr0RAJKzdH+mJKtyo50sCAmDtwIhO9l
	BQQwL4YRZFJZvkzYEuZUK30E2OaeGw1TQjHzLTd6YQvKmB/S3Cuuxl+TzhetbUBz4hmG1T6Apwu
	UrRqZLDQyGXCBFhClkcAYKuokpiuZNz11CaRdxv/POtYdMYzamnJgAwMzKtG7Pzcr2QcvHDw66v
	w8didqYhd2/xR5osdQ==
X-Received: by 2002:a17:907:8b98:b0:b87:d09c:1825 with SMTP id
 a640c23a62f3a-b9d72792c0cmr1375263566b.13.1776343942861; Thu, 16 Apr 2026
 05:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775125380.git.mykola_kvach@epam.com>
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 16 Apr 2026 15:52:10 +0300
X-Gm-Features: AQROBzDkRt956UJ9HFqIUZus6pPyZV4x_qUHalERlz9C-lnc7Gr6C1oaVR71_7I
Message-ID: <CAGeoDV9NqdcVLBJ7vj8v1HUhfVoyrAssVXTP_sA5=ebXzS7Z0w@mail.gmail.com>
Subject: PING: Re: [PATCH v8 00/13] Add initial Xen Suspend-to-RAM support on ARM64
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Rahul Singh <rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1776343944-48FD6938-1C72C8A1/0/0
X-purgate-type: clean
X-purgate-size: 5859
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jens.wiklander@linaro.org,m:rahul.singh@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid,epam.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 82B5040E652
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

A gentle ping on this series. It's been a couple of weeks since v8 was post=
ed.

Please let me know if there are any further comments or if anything else is
needed from my side to move this forward.

Thanks!

Best regards,
Mykola

On Thu, Apr 2, 2026 at 1:47=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.com=
> wrote:
>
> From: Mykola Kvach <mykola_kvach@epam.com>
>
> This is part 2 of version 8 of the ARM Xen system suspend/resume patch
> series, based on earlier work by Mirela Simonovic and Mykyta Poturai.
>
> The first part is in mainline.
>
> NOTE: Most of the code is guarded by CONFIG_SYSTEM_SUSPEND, which can
> currently only be selected when UNSUPPORTED is set, and thus the
> functionality is neither enabled by default nor even built.
>
> This version is ported to Xen master and includes extensive improvements
> based on reviewer feedback. The patch series restructures code to improve
> robustness, maintainability, and implements system Suspend-to-RAM support
> on ARM64 hardware/control domains.
>
> Key updates in this series:
>  - Introduced architecture-specific suspend/resume infrastructure
>  - Integrated GICv2/GICv3 suspend and resume, including memory-backed con=
text
>    save/restore with error handling
>  - Added time and IRQ suspend/resume hooks, ensuring correct timer/interr=
upt
>    state across suspend cycles
>  - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
>  - Improved state management and recovery in error cases during suspend/r=
esume
>  - Added support for IPMMU-VMSA/SMMUv3 context save/restore
>  - Added support for GICv3 eSPI registers context save/restore
>  - Added support for ITS registers context save/restore
> ---
>
> TODOs:
>  - Enable "xl suspend" support on ARM
>  - Add suspend/resume CI test for ARM (QEMU if feasible)
>  - PCI suspend ?
> ---
>
> Detailed changelogs can be found in each patch.
>
> Changes in v8:
> - Rebased to latest master and refreshed the series accordingly.
> - Added a new GICv3 patch to tolerate retained redistributor LPI state
>   across CPU_OFF/CPU_ON.
> - GICv2 suspend now disables the CPU interface and distributor before
>   saving state.
> - GICv3 suspend/resume fixes the redistributor base used for LPI state.
> - ITS and SMMUv3 suspend/resume paths were tightened, with safer
>   restore/rollback handling and stricter fatal-error handling.
> - System suspend now checks that all domains are already in
>   SHUTDOWN_suspend before proceeding, and renames the hardware-domain
>   suspend capability/helper for clearer semantics.
> - Fixed alignment/cleanup issues in the low-level suspend/resume code.
>
> Changes in v7:
> - Timer helper renamed/clarified; virtual/hyper/phys handling documented.
> - GICv2 uses one context block; restore saved CTLR; panic on alloc failur=
e.
> - GICv3/eSPI/ITS always suspend/resume; restore LPI/eSPI; rdist timeout.
> - IPMMU suspend context allocated before PCI setup.
> - System suspend: control domain drives host suspend.
> - Dropped v6 IRQ descriptor restore patches; use setup_irq and re-registe=
r
>   local IRQs on resume instead.
>
> For earlier changelogs, please refer to the previous cover letters.
>
> Mirela Simonovic (6):
>   xen/arm: Add suspend and resume timer helpers
>   xen/arm: gic-v2: Implement GIC suspend/resume functions
>   xen/arm: Resume memory management on Xen resume
>   xen/arm: Save/restore context on suspend/resume
>   xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
>   xen/arm: Add support for system suspend triggered by hardware domain
>
> Mykola Kvach (6):
>   xen/arm: gic-v3: tolerate retained redistributor LPI state across
>     CPU_OFF
>   xen/arm: gic-v3: Implement GICv3 suspend/resume functions
>   xen/arm: gic-v3: add ITS suspend/resume support
>   xen/arm: tee: keep init_tee_secondary() for hotplug and resume
>   xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
>   arm/smmu-v3: add suspend/resume handlers
>
> Oleksandr Tyshchenko (1):
>   iommu/ipmmu-vmsa: Implement suspend/resume callbacks
>
>  xen/arch/arm/Kconfig                     |   2 +
>  xen/arch/arm/Makefile                    |   1 +
>  xen/arch/arm/arm64/head.S                | 112 ++++++++
>  xen/arch/arm/gic-v2.c                    | 132 +++++++++
>  xen/arch/arm/gic-v3-its.c                | 126 +++++++-
>  xen/arch/arm/gic-v3-lpi.c                |  80 +++++-
>  xen/arch/arm/gic-v3.c                    | 349 ++++++++++++++++++++++-
>  xen/arch/arm/gic.c                       |  29 ++
>  xen/arch/arm/include/asm/gic.h           |  12 +
>  xen/arch/arm/include/asm/gic_v3_defs.h   |   1 +
>  xen/arch/arm/include/asm/gic_v3_its.h    |  24 ++
>  xen/arch/arm/include/asm/mm.h            |   2 +
>  xen/arch/arm/include/asm/psci.h          |   1 +
>  xen/arch/arm/include/asm/suspend.h       |  31 ++
>  xen/arch/arm/include/asm/time.h          |   5 +
>  xen/arch/arm/mmu/smpboot.c               |   2 +-
>  xen/arch/arm/psci.c                      |  23 +-
>  xen/arch/arm/suspend.c                   | 195 +++++++++++++
>  xen/arch/arm/tee/ffa_notif.c             |  63 +++-
>  xen/arch/arm/tee/tee.c                   |   2 +-
>  xen/arch/arm/time.c                      |  44 ++-
>  xen/arch/arm/vpsci.c                     |  12 +-
>  xen/common/Kconfig                       |   3 +
>  xen/common/domain.c                      |   7 +-
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 305 +++++++++++++++++++-
>  xen/drivers/passthrough/arm/smmu-v3.c    | 172 ++++++++---
>  xen/drivers/passthrough/arm/smmu.c       |  10 +
>  xen/include/xen/list.h                   |  14 +
>  28 files changed, 1670 insertions(+), 89 deletions(-)
>  create mode 100644 xen/arch/arm/suspend.c
>
> --
> 2.43.0


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E2FB143DB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 23:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061965.1427572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugVOz-0003rX-8S; Mon, 28 Jul 2025 21:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061965.1427572; Mon, 28 Jul 2025 21:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugVOz-0003oy-4v; Mon, 28 Jul 2025 21:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1061965;
 Mon, 28 Jul 2025 21:28:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BLX+=2J=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugVOw-0003os-5H
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 21:28:55 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dafa2903-6bf9-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 23:28:51 +0200 (CEST)
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
X-Inumbo-ID: dafa2903-6bf9-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=wpw2doj3kjbd5kxqpfegre76im.protonmail; t=1753738130; x=1753997330;
	bh=ITYUu9vL8vSMTU9xm9FrJl5Dh5oSPYuCzUwoOCMS+AA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BRwLlp1HfZJgn5LosSNDKXKdUHs9r2drk6N7BBivbA/kS9L0EqwoaP1OMbiUhOdp4
	 uM/6l3Yz43FaKWI/yTaL64poaEYqs7xcrcxOAmy4EPQKVhDJcStc/JeIP0+ZY4UXQ+
	 Jn5Oc54++DETQN4t5WMFNbitLqV3qZca0hMsa4PWw3oPB+/jWtAcu3jlH6BmV1sGiW
	 WXaL3O9mkGMcS40vuCNqTSBNlHyDkPF8W46Syy1uhcfBu9wo3e9LV+DAabRg6AX+th
	 yJBuGfqk5Ql8TJXBc62Rg27p7mEE1wWonpCw++wR/xUoVPSm9jqcjVf/i4B4kmKBhk
	 Zx4HY8LnOGrGQ==
Date: Mon, 28 Jul 2025 21:28:44 +0000
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
From: dmkhn@proton.me
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control Dom0 boot
Message-ID: <aIfrhfoaEBx2tyM3@kraken>
In-Reply-To: <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com>
References: <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0ccbe520699d250ab05a5d4967588a78f12ff701
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 05:07:30PM +0000, Oleksii Moisieiev wrote:
> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
> allow for building Xen without support for booting a regular domain (Dom0=
).
> This functionality is primarily intended for the ARM architecture.
>=20
> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
> default for ARM and X86 architecture. This symbol signifies that an
> architecture has the capability to support a Dom0.
>=20
> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
> expert users, this option can be disabled (`CONFIG_EXPERT=3Dy` and no
> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
> creation code on ARM. This is useful for embedded or dom0less-only
> scenarios to reduce binary size and complexity.
>=20
> The ARM boot path has been updated to panic if it detects a non-dom0less
> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
> boot.
>=20
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>=20
> ---
>=20
> ---
>  xen/arch/arm/Kconfig        |  1 +
>  xen/arch/arm/domain_build.c |  8 ++++++++
>  xen/arch/arm/setup.c        | 14 ++++++++++----
>  xen/arch/x86/Kconfig        |  1 +
>  xen/common/Kconfig          | 11 +++++++++++
>  5 files changed, 31 insertions(+), 4 deletions(-)

I think there should be changes in
  include/xen/domain.h
and
  arch/arm/include/asm/setup.h
to compile out declarations of dom0_max_vcpus() and create_dom0() under new
CONFIG_DOM0_BOOT.

I would also define default implementations using ASSERT_UNREACHABLE() unde=
r
#ifndef CONFIG_DOM0_BOOT.



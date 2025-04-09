Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0865A82FBC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 20:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944580.1342996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2acb-000183-8s; Wed, 09 Apr 2025 18:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944580.1342996; Wed, 09 Apr 2025 18:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2acb-000161-6P; Wed, 09 Apr 2025 18:58:01 +0000
Received: by outflank-mailman (input) for mailman id 944580;
 Wed, 09 Apr 2025 18:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2aca-00015q-85
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 18:58:00 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d1a83f1-1574-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 20:57:58 +0200 (CEST)
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
X-Inumbo-ID: 8d1a83f1-1574-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744225076; x=1744484276;
	bh=XQ4zdj9NAzFnFmzpReIZWygHFh1zLeEALYF2jxNdsGk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=au4STLl9HiAZ3Vl/MuQW4BibIn7OGkDY5rdj6gGX3W4PZNWACCUzQbwkExAgC2V5r
	 wMJso+J8PJIvjsWgJjXHx+Mz095hvftbKt4Z33D8b6SPFkUCy6j4Zis0QQD7QrLIOK
	 yxzRyaGa+JXYLuy/XQ8GlQqdN2sBPR6/se67Hep9d4rTfwSuvvhQKhlqqhculZ6pMF
	 buQjbolPRV6mQ4C0Nav44548bvkr/4//h5ecWxXgDyAJfN+n1z9qUWY1z7jHfzRnQM
	 2CNXnJVlZiYP3cUuqe/Rt+FdaCFtI4FBq3f3YYNbOkNH6hftoRE7ResT+Rt/KKCh3K
	 XTOefPHTxPCUg==
Date: Wed, 09 Apr 2025 18:57:53 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Denis Mukhin <dmkhn@proton.me>
Subject: Re: [PATCH v3 04/16] kconfig: introduce option to independently enable libfdt
Message-ID: <7UJZ7DNBvYS92pCcplKug_7DNUY5QJtWUdcN_CWIUsdcumUN4dOXsQka1nGQ5dQwgSSmHBJXJGJo9EGByjmq-eeNR0VyNftIPnKZHcWUrZw=@proton.me>
In-Reply-To: <20250408160802.49870-5-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-5-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2dd734a7a003bbf90e4dafc8bfa025e4566966e1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.com=
> wrote:

>=20
>=20
> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>=20
>=20
> Currently, the inclusion of libfdt is controlled by the CONFIG_HAS_DEVICE=
_TREE
> kconfig flag. This flag also changes behavior in a few places, such as bo=
ot
> module processing for XSM. To support the ability to include libfdt witho=
ut
> changing these behaviors, introduce CONFIG_LIBFDT. The inclusion of
> libfdt is then moved under CONFIG_LIBFDT.
>=20
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> Signed-off-by: Jason Andryuk jason.andryuk@amd.com

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

>=20
> ---
> v3:
> * Use CONFIG_LIBFDT instead of CONFIG_HAS_DEVICET_TREE
> ---
> xen/common/Kconfig | 4 ++++
> xen/common/Makefile | 2 +-
> 2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 06ae9751aa..00f74b1e32 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -72,6 +72,7 @@ config HAS_COMPAT
>=20
> config HAS_DEVICE_TREE
> bool
> + select LIBFDT
>=20
> config HAS_DIT # Data Independent Timing
> bool
> @@ -106,6 +107,9 @@ config HAS_UBSAN
> config HAS_VMAP
> bool
>=20
> +config LIBFDT
> + bool
> +
> config MEM_ACCESS_ALWAYS_ON
> bool
>=20
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 9da8a7244d..5a9041b0ee 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -79,7 +79,7 @@ obj-y +=3D sched/
> obj-$(CONFIG_UBSAN) +=3D ubsan/
>=20
> obj-$(CONFIG_NEEDS_LIBELF) +=3D libelf/
> -obj-$(CONFIG_HAS_DEVICE_TREE) +=3D libfdt/
> +obj-$(CONFIG_LIBFDT) +=3D libfdt/
>=20
> CONF_FILE :=3D $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONF=
IG_CONFIG)
> $(obj)/config.gz: $(CONF_FILE)
> --
> 2.43.0


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F62BB1ED91
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 19:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074883.1437354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQVD-0003ea-DY; Fri, 08 Aug 2025 17:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074883.1437354; Fri, 08 Aug 2025 17:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukQVD-0003bx-AP; Fri, 08 Aug 2025 17:03:35 +0000
Received: by outflank-mailman (input) for mailman id 1074883;
 Fri, 08 Aug 2025 17:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hyIc=2U=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ukQVC-0002tT-FY
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 17:03:34 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b287429-7479-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 19:03:29 +0200 (CEST)
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
X-Inumbo-ID: 9b287429-7479-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754672606; x=1754931806;
	bh=qmKyze0v7woqNcJVAbJEuZPdAnxGGABTkSBBx4vd3l4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HlAOK+28GEELYNVEN95InCUPTihjLWi4jUhsQtLrM618S93mpU3YcPbkkhI1siWtL
	 O5zGLIXCFYcCquQajGNiBQZ7O9jJ3te19CXfgVSzMGLY85JPSBB4Dhv47qPUut/y6q
	 NglrGeGS4NLMlkeJPTh89tvS/cyNfA2OCYRhniz79jshqZVLWixeUm0t7H72bndwEP
	 JCyIM6g66rDE43KHMVi69a/bgCeUC85qZua7K5PFhJLKbu/9KoKbh8LHjr+WUSU0r6
	 6aZTA93Su4E8eokqN6oxOYiiuk0OESJX4AGmgp0IeLCm2LLgaMWyOQWE8T0lxXfRBH
	 sVgAcQEmqe9qQ==
Date: Fri, 08 Aug 2025 17:03:22 +0000
To: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/3] CI: Add configure --enable-systemd for full build
Message-ID: <aJYt1xDj2ClP3mrw@kraken>
In-Reply-To: <526d26a85bd1f164dd8a421dfcc1e765c3ff5590.1754663560.git-series.marmarek@invisiblethingslab.com>
References: <cover.961bf2f7929562a899b182283446598d4c055149.1754663560.git-series.marmarek@invisiblethingslab.com> <526d26a85bd1f164dd8a421dfcc1e765c3ff5590.1754663560.git-series.marmarek@invisiblethingslab.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 95ef0145e607ca172d16f19766c0bc4b79857fff
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2025 at 04:32:42PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> This doesn't exclude sysvinit scripts, but allows testing systemd too.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> --
> New in v2.
>=20
> Requires containers rebuild
> ---
>  automation/build/debian/12-x86_64.dockerfile | 1 +
>  automation/scripts/build                     | 3 +++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/bu=
ild/debian/12-x86_64.dockerfile
> index e26a19079e38..3a53d92ddf6d 100644
> --- a/automation/build/debian/12-x86_64.dockerfile
> +++ b/automation/build/debian/12-x86_64.dockerfile
> @@ -24,6 +24,7 @@ RUN <<EOF
>          git-core
>          pkg-config
>          wget
> +        systemd
>          # libxenguest dombuilder
>          libbz2-dev
>          liblzma-dev
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 0e7494ff6d87..4ad42889c78c 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -69,6 +69,9 @@ else
>      # Full build.  Figure out our ./configure options
>      cfgargs=3D("--prefix=3D/usr")
>      cfgargs+=3D("--enable-docs")
> +    if pkg-config systemd; then
> +        cfgargs+=3D("--enable-systemd")
> +    fi
>=20
>      # booleans for which compiler is in use
>      cc_is_gcc=3D"$($cc --version | grep -q gcc && echo "y" || :)"
> --
> git-series 0.9.1
>=20



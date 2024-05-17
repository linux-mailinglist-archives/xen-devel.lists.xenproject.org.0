Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB8E8C8D7D
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 22:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724456.1129730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s84eX-0008Ib-0C; Fri, 17 May 2024 20:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724456.1129730; Fri, 17 May 2024 20:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s84eW-0008FT-T8; Fri, 17 May 2024 20:58:08 +0000
Received: by outflank-mailman (input) for mailman id 724456;
 Fri, 17 May 2024 20:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s84eV-0008Cs-Bc
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 20:58:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2651e691-1490-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 22:58:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BC8C0CE1ACF;
 Fri, 17 May 2024 20:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EBCC2BD10;
 Fri, 17 May 2024 20:57:56 +0000 (UTC)
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
X-Inumbo-ID: 2651e691-1490-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715979477;
	bh=V0jJpL7gnRBXfBTZqPkn7Wu//yGS1QTNfkj3Eh7zTR4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E6CZ1WkrVrrtl0SZ0o5Xs07PEaiIRH438iVZlKTFtdof8nUGFF9klEJKXrCxNdkly
	 TYzSr7JW6AtpKwvAgj+avZCGFuk8tqCnCx8iVhR3Fa5kJsRIpEQFgKA58dY9m68wWX
	 1LUlNDQTv+A5TZycNWcAPgJkZpqF0JPg6MohtIRij2DuTuVJy99AOPwzkD7x3ztI2r
	 ZLZU+sRHlSenqDTh+2LCsR2B6mEifLpGlwi6xh1TmOoEDw73wA/5ZiOVF8fHiBq9wV
	 L3Ag/Q16WdCVQYlBM1jdc6q5hF0B3vh2NB1I19AfnP+1IGGMqSKBFKI3LkGF5DFGhl
	 HoxbMWb3hljWw==
Date: Fri, 17 May 2024 13:57:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 02/12] automation: update fedora build to F39
In-Reply-To: <ae23eeb2e08c2fa95d975bfad64b818870e370e6.1715867907.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2405171357490.1052252@ubuntu-linux-20-04-desktop>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com> <ae23eeb2e08c2fa95d975bfad64b818870e370e6.1715867907.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1335279025-1715979476=:1052252"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1335279025-1715979476=:1052252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 May 2024, Marek Marczykowski-Górecki wrote:
> Fedora 29 is long EOL
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/build/fedora/29.dockerfile | 46 +----------------------------
>  automation/build/fedora/39.dockerfile | 46 ++++++++++++++++++++++++++++-
>  automation/gitlab-ci/build.yaml       |  4 +-
>  3 files changed, 48 insertions(+), 48 deletions(-)
>  delete mode 100644 automation/build/fedora/29.dockerfile
>  create mode 100644 automation/build/fedora/39.dockerfile
> 
> diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
> deleted file mode 100644
> index f473ae13e7c1..000000000000
> --- a/automation/build/fedora/29.dockerfile
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -FROM --platform=linux/amd64 fedora:29
> -LABEL maintainer.name="The Xen Project" \
> -      maintainer.email="xen-devel@lists.xenproject.org"
> -
> -# install Xen depends
> -RUN dnf -y install \
> -        clang \
> -        gcc \
> -        gcc-c++ \
> -        ncurses-devel \
> -        zlib-devel \
> -        openssl-devel \
> -        python-devel \
> -        python3-devel \
> -        libuuid-devel \
> -        pkgconfig \
> -        flex \
> -        bison \
> -        libaio-devel \
> -        glib2-devel \
> -        yajl-devel \
> -        pixman-devel \
> -        glibc-devel \
> -        make \
> -        binutils \
> -        git \
> -        wget \
> -        acpica-tools \
> -        python-markdown \
> -        patch \
> -        checkpolicy \
> -        dev86 \
> -        xz-devel \
> -        bzip2 \
> -        nasm \
> -        ocaml \
> -        ocaml-findlib \
> -        golang \
> -        # QEMU
> -        ninja-build \
> -    && dnf clean all && \
> -    rm -rf /var/cache/dnf
> -
> -RUN useradd --create-home user
> -USER user
> -WORKDIR /build
> diff --git a/automation/build/fedora/39.dockerfile b/automation/build/fedora/39.dockerfile
> new file mode 100644
> index 000000000000..054f73444060
> --- /dev/null
> +++ b/automation/build/fedora/39.dockerfile
> @@ -0,0 +1,46 @@
> +FROM --platform=linux/amd64 fedora:39
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +# install Xen depends
> +RUN dnf -y install \
> +        clang \
> +        gcc \
> +        gcc-c++ \
> +        ncurses-devel \
> +        zlib-devel \
> +        openssl-devel \
> +        python-devel \
> +        python3-devel \
> +        libuuid-devel \
> +        pkgconfig \
> +        flex \
> +        bison \
> +        libaio-devel \
> +        glib2-devel \
> +        yajl-devel \
> +        pixman-devel \
> +        glibc-devel \
> +        make \
> +        binutils \
> +        git \
> +        wget \
> +        acpica-tools \
> +        python-markdown \
> +        patch \
> +        checkpolicy \
> +        dev86 \
> +        xz-devel \
> +        bzip2 \
> +        nasm \
> +        ocaml \
> +        ocaml-findlib \
> +        golang \
> +        # QEMU
> +        ninja-build \
> +    && dnf clean all && \
> +    rm -rf /var/cache/dnf
> +
> +RUN useradd --create-home user
> +USER user
> +WORKDIR /build
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 49d6265ad5b4..69665ec5b11f 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -691,12 +691,12 @@ debian-bookworm-32-gcc-debug:
>  fedora-gcc:
>    extends: .gcc-x86-64-build
>    variables:
> -    CONTAINER: fedora:29
> +    CONTAINER: fedora:39
>  
>  fedora-gcc-debug:
>    extends: .gcc-x86-64-build-debug
>    variables:
> -    CONTAINER: fedora:29
> +    CONTAINER: fedora:39
>  
>  # Ubuntu Trusty's Clang is 3.4 while Xen requires 3.5
>  
> -- 
> git-series 0.9.1
> 
--8323329-1335279025-1715979476=:1052252--


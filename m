Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158D9D66A3
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 01:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842061.1257505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEdn0-0006dP-Kh; Sat, 23 Nov 2024 00:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842061.1257505; Sat, 23 Nov 2024 00:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEdn0-0006bE-HW; Sat, 23 Nov 2024 00:14:18 +0000
Received: by outflank-mailman (input) for mailman id 842061;
 Sat, 23 Nov 2024 00:14:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tEdmz-0006b6-2Z
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 00:14:17 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dca08cf6-a92f-11ef-99a3-01e77a169b0f;
 Sat, 23 Nov 2024 01:14:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 604EDA417BD;
 Sat, 23 Nov 2024 00:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4865EC4CECE;
 Sat, 23 Nov 2024 00:14:08 +0000 (UTC)
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
X-Inumbo-ID: dca08cf6-a92f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImRjYTA4Y2Y2LWE5MmYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMzIwODUxLjIyNDgxNiwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732320849;
	bh=L4k5/BUZwAqxiFlJjfgkFBaLuaJWJbaI2TkCJ56pTAU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PXCmBawGxC2C2eylGbv+mZ7kHzneGY3ltGaHWguzhJGyOw93lwwe/yo2uKtSElVVn
	 Hc9lvECqouxn/Kxim+IeoCunqbNl6zFSfgYdQkY9qpKnKN1W4zCRenB7ajJvW2EgsZ
	 kBx7Fc9LOYSJ2NZwVAhOlfGFrJ37Ld7XRYTa58xvYgCOaVLYehi+dBMgGYqbD0AFjt
	 /0UcKFfhfMItKy5zRKUC6hfh+chQ/6Vd5oQSz2PHpPG9gSs3lsJuAYkwIGr5EOgFTD
	 hl+K7Y4Wp9xmBJeHMRRaJpPBfbdMgFEUZASqk0cwOafAlk2uDe+WHcSFOotW8fgrzV
	 M3P8zr+crKudg==
Date: Fri, 22 Nov 2024 16:14:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] docs/sphinx: Refresh config for newer Sphinx
In-Reply-To: <20241122165102.3240758-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2411221613380.11605@ubuntu-linux-20-04-desktop>
References: <20241122165102.3240758-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Nov 2024, Andrew Cooper wrote:
> Sphinx 5.0 and newer objects to language = None.  Switch to 'en'.
> 
> Also update the copyright year.  Use %Y to avoid this problem in the future,
> and provide compatibility for versions of Sphinx prior to 8.1 which don't
> support the syntax.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> 
> This is in prepartion to get a Gitlab CI docs job, and to activate Sphinx's
> -Werror equivelent.
> ---
>  docs/conf.py | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/conf.py b/docs/conf.py
> index 50e41501db8f..5d2e97944900 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -3,9 +3,8 @@
>  #
>  # Configuration file for the Sphinx documentation builder.
>  #
> -# This file does only contain a selection of the most common options. For a
> -# full list see the documentation:
> -# http://www.sphinx-doc.org/en/master/config
> +# For the full list of built-in configuration values, see the documentation:
> +# https://www.sphinx-doc.org/en/master/usage/configuration.html
>  
>  # -- Path setup --------------------------------------------------------------
>  
> @@ -19,11 +18,18 @@
>  
>  
>  # -- Project information -----------------------------------------------------
> +# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information
> +
> +import sphinx
>  
>  project = u'Xen'
> -copyright = u'2019, The Xen development community'
> +copyright = u'2019-%Y, The Xen development community'
>  author = u'The Xen development community'
>  
> +if sphinx.version_info < (8, 1):
> +    from datetime import datetime
> +    copyright = datetime.today().strftime(copyright)
> +
>  # Pull the Xen version straight out of the Makefile
>  try:
>      xen_ver = xen_subver = xen_extra = None
> @@ -45,6 +51,7 @@ finally:
>          version = release = u"unknown version"
>  
>  # -- General configuration ---------------------------------------------------
> +# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration
>  
>  # If your documentation needs a minimal Sphinx version, state it here.
>  #
> @@ -69,10 +76,7 @@ master_doc = 'index'
>  
>  # The language for content autogenerated by Sphinx. Refer to documentation
>  # for a list of supported languages.
> -#
> -# This is also used if you do content translation via gettext catalogs.
> -# Usually you set "language" from the command line for these cases.
> -language = None
> +language = 'en'
>  
>  # List of patterns, relative to source directory, that match files and
>  # directories to ignore when looking for source files.
> @@ -86,6 +90,7 @@ primary_domain = 'c'
>  highlight_language = 'none'
>  
>  # -- Options for HTML output -------------------------------------------------
> +# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output
>  
>  # The theme to use for HTML and HTML Help pages.  See the documentation for
>  # a list of builtin themes.
> 
> base-commit: c0bf8816c9e2a4701c925d8b23abfda5990a0087
> prerequisite-patch-id: b4ef4fc3ee5669c078aa0b9c7501ac7ef673966c
> -- 
> 2.39.5
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F1EAE32F2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 01:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021941.1397664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTTjo-0004mE-7N; Sun, 22 Jun 2025 23:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021941.1397664; Sun, 22 Jun 2025 23:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTTjo-0004kl-4F; Sun, 22 Jun 2025 23:04:36 +0000
Received: by outflank-mailman (input) for mailman id 1021941;
 Sun, 22 Jun 2025 23:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTTjm-0004ic-92
 for xen-devel@lists.xenproject.org; Sun, 22 Jun 2025 23:04:34 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41a39857-4fbd-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 01:04:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1D02B60EDF;
 Sun, 22 Jun 2025 23:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CCDC4CEE3;
 Sun, 22 Jun 2025 23:04:29 +0000 (UTC)
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
X-Inumbo-ID: 41a39857-4fbd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750633470;
	bh=VxBS3YBVl2lQfbRgEpxjvNAy68EXRFshaJhYYyIECps=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AqsutOrcSHtBql9ytOXT201lNtnvZnfmBJBzgHvbMI1SFe3JJFOWxPc7AI6wkB0/F
	 YomvYiamPGNLVGG1ajsdP6bFUMTgnamg7qCmxPr7Yvh675rZNgfDDJOiH4d1iSsjJX
	 989hGd9zEqPRhwDCm8bfM0Yd0+LZZ2Q7obRU/LBLBjK4e9X54MGgGxS/sA1TurdxIT
	 UA3taqp63i2eW4EldKC+GRadp3um7EIrb4JvioRvDb4Xby7sbxnikrWFseskptaXxn
	 Ug4tvhzJjkPdxwi9QX3Tvkig1lRozezI2jMj1ngG+/SBm692FgR2f6KA+rUZUEXujn
	 MVU+MHNKSgN5Q==
Date: Sun, 22 Jun 2025 16:04:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] docs: Introduce a default .readthedocs.yaml
In-Reply-To: <20250620203418.42526-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506221604021.8066@ubuntu-linux-20-04-desktop>
References: <20250620203418.42526-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1543293752-1750633470=:8066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1543293752-1750633470=:8066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 20 Jun 2025, Andrew Cooper wrote:
> Read The Docs now requires a configuration file, which is awkward when using
> RTD to render proposed changes on the list.
> 
> Provide the minimal configuration file possible, sacrificing all
> reproducibility in order to hopefully not need to touch it moving forwards.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> Notably, I've figured out how to get back to using rtd-theme:
> 
>   https://andrewcoop-xen.readthedocs.io/en/docs-secureboot/admin-guide/uefi-secure-boot.html
> 
> and without needing a separate docs/requirements.txt file in the tree too.
> ---
>  .readthedocs.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 .readthedocs.yaml
> 
> diff --git a/.readthedocs.yaml b/.readthedocs.yaml
> new file mode 100644
> index 000000000000..d3aff7662ebf
> --- /dev/null
> +++ b/.readthedocs.yaml
> @@ -0,0 +1,18 @@
> +# Read the Docs configuration file for Sphinx projects
> +# See https://docs.readthedocs.io/en/stable/config-file/v2.html for details
> +
> +version: 2
> +
> +build:
> +  os: ubuntu-lts-latest
> +
> +  tools:
> +    python: "latest"
> +
> +  jobs:
> +    post_install:
> +      # Instead of needing a separate requirements.txt
> +      - python -m pip install --upgrade --no-cache-dir sphinx-rtd-theme
> +
> +sphinx:
> +  configuration: docs/conf.py
> -- 
> 2.39.5
> 
--8323329-1543293752-1750633470=:8066--


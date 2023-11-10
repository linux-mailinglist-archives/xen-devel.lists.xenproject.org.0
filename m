Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8B97E75A9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 01:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629862.982386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1F3h-0004r5-Qo; Fri, 10 Nov 2023 00:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629862.982386; Fri, 10 Nov 2023 00:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1F3h-0004p1-NU; Fri, 10 Nov 2023 00:07:37 +0000
Received: by outflank-mailman (input) for mailman id 629862;
 Fri, 10 Nov 2023 00:07:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1F3g-0004os-5W
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 00:07:36 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24be5b62-7f5d-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 01:07:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8CB43CE13B3;
 Fri, 10 Nov 2023 00:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A54C433C8;
 Fri, 10 Nov 2023 00:07:27 +0000 (UTC)
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
X-Inumbo-ID: 24be5b62-7f5d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699574848;
	bh=N2ZUJAHJgw6jo5MqtWqtthaYbCHzuj3b0rdG86kphaM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VBK+K6oxGzqaaq/33QDluHKps2M/YcqyqQwBKelBh9BlopHm0oHAmQLqCvOyYFjAs
	 MfedRgjLi/gDbflk8KUASQqQrEXFnsq6hx2uFt+W/9htj0Estb5OIfeD+4NzuBQuSU
	 jkUcAKa+wpAMPiq7v4gV6akKqTbIm6SRLdY/KOh2eoqzPnTQPn2FFVjjAQEsVDtAMd
	 r+YiKUVLDzysGdU99pjf6qu1yuEQiPGs2CDClZimDxkX/CvNdb0i7T4LH2JMsHADYr
	 akD2UZbtC4c+VYqj+8HYrl4zJS6xpYoMAPhbp8WNSqkqI97B8BTm30PKUnUhLEx5QP
	 o43hVPNHRGT8Q==
Date: Thu, 9 Nov 2023 16:07:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18 3/3] docs/sphinx: Fix indexing
In-Reply-To: <20231108152727.58764-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311091601420.3478774@ubuntu-linux-20-04-desktop>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com> <20231108152727.58764-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Nov 2023, Andrew Cooper wrote:
> sphinx-build reports:
> 
>   docs/designs/launch/hyperlaunch.rst: WARNING: document isn't included in any toctree
>   docs/designs/launch/hyperlaunch-devicetree.rst: WARNING: document isn't included in any toctree
>   docs/misc/xen-makefiles/makefiles.rst: WARNING: document isn't included in any toctree
>   docs/misra/C-language-toolchain.rst: WARNING: document isn't included in any toctree
>   docs/misra/C-runtime-failures.rst: WARNING: document isn't included in any toctree
>   docs/misra/documenting-violations.rst: WARNING: document isn't included in any toctree
>   docs/misra/exclude-list.rst: WARNING: document isn't included in any toctree
>   docs/misra/xen-static-analysis.rst: WARNING: document isn't included in any toctree
> 
> Create an up-to-date index.rst in misra/ create an "unsorted docs" section at
> the top level to contain everything else.  They can be re-filed at a later
> date.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Henry Wang <Henry.Wang@arm.com>
> ---
>  docs/index.rst       | 13 +++++++------
>  docs/misra/index.rst | 18 ++++++++++++++++++
>  2 files changed, 25 insertions(+), 6 deletions(-)
>  create mode 100644 docs/misra/index.rst
> 
> diff --git a/docs/index.rst b/docs/index.rst
> index f3f779f89ce5..22fdde80590c 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -53,17 +53,18 @@ kind of development environment.
>     hypervisor-guide/index
>  
>  
> -MISRA C coding guidelines
> --------------------------
> +Unsorted documents
> +------------------
>  
> -MISRA C rules and directive to be used as coding guidelines when writing
> -Xen hypervisor code.
> +Documents in need of some rearranging.

I understand the need for an "Unsorted documents", but why taking away
"MISRA C coding guidelines" from here? Wouldn't we want:


Unsorted documents
------------------

designs/launch/hyperlaunch
designs/launch/hyperlaunch-devicetree
misc/xen-makefiles/makefiles


MISRA C coding guidelines
-------------------------

MISRA C rules and directive to be used as coding guidelines when writing
Xen hypervisor code and related files.

misra/index


>  .. toctree::
>     :maxdepth: 2
>  
> -   misra/rules
> -   misra/deviations
> +   designs/launch/hyperlaunch
> +   designs/launch/hyperlaunch-devicetree
> +   misc/xen-makefiles/makefiles
> +   misra/index
>  
>  
>  Miscellanea
> diff --git a/docs/misra/index.rst b/docs/misra/index.rst
> new file mode 100644
> index 000000000000..c59730c46d88
> --- /dev/null
> +++ b/docs/misra/index.rst
> @@ -0,0 +1,18 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +MISRA C coding guidelines
> +=========================
> +
> +MISRA C rules and directive to be used as coding guidelines when writing
> +Xen hypervisor code.

This is fine. I would expand it a bit appending "and related documents":

MISRA C rules and directive to be used as coding guidelines when writing
Xen hypervisor code and related documents.


> +.. toctree::
> +   :maxdepth: 2
> +
> +   rules
> +   deviations
> +   C-language-toolchain
> +   C-runtime-failures
> +   documenting-violations
> +   exclude-list
> +   xen-static-analysis
> -- 
> 2.30.2
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B1CA7B3A5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 02:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937562.1338501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0UpW-0007Yw-FT; Fri, 04 Apr 2025 00:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937562.1338501; Fri, 04 Apr 2025 00:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0UpW-0007WJ-Ce; Fri, 04 Apr 2025 00:22:42 +0000
Received: by outflank-mailman (input) for mailman id 937562;
 Fri, 04 Apr 2025 00:22:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0UpV-0007I9-Gc
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 00:22:41 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaa8f1d2-10ea-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 02:22:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D940E614BC;
 Fri,  4 Apr 2025 00:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE210C4CEE3;
 Fri,  4 Apr 2025 00:22:37 +0000 (UTC)
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
X-Inumbo-ID: eaa8f1d2-10ea-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743726158;
	bh=vDBmCE+e4wqjLrFEny/6Nh5iNP3s44Po2JhFiH294+E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZH9Mi6ygr8Ga6Q11jAV4DCwFw6c0AIdmJ44hzMrITkeotrr3GYpmUpuiBshFxYpOF
	 P4NP09+yQYW3IRnDAZIDYdBjWjItG6KLeBLN5MZfChLQ2T/03ulgflVmt4AC8M/OBq
	 M6b6ToAY9fDIAJnBbv9D25JZepb+7UF9af6TtT2NeWYG5GTG+pObqZE/9AGllAmYoj
	 6dWva/V3I/EEft22v+OixeUv7kvV8f5XEH1sCtkPzPW3ql8dyaHEqZreJ2M1PJkSSz
	 L5EbMq2g65kYj7im1Wwc+dd0Yqwf8N0ji7MicxE6vjoi00UXgXRB8yfgYtAgalgKBc
	 acDawfgjLI22w==
Date: Thu, 3 Apr 2025 17:22:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 03/11] ci: enable XHCI console in Xen debug build on
 Alpine
In-Reply-To: <8994039fbd8694a984d234b30b1ce727b16844f3.1743678257.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2504031722310.3529306@ubuntu-linux-20-04-desktop>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com> <8994039fbd8694a984d234b30b1ce727b16844f3.1743678257.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1273410683-1743726158=:3529306"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1273410683-1743726158=:3529306
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Apr 2025, Marek Marczykowski-Górecki wrote:
> This build is used for hardware tests, and some runners use XHCI console
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/gitlab-ci/build.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 2513908b059b..169bebe3c775 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -341,6 +341,7 @@ alpine-3.18-gcc-debug:
>        CONFIG_ARGO=y
>        CONFIG_UBSAN=y
>        CONFIG_UBSAN_FATAL=y
> +      CONFIG_XHCI=y
>  
>  debian-12-x86_64-gcc-debug:
>    extends: .gcc-x86-64-build-debug
> -- 
> git-series 0.9.1
> 
--8323329-1273410683-1743726158=:3529306--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F5CB1787
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182341.1505227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7tc-0002qt-Rn; Wed, 10 Dec 2025 00:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182341.1505227; Wed, 10 Dec 2025 00:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT7tc-0002pQ-Op; Wed, 10 Dec 2025 00:17:32 +0000
Received: by outflank-mailman (input) for mailman id 1182341;
 Wed, 10 Dec 2025 00:17:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT7tb-0002pK-OH
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:17:31 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c593f42-d55d-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 01:17:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B6E60429C4;
 Wed, 10 Dec 2025 00:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC64BC4CEF5;
 Wed, 10 Dec 2025 00:17:26 +0000 (UTC)
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
X-Inumbo-ID: 9c593f42-d55d-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765325847;
	bh=M2tYE5GDHOfH0ckQN7SBShsPF0XGv4mFc6UJiZ0jVxg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OIHmIyxA3uRxuAfnSJCDazAq4D9qPYxu2Hr0beJjgQi5XzSbYRS/Ze4xu67Rv06E3
	 4RzKt5b7lMVpKHKKUiKSGnMjxg5+g+unHBvQlbfhPFUv1Jkr/cHw3jgLPVawiO+nmH
	 GQJZhGE31nfvAghc9ll3WN2uLv/cBlNP300b+SFceikEWvnBQahXqLwUfHp8t3ROHA
	 zhzZ4HONJB0ss6PN2xuWngbR1lYpDdzWw589Z/Go5OTgQ8KYxUJ6ib2OSpfdL69doN
	 kfirz2g5GTY/58ljAQjshF4HCn+Db/EtPfz5xlZzipfhzLBk4htPQtwhgMq7eLMVK5
	 KMjeLKNUQ65GQ==
Date: Tue, 9 Dec 2025 16:17:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 04/12] Add linux-6.12.60-x86_64
In-Reply-To: <378aa7d93dc81118044c8d376f7500c656a2afe9.1764866136.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2512091617200.19429@ubuntu-linux-20-04-desktop>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com> <378aa7d93dc81118044c8d376f7500c656a2afe9.1764866136.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-106751490-1765325847=:19429"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-106751490-1765325847=:19429
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Dec 2025, Marek Marczykowski-Górecki wrote:
> This is necessary for new Zen4 runner.
> Do not include Argo module in this build, as it isn't compatible with
> 6.12 yet.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  .gitlab-ci.yml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index b230405..184d0b3 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -85,6 +85,12 @@ linux-6.6.56-x86_64:
>      ARGO_SHA: "cf73819cacc945baca1a7421e5836d1bd481739b"
>      ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
>  
> +linux-6.12.60-x86_64:
> +  extends: .x86_64-artifacts
> +  script: ./scripts/build-linux.sh
> +  variables:
> +    LINUX_VERSION: 6.12.60
> +
>  microcode-x86:
>    extends: .x86_64-artifacts
>    script: ./scripts/x86-microcode.sh
> -- 
> git-series 0.9.1
> 
--8323329-106751490-1765325847=:19429--


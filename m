Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25138A9FD7C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 01:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971255.1359721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9XWk-0007xA-Bj; Mon, 28 Apr 2025 23:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971255.1359721; Mon, 28 Apr 2025 23:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9XWk-0007uE-8j; Mon, 28 Apr 2025 23:04:42 +0000
Received: by outflank-mailman (input) for mailman id 971255;
 Mon, 28 Apr 2025 23:04:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9XWi-0007u8-DX
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 23:04:40 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 289f6803-2485-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 01:04:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1DC7E614AE;
 Mon, 28 Apr 2025 23:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE1CC4CEE4;
 Mon, 28 Apr 2025 23:04:35 +0000 (UTC)
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
X-Inumbo-ID: 289f6803-2485-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745881477;
	bh=LN0RaTRhK7QbAaiAIJcsUoQhSypONR/v7H0Mc+tlrpM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dKw3t3bC9RISOxwN862bdLB1SL7u6TiKBvbw1QXERAJKL9k2DvIEgv4FFi5r9gCin
	 WsiNHPTTQtE6AYVvh14bUEicSY4855lq2PbCjaeV1PHXA1NHzJTg2uLEH1P6plUPAR
	 S9tqXeMFKzR+QREf0XLFWavNEN7RTfhWCR6dGANtKesvb+qEtgWnnWiDpbAkfRLucX
	 Vy+XyuOmVkGLXN0LhKMpZB8P0MERkor7K1cPN1YfOUeu6DqqbMYagWtiLJ9keB2S/i
	 F/NDvagxzlS9+Okq0nP2rmlDhLeqTM6echB0U4Xot0Q7FsaUbOq4Dup31Kq8Zt2Ljg
	 ic4m4MCD0YtYQ==
Date: Mon, 28 Apr 2025 16:04:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1 3/3] automation/eclair: tag Rule 19.1 as clean
In-Reply-To: <7316cbef75cdd0726990bcb8b37cd10f3be62185.1745624090.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504281604100.785180@ubuntu-linux-20-04-desktop>
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com> <7316cbef75cdd0726990bcb8b37cd10f3be62185.1745624090.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-482499094-1745881476=:785180"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-482499094-1745881476=:785180
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 25 Apr 2025, victorm.lira@amd.com wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
> 
> Tag MISRA C Rule 19.1 as clean to avoid regressions.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Assuming the other patches get committed and the rule is clean

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Cc: Federico Serafini <federico.serafini@bugseng.com>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 1d078d8905..dab3c51faa 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -78,6 +78,7 @@ MC3A2.R17.5||
>  MC3A2.R17.6||
>  MC3A2.R18.6||
>  MC3A2.R18.8||
> +MC3A2.R19.1||
>  MC3A2.R20.2||
>  MC3A2.R20.3||
>  MC3A2.R20.4||
> --
> 2.47.0
> 
--8323329-482499094-1745881476=:785180--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389BFAB06C0
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 01:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979689.1366194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDAxD-0000n7-1n; Thu, 08 May 2025 23:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979689.1366194; Thu, 08 May 2025 23:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDAxC-0000ki-Ui; Thu, 08 May 2025 23:47:02 +0000
Received: by outflank-mailman (input) for mailman id 979689;
 Thu, 08 May 2025 23:47:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXoN=XY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDAxB-0000kc-JT
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 23:47:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b621b356-2c66-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 01:46:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4ACEB5C6505;
 Thu,  8 May 2025 23:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA759C4CEE7;
 Thu,  8 May 2025 23:46:47 +0000 (UTC)
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
X-Inumbo-ID: b621b356-2c66-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746748009;
	bh=C8aqJuHxwhg7FIyDnFyEGsRNUZFnHznz67AsY9oG4vw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HDVqaqL5mFZQCpyL16IffFsqEZ3sx6AgckS5d2AZ0/KfAGDDh2W70qln9289AJo5Z
	 SaOJvHlhrt1O3aatlHbc+kO+b30OdquqY0NzSIzogcKmdJd12Dz9DEnU3hfFHEg9FA
	 sFs91P/KWRiQj3Tk19Vvmm8HuxtkYd/3ihKSM25hWsoBIqUW1t9M9q+JLEaHP6fzko
	 gAkc2YjlTSzbbT8FuJNwFnV8sQdQ2CR1Or7Lzz//VnPeSkJvnu/n54g4tLRJ6EIyra
	 bzMQnHTRtR4AcacR89oa3jQegWIQKO/PldrH6ZPm9JCrrD5FBR37gh+YrK00CP1Xe7
	 J9c5XYaxqyqag==
Date: Thu, 8 May 2025 16:46:46 -0700 (PDT)
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
Subject: Re: [PATCH v1 2/2] automation/eclair: tag Rule 13.2 as clean
In-Reply-To: <aaba25c80b365fe0177ab976579f9a4e2cc3d2c0.1746657135.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505081646311.3879245@ubuntu-linux-20-04-desktop>
References: <77f9c4cabe607ce4024013c604bc790fb629d322.1746657135.git.victorm.lira@amd.com> <aaba25c80b365fe0177ab976579f9a4e2cc3d2c0.1746657135.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2121932376-1746748009=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2121932376-1746748009=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 May 2025, victorm.lira@amd.com wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
> 
> Update ECLAIR configuration to consider Rule 13.2 as clean so as to
> avoid regressions.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Assuming the other patch is accepted:

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
> index 1d078d8905..c958d3ed59 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -63,6 +63,7 @@ MC3A2.R11.6||
>  MC3A2.R11.7||
>  MC3A2.R11.9||
>  MC3A2.R12.5||
> +MC3A2.R13.2||
>  MC3A2.R13.6||
>  MC3A2.R14.1||
>  MC3A2.R14.3||
> --
> 2.47.0
> 
--8323329-2121932376-1746748009=:3879245--


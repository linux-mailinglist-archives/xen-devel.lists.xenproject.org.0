Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFEB95DB0B
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2024 05:34:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782815.1192312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shhWu-0006jf-Vx; Sat, 24 Aug 2024 03:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782815.1192312; Sat, 24 Aug 2024 03:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shhWu-0006gW-S1; Sat, 24 Aug 2024 03:33:32 +0000
Received: by outflank-mailman (input) for mailman id 782815;
 Sat, 24 Aug 2024 03:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqP1=PX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1shhWt-0006gQ-5F
 for xen-devel@lists.xenproject.org; Sat, 24 Aug 2024 03:33:31 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a061ea65-61c9-11ef-a50a-bb4a2ccca743;
 Sat, 24 Aug 2024 05:33:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 78407A40A67;
 Sat, 24 Aug 2024 03:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28746C32781;
 Sat, 24 Aug 2024 03:33:26 +0000 (UTC)
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
X-Inumbo-ID: a061ea65-61c9-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724470406;
	bh=gcA4LnYzug7+IE1kYEzxpCit7DaURQnTehjp0JaM/EA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dHC0/126DLnwLZiAU/BfTD9Se7FqJ7Nm0tJHtcviQtnHOPNjN8RJjF1QLoNiz84QB
	 Xs6rzcYAWNAAra+rPOK0Dw49rt8tfoRXv7r6sKG3bm4Pqnysmf/00jTMQFJUKxZz6A
	 jrJG8tBDaF9DRmnhtxwoH/himlVhVcMDtvuRs0p21p26vI6NT7OtBHOXQRXzsygwRQ
	 WaJNHN7x3u+RHJzESmunlqQ5eH4/szPY7EmZpI0KR4Vf/ynV28sJEXez0Z+D3gTQyr
	 OySKdXZ8K8KqhrH3Zl3GMhM23GGvsSZHX3QERg9CNQfTyr5skJ8tM8m6wSG1j/j0Ma
	 Riyjrc1BBCt3g==
Date: Fri, 23 Aug 2024 20:33:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: fix xilinx test timeout length
In-Reply-To: <579230973e3ed60679c003ea2a708ddc6f00c1cc.1724467123.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2408232032470.3871186@ubuntu-linux-20-04-desktop>
References: <579230973e3ed60679c003ea2a708ddc6f00c1cc.1724467123.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Aug 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> The timout is too short which causes the test to sometimes fail.

I can fix the timout typo on commit

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  automation/scripts/xilinx-smoke-dom0-x86_64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index 4559e2b9ee..2b4d5f6af8 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -27,7 +27,7 @@ memory = 512
>  vif = [ "bridge=xenbr0", ]
>  disk = [ ]
>  '
> -TIMEOUT_SECONDS=200
> +TIMEOUT_SECONDS=300
> 
>  # Select test variant.
>  if [ "${TEST}" = "ping" ]; then
> --
> 2.37.6
> 


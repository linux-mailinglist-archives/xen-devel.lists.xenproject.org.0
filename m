Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C1B42E0A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 02:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109225.1458983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utxhK-0007OL-QX; Thu, 04 Sep 2025 00:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109225.1458983; Thu, 04 Sep 2025 00:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utxhK-0007Mf-Nk; Thu, 04 Sep 2025 00:19:30 +0000
Received: by outflank-mailman (input) for mailman id 1109225;
 Thu, 04 Sep 2025 00:19:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=axuo=3P=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1utxhJ-0007M2-Mi
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 00:19:29 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0ddbf58-8924-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 02:19:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B7BA66023D;
 Thu,  4 Sep 2025 00:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D734CC4CEE7;
 Thu,  4 Sep 2025 00:19:24 +0000 (UTC)
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
X-Inumbo-ID: d0ddbf58-8924-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756945165;
	bh=buP0pAYK8ZTSCuwJhINSgrZ4mwyeWN3niJRLzi3L7ok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HuGjvAPAXQx3SwCRVhAke+60JfMEDZS0XGduqI9Jv/iEwdAZ8mlc9F5Fsxb8TDulP
	 ycN88zfcBUGSHzQOcaQvFk8pC9V4WNmWhx/L2x+eIM6gpW6gGB+S1cLnkZrY1tXZPz
	 KF/i6JHqCmE8G2iUprvvDIuCPZSB6KZYZ1033LLzSFSy2ZWo9hpf77d0O/siBYD/UJ
	 yr13qRtDJMXDYsgmvYVrH09tZQMRupQsie8z8jW2SeSBi9B8g1eOVUYhaa3chDoOKR
	 wCEDQsQE0aravoFc8qMdKKJB3O+ml8iCiaYLiMxMY7rlCagZUmj1RkRpd5VCEplp7u
	 rRbV89B5EnZTg==
Date: Wed, 3 Sep 2025 17:19:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 2/2] automation: edit expect script to separate error
 message lines
In-Reply-To: <be9b59f220f4ad1735e660fa89b96726dc504416.1756834803.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509031719170.1405870@ubuntu-linux-20-04-desktop>
References: <729708b7e6c1815e7ba9b712f6c847e0a0374fd9.1756834803.git.victorm.lira@amd.com> <be9b59f220f4ad1735e660fa89b96726dc504416.1756834803.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Sep 2025, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> The errors can happen in the middle of a console line which causes the message
> to appear at the end of the current line.
> 
> Prepend a newline to clearly separate the error line.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> example of the problem:
>  - https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/11220478458
>  - line 652
> ---
> pipeline:
>  - https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2017775449
> ---
> Cc: Doug Goldstein <cardoe@cardoe.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  automation/scripts/console.exp | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
> index fc80513dfb..e27886bbef 100755
> --- a/automation/scripts/console.exp
> +++ b/automation/scripts/console.exp
> @@ -35,8 +35,8 @@ expect_after {
>      -re "(.*)\r" {
>          exp_continue -continue_timer
>      }
> -    timeout {send_error "ERROR-Timeout!\n"; exit 1}
> -    eof {send_error "ERROR-EOF!\n"; exit 1}
> +    timeout {send_error "\nERROR-Timeout!\n"; exit 1}
> +    eof {send_error "\nERROR-EOF!\n"; exit 1}
>  }
> 
>  if {[info exists env(UBOOT_CMD)]} {
> --
> 2.50.GIT
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3258D027
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 00:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382611.617592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLBJl-0006dt-R9; Mon, 08 Aug 2022 22:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382611.617592; Mon, 08 Aug 2022 22:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLBJl-0006bL-OQ; Mon, 08 Aug 2022 22:33:49 +0000
Received: by outflank-mailman (input) for mailman id 382611;
 Mon, 08 Aug 2022 22:33:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8Hg=YM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oLBJk-0006bC-Nz
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 22:33:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a6194d6-176a-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 00:33:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90774B80E89;
 Mon,  8 Aug 2022 22:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075D6C433C1;
 Mon,  8 Aug 2022 22:33:43 +0000 (UTC)
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
X-Inumbo-ID: 2a6194d6-176a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659998024;
	bh=RD/Tmut2c+yNq9ahQUgZ7ov+TZ/oyJxFRs02AcWWPzk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Dcck0nf+8oypcGJWcvoyOBni7Inv7Sl5x1P0IsKOHx9NmkjVOdi6/DDZgZZV2CdAt
	 SKvgF7U5oemXO6Cx6ZUCIDQNa/b5xVhh4hfPF9H2+9zhYeKotWighBAQ/wpWXnYUCk
	 leE9VapqKvol2NJFrduM+kTDPx5oPfHIOEMEcAQ518S+2bgfNyDeoGdrO6mBiPqekP
	 a/WIVvgLof27SZlORmniB0VVdNC0UBDBig+oJv8fepeFNmZLu0HWy9CxQnC2yQlrd7
	 gr1GLRQo+brR4rFENvqiC4OPkRfrcV4cLIu8sOqlda3ARNQmFBBiZrMBdmXlbAQyn2
	 Te2fE3VaMH2yw==
Date: Mon, 8 Aug 2022 15:33:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/2] automation: Test a pv network interface under
 dom0less enhanced
In-Reply-To: <20220808183952.1888459-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208081533350.3147284@ubuntu-linux-20-04-desktop>
References: <20220808183952.1888459-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Aug 2022, Xenia Ragiadakou wrote:
> Xenia Ragiadakou (2):
>   automation: qemu-smoke-arm64: Use kernel 5.19
>   automation: qemu-smoke-arm64: Run ping test over a pv network
>     interface
> 
>  automation/gitlab-ci/build.yaml               | 11 +++++
>  automation/gitlab-ci/test.yaml                | 10 +++--
>  automation/scripts/qemu-smoke-arm64.sh        | 44 ++++++++++++++++---
>  .../kernel/5.19-arm64v8.dockerfile            | 37 ++++++++++++++++
>  4 files changed, 93 insertions(+), 9 deletions(-)
>  create mode 100644 automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


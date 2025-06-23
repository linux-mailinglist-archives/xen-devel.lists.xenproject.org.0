Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E24AE4E61
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 22:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022752.1398596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToBX-0007hX-5z; Mon, 23 Jun 2025 20:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022752.1398596; Mon, 23 Jun 2025 20:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToBX-0007fW-2r; Mon, 23 Jun 2025 20:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1022752;
 Mon, 23 Jun 2025 20:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uToBW-0007fQ-F5
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 20:54:34 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43684e37-5074-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 22:54:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CA2BE61427;
 Mon, 23 Jun 2025 20:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA099C4CEEA;
 Mon, 23 Jun 2025 20:54:30 +0000 (UTC)
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
X-Inumbo-ID: 43684e37-5074-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750712071;
	bh=FmQEeAO8+7XrfV2q4N6Vt/AhnT49JbtKC2oq733aN/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HhJti348302/vncd8V0MmKTuw9f08dDUXenRengvLzWMW3+jG9F3OAb7KxhI9PrWl
	 tiJMzhVx3WukDgvebiIYB/zicUgv3/dPkw6XrwAfDbZfe/T35mq1ofcKpLF7BJLc24
	 MkFQRPMiZKzwYo9oHHjCZ0o6opnYDN+Dpef847XaoRGIYEHNR+tCn9akOdwqgRfjWs
	 iXWqfscIAgUHh9gD9FtTNoajJ37Yq30gGnUq/5DbfG7lGYw9RH1NRFaQLlX+yZ1Y0b
	 alMYHINe4Sv2SEp0cOjkEeMFJgaoOZofhK8Iyqx9uS9GrHNZNJe3XvBIU8MtaUC+8j
	 2pp8Bt5AZFa+Q==
Date: Mon, 23 Jun 2025 13:54:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/6] CI: Switch x86 tests to 6.12.34 kernel
In-Reply-To: <56c63be504a72b689591b1888970fc5d340d0649.1750686195.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2506231354230.8066@ubuntu-linux-20-04-desktop>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com> <56c63be504a72b689591b1888970fc5d340d0649.1750686195.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1647492510-1750712071=:8066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1647492510-1750712071=:8066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 23 Jun 2025, Marek Marczykowski-Górecki wrote:
> This is necessary for the upcoming Zen4 runner.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Previous version posted in https://lore.kernel.org/xen-devel/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/T/#u (but actual patch didn't make it into the ML, as it contained dockerfile change...)
> ---
>  automation/gitlab-ci/test.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 842cecf71382..1b88ee5c3be7 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -21,7 +21,7 @@
>  
>  .x86-64-test-needs: &x86-64-test-needs
>    - project: xen-project/hardware/test-artifacts
> -    job: linux-6.6.56-x86_64
> +    job: linux-6.12.34-x86_64
>      ref: master
>    - project: xen-project/hardware/test-artifacts
>      job: alpine-3.18-x86_64-rootfs
> -- 
> git-series 0.9.1
> 
--8323329-1647492510-1750712071=:8066--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3043D972888
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 06:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794989.1204047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snsmj-0002lf-Mv; Tue, 10 Sep 2024 04:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794989.1204047; Tue, 10 Sep 2024 04:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snsmj-0002ix-JQ; Tue, 10 Sep 2024 04:47:25 +0000
Received: by outflank-mailman (input) for mailman id 794989;
 Tue, 10 Sep 2024 04:47:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP99=QI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1snsmi-0002Dr-DI
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 04:47:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c34d0a49-6f2f-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 06:47:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97F995C0178;
 Tue, 10 Sep 2024 04:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7F8C4CEC3;
 Tue, 10 Sep 2024 04:47:18 +0000 (UTC)
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
X-Inumbo-ID: c34d0a49-6f2f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725943639;
	bh=84Py3Ubl6ucJia/sBOmQq39Px1f7reDOEFrLCP+cRqE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nVjjOaMSZtm2JFFB44vz4OGIHDaCuQ4G2qe+AfVYEcc7x4sI0Jv0Nbtw4P44A4jUb
	 wa9nL5lFg9YoPBjYhkONMiQjcuBMq7d2tqvjg361+rk3zan7O2qFeFWvJnCMFtppVH
	 614YnZ6ge6QPvupFxFAE9C46ToV7v9RJZrs+FJHtt9+7+WaWaaCBSSsyj3aGQdIsy/
	 dvyXBRnpKwnrilPBH/psHXxHu358tihTQ+IAnYkJ/Z0NZ3qkG5PCuQso8EfNv0YO7J
	 WetS7NjaTvLicQRMgrwfCn9E5EPjTzweEygwJY8Pe36nbuYc01dNHPY3tkMsbXm125
	 /DKCna+7TDoUQ==
Date: Mon, 9 Sep 2024 21:47:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2] automation: fix xilinx test console settings
In-Reply-To: <31253c0d35b2d238b31b197379decef013a1e63a.1725925821.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2409092147050.3672@ubuntu-linux-20-04-desktop>
References: <31253c0d35b2d238b31b197379decef013a1e63a.1725925821.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Sep 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> The test showed unreliable behavior due to unsupported console settings.
> Update the baud rate used to connect to the UART.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes v2:
> - restore I/O port address
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  automation/gitlab-ci/test.yaml                 | 2 +-
>  automation/scripts/xilinx-smoke-dom0-x86_64.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 8857bc56049b..09706894cf3f 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -103,7 +103,7 @@
>    variables:
>      CONTAINER: ubuntu:xenial-xilinx
>      LOGFILE: xilinx-smoke-x86_64.log
> -    XEN_CMD_CONSOLE: "console=com2 com2=115200,8n1,0x2F8,4"
> +    XEN_CMD_CONSOLE: "console=com2 com2=57600,8n1,0x2F8,4"
>      TEST_BOARD: "crater"
>      TEST_TIMEOUT: 1000
>    artifacts:
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index ef6e1361a95c..7027f083bafe 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -129,7 +129,7 @@ sleep 5
>  sh /scratch/gitlab-runner/${TEST_BOARD}.sh 1
>  sleep 5
>  set +e
> -stty -F ${SERIAL_DEV} 115200
> +stty -F ${SERIAL_DEV} 57600
> 
>  # Capture test result and power off board before exiting.
>  export PASSED="${PASS_MSG}"
> --
> 2.25.1
> 


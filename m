Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C179724F6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 00:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794905.1203941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snmZz-0005aC-Ll; Mon, 09 Sep 2024 22:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794905.1203941; Mon, 09 Sep 2024 22:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snmZz-0005Yh-JD; Mon, 09 Sep 2024 22:09:51 +0000
Received: by outflank-mailman (input) for mailman id 794905;
 Mon, 09 Sep 2024 22:09:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAp4=QH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1snmZy-0005Yb-T4
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 22:09:50 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 387dd1c9-6ef8-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 00:09:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 12C7BA41D7A;
 Mon,  9 Sep 2024 22:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78180C4CEC5;
 Mon,  9 Sep 2024 22:09:42 +0000 (UTC)
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
X-Inumbo-ID: 387dd1c9-6ef8-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725919784;
	bh=6rij53v4Po8Gry3SN/2X0eM7jLIAqOEYO+wnLfmPlGc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RR27nXsBaO8l8t0lBCepCSRrJvZJ3+bWAzE7ZVKCeLD3bvT9WzDYJf+e0arjXxx/N
	 63xNYWd0oAec8RlTyfjVUMXQTdOfg9ZqDSwJPpHDIfFW1zBXe/FJxAHMbDikGXRD1R
	 w20zmU74MnD77f4vG0+HmNcD0EHPvbTXssdkapFyjDXS38CYXfXXLbS1BzYqTMprYx
	 /fV5mJV1JJgbMR9Nqy8CuSMbDCBMvGoSLdAWOQQ2igHky8SO+s5lGqZu/1WHsPX/Vn
	 IV1nJMoyBqUwDJhaeD5AFe37aYOF8LPlm6oIDL877u/dKlYgk8sHyhkMiZoErxMfLI
	 frPfaH6YPEpHg==
Date: Mon, 9 Sep 2024 15:09:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1] automation: fix xilinx test console settings
In-Reply-To: <a44620dab0fbdda45874c19e2c5f28eb9d181387.1725898223.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2409091508580.3672@ubuntu-linux-20-04-desktop>
References: <a44620dab0fbdda45874c19e2c5f28eb9d181387.1725898223.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Sep 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> The test showed unreliable behavior due to unsupported console settings.
> Update the baud rate and I/O port used to connect to the UART.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

The change of ioport number should not be needed. I discussed this with
Victor and he is re-running the tests just lowering the baud rate.


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
> index cecc18a0198c..35ce453475bc 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -102,7 +102,7 @@
>    variables:
>      CONTAINER: ubuntu:xenial-xilinx
>      LOGFILE: xilinx-smoke-x86_64.log
> -    XEN_CMD_CONSOLE: "console=com2 com2=115200,8n1,0x2F8,4"
> +    XEN_CMD_CONSOLE: "console=com2 com2=57600,8n1,0x2E8,4"
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


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA8695DA42
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2024 02:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782767.1192267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shezW-0004jI-R0; Sat, 24 Aug 2024 00:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782767.1192267; Sat, 24 Aug 2024 00:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shezW-0004hV-MZ; Sat, 24 Aug 2024 00:50:54 +0000
Received: by outflank-mailman (input) for mailman id 782767;
 Sat, 24 Aug 2024 00:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqP1=PX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1shezV-0004hJ-OH
 for xen-devel@lists.xenproject.org; Sat, 24 Aug 2024 00:50:53 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8403460-61b2-11ef-a50a-bb4a2ccca743;
 Sat, 24 Aug 2024 02:50:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 83204CE0B18;
 Sat, 24 Aug 2024 00:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126FEC32786;
 Sat, 24 Aug 2024 00:50:42 +0000 (UTC)
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
X-Inumbo-ID: e8403460-61b2-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724460643;
	bh=1GkRtyDN8bM58kn6rGsQqQADyq1IuKyamDCBWcBZxAM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BX2PlZw4L4e89PnL3Zjks9BMDAETODFe+tEJ+n7ALd/Gw69kwNuv4aSlzk/tSuUQC
	 7/35Z8FB9l2D0eXt0LXUb0derMXKE9i6MYTazQkIEXOwBmHkP1QtNQujG1Rqo+cmyO
	 AYIaJ2UJ98AiB/0Uw43+EDWGUCLFMVAZqIckgDwO6TfHYb+/wQnYXyOvkJBX9EuehX
	 k5gs+AfRZNGlDCaEPSWLE5lQYUQNoGmaPc9L8qX1egKc3wMFXewq+EAtsq18kruRz5
	 PXEAn4kjrHwEssWMImwqWm+YCH1BfZLjQI6qT8Ez5UpJwWJqI/rjDRtNHDa5Y1Xdbk
	 wR5/ObZMbBq/w==
Date: Fri, 23 Aug 2024 17:50:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN][PATCH v2] automation: update xilinx test scripts (tty)
In-Reply-To: <8cf7c010d8412d23d2e1da272f1103477d751037.1724451299.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2408231750320.3871186@ubuntu-linux-20-04-desktop>
References: <8cf7c010d8412d23d2e1da272f1103477d751037.1724451299.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Aug 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Update serial device names from ttyUSB* to test board specific names.
> 
> Update xilinx-smoke-dom0-x86_64 with new Xen command line console options,
> which are now set as Gitlab CI/CD variables. Abstract the directory where
> binaries are stored. Increase the timeout to match new setup.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  automation/gitlab-ci/test.yaml                |  2 ++
>  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 28 +++++++++----------
>  .../scripts/xilinx-smoke-dom0less-arm64.sh    |  5 ++--
>  3 files changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 4e74946419..3b339f387f 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -101,6 +101,8 @@
>    variables:
>      CONTAINER: ubuntu:xenial-xilinx
>      LOGFILE: xilinx-smoke-x86_64.log
> +    XEN_CMD_CONSOLE: "console=com2 com2=115200,8n1,0x2F8,4"
> +    TEST_BOARD: "crater"
>    artifacts:
>      paths:
>        - smoke.serial
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index e6e6fac6a5..4559e2b9ee 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -12,7 +12,6 @@ fatal() {
>  # Test parameter defaults.
>  TEST="$1"
>  PASS_MSG="Test passed: ${TEST}"
> -XEN_CMD_CONSOLE="console=com1 com1=115200,8n1,0x3F8,4"
>  XEN_CMD_DOM0="dom0=pvh dom0_max_vcpus=4 dom0_mem=4G"
>  XEN_CMD_XEN="sched=null loglvl=all guest_loglvl=all console_timestamps=boot"
>  XEN_CMD_EXTRA=""
> @@ -28,7 +27,7 @@ memory = 512
>  vif = [ "bridge=xenbr0", ]
>  disk = [ ]
>  '
> -TIMEOUT_SECONDS=120
> +TIMEOUT_SECONDS=200
> 
>  # Select test variant.
>  if [ "${TEST}" = "ping" ]; then
> @@ -113,27 +112,28 @@ cd ..
>  # Load software into TFTP server directory.
>  TFTP="/scratch/gitlab-runner/tftp"
>  XEN_CMDLINE="${XEN_CMD_CONSOLE} ${XEN_CMD_XEN} ${XEN_CMD_DOM0} ${XEN_CMD_EXTRA}"
> -cp -f binaries/xen ${TFTP}/pxelinux.cfg/xen
> -cp -f binaries/bzImage ${TFTP}/pxelinux.cfg/vmlinuz
> -cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/pxelinux.cfg/initrd-dom0
> +cp -f binaries/xen ${TFTP}/${TEST_BOARD}/xen
> +cp -f binaries/bzImage ${TFTP}/${TEST_BOARD}/vmlinuz
> +cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/${TEST_BOARD}/initrd-dom0
>  echo "
>  net_default_server=10.0.6.1
> -multiboot2 (tftp)/pxelinux.cfg/xen ${XEN_CMDLINE}
> -module2 (tftp)/pxelinux.cfg/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
> -module2 (tftp)/pxelinux.cfg/initrd-dom0
> +multiboot2 (tftp)/${TEST_BOARD}/xen ${XEN_CMDLINE}
> +module2 (tftp)/${TEST_BOARD}/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
> +module2 (tftp)/${TEST_BOARD}/initrd-dom0
>  boot
> -" > ${TFTP}/pxelinux.cfg/grub.cfg
> +" > ${TFTP}/${TEST_BOARD}/grub.cfg
> 
>  # Power cycle board and collect serial port output.
> -SERIAL_CMD="cat /dev/ttyUSB9 | tee smoke.serial | sed 's/\r//'"
> -sh /scratch/gitlab-runner/v2000a.sh 2
> +SERIAL_DEV="/dev/serial/${TEST_BOARD}"
> +SERIAL_CMD="cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"
> +sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2
>  sleep 5
> -sh /scratch/gitlab-runner/v2000a.sh 1
> +sh /scratch/gitlab-runner/${TEST_BOARD}.sh 1
>  sleep 5
>  set +e
> -stty -F /dev/ttyUSB9 115200
> +stty -F ${SERIAL_DEV} 115200
>  timeout -k 1 ${TIMEOUT_SECONDS} nohup sh -c "${SERIAL_CMD}"
> -sh /scratch/gitlab-runner/v2000a.sh 2
> +sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2
> 
>  set -e
> 
> diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> index 666411d6a0..18aa07f0a2 100755
> --- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> @@ -134,9 +134,10 @@ sleep 5
>  cd $START
> 
>  # connect to serial
> +SERIAL_DEV="/dev/serial/zynq"
>  set +e
> -stty -F /dev/ttyUSB0 115200
> -timeout -k 1 120 nohup sh -c "cat /dev/ttyUSB0 | tee smoke.serial | sed 's/\r//'"
> +stty -F ${SERIAL_DEV} 115200
> +timeout -k 1 120 nohup sh -c "cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"
> 
>  # stop the board
>  cd /scratch/gitlab-runner
> --
> 2.37.6
> 


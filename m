Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822239ABD99
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 07:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824423.1238563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3TWa-0005YT-JZ; Wed, 23 Oct 2024 05:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824423.1238563; Wed, 23 Oct 2024 05:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3TWa-0005WH-Gt; Wed, 23 Oct 2024 05:03:12 +0000
Received: by outflank-mailman (input) for mailman id 824423;
 Wed, 23 Oct 2024 05:03:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7t1=RT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t3TWZ-0005WB-IW
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 05:03:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16afb532-90fc-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 07:03:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7E0B25C5A9B;
 Wed, 23 Oct 2024 05:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB138C4CEC6;
 Wed, 23 Oct 2024 05:03:03 +0000 (UTC)
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
X-Inumbo-ID: 16afb532-90fc-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729659784;
	bh=taAod9pduJeb4mUVl2SwKXCGjdnNQ76NhvTXaYUhAz8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XJ/tklTb/TPes9koVkcieUB7rNUFOh0P1ysEL7Gw1vKmGZViRrt4nmAdyJgzufVTz
	 iYWzusU7JeYA+0Gx/F9rCcQiNNsKP9lBdtBg6u5TtV2PJbRYRrSmDnp6YQM/LwLXTw
	 ay9zA/uJMpmI6nryfUgBAIJMnGHXgR71k5UaKUCcG+dnXXHw8unFL5ZgQ7VV1gC55+
	 qAWDRLQD/eMAtnc5ne5bMxNfk+D5dnah+rWkyO9YQfrnXwu0hDa+vjfE+PMI3NSwHy
	 /bxj9R+8um5aeiuNwED5eN9ti+2+0aRuP6WW4F3tfHbsZILvpsEk/lxC6e+IG0AGKb
	 Typu2VgQByq3A==
Date: Tue, 22 Oct 2024 22:03:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC XEN PATCH 2/2] automation: add xilinx test (linux argo)
In-Reply-To: <17124c911858ccb2842598cd9b9b3c88c4d4dd28.1729649076.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410222155240.3833@ubuntu-linux-20-04-desktop>
References: <cover.1729649255.git.victorm.lira@amd.com> <17124c911858ccb2842598cd9b9b3c88c4d4dd28.1729649076.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1484776461-1729659390=:3833"
Content-ID: <alpine.DEB.2.22.394.2410222157140.3833@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1484776461-1729659390=:3833
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2410222157141.3833@ubuntu-linux-20-04-desktop>

On Tue, 22 Oct 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Add x86_64 hardware test that creates a Xen Argo communication
> connection between two PVH domains. In the test, dom0 creates a domU and
> listens for messages sent by the domU through Argo.
> 
> To accomplish this, build Xen with CONFIG_ARGO=y.
> 
> Update the xilinx x86_64 test script to support the new test, and add
> "sync_console" to command line to avoid an issue with console messages
> being lost.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Cc: Doug Goldstein <cardoe@cardoe.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  automation/gitlab-ci/build.yaml               |  6 ++
>  automation/gitlab-ci/test.yaml                | 16 ++++
>  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 76 +++++++++++++------
>  3 files changed, 73 insertions(+), 25 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index c2db69ecf8..f425744f8b 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -340,6 +340,12 @@ alpine-3.18-gcc-debug:
>    variables:
>      CONTAINER: alpine:3.18
>      BUILD_QEMU_XEN: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_ARGO=y
> 
>  debian-bookworm-gcc-debug:
>    extends: .gcc-x86-64-build-debug
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index b27c2be174..2d4709d393 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -192,6 +192,22 @@ xilinx-smoke-dom0-x86_64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
> 
> +xilinx-smoke-dom0-x86_64-gcc-debug-argo:
> +  extends: .xilinx-x86_64
> +  script:
> +    - ./automation/scripts/xilinx-smoke-dom0-x86_64.sh argo 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - alpine-3.18-gcc-debug
> +    - project: xen-project/people/victormlira/test-artifacts

This needs to be changed before commit

Overall this looks great, thank you for exploring this option! Much
better than before.

This patch does some nice refactoring and also add the argo test. I
would ask that you split it into two patches, the first one does the
refactoring, the second one add the argo test



> +      job: x86_64-kernel-linux-6.6.56
> +      ref: vml-tests-separate-artifacts
> +    - project: xen-project/people/victormlira/test-artifacts
> +      job: x86_64-rootfs-alpine-3.18
> +      ref: vml-tests-separate-artifacts
> +    - project: xen-project/people/victormlira/test-artifacts
> +      job: x86_64-argo-linux-6.6.56
> +      ref: vml-tests-separate-artifacts
> +
>  adl-smoke-x86-64-gcc-debug:
>    extends: .adl-x86-64
>    script:
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index 7027f083ba..f70cfdc155 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -9,6 +9,8 @@ fatal() {
>      exit 1
>  }
> 
> +WORKDIR="${PWD}"
> +
>  # Test parameter defaults.
>  TEST="$1"
>  PASS_MSG="Test passed: ${TEST}"
> @@ -24,9 +26,10 @@ kernel = "/boot/vmlinuz"
>  ramdisk = "/boot/initrd-domU"
>  extra = "root=/dev/ram0 console=hvc0"
>  memory = 512
> -vif = [ "bridge=xenbr0", ]
> -disk = [ ]
>  '
> +DOMU_CFG_EXTRA=""
> +copy_domU_files () { :; }
> +copy_dom0_files () { :; }
> 
>  # Select test variant.
>  if [ "${TEST}" = "ping" ]; then
> @@ -39,6 +42,14 @@ done
>  echo \"${DOMU_MSG}\"
>  "
>      DOM0_CMD="
> +brctl addbr xenbr0
> +brctl addif xenbr0 eth0
> +ifconfig eth0 up
> +ifconfig xenbr0 up
> +ifconfig xenbr0 192.168.0.1
> +# get domU console content into test log
> +tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
> +xl create /etc/xen/domU.cfg

This is something that should go in the refactoring patch


>  set +x
>  until grep -q \"${DOMU_MSG}\" /var/log/xen/console/guest-domU.log; do
>      sleep 1
> @@ -46,6 +57,34 @@ done
>  set -x
>  echo \"${PASS_MSG}\"
>  "
> +    DOMU_CFG_EXTRA='
> +vif = [ "bridge=xenbr0", ]
> +disk = [ ]
> +'
> +elif [ "${TEST}" = "argo" ]
> +then
> +    PASS_MSG="TEST: Message from DOMU"
> +    XEN_CMD_EXTRA="argo=1,mac-permissive=1"
> +    DOMU_CMD="
> +insmod /root/xen-argo.ko
> +until false
> +do
> +  echo \"${PASS_MSG}\"
> +  sleep 1
> +done | argo-exec -p 28333 -d 0 -- /bin/echo
> +"
> +    DOM0_CMD="
> +insmod /root/xen-argo.ko
> +xl create /etc/xen/domU.cfg
> +argo-exec -l -p 28333 -- /bin/echo
> +"
> +copy_dom0_files ()
> +{
> +    cp "${WORKDIR}/binaries/xen-argo.ko" "root/"
> +    cp -ar "${WORKDIR}/binaries/lib/"* "usr/local/lib/"
> +    cp "${WORKDIR}/binaries/argo-exec" "usr/local/bin/"
> +}
> +copy_domU_files () { copy_dom0_files; }
>  else
>      fatal "Unknown test: ${TEST}"
>  fi
> @@ -54,18 +93,18 @@ fi
>  mkdir -p rootfs
>  cd rootfs
>  tar xzf ../binaries/initrd.tar.gz
> -mkdir proc
> -mkdir run
> -mkdir srv
> -mkdir sys
> +mkdir proc run srv sys
>  rm var/run
>  echo "#!/bin/sh
> -
> +set -x
> +export LD_LIBRARY_PATH=/usr/local/lib
> +PATH=/usr/local/bin:/usr/local/sbin:\$PATH
>  ${DOMU_CMD}
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
>  echo "rc_verbose=yes" >> etc/rc.conf
>  sed -i -e 's/^Welcome/domU \0/' etc/issue
> +copy_domU_files
>  find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
>  cd ..
>  rm -rf rootfs
> @@ -74,37 +113,24 @@ rm -rf rootfs
>  mkdir -p rootfs
>  cd rootfs
>  tar xzf ../binaries/initrd.tar.gz
> -mkdir boot
> -mkdir proc
> -mkdir run
> -mkdir srv
> -mkdir sys
> +mkdir boot proc run srv sys
>  rm var/run
>  cp -ar ../binaries/dist/install/* .
>  echo "#!/bin/bash
> -
> +set -x
>  export LD_LIBRARY_PATH=/usr/local/lib
>  bash /etc/init.d/xencommons start
> -
> -brctl addbr xenbr0
> -brctl addif xenbr0 eth0
> -ifconfig eth0 up
> -ifconfig xenbr0 up
> -ifconfig xenbr0 192.168.0.1
> -
> -# get domU console content into test log
> -tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
> -xl create /etc/xen/domU.cfg
>  ${DOM0_CMD}
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
> -echo "${DOMU_CFG}" > etc/xen/domU.cfg
> +echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
>  echo "rc_verbose=yes" >> etc/rc.conf
>  echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
>  echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
>  mkdir -p var/log/xen/console
>  cp ../binaries/bzImage boot/vmlinuz
>  cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +copy_dom0_files
>  find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
>  cd ..
> 
> @@ -116,7 +142,7 @@ cp -f binaries/bzImage ${TFTP}/${TEST_BOARD}/vmlinuz
>  cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/${TEST_BOARD}/initrd-dom0
>  echo "
>  net_default_server=10.0.6.1
> -multiboot2 (tftp)/${TEST_BOARD}/xen ${XEN_CMDLINE}
> +multiboot2 (tftp)/${TEST_BOARD}/xen ${XEN_CMDLINE} sync_console
>  module2 (tftp)/${TEST_BOARD}/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
>  module2 (tftp)/${TEST_BOARD}/initrd-dom0
>  boot
> --
> 2.25.1
> 
--8323329-1484776461-1729659390=:3833--


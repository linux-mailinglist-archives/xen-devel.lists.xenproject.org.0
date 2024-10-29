Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1510F9B3F94
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 02:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827035.1241512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ajt-0003YJ-MQ; Tue, 29 Oct 2024 01:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827035.1241512; Tue, 29 Oct 2024 01:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ajt-0003WS-Ie; Tue, 29 Oct 2024 01:09:41 +0000
Received: by outflank-mailman (input) for mailman id 827035;
 Tue, 29 Oct 2024 01:09:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/BZl=RZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t5ajt-0003WM-2O
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 01:09:41 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77c00bae-9592-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 02:09:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 19853A404BE;
 Tue, 29 Oct 2024 01:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE46C4CEC3;
 Tue, 29 Oct 2024 01:09:36 +0000 (UTC)
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
X-Inumbo-ID: 77c00bae-9592-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730164176;
	bh=DKBbgUDxCNudgwRjkNKjWbJCtMVOK4dFvHqCcFJOJs0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d8Axm1gXkJnpqWqwvijk3nORngPA0aqNpKOyurH9yAxKz8jcIKe10birG63SGB/b1
	 PEiIRNDSxY/y8yhoWPi9LzyahxZ2S/aY7uC9woy89cv8ry3tD6uGYpFqV9rhz6Uzpy
	 JKx9qQ6N62YB8+BevBRDZ/Jb3oe5W1UEH0Fw7VqYQYzJmNuzTbzp3ucuzx9voGM7ke
	 ickRGKdT4h+bSXmoyx/i6gtuLIRCf0IwGXv20HQarFoW0RqQF8fKI44oQG2oWDB856
	 Xzk7tc/7tLe1WJaDEMqU5Ks9VjZ1OH2aDIH2WxodOYqLrtEFvbP+Drd08le1ZR/D3M
	 SF9HbfbO8XhAg==
Date: Mon, 28 Oct 2024 18:09:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v3] automation: add x86_64 test (linux argo)
In-Reply-To: <d477c784381a5bee7a81cdb596eed7dab353ac5c.1730158540.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410281808570.2525410@ubuntu-linux-20-04-desktop>
References: <43ef31aa-15d6-434f-82e6-dc88c2e89309@amd.com> <d477c784381a5bee7a81cdb596eed7dab353ac5c.1730158540.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Oct 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Add x86_64 hardware test that creates a Xen Argo communication
> connection between two PVH domains. In the test, dom0 creates a domU and
> listens for messages sent by the domU through Argo.
> 
> To accomplish this, build Xen with CONFIG_ARGO=y and create a CI test job.
> 
> Update the xilinx x86_64 test script to support the new test, and add
> "sync_console" to command line to avoid an issue with console messages
> being lost.
> 
> Requested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes v2:
> - update test job to use binaries from "test-artifacts" repository
> - add argo config to existing alpine build instead of separate job
> Changes v3:
> - add back CONFIG_UNSUPPORTED=y
> ---
> Cc: Doug Goldstein <cardoe@cardoe.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  automation/gitlab-ci/build.yaml               |  4 +
>  automation/gitlab-ci/test.yaml                | 16 ++++
>  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 76 +++++++++++++------
>  3 files changed, 71 insertions(+), 25 deletions(-)
> 
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 09dd9e6ccb..af2b1ceba3 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -340,6 +340,10 @@ alpine-3.18-gcc-debug:
>    variables:
>      CONTAINER: alpine:3.18
>      BUILD_QEMU_XEN: y
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_EXPERT=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_ARGO=y

Given that this is "alpine-3.18-gcc-debug" stress on -debug I think this
is OK. It would also be OK to create a separate new job.


>  debian-bookworm-gcc-debug:
>    extends: .gcc-x86-64-build-debug
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index e76a37bef3..e8f57e87bd 100644
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
> +    - project: xen-project/hardware/test-artifacts
> +      job: x86_64-kernel-linux-6.6.56
> +      ref: master
> +    - project: xen-project/hardware/test-artifacts
> +      job: x86_64-rootfs-alpine-3.18
> +      ref: master
> +    - project: xen-project/hardware/test-artifacts
> +      job: x86_64-argo-linux-6.6.56
> +      ref: master
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


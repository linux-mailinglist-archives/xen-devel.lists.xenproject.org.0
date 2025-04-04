Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932EFA7B51B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 02:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937649.1338571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VD7-00088P-Jc; Fri, 04 Apr 2025 00:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937649.1338571; Fri, 04 Apr 2025 00:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VD7-00085w-Gc; Fri, 04 Apr 2025 00:47:05 +0000
Received: by outflank-mailman (input) for mailman id 937649;
 Fri, 04 Apr 2025 00:47:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0VD5-00085o-VB
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 00:47:03 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 528182d1-10ee-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 02:47:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7FD0B614B8;
 Fri,  4 Apr 2025 00:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A17C4CEE9;
 Fri,  4 Apr 2025 00:47:00 +0000 (UTC)
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
X-Inumbo-ID: 528182d1-10ee-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743727621;
	bh=MsdkSfDvJ/AGNv5LUApFtHfsK8sANXruFfeCJTaq56A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V0YxrgA4/4d5iCwHBztGdKKLCwUk8eaGYA9wqD3imKROY9jrCMyIEW1rhwbXLP7jq
	 bTlZTVAwScGAsLHzeI2I+J1h9tul0Qeuc1Fzx882pv0Lw/AXWmueSbb/oiJHzxcVn9
	 9HyPaYJN6uaH75nlYKMNhSyaU2et7DTHt38GeQS0KVoK/QdO74ojZ8jFqMq5ChepbS
	 ESCvvbms2pT5Ll78S2yfxPZF5BwNsrmGULHz7VDtBOmHyL34rbrkKUYoxd3pXsEbdn
	 WodWLL06jHZUt8x0m/giRGrPWsHZnpiSm52gt8yhB3xj9dfu/fbLf4aE12uVPmJiiN
	 6RfDx4sywnFgQ==
Date: Thu, 3 Apr 2025 17:46:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 10/11] ci: add AMD Zen 4 HW runner
In-Reply-To: <5d80b0abf5979f5238781099a22a418b744e3315.1743678257.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2504031746270.3529306@ubuntu-linux-20-04-desktop>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com> <5d80b0abf5979f5238781099a22a418b744e3315.1743678257.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-512275910-1743727621=:3529306"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-512275910-1743727621=:3529306
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Apr 2025, Marek Marczykowski-Górecki wrote:
> This is AMD Ryzen 5 7640U in Framework Laptop AMD.
> It has several things different than the other runners.
> First of all, the console is using XHCI debug capability.
> And then, this system doesn't have normal wired ethernet. But is has one
> on USB, and this one is used for booting. For this, enable
> CONFIG_USB_RTL8152 in the Linux build.
> 
> Include some basic tests, plus PCI passthrough.
> 
> This machine doesn't support S3. S0ix pretends to be working with
> Qubes's dom0 (kernel + userspace), but it hangs on suspend with Alpine
> used in test. But even when it doesn't hang, it doesn't really reach
> deep sleep, so skip this test for now here.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Requires containers rebuild, especially tests-artifacts/kernel/6.12.21.
> 
> Do not apply yet, until issues found by those tests are fixed. That
> would be at least third issue found using this system, so lets have it
> in CI.

I'd prefer to wait 1 week before committing. In the meantime:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
>  automation/gitlab-ci/test.yaml                       | 56 +++++++++++++-
>  automation/tests-artifacts/kernel/6.12.21.dockerfile |  2 +-
>  2 files changed, 58 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index a13dd040bd26..feb2dd10ab30 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -188,6 +188,16 @@
>    tags:
>      - qubes-hw11
>  
> +.zen4-x86-64:
> +  extends: .adl-x86-64
> +  variables:
> +    PCIDEV: "c3:00.4"
> +    PCIDEV_INTR: "MSI-X"
> +    CONSOLE_OPTS: "console=xhci dbgp=xhci@pcic1:00.3,share=yes"
> +    SUT_ADDR: test-12.testnet
> +  tags:
> +    - qubes-hw12
> +
>  # Test jobs
>  build-each-commit-gcc:
>    extends: .test-jobs-common
> @@ -479,6 +489,52 @@ zen3p-tools-tests-pvh-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
>  
> +zen4-smoke-x86-64-gcc-debug:
> +  extends: .zen4-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +zen4-smoke-x86-64-dom0pvh gcc-debug:
> +  extends: .zen4-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +zen4-pci-hvm-x86-64-gcc-debug:
> +  extends: .zen4-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +zen4-tools-tests-pv-x86-64-gcc-debug:
> +  extends: .zen4-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
> +  artifacts:
> +    reports:
> +      junit: tests-junit.xml
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +zen4-tools-tests-pvh-x86-64-gcc-debug:
> +  extends: .zen4-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
> +  artifacts:
> +    reports:
> +      junit: tests-junit.xml
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
>  qemu-smoke-dom0-arm64-gcc:
>    extends: .qemu-arm64
>    script:
> diff --git a/automation/tests-artifacts/kernel/6.12.21.dockerfile b/automation/tests-artifacts/kernel/6.12.21.dockerfile
> index d7d34031cab5..4e0a68ec61eb 100644
> --- a/automation/tests-artifacts/kernel/6.12.21.dockerfile
> +++ b/automation/tests-artifacts/kernel/6.12.21.dockerfile
> @@ -19,6 +19,7 @@ RUN apt-get update && \
>          flex \
>          bison \
>          libelf-dev \
> +        libssl-dev \
>          && \
>      apt-get autoremove -y && \
>      apt-get clean && \
> @@ -33,6 +34,7 @@ RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSI
>      scripts/config --enable BRIDGE && \
>      scripts/config --enable IGC && \
>      scripts/config --enable TUN && \
> +    scripts/config --enable USB_RTL8152 && \
>      cp .config .config.orig && \
>      cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
>      make -j$(nproc) bzImage && \
> -- 
> git-series 0.9.1
> 
--8323329-512275910-1743727621=:3529306--


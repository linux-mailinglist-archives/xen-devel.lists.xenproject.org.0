Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEBB7FE7AB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 04:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644382.1005287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XlS-0008UM-95; Thu, 30 Nov 2023 03:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644382.1005287; Thu, 30 Nov 2023 03:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8XlS-0008SE-6H; Thu, 30 Nov 2023 03:30:58 +0000
Received: by outflank-mailman (input) for mailman id 644382;
 Thu, 30 Nov 2023 03:30:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8XlR-0008S6-6J
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 03:30:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de090048-8f30-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 04:30:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCBAD6190B;
 Thu, 30 Nov 2023 03:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9C5C433C7;
 Thu, 30 Nov 2023 03:30:52 +0000 (UTC)
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
X-Inumbo-ID: de090048-8f30-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701315053;
	bh=nXnOQZe/e/wXpCVk0mtiepuNjWeXigfCkoSPRbU8F3k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RulUvwTxKUZs4pU/JumlSr1U1QnsEsQYd3TTGDrnt4+2ITc8oZeQRrHzotrLOmfA3
	 iE46/5L0yY34we8BkX9KKF1BD4wfdwiCf+BNkn46V2l03Rh9Gol9TYGpGUpVbpmusd
	 SHx+s1CMBiR+qMOuz5ZO0gcSqJTQSpXkfrJB9w7a2vFXuXfbsDVtbBeMFzM7cS+5y4
	 677rDF7o/J1JQxdKYmD0IebbEtlgD3yp2nYcqZdHTegu7RF3WHepVS/GHDb/lL6j6Z
	 EJOoxI4v2Y8H2UV1heVrvsvgp9kTpgCsX0PL3nGxJMyY9HUsr1+vW6IrtQiOvPXGt6
	 MvhMd8cPay6WA==
Date: Wed, 29 Nov 2023 19:30:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 4/6] automation: switch to a wifi card on ADL system
In-Reply-To: <9f18111c2d48b0715837789fc905d9e7b2a1ef0c.1700790421.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2311291929040.3533093@ubuntu-linux-20-04-desktop>
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com> <9f18111c2d48b0715837789fc905d9e7b2a1ef0c.1700790421.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1207037616-1701315053=:3533093"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1207037616-1701315053=:3533093
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 24 Nov 2023, Marek Marczykowski-Górecki wrote:
> Switch to a wifi card that has registers on a MSI-X page. This tests the
> "x86/hvm: Allow writes to registers on the same page as MSI-X table"
> feature. Switch it only for HVM test, because MSI-X adjacent write is
> not supported on PV.
> 
> This requires also including drivers and firmware in system for tests.
> Remove firmware unrelated to the test, to not increase initrd size too
> much (all firmware takes over 100MB compressed).
> And finally adjusts test script to handle not only eth0 as a test device,
> but also wlan0 and connect it to the wifi network.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This needs two new gitlab variables: WIFI_HW2_SSID and WIFI_HW2_PSK. I'll
> provide them in private.
> 
> This change requires rebuilding test containers.
> 
> This can be applied only after QEMU change is committed. Otherwise the
> test will fail.
> ---
>  automation/gitlab-ci/test.yaml                      | 4 ++++
>  automation/scripts/qubes-x86-64.sh                  | 7 +++++++
>  automation/tests-artifacts/alpine/3.18.dockerfile   | 7 +++++++
>  automation/tests-artifacts/kernel/6.1.19.dockerfile | 2 ++
>  4 files changed, 20 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 6aabdb9d156f..931a8fb28e1d 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -195,6 +195,10 @@ adl-pci-pv-x86-64-gcc-debug:
>  
>  adl-pci-hvm-x86-64-gcc-debug:
>    extends: .adl-x86-64
> +  variables:
> +    PCIDEV: "00:14.3"
> +    WIFI_SSID: "$WIFI_HW2_SSID"
> +    WIFI_PSK: "$WIFI_HW2_PSK"
>    script:
>      - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
>    needs:
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 7eabc1bd6ad4..60498ef1e89a 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -94,6 +94,13 @@ on_reboot = "destroy"
>      domU_check="
>  set -x -e
>  interface=eth0
> +if [ -e /sys/class/net/wlan0 ]; then
> +    interface=wlan0
> +    set +x
> +    wpa_passphrase "$WIFI_SSID" "$WIFI_PSK" > /etc/wpa_supplicant.conf
> +    set -x
> +    wpa_supplicant -B -iwlan0 -c /etc/wpa_supplicant.conf
> +fi
>  ip link set \"\$interface\" up
>  timeout 30s udhcpc -i \"\$interface\"
>  pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
> diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
> index f1b4a8b7a191..b821a291fed3 100644
> --- a/automation/tests-artifacts/alpine/3.18.dockerfile
> +++ b/automation/tests-artifacts/alpine/3.18.dockerfile
> @@ -34,6 +34,13 @@ RUN \
>    apk add curl && \
>    apk add udev && \
>    apk add pciutils && \
> +  apk add wpa_supplicant && \
> +  # Select firmware for hardware tests
> +  apk add linux-firmware-other && \
> +  mkdir /lib/firmware-preserve && \
> +  mv /lib/firmware/iwlwifi-so-a0-gf-a0* /lib/firmware-preserve/ && \
> +  rm -rf /lib/firmware && \
> +  mv /lib/firmware-preserve /lib/firmware && \
>    \
>    # Xen
>    cd / && \
> diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
> index 3a4096780d20..84ed5dff23ae 100644
> --- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
> +++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
> @@ -32,6 +32,8 @@ RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSI
>      make xen.config && \
>      scripts/config --enable BRIDGE && \
>      scripts/config --enable IGC && \
> +    scripts/config --enable IWLWIFI && \
> +    scripts/config --enable IWLMVM && \
>      cp .config .config.orig && \
>      cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
>      make -j$(nproc) bzImage && \
> -- 
> git-series 0.9.1
> 
--8323329-1207037616-1701315053=:3533093--


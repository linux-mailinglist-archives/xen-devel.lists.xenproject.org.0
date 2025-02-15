Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E03A369FF
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 01:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889229.1298422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj67N-0004f5-UL; Sat, 15 Feb 2025 00:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889229.1298422; Sat, 15 Feb 2025 00:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj67N-0004cz-Q3; Sat, 15 Feb 2025 00:33:13 +0000
Received: by outflank-mailman (input) for mailman id 889229;
 Sat, 15 Feb 2025 00:33:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTp2=VG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj67M-0004ct-3D
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 00:33:12 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f016c6e-eb34-11ef-9aa4-95dc52dad729;
 Sat, 15 Feb 2025 01:33:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EE9E9A44B89;
 Sat, 15 Feb 2025 00:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD61C4CED1;
 Sat, 15 Feb 2025 00:33:09 +0000 (UTC)
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
X-Inumbo-ID: 6f016c6e-eb34-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739579589;
	bh=ofsm/58qv99//7uxF4dMTJt7pBD6LWjNgHHi19ov5Bc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H2DjIbYUm6GPrQ3+7WIb/LN+doWkyVsNMk4DwLFQKBkfkKUk/549W1xFhky570udv
	 E/wotn8lPioChlsRO27qCnCogTaUJLMenPXi485rJsvi63/2x2CE4liYM7dBj03zmN
	 hQIvqKsH6N5KjuondpkPncqXQ613DEXZMpuiTapFO6CWm39Xe34d094zqkTmuF9CpQ
	 sc9OPTfRMX76ivPVJAq/HPeIRDu9ajpWolDR/bc1HUciHY4aY8JuwjqpCtt5I7dNU+
	 nFddMUe59fuJVovBJOXw1WLUHpd5t4wKCH7TYQSFvo2nsYM1p8lcmSxcWdphDwaYc4
	 fxt2YU+SrhJtw==
Date: Fri, 14 Feb 2025 16:33:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 4/4] automation: add tools/tests jobs on the AMD Zen3+
 runner too
In-Reply-To: <82cb819ef4d54705b3a79ce5b77003380382ebbf.1739496480.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2502141629420.3858257@ubuntu-linux-20-04-desktop>
References: <cover.36ee649a8537af1a5fb5b3c5b7ffc0d8a1369969.1739496480.git-series.marmarek@invisiblethingslab.com> <82cb819ef4d54705b3a79ce5b77003380382ebbf.1739496480.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1733766643-1739579546=:3858257"
Content-ID: <alpine.DEB.2.22.394.2502141632330.3858257@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1733766643-1739579546=:3858257
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2502141632331.3858257@ubuntu-linux-20-04-desktop>

On Fri, 14 Feb 2025, Marek Marczykowski-Górecki wrote:
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> new in v2
> If those tests are sensitive to underlying hardware, I guess it makes
> sense to run them on other runners too. Are they?
> Similarly - does it matter if dom0 is PV or PVH for those tests? If not,
> probably better to put just one of those jobs (PV?) to save CI
> time.

It should make a difference for the vpci test probably. I think we
should keep both a PV and a PVH test of it. I think it is less important
to run them on multiple runners, but it cannot hurt.

> ---
>  automation/gitlab-ci/test.yaml | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 93632f1f9204..fc7663e3367a 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -162,6 +162,7 @@
>      PCIDEV: "01:00.0"
>      PCIDEV_INTR: "MSI-X"
>      CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi"
> +    SUT_ADDR: test-11.testnet
>    tags:
>      - qubes-hw11

Is this a spurious change?



> @@ -340,6 +341,28 @@ zen3p-pvshim-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
>  
> +zen3p-tools-tests-pv-x86-64-gcc-debug:
> +  extends: .zen3p-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
> +  artifacts:
> +    reports:
> +      junit: tests-junit.xml
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +zen3p-tools-tests-pvh-x86-64-gcc-debug:
> +  extends: .zen3p-x86-64
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
> -- 
> git-series 0.9.1
> 
--8323329-1733766643-1739579546=:3858257--


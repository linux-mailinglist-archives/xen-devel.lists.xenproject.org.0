Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DBEA61DE5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 22:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915435.1320962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCRD-0001Vx-9b; Fri, 14 Mar 2025 21:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915435.1320962; Fri, 14 Mar 2025 21:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCRD-0001UN-71; Fri, 14 Mar 2025 21:19:27 +0000
Received: by outflank-mailman (input) for mailman id 915435;
 Fri, 14 Mar 2025 21:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIJu=WB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ttCRC-0001UH-0e
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 21:19:26 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0035919f-011a-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 22:19:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA058A4891E;
 Fri, 14 Mar 2025 21:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CC0C4CEE3;
 Fri, 14 Mar 2025 21:19:21 +0000 (UTC)
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
X-Inumbo-ID: 0035919f-011a-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741987162;
	bh=GLcAMmcXRgOWRnahbY89cFABCHyNH8QJQ7UQDUWleTQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uJTab6y6+NpSmc2pGNhyHst5XAL64KzLubrzEYAX/xQCRNA3LdI7hb0oi35zj3Sjs
	 Xemj5DrmmoP9pQtZQpDDO1PwV57Ln1O4bo83jQ7KavjB99bFcPrgyZPI1+V0PxAiYl
	 DCAM5J+Fva25MAnkD0O0vnAQAJhI4A8wKgGdINVbmYh2y9zaxTrIJ3TzE2dIg//sob
	 tQjesYJznOZFcXWk1vhyqXlHhWmFXj4x5nT5KEfZS9gppivdDDv1x0tqVybpydRw5p
	 +/0dDRQyB7Fd5JR+hgbyAtjyhbbaGKEqZ30cD05uqm7Dq94fHgbC90Ki5xLHIXIBfU
	 jRjziG8JxLRiQ==
Date: Fri, 14 Mar 2025 14:19:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] ci: add yet another HW runner
In-Reply-To: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-814727070-1741987161=:3477110"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-814727070-1741987161=:3477110
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 14 Mar 2025, Marek Marczykowski-Górecki wrote:
> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
> 
> This one has working S3, so add a test for it here.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> The suspend test added here currently fails on staging[1], but passes on
> staging-4.19[2]. So the regression wants fixing before committing this
> patch.

We could commit the patch now without the s3 test.

I don't know what the x86 maintainers think about fixing the suspend
bug, but one idea would be to run a bisection between 4.20 and 4.19.


> For this to work, the runner needs to be added to relevant repositories
> (especially hardware/xen one). Somebody with appropriate access need to
> go to Settings->CI/CD->Runners and click "enable for this project" on
> hal9001 runner.

I did that now


> [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
> [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
> ---
>  automation/gitlab-ci/test.yaml | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 9530e36e9aaa..6b8e1b830e3d 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -155,6 +155,16 @@
>    tags:
>      - qubes-hw2
>  
> +.zen2-x86-64:
> +  # it's really similar to the above
> +  extends: .adl-x86-64
> +  variables:
> +    PCIDEV: "01:00.0"
> +    PCIDEV_INTR: "MSI-X"
> +    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi,04:00.0"
> +  tags:
> +    - qubes-hw1
> +
>  .zen3p-x86-64:
>    # it's really similar to the above
>    extends: .adl-x86-64
> @@ -301,6 +311,22 @@ adl-tools-tests-pvh-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
>  
> +zen2-smoke-x86-64-gcc-debug:
> +  extends: .zen2-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +zen2-suspend-x86-64-gcc-debug:
> +  extends: .zen2-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
>  zen3p-smoke-x86-64-gcc-debug:
>    extends: .zen3p-x86-64
>    script:
> -- 
> 2.48.1
> 
--8323329-814727070-1741987161=:3477110--


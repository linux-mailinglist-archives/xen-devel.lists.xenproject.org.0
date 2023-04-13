Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF086E1129
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 17:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520836.808879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmytG-00036u-9Q; Thu, 13 Apr 2023 15:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520836.808879; Thu, 13 Apr 2023 15:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmytG-000341-6i; Thu, 13 Apr 2023 15:29:38 +0000
Received: by outflank-mailman (input) for mailman id 520836;
 Thu, 13 Apr 2023 15:29:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pvsx=AE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pmytE-00033v-Sn
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 15:29:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe6d4212-da0f-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 17:29:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 395DE6182A;
 Thu, 13 Apr 2023 15:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1E8C433D2;
 Thu, 13 Apr 2023 15:29:32 +0000 (UTC)
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
X-Inumbo-ID: fe6d4212-da0f-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681399773;
	bh=6YdWOQ0NUZ+UngXtsJhd6s1Sck8wLHWwB86rNg5G0y8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hS+1wQQHpoNr9n7nx0QyQ5GAInVAhzMZqqUwwJMuj4fGjVQ4hNdmYqCN2ZJaU8KX0
	 3CnI9sk0LPGCMmk6gAMCziTgTtInvEKwlo5/1rBEAqZ0yiszxhH+w6K/52X08j2VjA
	 zFFr6RcweeN3DZKUVtiMd4pAl5GfBwT5wySn7gDinKL2AMstEgAJOe0dOM+78Kg3kr
	 qQvQnZluph4QqS58g0DSeJPAUnYSu13XAG5iNh8pN2lY+S9i+GSAt2RDaP/KoEvG/L
	 mzLvxKfUTzlX+lcIcg7Az7msuw3ISlo7NdMe0fqkNlQ9N1tEOesDTlTjoBPt1Besxy
	 zQjan80FY5sLw==
Date: Thu, 13 Apr 2023 08:29:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: switch ADL hw tests to debug build
In-Reply-To: <20230413122340.47233-1-marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2304130829250.15580@ubuntu-linux-20-04-desktop>
References: <20230413122340.47233-1-marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-656519186-1681399773=:15580"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-656519186-1681399773=:15580
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 13 Apr 2023, Marek Marczykowski-Górecki wrote:
> This should give a lot more useful information in case of a failure, and
> also enable some asserts for extra checks.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 0916b367ea90..d68c584269dd 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -131,21 +131,21 @@ xilinx-smoke-dom0less-arm64-gcc:
>      - *arm64-test-needs
>      - alpine-3.12-gcc-arm64
>  
> -adl-smoke-x86-64-gcc:
> +adl-smoke-x86-64-gcc-debug:
>    extends: .adl-x86-64
>    script:
>      - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
>    needs:
>      - *x86-64-test-needs
> -    - alpine-3.12-gcc
> +    - alpine-3.12-gcc-debug
>  
> -adl-suspend-x86-64-gcc:
> +adl-suspend-x86-64-gcc-debug:
>    extends: .adl-x86-64
>    script:
>      - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
>    needs:
>      - *x86-64-test-needs
> -    - alpine-3.12-gcc
> +    - alpine-3.12-gcc-debug
>  
>  qemu-smoke-dom0-arm64-gcc:
>    extends: .qemu-arm64
> -- 
> 2.39.2
> 
--8323329-656519186-1681399773=:15580--


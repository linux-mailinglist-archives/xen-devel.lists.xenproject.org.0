Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E12CB6D69
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184465.1506896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTkws-0002PE-Fy; Thu, 11 Dec 2025 17:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184465.1506896; Thu, 11 Dec 2025 17:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTkws-0002Nn-DF; Thu, 11 Dec 2025 17:59:30 +0000
Received: by outflank-mailman (input) for mailman id 1184465;
 Thu, 11 Dec 2025 17:59:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3Jk=6R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vTkwr-0002Nh-FI
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 17:59:29 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2006269c-d6bb-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 18:59:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9AD8A6013A;
 Thu, 11 Dec 2025 17:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B01C4CEF7;
 Thu, 11 Dec 2025 17:59:21 +0000 (UTC)
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
X-Inumbo-ID: 2006269c-d6bb-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765475962;
	bh=GaZVD9aPebWI0vMqK+aW1ruyJzrJ42dgK0w/aWYnols=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kLHRuWjsWTd2PYDi8DZwgijvXU7gNR8iZYvjCCEQ44YbAIfYJgx34w4g2kTAk+hXH
	 7f8iR11YLbq7bYsnZZ0D4jYrj8Xt428immNV5nGwbjGUKQSpF4tIOheQ0rAO0zuoRK
	 hi7qpDmV36MaTcsPfIEtsiwaYVbL8LSbKb5eIDAdGX2OKWQDsTbSb9huEvq3nzraNQ
	 CASWT8mtCga4AO1T0Bfq+eTWHGSSXltFkM53f17ij7cMg0mqlhVqspQxugPqEQkLZI
	 Z5eipNmfx2vyGMIZef5YU3xA21vEvCEOpgUf5p85rlEkPFJLrmIDDo1t7nN/KsF+Op
	 hRriVdWcP4nDw==
Date: Thu, 11 Dec 2025 09:59:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] CI/eclair: Rename the eclair-* jobs to *-all and *-amd
In-Reply-To: <20251211161339.2296433-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2512110959140.17367@ubuntu-linux-20-04-desktop>
References: <20251211161339.2296433-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2087775641-1765475886=:17367"
Content-ID: <alpine.DEB.2.22.394.2512110958100.17367@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2087775641-1765475886=:17367
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2512110958101.17367@ubuntu-linux-20-04-desktop>

On Thu, 11 Dec 2025, Andrew Cooper wrote:
> The *-safety jobs are AMD's configuration specifically, and other
> configurations will likely be different.
> 
> Give the un-suffixed job an *-all suffix to make it clearer what they're
> doing.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is straightforward:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I like this and I think we should also rename eclair-x86_64:on-schedule
and eclair-ARM64:on-schedule for extra clarity. For instance:

eclair-x86_64-allrules:on-schedule
eclair-ARM64-allrules:on-schedule

It could be in this patch but also in a different patch.


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  automation/gitlab-ci/analyze.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 20cabbe5f70c..37a941bebbae 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -39,7 +39,7 @@
>        allow_failure: true
>      - !reference [.eclair-analysis, rules]
>  
> -eclair-x86_64:
> +eclair-x86_64-all:
>    extends: .eclair-analysis:triggered
>    variables:
>      LOGFILE: "eclair-x86_64.log"
> @@ -58,7 +58,7 @@ eclair-x86_64-testing:
>        when: always
>      - !reference [.eclair-analysis:triggered, rules]
>  
> -eclair-x86_64-safety:
> +eclair-x86_64-amd:
>    extends: eclair-x86_64
>    tags:
>      - eclair-analysis-safety
> @@ -99,7 +99,7 @@ eclair-x86_64-safety:
>        when: always
>      - !reference [.eclair-analysis:triggered, rules]
>  
> -eclair-ARM64:
> +eclair-ARM64-all:
>    extends: .eclair-analysis:triggered
>    variables:
>      LOGFILE: "eclair-ARM64.log"
> @@ -118,7 +118,7 @@ eclair-ARM64-testing:
>        when: always
>      - !reference [.eclair-analysis:triggered, rules]
>  
> -eclair-ARM64-safety:
> +eclair-ARM64-amd:
>    extends: eclair-ARM64
>    tags:
>      - eclair-analysis-safety
> 
> base-commit: abac3b76d20ebecb339cb41bb8982796bf1ce276
> -- 
> 2.39.5
> 
--8323329-2087775641-1765475886=:17367--


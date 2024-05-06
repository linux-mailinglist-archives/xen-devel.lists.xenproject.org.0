Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A08BD436
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 19:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717793.1120289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s42Z7-0006tL-P9; Mon, 06 May 2024 17:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717793.1120289; Mon, 06 May 2024 17:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s42Z7-0006re-MK; Mon, 06 May 2024 17:55:53 +0000
Received: by outflank-mailman (input) for mailman id 717793;
 Mon, 06 May 2024 17:55:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GMTE=MJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s42Z6-0006rY-Il
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 17:55:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0155e00-0bd1-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 19:55:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0BC046141C;
 Mon,  6 May 2024 17:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD241C116B1;
 Mon,  6 May 2024 17:55:47 +0000 (UTC)
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
X-Inumbo-ID: e0155e00-0bd1-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715018149;
	bh=EdWtqKvcYWA8XAs2OydI8w9jKT90C+jXPrvnw8usLT0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SCT1qtXiceWF3Dhbx04mBJktHjHzNOmRzzbiVFNMqRQ97Mokt6Gv6OHl0gst+bZT6
	 rlpMRZZiGIhpyAbpISR1paNrR46dN25YS4LW9TUR25GITv2cGacWJ6iB8h/3oCs0Y5
	 a1IQpGf/Ce0TGynukgKsZHYjZX46KZYAR2z1znVfEY1SmNPRz6KOgl9U9ohQc8eiyq
	 5P4jSTmyrvYDW9dYlsYVqg1mpXssVyt3z9seMcZ4Xwr4s5ssNJvG/kibFEoJnMO9TN
	 up/S3ByboXArBJahaI8R+sgMO1830HdgLFDpeKvCEravWX9sh9YhuEvW1E7UKmqXSy
	 Hu1/oZsqVXXjA==
Date: Mon, 6 May 2024 10:55:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    andrew.cooper3@citrix.com, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: unblock pipelines from
 certain repositories
In-Reply-To: <b599441c1678d11cfaa43b679bacbd5a1b886d3f.1714983088.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405061055370.1151289@ubuntu-linux-20-04-desktop>
References: <b599441c1678d11cfaa43b679bacbd5a1b886d3f.1714983088.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 May 2024, Nicola Vetrini wrote:
> Repositories under people/* only execute the analyze step if manually
> triggered, but in order to avoid blocking the rest of the pipeline
> if such step is not run, allow it to fail.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> See https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/1278550868
> for a sample pipeline with this change applied.
> ---
>  automation/gitlab-ci/analyze.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 32bf57014961..02e0ea692c66 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -31,6 +31,7 @@
>        when: never
>      - if: $WTOKEN && $CI_PROJECT_PATH =~ /^xen-project\/people\/.*$/
>        when: manual
> +      allow_failure: true
>      - !reference [.eclair-analysis, rules]
>  
>  eclair-x86_64:
> -- 
> 2.34.1
> 


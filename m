Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2EE7B3B71
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 22:44:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610709.950209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKLV-0005so-PY; Fri, 29 Sep 2023 20:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610709.950209; Fri, 29 Sep 2023 20:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmKLV-0005pc-L0; Fri, 29 Sep 2023 20:44:21 +0000
Received: by outflank-mailman (input) for mailman id 610709;
 Fri, 29 Sep 2023 20:44:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmKLU-0005pU-GJ
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 20:44:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5a8165e-5f08-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 22:44:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5A9C6204B;
 Fri, 29 Sep 2023 20:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1A3C433C7;
 Fri, 29 Sep 2023 20:44:16 +0000 (UTC)
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
X-Inumbo-ID: f5a8165e-5f08-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696020257;
	bh=mYWmJrVwdxnXz7KzjjNk/2YpYGUzKXvy2wafBy+diYg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q4DBr80iwKLQ1lE2z6H10p4D2MsQvQ6VbUPK4vIg7mUaWnFG0EkPFkWhJdP7yiW9q
	 fu8PYVpVz4f/6DUxhuNiG89ge3UuR/oxYFlO8Hht+UnfZjJx97vjypQ5if+Ty3eQbe
	 weSU7KJy8aVOCOZfjHIrNJJlTB4Bt9I3o38zI5hT3QDBjP1AQHOKMkak5K+3HI/Kaa
	 cQ273cwbhbawFieO62FzMs7lvNA7dHlStWO/Y15PyVVyGmxldF0epAfoKkp42YRsuI
	 tfxUNSKCQdK7AdyUhWf7XO0Ku+PYArJxhOv+OvI3TeT/u8T8XNv33z3QiwQhw4Z1jD
	 fM6Ct2NDII26w==
Date: Fri, 29 Sep 2023 13:44:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation/eclair: update accepted and clean
 guidelines
In-Reply-To: <b163d56b606a86a8772e97cd1938c737aeef4754.1696003647.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309291341590.2348112@ubuntu-linux-20-04-desktop>
References: <b163d56b606a86a8772e97cd1938c737aeef4754.1696003647.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1318117603-1696020195=:2348112"
Content-ID: <alpine.DEB.2.22.394.2309291344010.2348112@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1318117603-1696020195=:2348112
Content-Type: text/plain; CHARSET=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2309291344011.2348112@ubuntu-linux-20-04-desktop>

On Fri, 29 Sep 2023, Simone Ballarin wrote:
> This patch updates accepted and clean guidelines selectors.
> 
> Align accepted selector with docs/misra/rules.txt.
> Add rule 7.3 in the clean selector for ARM.
> Avoid regular expressions in all service selectors: usign them
> requires escaping dots, which make selectors hard to read.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Due to Xen being in code freeze, I committed this patch to a private
branch. I'll merge it upstream in Xen as soon as the tree reopens.

https://gitlab.com/xen-project/people/sstabellini/xen.git for-4.19


> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 3f589fd716..78a0bc948b 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -18,7 +18,8 @@
>  #######################
>  
>  -doc="Accepted guidelines as reported in XEN/docs/misra/rules.rst"
> --service_selector={accepted_guidelines,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|MC3R1\\.D4\\.3|MC3R1\\.D4\\.7|MC3R1\\.D4\\.10|MC3R1\\.D4\\.11|MC3R1\\.D4\\.14|MC3R1\\.R1\\.1|MC3R1\\.R1\\.3|MC3R1\\.R1\\.4|MC3R1\\.R2\\.1|MC3R1\\.R2\\.6|MC3R1\\.R2\\.2|MC3R1\\.R3\\.1|MC3R1\\.R3\\.2|MC3R1\\.R4\\.1|MC3R1\\.R4\\.2|MC3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.3|MC3R1\\.R5\\.4|MC3R1\\.R5\\.6|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R7\\.1|MC3R1\\.R7\\.2|MC3R1\\.R7\\.3|MC3R1\\.R7\\.4|MC3R1\\.R8\\.1|MC3R1\\.R8\\.2|MC3R1\\.R8\\.3|MC3R1\\.R8\\.4|MC3R1\\.R8\\.5|MC3R1\\.R8\\.6|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.R8\\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.1|MC3R1\\.R9\\.2|MC3R1\\.R9\\.3|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R12\\.5|MC3R1\\.R13\\.6|MC3R1\\.R13\\.1|MC3R1\\.R14\\.1|MC3R1\\.R16\\.7|MC3R1\\.R17\\.3|MC3R1\\.R17\\.4|MC3R1\\.R17\\.6|MC3R1\\.R18\\.3|MC3R1\\.R19\\.1|MC3R1\\.R20\\.7|MC3R1\\.R20\\.13|MC3R1\\.R20\\.14|MC3R1\\.R21\\.13|MC3R1\\.R21\\.17|MC3R1\\.R21\\.18|MC3R1\\.R21\\.19|MC3R1\\.R21\\.20|MC3R1\\
 .R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R22\\.5|MC3R1\\.R22\\.6)$"
> +-service_selector={accepted_guidelines,
> +    "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.3||MC3R1.D4.7||MC3R1.D4.10||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.1||MC3R1.R2.2||MC3R1.R2.6||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.3||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.2||MC3R1.R8.3||MC3R1.R8.4||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.1||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R10.1||MC3R1.R10.2||MC3R1.R10.3||MC3R1.R10.4||MC3R1.R12.5||MC3R1.R13.6||MC3R1.R13.1||MC3R1.R14.1||MC3R1.R14.3||MC3R1.R16.7||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R18.3||MC3R1.R19.1||MC3R1.R20.7||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.17||MC3R1.R21.18||MC3R1.R21.19||MC3R1.R21.20||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
>  }
>  -doc="All reports of accepted guidelines are tagged as accepted."
>  -reports+={status:accepted,"service(accepted_guidelines)"}
> @@ -29,17 +30,17 @@
>  
>  -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
>  
> --service_selector={clean_guidelines_common,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|MC3R1\\.D4\\.11|MC3R1\\.D4\\.14|MC3R1\\.R1\\.1|MC3R1\\.R1\\.3|MC3R1\\.R1\\.4|MC3R1\\.R2\\.2|MC3R1\\.R3\\.1|MC3R1\\.R3\\.2|MC3R1\\.R4\\.1|MC3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.4|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R7\\.1|MC3R1\\.R8\\.1|MC3R1\\.R8\\.5|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.R8\\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.2|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R12\\.5|MC3R1\\.R17\\.3|MC3R1\\.R17\\.4|MC3R1\\.R17\\.6|MC3R1\\.R21\\.13|MC3R1\\.R21\\.19|MC3R1\\.R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R22\\.5|MC3R1\\.R22\\.6)$"
> +-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
>  }
>  
>  -setq=target,getenv("XEN_TARGET_ARCH")
>  
>  if(string_equal(target,"x86_64"),
> -    service_selector({"additional_clean_guidelines","^(MC3R1\\.D4\\.3)$"})
> +    service_selector({"additional_clean_guidelines","MC3R1.D4.3"})
>  )
>  
>  if(string_equal(target,"arm64"),
> -    service_selector({"additional_clean_guidelines","^(MC3R1\\.R5\\.3|MC3R1\\.R7\\.2|MC3R1\\.R8\\.6|MC3R1\\.R9\\.3)$"})
> +    service_selector({"additional_clean_guidelines","MC3R1.R5.3||MC3R1.R7.2||MC3R1.R7.3||MC3R1.R8.6||MC3R1.R9.3"})
>  )
>  
>  -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> -- 
> 2.34.1
> 
--8323329-1318117603-1696020195=:2348112--


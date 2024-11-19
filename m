Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9FC9D2A50
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 16:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840678.1256181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDQcz-0006iR-EE; Tue, 19 Nov 2024 15:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840678.1256181; Tue, 19 Nov 2024 15:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDQcz-0006fl-Be; Tue, 19 Nov 2024 15:58:57 +0000
Received: by outflank-mailman (input) for mailman id 840678;
 Tue, 19 Nov 2024 15:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGE8=SO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDQcy-0006ff-F4
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 15:58:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2be5d131-a68f-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 16:58:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4A9625C05FC;
 Tue, 19 Nov 2024 15:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B7DC4CED0;
 Tue, 19 Nov 2024 15:58:49 +0000 (UTC)
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
X-Inumbo-ID: 2be5d131-a68f-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjJiZTVkMTMxLWE2OGYtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDMxOTMzLjEyOTE3Nywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732031931;
	bh=noXrjoKp9mRrdVhk4goMiofKEedi8RZSqzTr95AtCIw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jqZMNpVPRHaiJM7emF+IyBzssiCRApPO5oalfSSB3vUXNymL7nKqbxwwjvb6KRgzc
	 bDjdkTMoPb3RFusM0CYYcXvxX4sLIEbBXeT9vUuRz2e31xBiPA2WDf3kGzs5YRaqui
	 Wz2ZPbYiJSre/CLJq8RF+kGTgMc5AnGt3hWIfXOuh4bobqGnEW/r4hAv3wMk1QgmRi
	 s10SoSysHt4YQ6yj89KpfP9gnflnMXTkUObc3gzRTegA3XZu2J48HgUd0EzNyR2KYb
	 Crjrpe1bxWkyyADHNzCiRNefDljsIbzI7AOVuzxKNsVNf3EtkGt54N+V2vb4Zo8gyH
	 iarQ0RhKvBGFA==
Date: Tue, 19 Nov 2024 07:58:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH] MISRA: Mark Rule 8.4 as clean
In-Reply-To: <20241119130437.2681955-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2411190758100.1160299@ubuntu-linux-20-04-desktop>
References: <20241119130437.2681955-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-151164455-1732031911=:1160299"
Content-ID: <alpine.DEB.2.22.394.2411190758470.1160299@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-151164455-1732031911=:1160299
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2411190758471.1160299@ubuntu-linux-20-04-desktop>

On Tue, 19 Nov 2024, Andrew Cooper wrote:
> All violations have been fixed up, so mark it as clean.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> 
> As I've not committed "xen/bootinfo: Include declaration for
> fw_unreserved_regions()" yet, I'm very tempted to drop the churn in the arm64
> line and have this as the singular patch adjusting the clean list.
> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 7944ce2ee3b2..755ea3271fc9 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -47,6 +47,7 @@ MC3R1.R7.4||
>  MC3R1.R8.1||
>  MC3R1.R8.2||
>  MC3R1.R8.3||
> +MC3R1.R8.4||
>  MC3R1.R8.5||
>  MC3R1.R8.6||
>  MC3R1.R8.8||
> @@ -115,7 +116,7 @@ if(string_equal(target,"x86_64"),
>  )
>  
>  if(string_equal(target,"arm64"),
> -    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3R1.R8.4||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
> +    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
>  )
>  
>  -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> 
> base-commit: 3128d7248f2ad389b8e9a3e252958cbfbd1898ee
> prerequisite-patch-id: 46b8fc2e9df2fd6be1bbbd6b50463e0e15a8f94d
> prerequisite-patch-id: c122b170f57ab96fe52c37aebf1f4bb366194637
> prerequisite-patch-id: 1c2d96bf17c5da0981b6c62939d3b7cc1e05933e
> prerequisite-patch-id: b3e43902729416e18b4fada7f529b4cb02b1815e
> prerequisite-patch-id: 9cb4598ff123c3b153f50f08798ad66a849c1af6
> -- 
> 2.39.5
> 
--8323329-151164455-1732031911=:1160299--


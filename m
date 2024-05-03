Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCC28BB7EB
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 01:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716697.1118862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s320i-00056w-Hb; Fri, 03 May 2024 23:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716697.1118862; Fri, 03 May 2024 23:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s320i-00054i-Ec; Fri, 03 May 2024 23:08:12 +0000
Received: by outflank-mailman (input) for mailman id 716697;
 Fri, 03 May 2024 23:08:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s320h-00054c-Fe
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 23:08:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 019ff209-09a2-11ef-909c-e314d9c70b13;
 Sat, 04 May 2024 01:08:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72CF061A7C;
 Fri,  3 May 2024 23:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B469C116B1;
 Fri,  3 May 2024 23:08:07 +0000 (UTC)
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
X-Inumbo-ID: 019ff209-09a2-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714777688;
	bh=aze18fnjaf5ygacC22/M/ZR7vPAv6YyCbckTPisnxSA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c4F/gscEP0ZM9sN08SaDPDor6jc7WcfqIde2jKJwa09qZbirHV2CC0+fgGBMlxZMz
	 rS8VcVoT4hzbjvUv7Gv6EpmcutEknyccW+3uemZ7KHu144vIpCADBuXOsLCVaPa7jk
	 77Tz89wZ+6oMh6eORek4a3Mt4bYWN1rF9C2s8vd1qkMuyf3rHGgoTagnOGYsEvg6EZ
	 nY66Wlj+yMLRXZRxOHLqXVEpC7MQMsOz4R/YDOMzSgHAxVmLORLFHbYzbbJDoSpFJD
	 EneWced98KLQyQQBjGvzgS2QtTI+MnVDiVVz1z6X5n/D+PgGs/JJhPqWdM8SgiMXI9
	 t/0fD2zA2El/w==
Date: Fri, 3 May 2024 16:08:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation/eclair: hide reports coming from adopted
 code in scheduled analysis
In-Reply-To: <65364e87637d342b6b6ca5bd5ca256828ecb7a55.1714741931.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405031607540.1151289@ubuntu-linux-20-04-desktop>
References: <65364e87637d342b6b6ca5bd5ca256828ecb7a55.1714741931.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 May 2024, Federico Serafini wrote:
> To improve clarity and ease of navigation do not show reports related
> to adopted code in the scheduled analysis.
> Configuration options are commented out because they may be useful
> in the future.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  .../eclair_analysis/ECLAIR/analysis.ecl       | 24 +++++++++++--------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index 66ed7f952c..67be38f03c 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -4,11 +4,11 @@
>  
>  setq(data_dir,getenv("ECLAIR_DATA_DIR"))
>  setq(analysis_kind,getenv("ANALYSIS_KIND"))
> -setq(scheduled_analysis,nil)
> +# setq(scheduled_analysis,nil)
>  
> -strings_map("scheduled-analysis",500,"","^.*scheduled$",0,setq(scheduled_analysis,t))
> -strings_map("scheduled-analysis",500,"","^.*$",0)
> -map_strings("scheduled-analysis",analysis_kind)
> +# strings_map("scheduled-analysis",500,"","^.*scheduled$",0,setq(scheduled_analysis,t))
> +# strings_map("scheduled-analysis",500,"","^.*$",0)
> +# map_strings("scheduled-analysis",analysis_kind)
>  
>  -verbose
>  
> @@ -25,12 +25,16 @@ map_strings("scheduled-analysis",analysis_kind)
>  -doc="Initially, there are no files tagged as adopted."
>  -file_tag+={adopted,"none()"}
>  
> -if(not(scheduled_analysis),
> -    eval_file("adopted.ecl")
> -)
> -if(not(scheduled_analysis),
> -    eval_file("out_of_scope.ecl")
> -)
> +# if(not(scheduled_analysis),
> +#     eval_file("adopted.ecl")
> +# )
> +# if(not(scheduled_analysis),
> +#     eval_file("out_of_scope.ecl")
> +# )
> +
> +-eval_file=adopted.ecl
> +-eval_file=out_of_scope.ecl
> +
>  -eval_file=deviations.ecl
>  -eval_file=call_properties.ecl
>  -eval_file=tagging.ecl
> -- 
> 2.34.1
> 


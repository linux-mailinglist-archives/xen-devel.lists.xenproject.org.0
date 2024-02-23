Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA22A86201B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 23:54:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684962.1065260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdeQw-0001wN-Qo; Fri, 23 Feb 2024 22:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684962.1065260; Fri, 23 Feb 2024 22:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdeQw-0001u5-Ne; Fri, 23 Feb 2024 22:54:22 +0000
Received: by outflank-mailman (input) for mailman id 684962;
 Fri, 23 Feb 2024 22:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdeQv-0001sk-8u
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 22:54:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a22bd2e-d29e-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 23:54:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C684C61408;
 Fri, 23 Feb 2024 22:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC4BC433F1;
 Fri, 23 Feb 2024 22:54:17 +0000 (UTC)
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
X-Inumbo-ID: 7a22bd2e-d29e-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708728858;
	bh=lf3iFOIl9mvNIQh9fRC8B7vVoC3x2fksP2YI5SZZc2I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nsIrGW5D5sHD91RnjlAIEO1/BwqNTqgbH24dztjHy83lzBw+FhyiLi88ETt/FoKb8
	 iRXotBaLPOV6WGTf3jo6BdPmD/7f8Dv5RDdEzGhQKyqTnrz6flBl7KkIVJu76Q3gwT
	 xlV8os0vdDlj/35ZwSDnaJhJYkNvy7fzPzwb1xvwHbvgDNWCdNcaJ5eCbvU8RC47dp
	 bS8z7nCD1j1M61ZrgpWEmSg8mlPorKZe07i2pdvXlA1qKowJU0tGqwm2MJw/iS+9QH
	 N/EucOUeEO2Fwy2v1HByhEFTOeiIsEBMbSrq6fyJjVjG7pwZims6B7vEaIG0A21sKD
	 iXASdASskLPKQ==
Date: Fri, 23 Feb 2024 14:54:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/2] automation/eclair: fully deviate MISRA C:2012
 Rules 5.7 and 18.7
In-Reply-To: <1fee04ad07b03c13c44f66a20c4ee70737069650.1708677243.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402231453490.754277@ubuntu-linux-20-04-desktop>
References: <cover.1708677243.git.federico.serafini@bugseng.com> <1fee04ad07b03c13c44f66a20c4ee70737069650.1708677243.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Feb 2024, Federico Serafini wrote:
> Update ECLAIR configuration to fully deviate Rules 5.7 and 18.7
> as agreed during MISRA meeetings.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index fd32ff8a9c..02eae39786 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -107,6 +107,11 @@ number of guest paging levels."
>  -config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(file(adopted_r5_6)))"}
>  -doc_end
>  
> +-doc_begin="The project intentionally reuses tag names in order to have identifiers matching the applicable external specifications as well as established internal conventions.
> +As there is little possibility for developer confusion not resulting into compilation errors, the risk of renaming outweighs the potential advantages of compliance."
> +-config=MC3R1.R5.7,reports+={deliberate,"any()"}
> +-doc_end
> +
>  #
>  # Series 7.
>  #
> @@ -373,6 +378,15 @@ explicit comment indicating the fallthrough intention is present."
>  -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
>  -doc_end
>  
> +#
> +# Series 18.
> +#
> +
> +-doc_begin="Flexible array members are deliberately used and XEN developers are aware of the dangers related to them:
> +unexpected result when the structure is given as argument to a sizeof() operator and the truncation in assignment between structures."
> +-config=MC3R1.R18.7,reports+={deliberate, "any()"}
> +-doc_end
> +
>  #
>  # Series 20.
>  #
> -- 
> 2.34.1
> 


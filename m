Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4949B557A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 23:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827881.1242636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5uJf-0004Cm-Py; Tue, 29 Oct 2024 22:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827881.1242636; Tue, 29 Oct 2024 22:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5uJf-0004AM-NF; Tue, 29 Oct 2024 22:03:55 +0000
Received: by outflank-mailman (input) for mailman id 827881;
 Tue, 29 Oct 2024 22:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/BZl=RZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t5uJe-0004AG-R3
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 22:03:54 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad0d61b0-9641-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 23:03:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D47B6A42E8C;
 Tue, 29 Oct 2024 22:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CE4C4CECD;
 Tue, 29 Oct 2024 22:03:47 +0000 (UTC)
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
X-Inumbo-ID: ad0d61b0-9641-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NWQxOmVjMDA6OjMiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImFkMGQ2MWIwLTk2NDEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjM5NDMwLjM4OTg4LCJzZW5kZXIiOiJzc3RhYmVsbGluaUBrZXJuZWwub3JnIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730239428;
	bh=KB/d2q5MRG5kulvD4SpuhF+xUABxQvtE1KX66zioCl0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c4eL6aWMuhng0MqEyYZ/GP3WUyNskWBCorR5rAibi8XFuQyobyNGV4jRexgOVmLQZ
	 akI1taPSa2KDoPt19yLCl43jwt6ABheetnjnSuoElKvjB3sNB0WPyMwbwFNHwRqKlW
	 kytdMNLk2zI06sdbuvhHmjfj3J1zKmmYXjPSgIqHkmbzkyF5Ap4g9d2XjtsyW2yOB3
	 q/JEKuc7iRYj0ufc/YJAvIpnTX8h892xOlnuuPscIdli9yfiB4W2FUbUOTA0NGHFut
	 vSsQG0NzKYY1tAm4ORRUslu/TtBQs0ouTrcffk4YIYAvtJdGUdUSiQso9CPdSM27G7
	 F7J5jiHsvQrBw==
Date: Tue, 29 Oct 2024 15:03:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation/eclair: monitor Rules 11.2 and 18.1 and
 update configuration
In-Reply-To: <b513d40f6195226b421012e0cf42bb14279cd0b3.1730196105.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2410291502440.2525410@ubuntu-linux-20-04-desktop>
References: <b513d40f6195226b421012e0cf42bb14279cd0b3.1730196105.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Oct 2024, Federico Serafini wrote:
> Add Rule 11.2 and Rule 18.1 to the monitored set.
> 
> Tag Rule 7.3 as clean.
> Tag Rule 11.2 and Rule 20.7 as clean only for arm.
> 
> Rule 2.2, Rule 9.5 and Directive 4.12 are not accepted:
> do not enable them and do not tag them as clean.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

This patch just ensures that monitored.ecl and tagging.ecl reflect
rules.rst.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

One one comment below


> ---
>  automation/eclair_analysis/ECLAIR/monitored.ecl | 5 ++---
>  automation/eclair_analysis/ECLAIR/tagging.ecl   | 7 +++----
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 4d9ef1bd83..4e1deef7a7 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -6,13 +6,11 @@
>  -enable=MC3R1.D4.7
>  -enable=MC3R1.D4.10
>  -enable=MC3R1.D4.11
> --enable=MC3R1.D4.12
>  -enable=MC3R1.D4.14
>  -enable=MC3R1.R1.1
>  -enable=MC3R1.R1.3
>  -enable=MC3R1.R1.4
>  -enable=MC3R1.R2.1
> --enable=MC3R1.R2.2
>  -enable=MC3R1.R2.6
>  -enable=MC3R1.R3.1
>  -enable=MC3R1.R3.2
> @@ -43,10 +41,10 @@
>  -enable=MC3R1.R9.2
>  -enable=MC3R1.R9.3
>  -enable=MC3R1.R9.4
> --enable=MC3R1.R9.5
>  -enable=MC3R1.R10.1
>  -enable=MC3R1.R10.2
>  -enable=MC3R1.R11.1
> +-enable=MC3R1.R11.2
>  -enable=MC3R1.R11.7
>  -enable=MC3R1.R11.8
>  -enable=MC3R1.R11.9
> @@ -66,6 +64,7 @@
>  -enable=MC3R1.R17.4
>  -enable=MC3R1.R17.5
>  -enable=MC3R1.R17.6
> +-enable=MC3R1.R18.1
>  -enable=MC3R1.R18.2
>  -enable=MC3R1.R18.6
>  -enable=MC3R1.R18.8
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 76032b1fe1..e1d4ed012a 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -28,7 +28,6 @@ MC3R1.D4.14||
>  MC3R1.R1.1||
>  MC3R1.R1.3||
>  MC3R1.R1.4||
> -MC3R1.R2.2||
>  MC3R1.R2.6||
>  MC3R1.R3.1||
>  MC3R1.R3.2||
> @@ -42,6 +41,7 @@ MC3R1.R6.1||
>  MC3R1.R6.2||
>  MC3R1.R7.1||
>  MC3R1.R7.2||
> +MC3R1.R7.3||
>  MC3R1.R7.4||
>  MC3R1.R8.1||
>  MC3R1.R8.2||
> @@ -54,7 +54,6 @@ MC3R1.R8.14||
>  MC3R1.R9.2||
>  MC3R1.R9.3||
>  MC3R1.R9.4||
> -MC3R1.R9.5||
>  MC3R1.R10.2||
>  MC3R1.R11.6||
>  MC3R1.R11.7||
> @@ -109,11 +108,11 @@ MC3R1.R22.10"
>  -setq=target,getenv("XEN_TARGET_ARCH")
>  
>  if(string_equal(target,"x86_64"),
> -    service_selector({"additional_clean_guidelines","MC3R1.D4.3"})
> +    service_selector({"additional_clean_guidelines","none()"})

This should also added to the commit message, also D4.3 is not accepted.
I can add it to the commit message on commit.


>  )
>  
>  if(string_equal(target,"arm64"),
> -    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3R1.R7.3||MC3R1.R16.3||MC3R1.R16.6"})
> +    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.3||MC3R1.R16.6||MC3R1.R20.7"})
>  )
>  
>  -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> -- 
> 2.43.0
> 


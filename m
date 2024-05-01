Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C58B9031
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 21:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715407.1117010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Fuo-00055k-7j; Wed, 01 May 2024 19:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715407.1117010; Wed, 01 May 2024 19:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Fuo-00052u-3u; Wed, 01 May 2024 19:46:54 +0000
Received: by outflank-mailman (input) for mailman id 715407;
 Wed, 01 May 2024 19:46:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2Fum-0004Sa-V5
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 19:46:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a7b060d-07f3-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 21:46:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 96534CE138E;
 Wed,  1 May 2024 19:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB61C072AA;
 Wed,  1 May 2024 19:46:42 +0000 (UTC)
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
X-Inumbo-ID: 8a7b060d-07f3-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714592803;
	bh=/zXAlhKA7w+byChvy/eKON15X7SqbuaEFwSCyq7WYuA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TNrlckORgxWPdBFmxDP8bo25bwpqdY67vjtOPYWB/eWOZ19KVQsOLVCldvb/drfks
	 wCiDAwz8hx9fPFG0TZI36T4WK48WBk5XkrmHjn4iavBFAtJJjS1CHQyhfEh+j9J1Ak
	 fdlIWZoZWkHynpyKJ2XTejyXBu3JSYX5m/nYiHnh5Qrr+MPWeS5qfePeZkV1FeM4YQ
	 IZXJ+17EeSEE5oPqDuRlkeKlEQNaDOk84aSJfmPn1YUj/nSfRCczg4TlxiS8zF53uD
	 tipTIqSe25NfBzSfgpN0rG08w95CzbWfI0j8V0UmPA1JUUWjl2hdCxcg3jwQe8dbIM
	 4q4vUFfr9U3Ug==
Date: Wed, 1 May 2024 12:46:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 3/3] automation/eclair: make explicit there are no
 adopted files by default
In-Reply-To: <9d09f9787becdc356c076865e095d0ea97fbba62.1714401209.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405011246300.497719@ubuntu-linux-20-04-desktop>
References: <cover.1714401209.git.federico.serafini@bugseng.com> <9d09f9787becdc356c076865e095d0ea97fbba62.1714401209.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Apr 2024, Federico Serafini wrote:
> Update ECLAIR configuration to consider no adopted files by default.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/analysis.ecl | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index a604582da3..66ed7f952c 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -21,6 +21,10 @@ map_strings("scheduled-analysis",analysis_kind)
>  
>  -eval_file=toolchain.ecl
>  -eval_file=public_APIs.ecl
> +
> +-doc="Initially, there are no files tagged as adopted."
> +-file_tag+={adopted,"none()"}
> +
>  if(not(scheduled_analysis),
>      eval_file("adopted.ecl")
>  )
> -- 
> 2.34.1
> 


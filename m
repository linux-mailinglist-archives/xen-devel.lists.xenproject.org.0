Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4607EABE82F
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 01:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991260.1375157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWb1-00075A-OS; Tue, 20 May 2025 23:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991260.1375157; Tue, 20 May 2025 23:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHWb1-000736-LP; Tue, 20 May 2025 23:42:07 +0000
Received: by outflank-mailman (input) for mailman id 991260;
 Tue, 20 May 2025 23:42:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHWb0-00072U-4u
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 23:42:06 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083bba49-35d4-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 01:42:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 058A544B12;
 Tue, 20 May 2025 23:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9151CC4CEE9;
 Tue, 20 May 2025 23:42:01 +0000 (UTC)
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
X-Inumbo-ID: 083bba49-35d4-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747784522;
	bh=j3p5Z582EmuyC1zpsCaf2z0y4GicOnqytv3OkjvCfsc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PL9GT0Ieqka9+meYoZ103H2rubUr+tqix706VtU4kZHQP7R6w568jZ92Rs0e2RfNr
	 pmfPre1EpgrwA9SdDXpqtNDb8ovFxDgY5gcBhveueavzMWR2Qo8C6TLVlvYXoME1WF
	 pN2w+4JLLMz1tT/SkEJVGfIlGjGmP9BOZKbtYpfPrcJEeSj/RoBQ5oe0/S4zVYmMTl
	 fpDueog1q7vE19DrwvyrZCOwxBLeeZs39mZ05dCsIWcR1ZtKaSouYsNdxOeAf/OGj7
	 8HXj8TSAxx5piVgMNrljlWGdfMHmHDVtrW0gpt108KFaON+n37BnR3x2YnrDEQ1pH7
	 SQ4junNXW9p2g==
Date: Tue, 20 May 2025 16:41:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Daniel Smith <dpsmith@apertussolutions.com>, 
    Rich Persaud <persaur@gmail.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: add Daniel P. Smith as an Argo
 maintainer
In-Reply-To: <20250520233220.868258-2-christopher.w.clark@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505201641500.2019926@ubuntu-linux-20-04-desktop>
References: <20250520233220.868258-1-christopher.w.clark@gmail.com> <20250520233220.868258-2-christopher.w.clark@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 May 2025, Christopher Clark wrote:
> Daniel is a longstanding contributor to the OpenXT Project where Argo
> was developed and is in active use with Xen, and to Argo itself,
> involved with the design and development of Argo software.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e7198363c5..c2e4f8528f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -222,6 +222,7 @@ F:	tools/libacpi/
>  
>  ARGO
>  M:	Christopher Clark <christopher.w.clark@gmail.com>
> +M:	Daniel P. Smith <dpsmith@apertussolutions.com>
>  S:	Maintained
>  F:	xen/include/public/argo.h
>  F:	xen/include/xen/argo.h
> -- 
> 2.25.1
> 


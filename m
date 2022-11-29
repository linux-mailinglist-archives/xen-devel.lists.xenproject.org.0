Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B262763C9ED
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 21:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449630.706497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07ci-0005y7-Ix; Tue, 29 Nov 2022 20:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449630.706497; Tue, 29 Nov 2022 20:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07ci-0005vt-Ft; Tue, 29 Nov 2022 20:54:36 +0000
Received: by outflank-mailman (input) for mailman id 449630;
 Tue, 29 Nov 2022 20:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMqW=35=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p07cg-0005vm-RB
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 20:54:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06cdea99-7028-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 21:54:33 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ADBDDB81912;
 Tue, 29 Nov 2022 20:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11017C433C1;
 Tue, 29 Nov 2022 20:54:29 +0000 (UTC)
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
X-Inumbo-ID: 06cdea99-7028-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669755271;
	bh=E/t7LbbL28l1GWStEPbOEvjgfse4bDYrePnSOE3a1PU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lmhpVXVRBaUQQtmd9HiwC7TdGz0QpJi4bQnSRQXjq90VMn9rauFShDShAj21ZDdea
	 SpjkY4jnKnMYf2T9YYf1aFLtgpwNVHUnxEKHuLjE0X94DlyWMhE0RBdBEt6ojOhemT
	 n8fBYssNgDMTp5UI2DB5IkamXwY2k0meYDcMg9nuxiBjjY/NogmgKdoUsUrY4bdCR5
	 kG0ahS/T7rh3YygCar01SlokelMYInzErwhchkXzSEYaNpjo1zjCVbD3RdWQSRT8Mt
	 ADq/dEX0f1D/Y/YHJhuIEjmZx8P0OsJVbStjz3YTSK7by3ASigLDQYT5Z6P0z/+UP6
	 PaGqbUF0UcyJA==
Date: Tue, 29 Nov 2022 12:54:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <JBeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    JulienGrall <julien.grall@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Ian Jackson <ian.jackson@citrix.com>, 
    George Dunlap <George.Dunlap@eu.citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Konrad Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2 RESEND] CODING_STYLE: explicitly call out label
 indentation
In-Reply-To: <7072cc5e-8137-762b-53a1-c4a80d19ff08@suse.com>
Message-ID: <alpine.DEB.2.22.394.2211291253540.4039@ubuntu-linux-20-04-desktop>
References: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com> <7072cc5e-8137-762b-53a1-c4a80d19ff08@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Jul 2019, Jan Beulich wrote:
> Since the behavior of "diff -p" to use an unindented label as context
> identifier often makes it harder to review patches, make explicit the
> requirement for labels to be indented.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -31,6 +31,10 @@ void fun(void)
>       }
>   }
>   
> +Due to the behavior of GNU diffutils "diff -p", labels should be
> +indented by at least one blank.  Non-case labels inside switch() bodies
> +are preferred to be indented the same as the block's case labels.
> +
>   White space
>   -----------
>   
> 
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCCD63C9EE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 21:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449632.706507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07d4-0006MD-Qp; Tue, 29 Nov 2022 20:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449632.706507; Tue, 29 Nov 2022 20:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07d4-0006KQ-O6; Tue, 29 Nov 2022 20:54:58 +0000
Received: by outflank-mailman (input) for mailman id 449632;
 Tue, 29 Nov 2022 20:54:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMqW=35=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p07d3-0005vm-Bf
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 20:54:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13ebe199-7028-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 21:54:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB3E0B81911;
 Tue, 29 Nov 2022 20:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440ECC433D6;
 Tue, 29 Nov 2022 20:54:52 +0000 (UTC)
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
X-Inumbo-ID: 13ebe199-7028-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669755293;
	bh=LbuJtK1K4cStF+SJ7QUPzeBsbntOqYZ0jHDRVQN/y94=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tvrVOwAJSuunX08TNkPN58lU+meZeOLUnA6XNbUvo01DeYHrEVleyUx/EhjcF9jj9
	 LnI6VMGJEdj96WLo/0BjL551KZHlzDGimxtLlhu61eLVVPIUKNrl8w87CwgcMNQg0I
	 +swQn0K1iLaESjH+wJmpEbetmpOyovGeyt6Bffz5XZJSUA0BA0xXrmg+SOU2ETRsXD
	 KQVtH8dwEfUFQAR+eLQDPVI2fA8h+PEvTn5ESa1CZUQcB59asLOy1hW+SP0+YfZtMi
	 OHGnwZL8kvCoHFBEUaOZllIUyFOKi8DEDKuNkfq5FnA4PN0hiyOMPKCq5xUzMVxkYT
	 LxP9djf8xZWcg==
Date: Tue, 29 Nov 2022 12:54:50 -0800 (PST)
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
Subject: Re: [PATCH 2/2] CODING_STYLE: list further brace placement
 exceptions
In-Reply-To: <29b489fe-d7ad-68b8-b555-2a6381a28829@suse.com>
Message-ID: <alpine.DEB.2.22.394.2211291254430.4039@ubuntu-linux-20-04-desktop>
References: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com> <29b489fe-d7ad-68b8-b555-2a6381a28829@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Jul 2019, Jan Beulich wrote:
> For easy spotting of struct/union/enum definitions we already commonly
> place the opening braces on the initial line of such a definition.
> 
> We also often don't place the opening brace of an initializer on a
> separate line.
> 
> And finally for compound literals placing the braces on separate lines
> often makes the code more difficult to read, so it should (and in
> practice does) typically go on the same line as well.  The placement of
> the closing brace often depends on how large such a compound literal is.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> TBD: We may want to make explicit that for initializers both forms are
>       fine.
> 
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -64,8 +64,13 @@ Bracing
>   -------
>   
>   Braces ('{' and '}') are usually placed on a line of their own, except
> -for the do/while loop.  This is unlike the Linux coding style and
> -unlike K&R.  do/while loops are an exception. e.g.:
> +for
> +- the do/while loop
> +- the opening brace in definitions of enum, struct, and union
> +- the opening brace in initializers
> +- compound literals
> +This is unlike the Linux coding style and unlike K&R.  do/while loops
> +are one exception. e.g.:
>   
>   if ( condition )
>   {
> 
> 


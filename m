Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D1975A3AE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566308.884990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHwS-0004aV-Re; Thu, 20 Jul 2023 00:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566308.884990; Thu, 20 Jul 2023 00:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHwS-0004YO-P4; Thu, 20 Jul 2023 00:54:52 +0000
Received: by outflank-mailman (input) for mailman id 566308;
 Thu, 20 Jul 2023 00:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1UDO=DG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMHwR-0004YI-DI
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:54:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06340791-2698-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 02:54:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 36BF66185F;
 Thu, 20 Jul 2023 00:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026BDC433C8;
 Thu, 20 Jul 2023 00:54:45 +0000 (UTC)
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
X-Inumbo-ID: 06340791-2698-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689814486;
	bh=WbhKu7aZ3CiGcw50z9VWjUGuhKh2hmhy7LJBz4jmGsk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SfiFvv/p9jTS+Qh3eeUhuPXm4es0k8oKFENVsfq2cEjClhCRYPK0Px1ppamRCLPB/
	 Y0ERoeTtLks/YDtYJCvvIRc06T48YsW/SI+ZQB78EK7fXAXeO2g6ZxEYCd3h2zjEvG
	 ZgFuy/Ci9YIAQ0guFK4yeSf8/tBNVM4wTMTLt1cIX8vU59vF5xHUyhBIlxY+ufblhk
	 BYhjxkeCHIRuyc8OiuG+q512I4lyREOEalK1sKewkSlOx0px8IV00yQUdmlNBPJUpT
	 1xD0k7kJ1UEf6lh8lQ42DndDf+IeA6Bm8ZBd0d2AhBdAVOJt+JWoT0jY0D7sk0m/Sl
	 UDhTsy5II+Yag==
Date: Wed, 19 Jul 2023 17:54:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] xen/misra: diff-report.py: Fix UnifiedFormatParser
 change line registration
In-Reply-To: <20230718092637.2433974-2-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2307191754370.3118466@ubuntu-linux-20-04-desktop>
References: <20230718092637.2433974-1-luca.fancellu@arm.com> <20230718092637.2433974-2-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Jul 2023, Luca Fancellu wrote:
> Fix the line number on the registration of a 'remove' change type when
> consecutive 'remove' changes are registered.
> 
> Currently the algorithm registers consecutive 'remove' changes at the same
> line it encounter the first one, 'add' changes type are not affected by the
> bug.
> 
> Fixes: 1d7c45f895b6 ("xen/misra: diff-report.py: add report patching feature")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  .../xen_analysis/diff_tool/unified_format_parser.py        | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py b/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py
> index 8b3fbc318df7..6c506caeafce 100644
> --- a/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py
> +++ b/xen/scripts/xen_analysis/diff_tool/unified_format_parser.py
> @@ -144,6 +144,7 @@ class UnifiedFormatParser(object):
>          file_linenum = 0
>          hunk_a_linemax = 0
>          hunk_b_linemax = 0
> +        consecutive_remove = 0
>          diff_elem = None
>          parse_state = ParserState.FIND_DIFF_HEADER
>          ChangeMode = ChangeSet.ChangeMode
> @@ -210,14 +211,18 @@ class UnifiedFormatParser(object):
>                  if (hunk_b_linemax > 0) and line.startswith("+"):
>                      diff_elem.add_change(file_linenum, ChangeType.ADD)
>                      hunk_b_linemax -= 1
> +                    consecutive_remove = 0
>                  elif (hunk_a_linemax > 0) and line.startswith("-"):
> -                    diff_elem.add_change(file_linenum, ChangeType.REMOVE)
> +                    diff_elem.add_change(file_linenum + consecutive_remove,
> +                                         ChangeType.REMOVE)
>                      hunk_a_linemax -= 1
>                      file_linenum -= 1
> +                    consecutive_remove += 1
>                  elif ((hunk_a_linemax + hunk_b_linemax) > 0) and \
>                          line.startswith(" "):
>                      hunk_a_linemax -= 1 if (hunk_a_linemax > 0) else 0
>                      hunk_b_linemax -= 1 if (hunk_b_linemax > 0) else 0
> +                    consecutive_remove = 0
>  
>                  if (hunk_a_linemax + hunk_b_linemax) <= 0:
>                      parse_state = ParserState.FIND_HUNK_OR_DIFF_HEADER
> -- 
> 2.34.1
> 


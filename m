Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7815F8A65
	for <lists+xen-devel@lfdr.de>; Sun,  9 Oct 2022 11:33:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418943.663649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohSgR-0005o1-E4; Sun, 09 Oct 2022 09:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418943.663649; Sun, 09 Oct 2022 09:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohSgR-0005lc-AO; Sun, 09 Oct 2022 09:33:19 +0000
Received: by outflank-mailman (input) for mailman id 418943;
 Sun, 09 Oct 2022 09:33:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ohSgQ-0005lW-Mm
 for xen-devel@lists.xenproject.org; Sun, 09 Oct 2022 09:33:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohSgP-0003GY-Sq; Sun, 09 Oct 2022 09:33:17 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ohSgP-00012i-NE; Sun, 09 Oct 2022 09:33:17 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=F1ux7XQQtYKI0ztKv4YK4GfNC1gooHc2NPnDh6HqJFs=; b=f4sonY+87DApWah7vkdoitvdcG
	jPgNHDKGQl0ClR7nO9QcOjE8MpH1+jQLcSre+jKjpYo/VIm69D2eMTUbiWRGmsqKC/ewO+DcqiABm
	ghwd7pc2ZGiBBOnb35coJt8rG8EHDFbwgRWmzDk6Ovttbutg27Z2MGb5WV5jG5kZklbw=;
Message-ID: <4c07bd2c-fe8c-9a4c-a7f1-33181596249a@xen.org>
Date: Sun, 9 Oct 2022 10:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 1/4] Add SPDX to CODING_STYLE
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: wl@xen.org, jbeulich@suse.com, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, roger.pau@citrix.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop>
 <20221008001544.78302-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221008001544.78302-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/10/2022 01:15, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   CODING_STYLE | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 3386ee1d90..5faf274b3a 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -14,6 +14,16 @@ explicitly (e.g. tools/libxl/CODING_STYLE) but often implicitly (Linux
>   coding style is fairly common). In general you should copy the style
>   of the surrounding code. If you are unsure please ask.
>   
> +SPDX
> +----
> +
> +New files should start with a single-line SPDX comment to express the
> +license, e.g.:
> +
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +See LICENSES/ for a list of licenses and SPDX tags currently used.

This directory doesn't yet exist. As Jan wrote in v2, this should be 
populated first (i.e. patch #2 should be before patch #1).

Cheers,

-- 
Julien Grall


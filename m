Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A1599617
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 09:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390034.627207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwVh-0005Aw-9d; Fri, 19 Aug 2022 07:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390034.627207; Fri, 19 Aug 2022 07:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwVh-000598-6V; Fri, 19 Aug 2022 07:33:41 +0000
Received: by outflank-mailman (input) for mailman id 390034;
 Fri, 19 Aug 2022 07:33:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOwVf-000592-Q5
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 07:33:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOwVe-0002QD-KU; Fri, 19 Aug 2022 07:33:38 +0000
Received: from [54.239.6.188] (helo=[192.168.16.114])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOwVe-0003Ym-EG; Fri, 19 Aug 2022 07:33:38 +0000
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
	bh=730PEsrHKa+wj7LiHCFT+sNLQVqSTuHnDWpOYKNk9lY=; b=iHouz/Oin1EzWB+5OZcUg9qnbC
	iKj0tROxNmxrDTvYfc4oAWRblq4fHIpFfdvpSs7A6n50zwO4w1BwBXRyp1VkQyNf+BGIqC5/IGk1A
	SKXclABa1ThE0Xmd1Ern9xyZDqfOWMHwb1NGBGAgrn7onenubti+dXWeY2ynAKr7JXng=;
Message-ID: <fb2e6b9d-8ffc-a7f2-8411-3751dc8d4022@xen.org>
Date: Fri, 19 Aug 2022 08:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 1/3] Add SPDX to CODING_STYLE
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wl@xen.org, jbeulich@suse.com,
 george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
 <20220818220320.2538705-1-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220818220320.2538705-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 18/08/2022 23:03, Stefano Stabellini wrote:
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
> +

A user reading CODING_STYLE and CONTRIBUTING may think they need to also 
add the full license (see the section "COMMON COPYRIGHT NOTICES").

So as we are going to promote SPDX, we should update CONTRIBUTING to 
reflect that the full license should not be present copied.

Cheers,

-- 
Julien Grall


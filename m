Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87A345DECA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 17:50:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231686.401069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqHwS-0003ld-5F; Thu, 25 Nov 2021 16:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231686.401069; Thu, 25 Nov 2021 16:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqHwS-0003jo-2A; Thu, 25 Nov 2021 16:49:48 +0000
Received: by outflank-mailman (input) for mailman id 231686;
 Thu, 25 Nov 2021 16:49:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mqHwQ-0003ji-CG
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 16:49:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqHwP-0007ZI-63; Thu, 25 Nov 2021 16:49:45 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.27.59]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqHwO-0004Sn-Ut; Thu, 25 Nov 2021 16:49:45 +0000
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
	bh=k43Fw9PEquI+GkVfiNyaaBC/dfFgNcC4ibsC1MUxtA8=; b=CjIYnjsQrdJlZOKEGjBK4C8Jhr
	HJfkBajZkxBlBlvfzgJ8Tl/czBUvbQ9mpusK+CK2ISeP8xKL6jPmcQxBg4RG0pbV1pZUryXGUcngK
	nxsNl8eLcVOomrGv9bSYApopIIBIxKSjOaxeYpF5vfIOHFGkwKpMnxh3PmkxNq5zNO3g=;
Message-ID: <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
Date: Thu, 25 Nov 2021 16:49:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/11/2021 10:21, Jan Beulich wrote:
> From: Lasse Collin <lasse.collin@tukaani.org>
> 
> It's good style. I was also told that GCC 7 is more strict and might
> give a warning when such comments are missing.
> 
> Suggested-by: Andrei Borzenkov <arvidjaar@gmail.com>
> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
> [Linux commit: 5a244f48ecbbd03a11eb84819c5c599db81823ee]
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Linux has meanwhile further moved to using the "fallthrough" pseudo-
> keyword, but us doing so requires the tool stack to first make this
> available for use in at least stubdom builds.
> 
> --- a/xen/common/xz/dec_stream.c
> +++ b/xen/common/xz/dec_stream.c
> @@ -583,6 +583,8 @@ static enum xz_ret __init dec_main(struc
>   			if (ret != XZ_OK)
>   				return ret;
>   
> +		/* Fall through */
> +
>   		case SEQ_BLOCK_START:
>   			/* We need one byte of input to continue. */
>   			if (b->in_pos == b->in_size)
> @@ -606,6 +608,8 @@ static enum xz_ret __init dec_main(struc
>   			s->temp.pos = 0;
>   			s->sequence = SEQ_BLOCK_HEADER;
>   
> +		/* Fall through */
> +
>   		case SEQ_BLOCK_HEADER:
>   			if (!fill_temp(s, b))
>   				return XZ_OK;
> @@ -616,6 +620,8 @@ static enum xz_ret __init dec_main(struc
>   
>   			s->sequence = SEQ_BLOCK_UNCOMPRESS;
>   
> +		/* Fall through */
> +
>   		case SEQ_BLOCK_UNCOMPRESS:
>   			ret = dec_block(s, b);
>   			if (ret != XZ_STREAM_END)
> @@ -623,6 +629,8 @@ static enum xz_ret __init dec_main(struc
>   
>   			s->sequence = SEQ_BLOCK_PADDING;
>   
> +		/* Fall through */
> +
>   		case SEQ_BLOCK_PADDING:
>   			/*
>   			 * Size of Compressed Data + Block Padding
> @@ -643,6 +651,8 @@ static enum xz_ret __init dec_main(struc
>   
>   			s->sequence = SEQ_BLOCK_CHECK;
>   
> +		/* Fall through */
> +
>   		case SEQ_BLOCK_CHECK:
>   			if (s->check_type == XZ_CHECK_CRC32) {
>   				ret = crc32_validate(s, b);
> @@ -665,6 +675,8 @@ static enum xz_ret __init dec_main(struc
>   
>   			s->sequence = SEQ_INDEX_PADDING;
>   
> +		/* Fall through */
> +
>   		case SEQ_INDEX_PADDING:
>   			while ((s->index.size + (b->in_pos - s->in_start))
>   					& 3) {
> @@ -687,6 +699,8 @@ static enum xz_ret __init dec_main(struc
>   
>   			s->sequence = SEQ_INDEX_CRC32;
>   
> +		/* Fall through */
> +
>   		case SEQ_INDEX_CRC32:
>   			ret = crc32_validate(s, b);
>   			if (ret != XZ_STREAM_END)
> @@ -695,6 +709,8 @@ static enum xz_ret __init dec_main(struc
>   			s->temp.size = STREAM_HEADER_SIZE;
>   			s->sequence = SEQ_STREAM_FOOTER;
>   
> +		/* Fall through */
> +
>   		case SEQ_STREAM_FOOTER:
>   			if (!fill_temp(s, b))
>   				return XZ_OK;
> 

-- 
Julien Grall


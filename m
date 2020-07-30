Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A274233929
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 21:38:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1ENS-0002Qt-5q; Thu, 30 Jul 2020 19:38:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fgvr=BJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k1ENR-0002Oe-7v
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:38:05 +0000
X-Inumbo-ID: 2e796402-d29c-11ea-8dc2-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e796402-d29c-11ea-8dc2-bc764e2007e4;
 Thu, 30 Jul 2020 19:38:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0DE220829;
 Thu, 30 Jul 2020 19:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596137882;
 bh=YQnSwfl14qMvAUTFCT0b4jxdn2MycRpdn9p+9TgssIM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=XGyjnW6GqUoCS32aNoa3aVmOcytWvDyDDMm0kUeQAsC83Kydc56jniMkApnE5T/TY
 Eegz4q4CkygUrEEC+Cx4babsrgQqRDlKEFWeiwxyk8zhBvxFnawyEgHK3pJDvxIwZi
 I5stTo/2gP192bHn76Zid1PhIVQt/BW7M+nXZtK4=
Date: Thu, 30 Jul 2020 12:38:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RESEND][PATCH v2 7/7] xen/guest_access: Fix coding style in
 xen/guest_access.h
In-Reply-To: <20200730181827.1670-8-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2007301235360.1767@sstabellini-ThinkPad-T480s>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-8-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 30 Jul 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
>     * Add space before and after operator
>     * Align \
>     * Format comments
> 
> No functional changes expected.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xen/guest_access.h | 36 +++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
> index 4957b8d1f2b8..52fc7a063249 100644
> --- a/xen/include/xen/guest_access.h
> +++ b/xen/include/xen/guest_access.h
> @@ -18,20 +18,24 @@
>  #define guest_handle_add_offset(hnd, nr) ((hnd).p += (nr))
>  #define guest_handle_subtract_offset(hnd, nr) ((hnd).p -= (nr))
>  
> -/* Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARAM)
> - * to the specified type of XEN_GUEST_HANDLE_PARAM. */
> +/*
> + * Cast a guest handle (either XEN_GUEST_HANDLE or XEN_GUEST_HANDLE_PARAM)
> + * to the specified type of XEN_GUEST_HANDLE_PARAM.
> + */
>  #define guest_handle_cast(hnd, type) ({         \
>      type *_x = (hnd).p;                         \
> -    (XEN_GUEST_HANDLE_PARAM(type)) { _x };            \
> +    (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
>  })
>  
>  /* Cast a XEN_GUEST_HANDLE to XEN_GUEST_HANDLE_PARAM */
>  #define guest_handle_to_param(hnd, type) ({                  \
>      typeof((hnd).p) _x = (hnd).p;                            \
>      XEN_GUEST_HANDLE_PARAM(type) _y = { _x };                \
> -    /* type checking: make sure that the pointers inside     \
> +    /*                                                       \
> +     * type checking: make sure that the pointers inside     \
>       * XEN_GUEST_HANDLE and XEN_GUEST_HANDLE_PARAM are of    \
> -     * the same type, then return hnd */                     \
> +     * the same type, then return hnd.                       \
> +     */                                                      \
>      (void)(&_x == &_y.p);                                    \
>      _y;                                                      \
>  })
> @@ -106,13 +110,13 @@
>   * guest_handle_subrange_okay().
>   */
>  
> -#define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
> -    const typeof(*(ptr)) *_s = (ptr);                   \
> -    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
> -    /* Check that the handle is not for a const type */ \
> -    void *__maybe_unused _t = (hnd).p;                  \
> -    (void)((hnd).p == _s);                              \
> -    __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
> +#define __copy_to_guest_offset(hnd, off, ptr, nr) ({        \
> +    const typeof(*(ptr)) *_s = (ptr);                       \
> +    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;              \
> +    /* Check that the handle is not for a const type */     \
> +    void *__maybe_unused _t = (hnd).p;                      \
> +    (void)((hnd).p == _s);                                  \
> +    __raw_copy_to_guest(_d + (off), _s, sizeof(*_s) * (nr));\
>  })
>  
>  #define __clear_guest_offset(hnd, off, nr) ({    \
> @@ -120,10 +124,10 @@
>      __raw_clear_guest(_d + (off), nr);           \
>  })
>  
> -#define __copy_from_guest_offset(ptr, hnd, off, nr) ({  \
> -    const typeof(*(ptr)) *_s = (hnd).p;                 \
> -    typeof(*(ptr)) *_d = (ptr);                         \
> -    __raw_copy_from_guest(_d, _s+(off), sizeof(*_d)*(nr));\
> +#define __copy_from_guest_offset(ptr, hnd, off, nr) ({          \
> +    const typeof(*(ptr)) *_s = (hnd).p;                         \
> +    typeof(*(ptr)) *_d = (ptr);                                 \
> +    __raw_copy_from_guest(_d, _s + (off), sizeof (*_d) * (nr)); \
>  })
>  
>  #define __copy_field_to_guest(hnd, ptr, field) ({       \
> -- 
> 2.17.1
> 


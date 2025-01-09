Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D0A07D27
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 17:16:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868952.1280484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVvCT-0003DE-J3; Thu, 09 Jan 2025 16:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868952.1280484; Thu, 09 Jan 2025 16:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVvCT-0003Bb-F9; Thu, 09 Jan 2025 16:16:01 +0000
Received: by outflank-mailman (input) for mailman id 868952;
 Thu, 09 Jan 2025 16:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=soqj=UB=intel.com=matthew.auld@srs-se1.protection.inumbo.net>)
 id 1tVv32-0004iX-Q5
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 16:06:17 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5676a1a-cea3-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 17:06:13 +0100 (CET)
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 08:05:55 -0800
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.241])
 ([10.245.245.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 08:05:50 -0800
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
X-Inumbo-ID: a5676a1a-cea3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736438774; x=1767974774;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p4XkuorIpNoSEU2HBpQ1O27DvwV5LvulfkLyMZfyAfg=;
  b=BV96KLx/GpINYPjtoGCUzPgRdDy35Ezx9iAT4TVVlq/VU5z3poIeLtxd
   XQhs3sidlWwjChJ4sGZciPPiwKLGUDgVjuVaPeUFL3986bSotTV4vR/Za
   N/WKVaMPmmUo0AG5zMiPpvcmzTSTWOXIhXHoX5Wu0Gz/DoeMEuE6TA9PG
   QabMXpOFBwFbWICOhEPkDccQZpV3YxVFW06p+gX+SATv2W6TQr5rgnJmn
   5O6tSIFGD3rwzSYzpxz3bS1S9YzQIoJE2NDN+kqyswP/E6KXYAzyBCaTg
   AVLcVJvWyDVORuulU68w8UOmSsSoa/7y/4nUe5+RqnFZesA3AxxLVt5Gd
   Q==;
X-CSE-ConnectionGUID: nV9CUtq6Q/iikQqV4TSm+w==
X-CSE-MsgGUID: wgG7ghxVQbKfiqqSZWN6+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="62086137"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="62086137"
X-CSE-ConnectionGUID: gYM7jUeoQau2+oJbNyjiWQ==
X-CSE-MsgGUID: 8PkbOk3sQpqIzHIL0w463A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103967271"
Message-ID: <91c904f8-ba47-4595-be65-6fb57dcc9c64@intel.com>
Date: Thu, 9 Jan 2025 16:05:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/25] drm/xe: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-24-tzimmermann@suse.de>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250109150310.219442-24-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/01/2025 14:57, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Align the pitch to a multiple of 8. Align the
> buffer size according to hardware requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e6c896ad5602..d75e3c39ab14 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -8,6 +8,7 @@
>   #include <linux/dma-buf.h>
>   
>   #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/ttm/ttm_device.h>
> @@ -2535,14 +2536,13 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>   	struct xe_device *xe = to_xe_device(dev);
>   	struct xe_bo *bo;
>   	uint32_t handle;
> -	int cpp = DIV_ROUND_UP(args->bpp, 8);
>   	int err;
>   	u32 page_size = max_t(u32, PAGE_SIZE,
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
>   
> -	args->pitch = ALIGN(args->width * cpp, 64);
> -	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
> -			   page_size);
> +	err = drm_mode_size_dumb(dev, args, SZ_64, page_size);

AFAICT this looks to change the behaviour, where u64 size was 
technically possible and was allowed given that args->size is u64, but 
this helper is limiting the size to u32. Is that intentional? If so, we 
should probably make that clear in the commit message.

> +	if (err)
> +		return err;
>   
>   	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>   			       DRM_XE_GEM_CPU_CACHING_WC,



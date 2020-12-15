Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391042DB0B6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:00:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54347.94362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCk4-0006aG-Tt; Tue, 15 Dec 2020 16:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54347.94362; Tue, 15 Dec 2020 16:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCk4-0006Zr-QQ; Tue, 15 Dec 2020 16:00:00 +0000
Received: by outflank-mailman (input) for mailman id 54347;
 Tue, 15 Dec 2020 15:59:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpCk2-0006Zl-Tr
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 15:59:58 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9e9bbd7-9631-42a8-b6db-c9924111c3bc;
 Tue, 15 Dec 2020 15:59:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k10so17341085wmi.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 07:59:58 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h14sm39492140wrx.37.2020.12.15.07.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:59:56 -0800 (PST)
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
X-Inumbo-ID: c9e9bbd7-9631-42a8-b6db-c9924111c3bc
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tFEk86mVqO4FH5WDNJH6ijNTLh5WOam/pXSe+O3TdoM=;
        b=oK+l2k4tiBS9JsP7dMJ6zsLxCjeVzU/Gmv1j9WSsBK9lowDnpimTTlYtuLFeeMXJyb
         TBgRjKdlENZR0hQPcAVX3qCjCM/Yo/G5I1w9WqvD1DWmr1DiijF3WgDYUR3om5/97MjK
         J2ZdtLmydvN+5Xpe5Ojh2MBAEc8NVKQBwyUorqCI24GUBovaKphW2nxKcxftEhcikcAW
         QYH8zUkSyqivuAghbDV4m/+7CxznzSyPLRToYFMdC8KOlokEjvKfnxw9kAuMc+d+WeTb
         WhNrvnuHm5wTuOyM8wd2OL/QAFpubKajJaPdR+J2o/ydiOfrRlEjbAEoUJa2DCHQv5KC
         nPOQ==
X-Gm-Message-State: AOAM533Witg9Zjj8Jyyd2UHmiPXSAB5I27TSB7y4pfvyeHXKbI8IxzvD
	W//5hi8gSrkSANoCEJi6plE=
X-Google-Smtp-Source: ABdhPJwmP+SVbZsLVElNYmrgtIPYjfxEBlPJvPBwnI/ZlHuQ65/EXhNVwVGYbokxa6yVFhVUjlEm6w==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr33543203wmk.92.1608047997250;
        Tue, 15 Dec 2020 07:59:57 -0800 (PST)
Date: Tue, 15 Dec 2020 15:59:54 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 01/25] libxl: s/pcidev/pci and remove
 DEFINE_DEVICE_TYPE_STRUCT_X
Message-ID: <20201215155954.jqcozwhko2pdebgj@liuwe-devbox-debian-v2>
References: <20201208193033.11306-1-paul@xen.org>
 <20201208193033.11306-2-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208193033.11306-2-paul@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Dec 08, 2020 at 07:30:09PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The seemingly arbitrary use of 'pci' and 'pcidev' in the code in libxl_pci.c
> is confusing and also compromises use of some macros used for other device
> types. Indeed it seems that DEFINE_DEVICE_TYPE_STRUCT_X exists solely because
> of this duality.
> 
> This patch purges use of 'pcidev' from the libxl internal code, but
> unfortunately the 'pcidevs' and 'num_pcidevs' fields in 'libxl_domain_config'
> are part of the API and need to be retained to avoid breaking callers,
> particularly libvirt.
> 
> DEFINE_DEVICE_TYPE_STRUCT_X is still removed to avoid the special case in
> libxl_pci.c but DEFINE_DEVICE_TYPE_STRUCT is given an extra 'array' argument
> which is used to identify the fields in 'libxl_domain_config' relating to
> the device type.
> 
> NOTE: Some of the more gross formatting errors (such as lack of spaces after
>       keywords) that came into context have been fixed in libxl_pci.c.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>


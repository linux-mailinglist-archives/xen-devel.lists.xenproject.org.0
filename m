Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317B2CECEE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:19:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44451.79645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl97c-0008I8-Bl; Fri, 04 Dec 2020 11:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44451.79645; Fri, 04 Dec 2020 11:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl97c-0008Hh-7N; Fri, 04 Dec 2020 11:19:32 +0000
Received: by outflank-mailman (input) for mailman id 44451;
 Fri, 04 Dec 2020 11:19:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl97b-0008HN-7v
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:19:31 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d7db448-4ac8-49e7-8519-c2d6b8e1bb22;
 Fri, 04 Dec 2020 11:19:30 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k14so4966734wrn.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:19:30 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u26sm2912463wmm.24.2020.12.04.03.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:19:29 -0800 (PST)
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
X-Inumbo-ID: 7d7db448-4ac8-49e7-8519-c2d6b8e1bb22
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pAimBtLIAxfNJiHe4gICAMSy6aIpRsD/YxrsobslKRE=;
        b=QaCpo2kndYRLzcgzkpTyPfweMwT1smD4tp3SGD/6yRghByAdDZiBhExGHsBPJfUHWW
         8l/BUz+OK/PqYGhlFQ0wdFFHSJn7G1h5sl/N+HKcpU9NrjMd8Q0axaSvNdS+e9YQ9/8X
         lrWZwLpyF/np+ewLuLZrmW5YPCNBA0EzMpUzTlG7IcI/c7n0oNp/tRRl2/ObVwupZ2fO
         peTvOLckK2HuDb6/Slt2aFYSyt05TW4TGPmmpjxSJJA1WVFTQ4b3aAJjaHfhvO0y+5wB
         joqm7ic2DJTvg93f8SNeij3JgGVGdAPGLikh2uLEo6nrYBkWHJSa3wNcv27kE4eO3jCv
         2t/A==
X-Gm-Message-State: AOAM533HaiyvgwwHtfiKkaPQDK7qFpn4V4LWa7hI0wnphRdtXXFmmUBl
	KEaV7XY310Jt9u0bFRvsnJ8=
X-Google-Smtp-Source: ABdhPJx7vh18C0Ien/6kPEMqkKZbkNcqlttjW4qenA4K2uw4rPDqJQAxRLXS3z7EuxQ/vzhgtQtnUA==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr4300031wrn.190.1607080769923;
        Fri, 04 Dec 2020 03:19:29 -0800 (PST)
Date: Fri, 4 Dec 2020 11:19:28 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 05/23] libxl: s/detatched/detached in libxl_pci.c
Message-ID: <20201204111928.ddq4blb6e2hsl2gc@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-6-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-6-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:16PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Simply spelling correction. Purely cosmetic fix.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>


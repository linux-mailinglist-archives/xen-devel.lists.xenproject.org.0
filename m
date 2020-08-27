Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9861F254443
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:27:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBG3d-0003eg-Dp; Thu, 27 Aug 2020 11:27:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBG3c-0003eb-J5
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:27:04 +0000
X-Inumbo-ID: 996d25e1-bcd2-4c1f-a2ca-44a7f68b0789
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 996d25e1-bcd2-4c1f-a2ca-44a7f68b0789;
 Thu, 27 Aug 2020 11:27:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c18so478849wrm.9
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sXxDApqfnT74EH0rtODYIxUJLdDpal8mF9+j25f3OWc=;
 b=GUQYMR89Lr9SSqMK8MxCFJEDPrHLZ8Lm9xU/gLI0bNCTklbeutlljhgHAKfwnK3AaW
 YuPBGkfkKcb4qnBCimGvMl86VEzNGtQVEx0Yp8Vmzj6VvP5jbNS0DRdNoHTlZpgbVOpJ
 uKJoUr5/pIi5mP68q+qmrQxczu4wDhsmiWaCfMG2dioIJILARX8loKFFXguIIzfWID7C
 d5WTxDGBqP/PDVIwMAkCD7eC1xvwh+Yo0P24smRMPn96v9Aea9kL6Ov4TWwZ3FMd3QkZ
 ZsoRS99V+ZUjkvI73Od7a7QKSAbidQXTaAaoKkCoaVg8kiX1hziew2uFsMflrDiQ8XJU
 IJHA==
X-Gm-Message-State: AOAM531MxaFOCpZDWWPsF6sIBeRLSkC8Js752kCWcD1pKBCG3gRFreL+
 2EYxpmTVkeGb9Nz5wXbkEZg=
X-Google-Smtp-Source: ABdhPJybpZIphAOpO6hrYNZJUpU6Xz6VDklKQO8rdFatXCFHgGuNss5XE0AWzPchVipEEQ1iAQD6iA==
X-Received: by 2002:a5d:6ca9:: with SMTP id a9mr8544013wra.131.1598527623055; 
 Thu, 27 Aug 2020 04:27:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 124sm4775337wmd.31.2020.08.27.04.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:27:02 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:27:01 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 24/38] tools/xcutils: use official headers in readnotes
Message-ID: <20200827112701.o53hynhd5dmt6qyq@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-25-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-25-jgross@suse.com>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:35:05AM +0200, Juergen Gross wrote:
> readnotes.c is including xg_private.h. Now that the xenctrl headers
> are structured better this is no longer needed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>


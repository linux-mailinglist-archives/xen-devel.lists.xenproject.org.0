Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C92543A1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:22:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBF2m-0004dQ-T7; Thu, 27 Aug 2020 10:22:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBF2l-0004dL-4T
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:22:07 +0000
X-Inumbo-ID: 5d417798-274f-490f-9bd7-82b1ceca8dd2
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d417798-274f-490f-9bd7-82b1ceca8dd2;
 Thu, 27 Aug 2020 10:22:06 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z9so4618214wmk.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EVFiQ4OLU6b5EtM7sEyzrfTyVNqGl31wSVQCNYnkjSM=;
 b=mQQ/LrWgn1PXUe+km79m16yy8Ehomcv+f5Q0io54r9nlJ5iGM0uGJEmt51L73KrU+z
 CoCcLsew4rjmlW2HpvnlnCyz//l0tlIYM9IHEKDQlHpuzIdErKDycmwGyFQIoHxj4ZCI
 X0t4tUaf5BwrW4omDMD02XMui+/F/INkQzPzUONqnRetIL8O5qFUeQ7YVuQ/eByzLAhe
 8a6sfe01jI4z9lYlPqAqcy8aJvC3DKkEt0J98nzS4tMKEeSYiwvHRc1eXxzXsn+FRixz
 XgJiScufT+zWb/YE7aWKdey8nYWmoJn4EXmUeMxoDCGLzqmLV3mnfTZW0TmATqvuEBaY
 bdrQ==
X-Gm-Message-State: AOAM533ParfT5p5EFcTwOXa1E0JbLTdOM4q3vgAXFV4IxHrtmSQxm1Dy
 4lSCL26Sd4305YWWCuLR6ic=
X-Google-Smtp-Source: ABdhPJyapsSnFWwG03oaM3az6xYU8+WTjUwcoXcjgOxhOW2Mqf25Hvr9Z9u+7faAoWsUtmQDGNOyCA==
X-Received: by 2002:a1c:964b:: with SMTP id y72mr11296198wmd.69.1598523725512; 
 Thu, 27 Aug 2020 03:22:05 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z6sm4210702wml.41.2020.08.27.03.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:22:05 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:22:03 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: Re: [PATCH v3 02/38] tools: switch XEN_LIBXEN* make variables to
 lower case (XEN_libxen*)
Message-ID: <20200827102203.lbfiohcrehkdiam7@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-3-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:34:43AM +0200, Juergen Gross wrote:
> In order to harmonize names of library related make variables switch
> XEN_LIBXEN* names to XEN_libxen*, as all other related variables (e.g.
> CFLAGS_libxen*, SHDEPS_libxen*, ...) already use this pattern.
> 
> Rename XEN_LIBXC to XEN_libxenctrl, XEN_XENSTORE to XEN_libxenstore,
> XEN_XENLIGHT to XEN_libxenlight, XEN_XLUTIL to XEN_libxlutil, and
> XEN_LIBVCHAN to XEN_libxenvchan for the same reason.
> 
> Introduce XEN_libxenguest with the same value as XEN_libxenctrl.
> 
> No functional change.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>


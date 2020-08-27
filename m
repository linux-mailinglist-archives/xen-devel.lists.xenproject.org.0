Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456282543B2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:28:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBF8e-000523-AN; Thu, 27 Aug 2020 10:28:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBF8c-00051y-Hq
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:28:10 +0000
X-Inumbo-ID: d5a0fdf7-4d8a-4f18-a4a0-fa07be3e36aa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5a0fdf7-4d8a-4f18-a4a0-fa07be3e36aa;
 Thu, 27 Aug 2020 10:28:09 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k20so4625725wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MDEmYxvCofTCIObO71cqCrg/dPCLDdS3G2mPwfg+/n0=;
 b=myYnea+kOkgogWwfFxAhB1DLEN50c2YmkOpDZZMjAcs9/i94K8jaAH3E2KvysDfJiE
 3L1tqO9+1UNWeM/sX9eTin6IVuxXbOOs2tewMatHmjUZwRSR49l1M+glrn6AjvtVhBig
 7CjRZxCayfsBE1tgw0PcU9rp/eE1Wxs7jyeSgX6wjrtBJ6jGycxPV+UAc5owyNe4vk3E
 eRpgK11OmCE8BZp/F82/dICb3FxM1a458+xF4XOBNZp6v11JbhvvC8sYfZraHoKr3mrC
 Z9c+kLnJsllQdmaU8Vwyag9hgOw9EWMs8xbxak86kMJSA9T4olmQVgETtm5kHcIBH7od
 qI6A==
X-Gm-Message-State: AOAM532MsLylXcTF+i9jp6VLg85e9xfwCVftrq9xn6eKKttaVs3jhMH5
 3zHxsPWN9yodek9ZZDtzgxE=
X-Google-Smtp-Source: ABdhPJxy5Snh0mQdfGt0UxTmfC5jzMkAx39o/DyixIZgqcQqbNvkVh3F2ZIBDBwxPjUP6raClh5ihg==
X-Received: by 2002:a1c:e288:: with SMTP id z130mr11625176wmg.32.1598524087406; 
 Thu, 27 Aug 2020 03:28:07 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d10sm5322570wrg.3.2020.08.27.03.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:28:06 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:28:05 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 06/38] tools: generate most contents of library make
 variables
Message-ID: <20200827102805.zjwlbbsajdff4hvw@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-7-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:34:47AM +0200, Juergen Gross wrote:
> Library related make variables (CFLAGS_lib*, SHDEPS_lib*, LDLIBS_lib*
> and SHLIB_lib*) mostly have a common pattern for their values. Generate
> most of this content automatically by adding a new per-library variable
> defining on which other libraries a lib is depending. Those definitions
> are put into an own file in order to make it possible to include it
> from various Makefiles, especially for stubdom.
> 
> This in turn makes it possible to drop the USELIB variable from each
> library Makefile.
> 
> The LIBNAME variable can be dropped, too, as it can be derived from the
> directory name the library is residing in.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>


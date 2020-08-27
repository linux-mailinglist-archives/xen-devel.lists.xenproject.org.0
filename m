Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA62254348
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:14:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBEvG-0003gw-1q; Thu, 27 Aug 2020 10:14:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBEvE-0003go-E1
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:14:20 +0000
X-Inumbo-ID: bc343351-c70b-4979-8019-a9413c8372e5
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc343351-c70b-4979-8019-a9413c8372e5;
 Thu, 27 Aug 2020 10:14:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c15so4789225wrs.11
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nfBz2H+Ujx9aR3TUWJobJN5m9UzDApD3DFjWTT1N5ic=;
 b=aA48HtVtXC7dqXyMHwsS4zo/u44/ZrJApFMwTd5WAWWqEKGA/R1Q/qv29VmKDkxL3t
 ObyQ4k7Qx2zHnfJhLeEm05Q4VDCXOo1ptNRW7Kk4WF+2iLi7wGBIjHkyVygKLZis4D6a
 DJHwzZY2+Nte7TcCaa5fKPL4Zj5tSyk/QLCKJwX2WG8ilfF/Jop+c+TjdcYTUFFE360g
 eepStIEG8nI8ScZzmhaJX66bWNn7+pR3bkDYiCWd4bK9KCKYDb6GJqd1YrSADNowcdqS
 7T6QIsOijb85RtjWy8jYXOBi1DPHlGMq9gRIOP+QNNMJV8MwZg577M/7aoMx6jDlpWxi
 8sgg==
X-Gm-Message-State: AOAM533ae+4W9WdLThcahSvuLLpWnZNVf+p+e11pcAKMjA7CZOoKbjM7
 kuaRfMzeG5rZH3aE5C4PfyQ=
X-Google-Smtp-Source: ABdhPJx7rW6KAKQ/3/odY0FTvDkLmQiHXJbDVKSiNpl3lNNvcfEil2hy24ZkNgd5gLHRuhgGtqz2VQ==
X-Received: by 2002:adf:8504:: with SMTP id 4mr14793773wrh.289.1598523258957; 
 Thu, 27 Aug 2020 03:14:18 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a7sm4223439wmj.24.2020.08.27.03.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:14:18 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:14:17 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: Re: [PATCH I v2 2/6] tools: switch XEN_LIBXEN* make variables to
 lower case (XEN_libxen*)
Message-ID: <20200827101417.ing634t4wqgo7ssa@liuwe-devbox-debian-v2>
References: <20200815130341.27147-1-jgross@suse.com>
 <20200815130341.27147-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200815130341.27147-3-jgross@suse.com>
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

On Sat, Aug 15, 2020 at 03:03:37PM +0200, Juergen Gross wrote:
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


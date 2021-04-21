Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54013668FE
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114308.217833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9uE-000739-0K; Wed, 21 Apr 2021 10:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114308.217833; Wed, 21 Apr 2021 10:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9uD-00072j-TK; Wed, 21 Apr 2021 10:16:25 +0000
Received: by outflank-mailman (input) for mailman id 114308;
 Wed, 21 Apr 2021 10:16:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZ9uC-00072Z-7l
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:16:24 +0000
Received: from mail-wr1-f47.google.com (unknown [209.85.221.47])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45bdc974-76b1-48d7-9846-a759d2c90958;
 Wed, 21 Apr 2021 10:16:23 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e7so31789137wrs.11
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:16:23 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id x17sm1850648wmi.46.2021.04.21.03.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:16:22 -0700 (PDT)
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
X-Inumbo-ID: 45bdc974-76b1-48d7-9846-a759d2c90958
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a8L00fq6w3tLS1J4TiEMawwljefhGTum8Vz7ClQHmUo=;
        b=kOdh9w18t6TKtcBiGErpFKpKL0JL8bodpGRqI5bdOc6OUOLiTkE4EvTjx/3Y5uynAT
         eQSywk8XOskFqpZCbbPg9EMj91n+aM3mcu4fa1v+B8QRo4NU7Uk5cNyNkrAxqAC0D9Lk
         Uyeyuyut2LptuZM5Zq0PMp2dB6w0pQeqcSBjy5cJCF8yVGdUvM29Bj1MuzGYQi8DsVyt
         1oS5saAwzpLBBid41GF8O4sbOI52oVZOdDR28AVeYhpZPIt32jiCP3K0l+9x/sFTGI5N
         d36fGiBd5uWyk9iLlzKF2g8vt6hWOY2FuLeVgrd5XcogI6l50nYDv4UgsFXOkyHwpyQW
         Pk1A==
X-Gm-Message-State: AOAM5331qOCN8nE2+brRjjDaCqA2hwUQuWkBXCuPZA4IXUE3l3YbSaBJ
	P89c0H0hitjhsFhTyRxcHUw=
X-Google-Smtp-Source: ABdhPJyMlB9Ysu2k2Papv/qrTU1yiZPoD897QSZEijpH+6oVqwvJCi/l6xG4eFm7xUdJHVy6QZpsuA==
X-Received: by 2002:a05:6000:190:: with SMTP id p16mr26577043wrx.334.1619000182812;
        Wed, 21 Apr 2021 03:16:22 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:16:21 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 5/6] tools/libs: move xc_core* from libxenctrl to
 libxenguest
Message-ID: <20210421101621.pr3v74tyjhaezgxl@liuwe-devbox-debian-v2>
References: <20210412152236.1975-1-jgross@suse.com>
 <20210412152236.1975-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412152236.1975-6-jgross@suse.com>

On Mon, Apr 12, 2021 at 05:22:35PM +0200, Juergen Gross wrote:
> The functionality in xc_core* should be part of libxenguest instead
> of libxenctrl. Users are already either in libxenguest, or in xl.
> There is one single exception: xc_core_arch_auto_translated_physmap()
> is being used by xc_domain_memory_mapping(), which is used by qemu.
> So leave the xc_core_arch_auto_translated_physmap() functionality in
> libxenctrl.
> 
> This will make it easier to merge common functionality of xc_core*
> and xg_sr_save*.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>


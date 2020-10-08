Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F162874F3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 15:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4486.11695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQVfG-0005b9-Bk; Thu, 08 Oct 2020 13:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4486.11695; Thu, 08 Oct 2020 13:08:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQVfG-0005ak-8A; Thu, 08 Oct 2020 13:08:58 +0000
Received: by outflank-mailman (input) for mailman id 4486;
 Thu, 08 Oct 2020 13:08:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQVfF-0005ad-BP
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 13:08:57 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00b669fc-c15b-4079-a615-b97206f4a653;
 Thu, 08 Oct 2020 13:08:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f21so6379664wml.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 06:08:56 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o3sm2772964wru.15.2020.10.08.06.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 06:08:54 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQVfF-0005ad-BP
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 13:08:57 +0000
X-Inumbo-ID: 00b669fc-c15b-4079-a615-b97206f4a653
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 00b669fc-c15b-4079-a615-b97206f4a653;
	Thu, 08 Oct 2020 13:08:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f21so6379664wml.3
        for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 06:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3rkwZWPGY+iNfIv5b9/+yjGaZwN2S6ImDZjPfKPPD1Y=;
        b=NzajfVpP5oXCZJ7YeF97BaaPrFF+FnrjFjjcfZoX8FuL056Dc+7gzqvb1D5fuqaDAk
         K41c6f1/q5NaTglkRDzZ0gwsE7HEHi8ngIyquAVwY5rclVuCUtuRRXowJ9T+S1Khpa92
         1g5BBk7xuuB/C1SPdnepLJJW1o3hwZaCfwaqctB2t4iYP+UmuQEnSWKMWlgu1/iCErG7
         ZRLczH64upXkDdUg+RiHor859PkQpsTS7vCrfHy9Kfcf6+AlkP6ZY6CDSJoDMQtKnznu
         HwT/OD6yanKs7asBYhwHJGKOHedBB7QamwnlD2CXA5dFQHr27Yrxb6/1bRi4Jpb2Cd+R
         QN/A==
X-Gm-Message-State: AOAM532E76eZ9x5Bwsc3NIZ/JTYMBG57LSopbcKk7PldBU58w81mWG4E
	uRrlUDLDEodwKxFY2VawxaU=
X-Google-Smtp-Source: ABdhPJyb32ZKFNJY4jHifOiJODc1kdl9Eqf0asg+YnQoCPs0UYzxzNi6VMpQW3j4XS/I1pklMIS7eQ==
X-Received: by 2002:a1c:bd57:: with SMTP id n84mr8966251wmf.126.1602162535392;
        Thu, 08 Oct 2020 06:08:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id o3sm2772964wru.15.2020.10.08.06.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 06:08:54 -0700 (PDT)
Date: Thu, 8 Oct 2020 13:08:53 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/5] libxl / iommu / domctl: introduce
 XEN_DOMCTL_IOMMU_SET_ALLOCATION...
Message-ID: <20201008130853.pwzxmex3uufi6emv@liuwe-devbox-debian-v2>
References: <20201005094905.2929-1-paul@xen.org>
 <20201005094905.2929-4-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005094905.2929-4-paul@xen.org>
User-Agent: NeoMutt/20180716

On Mon, Oct 05, 2020 at 10:49:03AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
[...]
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 6ec6c27c83..9631974dd6 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -520,6 +520,16 @@ int libxl__arch_domain_create(libxl__gc *gc, libxl_domain_config *d_config,
>                            NULL, 0, &shadow, 0, NULL);
>      }
>  
> +    if (d_config->b_info.iommu_memkb) {
> +        unsigned int nr_pages = DIV_ROUNDUP(d_config->b_info.iommu_memkb, 4);
> +

Please use XC_PAGE_SHIFT / XC_PAGE_SIZE for the calculation.

Wei.


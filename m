Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A58727FDE5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1198.4021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwHM-0001Bm-Mm; Thu, 01 Oct 2020 10:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198.4021; Thu, 01 Oct 2020 10:57:40 +0000
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
	id 1kNwHM-0001BL-Ij; Thu, 01 Oct 2020 10:57:40 +0000
Received: by outflank-mailman (input) for mailman id 1198;
 Thu, 01 Oct 2020 10:57:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNwHL-0001BD-7G
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:57:39 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac66f2ce-4205-4de9-82e1-ecc1ec75aed1;
 Thu, 01 Oct 2020 10:57:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e2so2549043wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:57:38 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q13sm8259640wra.93.2020.10.01.03.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:57:37 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNwHL-0001BD-7G
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:57:39 +0000
X-Inumbo-ID: ac66f2ce-4205-4de9-82e1-ecc1ec75aed1
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ac66f2ce-4205-4de9-82e1-ecc1ec75aed1;
	Thu, 01 Oct 2020 10:57:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e2so2549043wme.1
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dzol3yVXVExT+qqaUvqTP0armzVQ4jkLbrkE6c3+vCE=;
        b=G964OkoIZYYCkw9m3njlT64p4BIhk6FwqDU2pHdMOfboLVSrlro1JbV4eJeRpqw7uK
         DGgFIhLODS8vo3+opx0UFNIl8hvLoBNo8MVfscFPOGyZ3OYpN3znrvbJJwVflf+vS2hB
         LDEwZVHG4gMJDoSK0cXvH9PcQVZeA/zvunUWFyceSMPmf+IEdiu+Eoy75rHdklsZ7rLk
         n+DmCHaPIjBGOQdzq5HFTklEGeZQkm6Bu9YaNKYgmyDJiK+jNAW1GP/PiFWCBKaoRX3c
         t7d4Lw1dfh3RokDpLDVT2moySoACQeTBRgQ5SheqH2Ox17/RvrldsLAOn4ZqP+Lkv6j8
         gHIw==
X-Gm-Message-State: AOAM5332uAdJw6+sVQkT/UqinoD7rGE1/+vrEumVARsID/CTnx26BuU5
	nqB8BPJnWfmAPBrT1ZePaNw=
X-Google-Smtp-Source: ABdhPJyq91TaOQK0xGPuaA9/N+yacyJhyHZmyvQdsU5rZDY9lmb4B9yy1HjQMVX0vTocC38I8Td48Q==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr8311038wmi.105.1601549857646;
        Thu, 01 Oct 2020 03:57:37 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id q13sm8259640wra.93.2020.10.01.03.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:57:37 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:57:35 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 5/8] x86/hvm: Obsolete the use of HVM_PARAM_NESTEDHVM
Message-ID: <20201001105735.oiywarm7jjkbbjho@liuwe-devbox-debian-v2>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930134248.4918-6-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 30, 2020 at 02:42:45PM +0100, Andrew Cooper wrote:
> With XEN_DOMCTL_CDF_nested_virt now passed properly to domain_create(),
> reimplement nestedhvm_enabled() to use the property which is fixed for the
> lifetime of the domain.
> 
> This makes the call to nestedhvm_vcpu_initialise() from hvm_vcpu_initialise()
> no longer dead.  It became logically dead with the Xend => XL transition, as
> they initialise HVM_PARAM_NESTEDHVM in opposite orders with respect to
> XEN_DOMCTL_max_vcpus.
> 
> There is one opencoded user of nestedhvm_enabled() in HVM_PARAM_ALTP2M's
> safety check.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Wei Liu <wl@xen.org>


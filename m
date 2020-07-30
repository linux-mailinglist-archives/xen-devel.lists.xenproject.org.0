Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F45233851
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 20:19:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1D98-0003Al-2K; Thu, 30 Jul 2020 18:19:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1D97-00038A-F8
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 18:19:13 +0000
X-Inumbo-ID: 2b55c6cc-d291-11ea-ab02-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b55c6cc-d291-11ea-ab02-12813bfff9fa;
 Thu, 30 Jul 2020 18:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pmTU3PHEjg1Own64U+LvvF5TFRKUO3a3kTILLr6Uheo=; b=QkARhr3Ezw9GhgppPtmJYVUhfm
 Prupt2TkUO6oB4qkT/fH570pLkGMfOs3egfEblsZIce4N68hlAUDel+bmbwH7dC4OLxqpX5Rw1+wN
 FroKaqzLgdRS/0xXygLjjTPES/HZuTyNRcSlo8nNEiZnq49iWqvUkZj/Xl4WrkPEpYdE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1D91-0007qP-4H; Thu, 30 Jul 2020 18:19:07 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1D90-0006Wu-Us; Thu, 30 Jul 2020 18:19:07 +0000
Subject: Re: [PATCH v2 0/7] xen: Consolidate asm-*/guest_access.h in
 xen/guest_access.h
To: xen-devel@lists.xenproject.org
References: <20200730175213.30679-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <921c0d8d-0d78-8e15-6218-8095be6a0839@xen.org>
Date: Thu, 30 Jul 2020 19:19:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200730175213.30679-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

I have messed up this version. So I resend a new one.

Please ignore this version.

Cheers,

On 30/07/2020 18:52, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> A lot of the helpers implemented in asm-*/guest_access.h are implemented
> the same way. This series aims to avoid the duplication and implement
> them only once in xen/guest_access.h.
> 
> Cheers,
> 
> Julien Grall (7):
>    xen/guest_access: Add emacs magics
>    xen/arm: kernel: Re-order the includes
>    xen/arm: decode: Re-order the includes
>    xen/arm: guestcopy: Re-order the includes
>    xen: include xen/guest_access.h rather than asm/guest_access.h
>    xen/guest_access: Consolidate guest access helpers in
>      xen/guest_access.h
>    xen/guest_access: Fix coding style in xen/guest_access.h
> 
>   xen/arch/arm/decode.c                |   7 +-
>   xen/arch/arm/domain.c                |   2 +-
>   xen/arch/arm/guest_walk.c            |   3 +-
>   xen/arch/arm/guestcopy.c             |   5 +-
>   xen/arch/arm/kernel.c                |  12 +--
>   xen/arch/arm/vgic-v3-its.c           |   2 +-
>   xen/arch/x86/hvm/svm/svm.c           |   2 +-
>   xen/arch/x86/hvm/viridian/viridian.c |   2 +-
>   xen/arch/x86/hvm/vmx/vmx.c           |   2 +-
>   xen/common/libelf/libelf-loader.c    |   2 +-
>   xen/include/asm-arm/guest_access.h   | 115 -----------------------
>   xen/include/asm-x86/guest_access.h   | 116 ++----------------------
>   xen/include/xen/guest_access.h       | 131 +++++++++++++++++++++++++++
>   xen/lib/x86/private.h                |   2 +-
>   14 files changed, 161 insertions(+), 242 deletions(-)
> 

-- 
Julien Grall


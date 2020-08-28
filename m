Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51606255887
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 12:29:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBbcn-0003qd-Bm; Fri, 28 Aug 2020 10:28:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X//y=CG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kBbcl-0003qW-Vw
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 10:28:48 +0000
X-Inumbo-ID: 5bec70eb-6129-4490-b1fe-1433479cf921
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bec70eb-6129-4490-b1fe-1433479cf921;
 Fri, 28 Aug 2020 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=TPV+FZccIsLEXYwvCu4bcJ30Glxl9eniG1sxKDTPGS4=; b=47kJzYmAQGqyyHN0D+XRbFIAxm
 vZsDWRtmPmT6OGRQnRMYyrD7exxF73uCVeBeKYn2SRBPJG5wZN+dMOlbV0CI9510dam8zzC2306gH
 oqtgOzSGUWQ1+Xi3Itp9OG5VcLouCt/QqcQHYLGc4hZZJsSjFjmVBvKJPUswsrRaVUMk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kBbcj-00089t-4e; Fri, 28 Aug 2020 10:28:45 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kBbci-0003MU-Tn; Fri, 28 Aug 2020 10:28:45 +0000
Subject: Re: [RFC PATCH] xen/arm: Add Kconfig option for CONFIG_EARLY_PRINTK
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200828030427.GC25246@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b8d4c3ac-5973-7761-6a35-1bcbd7b75149@xen.org>
Date: Fri, 28 Aug 2020 11:28:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828030427.GC25246@mattapan.m5p.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Elliott,

On 28/08/2020 04:04, Elliott Mitchell wrote:
> Support for a very early console has existed for ARM for quite some
> time.  Previously EARLY_PRINTK had to be passed in as a Make variable,
> instead of as a configuration option.  Create the option to allow
> selecting via .config.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@drgnwing.com>
> 
> ---
> This is mostly RFC due to insufficient testing.  I am hopeful this
> successfully changes things to have the Kconfig CONFIG_EARLY_PRINTK
> option replace the environment/Make variable EARLY_PRINTK.

We already moved early printk to Kconfig in Xen 4.14. Which tree are you 
using?

Cheers,

-- 
Julien Grall


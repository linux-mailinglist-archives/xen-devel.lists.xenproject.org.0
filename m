Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5E1478E0D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 15:42:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248693.428970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEQw-0005QJ-L8; Fri, 17 Dec 2021 14:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248693.428970; Fri, 17 Dec 2021 14:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEQw-0005My-HQ; Fri, 17 Dec 2021 14:42:06 +0000
Received: by outflank-mailman (input) for mailman id 248693;
 Fri, 17 Dec 2021 14:42:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myEQv-0005Ms-2k
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 14:42:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myEQs-00051C-O0; Fri, 17 Dec 2021 14:42:02 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myEQs-0007cQ-ID; Fri, 17 Dec 2021 14:42:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=fOvVGrdGzqfCcKMwSSZQjwGBe5L71b2NBoZ5IlFxmA8=; b=YO4Uay7g3UEEoIMv7hTwb3LRZ8
	0+N7WYpe52r3JW6ohN07wylI9Tc8Pvd5+8g48rPJhNDwcy7GVoGTAEE1iedMB8WdCLcbYIeOfJeGi
	jF+CxglBK3BSenTrFe8d1aSYm0KfqShPXf0DxWP5eKBNmjO9ql7/tdZSCLiuNrJfxE4o=;
Message-ID: <4ac00ca3-6db8-d16f-8e86-b4c8d5e93f60@xen.org>
Date: Fri, 17 Dec 2021 14:42:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v2 04/18] IOMMU: add order parameter to ->{,un}map_page()
 hooks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <7500296c-588e-983e-35ac-39048a72cb47@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7500296c-588e-983e-35ac-39048a72cb47@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 24/09/2021 10:44, Jan Beulich wrote:
> Or really, in the case of ->map_page(), accommodate it in the existing
> "flags" parameter. All call sites will pass 0 for now.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

For the Arm bits:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6E7D1590
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 20:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619921.965793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttzs-0001Dd-Hy; Fri, 20 Oct 2023 18:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619921.965793; Fri, 20 Oct 2023 18:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttzs-0001BN-DT; Fri, 20 Oct 2023 18:13:20 +0000
Received: by outflank-mailman (input) for mailman id 619921;
 Fri, 20 Oct 2023 18:13:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qttzq-0001BF-Nz
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 18:13:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qttzp-00020Z-HJ; Fri, 20 Oct 2023 18:13:17 +0000
Received: from [54.239.6.188] (helo=[192.168.205.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qttzp-0006Yd-Ay; Fri, 20 Oct 2023 18:13:17 +0000
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
	bh=q9G45tJIWICHkA+KVSRLsXLJxvGjLNZjtGlaYfaswys=; b=eH8meLzyWKGXmGvSvb3GkT0E/L
	F5GMTFTzU+LCbdLRLVP8UiKfOWVo9F/m1+tj35x6NvaVOwGMhZuTmgLPbBNqOr783/sMIw16wWd3u
	089tPyQ++l47aAI0RHz9d+aSNkxZav9MVTAUl6bm1E6bARv5n6mRme3jPKTT9g1CAdSE=;
Message-ID: <2f802877-1d89-4d28-9f47-a13e7cd277c0@xen.org>
Date: Fri, 20 Oct 2023 19:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] Revert "xen/arm: Add cmdline boot option
 "pci-passthrough = <boolean>""
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-9-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231004145604.1085358-9-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/10/2023 15:55, Stewart Hildebrand wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> This enables us to use IOMMU + PCI in dom0 without having to specify
> "pci-passthrough=yes".

IIRC, the goal was to also allow to easily disable PCI passthrough (IOW 
vPCI at boot time). How would you do that now?

> 
> This reverts commit 15517ed61f55be6039aedcc99720ee07c772ed44.

Rahul's signed-off-by and yours are missing.

Cheers,

-- 
Julien Grall


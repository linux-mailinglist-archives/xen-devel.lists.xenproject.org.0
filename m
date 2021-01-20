Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3A2FD6C1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 18:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71654.128489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2H8l-00027X-7L; Wed, 20 Jan 2021 17:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71654.128489; Wed, 20 Jan 2021 17:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2H8l-00026v-3c; Wed, 20 Jan 2021 17:19:31 +0000
Received: by outflank-mailman (input) for mailman id 71654;
 Wed, 20 Jan 2021 17:19:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2H8j-00026U-4F
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:19:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2H8h-0005mZ-V8; Wed, 20 Jan 2021 17:19:27 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2H8h-0006G8-Ns; Wed, 20 Jan 2021 17:19:27 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=LQxXHCWGNzRuFjZB64Cn5r6cNJWMnGIymz3fDz8Iz0I=; b=rf/X4FPL8+7Pu8/zSBMDDlelc2
	Zx7P6eKG2b4ogj2/p4NfrCvjV7Qc270+rCiX/EbmR1aRUGp6Vkcsf1OROtnxCZzn5JXzPTFQ0Ms7r
	9tbchhMP7o/H5aH1SOhHhEXsUCFuZZl0l4KUWYCxv3EsTpc+UYi0RUvndnBPsFIQ5i3g=;
Subject: Re: [XEN PATCH] xen/arm: Hide Pointer Authentication (PAC)
To: Vladimir Murzin <vladimir.murzin@arm.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
References: <20210120112712.9534-1-vladimir.murzin@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <af352e05-1d56-0b4b-23c6-5aa52ba2ac6b@xen.org>
Date: Wed, 20 Jan 2021 17:19:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120112712.9534-1-vladimir.murzin@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Vladimir,

On 20/01/2021 11:27, Vladimir Murzin wrote:
> The ARMv8.3 Pointer Authentication extension is not supported by Xen
> at the moment, so do not expose that via ID register.
> 
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

As I think this one can be considered as a bug fix to the recent series 
from Bertrand. So I will commit it without Ian's RM tag (although he did 
gave it on IRC).

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBE27D50EC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621936.968891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvH6E-0001EQ-22; Tue, 24 Oct 2023 13:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621936.968891; Tue, 24 Oct 2023 13:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvH6D-0001AO-Vk; Tue, 24 Oct 2023 13:05:33 +0000
Received: by outflank-mailman (input) for mailman id 621936;
 Tue, 24 Oct 2023 13:05:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvH6B-0001AI-Uv
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:05:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvH6B-0000aC-Mt; Tue, 24 Oct 2023 13:05:31 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.12.80]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvH6B-0006jc-HH; Tue, 24 Oct 2023 13:05:31 +0000
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
	bh=tNd7IOoVfY5F2UISZgKRXIU4EeiBV+8Tm5DHCBZYBVc=; b=mBneF2U8XBplZ6mKvERmStJJc+
	CcW8pHsJrwu49qlhPGYhcMLkv9k/RmHSFQXSCwg/AA8BN4BIU3/84azio/l8INnkOHh9Wz7CJ4g+o
	PC2RTSDoIuY1iQDBoJ0uPaxz2A3XHFyy8HMyYgIe1f+Dnt+ZA0AkHKD77ByJkyciDoWw=;
Message-ID: <e378a94e-5528-4509-bf80-bbf2fbf13e08@xen.org>
Date: Tue, 24 Oct 2023 14:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: make Michal Orzel ARM Maintainer
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, Henry.Wang@arm.com
References: <alpine.DEB.2.22.394.2310231356210.3516@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310231356210.3516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/10/2023 21:56, Stefano Stabellini wrote:
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


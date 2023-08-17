Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57477F3F3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 11:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585255.916322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZlS-00010s-2f; Thu, 17 Aug 2023 09:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585255.916322; Thu, 17 Aug 2023 09:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWZlR-0000ym-V8; Thu, 17 Aug 2023 09:58:01 +0000
Received: by outflank-mailman (input) for mailman id 585255;
 Thu, 17 Aug 2023 09:58:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWZlQ-0000yg-VG
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 09:58:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWZlQ-00009o-8g; Thu, 17 Aug 2023 09:58:00 +0000
Received: from [54.239.6.180] (helo=[192.168.0.78])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWZlQ-0006hq-0a; Thu, 17 Aug 2023 09:58:00 +0000
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
	bh=yIzJgQZVqe1iqkHJHjc2isK64yo0OZoHCMdOxMJy9nc=; b=T55OJxZF9FfVCrSi9fuvHmv4em
	0/8g0pYBVvNlomKz/MW9gsjER2sJ5Uz3tX1q/YOxS95+kNmUaXXZopkI5DjH8CUtDAez+YGIn3+aE
	ERtIEaWnQ7/L0kZjPsWCp2sVMsZDTqokHAZ7zGeXuLFnkKQLuHPa9+Lcm/bQjoza+sCY=;
Message-ID: <472241eb-0417-46e8-b713-79586642df55@xen.org>
Date: Thu, 17 Aug 2023 10:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] misra: add more entires to exclude-list.json
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <186af44774dc4670cb1ca0d8238e0620c3d0fc2f.1692266054.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <186af44774dc4670cb1ca0d8238e0620c3d0fc2f.1692266054.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/08/2023 10:55, Federico Serafini wrote:
> Add entries to the exclude-list.json for those files that need to be
> excluded from the analysis scan.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v2:
> - fixed indentation.

What's the difference with the other v2 you posted ~10 min ago?

Is this the patch we need to review? If so, can you review on the 
previous one to explicitely say it should be ignored.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4396E244E81
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 20:41:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6edH-0006Nm-Ll; Fri, 14 Aug 2020 18:40:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=osIB=BY=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6edG-0006Nh-H4
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 18:40:50 +0000
X-Inumbo-ID: 6715befa-ed4f-469e-b3a2-774f4a166f03
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6715befa-ed4f-469e-b3a2-774f4a166f03;
 Fri, 14 Aug 2020 18:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=soDxK5jgSL7dD2JSBIJDs7Cn7oF+NJbXGh1kElgJSNE=; b=nEANIo3tgV8WVr3zs6r8E3e+68
 r/yLnAxAWj1CpixbwtjCLFIPCcLK/EUKXF0fXuQC33o6itav2Pt0uohI8zL+BsHzge+XyXvF25kkT
 PK35Ggstrr+iKhcA3O2F1QhmiezI8rVpc5oDoZkhuRUDv2/7gLWjG+pTjRXXUsGUpiA4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6edE-0004Bc-Aj; Fri, 14 Aug 2020 18:40:48 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6edE-00087q-2g; Fri, 14 Aug 2020 18:40:48 +0000
Subject: Re: [RESEND][PATCH v2 3/7] xen/arm: decode: Re-order the includes
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-4-julien@xen.org>
 <alpine.DEB.2.21.2007301219061.1767@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <8051d12c-4103-ca88-0b15-680e3ebd0349@xen.org>
Date: Fri, 14 Aug 2020 19:40:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007301219061.1767@sstabellini-ThinkPad-T480s>
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

Hi Stefano,

On 30/07/2020 20:37, Stefano Stabellini wrote:
> On Thu, 30 Jul 2020, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> We usually have xen/ includes first and then asm/. They are also ordered
>> alphabetically among themselves.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Might wanna mention the change from asm/guest_access.h to
> xen/guest_access.h. 

Actually, the change in kernel.c belongs to patch #5. I will move it there.

> Anyway:
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

I will keep the Acked-by for the first change.

Thank you,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955AE273D9B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 10:44:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKduT-0007HD-GT; Tue, 22 Sep 2020 08:44:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1J9w=C7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKduS-0007H5-4K
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 08:44:24 +0000
X-Inumbo-ID: 8db597e7-344c-431c-bed6-094911f8940b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8db597e7-344c-431c-bed6-094911f8940b;
 Tue, 22 Sep 2020 08:44:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600764261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p3AfavqP40RUc2ETYtkDYnb3b9veh8eZpjijhPHw0fc=;
 b=TWukYMwD7NFNDXCfb/SO1wW+Oz14Lc4t+udWA6n+g3RqJeXVz2Juwadua8CE15vItHHMrs
 X6WmgQfgzuJ2s2nZDqn6V++LThK0r867znHK8COMio8Ev1fv4NV1F1uVtxdHD6OCRwLsKU
 rvXF2wfA4LKaMQ6GOgWLDnTfsNUc0CE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 733E9ACBF;
 Tue, 22 Sep 2020 08:44:58 +0000 (UTC)
Subject: Re: [PATCH] xen: remove redundant initialization of variable ret
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20200919031702.32192-1-jingxiangfeng@huawei.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <94b57348-2a8c-b0b9-1b83-b92b1e0216c9@suse.com>
Date: Tue, 22 Sep 2020 10:44:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200919031702.32192-1-jingxiangfeng@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

On 19.09.20 05:17, Jing Xiangfeng wrote:
> After commit 9f51c05dc41a ("pvcalls-front: Avoid
> get_free_pages(GFP_KERNEL) under spinlock"), the variable ret is being
> initialized with '-ENOMEM' that is meaningless. So remove it.
> 
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


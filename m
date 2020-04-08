Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688F81A1D89
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 10:44:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM6Jt-00070n-IJ; Wed, 08 Apr 2020 08:44:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D8Jc=5Y=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jM6Jr-00070h-LF
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 08:44:23 +0000
X-Inumbo-ID: 24b41c3a-7975-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24b41c3a-7975-11ea-9e09-bc764e2007e4;
 Wed, 08 Apr 2020 08:44:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6413AFCA;
 Wed,  8 Apr 2020 08:44:19 +0000 (UTC)
Subject: Re: [PATCH] x86/xen: make xen_pvmmu_arch_setup() static
To: Jason Yan <yanaijie@huawei.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, x86@kernel.org, xen-devel@lists.xenproject.org
References: <20200408024605.42394-1-yanaijie@huawei.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4a950af3-5e8f-ef8b-0fa8-3289589797d0@suse.com>
Date: Wed, 8 Apr 2020 10:44:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408024605.42394-1-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

On 08.04.20 04:46, Jason Yan wrote:
> Fix the following sparse warning:
> 
> arch/x86/xen/setup.c:998:12: warning: symbol 'xen_pvmmu_arch_setup' was not
> declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


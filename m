Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4362525F9DB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 13:49:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFFeW-0002QW-S1; Mon, 07 Sep 2020 11:49:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72DF=CQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kFFeV-0002QN-9T
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 11:49:39 +0000
X-Inumbo-ID: 5b0e65e0-c43a-4c8b-8d07-b4012f9cd7b8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b0e65e0-c43a-4c8b-8d07-b4012f9cd7b8;
 Mon, 07 Sep 2020 11:49:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E69BDAC2F;
 Mon,  7 Sep 2020 11:49:37 +0000 (UTC)
Subject: Re: [PATCH] config: use mini-os master for unstable
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
References: <20200907114814.15620-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <215f90d3-6f21-df40-6ff3-199529fc171e@suse.com>
Date: Mon, 7 Sep 2020 13:49:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907114814.15620-1-jgross@suse.com>
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

Sorry, please ignore, this was an old patch lying around. :-(

On 07.09.20 13:48, Juergen Gross wrote:
> We haven't used mini-os master for about 2 years now due to a stubdom
> test failing [1]. Booting a guest with mini-os master used for building
> stubdom didn't reveal any problem, so use master for unstable in order
> to let OSStest find any problems not showing up in the local test.
> 
> [1]: https://lists.xen.org/archives/html/minios-devel/2018-04/msg00015.html
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   Config.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.mk b/Config.mk
> index dc6e7d03df..0f303c79b2 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -245,7 +245,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
>   endif
>   OVMF_UPSTREAM_REVISION ?= 20d2e5a125e34fc8501026613a71549b2a1a3e54
>   QEMU_UPSTREAM_REVISION ?= master
> -MINIOS_UPSTREAM_REVISION ?= 0b4b7897e08b967a09bed2028a79fabff82342dd
> +MINIOS_UPSTREAM_REVISION ?= master
>   
>   SEABIOS_UPSTREAM_REVISION ?= rel-1.13.0
>   
> 



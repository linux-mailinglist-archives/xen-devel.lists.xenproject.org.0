Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164025440C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:56:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFaK-0000Y4-Ek; Thu, 27 Aug 2020 10:56:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8NI=CF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBFaI-0000Xs-Sr
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:56:46 +0000
X-Inumbo-ID: 4065c622-5342-4887-838a-26ec31488794
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4065c622-5342-4887-838a-26ec31488794;
 Thu, 27 Aug 2020 10:56:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79DA8B75B;
 Thu, 27 Aug 2020 10:57:17 +0000 (UTC)
Subject: Re: [PATCH] gitignore: ignore ebmalloc.c soft link
To: Wei Liu <wl@xen.org>
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20200827104838.36072-1-wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2c1a3d5-10e3-b006-6e86-0d4199caddb5@suse.com>
Date: Thu, 27 Aug 2020 12:56:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827104838.36072-1-wl@xen.org>
Content-Type: text/plain; charset=utf-8
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

On 27.08.2020 12:48, Wei Liu wrote:
> A previous commit split ebmalloc to its own translation unit but forgot
> to modify gitignore.
> 
> Fixes: 8856a914bffd ("build: also check for empty .bss.* in .o -> .init.o conversion")
> Signed-off-by: Wei Liu <wl@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks, and I'm sorry for not having paid attention myself.

Jan


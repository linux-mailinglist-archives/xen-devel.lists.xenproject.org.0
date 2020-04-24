Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78CE1B7B36
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 18:12:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS0vf-0007hi-Fm; Fri, 24 Apr 2020 16:11:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jS0vd-0007hd-Cc
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 16:11:49 +0000
X-Inumbo-ID: 4cae75a4-8646-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cae75a4-8646-11ea-9e09-bc764e2007e4;
 Fri, 24 Apr 2020 16:11:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A48DCAD11;
 Fri, 24 Apr 2020 16:11:46 +0000 (UTC)
Subject: Re: [XEN PATCH] xen/build: silence make warnings about missing
 auto.conf*
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200424143058.2546905-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <875778ca-dee2-0be4-bf35-54c439900baf@suse.com>
Date: Fri, 24 Apr 2020 18:11:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424143058.2546905-1-anthony.perard@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.2020 16:30, Anthony PERARD wrote:
> In a clean tree, both files include/config/auto.conf{,.cmd} are
> missing and older version of GNU Make complain about it:
>     Makefile:103: include/config/auto.conf: No such file or directory
>     Makefile:106: include/config/auto.conf.cmd: No such file or directory
> 
> Those warnings are harmless, make will create the files and start over. But
> to avoid confusion, we'll use "-include" to silence the warning.
> 
> Those warning started to appear with commit 6c122d3984a5 ("xen/build:
> include include/config/auto.conf in main Makefile").
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



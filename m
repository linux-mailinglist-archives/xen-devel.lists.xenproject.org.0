Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0193B1D7644
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 13:11:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jadfO-0003xy-Qz; Mon, 18 May 2020 11:10:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jadfN-0003xt-AR
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 11:10:41 +0000
X-Inumbo-ID: 353d425a-98f8-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 353d425a-98f8-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 11:10:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05189ADAB;
 Mon, 18 May 2020 11:10:41 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: Fix memory leaks in hvm_copy_context_and_params()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200516122221.5434-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3fecba0e-6f3d-c1ec-fc77-0bdd6f1e0906@suse.com>
Date: Mon, 18 May 2020 13:10:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200516122221.5434-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.05.2020 14:22, Andrew Cooper wrote:
> Any error from hvm_save() or hvm_set_param() leaks the c.data allocation.
> 
> Spotted by Coverity.
> 
> Fixes: 353744830 "x86/hvm: introduce hvm_copy_context_and_params"
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



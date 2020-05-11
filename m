Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE96F1CD38E
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 10:13:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY3Xn-0000zq-E8; Mon, 11 May 2020 08:12:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tfUY=6Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jY3Xl-0000zl-48
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 08:12:09 +0000
X-Inumbo-ID: 1b0a63c0-935f-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b0a63c0-935f-11ea-9887-bc764e2007e4;
 Mon, 11 May 2020 08:12:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6E202ADC2;
 Mon, 11 May 2020 08:12:09 +0000 (UTC)
Subject: Re: [PATCH] xen-platform: Constify dev_pm_ops
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 boris.ostrovsky@oracle.com, sstabellini@kernel.org
References: <20200509134755.15038-1-rikard.falkeborn@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <03d892fb-eb90-19e1-9d23-71d4b9df75ff@suse.com>
Date: Mon, 11 May 2020 10:12:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200509134755.15038-1-rikard.falkeborn@gmail.com>
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.05.20 15:47, Rikard Falkeborn wrote:
> dev_pm_ops is never modified, so mark it const to allow the compiler to
> put it in read-only memory.
> 
> Before:
>     text    data     bss     dec     hex filename
>     2457    1668     256    4381    111d drivers/xen/platform-pci.o
> 
> After:
>     text    data     bss     dec     hex filename
>     2681    1444     256    4381    111d drivers/xen/platform-pci.o
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


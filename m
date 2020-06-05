Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232DC1EF69C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 13:43:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhAkc-000086-5W; Fri, 05 Jun 2020 11:43:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0+o2=7S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jhAkb-000081-CQ
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 11:43:05 +0000
X-Inumbo-ID: b762d0a6-a721-11ea-96fb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b762d0a6-a721-11ea-96fb-bc764e2007e4;
 Fri, 05 Jun 2020 11:43:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B49E5AF39;
 Fri,  5 Jun 2020 11:43:06 +0000 (UTC)
Subject: Re: [PATCH for-4.14] libs/hypfs: use correct zlib name in pc file
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
References: <20200605113725.30982-1-wl@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <034b6887-640e-a051-3821-00ef7615e010@suse.com>
Date: Fri, 5 Jun 2020 13:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200605113725.30982-1-wl@xen.org>
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
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.06.20 13:37, Wei Liu wrote:
> Its name is "zlib" not "z".
> 
> Reported-by: Olaf Hering <olaf@aepfle.de>
> Fixes: 86234eafb952 ("libs: add libxenhypfs")
> Signed-off-by: Wei Liu <wl@xen.org>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


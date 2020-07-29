Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E94B232584
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 21:42:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0rxG-0007E9-Tt; Wed, 29 Jul 2020 19:41:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0rxF-0007E4-4E
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 19:41:33 +0000
X-Inumbo-ID: 80e14378-d1d3-11ea-8ccf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80e14378-d1d3-11ea-8ccf-bc764e2007e4;
 Wed, 29 Jul 2020 19:41:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5FF07ADD9;
 Wed, 29 Jul 2020 19:41:43 +0000 (UTC)
Subject: Re: [PATCH 1/5] xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49ceef5f-e353-c7ef-1e8e-0a0c10643304@suse.com>
Date: Wed, 29 Jul 2020 21:41:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728113712.22966-2-andrew.cooper3@citrix.com>
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 13:37, Andrew Cooper wrote:
> New architectures shouldn't be forced to implement no-op stubs for unused
> functionality.
> 
> Introduce CONFIG_ARCH_ACQUIRE_RESOURCE which can be opted in to, and provide
> compatibility logic in xen/mm.h
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


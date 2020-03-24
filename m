Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE51909AA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 10:41:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGg1n-00061T-51; Tue, 24 Mar 2020 09:39:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGg1l-00061O-UQ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 09:39:17 +0000
X-Inumbo-ID: 54051804-6db3-11ea-83a7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54051804-6db3-11ea-83a7-12813bfff9fa;
 Tue, 24 Mar 2020 09:39:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C90E2B0B8;
 Tue, 24 Mar 2020 09:39:15 +0000 (UTC)
To: Paul Durrant <paul@xen.org>
References: <20200318173243.29183-1-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <945a52df-777b-9756-edf4-d0ab3474d231@suse.com>
Date: Tue, 24 Mar 2020 10:39:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318173243.29183-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v4 0/3] make sure PGC_extra pages are dealt
 with properly
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.03.2020 18:32, Paul Durrant wrote:
> This series was formerly called "remove one more shared xenheap page:
> shared_info" but I have dropped the patches actually changing shared_info
> and just left the PGC_extra clean-up that was previously intertwined.
> 
> Paul Durrant (3):
>   mm: keep PGC_extra pages on a separate list
>   x86 / ioreq: use a MEMF_no_refcount allocation for server pages...
>   mm: add 'is_special_page' inline function...

So I'm confused - I had just replied twice to v6 patch 5/5. This
series calls itself v4 and consists of the middle three patches
of what v6 was. What's the deal? Is this really v7, and the two
patches have been dropped / postponed?

Jan


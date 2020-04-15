Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F05A1A9545
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 09:56:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOctz-0003VP-Qb; Wed, 15 Apr 2020 07:56:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOcty-0003VK-5p
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 07:56:06 +0000
X-Inumbo-ID: 8bf45be8-7eee-11ea-8a12-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bf45be8-7eee-11ea-8a12-12813bfff9fa;
 Wed, 15 Apr 2020 07:56:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1AE9CB168;
 Wed, 15 Apr 2020 07:55:59 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] x86_64/mm: map and unmap page tables in
 share_hotadd_m2p_table
To: Hongyan Xia <hx242@xen.org>
References: <cover.1586352238.git.hongyxia@amazon.com>
 <9bf2df7cfd65eb783afeab7d27b98b1a99233a3c.1586352238.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aec7763c-df3d-1ee3-9313-37e4c4341aff@suse.com>
Date: Wed, 15 Apr 2020 09:55:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9bf2df7cfd65eb783afeab7d27b98b1a99233a3c.1586352238.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.04.2020 15:36, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Fetch lYe by mapping and unmapping lXe instead of using the direct map,
> which is now done via the lYe_from_lXe() helpers.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



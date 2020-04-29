Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD21BDA3D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 13:04:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTkVe-0001nw-Im; Wed, 29 Apr 2020 11:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTkVd-0001nr-54
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 11:04:09 +0000
X-Inumbo-ID: 25eab45c-8a09-11ea-992b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25eab45c-8a09-11ea-992b-12813bfff9fa;
 Wed, 29 Apr 2020 11:04:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 111A9AC44;
 Wed, 29 Apr 2020 11:04:07 +0000 (UTC)
Subject: Re: [PATCH 5/6] x86/pv: map and unmap page tables in
 mark_pv_pt_pages_rdonly
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <9287363e13924f4a633b47b53c23b3466e26e4a8.1587116799.git.hongyxia@amazon.com>
 <fbb4a755-c450-77dd-2aa5-44c01b42a5ff@suse.com>
 <9df9c5163fde5d25ceb756b20714c58be93b2c6c.camel@xen.org>
 <c33dcaee9c8796da8816de9168f91ce90de61fc5.camel@xen.org>
 <e18871ea997a304394adbbc92e724ae0ec56d87a.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec318c48-41c3-5cbf-e03e-8838d9f488ba@suse.com>
Date: Wed, 29 Apr 2020 13:04:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e18871ea997a304394adbbc92e724ae0ec56d87a.camel@xen.org>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 11:26, Hongyan Xia wrote:
> But if people do not have a problem with plXe - 1, I will post a new
> revision for that.

I'd prefer that; I could live with the current version, but I'm
not in favor of it.

Jan


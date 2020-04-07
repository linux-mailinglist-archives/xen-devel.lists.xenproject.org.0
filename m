Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA81A08DF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 10:06:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLjEi-0001JY-OV; Tue, 07 Apr 2020 08:05:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=71dA=5X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLjEh-0001JT-Kh
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 08:05:31 +0000
X-Inumbo-ID: 8c6253e4-78a6-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c6253e4-78a6-11ea-b4f4-bc764e2007e4;
 Tue, 07 Apr 2020 08:05:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E351AAC2C;
 Tue,  7 Apr 2020 08:05:28 +0000 (UTC)
Subject: Re: [PATCH 1/7] xen/guest_access: Add missing emacs magics
To: Julien Grall <julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c0afc2d-59b0-28ec-66e6-575d02a8667e@suse.com>
Date: Tue, 7 Apr 2020 10:05:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200404131017.27330-2-julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.04.2020 15:10, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Add missing emacs magics for xen/guest_access.h and
> asm-x86/guest_access.h.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I don't think these are "missing"; as per ./CODING_STYLE they're
permitted, but not required (and I continue to question why one
form of such a comment should be preferred over possible other
forms other editors may support). Nevertheless, as this is in
line with what we have elsewhere:

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


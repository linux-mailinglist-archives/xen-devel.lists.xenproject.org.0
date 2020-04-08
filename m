Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E931A23A1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 15:53:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMB8c-0001Af-DP; Wed, 08 Apr 2020 13:53:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMB8b-0001Aa-3C
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 13:53:05 +0000
X-Inumbo-ID: 43f69be2-79a0-11ea-81f0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43f69be2-79a0-11ea-81f0-12813bfff9fa;
 Wed, 08 Apr 2020 13:53:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A617FACF0;
 Wed,  8 Apr 2020 13:53:01 +0000 (UTC)
Subject: Re: [XEN PATCH v4 17/18] build, include: rework compat-build-source.py
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-18-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57d9630d-d70e-bb20-1d8b-307d2bbc740f@suse.com>
Date: Wed, 8 Apr 2020 15:53:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331103102.1105674-18-anthony.perard@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 12:31, Anthony PERARD wrote:
> Improvement are:
> - give the path to xlat.lst as argument
> - include `grep -v` in compat-build-source.py script, we don't need to
>   write this in several scripted language.
> - have 'xlat.lst' path as a variable.

The change looks okay, but I'm unsure whether it's really worthwhile.
I specifically dislike the last point above, as it makes things less
easy to read. I might be willing to ack a patch with this part taken
out again; faod I'm not meaning to nak the patch in its current form,
but I guess I'm also not going to ack it.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1252344B1
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:42:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TQC-0007Jw-0h; Fri, 31 Jul 2020 11:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1TQA-0007Jj-Uh
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:41:54 +0000
X-Inumbo-ID: d45e36fa-d322-11ea-aba1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d45e36fa-d322-11ea-aba1-12813bfff9fa;
 Fri, 31 Jul 2020 11:41:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0FA76B6A4;
 Fri, 31 Jul 2020 11:42:06 +0000 (UTC)
Subject: Re: [RESEND][PATCH v2 7/7] xen/guest_access: Fix coding style in
 xen/guest_access.h
To: Julien Grall <julien@xen.org>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-8-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3bafb97f-45a3-7203-3e73-37e73c453de6@suse.com>
Date: Fri, 31 Jul 2020 13:41:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730181827.1670-8-julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.2020 20:18, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
>     * Add space before and after operator
>     * Align \
>     * Format comments

How about also

    * remove/replace leading underscores

?

Jan


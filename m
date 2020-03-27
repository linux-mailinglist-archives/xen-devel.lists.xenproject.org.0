Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39B195776
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:46:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHoLa-0000AV-OH; Fri, 27 Mar 2020 12:44:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xJX5=5M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHoLZ-0000AQ-0h
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:44:25 +0000
X-Inumbo-ID: afaf8abe-7028-11ea-896b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id afaf8abe-7028-11ea-896b-12813bfff9fa;
 Fri, 27 Mar 2020 12:44:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2DB20AC5B;
 Fri, 27 Mar 2020 12:44:23 +0000 (UTC)
To: julien@xen.org
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-15-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e078fa4-8d38-e6bc-27c2-d1e91d0b6d3c@suse.com>
Date: Fri, 27 Mar 2020 13:44:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200322161418.31606-15-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 14/17] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.03.2020 17:14, julien@xen.org wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> set_gpfn_from_mfn() is currently implement in a 2 part macros. The
> second macro is only called within the first macro, so they can be
> folded together.
> 
> Furthermore, this is now converted to a static inline making the code
> more readable and safer.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


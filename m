Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BF819297A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 14:21:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH5uT-0001CP-81; Wed, 25 Mar 2020 13:17:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH5uR-0001Bs-CE
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 13:17:27 +0000
X-Inumbo-ID: f881f1db-6e9a-11ea-8607-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f881f1db-6e9a-11ea-8607-12813bfff9fa;
 Wed, 25 Mar 2020 13:17:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2CE62AC4A;
 Wed, 25 Mar 2020 13:17:25 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200325105511.20882-1-jgross@suse.com>
 <20200325105511.20882-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fcc178d6-422b-a295-86fe-906ff7d19828@suse.com>
Date: Wed, 25 Mar 2020 14:17:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200325105511.20882-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v7 1/5] xen: introduce
 smp_mb__[after|before]_atomic() barriers
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
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 11:55, Juergen Gross wrote:
> When using atomic variables for synchronization barriers are needed
> to ensure proper data serialization. Introduce smp_mb__before_atomic()
> and smp_mb__after_atomic() as in the Linux kernel for that purpose.
> 
> Use the same definitions as in the Linux kernel.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



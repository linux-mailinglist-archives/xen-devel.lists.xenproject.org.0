Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CAB1C5773
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 15:52:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVxzJ-00088c-Ml; Tue, 05 May 2020 13:51:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVxzI-00088V-MG
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 13:51:56 +0000
X-Inumbo-ID: 9502ac0a-8ed7-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9502ac0a-8ed7-11ea-ae69-bc764e2007e4;
 Tue, 05 May 2020 13:51:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 861EAAC7B;
 Tue,  5 May 2020 13:51:57 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Prune include lists
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200505114236.31269-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <460a0a7a-17b4-5f02-943d-4b637d2a089c@suse.com>
Date: Tue, 5 May 2020 15:51:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505114236.31269-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.05.2020 13:42, Andrew Cooper wrote:
> Several of these in particular haven't been pruned since the logic was all
> part of arch/x86/traps.c
> 
> Some adjustments to header files are required to avoid compile errors:
>  * emulate.h needs xen/sched.h because gdt_ldt_desc_ptr() uses v->vcpu_id.
>  * mmconfig.h needs to forward declare acpi_table_header.
>  * shadow.h and trace.h need to have uint*_t in scope before including the Xen
>    public headers.  For shadow.h, reorder the includes.  For trace.h, include
>    types.h
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



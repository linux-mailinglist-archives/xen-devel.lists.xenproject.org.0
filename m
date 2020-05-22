Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E2F1DE76F
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 14:58:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc7G6-0001f0-16; Fri, 22 May 2020 12:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc7G4-0001es-7v
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 12:58:40 +0000
X-Inumbo-ID: f4c1c5fc-9c2b-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4c1c5fc-9c2b-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 12:58:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4EF1EAE56;
 Fri, 22 May 2020 12:58:41 +0000 (UTC)
Subject: Re: [PATCH] xen/trace: Don't dump offline CPUs in
 debugtrace_dump_worker()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200521084422.24073-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dd29969b-d261-59b4-824d-5748a2f831d8@suse.com>
Date: Fri, 22 May 2020 14:58:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521084422.24073-1-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.05.2020 10:44, Andrew Cooper wrote:
> The 'T' debugkey reliably wedges on one of my systems, which has a sparse
> APIC_ID layout due to a non power-of-2 number of cores per socket.  The
> per_cpu(dt_cpu_data, cpu) calcution falls over the deliberately non-canonical
> poison value.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



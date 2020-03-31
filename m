Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9CF198D9F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 09:55:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJBgA-0002wS-2P; Tue, 31 Mar 2020 07:51:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJBg8-0002wN-DA
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 07:51:20 +0000
X-Inumbo-ID: 6853ab6a-7324-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6853ab6a-7324-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 07:51:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0CD48AFAC;
 Tue, 31 Mar 2020 07:51:19 +0000 (UTC)
Subject: Re: [PATCH v2] xen/x86: Compress lines for immediate return
To: Simran Singhal <singhalsimran0@gmail.com>
References: <20200330122308.GA10191@simran-Inspiron-5558>
 <20200330131858.2jw63fztr4l4sc65@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f53d9d11-c33b-970f-adda-8d3221f4b810@suse.com>
Date: Tue, 31 Mar 2020 09:51:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330131858.2jw63fztr4l4sc65@debian>
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.03.2020 15:18, Wei Liu wrote:
> On Mon, Mar 30, 2020 at 05:53:08PM +0530, Simran Singhal wrote:
>> Compress two lines into a single line if immediate return statement is found.
>> It also remove variables retval, freq, effective, vector, ovf and now
>> as they are no longer needed.
>>
>> Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
> 
> Reviewed-by: Wei Liu <wl@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEB221D175
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 10:15:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jutcF-0003Oj-Rk; Mon, 13 Jul 2020 08:15:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jutcD-0003OX-Up
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 08:15:09 +0000
X-Inumbo-ID: f75fc830-c4e0-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f75fc830-c4e0-11ea-8496-bc764e2007e4;
 Mon, 13 Jul 2020 08:15:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9304FAF01;
 Mon, 13 Jul 2020 08:15:10 +0000 (UTC)
Subject: Re: [PATCH] docs: specify stability of hypfs path documentation
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200713051639.26948-1-jgross@suse.com>
 <003b01d658ed$831ae680$8950b380$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f7ff8cc6-9730-8ec9-c5c6-32d3708dd40a@suse.com>
Date: Mon, 13 Jul 2020 10:15:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <003b01d658ed$831ae680$8950b380$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.07.20 10:13, Paul Durrant wrote:
>> -----Original Message-----
>> From: Juergen Gross <jgross@suse.com>
>> Sent: 13 July 2020 06:17
>> To: xen-devel@lists.xenproject.org
>> Cc: paul@xen.org; Juergen Gross <jgross@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George
>> Dunlap <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan Beulich
>> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei
>> Liu <wl@xen.org>
>> Subject: [PATCH] docs: specify stability of hypfs path documentation
>>
>> In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
>> file system are specified. Make it more clear that path availability
>> might change, e.g. due to scope widening or narrowing (e.g. being
>> limited to a specific architecture).
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> This might be a candidate for 4.14, as hypfs is new in 4.14 and the
>> documentation should be as clear as possible.
> 
> Agreed. Since this a pure documentation change it carries no risk, so once the final wording is agreed then consider it...
> 
> Release-acked-by: Paul Durrant <paul@xen.org>

Thanks!


Juergen


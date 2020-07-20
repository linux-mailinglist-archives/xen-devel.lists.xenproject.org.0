Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CA7225D95
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 13:41:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxUA5-0000pe-A3; Mon, 20 Jul 2020 11:40:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxUA3-0000pY-Ik
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 11:40:47 +0000
X-Inumbo-ID: d99063ee-ca7d-11ea-9f8a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d99063ee-ca7d-11ea-9f8a-12813bfff9fa;
 Mon, 20 Jul 2020 11:40:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A13D9AB7A;
 Mon, 20 Jul 2020 11:40:51 +0000 (UTC)
Subject: Re: [PATCH v3] docs: specify stability of hypfs path documentation
To: paul@xen.org
References: <20200720112137.27327-1-jgross@suse.com>
 <0463f87c-2139-7f17-02d8-94c59ea39434@suse.com>
 <002201d65e89$c84eb460$58ec1d20$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f4f5a43e-dd48-d853-1cbf-5505795d5c0a@suse.com>
Date: Mon, 20 Jul 2020 13:40:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <002201d65e89$c84eb460$58ec1d20$@xen.org>
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
Cc: 'Juergen Gross' <jgross@suse.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.07.2020 13:34, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 20 July 2020 12:33
>> To: Juergen Gross <jgross@suse.com>; paul@xen.org
>> Cc: xen-devel@lists.xenproject.org; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>;
>> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
>> Subject: Re: [PATCH v3] docs: specify stability of hypfs path documentation
>>
>> On 20.07.2020 13:21, Juergen Gross wrote:
>>> In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
>>> file system are specified. Make it more clear that path availability
>>> might change, e.g. due to scope widening or narrowing (e.g. being
>>> limited to a specific architecture).
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Release-acked-by: Paul Durrant <paul@xen.org>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Paul - should I throw this in right away, or has it now rather missed
>> the train?
> 
> I guess our emails raced. Throw it in now.

Indeed they did - I saw yours come in right after sending. Change is
in now.

Jan


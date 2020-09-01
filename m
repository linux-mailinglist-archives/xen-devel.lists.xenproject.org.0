Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC1258CC6
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 12:28:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD3Wk-0004GI-Tn; Tue, 01 Sep 2020 10:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kD3Wj-0004G6-FF
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 10:28:33 +0000
X-Inumbo-ID: 21e94db8-c590-48b6-8bbd-8860cbd3d001
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21e94db8-c590-48b6-8bbd-8860cbd3d001;
 Tue, 01 Sep 2020 10:28:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89A97AEB6;
 Tue,  1 Sep 2020 10:28:31 +0000 (UTC)
Subject: Re: [PATCH] tools/hotplug/Linux: don't needlessly use non-standard
 features in vif-bridge
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <iwj@xenproject.org>,
 'Wei Liu' <wl@xen.org>
References: <4b71b1e6-c6a9-b4b8-76a0-01417d10ffb4@suse.com>
 <000001d68048$fce84750$f6b8d5f0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f694883-f1b9-d596-bb30-8a0ef5fa8642@suse.com>
Date: Tue, 1 Sep 2020 12:28:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <000001d68048$fce84750$f6b8d5f0$@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.09.2020 12:16, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 01 September 2020 11:11
>> To: xen-devel@lists.xenproject.org
>> Cc: Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
>> Subject: [PATCH] tools/hotplug/Linux: don't needlessly use non-standard features in vif-bridge
>>
>> We're not after any "fall-through" behavior here. Replace the constructs
>> with ones understood by all conforming shells, including older bash
>> (problem observed with 3.1.51(1)).
>>
>> Fixes: b51715f02bf9 ("tools/hotplug/Linux: remove code duplication in vif-bridge")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
> 
> If using fall-through is indeed a problem then vif-route will need a similar modification I think.

Oh, indeed. I had meant to check before sending, but then forgot.

Jan


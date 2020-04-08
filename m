Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555021A2B60
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 23:44:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMITa-0006l3-D8; Wed, 08 Apr 2020 21:43:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoLl=5Y=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jMITY-0006ky-D4
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 21:43:12 +0000
X-Inumbo-ID: f18b2408-79e1-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f18b2408-79e1-11ea-83d8-bc764e2007e4;
 Wed, 08 Apr 2020 21:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=noqLO1n+HEk8U4fvBfhk4GrzTuofVKVFTUacRMkJtag=; b=uq0H3U7QRnJDokYNiDLzJ+coah
 gjpL2sViGxU6FIU396WxD1AVPsz2vMdaBE+ft3YbYFLcf/hXVihpjhMuFJAO0yAxNCRSHPjZ0NTzI
 OLKrsHqpcqh6/clR5WQjPH/k0D7/5VALHAUTHur039oZ0rHE33tB1af+RPOjHTCeeMbI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMITU-0006cs-Rw; Wed, 08 Apr 2020 21:43:08 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMITU-0000rp-Kp; Wed, 08 Apr 2020 21:43:08 +0000
Subject: Re: [PATCH 1/7] xen/guest_access: Add missing emacs magics
To: Jan Beulich <jbeulich@suse.com>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-2-julien@xen.org>
 <3c0afc2d-59b0-28ec-66e6-575d02a8667e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cec52e14-364a-cfa0-0dff-ee530eab969b@xen.org>
Date: Wed, 8 Apr 2020 22:43:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3c0afc2d-59b0-28ec-66e6-575d02a8667e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 07/04/2020 09:05, Jan Beulich wrote:
> On 04.04.2020 15:10, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Add missing emacs magics for xen/guest_access.h and
>> asm-x86/guest_access.h.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> I don't think these are "missing"; as per ./CODING_STYLE they're
> permitted, but not required (and I continue to question why one
> form of such a comment should be preferred over possible other
> forms other editors may support). Nevertheless, as this is in
> line with what we have elsewhere:

I can remove the "missing" words if you prefer.

> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thank you!

Cheers,

-- 
Julien Grall


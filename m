Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B475C244E7B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 20:38:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6eZM-0005ZI-2j; Fri, 14 Aug 2020 18:36:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=osIB=BY=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6eZK-0005ZC-Ia
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 18:36:46 +0000
X-Inumbo-ID: 081544ca-dbcb-42a5-8e17-76fad6c020d8
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 081544ca-dbcb-42a5-8e17-76fad6c020d8;
 Fri, 14 Aug 2020 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=wG5SSjoeZFQ3I3RmH6RjDk81lS4EuJOtxq1QfSyZ+FQ=; b=cXrghoeD3MnagzkGaKmNdJbMZ6
 SIMo4FGIVbG0BeLFgSDRltpc2TRnDOGl8CI8pPpMvHDpfJfCzO2AzeqbzNcPe9uhLLvMfdhidm7mR
 SV5Tzjx/BtGbY0IaNfz709p4YMGX6ogV6zT60/d4zjNQ+RglCgub1knHpHT9jwVdzvb8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6eZE-000462-Ou; Fri, 14 Aug 2020 18:36:40 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6eZE-0007wt-Fd; Fri, 14 Aug 2020 18:36:40 +0000
Subject: Re: [RESEND][PATCH v2 1/7] xen/guest_access: Add emacs magics
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, nd <nd@arm.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-2-julien@xen.org>
 <5DD7E100-D146-4853-A1CA-168DA1802C7A@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <86e45fef-e180-9190-873c-6989cf14f861@xen.org>
Date: Fri, 14 Aug 2020 19:36:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5DD7E100-D146-4853-A1CA-168DA1802C7A@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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

Hi,

On 31/07/2020 14:04, Bertrand Marquis wrote:
> 
> 
>> On 30 Jul 2020, at 20:18, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Add emacs magics for xen/guest_access.h and
>> asm-x86/guest_access.h.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Most of file in Xen source code seem to have a white line before the “emacs magics”.
> If this is something that should be enforced, it should be done here.
I am not sure whether we always ask the newline before. Anyway, I have 
added one as this is trivial.

Cheers,

-- 
Julien Grall


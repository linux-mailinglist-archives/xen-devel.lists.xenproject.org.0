Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40D252A5E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 11:38:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kArrh-0003Ou-HN; Wed, 26 Aug 2020 09:37:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vbNg=CE=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kArrf-0003Op-Ur
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 09:37:08 +0000
X-Inumbo-ID: f5d7578e-53df-4766-a473-bf3009bbd5ba
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5d7578e-53df-4766-a473-bf3009bbd5ba;
 Wed, 26 Aug 2020 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=2FA0A3IlUGAcG/PqjJ2uNW34u6DxgRG5OLlK8rMoPEk=; b=N+bzL8hif+T+nPF4bP9+eWKrQ3
 Q9gNuuOB02xDcTXKAYOdAzxOQEWL9LfDWi4CWLQZxmt3ERXLROxyAP+i//wrdApTOJ0RPVqdy4Ucf
 vnct/svmX2HfTsbCwEbAxUEx7oj3h4X6TR8ECECc2pc8uQy0/DGxygy57DvUk0gPT4y0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kArrc-0006fh-1q; Wed, 26 Aug 2020 09:37:04 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kArrb-0000zn-P7; Wed, 26 Aug 2020 09:37:03 +0000
Subject: Re: [PATCH] xen/arm: Update silicon-errata.txt with the Neoverse AT
 erratum
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200825174208.11070-1-julien@xen.org>
 <31BF31BE-29B1-4C22-BE8A-6856208990F3@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c38ad53f-0a95-cb89-1a1a-c896ecb10ff0@xen.org>
Date: Wed, 26 Aug 2020 10:37:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <31BF31BE-29B1-4C22-BE8A-6856208990F3@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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



On 26/08/2020 08:46, Bertrand Marquis wrote:
> 
> 
>> On 25 Aug 2020, at 18:42, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
>> added a new erratum but forgot to update silicon-errata.txt.
>>
>> Update the file accordingly to keep track of errata workaround in Xen.
> 
> Oh i should have done that as part of my patch.
> Nice catch.
> 
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> docs/misc/arm/silicon-errata.txt | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
>> index 11e5a9dcec2c..ee070e723a5f 100644
>> --- a/docs/misc/arm/silicon-errata.txt
>> +++ b/docs/misc/arm/silicon-errata.txt
>> @@ -51,4 +51,5 @@ stable hypervisors.
>> | ARM            | Cortex-A57      | #1319537        | N/A                     |
>> | ARM            | Cortex-A72      | #1319367        | N/A                     |
>> | ARM            | Cortex-A76      | #1165522        | N/A                     |
>> +| ARM            | Neoverse        | #1165522        | N/A
> 
> Should be Neoverse-N1 here (E1 for example is not impacted by this errata)

Ah, right. Would you be happy if I do the change on commit?

Cheers,

-- 
Julien Grall


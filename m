Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326DE7AF648
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 00:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608543.947090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlGVD-0003Hf-AH; Tue, 26 Sep 2023 22:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608543.947090; Tue, 26 Sep 2023 22:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlGVD-0003EJ-5b; Tue, 26 Sep 2023 22:25:59 +0000
Received: by outflank-mailman (input) for mailman id 608543;
 Tue, 26 Sep 2023 22:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IkXO=FK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qlGVB-0003E9-RD
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 22:25:57 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a684b5b7-5cbb-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 00:25:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A3B1C8285465;
 Tue, 26 Sep 2023 17:25:40 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5XbbZvyKEYqN; Tue, 26 Sep 2023 17:25:39 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 70ABF8285690;
 Tue, 26 Sep 2023 17:25:39 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TmHQOz-HDaPA; Tue, 26 Sep 2023 17:25:39 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id B94298285465;
 Tue, 26 Sep 2023 17:25:38 -0500 (CDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a684b5b7-5cbb-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 70ABF8285690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695767139; bh=qwxtmpPztUOsOEB2BRvfagbjyKlnIaNRNDiwmeEaC4g=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Gb9R4Ex/8s68NWci/raF2MLVny8Owshe5DmpKQwUxNzwa/PhLjgYDrDB+jaui8UN3
	 u5dId/5C3dnKPcI4qGYYYXGBCh2dA9rOum/MdBCCvSoVyv72flJV4OwfGHE88NgSPo
	 zOu2jsL4oyuOwIiEniyyI7J6dmCKHbA27NIqiZXw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <9ee3e3c5-978e-0d39-598e-fa9f54039254@raptorengineering.com>
Date: Tue, 26 Sep 2023 17:25:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] automation: Change build script to use arch
 defconfig
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1695754185.git.sanastasio@raptorengineering.com>
 <a949070e4730f55ac214e22a3dea92a5cc6ec7fa.1695754185.git.sanastasio@raptorengineering.com>
 <0eda179a-2f64-39b3-c604-7aaa3b2659be@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <0eda179a-2f64-39b3-c604-7aaa3b2659be@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/26/23 2:56 PM, Andrew Cooper wrote:
> On 26/09/2023 7:54 pm, Shawn Anastasio wrote:
>> diff --git a/automation/scripts/build b/automation/scripts/build
>> index b4edcf010e..19dd9e8270 100755
>> --- a/automation/scripts/build
>> +++ b/automation/scripts/build
>> @@ -22,7 +22,12 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>>      # RANDCONFIG implies HYPERVISOR_ONLY
>>      HYPERVISOR_ONLY="y"
>>  else
>> -    echo "CONFIG_DEBUG=${debug}" > xen/.config
>> +    # Start off with arch's defconfig
>> +    make -C xen defconfig
>> +
>> +    # Drop existing CONFIG_DEBUG and replace with value of ${debug}
>> +    sed -i 's/^CONFIG_DEBUG=[yn]//g' xen/.config
>> +    echo "CONFIG_DEBUG=${debug}" >> xen/.config
> 
> Kconfig is latest-takes precedence, which is why we always append for
> this and the other related options.  There's no need for sed to drop the
> old value.
>

Thank you for the confirmation. I'll go ahead and drop the sed.

> ~Andrew

Thanks,
Shawn


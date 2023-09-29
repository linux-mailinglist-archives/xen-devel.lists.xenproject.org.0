Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097B7B2D7F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610300.949660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8Vj-0007rg-TF; Fri, 29 Sep 2023 08:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610300.949660; Fri, 29 Sep 2023 08:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8Vj-0007p0-QV; Fri, 29 Sep 2023 08:06:07 +0000
Received: by outflank-mailman (input) for mailman id 610300;
 Fri, 29 Sep 2023 08:06:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qm8Vh-0007lI-Mf
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:06:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm8Vh-0000rW-7h; Fri, 29 Sep 2023 08:06:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qm8Vh-00030z-1x; Fri, 29 Sep 2023 08:06:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=vNXHmiB27WHbEuFGrHnMPrQ0psLJYO8eqNZX6zLp+Cw=; b=fAxlRuf92r6fJxtKy+L1tG1weZ
	LzNXHh50lY90qFHG4ou5CIXknpYAN4Vjbf0cHreB31NOe/sUYIvEqIWvUTN/HK1VQx/xv1FUp4kyf
	2LOYGptq20FdSKClXEQO2KKPF8SWaWBA5qtvH+I5HEhA6BJxcOhNtztylarPFl+n94ek=;
Message-ID: <7a9d0129-d400-4c64-904b-3fbefd924543@xen.org>
Date: Fri, 29 Sep 2023 09:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.18-rc
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230929075857.87092-1-julien@xen.org>
 <20230929075857.87092-3-julien@xen.org>
 <a0d6f669-1e1d-47ec-9670-a9e5c3d7f130@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a0d6f669-1e1d-47ec-9670-a9e5c3d7f130@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 29/09/2023 09:04, Juergen Gross wrote:
> On 29.09.23 09:58, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   README       | 16 ++++++++--------
>>   SUPPORT.md   |  2 +-
>>   xen/Makefile |  2 +-
>>   3 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/README b/README
>> index a491c8dce55b..f45e1ef1cdca 100644
>> --- a/README
>> +++ b/README
>> @@ -1,11 +1,11 @@
>> -###############################################
>> -__  __            _  _    _  ___
>> -\ \/ /___ _ __   | || |  / |( _ )
>> - \  // _ \ '_ \  | || |_ | |/ _ \
>> - /  \  __/ | | | |__   _|| | (_) |
>> -/_/\_\___|_| |_|    |_|(_)_|\___/
>> -
>> -###############################################
>> +#################################################
>> +                  _  _    _  ___
>> +__  _____ _ __   | || |  / |( _ )       _ __ ___
>> +\ \/ / _ \ '_ \  | || |_ | |/ _ \ _____| '__/ __|
>> + >  <  __/ | | | |__   _|| | (_) |_____| | | (__
>> +/_/\_\___|_| |_|    |_|(_)_|\___/      |_|  \___|
>> +
>> +#################################################
> 
> Is it on purpose to use "xen" instead of "Xen"?

It is not, thanks for spotting. Here the new figlet:

__  __            _  _    _  ___
\ \/ /___ _ __   | || |  / |( _ )       _ __ ___
  \  // _ \ '_ \  | || |_ | |/ _ \ _____| '__/ __|
  /  \  __/ | | | |__   _|| | (_) |_____| | | (__
/_/\_\___|_| |_|    |_|(_)_|\___/      |_|  \___|

I will update the tree directly.

Cheers,

-- 
Julien Grall


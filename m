Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5455FB0E5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 13:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419566.664351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiD3C-0002Qw-Cg; Tue, 11 Oct 2022 11:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419566.664351; Tue, 11 Oct 2022 11:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiD3C-0002OR-9W; Tue, 11 Oct 2022 11:03:54 +0000
Received: by outflank-mailman (input) for mailman id 419566;
 Tue, 11 Oct 2022 11:03:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oiD3A-0002OL-3b
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 11:03:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiD38-0007rg-Hv; Tue, 11 Oct 2022 11:03:50 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.14.212]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiD38-0007BV-9d; Tue, 11 Oct 2022 11:03:50 +0000
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
	bh=lYHF+FKUShw8v4NfUQVz5YAlt60TC3cv2R0+1usQIkc=; b=gPCMifqGVf7QlnCukG/4EMcSeL
	ZLF5PBjWbvkiZKU6TvQcx1VAuGbaukXdPeFkiZzMeaSY0v2L0QKyU4wk/5hEpjFGGS4mBIijxV2+X
	U/HaTYiRay/Du3qr6aFQw/+j2F6fh2Y+y1kp7QNqdUO/REnbil+rPH6ErE4R0KOfBWHw=;
Message-ID: <f8e9513f-d21f-6986-ba96-8385be4dcaf2@xen.org>
Date: Tue, 11 Oct 2022 12:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH v3 4/4] Remove extra copies of licenses and license
 headers
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop>
 <20221008001544.78302-4-sstabellini@kernel.org>
 <b87e4263-4018-b840-74be-965aec89d187@xen.org>
 <alpine.DEB.2.22.394.2210101716390.3690179@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2210101716390.3690179@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 11/10/2022 01:26, Stefano Stabellini wrote:
> On Sun, 9 Oct 2022, Julien Grall wrote:
>>>    When creating new components, new files, or importing code please follow
>>>    the conventions outlined below. As a general rule, whenever code using a
>>>    license other than GPLv2 is introduced, attention must be drawn to the
>>> @@ -32,20 +28,22 @@ deviation. Any new code must be GPLv2 compatible.
>>>    New components
>>>    --------------
>>>    -When creating new components and directories that contain a
>>> -significant amount of files that are licensed under licenses other
>>> -than GPLv2 or the license specified in the COPYING file, please
>>> -create a new COPYING file in that directory containing a copy of the
>>> -license text and a rationale for using a different license. This helps
>>> -ensure that the license of this new component/directory is maintained
>>> -consistently with the original intention.
>>> +When creating new components and directories that contain a significant
>>> +amount of files that are licensed under licenses other than GPLv2,
>>> +please create a new COPYING file in that directory with the rationale
>>> +for using a different license. This helps ensure that the license of
>>> +this new component/directory is maintained consistently with the
>>> +original intention.
>>
>> I don't understand why the wording "or the license specified in the COPYING
>> file" is dropped. To me, the sentence was indicating that it is not necessary
>> to create a COPYING file in every sub-directory if the license is not GPLv2
>> and it matches the license of a parent directory.
>>
>> Do you plan to remove COPYING completely?
> 
> No, I don't plan to remove COPYING completely. COPYING is useful to tell
> the user what license to choose. I only meant to clarify that COPYING
> doesn't need to have a full copy of the license again. An SPDX tag would
> be enough. I can change it to:
> 
> ---
> When creating new components and directories that contain a
> significant amount of files that are licensed under licenses other
> than GPLv2 or the license specified in the COPYING file, please
> create a new COPYING file in that directory containing the SPDX tag
> and a rationale for using a different license. This helps ensure that
> the license of this new component/directory is maintained consistently
> with the original intention.
> ---

Sounds good to me.

Cheers,

-- 
Julien Grall


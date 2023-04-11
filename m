Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC06DDB0E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 14:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519649.806613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmDIF-00029T-1W; Tue, 11 Apr 2023 12:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519649.806613; Tue, 11 Apr 2023 12:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmDIE-00026I-UE; Tue, 11 Apr 2023 12:40:14 +0000
Received: by outflank-mailman (input) for mailman id 519649;
 Tue, 11 Apr 2023 12:40:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmDID-00025y-RB
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 12:40:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmDIA-0005UB-L8; Tue, 11 Apr 2023 12:40:10 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.30.1])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmDIA-0003xn-DP; Tue, 11 Apr 2023 12:40:10 +0000
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
	bh=UiXpTl1a3tG+ZCl5AQUOykdSeTWIEtGDm225q3yNNVo=; b=mPdQ4uLy7ViBBQ8Lh7Nx61rIce
	XL26Et34t/buVnZkMLO+0k1L966qONZqTYqaXGPugeiGeP77bWbDAsZqt0u8EwoJyPSML8HBjtPbx
	6hwSJHQt/D1H9ZPixPQY7yNEXDKfPtY/W8C68iOL0JRbmy6iG2iZHacYDQ88CcJZcYQ8=;
Message-ID: <235a284c-48d6-fda3-2aa2-3670856d1547@xen.org>
Date: Tue, 11 Apr 2023 13:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/7] xen/x86: Replace GPL v2.0 license boilerplate with
 an SPDX tag in *.c
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230327184520.81828-1-julien@xen.org>
 <20230327184520.81828-3-julien@xen.org>
 <alpine.DEB.2.22.394.2303271752210.4066@ubuntu-linux-20-04-desktop>
 <96d6a307-14dd-aa0e-4039-d84d67cf7ed6@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <96d6a307-14dd-aa0e-4039-d84d67cf7ed6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/03/2023 10:16, Jan Beulich wrote:
> On 28.03.2023 02:53, Stefano Stabellini wrote:
>> On Mon, 27 Mar 2023, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> It is easier to understand the license of a file when using SPDX.
>>>
>>> This is replacing the below pattern with the SPDX tag GPL-2.0-only
>>> in xen/arch/x86/*.c:
>>>
>>>   * This program is free software; you can redistribute it and/or modify it
>>>   * under the terms and conditions of the GNU General Public License,
>>>   * version 2, as published by the Free Software Foundation.
>>>   *
>>>   * This program is distributed in the hope it will be useful, but WITHOUT
>>>   * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>>   * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>>   * more details.
>>>   *
>>>   * You should have received a copy of the GNU General Public License along with
>>>   * this program; If not, see <http://www.gnu.org/licenses/>.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> ---
>>>
>>>      Changes in v2:
>>>          * Switch to GPL-2.0-only
>>>          * Rebase
>>>
>>> 42sh> cat gpl-2.0.txt
>>>   * This program is free software; you can redistribute it and/or modify it
>>>   * under the terms and conditions of the GNU General Public License,
>>>   * version 2, as published by the Free Software Foundation.
>>>   *
>>>   * This program is distributed in the hope it will be useful, but WITHOUT
>>>   * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>>   * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>>   * more details.
>>>   *
>>>   * You should have received a copy of the GNU General Public License along with
>>>   * this program; If not, see <http://www.gnu.org/licenses/>.
>>> 42sh> find xen/arch/x86/ -name '*.c' -exec replace_license.py gpl-2.0.txt GPL-2.0-only {} \;
>>
>> I confirm that the commands above lead to this exact patch. I ran them
>> on my system and checked that the resulting changes are the same.
>>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> On this basis then also
> Acked-by: Jan Beulich <jbeulich@suse.com>
> for this and the subsequent patches.

Thanks. I have pushed with the series with both of your acks.

Cheers,

-- 
Julien Grall


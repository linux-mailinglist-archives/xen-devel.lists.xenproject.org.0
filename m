Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7D9690C4D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 15:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492555.762162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8Nq-0000Iz-RN; Thu, 09 Feb 2023 14:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492555.762162; Thu, 09 Feb 2023 14:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8Nq-0000G2-Om; Thu, 09 Feb 2023 14:58:46 +0000
Received: by outflank-mailman (input) for mailman id 492555;
 Thu, 09 Feb 2023 14:58:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQ8Np-0000Fq-7M
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 14:58:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ8Nj-0007TG-0w; Thu, 09 Feb 2023 14:58:39 +0000
Received: from [54.239.6.186] (helo=[192.168.16.230])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQ8Ni-0006uY-Oy; Thu, 09 Feb 2023 14:58:38 +0000
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
	bh=vuScadvmbFEBVyExlZAHuucRaBoj9Bj2Wq0F+OjL8YE=; b=WVFblwJjia7ZtL622hOa91sPjj
	eYlsFozRxuLQDEW71JrPwHd7bRn2q34nJ2W9m9zEwgWUJCeAmKBfQg5x7DgunsI8QmiGyQIXOh4zy
	P4r8TI0iv/OSRNea6boWNHyhpvkdahMHP80szNQyVmszNgFdUYYaDwcPG8HhRuQyZDDE=;
Message-ID: <8bf18e22-5ef1-25ff-ff63-b5a390e92bbd@xen.org>
Date: Thu, 9 Feb 2023 14:58:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/4] GPL License Boilerplate: Switch from HTTP to HTTPS
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Rahul Singh <rahul.singh@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
 <6ff3e64e1dafd869caf23660cafdd46070209e2e.1675889602.git.demi@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2302081456060.4661@ubuntu-linux-20-04-desktop>
 <Y+QuaDrn6EUti0ZR@itl-email> <Y+UJVDMif6BeCqtN@perard.uk.xensource.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Y+UJVDMif6BeCqtN@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 09/02/2023 14:55, Anthony PERARD wrote:
> On Wed, Feb 08, 2023 at 06:21:08PM -0500, Demi Marie Obenour wrote:
>> On Wed, Feb 08, 2023 at 02:58:38PM -0800, Stefano Stabellini wrote:
>>> On Wed, 8 Feb 2023, Demi Marie Obenour wrote:
>>>> Obtaining code over an insecure transport is a terrible idea for
>>>> blatently obvious reasons.  Even for non-executable data, insecure
>>>> transports are considered deprecated.
>>>>
>>>> This patch changes GPL boilerplate.
>>>>
>>>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>>>
>>> For the licensing boilerplate, I think it would be better to switch to
>>> SPDX instead.
>>>
>>> That said, given that you have already done the work to covert the GPL
>>> boilerplate everywhere, I think this is OK. But if you have time and
>>> energy I would love to see a patch switching to SPDX in as many places
>>> as possible.
>>
>> The only part of this patch I actually wrote is the commit message.  The
>> rest was generatedy by:
>>
>>      git ls-files -z |
>>      xargs -0 -- sed -Ei -- 's@(http)(://www\.gnu\.org)@\1s\2@g'
>>
>> followed by the usual git stuff.  Do you know of a similar automated
>> tool for SPDX conversion?
> 
> I did this with a little script in the past:
>      https://lore.kernel.org/xen-devel/20221103115204.49610-7-anthony.perard@citrix.com/
> 
> It could be adapted for the different licenses.

Thanks! Yesterday evening, I was looking at scancode which is able to 
detect licenses but I didn't manage to figure out if it was possible to 
replace license text with SPDX.

In v1, IIRC, Demi said she didn't have time to look at it. But I am 
happy to give a try as it shouldn't be too complicated to replace the 
majority.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA22F4CE7E7
	for <lists+xen-devel@lfdr.de>; Sun,  6 Mar 2022 01:28:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285278.484526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQejy-0001Rv-NF; Sun, 06 Mar 2022 00:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285278.484526; Sun, 06 Mar 2022 00:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQejy-0001Q5-Jb; Sun, 06 Mar 2022 00:27:14 +0000
Received: by outflank-mailman (input) for mailman id 285278;
 Sun, 06 Mar 2022 00:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNsN=TR=uniontech.com=zhanglianjie@srs-se1.protection.inumbo.net>)
 id 1nQejx-0001Pz-1A
 for xen-devel@lists.xenproject.org; Sun, 06 Mar 2022 00:27:13 +0000
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25a7ce92-9ce4-11ec-8539-5f4723681683;
 Sun, 06 Mar 2022 01:27:06 +0100 (CET)
Received: from [192.168.31.174] ( [114.222.120.105])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 06 Mar 2022 08:26:53 +0800 (CST)
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
X-Inumbo-ID: 25a7ce92-9ce4-11ec-8539-5f4723681683
X-QQ-mid: bizesmtp73t1646526415ti1ccug6
X-QQ-SSF: 00400000002000B0I000B00A0000000
X-QQ-FEAT: Yoi7Hxl/bVy2P93GWHfklzKDrsURX7H8T1Vgrem27D85i64DwFlKMUkFT0Y/G
	SAPCInBPraAvoVWYfx9NoliTKW9b1CBIFqmmRFpUV7YJQ6MYpxvxfvaTOTT6khHUZVkOgSK
	cvH+OxbWWpSXeHfcSFpHzzsgPHpgXa0XsCeH6pMy2RXDPHnK//ooIdZzWkTz+iTloi0WIa/
	4O6cZwjhHNAAkxA7P1s+4uQHu3fchkul2BL48w5mOL5Ywm/v8Bi4o2BMqTPCZ8JWyPsBU+L
	vXLztD/4G4DN0K/NjYp2xjT0IJbuhvvseHyxlQLralg5quMfo2tka6crBKYhUv3WJFqOATy
	Oq8HkE+0zBP9Nnbw9Q=
X-QQ-GoodBg: 2
Message-ID: <587332d1-167b-505f-8f73-1aabbb2e8b3a@uniontech.com>+14969B3658B13A2C
Date: Sun, 6 Mar 2022 08:26:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drivers/xen: use helper macro __ATTR_RW
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Juergen Gross <jgross@suse.com>, David Vrabel <david.vrabel@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20220305133823.158961-1-zhanglianjie@uniontech.com>
 <YiNry3TtIPbEh1Yr@kroah.com>
 <622382f3.1c69fb81.55f81.aff0SMTPIN_ADDED_BROKEN@mx.google.com>
 <YiO9QDpqepZXEZ6L@kroah.com>
From: zhanglianjie <zhanglianjie@uniontech.com>
In-Reply-To: <YiO9QDpqepZXEZ6L@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1

Hi,

在 2022/3/6 03:42, Greg Kroah-Hartman 写道:
> On Sat, Mar 05, 2022 at 11:33:58PM +0800, zhanglianjie wrote:
>> Hi,
>>
>> 在 2022/3/5 21:55, Greg Kroah-Hartman 写道:
>>> On Sat, Mar 05, 2022 at 09:38:23PM +0800, zhanglianjie wrote:
>>>> Use helper macro __ATTR_RW to define HYPERVISOR_ATTR_RW to make code more clear.
>>>> Minor readability improvement.
>>>>
>>>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>>>
>>> Is this the name you sign legal documents with?  (I have to ask...)
>> Yes, this is my signature.
>>>
>>>>
>>>> diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
>>>> index feb1d16252e7..fcb0792f090e 100644
>>>> --- a/drivers/xen/sys-hypervisor.c
>>>> +++ b/drivers/xen/sys-hypervisor.c
>>>> @@ -22,11 +22,10 @@
>>>>    #endif
>>>>
>>>>    #define HYPERVISOR_ATTR_RO(_name) \
>>>> -static struct hyp_sysfs_attr  _name##_attr = __ATTR_RO(_name)
>>>> +static struct hyp_sysfs_attr _name##_attr = __ATTR_RO(_name)
>>>
>>> Why change this line?  That's not relevant to this change :(
>>>
>> There are two spaces between struct hyp_sysfs_attr and _name, by the way,
>> modify it.
> 
> Coding style cleanups should be a separate patch, as each change should
> only do one logical thing.
> 
> But hey, I'm not the maintainer of this file/driver, others might be
> more lax.
Thanks for the guide, I will pay attention to these in the future.
> 
> good luck!
> 
> greg k-h
> 




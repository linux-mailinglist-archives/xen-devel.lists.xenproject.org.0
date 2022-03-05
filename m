Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81064CE5B5
	for <lists+xen-devel@lfdr.de>; Sat,  5 Mar 2022 17:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285192.484443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQWrO-0007Iy-2d; Sat, 05 Mar 2022 16:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285192.484443; Sat, 05 Mar 2022 16:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQWrN-0007CE-V7; Sat, 05 Mar 2022 16:02:21 +0000
Received: by outflank-mailman (input) for mailman id 285192;
 Sat, 05 Mar 2022 15:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEmz=TQ=uniontech.com=zhanglianjie@srs-se1.protection.inumbo.net>)
 id 1nQWQM-00033D-JV
 for xen-devel@lists.xenproject.org; Sat, 05 Mar 2022 15:34:26 +0000
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6d6e428-9c99-11ec-8539-5f4723681683;
 Sat, 05 Mar 2022 16:34:20 +0100 (CET)
Received: from [192.168.31.174] ( [114.222.120.105])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 05 Mar 2022 23:34:03 +0800 (CST)
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
X-Inumbo-ID: b6d6e428-9c99-11ec-8539-5f4723681683
X-QQ-mid: bizesmtp76t1646494445tfu1xbnk
X-QQ-SSF: 00400000002000B0I000B00A0000000
X-QQ-FEAT: LItLOq/50o2PmYfAwguweBDHzjuwj/b82I/76cIyZ3DR2bPRqgfcBnjeFJ/zm
	Ti0kyQNN+UIAwx/lkzVu6yosSlS0LcreJM1bhPJLgMvHyDFBWuOVA/jNCTX3kkVSTqH8onu
	Y60DWJ3D77mpQOYAkaiRaUD87H0CLtqu8j90JprD+vscoEwM9iVR0RG8Xxx1cSMjGet3PdY
	YSBqOtJVzF4c33s3Vis0ZX2a8DzrdchsraBeL/apst8OL9bXVYkctYLxKTdPoTyTZJ10y0o
	DzwiX9FnnIwCVbu2AaeuajkZGvJ744tmkFGPuWBfzW1em9Q868BozCF/zQjFUk2UW5WG/ow
	4cZLPK1Hli6Am0o61Y6aTcKovG9pA==
X-QQ-GoodBg: 2
Message-ID: <9ce86761-37e0-8a21-7b91-344058c9b563@uniontech.com>+CB7907B06FE21C96
Date: Sat, 5 Mar 2022 23:33:58 +0800
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
From: zhanglianjie <zhanglianjie@uniontech.com>
In-Reply-To: <YiNry3TtIPbEh1Yr@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1

Hi,

在 2022/3/5 21:55, Greg Kroah-Hartman 写道:
> On Sat, Mar 05, 2022 at 09:38:23PM +0800, zhanglianjie wrote:
>> Use helper macro __ATTR_RW to define HYPERVISOR_ATTR_RW to make code more clear.
>> Minor readability improvement.
>>
>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
> 
> Is this the name you sign legal documents with?  (I have to ask...)
Yes, this is my signature.
> 
>>
>> diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
>> index feb1d16252e7..fcb0792f090e 100644
>> --- a/drivers/xen/sys-hypervisor.c
>> +++ b/drivers/xen/sys-hypervisor.c
>> @@ -22,11 +22,10 @@
>>   #endif
>>
>>   #define HYPERVISOR_ATTR_RO(_name) \
>> -static struct hyp_sysfs_attr  _name##_attr = __ATTR_RO(_name)
>> +static struct hyp_sysfs_attr _name##_attr = __ATTR_RO(_name)
> 
> Why change this line?  That's not relevant to this change :(
> 
There are two spaces between struct hyp_sysfs_attr and _name, by the 
way, modify it.
thanks.
> thanks,
> 
> greg k-h
> 




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3F26DC1A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 14:54:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kItQi-000466-Nh; Thu, 17 Sep 2020 12:54:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozwp=C2=huawei.com=miaoqinglang@srs-us1.protection.inumbo.net>)
 id 1kItQg-000461-W8
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 12:54:27 +0000
X-Inumbo-ID: a659fb60-36c4-40f5-8203-9931b1266e38
Received: from huawei.com (unknown [45.249.212.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a659fb60-36c4-40f5-8203-9931b1266e38;
 Thu, 17 Sep 2020 12:54:18 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EB91654FF72C6B2D205D;
 Thu, 17 Sep 2020 20:54:13 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:54:11 +0800
Subject: Re: [PATCH -next] x86/xen: Convert to DEFINE_SHOW_ATTRIBUTE
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Juergen Gross <jgross@suse.com>, Chen-Yu Tsai
 <wens@csie.org>, Thomas Gleixner <tglx@linutronix.de>, Stefano Stabellini
 <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <20200716090641.14184-1-miaoqinglang@huawei.com>
 <a75ff99a-bb2e-6470-6c47-e7089c0fc8b4@oracle.com>
From: miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <506f6380-1e3e-dc22-bf9a-a6d81bb0eeec@huawei.com>
Date: Thu, 17 Sep 2020 20:54:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a75ff99a-bb2e-6470-6c47-e7089c0fc8b4@oracle.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
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



在 2020/7/19 9:59, Boris Ostrovsky 写道:
> On 7/16/20 5:06 AM, Qinglang Miao wrote:
>> From: Chen Huang <chenhuang5@huawei.com>
>>
>> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>>
>> Signed-off-by: Chen Huang <chenhuang5@huawei.com>
> 
> 
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> 
> 
Hi Boris,

I noticed that this patch has been rebiewed but there's small conflict 
if you apply it against latest linux-next. So I resend a v2 patch 
against linux-next(20200917), and it can be applied to mainline cleanly 
now.

Thanks.


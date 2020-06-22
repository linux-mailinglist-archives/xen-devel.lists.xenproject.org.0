Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7C7203955
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 16:27:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnNQG-0005Hf-9h; Mon, 22 Jun 2020 14:27:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O88q=AD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jnNQE-0005HY-AK
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 14:27:42 +0000
X-Inumbo-ID: 87d9c4e0-b494-11ea-be9b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87d9c4e0-b494-11ea-be9b-12813bfff9fa;
 Mon, 22 Jun 2020 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WNRA0zhjXm1fdNAIxQSe9Rf2cnK9w/uNmAyFaZ5paFA=; b=U2X0xk96ZjnPE6QM1XTxDqxFnK
 IQdOy1VjsEqLscVTWQn+NvM+Uj+0jmWlrXNWxcs73vV8O4HSHCN4A5Ge96tdVWENypvwJP8ByZdaa
 47V5jaA57EZ2rQOZs/lvvIaBK+NjvSa6NDFw8TJ6BN0LA2e83V3JCimYH5zKhDspvxog=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnNQB-00008g-Mg; Mon, 22 Jun 2020 14:27:39 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnNQB-0003fH-GK; Mon, 22 Jun 2020 14:27:39 +0000
Subject: Re: UEFI support in ARM DomUs
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
 <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
Date: Mon, 22 Jun 2020 15:27:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Oleksandr,

On 22/06/2020 15:04, Oleksandr Andrushchenko wrote:
> On 6/19/20 11:02 PM, Stefano Stabellini wrote:
>> On Thu, 18 Jun 2020, Julien Grall wrote:
> ifeq ($(CONFIG_XEN),y)
> arch-y += -D__XEN_INTERFACE_VERSION__=0x00040d00
> endif
> 
> and we also have Xen 4.13 headers in the U-boot tree.

Sorry if this was already asked before. Why do you need to specify 
__XEN_INTERFACE_VERSION__?

> 
> For the first part (__XEN_INTERFACE_VERSION__) I think we can provide it via
> 
> CFLAGS or something. This can also be done for the location of Xen headers.

__XEN_INTERFACE_VERSION__ should work through the CFLAGS. An alternative 
would be to allow the user to specify through the Kconfig.
Cheers,

-- 
Julien Grall


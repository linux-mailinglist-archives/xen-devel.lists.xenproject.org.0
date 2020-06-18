Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682121FFABD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 20:05:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlyud-0006Ds-Pe; Thu, 18 Jun 2020 18:05:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AXO0=77=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jlyuc-0006Dn-OM
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 18:05:18 +0000
X-Inumbo-ID: 43e30fe8-b18e-11ea-bad7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43e30fe8-b18e-11ea-bad7-12813bfff9fa;
 Thu, 18 Jun 2020 18:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LiNn3uEpSqSiX3FNi5dguXCf75bYB8eCsqDdSWZ3ii0=; b=hBciOBFUCsGhA/O4Rn+9ct3/lC
 czoDIz49X4TgWjS2V/mmlWszNimXd3JA5sfpCaMYdMpWQBg0b/R1+DQvf1zCMLNXP3AWHGN8Y3R08
 IFslYPFN9dBLqM33CXZoj8RiNFtNu19hpt525A1tzSLQgRYBArIES4SDe/dhxj68qeI8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlyuW-0006hA-U8; Thu, 18 Jun 2020 18:05:12 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlyuW-0001Ov-MK; Thu, 18 Jun 2020 18:05:12 +0000
Subject: Re: [Tee-dev] TEE with XEN
To: Volodymyr Babchuk <vlad.babchuk@gmail.com>, Peng Fan <peng.fan@nxp.com>
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
Date: Thu, 18 Jun 2020 19:05:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

+Bertrand and Stefano

On 16/06/2020 02:24, Volodymyr Babchuk wrote:
> Hi Peng,
> 
> On Mon, 15 Jun 2020 at 05:07, Peng Fan <peng.fan@nxp.com> wrote:
>>
>> Hi All,
>>
>> While enabling trusty os with xen, I took same approach as OP-TEE,
>> with OP-TEE running in secure world. But I am also thinking this might
>> introduce potential issue is that secure world OS communicate with DomU.
>> If there are some misbehavior in secure world OS, it might let XEN
>> hypervisor not work proper.
>>
>> In my setup, trusty os sometimes panic in secure world, xen will not able
>> to control the panic core anymore.

May I ask in which case Trusty is panicking?

>>
>> So I am thinking whether we need to emulating secure world in a XEN VM
>> which is the VM running DomU. Just like what ACRN did to run trusty
>> os.
> 
> Well, it depends on whom you are trusting more. Both XEN and TEE are minimal
> OS implementations with aim at security. I'm speaking about generic TEE OS, not
> about particular OS like OP-TEE or Trusty. Problem is that, if TEE is
> running inside
> VM, it will be susceptible to a hypervisor misbehaviour. You need to understand
> that Xen and privileged domain (dom0, mostly) can access memory of any guest.
> At least, in default configuration. There are means to harden this
> setup. But anyways,
> Xen can't be stopped from reading TEE's secrets.

IIRC, we discussed this approach for OP-TEE in the past. There was other 
potential pitfalls with it. For instance, you wouldn't be able to 
directly access any secure device from that guest (it is running in 
non-secure world).

There are also issues in term of latency as you may have the following 
model:

domU -> Xen -> domU TEE -> (Xen -> host TEE -> Xen -> domU TEE) -> Xen 
-> domU.

The bit in () is if you require to call the host TEE.

One possibility would be to use Secure-EL2 for your Trusty OS. But I 
don't know whether your platform supports it.

Depending on whether you can modify Trusty OS, alternative would be to 
make itvirtualization aware as OP-TEE did. The core would need to be 
resilient and the panic only affect a given client.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8841EF7CE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 14:30:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhBU9-0005M8-R8; Fri, 05 Jun 2020 12:30:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MU1S=7S=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jhBU8-0005LI-Nq
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 12:30:08 +0000
X-Inumbo-ID: 4a879cc6-a728-11ea-afad-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a879cc6-a728-11ea-afad-12813bfff9fa;
 Fri, 05 Jun 2020 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0JQ0JgUkd4aa0wYgbrQpBpjuIBYOmxVvjimtwAdDBx8=; b=oolBT7qrGJRr3LYa52ACtASyn9
 sddyWdGl052N1nktcFyjfM9Vy83LXJxEVeQ4pVVpzfoRtRTQxSkWX1rxwtCuYrCEklu5txgbLRB5G
 xpU72nibw1RuFOi5N4WtjpPralDCIjJ7nNOlJ6gkNJet3ovZTi8jRn4mbAYVhmLdbK9Y=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jhBU7-0004Zc-MW; Fri, 05 Jun 2020 12:30:07 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jhBU7-0001Q5-G6; Fri, 05 Jun 2020 12:30:07 +0000
Subject: Re: Keystone Issue
To: CodeWiz2280 <codewiz2280@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
 <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
 <8C39F9D0-8351-4671-9A39-D5D4BFF02BD6@arm.com>
 <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
 <00E14EAD-BD23-4A3A-872E-0C47C26B7B41@arm.com>
 <c2466674-a56e-08a4-7f3f-2438d5565953@xen.org>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
 <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
Date: Fri, 5 Jun 2020 13:30:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 05/06/2020 13:25, CodeWiz2280 wrote:
> The Keystone uses the netcp driver, which has interrupts from 40-79
> listed in the device tree (arch/arm/boot/keystone-k2e-netcp.dtsi).
> I'm using the same device tree between my non-xen standalone kernel
> and my dom0 kernel booted by xen.  In the standalone (non-xen) kernel
> the ethernet works fine, but I don't see any of its interrupts in the
> output of /proc/iomem.  I'm not seeing them in /proc/iomem when
> running dom0 under Xen either.  When booting with Xen I get this
> behavior where the ifconfig output shows 1 RX message and 1 TX
> message, and then nothing else.

I am not sure whether this is a typo in the e-mail. /proc/iomem is 
listing the list of the MMIO regions. You want to use /proc/interrupts.

Can you confirm which path you are dumping?

Cheers,

-- 
Julien Grall


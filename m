Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FCC28A066
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 14:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5415.14153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRE9X-00052O-RN; Sat, 10 Oct 2020 12:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5415.14153; Sat, 10 Oct 2020 12:39:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRE9X-00051y-NS; Sat, 10 Oct 2020 12:39:11 +0000
Received: by outflank-mailman (input) for mailman id 5415;
 Sat, 10 Oct 2020 12:39:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rChQ=DR=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kRE9W-00051o-8l
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 12:39:10 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35dcfc93-3c5b-4fb4-9ddc-99eb783075d9;
 Sat, 10 Oct 2020 12:39:09 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kRE9R-00036K-IF; Sat, 10 Oct 2020 12:39:05 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kRE9R-0005p7-8V; Sat, 10 Oct 2020 12:39:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rChQ=DR=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kRE9W-00051o-8l
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 12:39:10 +0000
X-Inumbo-ID: 35dcfc93-3c5b-4fb4-9ddc-99eb783075d9
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 35dcfc93-3c5b-4fb4-9ddc-99eb783075d9;
	Sat, 10 Oct 2020 12:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=hRY+s3qEXwJNSarKsS4Kj8GFgWkuSr8f9z69mMdSWxs=; b=Q5YZNdsjeHfW/nZOenhRvnTrJz
	MoMulswsCCETK+w5tOU1fk5u2gj/2zeqrbJcDJNGF2Fa/MCNnazeVlAX2BUed4Jtww9wcJreE6XMu
	z+oCZoCrUnItklIEg95lc6RY9h4s+oeJwWDgUZ3eEmx1OoVLMTiwJoJ6ljhW5mV2FV5Y=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kRE9R-00036K-IF; Sat, 10 Oct 2020 12:39:05 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kRE9R-0005p7-8V; Sat, 10 Oct 2020 12:39:05 +0000
Subject: Re: [xen-unstable-smoke test] 155612: regressions - FAIL
To: Trammell Hudson <hudson@trmm.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <osstest-155612-mainreport@xen.org>
 <0d3766f0-a1a4-bc86-9372-79b1b65eae47@citrix.com>
 <l13ej-jSgj1tw6_awkBjUgauf1oh4k3PIQavoWsHdhhiH0qLc1hI4x0lK1Sx4S6DseYE2JQ4w1uFwuEgF325BDawQcpOe5sDX95C3MyqXlQ=@trmm.net>
 <KEN3Xd8rbniZ349uB92E_Xej14BVyItkPHvTZ3HnlhQc1w79RbgIbkFWBcNKotWLWXBqb6VkmCdIhgzpWMd8jn77lSkLCH_gSp-ARmzMBUc=@trmm.net>
From: Julien Grall <julien@xen.org>
Message-ID: <efc58afe-aec0-3761-a8e1-4f16dfc1216e@xen.org>
Date: Sat, 10 Oct 2020 13:39:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <KEN3Xd8rbniZ349uB92E_Xej14BVyItkPHvTZ3HnlhQc1w79RbgIbkFWBcNKotWLWXBqb6VkmCdIhgzpWMd8jn77lSkLCH_gSp-ARmzMBUc=@trmm.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 10/10/2020 13:20, Trammell Hudson wrote:
> On Saturday, October 10, 2020 1:42 PM, Trammell Hudson <hudson@trmm.net> wrote:
>> On Friday, October 9, 2020 10:27 PM, Andrew Cooper andrew.cooper3@citrix.com wrote:
>>> [...]
>>> Looks like arm64 is crashing fairly early on boot.
>>> This is probably caused by "efi: Enable booting unified
>>> hypervisor/kernel/initrd images".
>>
>> Darn it. I'm working out how to build and boot qemu aarch64 so
>> that I can figure out what is going on.
> 
> Unfortunately qemu 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.32)
> doesn't replicate this crash using the command line from
> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/qemu-system-aarch64

Are you chainloading Xen?

Cheers,

-- 
Julien Grall


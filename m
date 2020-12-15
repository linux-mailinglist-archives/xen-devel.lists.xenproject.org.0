Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E832DB1D4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:50:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54701.95211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDWG-0002Y7-LA; Tue, 15 Dec 2020 16:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54701.95211; Tue, 15 Dec 2020 16:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDWG-0002Xi-Ha; Tue, 15 Dec 2020 16:49:48 +0000
Received: by outflank-mailman (input) for mailman id 54701;
 Tue, 15 Dec 2020 16:49:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kpDWF-0002Xd-2P
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:49:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpDWE-0003Ef-Rt; Tue, 15 Dec 2020 16:49:46 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpDWE-0006pU-LP; Tue, 15 Dec 2020 16:49:46 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Q56mA1p/aU6IJkPDzP6EJRxz8lUjnDr6+iHAne2CaUU=; b=DFJo+h+wrCNP6wQYfvf+228xoX
	sfBiFjkIw41yKU7Rfrf9ubrbHZNpIc3IF6R1N5e4YUAjpMCMkLtjKB96p0VgeOanDRvyFSgyNYGr7
	P/Y3GFkEpTbV+fN/wEgRgwyO43dk8OOQaByWEBWdCKwSe9lrJmWRz0Ils8lV1vOxt7fs=;
Subject: Re: Xen-ARM DomUs
To: Roman Shaposhnik <roman@zededa.com>, Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <X9gcZu5uJpXx8wNn@mattapan.m5p.com>
 <CAMmSBy_8+PRWiSQxwRN2oB9mLmOnyoCr0mH4L-uUYhm=1GK7Xg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5741302a-1703-7766-96a3-d0f606e9973a@xen.org>
Date: Tue, 15 Dec 2020 16:49:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_8+PRWiSQxwRN2oB9mLmOnyoCr0mH4L-uUYhm=1GK7Xg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 15/12/2020 02:35, Roman Shaposhnik wrote:
> On Mon, Dec 14, 2020 at 6:16 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>>
>> Finally getting to the truly productive stages of my project with Xen on
>> ARM.
>>
>> How many of the OSes which function as x86 DomUs for Xen, function as
>> ARM DomUs?  Getting Linux operational was straightforward, but what of
>> others?
> 
> On EVE we have Windows running as a pretty much a customer-facing demo:
>      https://wiki.lfedge.org/display/EVE/How+get+Windows+10+running+on+a+Raspberry+Pi

Are you saying that Windows is booting on top of Xen on Arm?

Cheers,

-- 
Julien Grall


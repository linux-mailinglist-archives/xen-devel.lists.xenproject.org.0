Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80132E9743
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 15:29:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61264.107642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQqy-0007jp-Cm; Mon, 04 Jan 2021 14:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61264.107642; Mon, 04 Jan 2021 14:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQqy-0007jQ-9V; Mon, 04 Jan 2021 14:29:00 +0000
Received: by outflank-mailman (input) for mailman id 61264;
 Mon, 04 Jan 2021 14:28:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwQqx-0007jL-1f
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 14:28:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e81112f4-8e7a-4ca6-8368-37f8b25b4a67;
 Mon, 04 Jan 2021 14:28:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 660FDB7A7;
 Mon,  4 Jan 2021 14:28:57 +0000 (UTC)
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
X-Inumbo-ID: e81112f4-8e7a-4ca6-8368-37f8b25b4a67
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609770537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OrKywv64bxZunfGJdJo0aQTXSTthRzgu5TCBKjRvukM=;
	b=aZNtDSER94iMAf2Fp0Bq7y0Rs3rHFeWZhCXvZ2yA1cQPOC90hVUw80YoZqtYpD4U1JYjmB
	lOs14DIvDOnFl1w0bkaZviIbEY9wT229/o5OlnCspyPCKYnR7pms3I3Ws150/QVyjN3Bwp
	kIez9k004jZMTWSKROQPZ9CMAnIiiDI=
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
 <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com>
 <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com>
 <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com>
 <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com>
 <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com>
 <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com>
 <Y-6A5xIyjtCDwG3tBoyQnWpypF_eebCmuCjyUovcwd-ZD6wgFvNmR8VAdscAiwKp41toxpDxsgeF10FsEBn2Xm14b8bl9cniO_-TRNwm9mI=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1fc0e850-8a08-760f-c8cb-ad73dda4a37b@suse.com>
Date: Mon, 4 Jan 2021 15:29:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <Y-6A5xIyjtCDwG3tBoyQnWpypF_eebCmuCjyUovcwd-ZD6wgFvNmR8VAdscAiwKp41toxpDxsgeF10FsEBn2Xm14b8bl9cniO_-TRNwm9mI=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.01.2021 07:40, Dylanger Daly wrote:
> Trying to debug Credit2 https://wiki.xenproject.org/wiki/Credit2_Scheduler#Dumping_Status_and_Params
> 
> It should be possible to get some debug output on what Credit2 is doing via pressing 'r' on the Serial Debug port
> 
> Does anyone know if it's at all possible to use a USB-TTY adapter? The wiki (https://wiki.xenproject.org/wiki/Xen_Serial_Console) says it's not possible, this makes debugging any modern laptop really hard, I don't think I've ever owned a laptop with a serial port.

If you have a USB2 debug cable and the laptop has a USB2 (EHCI)
debug port directly underneath the host controller (no hubs
inbetween) this should work ("console=dbgp" and some suitable
"dbgp=..."). However, besides USB2 being quite old and typically
laptops coming with newer ports / controllers nowadays, I've
not come across a laptop where the debug port wasn't behind some
hub ...

Jan


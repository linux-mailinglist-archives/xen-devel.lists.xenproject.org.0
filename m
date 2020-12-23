Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E932E1AAA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 11:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58280.102351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks0w1-0002sQ-8M; Wed, 23 Dec 2020 09:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58280.102351; Wed, 23 Dec 2020 09:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks0w1-0002s3-53; Wed, 23 Dec 2020 09:59:57 +0000
Received: by outflank-mailman (input) for mailman id 58280;
 Wed, 23 Dec 2020 09:59:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks0vz-0002ry-NA
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 09:59:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d61acb6f-6414-4ceb-b2c5-0e512c471425;
 Wed, 23 Dec 2020 09:59:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8468BAF61;
 Wed, 23 Dec 2020 09:59:50 +0000 (UTC)
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
X-Inumbo-ID: d61acb6f-6414-4ceb-b2c5-0e512c471425
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608717590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22Ke/5SG+wrcSc3V1Nr+LM0ihCxBWc6g06UQ0IeOS3E=;
	b=ifEa/7AMDr04G6gmrmvt0J9bgeIRv/jIayK9H9ENGaag6Lv4ofqJiasdEaCoil+n9Y5JTN
	NVQAJCBGwXo3xL2WeEwXfDVI67UoIZsG4KqJLeKonuD1xXgbyffpwCO5Q6WzbwohPcctIX
	+RrWX64lx+z6bXvaqmnha9m76qxkBSI=
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dylanger Daly <dylangerdaly@protonmail.com>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
 <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com>
 <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com>
 <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com>
 <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com>
Date: Wed, 23 Dec 2020 10:59:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 00:04, Dylanger Daly wrote:
> I think I've narrowed down what could be the issue.
> 
> I think disabling SMT on any AMD Zen 2 CPU is breaking Xen's Credit2 scheduler, I can only test on AMD Ryzen 4000 based Mobile CPUs, but I think this is what is causing issues with softlocks/having to pin dom0 1 vcpu.

Dario,

does this maybe ring any bells?

Jan

> I'm currently trying to re-enable SMT on Qubes 4.1 (Xen 4.14) and I'll report my findings here.
> 



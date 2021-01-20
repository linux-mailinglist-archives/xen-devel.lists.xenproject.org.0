Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995372FCD19
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 10:04:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71277.127519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29PV-0005Zw-Vx; Wed, 20 Jan 2021 09:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71277.127519; Wed, 20 Jan 2021 09:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29PV-0005ZX-SQ; Wed, 20 Jan 2021 09:04:17 +0000
Received: by outflank-mailman (input) for mailman id 71277;
 Wed, 20 Jan 2021 09:04:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l29PU-0005ZC-7g
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 09:04:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e171988e-7d5c-4deb-952c-bea75df6849f;
 Wed, 20 Jan 2021 09:04:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12318AAAE;
 Wed, 20 Jan 2021 09:04:14 +0000 (UTC)
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
X-Inumbo-ID: e171988e-7d5c-4deb-952c-bea75df6849f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611133454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/pRFPZ0uiySJH52Wp6OIffqMxmDbX8rGrJQkox0RzU=;
	b=Dy0hDnqDfJUy21DxMCVPgtPSOw0xFbHb1P9OhYlD1CZ0OyAH8M+X8X659bYg6CiS4D76FY
	aTMaox0ejqtNaUZS1bMZK6m0W15U9+axeVbqKihdiOwQ8BD7AA/FyTSdpOC2Ue/FxbYjFn
	pnK7+iu1yV3C4PGjD0DTNOOlUhXQKXk=
Subject: Re: [linux-5.4 bisection] complete test-amd64-amd64-dom0pvh-xl-intel
To: xen-devel@lists.xenproject.org
References: <E1l1vyr-00074y-8j@osstest.test-lab.xenproject.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dbd283e5-44d4-99b2-74a2-f725b6b1b8ce@suse.com>
Date: Wed, 20 Jan 2021 10:04:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <E1l1vyr-00074y-8j@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.01.2021 19:43, osstest service owner wrote:
> branch xen-unstable
> xenbranch xen-unstable
> job test-amd64-amd64-dom0pvh-xl-intel
> testid xen-boot
> 
> Tree: linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: seabios git://xenbits.xen.org/osstest/seabios.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>   Bug introduced:  0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
>   Bug not present: 04b090366ca59e8a75837c822df261a8d0bd1a30
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/158526/
> 
> 
>   commit 0f7bcaf19f7c67ee8c07d1674b2bbb70f16c2d11
>   Author: Jan Beulich <jbeulich@suse.com>
>   Date:   Tue Jan 5 13:18:26 2021 +0100
>   
>       x86/vPCI: check address in vpci_msi_update()
>       
>       If the upper address bits don't match the interrupt delivery address
>       space window, entirely different behavior would need to be implemented.
>       Refuse such requests for the time being.
>       
>       Replace adjacent hard tabs while introducing MSI_ADDR_BASE_MASK.
>       
>       Signed-off-by: Jan Beulich <jbeulich@suse.com>
>       Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Hmm, I'm puzzled. I see

(XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
(XEN) vmsi.c:762:d0v0 0000:00:19.0: failed to map PIRQ: -16

and

(XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
(XEN) vmsi.c:762:d0v0 0000:03:00.0: failed to map PIRQ: -16
(XEN) d0v0 0000:03:00.0: unable to enable entry 0: -16
(XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
(XEN) vmsi.c:762:d0v0 0000:03:00.0: failed to map PIRQ: -16
(XEN) d0v0 0000:03:00.0: unable to enable entry 1: -16
(XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
(XEN) vmsi.c:762:d0v0 0000:03:00.0: failed to map PIRQ: -16
(XEN) d0v0 0000:03:00.0: unable to enable entry 2: -16
(XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
(XEN) vmsi.c:762:d0v0 0000:03:00.0: failed to map PIRQ: -16
(XEN) d0v0 0000:03:00.0: unable to enable entry 3: -16
(XEN) irq.c:2812: dom0: -1:-1 already mapped to -640
(XEN) vmsi.c:762:d0v0 0000:03:00.0: failed to map PIRQ: -16
(XEN) d0v0 0000:03:00.0: unable to enable entry 4: -16

but I specifically do not see any instance of the debugging
message that the supposedly offending commit added. Yet without
any instance of that message I don't see how the change could
make any difference to the behavior.

Jan


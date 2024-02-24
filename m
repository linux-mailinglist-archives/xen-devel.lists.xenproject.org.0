Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818DF862527
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 14:38:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685082.1065431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdsDJ-0006JB-23; Sat, 24 Feb 2024 13:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685082.1065431; Sat, 24 Feb 2024 13:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdsDI-0006Hf-V3; Sat, 24 Feb 2024 13:37:12 +0000
Received: by outflank-mailman (input) for mailman id 685082;
 Sat, 24 Feb 2024 13:37:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rdsDH-0006HZ-D9
 for xen-devel@lists.xenproject.org; Sat, 24 Feb 2024 13:37:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rdsDG-0006BP-OY; Sat, 24 Feb 2024 13:37:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rdsDG-0001u1-Df; Sat, 24 Feb 2024 13:37:10 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=6+3ORigXTMHF7gWR/0z8B7LLduvQ7kjHteB4pKe2qEo=; b=fcImsQKY288DqlUHK0DIeqse99
	1m9laWtroX4Y1v5x2r6ifPsgShemOmOoFcHhlSmqHDZbPzf8Mj+3yKfGIo3yhI6yaHAfSPQjcAnBl
	i5BhL1F4dHjeHy6x64XN72DeamYFb4gPv5Vgx/eW1X73Z2POEvnDCrrh4mspkPwv48is=;
Message-ID: <bb2485e5-7818-435b-8d9c-dda88100979f@xen.org>
Date: Sat, 24 Feb 2024 13:37:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IMPORTANT - : Need help on USB port virtualization with Xen
 hypervisor
Content-Language: en-GB
To: GOURLOT Francois <francois.gourlot@thalesgroup.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kelly Choi <kelly.choi@cloud.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>
References: <d2de4ae9ecb34efc962dea7f8b4e7cbd@thalesgroup.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d2de4ae9ecb34efc962dea7f8b4e7cbd@thalesgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dominique and Francois,

Thank you for the report. I am CCing some person who I think could help.

I also have some questions (see below).

On 23/02/2024 16:00, GOURLOT Francois wrote:
> Dear All,
> 
> We send you a message few days ago.
> 
> We have major performance with XEN USB Drivers. We use your driver to 
> load data in a device and we need USB3 High Speed USB protocole
> 
> Do you have a new issue of the HCI and NEC USB Xen Driver ?

[...]

> *De :*LARRIEU Dominique <dominique.larrieu@thalesgroup.com>
> *Envoyé :* jeudi 22 février 2024 13:58
> *À :* xen-devel@lists.xenproject.org
> *Cc :* WILLEMS Louis <louis.willems@thalesgroup.com>; GRUO Nicolas 
> <nicolas-n.gruo@thalesgroup.com>; GOURLOT Francois 
> <francois.gourlot@thalesgroup.com>; Kelly Choi <kelly.choi@cloud.com>
> *Objet :* Need help on USB port virtualization with Xen hypervisor
> *Critère de diffusion :* Confidentiel
> 
>     Dear all,
> 
>     We are detectingseveral issues with USB port virtualization with the
>     Xen hypervisor.

Just to clarify, you are assigning the PCI USB bus (rather than just the 
USB device) to the guest. Is that correct?

If so...

 >
 > Do you have a new issue of the HCI and NEC USB Xen Driver ?

... I am not sure what Xen driver you are talking about. If the USB bus 
is assigned to the guest, then I would expect no specific Xen driver are 
required. Do you have any pointer to the existing one?

>     - We cannot do PCI passthrough of the PCI usb bus on a Windows 10
>     1607 64-bit virtual machine. The bad result is a Windows blue screen.
> 
>     - When we use the passthrough functionality on a Windows 21H2
>     virtual machine, we notice thatthe speed of the USB port is not high
>     speed but full speed on a USB 3.0 port
> 
>     - We notice instabilities when using the nec-usb-xhci driver,  USB
>     2.0 keys are not recognized by the Windows virtual machine
>     (incorrect descriptor)

Do you have any logs you could share from the guest OS? Also, would you 
be able to share more details on how you configure the guest? (e.g. xl 
configuration, libvirt...)?

> 
>     We needyour helpto find a solution for these problems.
> 
>     The Software used are :

Can you share some details of the HW you are using?

> 
>     -Debian 11 version5.10.0-20
> 
>     -Xen version4.14

Are minor version of Xen 4.14 are you using? Any patches on top?

Xen 4.14 has also been out of support for a few months now. If that's 
possible, I would recommend to try a new Xen version (the last stable is 
4.18) just in case your issue as been fixed in newer release.

> 
>     -Windows 10 1607 and 21H2 for virtual machines. Virtual Machine HVM

Cheers,

-- 
Julien Grall


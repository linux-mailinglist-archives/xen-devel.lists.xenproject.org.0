Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9122A6F462
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 12:40:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926385.1329231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2de-00015M-VV; Tue, 25 Mar 2025 11:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926385.1329231; Tue, 25 Mar 2025 11:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2de-00013S-Sb; Tue, 25 Mar 2025 11:40:10 +0000
Received: by outflank-mailman (input) for mailman id 926385;
 Tue, 25 Mar 2025 11:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5k1R=WM=srs.euronap.de=SRS1=eR8k=home.tangomaris.de==Y/rQ=WM=sl.nospam.tangomaris.de=xen-mailinglist@srs-se1.protection.inumbo.net>)
 id 1tx2dd-00013M-7J
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 11:40:09 +0000
Received: from mail.euronap.de (mail.euronap.de [84.38.78.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e48c9e6c-096d-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 12:40:04 +0100 (CET)
Received: from home.tangomaris.de
 (ip-130-180-058-238.um40.pools.vodafone-ip.de [130.180.58.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.euronap.de (Postfix) with ESMTPSA id 4ZMSdb0kvrz6tdn
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 12:40:03 +0100 (CET)
Received: from [192.168.222.26] (ip-109-091-129-157.um37.pools.vodafone-ip.de
 [109.91.129.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by gw.tangomaris.de (Postfix) with ESMTPSA id 4ZMSdZ1SwRz3wrV
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 12:40:02 +0100 (CET)
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
X-Inumbo-ID: e48c9e6c-096d-11f0-9ffa-bf95429c2676
Message-ID: <fd22dff4-0fd4-4e72-8877-ad5532f6b3bf@sl.nospam.tangomaris.de>
Date: Tue, 25 Mar 2025 12:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: VIF network definition does not work with backend=domnet
To: xen-devel@lists.xenproject.org
References: <f06ad622-4bb7-4a7d-9d11-a3c1456a4aa1@sl.nospam.tangomaris.de>
 <CAKf6xptiqnwcsc8q8nFk_XBGjP392o4kvLjc3_GzgaO_XpyJoA@mail.gmail.com>
Content-Language: de-CH
From: Shen Long <xen-mailinglist@sl.nospam.tangomaris.de>
In-Reply-To: <CAKf6xptiqnwcsc8q8nFk_XBGjP392o4kvLjc3_GzgaO_XpyJoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 23.03.25 um 15:56 schrieb Jason Andryuk:
> On Sat, Mar 22, 2025 at 8:51 AM Shen Long
> <xen-mailinglist@sl.nospam.tangomaris.de> wrote:
>>
>> Hello,
> 
> Hi Shen,

Hi Jason,

> Try:
> vif = [ 'backend=netbackend,bridge=dmz,type=vif' ]
> 
> This will give "test" just a PV nic (and not an emulated nic).

yes, thank you thats it!

Though to be fair, i did cross post on xen-users because i got 
impatient. I tried to post here and didnt get activated on xen-devel but 
also did not get any feedback from the maillinglist server about my 
initial post. So i signed up for xen-users.
Then i found a solution but didnt understand it and posted my findings 
their.

> /var/log/xen/qemu-dm-test.log probably reports an error about bridge
> dmz not existing.

It does report about missing tun interface on dom0, but i missed to look 
at the log-files completely. Interesting the tun interface is not 
necessary on netbackend. But i think it would be, if i have to use the 
emulated type, maybe i need it later.

> qemu runs in dom0, but your bridge "dmz" is in the driver domain,
> "netbackend".  By using type=vif, xl skips creating the emulated nic
> with qemu.  I think `xl network-attach` uses type=vif by default,
> which also avoids the emulated nic issue.

That's the thing, i did see that the type=vif does something different 
in the documentation but i did not understand what the differences are. 
So because i now know something more. It makes sense and thanks for the 
clarification.

> Regards,
> Jason

Best regards,
Shen


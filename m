Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD/KI/lC0WlUHAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 04 Apr 2026 18:57:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77E139BD34
	for <lists+xen-devel@lfdr.de>; Sat, 04 Apr 2026 18:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1273815.1560295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w94IQ-0007Lz-IT; Sat, 04 Apr 2026 16:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1273815.1560295; Sat, 04 Apr 2026 16:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w94IQ-0007J8-FI; Sat, 04 Apr 2026 16:56:30 +0000
Received: by outflank-mailman (input) for mailman id 1273815;
 Sat, 04 Apr 2026 16:56:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chleroy@kernel.org>) id 1w94IO-0007J1-FN
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2026 16:56:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w94IN-003sCG-Rl
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2026 18:56:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chleroy@kernel.org>)
 id 69d14272-bab6-0a2a0a5309dd-0a2a450ca3fc-34
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 18:56:27 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <chleroy@kernel.org>)
 id 69d142b9-f40c-0a2a450c0019-aceafc1fa3d6-3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Apr 2026 18:56:27 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C91694059C;
 Sat,  4 Apr 2026 16:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A189EC19421;
 Sat,  4 Apr 2026 16:56:09 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:Subject:From:To:Cc:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775321784;
	bh=z0EKK9uCRclvxyjrhd1+SN0RRq/OFfBzrXy9eOqqb1Y=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Pvkgz2VYtss1MeKDd1hCnXOqFhZSJT7sCBgib4Ld40MuoHbsbTzaQtqEQlHI315/z
	 sSsTrUhsdTJPdFsI6MsazCxIagVra3Yz7Nj6ieza8kV78SqaqqkR1jw4ERelqbogu8
	 P2C5HKTLPE156wtoOmaEhBjNWmWs1/5XjIm7Pn+IztUEvzTxOWgE4ijDSgxwxt7sHW
	 /z+by/VjXh6iXK4C6vfLmsq7Ld8muhOBjOIJmJuiMgdiDbMtkSfkPxjp0+PDXt64DF
	 SAsEhipno3UJ1XHvp0XZyChIymjhWJhckqoZh6Dfi1SExI1b8SJikdcJieSIN27yIj
	 n1QGwKpOYjS/A==
Message-ID: <faa68f96-5b10-45d0-a5dc-fac4350a7dd7@kernel.org>
Date: Sat, 4 Apr 2026 18:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] bus: fsl-mc: use generic driver_override
 infrastructure
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Long Li <longli@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Armin Wolf <W_Armin@gmx.de>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C4=82=C2=A9rez?=
 <eperezma@redhat.com>, Alex Williamson <alex@shazbot.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org,
 Gui-Dong Han <hanguidong02@gmail.com>
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260324005919.2408620-3-dakr@kernel.org>
 <cvcetxkxjq2tz6n2vsofhyzove3qdi2e4r6rq6yxou3joejk2h@rmt5ygav7ssu>
 <4c5e9bad-82f0-4714-99c2-8ccd79a45043@kernel.org>
Content-Language: fr-FR
In-Reply-To: <4c5e9bad-82f0-4714-99c2-8ccd79a45043@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775321787-81F52A3D-CE7E2EFD/0/0
X-purgate-type: clean
X-purgate-size: 3496
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ioana.ciornei@nxp.com,m:dakr@kernel.org,m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:li
 nux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:hanguidong02@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,nxp.com:email];
	FORGED_SENDER(0.00)[chleroy@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E77E139BD34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



Le 28/03/2026 à 13:10, Christophe Leroy (CS GROUP) a écrit :
> 
> 
> Le 25/03/2026 à 13:01, Ioana Ciornei a écrit :
>> On Tue, Mar 24, 2026 at 01:59:06AM +0100, Danilo Krummrich wrote:
>>> When a driver is probed through __driver_attach(), the bus' match()
>>> callback is called without the device lock held, thus accessing the
>>> driver_override field without a lock, which can cause a UAF.
>>>
>>> Fix this by using the driver-core driver_override infrastructure taking
>>> care of proper locking internally.
>>>
>>> Note that calling match() from __driver_attach() without the device lock
>>> held is intentional. [1]
>>>
>>> Link: https://eur01.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Flore.kernel.org%2Fdriver- 
>>> core%2FDGRGTIRHA62X.3RY09D9SOK77P%40kernel.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4b9262ddecdd4ce29f9808de8a66485e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639100369055903282%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BRfjlUkq7oWV%2F0v2S2B%2BEuxCY%2FLRQv6qHiEWiupd6kc%3D&reserved=0 [1]
>>> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
>>> Closes: https://eur01.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D220789&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4b9262ddecdd4ce29f9808de8a66485e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639100369055936232%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=XL1K1ICiygOZnlvDUbQFe192KnLsBQms0HFNGCuyz%2Fw%3D&reserved=0
>>> Fixes: 1f86a00c1159 ("bus/fsl-mc: add support for 'driver_override' 
>>> in the mc-bus")
>>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>>
>> Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com>
>> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
>>
> 
> 
> Applied, thanks

Have to drop it for now, build fails:

   CALL    scripts/checksyscalls.sh
   CC      drivers/bus/fsl-mc/fsl-mc-bus.o
drivers/bus/fsl-mc/fsl-mc-bus.c: In function 'fsl_mc_bus_match':
drivers/bus/fsl-mc/fsl-mc-bus.c:92:15: error: implicit declaration of 
function 'device_match_driver_override' 
[-Werror=implicit-function-declaration]
    92 |         ret = device_match_driver_override(dev, drv);
       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/bus/fsl-mc/fsl-mc-bus.c: At top level:
drivers/bus/fsl-mc/fsl-mc-bus.c:321:10: error: 'const struct bus_type' 
has no member named 'driver_override'
   321 |         .driver_override = true,
       |          ^~~~~~~~~~~~~~~
drivers/bus/fsl-mc/fsl-mc-bus.c:321:28: warning: initialization of 
'const char *' from 'int' makes pointer from integer without a cast 
[-Wint-conversion]
   321 |         .driver_override = true,
       |                            ^~~~
drivers/bus/fsl-mc/fsl-mc-bus.c:321:28: note: (near initialization for 
'fsl_mc_bus_type.dev_name')
cc1: some warnings being treated as errors
make[5]: *** [scripts/Makefile.build:289: 
drivers/bus/fsl-mc/fsl-mc-bus.o] Error 1
make[4]: *** [scripts/Makefile.build:546: drivers/bus/fsl-mc] Error 2
make[3]: *** [scripts/Makefile.build:546: drivers/bus] Error 2
make[2]: *** [scripts/Makefile.build:546: drivers] Error 2
make[1]: *** [/home/chleroy/linux-powerpc/Makefile:2101: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

Christophe



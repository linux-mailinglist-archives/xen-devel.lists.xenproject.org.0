Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPylF2FvxWkB+QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 18:39:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CED339488
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 18:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264610.1556068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ofR-0006CT-KV; Thu, 26 Mar 2026 17:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264610.1556068; Thu, 26 Mar 2026 17:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ofR-00069Q-Hq; Thu, 26 Mar 2026 17:38:49 +0000
Received: by outflank-mailman (input) for mailman id 1264610;
 Thu, 26 Mar 2026 17:38:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w5ofQ-00069K-Hb
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 17:38:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5ofP-003rHA-QL
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 18:38:47 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69c56f0c-5cb7-0a2a0a5109dd-0a2a4501b8fe-20
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 18:38:47 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69c56f26-6400-0a2a45010019-ac6904fe9d8c-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 18:38:47 +0100
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F2DE6011F;
 Thu, 26 Mar 2026 17:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CF3C116C6;
 Thu, 26 Mar 2026 17:38:37 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:Cc:To:From:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774546725;
	bh=hAAiF8xSgL3z4E5G5/XmRxGLgvCy/D0+zQfYgHI39gw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=ArEAbT+s3n7x1zNm2qUyfultheclQsMn7Cylk1mxfVokFRrNp3WpcDfI8mmayZ+0h
	 m2cGLs0n6Sh6ZCu8EvHXqLDxmAX8LMqlZoRnQEfHReuoiYU3xPG1brRn0xv/B7nG91
	 dfctDdAzWRRIBz5wDeTdWGKHbyzznewMhiup0tTEhLqFpUABWkXccnP5fkKD1V8bqG
	 AQrp8yU+1knEeWB4pCRAjqoVJNKbnXs/r4tup9fByZXD5EgZfswwbwv0q7Wo741gye
	 MvHPzW2Tb0nrON4/+fHRtWe9N46CjKkZ5ux8WM6YRAe6n1JfA4kFbYnKDRvMa6t1Pa
	 3vRMCPXPpyakA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 18:38:35 +0100
Message-Id: <DHCWB6YQ7B8E.1I9WCHXJ6FBPH@kernel.org>
Cc: "Russell King" <linux@armlinux.org.uk>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Ioana Ciornei" <ioana.ciornei@nxp.com>, "Nipun Gupta"
 <nipun.gupta@amd.com>, "Nikhil Agarwal" <nikhil.agarwal@amd.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, "Haiyang Zhang" <haiyangz@microsoft.com>,
 "Wei Liu" <wei.liu@kernel.org>, "Dexuan Cui" <decui@microsoft.com>, "Long
 Li" <longli@microsoft.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Armin
 Wolf" <W_Armin@gmx.de>, "Bjorn Andersson" <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, "Vineeth Vijayan"
 <vneethv@linux.ibm.com>, "Peter Oberparleiter" <oberpar@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger"
 <borntraeger@linux.ibm.com>, "Sven Schnelle" <svens@linux.ibm.com>, "Harald
 Freudenberger" <freude@linux.ibm.com>, "Holger Dengler"
 <dengler@linux.ibm.com>, "Mark Brown" <broonie@kernel.org>, "Jason Wang"
 <jasowang@redhat.com>, "Xuan Zhuo" <xuanzhuo@linux.alibaba.com>,
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, "Alex Williamson"
 <alex@shazbot.org>, "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Oleksandr Tyshchenko"
 <oleksandr_tyshchenko@epam.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-hyperv@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <linux-s390@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <virtualization@lists.linux.dev>,
 <kvm@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-arm-kernel@lists.infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 00/12] treewide: Convert buses to use generic
 driver_override
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260325052919-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260325052919-mutt-send-email-mst@kernel.org>
X-purgate-ID: tlsNG-d62444/1774546727-234EFDF3-AADA0091/0/0
X-purgate-type: clean
X-purgate-size: 278
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-arm-msm@vg
 er.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:mst@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORGED_SENDER(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F3CED339488
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Mar 25, 2026 at 10:29 AM CET, Michael S. Tsirkin wrote:
> vdpa bits:
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> I assume it'll all be merged together?

I can take it through the driver-core tree if you prefer, but you can also =
pick
it up yourself.


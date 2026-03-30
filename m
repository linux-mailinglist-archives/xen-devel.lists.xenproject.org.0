Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEBXKeukymmx+gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 18:29:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5914035ECB1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 18:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268030.1557383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FU8-0005b5-8K; Mon, 30 Mar 2026 16:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268030.1557383; Mon, 30 Mar 2026 16:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7FU8-0005YU-5b; Mon, 30 Mar 2026 16:29:04 +0000
Received: by outflank-mailman (input) for mailman id 1268030;
 Mon, 30 Mar 2026 16:29:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w7FU6-0005YO-HK
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:29:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7FU5-004L0x-Bn
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 18:29:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69caa493-5cb7-0a2a0a5109dd-0a2a450c8b36-44
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:29:01 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69caa4cc-f93d-0a2a450c0019-ac6904feac1a-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 18:29:00 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3C334600CB;
 Mon, 30 Mar 2026 16:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2732FC4CEF7;
 Mon, 30 Mar 2026 16:28:49 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:Subject:Cc:To:From:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774888138;
	bh=HnR3T8HyhR5zh3UidQc9tY5GP+iCNJ+9G4eesNsn66c=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=P/3XWocfTvHDzL/TvgnY90VGL4nSlLd5QBe5hsYLKubBK3nWHOJaPjPq5JQAaRhM8
	 iAGk5KjaD3ik9GNqL6YSdRdGeXxBgLs24zJtsj3e6fxOpDbi7ZZd8I/d1cyMypX8NE
	 2XOL2YHA8im3TC/6MZc4CKSvIWYdWZeBHcvNBDXSWRJJuejsAH9jaZzQRbryV+m5kG
	 lnPI2WxSgVXB97c4laa/t/vZgU3QAb4tmja9ypMEFSoxTNm4EFRWFco06IOLdeGzNC
	 AdWvpkXe36xoTq6sFQYDIMUXUgS6vorYizdKVDGjM2rmv+ZiFnuwAzo46ijHVV7DUf
	 PA+6jJae0BAbA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 18:28:48 +0200
Message-Id: <DHG9BXUEUEU4.2DTNLE8Z61DKX@kernel.org>
Subject: Re: [PATCH 05/12] PCI: use generic driver_override infrastructure
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
 <dengler@linux.ibm.com>, "Mark Brown" <broonie@kernel.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, "Jason Wang" <jasowang@redhat.com>, "Xuan Zhuo"
 <xuanzhuo@linux.alibaba.com>, =?utf-8?q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, "Alex Williamson" <alex@shazbot.org>, "Juergen
 Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Christophe Leroy
 (CS GROUP)" <chleroy@kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-hyperv@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <linux-s390@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <virtualization@lists.linux.dev>,
 <kvm@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-arm-kernel@lists.infradead.org>, "Gui-Dong Han"
 <hanguidong02@gmail.com>
To: "Bjorn Helgaas" <helgaas@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260324005919.2408620-6-dakr@kernel.org>
 <20260326180825.GA1330769@bhelgaas>
In-Reply-To: <20260326180825.GA1330769@bhelgaas>
X-purgate-ID: tlsNG-d25034/1774888141-6E0B0734-E2663AF9/0/0
X-purgate-type: clean
X-purgate-size: 1460
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,shazbot.org,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:alex@shazbot.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m
 :linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:hanguidong02@gmail.com,m:helgaas@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5914035ECB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 26, 2026 at 7:08 PM CET, Bjorn Helgaas wrote:
> On Tue, Mar 24, 2026 at 01:59:09AM +0100, Danilo Krummrich wrote:
>> When a driver is probed through __driver_attach(), the bus' match()
>> callback is called without the device lock held, thus accessing the
>> driver_override field without a lock, which can cause a UAF.
>>=20
>> Fix this by using the driver-core driver_override infrastructure taking
>> care of proper locking internally.
>>=20
>> Note that calling match() from __driver_attach() without the device lock
>> held is intentional. [1]
>>=20
>> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@ker=
nel.org/ [1]
>> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
>> Fixes: 782a985d7af2 ("PCI: Introduce new device binding path using pci_d=
ev.driver_override")
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>>  drivers/pci/pci-driver.c           | 11 +++++++----
>>  drivers/pci/pci-sysfs.c            | 28 ----------------------------
>>  drivers/pci/probe.c                |  1 -
>>  include/linux/pci.h                |  6 ------
>
> For the above:
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>
> "driver_override" is mentioned several places in
> Documentation/ABI/testing/sysfs-bus-*.  I assume this series doesn't
> change the behavior documented there?

Correct, none of this is altered.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBUGGWu1ymmE/QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 19:39:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1535F5F5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 19:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268069.1557464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7GZl-0006f3-RO; Mon, 30 Mar 2026 17:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268069.1557464; Mon, 30 Mar 2026 17:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7GZl-0006cx-OM; Mon, 30 Mar 2026 17:38:57 +0000
Received: by outflank-mailman (input) for mailman id 1268069;
 Mon, 30 Mar 2026 17:38:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w7GZj-0006cr-Tx
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 17:38:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7GZj-00HT9e-5l
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 19:38:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69cab521-e002-0a2a0a5209dd-0a2a4507c428-18
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 19:38:54 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69cab52d-fd74-0a2a45070019-aceafc1fe2a4-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 19:38:54 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9772E42A31;
 Mon, 30 Mar 2026 17:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39967C2BCB5;
 Mon, 30 Mar 2026 17:38:43 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:Subject:Cc:To:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774892332;
	bh=/8RwifExta3hi9wb0UAvoCzja5DI/LlE9XUZDEKtDlU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=S56YWHrxhwHLS+EfSzEoW6H9YreN8wrQZ/7HEDAWqAjDAvn6rNoi6jXsbwo3fyTXv
	 TjHIGPt2qRPbkCCC5yCfSjAbtAw6BzXCZXCaq/yn658JrR6/xBRJ7/mYaDQNBA9Pmv
	 wsEtOTKeR8oMh9VC6LyR87wz4W/9tT1+Zpl9oixkuOSdi9YZxoGPEs7WRJpEIUF6YP
	 QT3eMcBSThXdTkmokN7Q16p5we5dG5K2/LjDkgP9NUYvkxjgwB7vubbfIKhxuyu2dj
	 oq30Tych+FNSMtuze99IC0ZOa+AcROHbp3uZujJVXn+3TGN1ylZ7O8WH21Mk5oRMNX
	 /gBaIKRkeOGJg==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 19:38:41 +0200
Message-Id: <DHGATG6LJOM1.2AI7BYQ2O4DFU@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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
 <eperezma@redhat.com>, "Juergen Gross" <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko"
 <oleksandr_tyshchenko@epam.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-hyperv@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <linux-s390@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <virtualization@lists.linux.dev>,
 <kvm@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-arm-kernel@lists.infradead.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gui-Dong Han" <hanguidong02@gmail.com>
To: "Alex Williamson" <alex@shazbot.org>, "Jason Gunthorpe" <jgg@ziepe.ca>
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260324005919.2408620-6-dakr@kernel.org>
In-Reply-To: <20260324005919.2408620-6-dakr@kernel.org>
X-purgate-ID: tlsNG-ef75cf/1774892334-4EAAD303-DB0ACEB9/0/0
X-purgate-type: clean
X-purgate-size: 1452
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-arm-msm@vger
 .kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:dakr@kernel.org,m:hanguidong02@gmail.com,m:alex@shazbot.org,m:jgg@ziepe.ca,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_GT_50(0.00)[51];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 00B1535F5F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(Cc: Jason)

On Tue Mar 24, 2026 at 1:59 AM CET, Danilo Krummrich wrote:
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci=
_core.c
> index d43745fe4c84..460852f79f29 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1987,9 +1987,8 @@ static int vfio_pci_bus_notifier(struct notifier_bl=
ock *nb,
>  	    pdev->is_virtfn && physfn =3D=3D vdev->pdev) {
>  		pci_info(vdev->pdev, "Captured SR-IOV VF %s driver_override\n",
>  			 pci_name(pdev));
> -		pdev->driver_override =3D kasprintf(GFP_KERNEL, "%s",
> -						  vdev->vdev.ops->name);
> -		WARN_ON(!pdev->driver_override);
> +		WARN_ON(device_set_driver_override(&pdev->dev,
> +						   vdev->vdev.ops->name));

Technically, this is a change in behavior. If vdev->vdev.ops->name is NULL,=
 it
will trigger the WARN_ON(), whereas before it would have just written "(nul=
l)"
into driver_override.

I assume that vfio_pci_core drivers are expected to set the name in struct
vfio_device_ops in the first place and this code (silently) relies on this
invariant?

Alex, Jason: Should we keep this hunk above as is and check for a proper na=
me in
struct vfio_device_ops in vfio_pci_core_register_device() with a subsequent
patch?

>  	} else if (action =3D=3D BUS_NOTIFY_BOUND_DRIVER &&
>  		   pdev->is_virtfn && physfn =3D=3D vdev->pdev) {
>  		struct pci_driver *drv =3D pci_dev_driver(pdev);


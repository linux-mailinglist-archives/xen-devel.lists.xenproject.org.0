Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMuICbuAy2kxIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:07:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E671365C74
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268573.1557816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7U7c-0008D1-Ls; Tue, 31 Mar 2026 08:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268573.1557816; Tue, 31 Mar 2026 08:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7U7c-0008A7-J4; Tue, 31 Mar 2026 08:06:48 +0000
Received: by outflank-mailman (input) for mailman id 1268573;
 Tue, 31 Mar 2026 08:06:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1w7U7b-00089i-0q
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:06:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7U7Z-00FadY-V3
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:06:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 69cb8094-5cb7-0a2a0a5109dd-0a2a4502938a-6
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:06:45 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <dakr@kernel.org>)
 id 69cb8094-63bb-0a2a45020019-ac6904fee6ce-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:06:45 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E36C860133;
 Tue, 31 Mar 2026 08:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9364DC2BCB1;
 Tue, 31 Mar 2026 08:06:34 +0000 (UTC)
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
	s=k20201202; t=1774944403;
	bh=7ZnFUcGBpSYxCeawHwcWvE73wN8LYb8XSX/aZ34llBU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=AWIlCHwQfZsUuHzOmGZpVGY5YC2rf+d68CeBHq+msonYwp7U2eqLrZxes/cDwOhzj
	 cxpHUVzGLXyiRtTuiesiUTZk1jZ4TcDex7KFW8cftoKdzZUi7rr5OJwggbIXG1Qkjk
	 y+1kJYFjlXJgwRMxjX5gpnBgZX2SWzf28LHVl+Lqu+vuVqVDfsqOYyI0fBSLNK4oiz
	 5o/ZjxvWe1HfMi03Q77GYttGBzv0VRF/kGrPedoVKNJAcdTkHpW3bIz1sDtXTCy1mo
	 2Z3qOFa/hlvy8JEPivh5B8wp9J/5+CgONWe9R6Y+M3smVnPJrUWUnRppA4rHbFzvHS
	 mmm1NDCdVo7ag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 10:06:32 +0200
Message-Id: <DHGT9XCG8Y96.3IB1EI6FF1ZDZ@kernel.org>
Subject: Re: [PATCH 05/12] PCI: use generic driver_override infrastructure
Cc: "Jason Gunthorpe" <jgg@ziepe.ca>, "Russell King"
 <linux@armlinux.org.uk>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Ioana Ciornei"
 <ioana.ciornei@nxp.com>, "Nipun Gupta" <nipun.gupta@amd.com>, "Nikhil
 Agarwal" <nikhil.agarwal@amd.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>, "Wei Liu" <wei.liu@kernel.org>,
 "Dexuan Cui" <decui@microsoft.com>, "Long Li" <longli@microsoft.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Armin Wolf" <W_Armin@gmx.de>,
 "Bjorn Andersson" <andersson@kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Vineeth Vijayan" <vneethv@linux.ibm.com>,
 "Peter Oberparleiter" <oberpar@linux.ibm.com>, "Heiko Carstens"
 <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger"
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
 <linux-arm-kernel@lists.infradead.org>, "Gui-Dong Han"
 <hanguidong02@gmail.com>
To: "Alex Williamson" <alex@shazbot.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
 <20260324005919.2408620-6-dakr@kernel.org>
 <DHGATG6LJOM1.2AI7BYQ2O4DFU@kernel.org>
 <20260330141050.2cb47bd9@shazbot.org>
In-Reply-To: <20260330141050.2cb47bd9@shazbot.org>
X-purgate-ID: tlsNG-720697/1774944405-4149FDB8-40848EF4/0/0
X-purgate-type: clean
X-purgate-size: 3463
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ziepe.ca,armlinux.org.uk,linuxfoundation.org,kernel.org,nxp.com,amd.com,microsoft.com,google.com,gmx.de,linaro.org,linux.ibm.com,redhat.com,linux.alibaba.com,suse.com,epam.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.xenproject.org,lists.infradead.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:linux@armlinux.org.uk,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ioana.ciornei@nxp.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:bhelgaas@google.com,m:W_Armin@gmx.de,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:vneethv@linux.ibm.com,m:oberpar@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:freude@linux.ibm.com,m:dengler@linux.ibm.com,m:broonie@kernel.org,m:mst@redhat.com,m:jasowang@redhat.com,m:xuanzhuo@linux.alibaba.com,m:eperezma@redhat.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:lin
 ux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-spi@vger.kernel.org,m:virtualization@lists.linux.dev,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:hanguidong02@gmail.com,m:alex@shazbot.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 7E671365C74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Mar 30, 2026 at 10:10 PM CEST, Alex Williamson wrote:
> On Mon, 30 Mar 2026 19:38:41 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>
>> (Cc: Jason)
>>=20
>> On Tue Mar 24, 2026 at 1:59 AM CET, Danilo Krummrich wrote:
>> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_=
pci_core.c
>> > index d43745fe4c84..460852f79f29 100644
>> > --- a/drivers/vfio/pci/vfio_pci_core.c
>> > +++ b/drivers/vfio/pci/vfio_pci_core.c
>> > @@ -1987,9 +1987,8 @@ static int vfio_pci_bus_notifier(struct notifier=
_block *nb,
>> >  	    pdev->is_virtfn && physfn =3D=3D vdev->pdev) {
>> >  		pci_info(vdev->pdev, "Captured SR-IOV VF %s driver_override\n",
>> >  			 pci_name(pdev));
>> > -		pdev->driver_override =3D kasprintf(GFP_KERNEL, "%s",
>> > -						  vdev->vdev.ops->name);
>> > -		WARN_ON(!pdev->driver_override);
>> > +		WARN_ON(device_set_driver_override(&pdev->dev,
>> > +						   vdev->vdev.ops->name)); =20
>>=20
>> Technically, this is a change in behavior. If vdev->vdev.ops->name is NU=
LL, it
>> will trigger the WARN_ON(), whereas before it would have just written "(=
null)"
>> into driver_override.
>
> It's worse than that.  Looking at the implementation in [1], we have:
>
> +static inline int device_set_driver_override(struct device *dev, const c=
har *s)
> +{
> +	return __device_set_driver_override(dev, s, strlen(s));
> +}
>
> So if name is NULL, we oops in strlen() before we even hit the -EINVAL
> and WARN_ON().

This was changed in v2 [2] and the actual code in-tree is

	static inline int device_set_driver_override(struct device *dev, const cha=
r *s)
	{
		return __device_set_driver_override(dev, s, s ? strlen(s) : 0);
	}

so it does indeed return -EINVAL for a NULL pointer.

> I don't believe we have any vfio-pci variant drivers where the name is
> NULL, but kasprintf() handling NULL as "(null)" was a consideration in
> this design, that even if there is no name the device is sequestered
> with a driver_override that won't match an actual driver.
>
>> I assume that vfio_pci_core drivers are expected to set the name in stru=
ct
>> vfio_device_ops in the first place and this code (silently) relies on th=
is
>> invariant?
>
> We do expect that, but it was previously safe either way to make sure
> VFs are only bound to the same ops driver or barring that, at least
> don't perform a standard driver match.  The last thing we want to
> happen automatically is for a user owned PF to create SR-IOV VFs that
> automatically bind to native kernel drivers.
> =20
>> Alex, Jason: Should we keep this hunk above as is and check for a proper=
 name in
>> struct vfio_device_ops in vfio_pci_core_register_device() with a subsequ=
ent
>> patch?
>
> Given the oops, my preference would be to roll it in here.  This change
> is what makes it a requirement that name cannot be NULL, where this was
> safely handled with kasprintf().

Again, no oops here. :)

I still think it makes more sense to fail early in
vfio_pci_core_register_device(), rather than silently accept "(null)" in
driver_override. It also doesn't seem unreasonable with only the WARN_ON(),=
 but
I can also just add vdev->vdev.ops->name ?: "(null)".

Please let me know what you prefer.

- Danilo

> [1] https://lore.kernel.org/all/20260302002729.19438-2-dakr@kernel.org/

[2] https://lore.kernel.org/driver-core/20260303115720.48783-1-dakr@kernel.=
org/


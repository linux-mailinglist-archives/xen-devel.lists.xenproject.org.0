Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210C629F6F2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 22:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15054.37680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYFZ6-0005Hf-AV; Thu, 29 Oct 2020 21:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15054.37680; Thu, 29 Oct 2020 21:34:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYFZ6-0005HD-6P; Thu, 29 Oct 2020 21:34:36 +0000
Received: by outflank-mailman (input) for mailman id 15054;
 Thu, 29 Oct 2020 21:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kYFZ5-0005H5-8z
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 21:34:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24934f57-594d-41e4-8cfc-adc5ae92920b;
 Thu, 29 Oct 2020 21:34:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50D5620731;
 Thu, 29 Oct 2020 21:34:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kYFZ5-0005H5-8z
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 21:34:35 +0000
X-Inumbo-ID: 24934f57-594d-41e4-8cfc-adc5ae92920b
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 24934f57-594d-41e4-8cfc-adc5ae92920b;
	Thu, 29 Oct 2020 21:34:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 50D5620731;
	Thu, 29 Oct 2020 21:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604007273;
	bh=ZRwgpdl6pgaYDU1dnZVdmAY97Zm/vVutiyjWKLVCaxM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=2dLzgniFXG1XFt8xqj6eErMg/hWz++LxEEABpLTMJ3Km4DYr/8tYR1YNajKPq5XD9
	 Y3jfjEXTQvRUhZPTfNhmzbPDzblQ6hBOiSVR1nzz5HcgqLau6YmID5tIq9900H/ReL
	 b09Dz0WT1xdm5zWwwZchDCggZ9E9Kw+W6itBs+KU=
Date: Thu, 29 Oct 2020 14:34:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Masami Hiramatsu <masami.hiramatsu@linaro.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Tim Deegan <tim@xen.org>, 
    Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
In-Reply-To: <CAPD2p-mH0Hi+JOUB-mt+aZR_gN86EZCpnMPTww0ErMESTwZ=AA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010291434220.12247@sstabellini-ThinkPad-T480s>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com> <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com> <alpine.DEB.2.21.2010291252410.12247@sstabellini-ThinkPad-T480s>
 <CAPD2p-mH0Hi+JOUB-mt+aZR_gN86EZCpnMPTww0ErMESTwZ=AA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-477224580-1604007273=:12247"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-477224580-1604007273=:12247
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Oct 2020, Oleksandr Tyshchenko wrote:
> Hi Stefano
> 
> [sorry for the possible format issue]
> 
> On Thu, Oct 29, 2020 at 9:53 PM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       On Thu, 29 Oct 2020, Oleksandr Tyshchenko wrote:
>       > On Thu, Oct 29, 2020 at 9:42 AM Masami Hiramatsu <masami.hiramatsu@linaro.org> wrote:
>       >       Hi Oleksandr,
>       >
>       > Hi Masami
>       >
>       > [sorry for the possible format issue]
>       >  
>       >
>       >       I would like to try this on my arm64 board.
>       >
>       > Glad to hear you are interested in this topic. 
>       >  
>       >
>       >       According to your comments in the patch, I made this config file.
>       >       # cat debian.conf
>       >       name = "debian"
>       >       type = "pvh"
>       >       vcpus = 8
>       >       memory = 512
>       >       kernel = "/opt/agl/vmlinuz-5.9.0-1-arm64"
>       >       ramdisk = "/opt/agl/initrd.img-5.9.0-1-arm64"
>       >       cmdline= "console=hvc0 earlyprintk=xen root=/dev/xvda1 rw"
>       >       disk = [ '/opt/agl/debian.qcow2,qcow2,hda' ]
>       >       vif = [ 'mac=00:16:3E:74:3d:76,bridge=xenbr0' ]
>       >       virtio = 1
>       >       vdisk = [ 'backend=Dom0, disks=ro:/dev/sda1' ]
>       >
>       >       And tried to boot a DomU, but I got below error.
>       >
>       >       # xl create -c debian.conf
>       >       Parsing config from debian.conf
>       >       libxl: error: libxl_create.c:1863:domcreate_attach_devices: Domain
>       >       1:unable to add virtio_disk devices
>       >       libxl: error: libxl_domain.c:1218:destroy_domid_pci_done: Domain
>       >       1:xc_domain_pause failed
>       >       libxl: error: libxl_dom.c:39:libxl__domain_type: unable to get domain
>       >       type for domid=1
>       >       libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
>       >       1:Unable to destroy guest
>       >       libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
>       >       1:Destruction of domain failed
>       >
>       >
>       >       Could you tell me how can I test it?
>       >
>       >
>       > I assume it is due to the lack of the virtio-disk backend (which I haven't shared yet as I focused on the IOREQ/DM support on
>       Arm in the
>       > first place).
>       > Could you wait a little bit, I am going to share it soon. 
> 
>       Do you have a quick-and-dirty hack you can share in the meantime? Even
>       just on github as a special branch? It would be very useful to be able
>       to have a test-driver for the new feature.
> 
> Well, I will provide a branch on github with our PoC virtio-disk backend by the end of this week. It will be possible to test this series
> with it. 

Very good, thank you!
--8323329-477224580-1604007273=:12247--


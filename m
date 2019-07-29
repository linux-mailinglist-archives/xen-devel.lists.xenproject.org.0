Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E2790BC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:24:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs8PU-0000KL-P2; Mon, 29 Jul 2019 16:22:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hs8PS-0000KA-WE
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 16:22:03 +0000
X-Inumbo-ID: fe8d6d8a-b21c-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fe8d6d8a-b21c-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 16:22:01 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48BFD2073F;
 Mon, 29 Jul 2019 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564417320;
 bh=9TTa2aDG4BjPlNf2TJ8zaNMjJLC9uOLMkxQnn/fR8+M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=q1p9wZWoC5gxrE8UJh3jq7IXwJSN+UBoxLk38Y6b47lAu2PWK1q1z6fexzZmoVAwq
 /8mpK6XhVfR+wW1A2sRgPL0WY82Y3CmKRKNZN2gYyf1qbtG2+EhO3Ey42snXV3Om71
 22jSOa/cJlkIoHAvFcWOf0whmBDH5zOE38WCl70w=
Date: Mon, 29 Jul 2019 09:21:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <bd61688d-99cf-a502-6a94-3233e64498ad@arm.com>
Message-ID: <alpine.DEB.2.21.1907290921110.1237@sstabellini-ThinkPad-T480s>
References: <20190710051823.29155-1-viktor.mitin.19@gmail.com>
 <bd61688d-99cf-a502-6a94-3233e64498ad@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1113686645-1564417320=:1237"
Subject: Re: [Xen-devel] [PATCH v3] xen/doc: Improve Dom0-less documentation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1113686645-1564417320=:1237
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 27 Jul 2019, Julien Grall wrote:
> Hi Viktor,
> 
> On 7/10/19 6:18 AM, Viktor Mitin wrote:
> > - Changed unprintable characters with %s/\%xA0/ /g
> >    So all the spaces are 0x20 now.
> > 
> > - Added address-cells and size-cells to configuration example.
> >    This resolves the dom0less boot issue in case of arm64.
> > 
> > - Added some notes about xl tools usage in case of dom0less.
> > 
> > - Added extra 0x0 to memory property in configuration example.
> >    This matches the binding docs/misc/arm/device-tree/booting.txt
> >    which requires a 64-bit value.
> > 
> > Signed-off-by: Viktor Mitin <viktor_mitin@epam.com>
> > ---
> > 
> > v3:
> > - Added extra 0x0 to memory property in configuration example.
> >    This matches the binding docs/misc/arm/device-tree/booting.txt
> >    which requires a 64-bit value.
> > ---
> >   docs/features/dom0less.pandoc | 58 +++++++++++++++++++++++------------
> >   1 file changed, 39 insertions(+), 19 deletions(-)
> > 
> > diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
> > index e076e3739e..d4f44b5502 100644
> > --- a/docs/features/dom0less.pandoc
> > +++ b/docs/features/dom0less.pandoc
> > @@ -40,8 +40,8 @@ to boot. For example if this is the bootcmd for Xen and
> > Dom0:
> > 
> >       bootm 0x1400000 0x9000000 0x1280000
> > 
> > -If we want to add one DomU with Image-DomU as the DomU kernel
> > -and ramdisk-DomU as DomU ramdisk:
> > +If we want to add one DomU with Image-DomU as the DomU kernel
> > +and ramdisk-DomU as DomU ramdisk:
> > 
> >       tftpb 0x1280000 xen.dtb
> >       tftpb 0x80000 xen-Image
> > @@ -61,25 +61,27 @@ the presence of the additional VM and its configuration.
> > It is done via
> >   device tree adding a node under /chosen as follows:
> > 
> >       domU1 {
> > -        compatible = "xen,domain";
> > -        memory = <0x20000>;
> > -        cpus = 1;
> > -        vpl011;
> > -
> > -        module@2000000 {
> > -            compatible = "multiboot,kernel", "multiboot,module";
> > -            reg = <0x2000000 0xffffff>;
> > -            bootargs = "console=ttyAMA0";
> > -        };
> > -
> > -        module@30000000 {
> > -            compatible = "multiboot,ramdisk", "multiboot,module";
> > -            reg = <0x3000000 0xffffff>;
> > -        };
> > +        #address-cells = <0x00000001>;
> > +        #size-cells = <0x00000001>;
> 
> DTC is can deal with decimal number. So I would prefer if we directly use 1 in
> the 2 properties above.

Agreed


> > +        compatible = "xen,domain";
> > +        memory = <0x0 0x20000>;
> > +        cpus = 1;
> 
> I think this should be cpus = <1>;

Yep


> > +        vpl011;
> > +
> > +        module@2000000 {
> > +            compatible = "multiboot,kernel", "multiboot,module";
> > +            reg = <0x2000000 0xffffff>;
> > +            bootargs = "console=ttyAMA0";
> > +        };
> > +
> > +        module@30000000 {
> > +            compatible = "multiboot,ramdisk", "multiboot,module";
> > +            reg = <0x3000000 0xffffff>;
> > +        };
> >       };
> > 
> > -Where memory is the memory of the VM in KBs, cpus is the number of
> > -cpus. module@2000000 and module@3000000 advertise where the kernel and
> > +Where memory is the memory of the VM in KBs, cpus is the number of
> > +cpus. module@2000000 and module@3000000 advertise where the kernel and
> >   ramdisk are in memory.
> 
> As a side note, the size specified should exactly match the size of the
> Kernel/initramfs. Otherwise, they may be unusable in Xen (for instance if they
> are compressed).
> 
> > 
> >   See docs/misc/arm/device-tree/booting.txt for more information.
> > @@ -111,3 +113,21 @@ limitations:
> >     the Xen command line. The NULL scheduler automatically assigns and
> >     pins vCPUs to pCPUs, but the vCPU-pCPU assignments cannot be
> >     configured.
> > +
> > +Notes
> > +-----
> > +
> > +- 'xl console' command will not attach to the domain's console in case
> > +  of dom0less. DomU are domains created by Xen (similar to Dom0) and
> > +  therefore they are all managed by Xen and some of the commands may not
> > work.
> > +
> > +  A user is allowed to configure the key sequence to switch input.
> > +  Pressing the Xen "conswitch" (Ctrl-A by default) three times
> > +  switches input in case of dom0less mode.
> > +
> > +- Domains created by Xen will have no name at boot. Domain-0 has a name
> > +  thanks to the helper xen-init-dom0 called at boot by the initscript.
> > +  If you want to setup DomU name, then you will have to create the xenstore
> > +  node associated. By default DomU names are shown as '(null)' in the
> > +  xl domains list.
> > +
> 
> Except the few minors things above. The improvement looks good to me, although
> I would like another pair of eye. Stefano, can you look at it?

It looks good aside for the two small points you have already raised.
--8323329-1113686645-1564417320=:1237
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1113686645-1564417320=:1237--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0261775064
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 03:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580642.909000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTY4l-0004gO-Vr; Wed, 09 Aug 2023 01:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580642.909000; Wed, 09 Aug 2023 01:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTY4l-0004em-P9; Wed, 09 Aug 2023 01:33:27 +0000
Received: by outflank-mailman (input) for mailman id 580642;
 Wed, 09 Aug 2023 01:33:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTY4j-0004eg-Ks
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 01:33:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba57a726-3654-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 03:33:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E39562EA4;
 Wed,  9 Aug 2023 01:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5C0C433C8;
 Wed,  9 Aug 2023 01:33:20 +0000 (UTC)
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
X-Inumbo-ID: ba57a726-3654-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691544801;
	bh=qGY73qrlSIzq7u5mbmYNyXsFJt6vFXG6r9EIUsbT6WU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mbTodNKQPxalCMvoh65i6wUivV5kYPF+ryG88bp3EztOCCqJt5FNpHdHPHqn3VC1p
	 4iMCOqbN9afHFLW8sbYlhwdD5S8iaMSbdc8AYjKCWGPME7PHiIuy4V07pjvI4d+uk2
	 eZ/YtUjdOBqXMQn0D1SZcdxg7SaeX38QHHMcbENbduU6M0IPXBWg3ipkDN+m7lnuZD
	 CACpYCtwAH/WpzLsMe5LNWH6vwtq83EbO0QC9AQY9gDwbCq4elPQ68298/5R/w+22s
	 S6kH5vUfYWnHQaOduUgkEzjxPXjZIP4WrjCAZPQOYOWprRon3uUyM4TleYRcw6wrA7
	 Cu2ItL3KqecLw==
Date: Tue, 8 Aug 2023 18:33:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 1/2] docs: update hyperlaunch device tree
In-Reply-To: <14e22832-6e40-43a4-8dea-1f9b2141b2b4@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308081819550.2127516@ubuntu-linux-20-04-desktop>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com> <20230803104438.24720-2-dpsmith@apertussolutions.com> <14e22832-6e40-43a4-8dea-1f9b2141b2b4@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-986984340-1691544801=:2127516"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-986984340-1691544801=:2127516
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 8 Aug 2023, Julien Grall wrote:
> > +
> > +                    role = <9>;
> 
> Reading this, I wonder if using number is actually a good idea. While this is
> machine friendly, this is not human friendly.

+1


> The most human friendly interface would be to use string, but I understand
> this is more complex to parse. So maybe we could use some pre-processing (like
> Linux does) to ease the creation of the hyperlaunch DT.
> 
> Bertrand, Stefano, what do you think?

I think that some preprocessing (e.g. ImageBuilder) is very likely required.
At the same time I think that "role" could make sense as a string and parsed
as a string without issues. I am happy either way.


> > +                    mode = <12>;
> > +
> > +                    domain-uuid = [B3 FB 98 FB 8F 9F 67 A3 8A 6E 62 5A 09
> > 13 F0 8C];
> > +
> > +                    cpus = <1>;
> > +                    memory = "1024M";
> > +
> > +                    kernel {
> > +                        compatible = "module,kernel", "module,index";
> > +                        module-index = <1>;
> > +                    };
> > +
> > +                    initrd {
> > +                        compatible = "module,ramdisk", "module,index";
> > +                        module-index = <2>;
> > +                    };
> > +                };
> > +
> > +                dom1 {
> > +                    compatible = "xen,domain";
> > +                    domid = <1>;
> > +                    role = <0>;
> > +                    capability = <1>;
> > +                    mode = <12>;
> > +                    domain-uuid = [C2 5D 91 CB 60 4B 45 75 89 04 FF 09 64
> > 54 1A 74];
> > +                    cpus = <1>;
> > +                    memory = "1024M";
> > +
> > +                    kernel {
> > +                        compatible = "module,kernel", "module,index";
> > +                        module-index = <3>;
> > +                        bootargs = "console=hvc0 earlyprintk=xen
> > root=/dev/ram0 rw";
> > +                    };
> > +
> > +                    initrd {
> > +                        compatible = "module,ramdisk", "module,index";
> > +                        module-index = <4>;
> > +                    };
> > +                };


I think dom1 should be written as follows:

    dom1 {
        compatible = "xen,domain";

        domid = <1>;
        role = <0>;
        capability = <1>;
        mode = <12>;
        domain-uuid = [C2 5D 91 CB 60 4B 45 75 89 04 FF 09 64

        cpus = <1>;
        memory = <0 1048576>;

        kernel {
            compatible = "multiboot,kernel" "multiboot,module";
            module-index = <3>;
            bootargs = "console=hvc0 earlyprintk=xen0 rw";
        };

        initrd {
            compatible = "multiboot,ramdisk" "multiboot,module"
            module-index = <4>;
        };
    };



> > +            };
> > +        };
> > +    };
> > +
> > +
> > +
> > +The multiboot modules supplied when using the above config would be, in
> > order:
> > +
> > +* (the above config, compiled)
> > +* kernel for PVH unbounded domain
> > +* ramdisk for PVH unbounded domain
> > +* kernel for PVH guest domain
> > +* ramdisk for PVH guest domain
> > +
> > +Module Arm Configuration:
> > +"""""""""""""""""""""""""
> > +
> > +::
> > +
> > +    /dts-v1/;
> > +
> > +    / {
> > +        chosen {
> > +            hypervisor {
> > +                compatible = “hypervisor,xen”
> > +
> > +                // Configuration container
> > +                config {
> > +                    compatible = "xen,config";
> > +
> > +                    module {
> > +                        compatible = "module,xsm-policy";
> > +                        module-addr = <0x0000ff00 0x80>;
> > +
> > +                    };
> > +                };
> > +
> > +                // Unbounded Domain definition
> > +                dom0 {
> > +                    compatible = "xen,domain";
> > +
> > +                    domid = <0>;
> > +
> > +                    role = <9>;
> > +
> > +                    mode = <12>; /* 64 BIT, PVH */
> 
> Arm guest have similar feature compare to PVH guest but they are strictly not
> the same. So we have been trying to avoid using the term on Arm.
> 
> I would prefer if we continue to avoid using the word 'PVH' to describe Arm.
> Lets just call them 'Arm guest'.
> 
> > +
> > +                    memory = <0x0 0x20000>;
> 
> Here you use the integer version, but AFAICT this wasn't described in the
> binding above.
> 
> > +                    security-id = “dom0_t”;
> > +
> > +                    module {
> > +                        compatible = "module,kernel";
> > +                        module-addr = <0x0000ff00 0x80>;
> 
> Reading the binding, this is suggest that the first cell is the start address
> and the second is the size. Cells are 32-bits. So what if you have a 64-bit
> address?
> 
> For 'reg' property, the DT addressed this by using #address-cells and
> #size-cells to indicate the number of cells for each.

I would not deviate from the dom0less spec on this one, which uses reg
for modules addresses and sizes.


> > +                        bootargs = "console=hvc0";
> > +                    };
> > +                    module {
> > +                        compatible = "module,ramdisk";
> > +                        module-addr = <0x0000ff00 0x80>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +The modules that would be supplied when using the above config would be:
> > +
> > +* (the above config, compiled into hardware tree)
> > +* XSM policy
> > +* kernel for unbounded domain
> > +* ramdisk for unbounded domain
> > +* kernel for guest domain
> > +* ramdisk for guest domain
> > +
> > +The hypervisor device tree would be compiled into the hardware device tree
> > and
> > +provided to Xen using the standard method currently in use. 
> 
> It is not clear what you mean by 'compiled in'. Do you mean the /hypervisor
> node will be present in the device-tree provided to Xen?

That is the way I read it as well. I think this statement is unnecessary
as we assume there is only 1 device tree passed to Xen, so this
specification would cover the relevant part of it.


> > The remaining
> > +modules would need to be loaded in the respective addresses specified in
> > the
> > +`module-addr` property.
> 
> Cheers,
> 
> -- 
> Julien Grall
> 
--8323329-986984340-1691544801=:2127516--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62A23BF9A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 21:12:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k32LI-0005sK-Jk; Tue, 04 Aug 2020 19:11:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k32LH-0005sC-6E
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 19:11:19 +0000
X-Inumbo-ID: 1843586d-e402-4ff1-bc2e-7d0741c13e0e
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1843586d-e402-4ff1-bc2e-7d0741c13e0e;
 Tue, 04 Aug 2020 19:11:17 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75FD92086A;
 Tue,  4 Aug 2020 19:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596568277;
 bh=cNzLu5oubj3oa6ifg+ClSYDUc7pQiFWRY0rRg3WdhE8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=2KvCh74of8zz8mvuweyJbD7BTr7V77rvbnwIHN3W/7DD5vxovc7NiVaitcxL/tVmL
 29PDnMvw2bwtLvPqcvD0c/3iW3MuUBFFWWqNjVFpdED+SaW7OCAGrdjcB/f8+Zs2to
 1yPoh8q9gEkt89VloEgQvWIwB96r2b/El+qTwQ+8=
Date: Tue, 4 Aug 2020 12:11:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature
 common
In-Reply-To: <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
Message-ID: <alpine.DEB.2.21.2008041105510.5748@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1983374449-1596565169=:5748"
Content-ID: <alpine.DEB.2.21.2008041119500.5748@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 Oleksandr <olekstysh@gmail.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1983374449-1596565169=:5748
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2008041119501.5748@sstabellini-ThinkPad-T480s>

On Tue, 4 Aug 2020, Julien Grall wrote:
> On 04/08/2020 12:10, Oleksandr wrote:
> > On 04.08.20 10:45, Paul Durrant wrote:
> > > > +static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
> > > > +{
> > > > +    return ioreq->state == STATE_IOREQ_READY &&
> > > > +           !ioreq->data_is_ptr &&
> > > > +           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir !=
> > > > IOREQ_WRITE);
> > > > +}
> > > I don't think having this in common code is correct. The short-cut of not
> > > completing PIO reads seems somewhat x86 specific. 
> 
> Hmmm, looking at the code, I think it doesn't wait for PIO writes to complete
> (not read). Did I miss anything?
> 
> > Does ARM even 
> > > have the concept of PIO?
> > 
> > I am not 100% sure here, but it seems that doesn't have.
> 
> Technically, the PIOs exist on Arm, however they are accessed the same way as
> MMIO and will have a dedicated area defined by the HW.
> 
> AFAICT, on Arm64, they are only used for PCI IO Bar.
> 
> Now the question is whether we want to expose them to the Device Emulator as
> PIO or MMIO access. From a generic PoV, a DM shouldn't have to care about the
> architecture used. It should just be able to request a given IOport region.
> 
> So it may make sense to differentiate them in the common ioreq code as well.
> 
> I had a quick look at QEMU and wasn't able to tell if PIOs and MMIOs address
> space are different on Arm as well. Paul, Stefano, do you know what they are
> doing?

On the QEMU side, it looks like PIO (address_space_io) is used in
connection with the emulation of the "in" or "out" instructions, see
ioport.c:cpu_inb for instance. Some parts of PCI on QEMU emulate PIO
space regardless of the architecture, such as
hw/pci/pci_bridge.c:pci_bridge_initfn.

However, because there is no "in" and "out" on ARM, I don't think
address_space_io can be accessed. Specifically, there is no equivalent
for target/i386/misc_helper.c:helper_inb on ARM.

So I think PIO is unused on ARM in QEMU.


FYI the ioreq type for PCI conf space reads and writes is
IOREQ_TYPE_PCI_CONFIG (neither MMIO nor PIO) which is implemented as
pci_host_config_read_common/pci_host_config_write_common directly
(neither PIO nor MMIO).


It looks like PIO-specific things could be kept x86-specific, without
loss of functionalities on the ARM side.


> The point of the check isn't to determine whether to wait, but
> what to do after having waited. Reads need a retry round through
> the emulator (to store the result in the designated place),
> while writes don't have such a requirement (and hence guest
> execution can continue immediately in the general case).

The x86 code looks like this:

            rc = hvm_send_ioreq(s, &p, 0);
            if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
                vio->io_req.state = STATE_IOREQ_NONE;
            else if ( !hvm_ioreq_needs_completion(&vio->io_req) )
                rc = X86EMUL_OKAY;

Basically hvm_send_ioreq is expected to return RETRY.
Then, if it is a PIO write operation only, it is turned into OKAY right
away. Otherwise, rc stays as RETRY.

So, normally, hvmemul_do_io is expected to return RETRY, because the
emulator is not done yet. Am I understanding the code correctly?

If so, who is handling RETRY on x86? It tried to follow the call chain
but ended up in the x86 emulator and got lost :-)


At some point later, after the emulator (QEMU) has completed the
request, handle_hvm_io_completion gets called which ends up calling
handle_mmio() finishing the job on the Xen side too.


In other words:
RETRY ==> emulation in progress
OKAY  ==> emulation completed


Is that correct?
--8323329-1983374449-1596565169=:5748--


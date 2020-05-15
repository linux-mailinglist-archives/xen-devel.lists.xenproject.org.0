Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A85841D4FAC
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 15:59:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZarY-0000TJ-7V; Fri, 15 May 2020 13:58:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j7Zx=65=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jZarW-0000T6-Sv
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 13:58:54 +0000
X-Inumbo-ID: 36980248-96b4-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36980248-96b4-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PWQWXrIuGs7RAXhKWVwKGHVI3lRjEpMtYlHNc3tRSjM=; b=sq5WMAsJn1nO680KN5L6/h5C0d
 hEzUTFsGq65nwZENqishP+cB0P7xiqWCtad+DAyt0HrSjtxDQVm/U8bXy4N7CoPf2BgU56WVPBr1L
 jGw4esiQUnsb17gQt01iI7NQv7/fzY/xUSuzdJdH2km0+BtdI6dg+CbEiBo25KhzCH0g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jZarT-0000U5-VT; Fri, 15 May 2020 13:58:51 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jZarT-0008HY-KL; Fri, 15 May 2020 13:58:51 +0000
Message-ID: <09b58be54cc40812631653f149e017933a3cfdf8.camel@xen.org>
Subject: Re: Error during update_runstate_area with KPTI activated
From: Hongyan Xia <hx242@xen.org>
To: Julien Grall <julien@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Fri, 15 May 2020 14:58:48 +0100
In-Reply-To: <108a179b-d8ea-01b9-6c6b-9f5cc57f6dc0@xen.org>
References: <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
 <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
 <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
 <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
 <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
 <478C4829-CCAF-495B-860E-6BA3D86AA47D@arm.com>
 <20200515083838.GN54375@Air-de-Roger>
 <d2033adc-3f98-2d14-ae6d-f8dcd8b90002@xen.org>
 <20200515091018.GO54375@Air-de-Roger>
 <3813cfa2-c881-3fa5-bdf8-a2e874584a9f@xen.org>
 <20200515095751.GQ54375@Air-de-Roger>
 <108a179b-d8ea-01b9-6c6b-9f5cc57f6dc0@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 2020-05-15 at 11:08 +0100, Julien Grall wrote:
> Hi,
> 
> On 15/05/2020 10:57, Roger Pau Monné wrote:
> > On Fri, May 15, 2020 at 10:23:16AM +0100, Julien Grall wrote:
> > > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open
> > > attachments unless you have verified the sender and know the
> > > content is safe.
> > > 
> > > 
> > > On 15/05/2020 10:10, Roger Pau Monné wrote:
> > > > On Fri, May 15, 2020 at 09:53:54AM +0100, Julien Grall wrote:
...

> > > > 
> > > > Could we map/unmap the runtime area on domain switch at a per-
> > > > cpu
> > > > based linear space area? There's no reason to have all the
> > > > runtime
> > > > areas mapped all the time, you just care about the one from the
> > > > running vcpu.
> > > 
> > > AFAICT, this is only used during context switching. This is a bit
> > > surprising
> > > because I would expect it to be updated when the vCPU is running.
> > > 
> > > So maybe we could just use map_domain_page() and take care
> > > manually about
> > > cross-page boundary.
> > > 
> > > > 
> > > > Maybe the overhead of that mapping and unmapping would be
> > > > too high? But seeing that we are aiming at a secret-free Xen we
> > > > would
> > > > have to eventually go that route anyway.
> > > 
> > > The overhead is likely to be higher with the existing code as you
> > > have to
> > > walk the guest page-tables and the p2m everytime in order to
> > > translate the
> > > guest virtual address to a host physical address.
> > 
> > Maybe I'm getting confused, but you actually want to avoid the
> > guest
> > page table walk, as the guest might be running with user-space page
> > tables that don't have the linear address of the runtime area
> > mapped,
> > and hence you would like to do the walk only once (at hypercall
> > registration time) and keep a reference to the page(s)?
> 
> That's right.
> 
> > 
> > I assumed the whole point of this was to avoid doing the page table
> > walk when you need to update the runstate info area.
> 
> Sorry I wasn't clear. I was trying to answer to your question about
> the 
> overhead.
> 
> The overhead with SH and the existing runstate implementation is
> going 
> to be quite high because you would need to map/unmap each table
> during 
> your walk. By removing the walk, you would now have only one
> map/unmap 
> for the update which I think is acceptable.
> 
> So the change discussed in this thread is also going to be
> beneficial 
> for SH even if we keep a map/unmap in the process.

For every hypercall, trap, context switch... one or two maps and unmaps
is definitely fine, showing almost no impact in real-world performance.
The most impact I found in the direct map removal work is definitely
GVA->GFN->MFN walk for traps and hypercalls. HVM + EPT walk can take up
to 20 maps and unmaps which degrades hypercall and emmulated MMIO
performance by up to 60%. It would be really nice if some paths can
just take GFN or just register the MFN. So I would definitely welcome a
change to use the physcial address.

Hongyan



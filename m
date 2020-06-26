Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EC520B420
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 17:04:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joptb-0003lT-WB; Fri, 26 Jun 2020 15:04:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Q51=AH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jopta-0003lM-ID
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 15:04:02 +0000
X-Inumbo-ID: 437fe934-b7be-11ea-82ce-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 437fe934-b7be-11ea-82ce-12813bfff9fa;
 Fri, 26 Jun 2020 15:04:01 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YBpiOp/SCiu/WzsnvhLxcMZZDFNThZnEF7sAmp00qyouC31xNg8sEnEQ4JoUAqlvm5NMBspECS
 Usxa9oa9m3ktfCPdkHpJ97hi9SjCV+6KWWn/fBqC7hI1bz94fSsgHdtgOVv2ga8GOYXjhhHt0V
 lxkAMic/AWkP4hbHI0cRFkHlTrsIc9jZs0YN46H4NLhTW5fKa7+Mq/EQbHQUEdOkK9npWLSsmm
 JsUk0Y2bk9lzMl/b/dfQzfC24kPHiybbfZ0uhJ6t4mUk18u4dLQYoL6GypUxhSURj5ijAijg5k
 Kqs=
X-SBRS: 2.7
X-MesageID: 21249824
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,284,1589256000"; d="scan'208";a="21249824"
Date: Fri, 26 Jun 2020 17:03:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
Message-ID: <20200626150353.GD735@Air-de-Roger>
References: <20200623155609.GS735@Air-de-Roger>
 <da8d4d26-0524-1d77-8516-e986dd0affaa@suse.com>
 <20200623172652.GU735@Air-de-Roger>
 <24d35c4d-e2b3-1f58-4c6e-71072de01b74@suse.com>
 <04410978-33bf-dedf-7401-248b1a038a9c@xen.org>
 <60ac0a67-1448-4b39-4489-42dc008b6355@suse.com>
 <20200625090552.GW735@Air-de-Roger>
 <20200625161002.GZ735@Air-de-Roger>
 <cb74d243-bf0b-67bd-b0ec-fb1e71c3a9d6@suse.com>
 <0666afab-2694-a8a5-d4fd-5e0d88805065@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0666afab-2694-a8a5-d4fd-5e0d88805065@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 04:19:36PM +0200, Jan Beulich wrote:
> On 26.06.2020 15:40, Jan Beulich wrote:
> > On 25.06.2020 18:10, Roger Pau Monné wrote:
> >> On Thu, Jun 25, 2020 at 11:05:52AM +0200, Roger Pau Monné wrote:
> >>> On Wed, Jun 24, 2020 at 04:01:44PM +0200, Jan Beulich wrote:
> >>>> On 24.06.2020 15:41, Julien Grall wrote:
> >>>>> On 24/06/2020 11:12, Jan Beulich wrote:
> >>>>>> On 23.06.2020 19:26, Roger Pau Monné wrote:
> >>>>>>> I'm confused. Couldn't we switch from uint64_aligned_t to plain
> >>>>>>> uint64_t (like it's currently on the Linux headers), and then use the
> >>>>>>> compat layer in Xen to handle the size difference when called from
> >>>>>>> 32bit environments?
> >>>>>>
> >>>>>> And which size would we use there? The old or the new one (breaking
> >>>>>> future or existing callers respectively)? Meanwhile I think that if
> >>>>>> this indeed needs to not be tools-only (which I still question),
> >>>>>
> >>>>> I think we now agreed on a subthread that the kernel needs to know the 
> >>>>> layout of the hypercall.
> >>>>>
> >>>>>> then our only possible route is to add explicit padding for the
> >>>>>> 32-bit case alongside the change you're already making.
> >>>>>
> >>>>> AFAICT Linux 32-bit doesn't have this padding. So wouldn't it make 
> >>>>> incompatible the two incompatible?
> >>>>
> >>>> In principle yes. But they're putting the structure instance on the
> >>>> stack, so there's not risk from Xen reading 4 bytes too many. I'd
> >>>> prefer keeping the interface as is (i.e. with the previously
> >>>> implicit padding made explicit) to avoid risking to break other
> >>>> possible callers. But that's just my view on it, anyway ...
> >>>
> >>> Adding the padding is cleaner because we don't need any compat stuff
> >>> in order to access the structure from the caller, and we also keep the
> >>> original layout currently present on Xen headers.
> >>>
> >>> I can prepare a fix for the Linux kernel, if this approach is fine.
> >>
> >> So I went over this, and I'm not sure the point of adding the padding
> >> field at the end of the structure for 32bit x86.
> >>
> >> The current situation is the following:
> >>
> >>  - Linux will use a struct on 32bit x86 that doesn't have the 4byte
> >>    padding at the end.
> >>  - Xen will copy 4bytes of garbage in that case, since the struct on
> >>    Linux is allocated on the stack.
> >>
> >> So I suggest we take the approach found on this patch, that is remove
> >> the 8byte alignment from the frame field, which will in turn remove
> >> 4bytes of padding from the tail of the structure on 32bit x86.
> >>
> >> That would leave the following scenario:
> >>
> >>  - The struct layout in Linux headers would be correct.
> >>  - Xen already handles the struct size difference on x86 32bit vs
> >>    64bit, as the compat layer is currently doing the copy in
> >>    compat_memory_op taking into account the size of the compat
> >>    structure.
> > 
> > Hmm, I didn't even notice this until now - it looks to do so
> > indeed, but apparently because of a bug: The original
> > uint64_aligned_t gets translated to mere uint64_t in the
> > compat header, whereas it should have been retained. This
> > means that my concern of ...
> > 
> >>  - Removing the padding will work for all use cases: Linux will
> >>    already be using the correct layout on x86 32bits, so no change
> >>    will be required there. Any consumers using the tail padded
> >>    structure will continue to work without issues, as Xen simply won't
> >>    copy the tailing 4bytes.
> > 
> > ... code using the new definition then potentially not working
> > correctly on  4.13, at least on versions not having this
> > backported, was not actually true.
> > 
> > I'll try to sort out this other bug then ...
> 
> I was wrong, there is no bug - translating uint64_aligned_t to
> uint64_t is fine, as these are seen only by 64-bit code, where
> both are identical anyway. Hence there still is the concern that
> code working fine on the supposed 4.14 might then not work on
> unfixed 4.13, due to 4.13 copying 4 extra bytes.

So here are the structures on 64bit x86 according to pahole against
xen-syms:

struct xen_mem_acquire_resource {
        domid_t                    domid;                /*     0     2 */
        uint16_t                   type;                 /*     2     2 */
        uint32_t                   id;                   /*     4     4 */
        uint32_t                   nr_frames;            /*     8     4 */
        uint32_t                   pad;                  /*    12     4 */
        uint64_t                   frame;                /*    16     8 */
        __guest_handle_xen_pfn_t   frame_list;           /*    24     8 */

        /* size: 32, cachelines: 1, members: 7 */
        /* last cacheline: 32 bytes */
};

struct compat_mem_acquire_resource {
        domid_compat_t             domid;                /*     0     2 */
        uint16_t                   type;                 /*     2     2 */
        uint32_t                   id;                   /*     4     4 */
        uint32_t                   nr_frames;            /*     8     4 */
        uint32_t                   pad;                  /*    12     4 */
        uint64_t                   frame;                /*    16     8 */
        __compat_handle_compat_pfn_t frame_list;         /*    24     4 */

        /* size: 28, cachelines: 1, members: 7 */
        /* last cacheline: 28 bytes */
};

There's no tailing padding on the compat struct ATM, and hence the
current code will behave correctly when used against a compat
structure without the tailing padding (as it's already ignored).

There's a #pragma pack(4) at the top of compat/memory.h which forces
this AFAICT. So I think the suggested approach is fine and will avoid
any breakage.

Roger.


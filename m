Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC581B1EE8E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 20:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074987.1437443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukSBU-0007sv-IJ; Fri, 08 Aug 2025 18:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074987.1437443; Fri, 08 Aug 2025 18:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukSBU-0007qI-FS; Fri, 08 Aug 2025 18:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1074987;
 Fri, 08 Aug 2025 18:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFBd=2U=samsung.com=m.szyprowski@srs-se1.protection.inumbo.net>)
 id 1ukSBS-0007qA-Az
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 18:51:19 +0000
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8b21195-7488-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 20:51:15 +0200 (CEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250808185114euoutp0162c911292defe8bfee54f2309b1e8171~Z31I7WGpl0720707207euoutp01Y;
 Fri,  8 Aug 2025 18:51:14 +0000 (GMT)
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250808185112eucas1p285bfbeb3352a16df0b5c8f262fadbf2f~Z31Hzuzfc1555715557eucas1p2H;
 Fri,  8 Aug 2025 18:51:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250808185109eusmtip1cf791168d581e5b5b824a27d8cdd9069~Z31ElK-rK1126511265eusmtip1F;
 Fri,  8 Aug 2025 18:51:09 +0000 (GMT)
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
X-Inumbo-ID: a8b21195-7488-11f0-b898-0df219b8e170
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250808185114euoutp0162c911292defe8bfee54f2309b1e8171~Z31I7WGpl0720707207euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754679074;
	bh=eZMpLLPpWLfEcYOqjTqa6+eB/bqRZJ+BbYqsgnnPbkY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WGyqUFMDFBBsAtsI8xiD1Ayr7WYuZYdyBJMCoPCRGfrVxwAdMcl3GCV7Qwkcc4nI/
	 gnDfUeRP8iiJIUgEStFM4TfVVnoq/LDogKUpBA2D+NmwrtJRryBOG1ru2ITf74oehS
	 IO287BU42jFk8ZARXzvIDO/cRSfPjtUJVNlWylGo=
Message-ID: <a154e058-c0e6-4208-9f52-57cec22eaf7d@samsung.com>
Date: Fri, 8 Aug 2025 20:51:08 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v1 00/16] dma-mapping: migrate to physical address-based
 API
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Alexander Potapenko
	<glider@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Danilo
	Krummrich <dakr@kernel.org>, iommu@lists.linux.dev, Jason Wang
	<jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
	<joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, Juergen Gross
	<jgross@suse.com>, kasan-dev@googlegroups.com, Keith Busch
	<kbusch@kernel.org>, linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Michael
	Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Miguel
	Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>, Stefano
	Stabellini <sstabellini@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250807141929.GN184255@nvidia.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250808185112eucas1p285bfbeb3352a16df0b5c8f262fadbf2f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250807141938eucas1p2319a0526b25db120b3c9aeb49f69cce1
X-EPHeader: CA
X-CMS-RootMailID: 20250807141938eucas1p2319a0526b25db120b3c9aeb49f69cce1
References: <cover.1754292567.git.leon@kernel.org>
	<CGME20250807141938eucas1p2319a0526b25db120b3c9aeb49f69cce1@eucas1p2.samsung.com>
	<20250807141929.GN184255@nvidia.com>

On 07.08.2025 16:19, Jason Gunthorpe wrote:
> On Mon, Aug 04, 2025 at 03:42:34PM +0300, Leon Romanovsky wrote:
>> Changelog:
>> v1:
>>   * Added new DMA_ATTR_MMIO attribute to indicate
>>     PCI_P2PDMA_MAP_THRU_HOST_BRIDGE path.
>>   * Rewrote dma_map_* functions to use thus new attribute
>> v0: https://lore.kernel.org/all/cover.1750854543.git.leon@kernel.org/
>> ------------------------------------------------------------------------
>>
>> This series refactors the DMA mapping to use physical addresses
>> as the primary interface instead of page+offset parameters. This
>> change aligns the DMA API with the underlying hardware reality where
>> DMA operations work with physical addresses, not page structures.
> Lets elaborate this as Robin asked:
>
> This series refactors the DMA mapping API to provide a phys_addr_t
> based, and struct-page free, external API that can handle all the
> mapping cases we want in modern systems:
>
>   - struct page based cachable DRAM
>   - struct page MEMORY_DEVICE_PCI_P2PDMA PCI peer to peer non-cachable MMIO
>   - struct page-less PCI peer to peer non-cachable MMIO
>   - struct page-less "resource" MMIO
>
> Overall this gets much closer to Matthew's long term wish for
> struct-pageless IO to cachable DRAM. The remaining primary work would
> be in the mm side to allow kmap_local_pfn()/phys_to_virt() to work on
> phys_addr_t without a struct page.
>
> The general design is to remove struct page usage entirely from the
> DMA API inner layers. For flows that need to have a KVA for the
> physical address they can use kmap_local_pfn() or phys_to_virt(). This
> isolates the struct page requirements to MM code only. Long term all
> removals of struct page usage are supporting Matthew's memdesc
> project which seeks to substantially transform how struct page works.
>
> Instead make the DMA API internals work on phys_addr_t. Internally
> there are still dedicated 'page' and 'resource' flows, except they are
> now distinguished by a new DMA_ATTR_MMIO instead of by callchain. Both
> flows use the same phys_addr_t.
>
> When DMA_ATTR_MMIO is specified things work similar to the existing
> 'resource' flow. kmap_local_pfn(), phys_to_virt(), phys_to_page(),
> pfn_valid(), etc are never called on the phys_addr_t. This requires
> rejecting any configuration that would need swiotlb. CPU cache
> flushing is not required, and avoided, as ATTR_MMIO also indicates the
> address have no cachable mappings. This effectively removes any
> DMA API side requirement to have struct page when DMA_ATTR_MMIO is
> used.
>
> In the !DMA_ATTR_MMIO mode things work similarly to the 'page' flow,
> except on the common path of no cache flush, no swiotlb it never
> touches a struct page. When cache flushing or swiotlb copying
> kmap_local_pfn()/phys_to_virt() are used to get a KVA for CPU
> usage. This was already the case on the unmap side, now the map side
> is symmetric.
>
> Callers are adjusted to set DMA_ATTR_MMIO. Existing 'resource' users
> must set it. The existing struct page based MEMORY_DEVICE_PCI_P2PDMA
> path must also set it. This corrects some existing bugs where iommu
> mappings for P2P MMIO were improperly marked IOMMU_CACHE.
>
> Since ATTR_MMIO is made to work with all the existing DMA map entry
> points, particularly dma_iova_link(), this finally allows a way to use
> the new DMA API to map PCI P2P MMIO without creating struct page. The
> VFIO DMABUF series demonstrates how this works. This is intended to
> replace the incorrect driver use of dma_map_resource() on PCI BAR
> addresses.
>
> This series does the core code and modern flows. A followup series
> will give the same treatement to the legacy dma_ops implementation.

Thanks for the elaborate description, that's something that was missing 
in the previous attempt. I read again all the previous discussion and 
this explanation and there are still two things that imho needs more 
clarification.


First - basing the API on the phys_addr_t.

Page based API had the advantage that it was really hard to abuse it and 
call for something that is not 'a normal RAM'. I initially though that 
phys_addr_t based API will somehow simplify arch specific 
implementation, as some of them indeed rely on phys_addr_t internally, 
but I missed other things pointed by Robin. Do we have here any 
alternative?


Second - making dma_map_phys() a single API to handle all cases.

Do we really need such single function to handle all cases? To handle 
P2P case, the caller already must pass DMA_ATTR_MMIO, so it must somehow 
keep such information internally. Cannot it just call existing 
dma_map_resource(), so there will be clear distinction between these 2 
cases (DMA to RAM and P2P DMA)? Do we need additional check for 
DMA_ATTR_MMIO for every typical DMA user? I know that branching is 
cheap, but this will probably increase code size for most of the typical 
users for no reason.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland



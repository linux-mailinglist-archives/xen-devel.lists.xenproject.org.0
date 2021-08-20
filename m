Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B243F25A9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 06:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169213.309108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGw2Z-0004xJ-OV; Fri, 20 Aug 2021 04:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169213.309108; Fri, 20 Aug 2021 04:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGw2Z-0004vD-LM; Fri, 20 Aug 2021 04:21:59 +0000
Received: by outflank-mailman (input) for mailman id 169213;
 Fri, 20 Aug 2021 04:21:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Niul=NL=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mGw2X-0004v7-Tv
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 04:21:57 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89e3ad7e-971b-4df9-a6a1-3fed2b9fcc01;
 Fri, 20 Aug 2021 04:21:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E02696736F; Fri, 20 Aug 2021 06:21:51 +0200 (CEST)
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
X-Inumbo-ID: 89e3ad7e-971b-4df9-a6a1-3fed2b9fcc01
Date: Fri, 20 Aug 2021 06:21:51 +0200
From: "hch@lst.de" <hch@lst.de>
To: Michael Kelley <mikelley@microsoft.com>
Cc: Tianyu Lan <ltykernel@gmail.com>, KY Srinivasan <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"luto@kernel.org" <luto@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"will@kernel.org" <will@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "hch@lst.de" <hch@lst.de>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"brijesh.singh@amd.com" <brijesh.singh@amd.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	Tianyu Lan <Tianyu.Lan@microsoft.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"martin.b.radev@gmail.com" <martin.b.radev@gmail.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
	"saravanand@fb.com" <saravanand@fb.com>,
	"krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"rientjes@google.com" <rientjes@google.com>,
	"hannes@cmpxchg.org" <hannes@cmpxchg.org>,
	"tj@kernel.org" <tj@kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	vkuznets <vkuznets@redhat.com>,
	"parri.andrea@gmail.com" <parri.andrea@gmail.com>,
	"dave.hansen@intel.com" <dave.hansen@intel.com>
Subject: Re: [PATCH V3 12/13] HV/Netvsc: Add Isolation VM support for
 netvsc driver
Message-ID: <20210820042151.GB26450@lst.de>
References: <20210809175620.720923-1-ltykernel@gmail.com> <20210809175620.720923-13-ltykernel@gmail.com> <MWHPR21MB15936FE72E65A62FBA3EF4F2D7C09@MWHPR21MB1593.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR21MB15936FE72E65A62FBA3EF4F2D7C09@MWHPR21MB1593.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Aug 19, 2021 at 06:14:51PM +0000, Michael Kelley wrote:
> > +	if (!pfns)
> > +		return NULL;
> > +
> > +	for (i = 0; i < size / HV_HYP_PAGE_SIZE; i++)
> > +		pfns[i] = virt_to_hvpfn(buf + i * HV_HYP_PAGE_SIZE)
> > +			+ (ms_hyperv.shared_gpa_boundary >> HV_HYP_PAGE_SHIFT);
> > +
> > +	vaddr = vmap_pfn(pfns, size / HV_HYP_PAGE_SIZE, PAGE_KERNEL_IO);
> > +	kfree(pfns);
> > +
> > +	return vaddr;
> > +}
> 
> This function appears to be a duplicate of hv_map_memory() in Patch 11 of this
> series.  Is it possible to structure things so there is only one implementation?  In

So right now it it identical, but there is an important difference:
the swiotlb memory is physically contiguous to start with, so we can
do the simple remap using vmap_range as suggested in the last mail.
The cases here are pretty weird in that netvsc_remap_buf is called right
after vzalloc.  That is we create _two_ mappings in vmalloc space right
after another, where the original one is just used for establishing the
"GPADL handle" and freeing the memory.  In other words, the obvious thing
to do here would be to use a vmalloc variant that allows to take the
shared_gpa_boundary into account when setting up the PTEs.

And here is somthing I need help from the x86 experts:  does the CPU
actually care about this shared_gpa_boundary?  Or does it just matter
for the generated DMA address?  Does somehow have a good pointer to
how this mechanism works?


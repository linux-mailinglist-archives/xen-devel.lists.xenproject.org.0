Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0192228D5C8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 22:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6391.17024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSRFU-0004MO-SD; Tue, 13 Oct 2020 20:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6391.17024; Tue, 13 Oct 2020 20:50:20 +0000
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
	id 1kSRFU-0004Lz-Ot; Tue, 13 Oct 2020 20:50:20 +0000
Received: by outflank-mailman (input) for mailman id 6391;
 Tue, 13 Oct 2020 20:50:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLCS=DU=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kSRFT-0004Lu-7m
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 20:50:19 +0000
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f034b316-1aa7-4f33-a6e4-3aebf0378205;
 Tue, 13 Oct 2020 20:50:15 +0000 (UTC)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 13:50:14 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 13:50:12 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BLCS=DU=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kSRFT-0004Lu-7m
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 20:50:19 +0000
X-Inumbo-ID: f034b316-1aa7-4f33-a6e4-3aebf0378205
Received: from mga02.intel.com (unknown [134.134.136.20])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f034b316-1aa7-4f33-a6e4-3aebf0378205;
	Tue, 13 Oct 2020 20:50:15 +0000 (UTC)
IronPort-SDR: E5xN0YDqp3avkBC6XcbpnSZJzPcNIEJDmKlkDWaeW9IlTyZqEOO28kYaLFLo/iPskFKdK8Ukub
 p1e2TW5foJ4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="152920015"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="152920015"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 13:50:14 -0700
IronPort-SDR: tBU8Od+WgzKnoE84+DWDWPkln+je7r0O2Nptsn2TVKPsgnriflj5gQkH1GYPWlpzBZ1iqAqtCk
 /srhQcj0pjbQ==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="scan'208";a="318439699"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 13:50:12 -0700
Date: Tue, 13 Oct 2020 13:50:12 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicolas Pitre <nico@fluxnic.net>, X86 ML <x86@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	KVM list <kvm@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
	bpf@vger.kernel.org, Kexec Mailing List <kexec@lists.infradead.org>,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	devel@driverdev.osuosl.org, linux-efi <linux-efi@vger.kernel.org>,
	linux-mmc@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
	target-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-ext4 <linux-ext4@vger.kernel.org>,
	linux-aio@kvack.org, io-uring@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-um@lists.infradead.org,
	linux-ntfs-dev@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	cluster-devel@redhat.com, ecryptfs@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	linux-afs@lists.infradead.org,
	linux-rdma <linux-rdma@vger.kernel.org>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
	intel-gfx@lists.freedesktop.org, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-cachefs@redhat.com, samba-technical@lists.samba.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new kmap_thread()
Message-ID: <20201013205012.GI2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-34-ira.weiny@intel.com>
 <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
 <20201013193643.GK20115@casper.infradead.org>
 <20201013200149.GI3576660@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013200149.GI3576660@ZenIV.linux.org.uk>
User-Agent: Mutt/1.11.1 (2018-12-01)

On Tue, Oct 13, 2020 at 09:01:49PM +0100, Al Viro wrote:
> On Tue, Oct 13, 2020 at 08:36:43PM +0100, Matthew Wilcox wrote:
> 
> > static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
> > {
> > 	char *vto = kmap_atomic(to);
> > 
> > 	memcpy(vto, vfrom, size);
> > 	kunmap_atomic(vto);
> > }
> > 
> > in linux/highmem.h ?
> 
> You mean, like
> static void memcpy_from_page(char *to, struct page *page, size_t offset, size_t len)
> {
>         char *from = kmap_atomic(page);
>         memcpy(to, from + offset, len);
>         kunmap_atomic(from);
> }
> 
> static void memcpy_to_page(struct page *page, size_t offset, const char *from, size_t len)
> {
>         char *to = kmap_atomic(page);
>         memcpy(to + offset, from, len);
>         kunmap_atomic(to);
> }
> 
> static void memzero_page(struct page *page, size_t offset, size_t len)
> {
>         char *addr = kmap_atomic(page);
>         memset(addr + offset, 0, len);
>         kunmap_atomic(addr);
> }
> 
> in lib/iov_iter.c?  FWIW, I don't like that "highpage" in the name and
> highmem.h as location - these make perfect sense regardless of highmem;
> they are normal memory operations with page + offset used instead of
> a pointer...

I was thinking along those lines as well especially because of the direction
this patch set takes kmap().

Thanks for pointing these out to me.  How about I lift them to a common header?
But if not highmem.h where?

Ira


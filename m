Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C2A289DA1
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 04:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5263.13771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kR4qy-0001Od-K4; Sat, 10 Oct 2020 02:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5263.13771; Sat, 10 Oct 2020 02:43:24 +0000
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
	id 1kR4qy-0001OE-Gl; Sat, 10 Oct 2020 02:43:24 +0000
Received: by outflank-mailman (input) for mailman id 5263;
 Sat, 10 Oct 2020 02:43:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dXbD=DR=hansenpartnership.com=james.bottomley@srs-us1.protection.inumbo.net>)
 id 1kR4qv-0001O9-LU
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 02:43:23 +0000
Received: from bedivere.hansenpartnership.com (unknown [66.63.167.143])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3434b3d-9823-4393-8356-dd35c0c1993b;
 Sat, 10 Oct 2020 02:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2492A8EE25D;
 Fri,  9 Oct 2020 19:43:17 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 3vw63n_vJBCB; Fri,  9 Oct 2020 19:43:16 -0700 (PDT)
Received: from jarvis (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 0DE4F8EE120;
 Fri,  9 Oct 2020 19:43:14 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dXbD=DR=hansenpartnership.com=james.bottomley@srs-us1.protection.inumbo.net>)
	id 1kR4qv-0001O9-LU
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 02:43:23 +0000
X-Inumbo-ID: f3434b3d-9823-4393-8356-dd35c0c1993b
Received: from bedivere.hansenpartnership.com (unknown [66.63.167.143])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f3434b3d-9823-4393-8356-dd35c0c1993b;
	Sat, 10 Oct 2020 02:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2492A8EE25D;
	Fri,  9 Oct 2020 19:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1602297797;
	bh=H8TP93foEqN1ktQ8Zvn50X/i2mF1Mo+G3bAPl3laMS8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IKFTIVFzGPRTOXbvF4guFV0idy0d2c5GY0pNpauMNCD265o/8xML504AQiHNNKINI
	 03VTbsdpTlx1IvRxmapAuFqbOyRLRkynjYBLceWgnAFSazyacAGjs/kfFiiin3dxCG
	 9/K3u5C/d7R0kHrIFRdMX77E7sQ6OOI7DSaYWfn4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3vw63n_vJBCB; Fri,  9 Oct 2020 19:43:16 -0700 (PDT)
Received: from jarvis (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 0DE4F8EE120;
	Fri,  9 Oct 2020 19:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1602297796;
	bh=H8TP93foEqN1ktQ8Zvn50X/i2mF1Mo+G3bAPl3laMS8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BgjiThamK3sRChTIWem3VqlcTVcZOY3Z2GNJyIwpezgtDJLGW3IszUxOTE+yoCAWv
	 V48K29iXWIdEyZfVjEsU0FSlh3cTrvJt0EqAPo1Ll9Jsfhk5OlUorelNGWOoKpuPOj
	 SS1Y94jSiSEug+8lBRnZGZxsf1hZ1ZG8/+ovIeYw=
Message-ID: <95d137992900152a0453f7ba37771cb9025121fa.camel@HansenPartnership.com>
Subject: Re: [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new kmap_thread()
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Eric Biggers <ebiggers@kernel.org>, ira.weiny@intel.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, linux-aio@kvack.org, linux-efi@vger.kernel.org, 
 kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org,  target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org,  ceph-devel@vger.kernel.org,
 drbd-dev@lists.linbit.com,  devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org,  linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org,  linux-nvdimm@lists.01.org,
 linux-rdma@vger.kernel.org, x86@kernel.org,  amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org,  cluster-devel@redhat.com,
 linux-cachefs@redhat.com,  intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org,  linux-ext4@vger.kernel.org, Fenghua Yu
 <fenghua.yu@intel.com>,  ecryptfs@vger.kernel.org,
 linux-um@lists.infradead.org,  intel-gfx@lists.freedesktop.org,
 linux-erofs@lists.ozlabs.org,  reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org,  linux-bcache@vger.kernel.org, Jaegeuk Kim
 <jaegeuk@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org, 
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Date: Fri, 09 Oct 2020 19:43:13 -0700
In-Reply-To: <20201009213434.GA839@sol.localdomain>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	 <20201009195033.3208459-23-ira.weiny@intel.com>
	 <20201009213434.GA839@sol.localdomain>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-09 at 14:34 -0700, Eric Biggers wrote:
> On Fri, Oct 09, 2020 at 12:49:57PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The kmap() calls in this FS are localized to a single thread.  To
> > avoid the over head of global PKRS updates use the new
> > kmap_thread() call.
> > 
> > Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> > Cc: Chao Yu <chao@kernel.org>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  fs/f2fs/f2fs.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index d9e52a7f3702..ff72a45a577e 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -2410,12 +2410,12 @@ static inline struct page
> > *f2fs_pagecache_get_page(
> >  
> >  static inline void f2fs_copy_page(struct page *src, struct page
> > *dst)
> >  {
> > -	char *src_kaddr = kmap(src);
> > -	char *dst_kaddr = kmap(dst);
> > +	char *src_kaddr = kmap_thread(src);
> > +	char *dst_kaddr = kmap_thread(dst);
> >  
> >  	memcpy(dst_kaddr, src_kaddr, PAGE_SIZE);
> > -	kunmap(dst);
> > -	kunmap(src);
> > +	kunmap_thread(dst);
> > +	kunmap_thread(src);
> >  }
> 
> Wouldn't it make more sense to switch cases like this to
> kmap_atomic()?
> The pages are only mapped to do a memcpy(), then they're immediately
> unmapped.

On a VIPT/VIVT architecture, this is horrendously wasteful.  You're
taking something that was mapped at colour c_src mapping it to a new
address src_kaddr, which is likely a different colour and necessitates
flushing the original c_src, then you copy it to dst_kaddr, which is
also likely a different colour from c_dst, so dst_kaddr has to be
flushed on kunmap and c_dst has to be invalidated on kmap.  What we
should have is an architectural primitive for doing this, something
like kmemcopy_arch(dst, src).  PIPT architectures can implement it as
the above (possibly losing kmap if they don't need it) but VIPT/VIVT
architectures can set up a correctly coloured mapping so they can
simply copy from c_src to c_dst without any need to flush and the data
arrives cache hot at c_dst.

James




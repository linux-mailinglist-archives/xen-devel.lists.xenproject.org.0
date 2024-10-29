Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC4F9B52CC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 20:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827860.1242617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5rxp-00084o-8R; Tue, 29 Oct 2024 19:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827860.1242617; Tue, 29 Oct 2024 19:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5rxp-00081e-5F; Tue, 29 Oct 2024 19:33:13 +0000
Received: by outflank-mailman (input) for mailman id 827860;
 Tue, 29 Oct 2024 19:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v9YU=RZ=linux.intel.com=kirill.shutemov@srs-se1.protection.inumbo.net>)
 id 1t5rxn-00081Y-Bq
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 19:33:11 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cca8609-962c-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 20:33:04 +0100 (CET)
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:33:01 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2024 12:32:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id 02E3426B; Tue, 29 Oct 2024 21:32:53 +0200 (EET)
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
X-Inumbo-ID: 9cca8609-962c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5Mi4xOTguMTYzLjgiLCJoZWxvIjoibWdhbWFpbC5pbnRlbC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjljY2E4NjA5LTk2MmMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjMwMzg0LjY1OTY3NSwic2VuZGVyIjoia2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVsLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730230384; x=1761766384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rKuHVvH42ui6GSwdR20x9vXuuUKOs7LyPxbi1NASNnI=;
  b=dF766GIlXGUB3FzfGCaRbFU4X7e9q6riFMmW32+axmJTjD9S7k5Gk84j
   KF3PrZFkB+lJe+FyFHDBcXwdXZCET/FlrseJ8LSHG8IozNZGX7A0Ow67v
   xe9u/vpQcEFbjO9Y8hGb8UJ5stNoWSGWiVfZhczPDUKBtu23M5GAoAJPw
   1e2T9tOuwe8B9miQRRz9Svlx02EIzvwCtnkTbEg4df3JU5ULOT1A1EMGw
   y3jyo25poxvDi2GN5476BrjK9bGluPq7ZJuVx6Vf7Ih1TxWn98/zB4AtQ
   3gjKJPk+OeZzTzN4Abz5LYM06USeJ75b3tdmA5j074nvK1y4YukI2ROtv
   g==;
X-CSE-ConnectionGUID: pYQqfvyhQ8ixPB9YVSdJyg==
X-CSE-MsgGUID: au+hE3InTIyjVAM6PwWrTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="47378528"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="47378528"
X-CSE-ConnectionGUID: +eIVlvmHQ3K/+bFW1SyJVw==
X-CSE-MsgGUID: OaEP30QHQQi0PlK6I9o+OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82399102"
Date: Tue, 29 Oct 2024 21:32:53 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Michael Roth <michael.roth@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Kai Huang <kai.huang@intel.com>, Andi Kleen <ak@linux.intel.com>, 
	Sean Christopherson <seanjc@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/mtrr: Rename mtrr_overwrite_state() to
 guest_force_mtrr_state()
Message-ID: <elods3c5ocia6645vhce7khtzdvzwf7m3wicxmwzvw27hyyvxv@mdixnwonfzgh>
References: <20241015095818.357915-1-kirill.shutemov@linux.intel.com>
 <20241016105048.757081-1-kirill.shutemov@linux.intel.com>
 <l7l6ufyjbrfr4ms6quil5myf5bzmvu33sq3phfvpbwldhzn6m2@rzfdrvbe2glf>
 <4d39b188-0642-495c-8638-67ae08c070b7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d39b188-0642-495c-8638-67ae08c070b7@intel.com>

On Tue, Oct 29, 2024 at 10:37:07AM -0700, Dave Hansen wrote:
> On 10/29/24 08:13, Kirill A. Shutemov wrote:
> > On Wed, Oct 16, 2024 at 01:50:48PM +0300, Kirill A. Shutemov wrote:
> >> Rename the helper to better reflect its function.
> >>
> >> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> >> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> > 
> > KVM patch is Linus' tree.
> > 
> > Dave, can you take this one?
> 
> Not easily without a merge of Paolo's KVM bits.  The confusion that
> might cause isn't quite worth it for a rename.  I can either stash this
> somewhere or I'm also fine if Paolo takes it on top of your other patch:
> 
> Acked-by: Dave Hansen <dave.hansen@intel.com>

I don't follow what is the problem.

As I said KVM patch is already in Linus' tree -- v6.12-rc5 -- and tip tree
already uses the tag as basis for x86/urgent.

Hm?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov


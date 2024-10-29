Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8DC9B4D4D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 16:14:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827518.1242164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nv1-0003w8-Nt; Tue, 29 Oct 2024 15:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827518.1242164; Tue, 29 Oct 2024 15:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nv1-0003th-KN; Tue, 29 Oct 2024 15:14:03 +0000
Received: by outflank-mailman (input) for mailman id 827518;
 Tue, 29 Oct 2024 15:14:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v9YU=RZ=linux.intel.com=kirill.shutemov@srs-se1.protection.inumbo.net>)
 id 1t5nv0-0003tb-Hj
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 15:14:02 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67f2121f-9608-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 16:13:56 +0100 (CET)
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 08:13:34 -0700
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP; 29 Oct 2024 08:13:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id DDA7B26B; Tue, 29 Oct 2024 17:13:25 +0200 (EET)
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
X-Inumbo-ID: 67f2121f-9608-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5Mi4xOTguMTYzLjE2IiwiaGVsbyI6Im1nYW1haWwuaW50ZWwuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY3ZjIxMjFmLTk2MDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjE0ODM4LjI0MTM5Miwic2VuZGVyIjoia2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVsLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730214838; x=1761750838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C46h2hkYsxiCvxObmL4cr/5RX40/qGEf8l/UEib9DZQ=;
  b=dE2/Lpy7TRTQcUoZUHWUP98obCE+o8ozdYPnriybjfGO/gA6MFCx+J2r
   7Wqhj/J7I6fBn0Zw8e59tUyUOtm8fP5g9DDGUHK9E7o/2R2vvAalqb17b
   GsvCN4BXHuUDLDDatvNlBHa8YEbJIlZZBEoBXc/u8TbumVNncOezLzGbC
   5IS2/AdU/om9hN1p1RLFSjCNNWlF+s4i0rhLBiT+MligPPJ1sVDaiG/BO
   YjYfvJ4fJ/MWqTSwWtMHaJaQCQgtCTDdZP9VGUEqN4BVXRX44FWaNQb7G
   hd/Jct0Cinh0utyV+A1QOxUqDiITIhxzVQamEU/uElZxh0FbV7Nl/rJOa
   w==;
X-CSE-ConnectionGUID: 6hp2d7NyTpuaRd4DZLb9PA==
X-CSE-MsgGUID: NjoSWqs+TImsiMfo88L30w==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17495717"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="17495717"
X-CSE-ConnectionGUID: 970WKp7vROmWnggcYDfwjg==
X-CSE-MsgGUID: mXK/hnCeQFmd8+JztOQFJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82803072"
Date: Tue, 29 Oct 2024 17:13:25 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Michael Roth <michael.roth@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Kai Huang <kai.huang@intel.com>, Andi Kleen <ak@linux.intel.com>, 
	Sean Christopherson <seanjc@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH] x86/mtrr: Rename mtrr_overwrite_state() to
 guest_force_mtrr_state()
Message-ID: <l7l6ufyjbrfr4ms6quil5myf5bzmvu33sq3phfvpbwldhzn6m2@rzfdrvbe2glf>
References: <20241015095818.357915-1-kirill.shutemov@linux.intel.com>
 <20241016105048.757081-1-kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016105048.757081-1-kirill.shutemov@linux.intel.com>

On Wed, Oct 16, 2024 at 01:50:48PM +0300, Kirill A. Shutemov wrote:
> Rename the helper to better reflect its function.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Suggested-by: Dave Hansen <dave.hansen@intel.com>

KVM patch is Linus' tree.

Dave, can you take this one?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov


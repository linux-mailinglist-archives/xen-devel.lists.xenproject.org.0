Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78790A33518
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 03:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887070.1296641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiOXH-0003P9-5l; Thu, 13 Feb 2025 02:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887070.1296641; Thu, 13 Feb 2025 02:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiOXH-0003M5-3A; Thu, 13 Feb 2025 02:01:03 +0000
Received: by outflank-mailman (input) for mailman id 887070;
 Thu, 13 Feb 2025 02:01:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiOXF-0003Lt-OH
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 02:01:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e0b56c8-e9ae-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 03:00:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 03C7A5C6360;
 Thu, 13 Feb 2025 02:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898C6C4CEDF;
 Thu, 13 Feb 2025 02:00:56 +0000 (UTC)
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
X-Inumbo-ID: 5e0b56c8-e9ae-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739412057;
	bh=Y1CyGsIKBcC4YkxO17OYLpZEGZd5CX6PBzVrnAjtwFk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZErjP0ZQRrqT/VcfhyBPevL+Ds9R30rACe7hpI+apxzPh+9MmxxW+dSIYo0twmYUq
	 Lw85qy35KoQ4ArypBTn6/z/YdL8UXpKzmeDxXqVy0+yhchoPCry9jYCBEDM0qTobAe
	 AFp/FsA0nHQZeXKArHgHM5Myjilql3AZ1PBODvPsKuSJcBPpBu5bOEuqEl0kOKPRxn
	 tgQ5k9/7Ihtj6ZSkVveEc76pln+slyf1ju9iwss36gkBFM7KVmx2Omx1mmidrAJ6rS
	 uu1T7+Qj1u8rJnEJkEdQPCUIR38KL10z08ldXVpTsZJIddk43JpkJ1wPEAE39JYgVJ
	 +ouhBf4ya+FwA==
Date: Wed, 12 Feb 2025 18:00:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: struct mctelem_cookie missing definition
In-Reply-To: <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop> <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com> <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-675548614-1739412057=:619090"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-675548614-1739412057=:619090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 12 Feb 2025, Stefano Stabellini wrote:
> On Thu, 13 Feb 2025, Andrew Cooper wrote:
> > On 13/02/2025 1:25 am, Stefano Stabellini wrote:
> > > Hi all,
> > >
> > > I am looking through the few remaining MISRA violations that we have
> > > left.  One of them is R11.2:
> > >
> > > https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/9118578464/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}
> > >
> > > Specifically, mctelem_cookie_t is a pointer to incomplete type and
> > > therefore COOKIE2MCTE triggers a "conversion between a pointer to an
> > > incomplete type and any other type".
> > >
> > > mctelem_cookie_t is defined as:
> > >
> > > typedef struct mctelem_cookie *mctelem_cookie_t;
> > >
> > > I am looking through the code and I genuinely cannot find the definition
> > > of struct mctelem_cookie.
> > >
> > > If mctelem_cookie_t is only used as a pointer, wouldn't it make more
> > > sense to do:
> > >
> > > typedef struct mctelem_ent *mctelem_cookie_t;
> > >
> > > ?
> > >
> > > What am I missing?
> > 
> > Nothing.  Or perhaps the twisted thinking of the original author.
> > 
> > It is genuinely a pointer type (== known size) which you can't deference
> > (because there is no definition), and can only operate on by casting to
> > an integer.  Except the code also requires it to be a uint64_t which is
> > why there's some fun disabling of relevant hypercalls for compat guests.
> > 
> > If someone could find the time to file it in /dev/null and replace it
> > with literally anything else, I'd be very thankful.
> 
> Are you OK with typedefing mctelem_cookie_t to uint64_t instead?

I confirm that the following resolves the MISRA violations

diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
index f4c5ff848d..2ccd490e5d 100644
--- a/xen/arch/x86/cpu/mcheck/mctelem.h
+++ b/xen/arch/x86/cpu/mcheck/mctelem.h
@@ -52,7 +52,7 @@
  * the element from the processing list.
  */
 
-typedef struct mctelem_cookie *mctelem_cookie_t;
+typedef uint64_t *mctelem_cookie_t;
 
 typedef enum mctelem_class {
     MC_URGENT,
--8323329-675548614-1739412057=:619090--


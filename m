Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B2DA368E4
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 00:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889128.1298342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj4jO-0004Bj-0G; Fri, 14 Feb 2025 23:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889128.1298342; Fri, 14 Feb 2025 23:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj4jN-00049H-T4; Fri, 14 Feb 2025 23:04:21 +0000
Received: by outflank-mailman (input) for mailman id 889128;
 Fri, 14 Feb 2025 23:04:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj4jM-00048v-Ar
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 23:04:20 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02b1945b-eb28-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 00:04:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 21977A41DDC;
 Fri, 14 Feb 2025 23:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEB0C4CEE2;
 Fri, 14 Feb 2025 23:04:13 +0000 (UTC)
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
X-Inumbo-ID: 02b1945b-eb28-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739574254;
	bh=sWlm91Ip/2lWKBEjXE+scOhVRsme0hZnZEEz5DNnNEc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f1MxI9jNN3BgtnezkwguNiatrHiiEH7BPsvCg0mPGegcN1LQyWrDrFGAVfMyOioTy
	 AyYKvJBiMnjd8rXSRRupXOwJfel0IGcf4QHWx/2kbpU8xEZF1r/beqCriIyP/+6qG7
	 mr692kpuFQCZ81UUxqrONbOIGdMCYwmLu35h9s8RM5mSoyhDm+b+EcwpLSpd2wvBlw
	 uUGDQU1C8gKEXCROSUhkbJ5oIC1k9nRfHF1ft/t+8pmnt9TCNh6loNocbAywWTlF+o
	 X9N2c0O01Uc6F9qlo4HmIBCjqVfhAc8EpfKB6l9hqDPwX8ee8ro9f9xXqwHs6CYXNb
	 zBY3fbVOtqojg==
Date: Fri, 14 Feb 2025 15:04:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: struct mctelem_cookie missing definition
In-Reply-To: <69a70bfa-203c-44f9-99ea-60a674e36442@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502141245150.3858257@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop> <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com> <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com> <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop> <3c883b4587d750c2723637a037fb46b4@bugseng.com>
 <69a70bfa-203c-44f9-99ea-60a674e36442@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Feb 2025, Jan Beulich wrote:
> > Would deviating macros "COOKIE2MCTE" and "MCTE2COOKIE" work?
> 
> If it did, COOKIE2ID and ID2COOKIE would likely need including as well.

I wrote this patch. Nicola, can you please check the changes to
deviations.ecl, this is the first time I try to write the deviation
myself :-)

---
misra: add 11.2 deviation for incomplete types

struct mctelem_cookie* is used exactly because it is an incomplete type
so the pointer cannot be dereferenced. This is deliberate. So add a
deviation for it.

In deviations.ecl, add the list of macros that do the conversions to and
from struct mctelem_cookie*.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index a28eb0ae76..87bfd2160c 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -366,6 +366,14 @@ constant expressions are required.\""
 }
 -doc_end
 
+-doc_begin="Certain pointers point to incomplete types purposely so that they are impossible to dereference."
+-config=MC3A2.R11.2,reports+={deliberate, "any_area(any_loc(any_exp(macro(^COOKIE2MCTE$))))"}
+-config=MC3A2.R11.2,reports+={deliberate, "any_area(any_loc(any_exp(macro(^MCTE2COOKIE$))))"}
+-config=MC3A2.R11.2,reports+={deliberate, "any_area(any_loc(any_exp(macro(^COOKIE2ID$))))"}
+-config=MC3A2.R11.2,reports+={deliberate, "any_area(any_loc(any_exp(macro(^ID2COOKIE$))))"}
+}
+-doc_end
+
 -doc_begin="Conversions to object pointers that have a pointee type with a smaller (i.e., less strict) alignment requirement are safe."
 -config=MC3A2.R11.3,casts+={safe,
   "!relation(more_aligned_pointee)"
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index fe0b1e10a2..f3004d6023 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -324,6 +324,12 @@ Deviations related to MISRA C:2012 Rules:
        semantics that do not lead to unexpected behaviour.
      - Tagged as `safe` for ECLAIR.
 
+   * - R11.2
+     - Certain pointers point to incomplete types purposely so that they
+       are impossible to dereference.
+     - Tagged as `deliberate` for ECLAIR. Such pointer is struct
+       mctelem_cookie \*.
+
    * - R11.2
      - The conversion from a pointer to an incomplete type to unsigned long
        does not lose any information, provided that the target type has enough


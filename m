Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1BBA35523
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 04:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888343.1297723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tilwn-0005Pv-4p; Fri, 14 Feb 2025 03:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888343.1297723; Fri, 14 Feb 2025 03:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tilwn-0005OL-1k; Fri, 14 Feb 2025 03:00:57 +0000
Received: by outflank-mailman (input) for mailman id 888343;
 Fri, 14 Feb 2025 03:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tilwl-0005OF-S2
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 03:00:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6ea6c32-ea7f-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 04:00:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B8905C5CBD;
 Fri, 14 Feb 2025 03:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDADC4CED1;
 Fri, 14 Feb 2025 03:00:50 +0000 (UTC)
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
X-Inumbo-ID: e6ea6c32-ea7f-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739502051;
	bh=tB8tkpiQE1XdKvW3oUh2buxtAIlBTxt/XTdJyGfCJe8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BGvDdipIfPvKwnNvjvNYRoU0uIXfVOnWsDBbSNwTNbsIzpumjQ+TqyYLMaFT2pUsm
	 Xx2q+1qgatrHvZBgUjK2S+oH2r0x9mvB1kMFdjZTkAIBQvSPda5H29jnXeBM2FzWD2
	 TUr0VmQqgB4M7tLHOSQervpYFXrtpsbf8fJYbCphQCd06ExJPxqpoqkZpejZWlSX5K
	 1j5y2YjWyZx/GrJM1Kx780m0kV5eGCbRtc6SoZtkdOmtsJD1LsOHtS3irh54G06mSI
	 Zvm7+Q7xdOQLkT5bb4loD1tDhhC1n5XcMBeN7s55oaaxQVpclVrGSMSnMb+/NcFdAR
	 EjuifZKOO19vQ==
Date: Thu, 13 Feb 2025 19:00:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    nicola.vetrini@bugseng.com
Subject: Re: struct mctelem_cookie missing definition
In-Reply-To: <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop> <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com> <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com> <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Feb 2025, Stefano Stabellini wrote:
> > > diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
> > > index f4c5ff848d..2ccd490e5d 100644
> > > --- a/xen/arch/x86/cpu/mcheck/mctelem.h
> > > +++ b/xen/arch/x86/cpu/mcheck/mctelem.h
> > > @@ -52,7 +52,7 @@
> > >   * the element from the processing list.
> > >   */
> > >  
> > > -typedef struct mctelem_cookie *mctelem_cookie_t;
> > > +typedef uint64_t *mctelem_cookie_t;
> > 
> > Yet that makes it possible to de-reference the pointer. Which, as Andrew
> > explained, is intended to be impossible. If this could be properly
> > replaced (not exactly what Andrew indicated by "file it in /dev/null"),
> > fine. Truly purging the code (i.e. as Andrew suggests) may still be an
> > option, with appropriate justification. But simply adjusting the type
> > and then moving on is too little, imo. Even if you used void * (to make
> > de-referencing impossible) I'd view it as largely papering over an issue;
> > then converting to other pointers (without explicit cast, and hence
> > without making apparent the badness of doing so) would become possible.
> 
> What about converting to uintptr_t (not a pointer)?
> 
> 
> In general, there are quite a few MISRA rules that we could mark as
> blocking (clean) in our GitLab scan with just a few code changes like
> this one. My goal is to make these rules blocking as soon as possible.
> If I can improve the code in the process, that is even better, but it is
> not mandatory. And I would rather spend one more hour marking a second
> rule as blocking instead. 
> 
> What I mean is that I believe it would be acceptable to make some
> compromises and accept non-perfect changes to the code if it helps us
> enforce more rules as blocking in GitLab CI.

After briefly speaking with Andrew about this, and re-reading Jan's
email above, I think it is best to resolve this as a deviation.

Would this deviation work for you? Please suggest a better wording if
you prefer.

Nicola, in reality I think it would be better to use deviations.rst
because the SAF comment below would need to be replicated at every call
side, if I am not mistaken.


diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index b8a4f878ea..d9fbe959d1 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -92,6 +92,14 @@
         },
         {
             "id": "SAF-11-safe",
+            "analyser": {
+                "eclair": "MC3A2.R11.2"
+            },
+            "name": "Rule 11.2: purposely impossible to dereference",
+            "text": "Certain pointers points to incomplete types purposely so that they are impossible to dereference."
+        },
+        {
+            "id": "SAF-12-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
index f4c5ff848d..e845360c7d 100644
--- a/xen/arch/x86/cpu/mcheck/mctelem.h
+++ b/xen/arch/x86/cpu/mcheck/mctelem.h
@@ -52,6 +52,7 @@
  * the element from the processing list.
  */
 
+/* SAF-11-safe: impossible to dereference */
 typedef struct mctelem_cookie *mctelem_cookie_t;
 
 typedef enum mctelem_class {


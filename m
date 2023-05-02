Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB746F3C7F
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 06:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528330.821328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pthAv-0001sW-Fl; Tue, 02 May 2023 03:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528330.821328; Tue, 02 May 2023 03:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pthAv-0001pC-D6; Tue, 02 May 2023 03:59:37 +0000
Received: by outflank-mailman (input) for mailman id 528330;
 Tue, 02 May 2023 03:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PvCK=AX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pthAu-0001p6-2Y
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 03:59:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdb2bdd0-e89d-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 05:59:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 399EC618FE;
 Tue,  2 May 2023 03:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4C1C433D2;
 Tue,  2 May 2023 03:59:28 +0000 (UTC)
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
X-Inumbo-ID: bdb2bdd0-e89d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682999969;
	bh=pmCTwM5JeS/nROPQdqbvEVzgt5qKVs7zZy9Af5KBrC0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LpV7prXFLMFtaEZrhSeYwjhaMrErPjwtYqkH1CkPrNmwpXPJS3FOOvEFyONbjilRG
	 9N5bgQCO04Mr9HUip9M1I98h/8mi8ArU/EmTRqWi++UzLM+t+fw8J//1huirwUCMoh
	 QCsttQxykjd/PjYjpQKAgcPdeR5wJjpNZYSzaOFaWvsBg0iswwNr5JkUWX0wm1Mw7K
	 7SKRLdMHdjojXXVRa9q1dXgnd3GL3LpAQdg2Fy8zS1ROFvb4bbPgs3tawVFJPnpONL
	 GHgZRSAzatM1T09iHkbRKh9rs1Ef2EaHelrMoKYPRmxWlz0KE8EFv71DUICe7cmwbO
	 9NcVX/7JCmkRQ==
Date: Mon, 1 May 2023 20:59:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: andrew.cooper3@citrix.com, alejandro.vallejo@cloud.com, 
    committers@xenproject.org, michal.orzel@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging | 6a47ba2f
In-Reply-To: <alpine.DEB.2.22.394.2304291808420.974517@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2305011835000.974517@ubuntu-linux-20-04-desktop>
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail> <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop> <ca0144a6-2c57-0cc3-fd27-5dbe59491ef3@citrix.com>
 <alpine.DEB.2.22.394.2304291808420.974517@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 29 Apr 2023, Stefano Stabellini wrote:
> Your guess was correct. I have done more bisecting today. The culprit is
> the following commit (I reverted only this commit and ran 25 tests
> successfully, usually it fails in less than 5):
> 
> e522c98c3    tools: Refactor console/io.c to avoid using xc_domain_getinfo()

I did more debugging. One problem seems to be that
XEN_SYSCTL_getdomaininfolist is buggy in the hypervisor. The field
u.getdomaininfolist.num_domains is not copied back to the guest. It
doesn't look like the hypercall would behave well for more than 1 guest.
I am appending the fix.

This is not sufficient to fix the failure. On a hunch, I made this
change:


 	/* Fetch info on every valid domain except for dom0 */
-	ret = xc_domain_getinfolist(xc, 1, DOMID_FIRST_RESERVED - 1, domaininfo);
+	ret = xc_domain_getinfolist(xc, 1, 10, domaininfo);
 	if (ret < 0)
 		return;
 
With it, everything works. I have run out of time today for my
investigation.


I would like to take the opportunity to highlight that gitlab-ci did a
very good job spotting an issue. I am glad we are starting to reap the
benefits of all the hard work we put into it.

Cheers,

Stefano

---
xen: fix broken XEN_SYSCTL_getdomaininfolist hypercall

XEN_SYSCTL_getdomaininfolist doesn't actually update the guest
num_domains field, only its local copy. Fix that.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 02505ab044..0e1097be96 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -107,10 +107,8 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         
         rcu_read_unlock(&domlist_read_lock);
         
-        if ( ret != 0 )
-            break;
-        
         op->u.getdomaininfolist.num_domains = num_domains;
+        __copy_field_to_guest(u_sysctl, op, u.getdomaininfolist.num_domains);
     }
     break;
 


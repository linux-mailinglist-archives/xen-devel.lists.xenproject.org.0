Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998276F68A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 02:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576661.903039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRinI-0002kr-Sf; Fri, 04 Aug 2023 00:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576661.903039; Fri, 04 Aug 2023 00:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRinI-0002iZ-Pf; Fri, 04 Aug 2023 00:35:52 +0000
Received: by outflank-mailman (input) for mailman id 576661;
 Fri, 04 Aug 2023 00:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRinH-0002iT-7f
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 00:35:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db82be17-325e-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 02:35:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E63861DC7;
 Fri,  4 Aug 2023 00:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D045EC433C8;
 Fri,  4 Aug 2023 00:35:45 +0000 (UTC)
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
X-Inumbo-ID: db82be17-325e-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691109347;
	bh=xTOMQxXd2u9RB/JljKi0xPtht7ZUtCp0e47FG1ZhdF0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RJLISaVgWvv7NIU55pcycVq2cXlGpPXu0h0S3wGPvG3qAInIB8jRPz1WbOwnuvCbK
	 AFAJmr9Zr5i8TCZAdPRG8upte1Tc+EYZzLTzFW4+5WcVdVm+rMF5lrizs2I8lWjea/
	 +mR4WJ0rvIzcUUxjAmlKzDSpnCJx0QGriVCxwb1j8ZWKDzj5ey5ru/vuqgIVOrMimh
	 C3A6SSHMHE+kuH1OhbKXC0/Siw9drOBSCCpDt7RdWsmxIhKdoS5fZTbNT5HOcNTCFv
	 dfyLsubCJayTmmvLgwEpkVddHFRHhz+fpXqdeGHrGzF+03tnkz2VTytJmzo7CX5KTf
	 nfyIys2K+HHPg==
Date: Thu, 3 Aug 2023 17:35:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Michal Orzel <michal.orzel@amd.com>, xenia.ragiadakou@amd.com, 
    Ayan Kumar Halder <ayankuma@amd.com>, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: Address MISRA C:2012 Rule 8.4
In-Reply-To: <786d24b044bfa503a73a36d2a01eae8c@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031733380.2127516@ubuntu-linux-20-04-desktop>
References: <786d24b044bfa503a73a36d2a01eae8c@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I think that's OK for me. My only concern is that we should track the
project-wide deviations properly somewhere besides the ECLAIR
configuration under xen.git which is ECLAIR specific. So far we used the
notes in docs/misra/rules.rst. I don't know if that sufficient, but we
could add a note for 8.4:

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 8f0e4d3f25..5977bc9d5e 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -245,7 +245,8 @@ maintainers if you want to suggest a change.
      - Required
      - A compatible declaration shall be visible when an object or
        function with external linkage is defined
-     -
+     - No need for declarations when functions are only called from
+       assembly
 
    * - `Rule 8.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_05_2.c>`_
      - Required


On Thu, 3 Aug 2023, Nicola Vetrini wrote:
> The headline of Rule 8.4 is as follows:
> "A compatible declaration shall be visible when an object or
> function with external linkage is defined".
> 
> Some functions reported in [1][2] are lacking a declaration in the respective
> header files;
> as remarked on xen-devel's IRC channel, this is ok since they are only called
> from asm code (e.g., start_xen). A similar discussion
> had taken place in the past (see [3]) and the general consensus was to deviate
> these cases.
> If that is still the case, a suitable project-wide deviation can be added to
> address these violations.
> 
> [1]
> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/ARM64-Set1/210/PROJECT.ecd;/by_service/MC3R1.R8.4.html
> [2]
> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/210/PROJECT.ecd;/by_service/MC3R1.R8.4.html
> [3] https://lore.kernel.org/all/20220705210218.483854-2-burzalodowa@gmail.com/
> 
> Regards,
> 
> -- 
> Nicola Vetrini, BSc
> Software Engineer, BUGSENG srl (https://bugseng.com)
> 


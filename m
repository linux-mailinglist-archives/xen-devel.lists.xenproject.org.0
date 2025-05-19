Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1599ABC9CD
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 23:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990322.1374284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH8A0-0006Fg-8A; Mon, 19 May 2025 21:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990322.1374284; Mon, 19 May 2025 21:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH8A0-0006Dx-4S; Mon, 19 May 2025 21:36:36 +0000
Received: by outflank-mailman (input) for mailman id 990322;
 Mon, 19 May 2025 21:36:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=klDL=YD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uH89z-0006Dr-8k
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 21:36:35 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54aadb7e-34f9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 23:36:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5AE4E4445D;
 Mon, 19 May 2025 21:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5A1C4CEE9;
 Mon, 19 May 2025 21:36:29 +0000 (UTC)
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
X-Inumbo-ID: 54aadb7e-34f9-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690591;
	bh=UN/v0yGDBaVXFfDMpTCvsIRcPrKNBZzstrYmQVQGyUI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cB/R01//RgMjOtyF0YdyU4nxK3gDk1iNgd2v+VfTL7hiOezY1xeEnkx/1+1oTjd0S
	 q0ovI/y7tTt1QLTV57mpnQxaX/OtuqwvxkJC+KKFSTadxBwWgpBYNjaAWzgjcPo88v
	 XR7Chb/sx0xdRpyiub34UM1C5YU4ETq85VWpPQAux8F2HlCGCXD5QByGim3Z/NFApe
	 OKiiIE/FUxd5q6IJAgTtE3ZwqW+HhfkicBls/kdmzhsizn7fUrpEQZBmjlmRrqPY4V
	 VuRDQZxfwW5x9DhTvcmrQJ3Gk1N4wCBAYQxE6xlRlVUEXQRhJLahg2PIWWf5Yxp3YH
	 FHNPUpxKd4oCw==
Date: Mon, 19 May 2025 14:36:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, jbeulich@suse.com, 
    julien@xen.org, roger.pau@citrix.com, sstabellini@kernel.org, 
    bertrand.marquis@arm.com
Subject: Re: [PATCH 6/6] automation/eclair: update configuration of D4.10
In-Reply-To: <ac9179ed-32b5-4b80-9fb2-2f3e8012afe2@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2505191436160.145034@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop> <20250516232130.835779-6-stefano.stabellini@amd.com> <5c2aa885-8877-4708-90cc-d65a76b729b3@citrix.com> <ac9179ed-32b5-4b80-9fb2-2f3e8012afe2@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-440588898-1747690591=:145034"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-440588898-1747690591=:145034
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 19 May 2025, Federico Serafini wrote:
> Hi,
> 
> On 17/05/25 01:57, Andrew Cooper wrote:
> > 
> > > +-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated
> > > file, do not edit! \\*/$, begin-2))"}
> > >   -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated
> > > file, do not edit! \\*/$, begin-3))"}
> > 
> > These seem to only differ by the begin-$N.  Why doesn't the regex work
> > in both cases?
> 
> "begin-N" expresses the position of a single line, not a range.
> For example, begin-2 means "two lines before the first reported area"
> and deviates:
> 
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/10063944407/PROJECT.ecd;/sources/xen/include/xen/hypercall-defs.h.html#R174_1{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":false,"selector":{"enabled":true,"negated":false,"kind":2,"children":[]}}}
> 
> If you prefer, I think we can use ranges and merge the two
> configurations.

I think that would be better
--8323329-440588898-1747690591=:145034--


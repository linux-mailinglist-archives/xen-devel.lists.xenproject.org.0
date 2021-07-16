Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8263CBDCC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 22:29:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157719.290495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4USM-0007zA-RS; Fri, 16 Jul 2021 20:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157719.290495; Fri, 16 Jul 2021 20:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4USM-0007vr-NL; Fri, 16 Jul 2021 20:29:10 +0000
Received: by outflank-mailman (input) for mailman id 157719;
 Fri, 16 Jul 2021 20:29:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kgq4=MI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m4USK-0007vl-Tg
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 20:29:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78234036-e674-11eb-89b4-12813bfff9fa;
 Fri, 16 Jul 2021 20:29:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 713B3613CF;
 Fri, 16 Jul 2021 20:29:06 +0000 (UTC)
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
X-Inumbo-ID: 78234036-e674-11eb-89b4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626467346;
	bh=6cmaKe2VBOq4itS1JiccbBfApUMPCucNRbjK2XQsb7k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ENCHrpiQsU9YqyaYKbrZzaAbvze14eQkUb9vRec+6DI+1m03/cJH3ULB/by2qDVZe
	 ff+ssEXseFuHlXZkED6UoQREVhwPZTMm8r5RpijU+uizQzohoUoGl1QsPVErMvp99G
	 TIUG8Z8lEtDu3m/EXR0LrWZ0Gwfiok5BuxLSK7pogcJnw1Ls0aBScmzcsCAz+tBaaV
	 ky2TSsxgqgMuSvPugR4zMomt3quNKFdbh/i2KRJe/mQ3rBy3YArFch2pf0LeAPUS55
	 Ney+KmGuxH/rGgV8qifA7gKctH9RMc0cQzt9N70lzWwVPObl2/TFQlnpMEc5egt+cX
	 GR/FSRATo8gPg==
Date: Fri, 16 Jul 2021 13:29:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, iwj@xenproject.org, 
    wl@xen.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] SUPPORT.md: add Dom0less as Supported
In-Reply-To: <04d06f53-4489-1a08-e744-fa36679a2287@xen.org>
Message-ID: <alpine.DEB.2.21.2107161326040.3916@sstabellini-ThinkPad-T480s>
References: <20210714234809.30483-1-sstabellini@kernel.org> <04d06f53-4489-1a08-e744-fa36679a2287@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Jul 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 15/07/2021 00:48, Stefano Stabellini wrote:
> > Add Dom0less to SUPPORT.md to clarify its support status. The feature is
> > mature enough and small enough to make it security supported.
> 
> I would suggest to explain the restriction in the commit message (and give a
> link to XSA-372 commit).
> 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> > Changes in v2:
> > - clarify memory scrubbing
> > ---
> >   SUPPORT.md | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index 317392d8f3..524cab9c8d 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -832,6 +832,15 @@ OVMF firmware implements the UEFI boot protocol.
> >         Status, qemu-xen: Supported
> >   +## Dom0less
> > +
> > +Guest creation from the hypervisor at boot without Dom0 intervention.
> > +
> > +    Status, ARM: Supported
> > +
> > +Memory of dom0less DomUs is not scrubbed at boot (even with
> > +bootscrub=on); no XSAs will be issues due to unscrubbed memory.
> 
> The memory will not be scrubbed for bootscrub=on and bootscrub=off. However,
> it should be scrubbed for bootscrub=idle (the default).

With bootscrub=idle, do you know if it is guaranteed to complete the
scrubbing before dom0less domUs start? I assumed it wasn't guaranteed,
but if it is, then we should rephrase the statement.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DDB2A0D7E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 19:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16181.39520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZEo-0000cn-Mp; Fri, 30 Oct 2020 18:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16181.39520; Fri, 30 Oct 2020 18:34:58 +0000
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
	id 1kYZEo-0000cQ-Jn; Fri, 30 Oct 2020 18:34:58 +0000
Received: by outflank-mailman (input) for mailman id 16181;
 Fri, 30 Oct 2020 18:34:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MNT=EF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kYZEn-0000cL-74
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:34:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d49b34e9-650e-4a92-b7ef-3743d1ebe73f;
 Fri, 30 Oct 2020 18:34:56 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00B5E20729;
 Fri, 30 Oct 2020 18:34:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0MNT=EF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kYZEn-0000cL-74
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:34:57 +0000
X-Inumbo-ID: d49b34e9-650e-4a92-b7ef-3743d1ebe73f
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d49b34e9-650e-4a92-b7ef-3743d1ebe73f;
	Fri, 30 Oct 2020 18:34:56 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 00B5E20729;
	Fri, 30 Oct 2020 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604082895;
	bh=Ksm8ZRwC5xIEq+rvokHzDCtcSUrr9kI6LtAgdYmzoJA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ap6vKCg6A6x4jtLJi01e8Tx9avEXg6iczqIuHjrdYREASK4yAdg5JrNwXOxpLEg6o
	 6qkAIoG+LlxDiOToUmTgkmZouUhxI9gs7G522IYzDiFp1SDGWNIFN9T3AUlW7Cxj/S
	 Go3vD2KS8xpYdDg6Nxuv41QYKiAlRnhZfC2aN3O8=
Date: Fri, 30 Oct 2020 11:34:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, alex.bennee@linaro.org, 
    masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Rahul.Singh@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2 2/7] xen/arm: acpi: The fixmap area should always be
 cleared during failure/unmap
In-Reply-To: <5a8afe57-1be5-6a0b-2ed5-e668690fc246@xen.org>
Message-ID: <alpine.DEB.2.21.2010301134430.12247@sstabellini-ThinkPad-T480s>
References: <20201023154156.6593-1-julien@xen.org> <20201023154156.6593-3-julien@xen.org> <alpine.DEB.2.21.2010231714510.12247@sstabellini-ThinkPad-T480s> <6038f41f-594c-e573-9126-f31291af9c38@xen.org> <alpine.DEB.2.21.2010301127470.12247@sstabellini-ThinkPad-T480s>
 <5a8afe57-1be5-6a0b-2ed5-e668690fc246@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Oct 2020, Julien Grall wrote:
> Hi,
> 
> On 30/10/2020 18:28, Stefano Stabellini wrote:
> > On Fri, 30 Oct 2020, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 24/10/2020 01:16, Stefano Stabellini wrote:
> > > > On Fri, 23 Oct 2020, Julien Grall wrote:
> > > > >    bool __acpi_unmap_table(const void *ptr, unsigned long size)
> > > > >    {
> > > > >        vaddr_t vaddr = (vaddr_t)ptr;
> > > > > +    unsigned int idx;
> > > > > +
> > > > > +    /* We are only handling fixmap address in the arch code */
> > > > > +    if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
> > > > > +         (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END)) )
> > > > 
> > > > Is it missing "+ PAGE_SIZE"?
> > > > 
> > > >      if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
> > > >           (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) )
> > > 
> > > Yes it should be + PAGE_SIZE. Do you mind if I fix it on commit?
> > 
> > No, I don't mind. Go ahead.
> 
> I technically don't have a ack for this patch. Can I consider this as a
> Acked-by? :)

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B09B296754
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 00:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10656.28440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVj3l-0008D9-Lz; Thu, 22 Oct 2020 22:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10656.28440; Thu, 22 Oct 2020 22:27:49 +0000
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
	id 1kVj3l-0008Ck-IR; Thu, 22 Oct 2020 22:27:49 +0000
Received: by outflank-mailman (input) for mailman id 10656;
 Thu, 22 Oct 2020 22:27:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JUr7=D5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kVj3k-0008Cf-P5
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 22:27:48 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07a2df02-8e59-41bd-a5e5-d38c2e1c3bd2;
 Thu, 22 Oct 2020 22:27:47 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09MMRYj0083433
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 22 Oct 2020 18:27:39 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09MMRXj0083432;
 Thu, 22 Oct 2020 15:27:33 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JUr7=D5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kVj3k-0008Cf-P5
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 22:27:48 +0000
X-Inumbo-ID: 07a2df02-8e59-41bd-a5e5-d38c2e1c3bd2
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 07a2df02-8e59-41bd-a5e5-d38c2e1c3bd2;
	Thu, 22 Oct 2020 22:27:47 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09MMRYj0083433
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 22 Oct 2020 18:27:39 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09MMRXj0083432;
	Thu, 22 Oct 2020 15:27:33 -0700 (PDT)
	(envelope-from ehem)
Date: Thu, 22 Oct 2020 15:27:33 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Remove EXPERT dependancy
Message-ID: <20201022222733.GA83375@mattapan.m5p.com>
References: <20201022014310.GA70872@mattapan.m5p.com>
 <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org>
 <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Thu, Oct 22, 2020 at 02:17:13PM -0700, Stefano Stabellini wrote:
> On Thu, 22 Oct 2020, Julien Grall wrote:
> > On 22/10/2020 02:43, Elliott Mitchell wrote:
> > > Linux requires UEFI support to be enabled on ARM64 devices.  While many
> > > ARM64 devices lack ACPI, the writing seems to be on the wall of UEFI/ACPI
> > > potentially taking over.  Some common devices may need ACPI table
> > > support.
> > > 
> > > Presently I think it is worth removing the dependancy on CONFIG_EXPERT.
> > 
> > The idea behind EXPERT is to gate any feature that is not considered to be
> > stable/complete enough to be used in production.
> 
> Yes, and from that point of view I don't think we want to remove EXPERT
> from ACPI yet. However, the idea of hiding things behind EXPERT works
> very well for new esoteric features, something like memory introspection
> or memory overcommit. It does not work well for things that are actually
> required to boot on the platform.
> 
> Typically ACPI systems don't come with device tree at all (RPi4 being an
> exception), so users don't really have much of a choice in the matter.
> 
> >From that point of view, it would be better to remove EXPERT from ACPI,
> maybe even build ACPI by default, *but* to add a warning at boot saying
> something like:
> 
> "ACPI support is experimental. Boot using Device Tree if you can."
> 
> 
> That would better convey the risks of using ACPI, while at the same time
> making it a bit easier for users to boot on their ACPI-only platforms.

This matches my view.  I was thinking about including "default y", but I
felt the chances of that getting through were lower.  I concur with a
warning on boot being a good approach.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CF03FC8AF
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175792.320134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL48B-0001ii-0L; Tue, 31 Aug 2021 13:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175792.320134; Tue, 31 Aug 2021 13:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL48A-0001gr-TG; Tue, 31 Aug 2021 13:48:50 +0000
Received: by outflank-mailman (input) for mailman id 175792;
 Tue, 31 Aug 2021 13:48:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MdRD=NW=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mL489-0001gh-7S
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:48:49 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a6a3626-0a62-11ec-ad41-12813bfff9fa;
 Tue, 31 Aug 2021 13:48:48 +0000 (UTC)
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
X-Inumbo-ID: 2a6a3626-0a62-11ec-ad41-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630417727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cbU78/nRNx/NGgEo3pTpa/uxI7RqMuOd4uNF6jCUtm8=;
  b=VFhS9GlMH8zVYnhQbVobl9JA/na9j9frCLh660pMqbnYjHrWAgCZlkvy
   5SlvpOgnHMWJkniJaQwv8MM65NzKOr6CYQGbCQqPFwF3ntcO97e6uSNTC
   m3ECDJHVb+W2TfDkAkfuJ6l3zrQuaOmwNSvJ9TtkZc/tRHBwDfJRoguoW
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CsA46knl4ihWLtmpbAo1w/UrFFht9yYeMbR3867SndvkbNgotY7djxqpWKf1OSLjiLUBFpxr4O
 yy9idu1NyxT+usXmENJMlFxJVvEAv7wUyf2pc+exaGgPbKVEvgyWnG35B3p0gPWsbzDDnAbCLJ
 dml9v+auIyDZJ3FxtMLJeBOrnkoCT4nD+eqy/c7CiYZV2wWzPHM5xpRP3tLed1GZMvYq1qMYUa
 HefyqZnWdn/gEUeE9ili7RS1BTm8laq60wgC7WB71JFoJXl/AILZsFT8n4LDxx2YjETR2IrNCx
 AYTSniJDwW4Y6BXGQglQyn56
X-SBRS: 5.1
X-MesageID: 51693120
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ahb7Aagrz21n1Oh60cipnHj0LHBQX1113DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskaKdkrNhQ4tKOzOWx1dATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkZNDS0NykGsS+Y2njKLz9D+qj+zEnAv463pB0BPGIaCdAU0+46MHf9LqQffng3OXNTLu
 vk2iMonUvERZ1aVLXAOpFTNNKz1uEj2aiWICLvQHUcmUCzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWtv1t6Zjc4+oGIPbJptkeKz3qhArtTIN9W4eatDRwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqknd+Qdrz0Wn5U6TgHPlr8C8bDUmC/BZjYYcSRfd41pIhqAx7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn12S+IlGftshL1a2HkQPIYLHSr85oxiOv
 JpFtvg6PFfdk7fR2zFv1No3MenUh0Ib1K7q3A5y4qoOgVt7SlEJxNy/r1Gop5AzuN+d3B83Z
 WCDkwy/4s+FfP/BMlGdZU8qcjeMB2BffuDChPJHbxLfJt3c04lkKSHl4nd0tvaMqDg/KFC7K
 gpb2kow1LaW3ieRvFmj6c7vCwkfg2GLH/QI4dllsVEhoE=
X-IronPort-AV: E=Sophos;i="5.84,366,1620705600"; 
   d="scan'208";a="51693120"
Date: Tue, 31 Aug 2021 14:48:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] Config.mk: update OVMF to edk2-stable202108
Message-ID: <YS4zO5P4TcUBLDe7@perard>
References: <20210831123637.22647-1-anthony.perard@citrix.com>
 <b19def29-7287-0aa8-6bf6-1ca022de1355@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b19def29-7287-0aa8-6bf6-1ca022de1355@suse.com>

On Tue, Aug 31, 2021 at 03:01:54PM +0200, Jan Beulich wrote:
> On 31.08.2021 14:36, Anthony PERARD wrote:
> > Update to the latest stable tag.
> 
> Largely out of curiosity - if that's truly a tag, ...

Well, it's a git tag, but it's not signed by upstream :-(.

Upstream started to do a release for OVMF every 3 months somewhat
recently. They will stop taking new feature and only take fixes for a
couple of weeks, then tag the tree.

> > --- a/Config.mk
> > +++ b/Config.mk
> > @@ -244,7 +244,7 @@ QEMU_TRADITIONAL_URL ?= git://xenbits.xen.org/qemu-xen-traditional.git
> >  SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
> >  MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
> >  endif
> > -OVMF_UPSTREAM_REVISION ?= b37cfdd2807181aed2fee1e17bd7ec1190db266a
> > +OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5
> 
> ... why not refer to it here and instead spell out a hash?

Since the tag isn't signed, it's probably better to keep using a hash.

-- 
Anthony PERARD


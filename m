Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567FA81CC65
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659637.1029342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhmT-0002YO-T3; Fri, 22 Dec 2023 15:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659637.1029342; Fri, 22 Dec 2023 15:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhmT-0002Vp-QU; Fri, 22 Dec 2023 15:49:45 +0000
Received: by outflank-mailman (input) for mailman id 659637;
 Fri, 22 Dec 2023 15:49:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJNi=IB=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1rGhmR-0002Vj-Qm
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:49:44 +0000
Received: from neowutran.ovh (core.neowutran.ovh [51.83.40.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8ac872e-a0e1-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:49:42 +0100 (CET)
Received: from neowutran.ovh (maisonhome.neowutran.ovh [82.65.3.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id 88FFB6131C;
 Fri, 22 Dec 2023 15:49:40 +0000 (UTC)
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
X-Inumbo-ID: b8ac872e-a0e1-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh; s=mail;
	t=1703260180; bh=5Y2j3P6yh2IvY4PkE+O7HQV+92Lr9Z0k/8gsANFQ7Y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X8lFHH0FApqtsAfwTrWQtjEwGR+FsrfB96eWVAoIExlizqBjwy0XqnmEBwsk08RV3
	 tbgLplty+JKf7bZHvnCEh6ccahD0ID0hTw4K2x/oZg6SNInQTZ1BxuJN4P/U/zf/N8
	 eND37xk1h88gKwRP5Gb/6ZJ/gYNaoozcru9F0P900FLrDXyIYWIZEmKrl5rsuZIXFF
	 EGZzgDmWpeSIw5tXGifkzwCbykoztNSHQfPwrU8ntU9ANQe4zAgmekiRZK25XrAIOX
	 2T1J4vsSSuWTfNsIMZcgrMRMmo9yI+nnFXdB4zrJp0H8UmyE8WV92z7lEO7Zl4lzVG
	 0P8QbQg6V5H0Jmvk36S6CNLenVmElzmaWijm6FjFW7qJsK9a5eRULlw5egWQmO/kRa
	 5sln7QemXDS0dDo9EMR2sx6rt6pvWkJv7rRAWDD7u2QgJer0uO9sNyZpl1hhBkqVfa
	 PIysMmfsy54cXchdTFI3pi6tBzEOOvD9RStSagBOe6Rr1KesQrOBgEP7pdWoDepTSy
	 1B9GmEED4mJSU4HJc2ejnnYOqp1E0nfzMVdRVs9niaiedAfCZdsbns8jRCjeNYr+dF
	 ORGzeSgBy4L6ykt7Cxr0CMmFVtUQSSarc0E0gpsZLiuHZlC6wvX21yOFFAHe/o/vt6
	 t/9pO79RTLLDdTLFu5OnqUFQ=
Date: Fri, 22 Dec 2023 16:49:38 +0100
From: Neowutran <xen@neowutran.ovh>
To: Jan Beulich <jbeulich@suse.com>
Cc: Neowutran <xen@neowutran.ovh>, xen-devel@lists.xenproject.org, 
	Anthony Perard <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: hvmloader - allow_memory_relocate overlaps
Message-ID: <7lhrvh2ad46gjke5kvy4pbvrhstv7ihwm64suqrkle4v43tos6@oktohrjfupkc>
References: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
 <217649a9-8399-48d3-ba49-ae22cacf0d4b@suse.com>
 <lyqv62ezqqaybcfuhkvbhiltvnxyy32wzr36kclh7bzrupcvib@a5fpoe6atykl>
 <1c857c96-9f2d-4787-8804-799a63a00480@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c857c96-9f2d-4787-8804-799a63a00480@suse.com>

> > '''
> > 
> > And the associated result is: 
> > 
> > (d22) NEOWUTRAN pci.c: pci_mem_end: -67108864
> > (d22) NEOWUTRAN pci.c: pci_mem_start: -268435456
> > (d22) NEOWUTRAN pci.c: allow_memory_relocate: 0
> > (d22) NEOWUTRAN pci.c: 
 hvm_info->low_mem_pgend: 983040
> > (d22) NEOWUTRAN pci.c: HVM_LOADER would have tried to relocate guest memory
> > (d22) NEOWUTRAN pci.c: pci_mem_start: -268435456
> > 
> > So if "allow_memory_relocate" was not defined to 0, the hvmloader
> > would have tried to overlaps guest memory, and it seems that is
> > something that qemu_xen cannot handle.
> 
> Well, memory addresses printed in decimal are pretty hard to work with.
> But I'd like to ask anyway that you supply all of the log messages for
> such a guest starting, to be able to correlate what you've added with
> other items also logged.

Full logs with my patch to set allow-memory-relocate (https://github.com/neowutran/qubes-vmm-xen/commit/819705bc346cad14836fd523195ad2b0445330ac)
https://pastebin.com/9kQgvraK
(GPU passthrough work, hvmloader doesn't overlaps with guest memory)


Full logs without my patch to set allow-memory-relocate (https://github.com/neowutran/qubes-vmm-xen/blob/allowmemoryrelocate/ALLOWMEMORYRELOCATE.patch)
https://pastebin.com/g 
QGg55WZ
(GPU passthrough doesn't work, hvmloader overlaps with guest memory)

> 
> Jan

Thanks,
Neowutran
 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B7801B2B
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 08:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645998.1008574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Kf4-0005LM-AN; Sat, 02 Dec 2023 07:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645998.1008574; Sat, 02 Dec 2023 07:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Kf4-0005IL-7Z; Sat, 02 Dec 2023 07:43:38 +0000
Received: by outflank-mailman (input) for mailman id 645998;
 Sat, 02 Dec 2023 07:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vqrx=HN=neowutran.ovh=xen@srs-se1.protection.inumbo.net>)
 id 1r9Kf1-0005HP-UT
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 07:43:37 +0000
Received: from neowutran.ovh (core.neowutran.ovh [51.83.40.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e983cb1-90e6-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 08:43:34 +0100 (CET)
Received: from neowutran.ovh (unknown [10.200.200.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by neowutran.ovh (Postfix) with ESMTPSA id 9F15961318
 for <xen-devel@lists.xenproject.org>; Sat,  2 Dec 2023 07:43:31 +0000 (UTC)
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
X-Inumbo-ID: 7e983cb1-90e6-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=neowutran.ovh; s=mail;
	t=1701503011; bh=ypjsw/m7w54Gnddidu+YUxRN+sc6xfmWADGsmMjcbbQ=;
	h=Date:From:To:Subject;
	b=T42Yr1P46q1o0wNCSgpKZqJTKQhNo/EhTY27iiZls5C4677eICYuPvJvfr9J1hilG
	 rH8PiAVb5pLnk1QvGRAtYkOdxF/dTksSk/CGLRhbkr3Rae+/j+sGMebWSc7FLQLdMo
	 /IvUHYzm/+D0/SXjTMgCnn3RE6fODPfIMxj8zIbvqhWvjawqCwkI4bExLrJoJfQKmV
	 Z4LCBW4lLz7xmxUQIJIPW4eNBnlizJbxNJ2p63i6O8PrG9gm09pUrIgTj49/7x0LYa
	 xVCwpleauvOi9XMH8jTzV5Zt7i7poxBp4VX4X3S/F0n0aiR5oDxcsn6ld0GheR+nrH
	 JqLgDOjQi2DrISW/RHcE3v1xlpQuB5xL7p8Q13UB5xpScw4KEOBw1xOEUO5f1UqnY7
	 vAOVqiWU5DFaB579CwNZ+mYYhtdqJ1f0mADP5mP8kO8gQmHFe0KMMyFax9dPqW/V5V
	 aBcomjhgzmmReybdjlmiIvNb60B19LtGvQx9jvtzpvJQO7JyKpLS92JvBOc4swym1c
	 oSDJJ5Lprm4gxHcppYoWNOI07kPvzBwato96c2o7tsS4G26n/8iv/+d+R8kMypCcut
	 fKCJnEM+S4NAlGdySUb8it7z1NbT4F+pFIXvZf6VfYlq0Qc/tGkjBoFgUY6aWXM1w6
	 7WcITpBLTqt20rp0u/WorrvY=
Date: Sat, 2 Dec 2023 08:43:17 +0100
From: Neowutran <xen@neowutran.ovh>
To: xen-devel@lists.xenproject.org
Subject: hvmloader - pci - relevance of qemu-traditional workaround
Message-ID: <kcwnsmcrehmynvnzeotiywy74alteymojud4imzhox57gocpce@jkf35uyupmop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, 

In QubesOS I had the following issue 
(https://github.com/QubesOS/qubes-issues/issues/4321):

When I create a HVM and passthrough a GPU (pci device), it seems to
trash the memory of the guest and either prevent the HVM to be started
or prevent the GPU to be used. 

Looking more at the details, it is a memory corruption issue provoked
by the hvmloader of xen. 
This specific issue is well documented in the xen source code here: 

https://github.com/xen-project/xen/blob/master/tools/firmware/hvmloader/pci.c#L105

"
   /*
     * Do we allow hvmloader to relocate guest memory in order to
     * increase the size of the lowmem MMIO hole?  Defaulting to 1
     * here will 
 mean that non-libxl toolstacks (including xend and
     * home-grown ones) means that those using qemu-xen will still
     * experience the memory relocation bug described below; but it
     * also means that those using qemu-traditional will *not*
     * experience any change; and it also means that there is a
     * work-around for those using qemu-xen, namely switching to
     * qemu-traditional.
     *
     * If we defaulted to 0, and failing to resize the hole caused any
     * problems with qemu-traditional, then there is no work-around.
     *
     * Since xend can only use qemu-traditional, I think this is the
     * option that will have the least impact.
     */
    bool allow_memory_relocate = 1;
"

and the corruption happen here: 

https://github.com/xen-project/xen/blob/master/tools/firmware/hvmloader/pci.c#L355

"
        /*
         * At the moment qemu-xen can't deal with relocated memory regions.
         * It's too close to the release to make a proper fix; for now,
         * only allow t 
he MMIO hole to grow large enough to move guest memory
         * if we're running qemu-traditional.  Items that don't fit will be
         * relocated into the 64-bit address space.
         *
         * This loop now does the following:
         * - If allow_memory_relocate, increase the MMIO hole until it's
         *   big enough, or until it's 2GiB
         * - If !allow_memory_relocate, increase the MMIO hole until it's
         *   big enough, or until it's 2GiB, or until it overlaps guest
         *   memory
         */
        while ( (mmio_total > (pci_mem_end - pci_mem_start))
                && ((pci_mem_start << 1) != 0)
                && (allow_memory_relocate
                    || (((pci_mem_start << 1) >> PAGE_SHIFT)
                        >= hvm_info->low_mem_pgend)) )
            pci_mem_start <<= 1;
"

I wrote a small patch (https://github.com/QubesOS/qubes-vmm-xen/pull/172/files) 
to force the value of "allow_memory_relocate" to be 0.
It fixed the issue I was having, I saw no drawback, 
 so I am suggesting this patch to the QubesOS project. 

But I have some questions: 

- In the xen source code, the default value of "allow_memory_relocate" have been
defined to 1 for qemu-traditional support. As of today, should this default value still be "1" ? 

- Does something have changed regarding "At the moment qemu-xen can't deal with
relocated memory regions." ? / something else should be modified ?



Many thanks, 
Neowutran


 


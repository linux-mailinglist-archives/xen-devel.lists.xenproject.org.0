Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98788C7155
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 07:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722801.1127114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7TYm-0002nX-VU; Thu, 16 May 2024 05:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722801.1127114; Thu, 16 May 2024 05:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7TYm-0002lA-Sy; Thu, 16 May 2024 05:21:44 +0000
Received: by outflank-mailman (input) for mailman id 722801;
 Thu, 16 May 2024 05:21:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hlyC=MT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1s7TYl-0002l4-KM
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 05:21:43 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bd96466-1344-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 07:21:40 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.17.1) with ESMTPS id 44G5LMOX042847
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 16 May 2024 01:21:28 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 44G5LL92042846;
 Wed, 15 May 2024 22:21:21 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 2bd96466-1344-11ef-b4bb-af5377834399
Date: Wed, 15 May 2024 22:21:21 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Kelly Choi <kelly.choi@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <ZkWX0QgWRCQrlRv8@mattapan.m5p.com>
References: <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
 <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com>
 <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
 <ZkHTC4RpUSpKj4wf@macbook>
 <ZkJz9U2A/mVKnkjA@mattapan.m5p.com>
 <08503965-4ba9-4fe3-a176-895623f4ad92@suse.com>
 <ZkPO0D0/Jx4ZnRBO@mattapan.m5p.com>
 <CAO-mL=z=VsGx2Cimw7bW5bx8BBF+xfckEMBafCmqSi8GpFtdXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-mL=z=VsGx2Cimw7bW5bx8BBF+xfckEMBafCmqSi8GpFtdXw@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Wed, May 15, 2024 at 02:40:31PM +0100, Kelly Choi wrote:
> 
> As explained previously, we are happy to help resolve issues and provide
> advice where necessary. However, to do this, our developers need the
> relevant information to provide accurate resolutions. Given that our
> developers have repeatedly voiced their concerns, and are debugging this
> out of interest, please help us by providing all the necessary information.
> 
> Until we have this information, it will be very difficult to help you
> further. Should anything change, we would be glad to assist you.

Usually private submission of logs (PGP) is acceptable.

Note, I am not claiming Xen's `dmesg` contains truly concerning
information.  The issue is there is enough data for problematic
information to unintentionally leak in.  Alternatively no pieces would
be individually concerning, but all together information may leak.

Hopefully ACPI table addresses nor table order are effected by the
motherboard serial number, yet those could readily leak information.

So far this is acting like a major bug.  The paucity of reports is likely
due to few people using RAID1 with flash (most people relying greater
reliability even before the first large studies came out).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




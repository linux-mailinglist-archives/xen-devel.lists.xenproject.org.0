Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0465A3A9D78
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143265.264094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWQL-00023D-09; Wed, 16 Jun 2021 14:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143265.264094; Wed, 16 Jun 2021 14:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWQK-00020Z-Sm; Wed, 16 Jun 2021 14:21:44 +0000
Received: by outflank-mailman (input) for mailman id 143265;
 Wed, 16 Jun 2021 14:21:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QzdS=LK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ltWQJ-00020T-8J
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:21:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9b3c938-3dfe-4a50-a922-7f1ededa09f7;
 Wed, 16 Jun 2021 14:21:41 +0000 (UTC)
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
X-Inumbo-ID: f9b3c938-3dfe-4a50-a922-7f1ededa09f7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623853301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S6oR3vmD89E5yDMHzIIjiuiUjUWHabH851embpyzv9k=;
  b=Q6KLxEa0kMs/P7PsEj5Jqy3S/X2St79Q8z4GfEskBRqFycKUI/NBej9a
   jJ3ByH8q5TJ2h8QiDV0/4TXoG43+v3WUMhfY+K+q7fuaaZMK/0UZwsto7
   NxPQKV/sWb6x4SfRZ0YqVUS3m7G62OGRN9T2IEXV/2CrGj7gwMvBZerq8
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: J8SVoTDNiCQt5iq6TEd7SB3RNRjD6UJhe9Xwk9NOxhz5ymEPMBVkFnrGglOzzSNT6SDc2dU9BZ
 y+ODT/w+msq0VVmKVUX0X6lok/5itG4br+ZGd3gR0pNe4fisOPGd+vr5FS9vmaL40MTMlw+Crk
 10hpkdTLG+JK2HvdVL0aVzobbP2/r0RWt+BDLgAQxKw4wWlZAL0y5o75tzvXM9FkVv3Q+bWfBI
 Fo70DdYsRoym2q2inKSwCg32ZSuUUFAoHp14HfYnMigx/6QEh6MojC2KQA+LUavmSPvsd4Kgm1
 5xw=
X-SBRS: 5.1
X-MesageID: 46270533
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:f9QSPKtXIsM4kTw002QKuXdC7skDdNV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVcqKRUdcL+7VJVoLUmyyXcx2/h2AV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyIMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.83,278,1616472000"; 
   d="scan'208";a="46270533"
Date: Wed, 16 Jun 2021 15:21:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>,
	osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable test] 162845: regressions - FAIL
Message-ID: <YMoI8YZfOvogwOMY@perard>
References: <osstest-162845-mainreport@xen.org>
 <8e39ca8f-3202-7d3a-d65d-7087634bd49e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8e39ca8f-3202-7d3a-d65d-7087634bd49e@suse.com>

On Wed, Jun 16, 2021 at 09:12:52AM +0200, Jan Beulich wrote:
> On 16.06.2021 08:54, osstest service owner wrote:
> > flight 162845 xen-unstable real [real]
> > flight 162853 xen-unstable real-retest [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/162845/
> > http://logs.test-lab.xenproject.org/osstest/logs/162853/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-amd64-amd64-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs. 162533
> >  test-amd64-i386-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. vs. 162533
> 
> There looks to still be an issue with the ovmf version used. I'm
> puzzled to find this flight reporting
> 
> built_revision_ovmf	e1999b264f1f9d7230edf2448f757c73da567832
> 
> which isn't what the tree recently was rewound to, but about two
> dozen commits older. I hope one of you has a clue at what is going
> on here.

So this commit is "master" from https://xenbits.xen.org/git-http/ovmf.git
rather than "xen-tested-master" from https://xenbits.xen.org/git-http/osstest/ovmf.git

master is what xen.git would have cloned. And "xen-tested-master" is the
commit that I was expecting osstest to pick up, but maybe that as been
setup only for stable trees?

Anyway, after aad7b5c11d51 ("tools/firmware/ovmf: Use OvmfXen platform
file is exist"), it isn't the same OVMF that is been used. We used to
use OvmfX64, but now we are going to use OvmfXen. (Xen support in
OvmfX64 has been removed so can't be used anymore.)


So there is maybe an issue with OvmfXen which doesn't need to block
xen-unstable flights.


As for the failure, I can think of one thing in that is different,
OvmfXen maps the XENMAPSPACE_shared_info page as high as possible in the
guest physical memory, in order to avoid creating hole the RAM, but a
call to XENMEM_remove_from_physmap is done as well. Could that actually
cause issues with saverestore?

So maybe we can force-push in the mean time if tests with OVMF is the
only failure.

-- 
Anthony PERARD


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422BA343E1D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 11:39:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100129.190575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOHy0-0000qI-I6; Mon, 22 Mar 2021 10:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100129.190575; Mon, 22 Mar 2021 10:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOHy0-0000ps-Dg; Mon, 22 Mar 2021 10:39:24 +0000
Received: by outflank-mailman (input) for mailman id 100129;
 Mon, 22 Mar 2021 10:39:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOHxy-0000pm-Ch
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:39:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOHxy-0001JN-B8
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:39:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOHxy-0003Dc-AD
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:39:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOHxt-00084v-Ip; Mon, 22 Mar 2021 10:39:17 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=dTgu+ZmNB6jLiEXtr4zaPwKP0l7BuML/9AULT5g8M9c=; b=Yg+gV6JFoLNPL9bS09J5aDuIRO
	mO4AubrR7JQUhAfDh55y0utzRg/Drn14CNIud+p58eMCAasMGYYfeGXhRYE2/x//6LyEvwYkjvkZM
	jlDvUQBdECuzrT47hV7XkrhAvW+ec/M3PICYRNePA0gnNWal0qplO4aIh+Ur22Zri97M=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24664.29653.380819.75765@mariner.uk.xensource.com>
Date: Mon, 22 Mar 2021 10:39:17 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Peter Maydell <peter.maydell@linaro.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [qemu-mainline bisection] complete test-amd64-amd64-qemuu-freebsd11-amd64
In-Reply-To: <E1lO4NU-00060J-8v@osstest.test-lab.xenproject.org>
References: <E1lO4NU-00060J-8v@osstest.test-lab.xenproject.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

(CCing Peter FYI, not because I think there is anything wrong on the
qemu side here...)

Anthony, would you be able to look at this ?  I'm *hoping* we only
need to update our command line generation code in libxl.

With the Xen 4.15 freeze ongoing, whether such a change gets into 4.15
will depend on how big it is.

Thanks,
Ian.

osstest service owner writes ("[qemu-mainline bisection] complete test-amd64-amd64-qemuu-freebsd11-amd64"):
> branch xen-unstable
> xenbranch xen-unstable
> job test-amd64-amd64-qemuu-freebsd11-amd64
> testid guest-saverestore
> 
> Tree: linux git://xenbits.xen.org/linux-pvops.git
> Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://git.qemu.org/qemu.git
> Tree: seabios git://xenbits.xen.org/osstest/seabios.git
> Tree: xen git://xenbits.xen.org/xen.git
> 
> *** Found and reproduced problem changeset ***
> 
>   Bug is in tree:  qemuu git://git.qemu.org/qemu.git
>   Bug introduced:  1b507e55f8199eaad99744613823f6929e4d57c6
>   Bug not present: 4083904bc9fe5da580f7ca397b1e828fbc322732
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/160218/
> 
> 
>   commit 1b507e55f8199eaad99744613823f6929e4d57c6
>   Merge: 4083904bc9 8d17adf34f
>   Author: Peter Maydell <peter.maydell@linaro.org>
>   Date:   Thu Mar 18 19:00:49 2021 +0000
>   
>       Merge remote-tracking branch 'remotes/berrange-gitlab/tags/dep-many-pull-request' into staging
>       
>       Remove many old deprecated features
>       
>       The following features have been deprecated for well over the 2
>       release cycle we promise
>       
>         ``-drive file=json:{...{'driver':'file'}}`` (since 3.0)
>         ``-vnc acl`` (since 4.0.0)
>         ``-mon ...,control=readline,pretty=on|off`` (since 4.1)
>         ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
>         ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
>         ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
>         ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
>         ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (since 4.0)
>         ``query-cpus`` (since 2.12.0)
>         ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
>         ``query-events`` (since 4.0)
>         chardev client socket with ``wait`` option (since 4.0)
>         ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (since 4.0.0)
>         ``ide-drive`` (since 4.2)
>         ``scsi-disk`` (since 4.2)
...
> Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-qemuu-freebsd11-amd64.guest-saverestore.{dot,ps,png,html,svg}.
> ----------------------------------------
> 160218: tolerable ALL FAIL
> 
> flight 160218 qemu-mainline real-bisect [real]
> http://logs.test-lab.xenproject.org/osstest/logs/160218/
> 
> Failures :-/ but no regressions.
> 
> Tests which did not succeed,
> including tests which could not be run:
>  test-amd64-amd64-qemuu-freebsd11-amd64 16 guest-saverestore fail baseline untested
> 
> 
> jobs:
>  test-amd64-amd64-qemuu-freebsd11-amd64                       fail    


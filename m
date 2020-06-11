Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627951F70B0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 01:03:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjWDL-00005N-VN; Thu, 11 Jun 2020 23:02:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ccth=7Y=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jjWDK-00005I-SM
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 23:02:26 +0000
X-Inumbo-ID: 9d277dd4-ac37-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d277dd4-ac37-11ea-bb8b-bc764e2007e4;
 Thu, 11 Jun 2020 23:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S02b3gnOZY8utZsUIWA4HO9ZLITpsXR2fWdpdlYqrNc=; b=26cw5PYM3P4Zgs19VcYr5md02
 nJBKZgZE516z6l2yKEch8GJRtIBdp3YHjlYBi/yMpxDF0+uuOcmfSbdSjelF4FdB/5At/jSe2MP5F
 6QyHv3Ac3RwtAkZJJgxbPiTC2pAHDFrOPzao506UaTh1JaDRRLWgctFoH4/9AAnnJLHVY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jjWDI-0007f1-JS; Thu, 11 Jun 2020 23:02:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jjWDI-0003yS-5d; Thu, 11 Jun 2020 23:02:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jjWDI-0007QG-4t; Thu, 11 Jun 2020 23:02:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151024-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 151024: regressions - FAIL
X-Osstest-Failures: ovmf:build-i386-xsm:xen-build:fail:regression
X-Osstest-Versions-This: ovmf=e1d24410da356731da70b3334f86343e11e207d2
X-Osstest-Versions-That: ovmf=dafce295e6f447ed8905db4e29241e2c6c2a4389
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 11 Jun 2020 23:02:24 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 151024 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151024/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386-xsm                6 xen-build                fail REGR. vs. 150978

version targeted for testing:
 ovmf                 e1d24410da356731da70b3334f86343e11e207d2
baseline version:
 ovmf                 dafce295e6f447ed8905db4e29241e2c6c2a4389

Last test of basis   150978  2020-06-09 21:39:29 Z    2 days
Testing same since   151024  2020-06-10 19:57:12 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <abdul@marvell.com>
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Dong, Eric <eric.dong@intel.com>
  Eric Dong <eric.dong@intel.com>
  Heyi Guo <guoheyi@linux.alibaba.com>
  Laszlo Ersek <lersek@redhat.com>
  Walon Li <walon.li@hpe.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               fail    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Not pushing.

------------------------------------------------------------
commit e1d24410da356731da70b3334f86343e11e207d2
Author: Heyi Guo <guoheyi@linux.alibaba.com>
Date:   Tue Jun 9 09:26:30 2020 +0800

    ArmPkg/ArmExceptionLib: use static buffer for sp_el0
    
    The exception library is also used in DxeMain before memory services
    are available, and AllocatePages() will fail in this case and cause
    sp_el0 remains 0. Then if any exception occurs before CpuDxe driver is
    loaded, a recursive exception will be trigged by page translation
    fault for sp = 0 - 0x130.
    
    Use static buffer instead to fix this issue.
    
    Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
    Reviewed-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 14c7ed8b51f60097ad771277da69f74b22a7a759
Author: Laszlo Ersek <lersek@redhat.com>
Date:   Tue Jun 9 12:54:14 2020 +0200

    OvmfPkg/GenericQemuLoadImageLib: log "Not Found" at INFO level
    
    gBS->LoadImage() returning EFI_NOT_FOUND is an expected condition; it
    means that QEMU wasn't started with "-kernel". Log this status code as
    INFO rather than ERROR.
    
    Cc: Ard Biesheuvel <ard.biesheuvel@arm.com>
    Cc: Jordan Justen <jordan.l.justen@intel.com>
    Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
    Signed-off-by: Laszlo Ersek <lersek@redhat.com>
    Message-Id: <20200609105414.12474-1-lersek@redhat.com>
    Acked-by: Ard Biesheuvel <ard.biesheuvel@arm.com>

commit 365fdb0f939cf00b26d37f27adbf579aa984221b
Author: Walon Li <walon.li@hpe.com>
Date:   Wed May 20 12:24:47 2020 +0800

    MdeModulePkg/SetupBrowserDxe: Do not reconnect driver with form-update
    
    REF:https://bugzilla.tianocore.org/show_bug.cgi?id=2701
    
    Recording to the spec, the reconnect is activated upon exiting of the
    formset or the browser. Exiting is by user but form-browser internal
    logic. That means the reconnection is only happened when user press
    ESC or _EXIT action to exit form.
    Driver callback may update HII form dynamically so form-browser needs
    to refresh its internal data. It's not exiting formset for user
    exactly and they didn't know what happened. So use a flag to record
    that and do not reconnect driver if updated by callback.
    
    Signed-off-by: Walon Li <walon.li@hpe.com>
    Reviewed-by: Dandan Bi <dandan.bi@intel.com>

commit 8c91934019a7c10811d274d65210e9fdf36400cc
Author: Eric Dong <eric.dong@intel.com>
Date:   Wed Jun 10 11:38:26 2020 +0800

    Maintainers.txt: Add reviewer for Pei Core.
    
    Signed-off-by: Eric Dong <eric.dong@intel.com>
    Cc: Hao A Wu <hao.a.wu@intel.com>
    Cc: Debkumar De <debkumar.de@intel.com>
    Cc: Harry Han <harry.han@intel.com>
    Cc: Catharine West <catharine.west@intel.com>
    Acked-by: Laszlo Ersek <lersek@redhat.com>
    Reviewed-by: Ray Ni <ray.ni@Intel.com>

commit b7b3a5f99b1fe10d392e962424a2b488b1ff0804
Author: Dong, Eric <eric.dong@intel.com>
Date:   Wed Jun 3 11:18:05 2020 +0800

    Maintainers.txt: Add reviewer for SEC related modules.
    
    Signed-off-by: Eric Dong <eric.dong@intel.com>
    Cc: Debkumar De <debkumar.de@intel.com>
    Cc: Harry Han <harry.han@intel.com>
    Cc: Catharine West <catharine.west@intel.com>
    Acked-by: Laszlo Ersek <lersek@redhat.com>
    Reviewed-by: Ray Ni <ray.ni@Intel.com>

commit 5ebec96f282d30e0d225ece376f0060fd9a1c039
Author: Dong, Eric <eric.dong@intel.com>
Date:   Wed Jun 3 11:18:04 2020 +0800

    Maintainers.txt: Add reviewer for UefiCpuPkg.
    
    Signed-off-by: Eric Dong <eric.dong@intel.com>
    Reviewed-by: Ray Ni <ray.ni@intel.com>
    Cc: Laszlo Ersek <lersek@redhat.com>
    Cc: Rahul Kumar <rahul1.kumar@intel.com>

commit 4e3600b0388f6d4cce4dca544ac8226340836c23
Author: Eric Dong <eric.dong@intel.com>
Date:   Wed Jun 10 11:41:01 2020 +0800

    Maintainers.txt: Add reviewer for security boot modules.
    
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Chao Zhang <chao.b.zhang@intel.com>
    Cc: Min Xu <min.m.xu@intel.com>
    Signed-off-by: Eric Dong <eric.dong@intel.com>
    Reviewed-by: Jian J Wang <jian.j.wang@intel.com>

commit 3b18b80aff3db6c1775059183009427b73d52cea
Author: Dong, Eric <eric.dong@intel.com>
Date:   Wed Jun 3 11:18:02 2020 +0800

    Maintainers.txt: Add reviewers for Tcg related modules.
    
    Cc: Chao Zhang <chao.b.zhang@intel.com>
    Cc: Qi Zhang <qi1.zhang@intel.com>
    Cc: Rahul Kumar <rahul1.kumar@intel.com>
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Signed-off-by: Eric Dong <eric.dong@intel.com>
    Reviewed-by: Jian J Wang <jian.j.wang@intel.com>
    Acked-by: Laszlo Ersek <lersek@redhat.com>

commit 9b52b06f964226780b7047e10be0c1a65e223eb1
Author: Abdul Lateef Attar <abdul@marvell.com>
Date:   Mon Apr 20 15:05:55 2020 +0800

    MdeModulePkg: Sets the Cursor to selected BootOption.
    
    Its been observed that in MenuManagerMenuApp when user
    selects a different BootOption using Up/Down key, the
    current Cursor position is not chaning.
    Still points to the old BootOption.
    
    This changes first dispalys/redraws the old BootOption
    followed by new BootOption. Doing so will make current
    cursor pointing to the user selected BootOption.
    
    Signed-off-by: Abdul Lateef Attar <abdul@marvell.com>
    Reviewed-by: Dandan Bi <dandan.bi@intel.com>


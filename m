Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6521A19635B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 04:30:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI27B-00021E-Ad; Sat, 28 Mar 2020 03:26:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fYQ=5N=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jI279-000217-Vh
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 03:26:28 +0000
X-Inumbo-ID: e6d05d4a-70a3-11ea-8abd-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6d05d4a-70a3-11ea-8abd-12813bfff9fa;
 Sat, 28 Mar 2020 03:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0f+K457/+hpIrYpggylEIMy7le1U1RaOPvpjv3mRcQ=; b=264Y/HIMs6B9ssQ7nz3D5UehN
 t+ZxENF6WqXqhmqqQhJrWiLOGNFY9lCnNOLuEy9vlAV+IJFnOuXfC+mK0WT73A4mOZO2437oSTcvw
 eAz9HGTEPciitRKJ9WxoheUIGFwBP++Q9TPwfnhaBKflc9wqcs/HN8ddxNWkXaqfKA9QY=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jI276-0006lB-2b; Sat, 28 Mar 2020 03:26:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jI275-0003Cb-Pg; Sat, 28 Mar 2020 03:26:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jI275-000210-P7; Sat, 28 Mar 2020 03:26:23 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149072-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-Osstest-Failures: seabios:test-amd64-amd64-qemuu-nested-intel:debian-hvm-install/l1/l2:fail:regression
 seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
X-Osstest-Versions-This: seabios=de88a9628426e82f1cee4b61b06e67e6787301b1
X-Osstest-Versions-That: seabios=066a9956097b54530888b88ab9aa1ea02e42af5a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 28 Mar 2020 03:26:23 +0000
Subject: [Xen-devel] [seabios test] 149072: regressions - FAIL
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

flight 149072 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149072/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-qemuu-nested-intel 17 debian-hvm-install/l1/l2 fail REGR. vs. 148666

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 148666
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 148666
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 148666
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop      fail starved in 148666

version targeted for testing:
 seabios              de88a9628426e82f1cee4b61b06e67e6787301b1
baseline version:
 seabios              066a9956097b54530888b88ab9aa1ea02e42af5a

Last test of basis   148666  2020-03-17 13:39:45 Z   10 days
Failing since        148690  2020-03-18 06:43:59 Z    9 days   12 attempts
Testing same since   148794  2020-03-20 23:39:57 Z    7 days    8 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Matt DeVillier <matt.devillier@gmail.com>
  Paul Menzel <pmenzel@molgen.mpg.de>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-qemuu-nested-intel                          fail    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    


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
commit de88a9628426e82f1cee4b61b06e67e6787301b1
Author: Paul Menzel <pmenzel@molgen.mpg.de>
Date:   Wed Mar 4 14:51:27 2020 +0100

    std/tcg: Replace zero-length array with flexible-array member
    
    GCC 10 gives the warnings below:
    
        In file included from out/ccode32flat.o.tmp.c:54:
        ./src/tcgbios.c: In function 'tpm20_write_EfiSpecIdEventStruct':
        ./src/tcgbios.c:290:30: warning: array subscript '(<unknown>) + 4294967295' is outside the bounds of an interior zero-length array 'struct TCG_EfiSpecIdEventAlgorithmSize[0]' [-Wzero-length-bounds]
          290 |         event.hdr.digestSizes[count].algorithmId = be16_to_cpu(sel->hashAlg);
              |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
        In file included from ./src/tcgbios.c:22,
                         from out/ccode32flat.o.tmp.c:54:
        ./src/std/tcg.h:527:7: note: while referencing 'digestSizes'
          527 |     } digestSizes[0];
              |       ^~~~~~~~~~~
        In file included from out/ccode32flat.o.tmp.c:54:
        ./src/tcgbios.c:291:30: warning: array subscript '(<unknown>) + 4294967295' is outside the bounds of an interior zero-length array 'struct TCG_EfiSpecIdEventAlgorithmSize[0]' [-Wzero-length-bounds]
          291 |         event.hdr.digestSizes[count].digestSize = hsize;
              |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
        In file included from ./src/tcgbios.c:22,
                         from out/ccode32flat.o.tmp.c:54:
        ./src/std/tcg.h:527:7: note: while referencing 'digestSizes'
          527 |     } digestSizes[0];
              |       ^~~~~~~~~~~
    
    [Description copied from Gustavo A. R. Silva <gustavo@embeddedor.com>
    from his Linux kernel commits.]
    
    The current codebase makes use of the zero-length array language
    extension to the C90 standard, but the preferred mechanism to declare
    variable-length types such as these ones is a flexible array
    member [1][2], introduced in C99:
    
        struct foo {
                int stuff;
                struct boo array[];
        };
    
    By making use of the mechanism above, we will get a compiler warning
    in case the flexible array does not occur last in the structure, which
    will help us prevent some kind of undefined behavior bugs from being
    inadvertently introduced[3] to the codebase from now on.
    
    Also, notice that, dynamic memory allocations won't be affected by
    this change:
    
    "Flexible array members have incomplete type, and so the sizeof operator
    may not be applied. As a quirk of the original implementation of
    zero-length arrays, sizeof evaluates to zero."[1]
    
    This issue was found with the help of Coccinelle.
    
    [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
    [2] https://github.com/KSPP/linux/issues/21
    [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=76497732932f15e7323dc805e8ea8dc11bb587cf
    
    Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
    Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

commit bfdb3f86e9116fc79ce63c231373b084aad11218
Author: Matt DeVillier <matt.devillier@gmail.com>
Date:   Fri Aug 12 14:21:58 2016 -0500

    ps2port: adjust init routine to fix PS/2 keyboard issues
    
    PS/2 keyboards on Chromebooks with upstream coreboot + SeaBIOS often
    fail to init properly / register keystrokes.  Modify ps2port init
    to match that of TianoCore, which doesn't have said issues.
    
    Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
    Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
    Message-Id: <248435f9-c169-e1db-fc3e-62185b74899c@molgen.mpg.de>
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

commit 29ee1fb85cf07eaa38eba5df49b86419cacc205d
Author: Matt DeVillier <matt.devillier@gmail.com>
Date:   Fri Jun 13 17:20:23 2014 -0500

    Skip boot menu and timeout with only one boot device
    
    Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
    Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
    Message-Id: <45aa3ebe-b97c-f1af-2901-ec4e9bcd1084@molgen.mpg.de>
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>


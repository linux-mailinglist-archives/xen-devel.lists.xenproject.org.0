Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB91970384
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2024 20:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792353.1202251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smzru-0003ki-VV; Sat, 07 Sep 2024 18:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792353.1202251; Sat, 07 Sep 2024 18:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smzru-0003iY-Rl; Sat, 07 Sep 2024 18:09:06 +0000
Received: by outflank-mailman (input) for mailman id 792353;
 Sat, 07 Sep 2024 18:09:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smzrt-0003iO-Dh; Sat, 07 Sep 2024 18:09:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smzrt-0001Nk-3H; Sat, 07 Sep 2024 18:09:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1smzrs-0006RI-Ko; Sat, 07 Sep 2024 18:09:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1smzrs-0005A5-KF; Sat, 07 Sep 2024 18:09:04 +0000
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
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=yFrEuviIFdnpKdYZoInISKz9HHMn3+5IoubhJSWAWlA=; b=y88ILNPEtQPne6+XZAJzHSxzB7
	E94pCB16JmHgIgH/o3mTSl7dUnPrPYOa75DJewb8zMh/CMyZYw71HZSx3RGUwlBF0MEMnQ1ZLxkDP
	y8tr8ZFG13I2CAIYJLgQIoCDp7xivLlho219wTfWqZV8PXht55Zh392wNwsOOeJ+/GGg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187547-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 187547: regressions - FAIL
X-Osstest-Failures:
    libvirt:test-amd64-amd64-libvirt-xsm:guest-start:fail:regression
    libvirt:test-amd64-amd64-libvirt-pair:guest-start/debian:fail:regression
    libvirt:test-amd64-amd64-libvirt:guest-start:fail:regression
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:debian-hvm-install:fail:regression
    libvirt:test-amd64-amd64-libvirt-qcow2:debian-di-install:fail:regression
    libvirt:test-amd64-amd64-libvirt-vhd:debian-di-install:fail:regression
    libvirt:test-amd64-amd64-libvirt-raw:debian-di-install:fail:regression
    libvirt:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    libvirt:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    libvirt=ecffc91d0232ce7a5ee98b8026f2e41926dffe83
X-Osstest-Versions-That:
    libvirt=9b22c25548aa658acdeac2269ddae32584df32d8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 07 Sep 2024 18:09:04 +0000

flight 187547 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187547/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. vs. 187513
 test-amd64-amd64-libvirt-pair 25 guest-start/debian      fail REGR. vs. 187513
 test-amd64-amd64-libvirt     14 guest-start              fail REGR. vs. 187513
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 187513
 test-amd64-amd64-libvirt-qcow2 12 debian-di-install      fail REGR. vs. 187513
 test-amd64-amd64-libvirt-vhd 12 debian-di-install        fail REGR. vs. 187513
 test-amd64-amd64-libvirt-raw 12 debian-di-install        fail REGR. vs. 187513

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 187513
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass

version targeted for testing:
 libvirt              ecffc91d0232ce7a5ee98b8026f2e41926dffe83
baseline version:
 libvirt              9b22c25548aa658acdeac2269ddae32584df32d8

Last test of basis   187513  2024-09-06 04:20:37 Z    1 days
Testing same since   187547  2024-09-07 04:18:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andi Chandler <andi@gowling.com>
  Göran Uddeborg <goeran@uddeborg.se>
  Peter Krempa <pkrempa@redhat.com>
  Tim Wiederhake <twiederh@redhat.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           fail    
 test-amd64-amd64-libvirt-xsm                                 fail    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-libvirt                                     fail    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-libvirt-pair                                fail    
 test-amd64-amd64-libvirt-qcow2                               fail    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 fail    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-libvirt-vhd                                 fail    
 test-armhf-armhf-libvirt-vhd                                 pass    


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
commit ecffc91d0232ce7a5ee98b8026f2e41926dffe83
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Fri Sep 6 14:42:25 2024 +0200

    qemuBackupDiskDataCleanupOne: Don't skip rest of cleanup if we can't enter monitor
    
    Recent fix to use the proper 'async' monitor function would cause
    libvirt to leak some of the objects it's supposed to clean up in other
    places besides qemu.
    
    Don't skip the whole function on failure to enter the job but just the
    monitor section.
    
    Fixes: 9b22c25548aa658acdeac2269ddae32584df32d8
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 8666523b7d0891c38a7c9c138c4cc318eddfefeb
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Fri Sep 6 14:29:18 2024 +0200

    virconf: Fix numeric overflow when parsing numbers in conf files
    
    The number is parsed manually without making sure it'll fit.
    
    Fixes: 3bbac7cdb67
    Closes: https://gitlab.com/libvirt/libvirt/-/issues/671
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 5d77061d7e65e9cb7de4e9f28c2b7a69822da82f
Author: Peter Krempa <pkrempa@redhat.com>
Date:   Fri Sep 6 14:02:31 2024 +0200

    conf: Don't overwrite KVM feature config struct if the feature is present twice
    
    Don't allocate the struct if it exists already. This sidesteps the
    discussion about whether forbidding multiple feature definitions makes
    sense.
    
    Fixes: a8e0f9c682143c63897de5c379d3ac3791c51970
    Closes: https://gitlab.com/libvirt/libvirt/-/issues/670
    Signed-off-by: Peter Krempa <pkrempa@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 3afbb1644c4f9d5237459bd544d0f511ff99eb80
Author: Tim Wiederhake <twiederh@redhat.com>
Date:   Mon Aug 26 11:58:26 2024 +0200

    cpu_map: Add SierraForest CPU model
    
    This was added in qemu commit 6e82d3b6220777667968a04c87e1667f164ebe88.
    
    Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 6ac72ea6ddd64d845af90a9feb590fbc6cd4e054
Author: Tim Wiederhake <twiederh@redhat.com>
Date:   Mon Aug 26 11:52:35 2024 +0200

    cpu_map: Add missing feature "avx-vnni-int16"
    
    Introduced in qemu commit 138c3377a9b27accec516b2c0da90dedef98a780.
    
    Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
    Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

commit 4d3a2c61a39f7ca88b930a9e7187289694dfb91e
Author: Göran Uddeborg <goeran@uddeborg.se>
Date:   Wed Sep 4 19:57:12 2024 +0000

    Translated using Weblate (Swedish)
    
    Currently translated at 85.5% (9005 of 10521 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/sv/
    
    Signed-off-by: Göran Uddeborg <goeran@uddeborg.se>

commit be183218ed09bd77c6f0b9d2d81cd5e6ba8c56e6
Author: Andi Chandler <andi@gowling.com>
Date:   Wed Sep 4 22:16:20 2024 +0000

    Translated using Weblate (English (United Kingdom))
    
    Currently translated at 48.9% (5147 of 10521 strings)
    
    Translation: libvirt/libvirt
    Translate-URL: https://translate.fedoraproject.org/projects/libvirt/libvirt/en_GB/
    
    Signed-off-by: Andi Chandler <andi@gowling.com>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC861E5D89
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 12:57:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeGCX-0003ez-4T; Thu, 28 May 2020 10:55:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1kI=7K=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jeGCV-0003eu-EF
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 10:55:51 +0000
X-Inumbo-ID: c6ed72e8-a0d1-11ea-8993-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6ed72e8-a0d1-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v6m8frk5lRpk1+uIcIit3OXenXrRV6Wa6MLpIZKRVNI=; b=XaMrjNO51x32okc7AAPca5cT4
 dVJ966xEiT1n7E/6txKmtN7/Z/jiWi2rbDAnga4BjZL1zaYH8kREcq0WjefAHi7SJEN2Af36LxyM1
 lxruVFztOUm8ow3CaXczzcd4fG3u5D2RKFVgdJYycixq+z5i+JrWN3dkxEpOuNRBoO8Kc=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jeGCN-00011B-95; Thu, 28 May 2020 10:55:43 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jeGCN-0005r5-1S; Thu, 28 May 2020 10:55:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jeGCM-00023E-Vg; Thu, 28 May 2020 10:55:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150413-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150413: regressions - trouble: fail/pass/starved
X-Osstest-Failures: linux-linus:test-amd64-amd64-examine:memdisk-try-append:fail:regression
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: linux=b0c3ba31be3e45a130e13b278cf3b90f69bda6f6
X-Osstest-Versions-That: linux=444fc5cde64330661bf59944c43844e7d4c2ccd8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 28 May 2020 10:55:43 +0000
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

flight 150413 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150413/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 150390

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150390
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150390
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150390
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150390
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150390
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 150390
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150390
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150390
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx  2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                b0c3ba31be3e45a130e13b278cf3b90f69bda6f6
baseline version:
 linux                444fc5cde64330661bf59944c43844e7d4c2ccd8

Last test of basis   150390  2020-05-27 00:39:33 Z    1 days
Testing same since   150413  2020-05-27 18:39:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Eric W. Biederman" <ebiederm@xmission.com>
  Amir Goldstein <amir73il@gmail.com>
  Daniel Xu <dxu@dxuuu.xyz>
  Eric W. Biederman <ebiederm@xmission.com>
  Jan Kara <jack@suse.cz>
  Linus Torvalds <torvalds@linux-foundation.org>
  Odin Ugedal <odin@ugedal.com>
  Roman Gushchin <guro@fb.com>
  Tejun Heo <tj@kernel.org>

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
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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
commit b0c3ba31be3e45a130e13b278cf3b90f69bda6f6
Merge: 3301f6ae2d4c f17936993af0
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed May 27 11:03:24 2020 -0700

    Merge tag 'fsnotify_for_v5.7-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs
    
    Pull fanotify FAN_DIR_MODIFY disabling from Jan Kara:
     "A single patch that disables FAN_DIR_MODIFY support that was merged in
      this merge window.
    
      When discussing further functionality we realized it may be more
      logical to guard it with a feature flag or to call things slightly
      differently (or maybe not) so let's not set the API in stone for now."
    
    * tag 'fsnotify_for_v5.7-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs:
      fanotify: turn off support for FAN_DIR_MODIFY

commit 3301f6ae2d4cb396ae0c103329a5680d14f7a5c6
Merge: 006f38a1c3dc eec8fd0277e3
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed May 27 10:58:19 2020 -0700

    Merge branch 'for-5.7-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup
    
    Pull cgroup fixes from Tejun Heo:
    
     - Reverted stricter synchronization for cgroup recursive stats which
       was prepping it for event counter usage which never got merged. The
       change was causing performation regressions in some cases.
    
     - Restore bpf-based device-cgroup operation even when cgroup1 device
       cgroup is disabled.
    
     - An out-param init fix.
    
    * 'for-5.7-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup:
      device_cgroup: Cleanup cgroup eBPF device filter code
      xattr: fix uninitialized out-param
      Revert "cgroup: Add memory barriers to plug cgroup_rstat_updated() race window"

commit f17936993af054b16725d0c54baa58115f9e052a
Author: Amir Goldstein <amir73il@gmail.com>
Date:   Wed May 27 15:54:55 2020 +0300

    fanotify: turn off support for FAN_DIR_MODIFY
    
    FAN_DIR_MODIFY has been enabled by commit 44d705b0370b ("fanotify:
    report name info for FAN_DIR_MODIFY event") in 5.7-rc1. Now we are
    planning further extensions to the fanotify API and during that we
    realized that FAN_DIR_MODIFY may behave slightly differently to be more
    consistent with extensions we plan. So until we finalize these
    extensions, let's not bind our hands with exposing FAN_DIR_MODIFY to
    userland.
    
    Signed-off-by: Amir Goldstein <amir73il@gmail.com>
    Signed-off-by: Jan Kara <jack@suse.cz>

commit 006f38a1c3dcbe237a75e725fe457bd59cb489c4
Merge: 444fc5cde643 a4ae32c71fe9
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed May 27 09:53:25 2020 -0700

    Merge branch 'exec-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace
    
    Pull execve fix from Eric Biederman:
     "While working on my exec cleanups I found a bug in exec that winds up
      miscomputing the ambient credentials during exec. Andy appears to have
      to been confused as to why credentials are computed for both the
      script and the interpreter
    
      From the original patch description:
    
       [3] Linux very confusingly processes both the script and the
           interpreter if applicable, for reasons that elude me. The results
           from thinking about a script's file capabilities and/or setuid
           bits are mostly discarded.
    
      The only value in struct cred that gets changed in cap_bprm_set_creds
      that I could find that might persist between the script and the
      interpreter was cap_ambient. Which is fixed with this trivial change"
    
    * 'exec-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace:
      exec: Always set cap_ambient in cap_bprm_set_creds

commit a4ae32c71fe90794127b32d26d7ad795813b502e
Author: Eric W. Biederman <ebiederm@xmission.com>
Date:   Mon May 25 12:56:15 2020 -0500

    exec: Always set cap_ambient in cap_bprm_set_creds
    
    An invariant of cap_bprm_set_creds is that every field in the new cred
    structure that cap_bprm_set_creds might set, needs to be set every
    time to ensure the fields does not get a stale value.
    
    The field cap_ambient is not set every time cap_bprm_set_creds is
    called, which means that if there is a suid or sgid script with an
    interpreter that has neither the suid nor the sgid bits set the
    interpreter should be able to accept ambient credentials.
    Unfortuantely because cap_ambient is not reset to it's original value
    the interpreter can not accept ambient credentials.
    
    Given that the ambient capability set is expected to be controlled by
    the caller, I don't think this is particularly serious.  But it is
    definitely worth fixing so the code works correctly.
    
    I have tested to verify my reading of the code is correct and the
    interpreter of a sgid can receive ambient capabilities with this
    change and cannot receive ambient capabilities without this change.
    
    Cc: stable@vger.kernel.org
    Cc: Andy Lutomirski <luto@kernel.org>
    Fixes: 58319057b784 ("capabilities: ambient capabilities")
    Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

commit eec8fd0277e37cf447b88c6be181e81df867bcf1
Author: Odin Ugedal <odin@ugedal.com>
Date:   Fri Apr 3 19:55:28 2020 +0200

    device_cgroup: Cleanup cgroup eBPF device filter code
    
    Original cgroup v2 eBPF code for filtering device access made it
    possible to compile with CONFIG_CGROUP_DEVICE=n and still use the eBPF
    filtering. Change
    commit 4b7d4d453fc4 ("device_cgroup: Export devcgroup_check_permission")
    reverted this, making it required to set it to y.
    
    Since the device filtering (and all the docs) for cgroup v2 is no longer
    a "device controller" like it was in v1, someone might compile their
    kernel with CONFIG_CGROUP_DEVICE=n. Then (for linux 5.5+) the eBPF
    filter will not be invoked, and all processes will be allowed access
    to all devices, no matter what the eBPF filter says.
    
    Signed-off-by: Odin Ugedal <odin@ugedal.com>
    Acked-by: Roman Gushchin <guro@fb.com>
    Signed-off-by: Tejun Heo <tj@kernel.org>

commit 772b3140669246e1ab32392c490d338e2eb7b803
Author: Daniel Xu <dxu@dxuuu.xyz>
Date:   Wed Apr 8 23:27:29 2020 -0700

    xattr: fix uninitialized out-param
    
    `removed_sized` isn't correctly initialized (as the doc comment
    suggests) on memory allocation failures. Fix by moving initialization up
    a bit.
    
    Fixes: 0c47383ba3bd ("kernfs: Add option to enable user xattrs")
    Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
    Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
    Signed-off-by: Tejun Heo <tj@kernel.org>

commit d8ef4b38cb69d907f9b0e889c44d05fc0f890977
Author: Tejun Heo <tj@kernel.org>
Date:   Thu Apr 9 14:55:35 2020 -0400

    Revert "cgroup: Add memory barriers to plug cgroup_rstat_updated() race window"
    
    This reverts commit 9a9e97b2f1f2 ("cgroup: Add memory barriers to plug
    cgroup_rstat_updated() race window").
    
    The commit was added in anticipation of memcg rstat conversion which needed
    synchronous accounting for the event counters (e.g. oom kill count). However,
    the conversion didn't get merged due to percpu memory overhead concern which
    couldn't be addressed at the time.
    
    Unfortunately, the patch's addition of smp_mb() to cgroup_rstat_updated()
    meant that every scheduling event now had to go through an additional full
    barrier and Mel Gorman noticed it as 1% regression in netperf UDP_STREAM test.
    
    There's no need to have this barrier in tree now and even if we need
    synchronous accounting in the future, the right thing to do is separating that
    out to a separate function so that hot paths which don't care about
    synchronous behavior don't have to pay the overhead of the full barrier. Let's
    revert.
    
    Signed-off-by: Tejun Heo <tj@kernel.org>
    Reported-by: Mel Gorman <mgorman@techsingularity.net>
    Link: http://lkml.kernel.org/r/20200409154413.GK3818@techsingularity.net
    Cc: v4.18+


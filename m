Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFEE1B5DCE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 16:31:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRcsC-00079a-PR; Thu, 23 Apr 2020 14:30:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HETR=6H=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jRcsB-00079V-7g
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 14:30:39 +0000
X-Inumbo-ID: fc52667e-856e-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc52667e-856e-11ea-83d8-bc764e2007e4;
 Thu, 23 Apr 2020 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RN0XykwGYCvBg86UKe5NMMxk6IX19GvSYRjJAQlBg14=; b=cmT8O2ll5vzwN5nLqkOuqqiwx
 ChbRL2sXeql0vZX8CMevidOAe8H2aNefu0WbIgSZnMfW6ZfSuq2ZaVzddUbnEJNHhQbISXG+KeSyX
 LbnRMg3Fgc/StHhPF42mksGj/wObf46sMOpDuQPBpWjSKxbswiGIYIqonQqp4geZ4mBfA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRcs3-0005YW-AI; Thu, 23 Apr 2020 14:30:31 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jRcs2-0006cR-Mw; Thu, 23 Apr 2020 14:30:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jRcs2-0004cT-LY; Thu, 23 Apr 2020 14:30:30 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149743-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 149743: regressions - trouble: fail/pass/starved
X-Osstest-Failures: linux-linus:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:guest-start/debianhvm.repeat:fail:regression
 linux-linus:test-amd64-amd64-xl-rtds:guest-saverestore.2:fail:allowable
 linux-linus:test-armhf-armhf-xl-rtds:guest-start:fail:allowable
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-coresched-i386-xl:hosts-allocate:starved:nonblocking
 linux-linus:test-amd64-coresched-amd64-xl:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This: linux=c578ddb39e565139897124e74e5a43e56538cb33
X-Osstest-Versions-That: linux=18bf34080c4c3beb6699181986cc97dd712498fe
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Apr 2020 14:30:30 +0000
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

flight 149743 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149743/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 12 guest-start/debianhvm.repeat fail REGR. vs. 149731

Regressions which are regarded as allowable (not blocking):
 test-amd64-amd64-xl-rtds     17 guest-saverestore.2      fail REGR. vs. 149731
 test-armhf-armhf-xl-rtds     12 guest-start              fail REGR. vs. 149731

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 149731
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 149731
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 149731
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 149731
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 149731
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 149731
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 149731
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 149731
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-vhd      12 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      13 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-coresched-i386-xl  2 hosts-allocate               starved  n/a
 test-amd64-coresched-amd64-xl  2 hosts-allocate               starved  n/a

version targeted for testing:
 linux                c578ddb39e565139897124e74e5a43e56538cb33
baseline version:
 linux                18bf34080c4c3beb6699181986cc97dd712498fe

Last test of basis   149731  2020-04-22 04:00:57 Z    1 days
Testing same since   149743  2020-04-23 03:15:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrea Righi <andrea.righi@canonical.com>
  Colin Ian King <colin.king@canonical.com>
  Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
  Kees Cook <keescook@chromium.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Michael Ellerman <mpe@ellerman.id.au>
  Sandipan Das <sandipan@linux.ibm.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
  Tyler Hicks <tyhicks@linux.microsoft.com>
  Xiao Yang <yangx.jy@cn.fujitsu.com>

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
 test-amd64-coresched-amd64-xl                                starved 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 starved 
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
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail    
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
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     fail    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
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
commit c578ddb39e565139897124e74e5a43e56538cb33
Merge: 18bf34080c4c b87080eab4c1
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Apr 22 10:47:49 2020 -0700

    Merge tag 'linux-kselftest-5.7-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
    
    Pull kselftest fixes from Shuah Khan:
     "This consists of fixes to runner scripts and individual test run-time
      bugs. Includes fixes to tpm2 and memfd test run-time regressions"
    
    * tag 'linux-kselftest-5.7-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest:
      selftests/ipc: Fix test failure seen after initial test run
      Revert "Kernel selftests: tpm2: check for tpm support"
      selftests/ftrace: Add CONFIG_SAMPLE_FTRACE_DIRECT=m kconfig
      selftests/seccomp: allow clock_nanosleep instead of nanosleep
      kselftest/runner: allow to properly deliver signals to tests
      selftests/harness: fix spelling mistake "SIGARLM" -> "SIGALRM"
      selftests: Fix memfd test run-time regression
      selftests: vm: Fix 64-bit test builds for powerpc64le
      selftests: vm: Do not override definition of ARCH

commit b87080eab4c1377706c113fc9c0157f19ea8fed1
Author: Tyler Hicks <tyhicks@linux.microsoft.com>
Date:   Mon Apr 13 15:21:45 2020 -0500

    selftests/ipc: Fix test failure seen after initial test run
    
    After successfully running the IPC msgque test once, subsequent runs
    result in a test failure:
    
      $ sudo ./run_kselftest.sh
      TAP version 13
      1..1
      # selftests: ipc: msgque
      # Failed to get stats for IPC queue with id 0
      # Failed to dump queue: -22
      # Bail out!
      # # Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
      not ok 1 selftests: ipc: msgque # exit=1
    
    The dump_queue() function loops through the possible message queue index
    values using calls to msgctl(kern_id, MSG_STAT, ...) where kern_id
    represents the index value. The first time the test is ran, the initial
    index value of 0 is valid and the test is able to complete. The index
    value of 0 is not valid in subsequent test runs and the loop attempts to
    try index values of 1, 2, 3, and so on until a valid index value is
    found that corresponds to the message queue created earlier in the test.
    
    The msgctl() syscall returns -1 and sets errno to EINVAL when invalid
    index values are used. The test failure is caused by incorrectly
    comparing errno to -EINVAL when cycling through possible index values.
    
    Fix invalid test failures on subsequent runs of the msgque test by
    correctly comparing errno values to a non-negated EINVAL.
    
    Fixes: 3a665531a3b7 ("selftests: IPC message queue copy feature test")
    Signed-off-by: Tyler Hicks <tyhicks@linux.microsoft.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit aaa2d92efe1f972567f1691b423ab8dc606ab3a9
Author: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date:   Sun Apr 12 17:23:07 2020 +0300

    Revert "Kernel selftests: tpm2: check for tpm support"
    
    This reverts commit b32694cd0724d4ceca2c62cc7c3d3a8d1ffa11fc.
    
    The original comment was neither reviewed nor tested. Thus, this the
    *only* possible action to take.
    
    Cc: Nikita Sobolev <Nikita.Sobolev@synopsys.com>
    Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit cdfe56d9012bcff266880177c4c7caf9821f63b0
Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
Date:   Sun Apr 5 09:44:57 2020 +0800

    selftests/ftrace: Add CONFIG_SAMPLE_FTRACE_DIRECT=m kconfig
    
    ftrace-direct.tc and kprobe-direct.tc require CONFIG_SAMPLE_FTRACE_DIRECT=m
    so add it to config file which is used by merge_config.sh.
    
    Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
    Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit d42b8dbec46c08c6bd3f9d264127bd4910581c07
Author: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Date:   Wed Apr 8 20:57:53 2020 -0300

    selftests/seccomp: allow clock_nanosleep instead of nanosleep
    
    glibc 2.31 calls clock_nanosleep when its nanosleep function is used. So
    the restart_syscall fails after that. In order to deal with it, we trace
    clock_nanosleep and nanosleep. Then we check for either.
    
    This works just fine on systems with both glibc 2.30 and glibc 2.31,
    whereas it failed before on a system with glibc 2.31.
    
    Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
    Acked-by: Kees Cook <keescook@chromium.org>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit 651e0d881461ab2b1cd5cbec3a642d22fc8d6057
Author: Andrea Righi <andrea.righi@canonical.com>
Date:   Fri Apr 10 12:02:59 2020 +0200

    kselftest/runner: allow to properly deliver signals to tests
    
    While running seccomp_bpf, kill_after_ptrace() gets stuck if we run it
    via /usr/bin/timeout (that is the default), until the timeout expires.
    
    This is because /usr/bin/timeout is preventing to properly deliver
    signals to ptrace'd children (SIGSYS in this case).
    
    This problem can be easily reproduced by running:
    
     $ sudo make TARGETS=seccomp kselftest
     ...
    
     # [ RUN      ] TRACE_syscall.skip_a#
     not ok 1 selftests: seccomp: seccomp_bpf # TIMEOUT
    
    The test is hanging at this point until the timeout expires and then it
    reports the timeout error.
    
    Prevent this problem by passing --foreground to /usr/bin/timeout,
    allowing to properly deliver signals to children processes.
    
    Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
    Acked-by: Kees Cook <keescook@chromium.org>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit d925c896956283cf12634c4223f62ad2c080da29
Author: Colin Ian King <colin.king@canonical.com>
Date:   Fri Mar 27 09:06:48 2020 +0000

    selftests/harness: fix spelling mistake "SIGARLM" -> "SIGALRM"
    
    There a few identical spelling mistakes, fix these.
    
    Signed-off-by: Colin Ian King <colin.king@canonical.com>
    Acked-by: Kees Cook <keescook@chromium.org>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit ffa773e1011d57550e3bf9aea98468c1c4bea552
Author: Shuah Khan <skhan@linuxfoundation.org>
Date:   Tue Apr 7 16:44:46 2020 -0600

    selftests: Fix memfd test run-time regression
    
    Commit d3fd949abd3e ("selftests: Fix memfd to support relocatable
    build (O=objdir)") introduced regression run-time regression with
    a change to include programs that should be run from shell scripts
    to list of programs that run as independent tests. This fix restores
    the original designation.
    
    Fixes: d3fd949abd3e ("selftests: Fix memfd to support relocatable build (O=objdir)")
    Reported-by: kernel test robot <rong.a.chen@intel.com>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit 963e3e9c9a127013eb4d3c82eb997068b1adbb89
Author: Sandipan Das <sandipan@linux.ibm.com>
Date:   Thu Jan 30 12:31:19 2020 +0530

    selftests: vm: Fix 64-bit test builds for powerpc64le
    
    Some tests are built only for 64-bit systems. This makes
    sure that these tests are built for both big and little
    endian variants of powerpc64.
    
    Fixes: 7549b3364201 ("selftests: vm: Build/Run 64bit tests only on 64bit arch")
    Reviewed-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
    Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
    Tested-by: Michael Ellerman <mpe@ellerman.id.au>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

commit 24c3f063c57b2a8ae21b259bcfa7690e2eb56dd9
Author: Sandipan Das <sandipan@linux.ibm.com>
Date:   Thu Jan 30 12:31:18 2020 +0530

    selftests: vm: Do not override definition of ARCH
    
    Independent builds of the vm selftests is currently broken because
    commit 7549b3364201 ("selftests: vm: Build/Run 64bit tests only on
    64bit arch") overrides the value of ARCH with the machine name from
    uname. This does not always match the architecture names used for
    tasks like header installation.
    
    E.g. for building tests on powerpc64, we need ARCH=powerpc
    and not ARCH=ppc64 or ARCH=ppc64le. Otherwise, the build
    fails as shown below.
    
      $ uname -m
      ppc64le
    
      $ make -C tools/testing/selftests/vm
      make: Entering directory '/home/sandipan/linux/tools/testing/selftests/vm'
      make --no-builtin-rules ARCH=ppc64le -C ../../../.. headers_install
      make[1]: Entering directory '/home/sandipan/linux'
      Makefile:653: arch/ppc64le/Makefile: No such file or directory
      make[1]: *** No rule to make target 'arch/ppc64le/Makefile'.  Stop.
      make[1]: Leaving directory '/home/sandipan/linux'
      ../lib.mk:50: recipe for target 'khdr' failed
      make: *** [khdr] Error 2
      make: Leaving directory '/home/sandipan/linux/tools/testing/selftests/vm'
    
    Fixes: 7549b3364201 ("selftests: vm: Build/Run 64bit tests only on 64bit arch")
    Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
    Tested-by: Michael Ellerman <mpe@ellerman.id.au>
    Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>


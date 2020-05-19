Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB2A1D95F3
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 14:10:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb13x-0007Tn-GH; Tue, 19 May 2020 12:09:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYyw=7B=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jb13w-0007Ti-HS
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 12:09:36 +0000
X-Inumbo-ID: 99a8224c-99c9-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99a8224c-99c9-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 12:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L1W5syRR6b60PCqhz8A2PE2HG3YmQQ8f/SfXEAD3YCU=; b=Nkz4p/DNjy9LiQh9eAxQTJyoo
 0fNdiWGeHtQVwYJ6ceZDs3QSbiOOqfIlj3WCdxZ6WpzlBg71wNeSof62hGGWbKAFjt0lRR+8fcsVB
 UUPnVS+7ADlwL9Xmie6pe+2XO1SLqiS8rpjSDNWnaXiP7v/rl15zRN6UR1hewnSkRq5ao=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jb13s-0007u7-Vm; Tue, 19 May 2020 12:09:33 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jb13s-0002db-KP; Tue, 19 May 2020 12:09:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jb13s-00043G-Jr; Tue, 19 May 2020 12:09:32 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-150236-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 150236: regressions - FAIL
X-Osstest-Failures: linux-linus:test-armhf-armhf-xl-vhd:guest-start:fail:regression
 linux-linus:test-amd64-amd64-xl-rtds:guest-localmigrate/x10:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
 linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
 linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This: linux=642b151f45dd54809ea00ecd3976a56c1ec9b53d
X-Osstest-Versions-That: linux=b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 May 2020 12:09:32 +0000
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

flight 150236 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/150236/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-vhd      11 guest-start              fail REGR. vs. 150230

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-rtds     18 guest-localmigrate/x10       fail  like 150230
 test-amd64-amd64-xl-qemut-win7-amd64 17 guest-stop            fail like 150230
 test-armhf-armhf-libvirt     14 saverestore-support-check    fail  like 150230
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 150230
 test-amd64-amd64-xl-qemut-ws16-amd64 17 guest-stop            fail like 150230
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 150230
 test-amd64-i386-xl-qemut-win7-amd64 17 guest-stop             fail like 150230
 test-armhf-armhf-libvirt-raw 13 saverestore-support-check    fail  like 150230
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 150230
 test-amd64-i386-xl-pvshim    12 guest-start                  fail   never pass
 test-arm64-arm64-xl-seattle  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      13 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  13 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass
 test-arm64-arm64-xl-xsm      13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  14 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 13 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 14 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 13 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  14 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 12 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 13 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 14 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 13 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 14 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          14 saverestore-support-check    fail   never pass
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop              fail never pass
 test-amd64-i386-xl-qemut-ws16-amd64 17 guest-stop              fail never pass
 test-armhf-armhf-xl-credit1  13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  14 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     13 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     14 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 12 migrate-support-check        fail   never pass

version targeted for testing:
 linux                642b151f45dd54809ea00ecd3976a56c1ec9b53d
baseline version:
 linux                b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce

Last test of basis   150230  2020-05-18 09:16:04 Z    1 days
Testing same since   150236  2020-05-18 20:40:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dan Carpenter <dan.carpenter@oracle.com>
  David Howells <dhowells@redhat.com>
  Eric Sandeen <sandeen@sandeen.net>
  Krzysztof Struczynski <krzysztof.struczynski@huawei.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Namjae Jeon <namjae.jeon@samsung.com>
  Paul E. McKenney <paulmck@kernel.org> (RCU viewpoint)
  Roberto Sassu <roberto.sassu@huawei.com>
  Wei Yongjun <weiyongjun1@huawei.com>

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
 test-amd64-amd64-xl-rtds                                     fail    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      fail    


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
commit 642b151f45dd54809ea00ecd3976a56c1ec9b53d
Merge: 45088963ca9c 843385694721
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon May 18 11:29:21 2020 -0700

    Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity
    
    Pull integrity fixes from Mimi Zohar:
     "A couple of miscellaneous bug fixes for the integrity subsystem:
    
      IMA:
    
       - Properly modify the open flags in order to calculate the file hash.
    
       - On systems requiring the IMA policy to be signed, the policy is
         loaded differently. Don't differentiate between "enforce" and
         either "log" or "fix" modes how the policy is loaded.
    
      EVM:
    
       - Two patches to fix an EVM race condition, normally the result of
         attempting to load an unsupported hash algorithm.
    
       - Use the lockless RCU version for walking an append only list"
    
    * 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity:
      evm: Fix a small race in init_desc()
      evm: Fix RCU list related warnings
      ima: Fix return value of ima_write_policy()
      evm: Check also if *tfm is an error pointer in init_desc()
      ima: Set file->f_mode instead of file->f_flags in ima_calc_file_hash()

commit 45088963ca9cdc3df50dd7b1b63e1dc9dcc6375e
Merge: 9d1be4f4dc5f 94182167ec73
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon May 18 10:33:13 2020 -0700

    Merge tag 'for-5.7-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat
    
    Pull exfat fixes from Namjae Jeon:
    
     - Fix potential memory leak in exfat_find
    
     - Set exfat's splice_write to iter_file_splice_write to fix a splice
       failure on direct-opened files
    
    * tag 'for-5.7-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat:
      exfat: fix possible memory leak in exfat_find()
      exfat: use iter_file_splice_write

commit 9d1be4f4dc5ff1c66c86acfd2c35765d9e3776b3
Author: David Howells <dhowells@redhat.com>
Date:   Sun May 17 21:21:05 2020 +0100

    afs: Don't unlock fetched data pages until the op completes successfully
    
    Don't call req->page_done() on each page as we finish filling it with
    the data coming from the network.  Whilst this might speed up the
    application a bit, it's a problem if there's a network failure and the
    operation has to be reissued.
    
    If this happens, an oops occurs because afs_readpages_page_done() clears
    the pointer to each page it unlocks and when a retry happens, the
    pointers to the pages it wants to fill are now NULL (and the pages have
    been unlocked anyway).
    
    Instead, wait till the operation completes successfully and only then
    release all the pages after clearing any terminal gap (the server can
    give us less data than we requested as we're allowed to ask for more
    than is available).
    
    KASAN produces a bug like the following, and even without KASAN, it can
    oops and panic.
    
        BUG: KASAN: wild-memory-access in _copy_to_iter+0x323/0x5f4
        Write of size 1404 at addr 0005088000000000 by task md5sum/5235
    
        CPU: 0 PID: 5235 Comm: md5sum Not tainted 5.7.0-rc3-fscache+ #250
        Hardware name: ASUS All Series/H97-PLUS, BIOS 2306 10/09/2014
        Call Trace:
         memcpy+0x39/0x58
         _copy_to_iter+0x323/0x5f4
         __skb_datagram_iter+0x89/0x2a6
         skb_copy_datagram_iter+0x129/0x135
         rxrpc_recvmsg_data.isra.0+0x615/0xd42
         rxrpc_kernel_recv_data+0x1e9/0x3ae
         afs_extract_data+0x139/0x33a
         yfs_deliver_fs_fetch_data64+0x47a/0x91b
         afs_deliver_to_call+0x304/0x709
         afs_wait_for_call_to_complete+0x1cc/0x4ad
         yfs_fs_fetch_data+0x279/0x288
         afs_fetch_data+0x1e1/0x38d
         afs_readpages+0x593/0x72e
         read_pages+0xf5/0x21e
         __do_page_cache_readahead+0x128/0x23f
         ondemand_readahead+0x36e/0x37f
         generic_file_buffered_read+0x234/0x680
         new_sync_read+0x109/0x17e
         vfs_read+0xe6/0x138
         ksys_read+0xd8/0x14d
         do_syscall_64+0x6e/0x8a
         entry_SYSCALL_64_after_hwframe+0x49/0xb3
    
    Fixes: 196ee9cd2d04 ("afs: Make afs_fs_fetch_data() take a list of pages")
    Fixes: 30062bd13e36 ("afs: Implement YFS support in the fs client")
    Signed-off-by: David Howells <dhowells@redhat.com>
    Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

commit 94182167ec730dadcaea5fbc6bb8f1136966ef66
Author: Wei Yongjun <weiyongjun1@huawei.com>
Date:   Wed May 6 14:25:54 2020 +0000

    exfat: fix possible memory leak in exfat_find()
    
    'es' is malloced from exfat_get_dentry_set() in exfat_find() and should
    be freed before leaving from the error handling cases, otherwise it will
    cause memory leak.
    
    Fixes: 5f2aa075070c ("exfat: add inode operations")
    Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
    Signed-off-by: Namjae Jeon <namjae.jeon@samsung.com>

commit 035779483072ff7854943dc0cbae82c4e0070d15
Author: Eric Sandeen <sandeen@sandeen.net>
Date:   Fri May 1 20:34:25 2020 -0500

    exfat: use iter_file_splice_write
    
    Doing copy_file_range() on exfat with a file opened for direct IO leads
    to an -EFAULT:
    
    # xfs_io -f -d -c "truncate 32768" \$
           -c "copy_range -d 16384 -l 16384 -f 0" /mnt/test/junk
    copy_range: Bad address
    
    and the reason seems to be that we go through:
    
    default_file_splice_write
     splice_from_pipe
      __splice_from_pipe
       write_pipe_buf
        __kernel_write
         new_sync_write
          generic_file_write_iter
           generic_file_direct_write
            exfat_direct_IO
             do_blockdev_direct_IO
              iov_iter_get_pages
    
    and land in iterate_all_kinds(), which does "return -EFAULT" for our kvec
    iter.
    
    Setting exfat's splice_write to iter_file_splice_write fixes this and lets
    fsx (which originally detected the problem) run to success from
    the xfstests harness.
    
    Signed-off-by: Eric Sandeen <sandeen@sandeen.net>
    Signed-off-by: Namjae Jeon <namjae.jeon@samsung.com>

commit 8433856947217ebb5697a8ff9c4c9cad4639a2cf
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Tue May 12 16:19:17 2020 +0300

    evm: Fix a small race in init_desc()
    
    The IS_ERR_OR_NULL() function has two conditions and if we got really
    unlucky we could hit a race where "ptr" started as an error pointer and
    then was set to NULL.  Both conditions would be false even though the
    pointer at the end was NULL.
    
    This patch fixes the problem by ensuring that "*tfm" can only be NULL
    or valid.  I have introduced a "tmp_tfm" variable to make that work.  I
    also reversed a condition and pulled the code in one tab.
    
    Reported-by: Roberto Sassu <roberto.sassu@huawei.com>
    Fixes: 53de3b080d5e ("evm: Check also if *tfm is an error pointer in init_desc()")
    Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
    Acked-by: Roberto Sassu <roberto.sassu@huawei.com>
    Acked-by: Krzysztof Struczynski <krzysztof.struczynski@huawei.com>
    Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>

commit 770f60586d2af0590be263f55fd079226313922c
Author: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Date:   Thu Apr 30 21:32:05 2020 +0530

    evm: Fix RCU list related warnings
    
    This patch fixes the following warning and few other instances of
    traversal of evm_config_xattrnames list:
    
    [   32.848432] =============================
    [   32.848707] WARNING: suspicious RCU usage
    [   32.848966] 5.7.0-rc1-00006-ga8d5875ce5f0b #1 Not tainted
    [   32.849308] -----------------------------
    [   32.849567] security/integrity/evm/evm_main.c:231 RCU-list traversed in non-reader section!!
    
    Since entries are only added to the list and never deleted, use
    list_for_each_entry_lockless() instead of list_for_each_entry_rcu for
    traversing the list.  Also, add a relevant comment in evm_secfs.c to
    indicate this fact.
    
    Reported-by: kernel test robot <lkp@intel.com>
    Suggested-by: Paul E. McKenney <paulmck@kernel.org>
    Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
    Acked-by: Paul E. McKenney <paulmck@kernel.org> (RCU viewpoint)
    Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>

commit 2e3a34e9f409ebe83d1af7cd2f49fca7af97dfac
Author: Roberto Sassu <roberto.sassu@huawei.com>
Date:   Mon Apr 27 12:31:28 2020 +0200

    ima: Fix return value of ima_write_policy()
    
    This patch fixes the return value of ima_write_policy() when a new policy
    is directly passed to IMA and the current policy requires appraisal of the
    file containing the policy. Currently, if appraisal is not in ENFORCE mode,
    ima_write_policy() returns 0 and leads user space applications to an
    endless loop. Fix this issue by denying the operation regardless of the
    appraisal mode.
    
    Cc: stable@vger.kernel.org # 4.10.x
    Fixes: 19f8a84713edc ("ima: measure and appraise the IMA policy itself")
    Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
    Reviewed-by: Krzysztof Struczynski <krzysztof.struczynski@huawei.com>
    Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>

commit 53de3b080d5eae31d0de219617155dcc34e7d698
Author: Roberto Sassu <roberto.sassu@huawei.com>
Date:   Mon Apr 27 12:28:56 2020 +0200

    evm: Check also if *tfm is an error pointer in init_desc()
    
    This patch avoids a kernel panic due to accessing an error pointer set by
    crypto_alloc_shash(). It occurs especially when there are many files that
    require an unsupported algorithm, as it would increase the likelihood of
    the following race condition:
    
    Task A: *tfm = crypto_alloc_shash() <= error pointer
    Task B: if (*tfm == NULL) <= *tfm is not NULL, use it
    Task B: rc = crypto_shash_init(desc) <= panic
    Task A: *tfm = NULL
    
    This patch uses the IS_ERR_OR_NULL macro to determine whether or not a new
    crypto context must be created.
    
    Cc: stable@vger.kernel.org
    Fixes: d46eb3699502b ("evm: crypto hash replaced by shash")
    Co-developed-by: Krzysztof Struczynski <krzysztof.struczynski@huawei.com>
    Signed-off-by: Krzysztof Struczynski <krzysztof.struczynski@huawei.com>
    Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
    Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>

commit 0014cc04e8ec077dc482f00c87dfd949cfe2b98f
Author: Roberto Sassu <roberto.sassu@huawei.com>
Date:   Mon Apr 27 12:28:55 2020 +0200

    ima: Set file->f_mode instead of file->f_flags in ima_calc_file_hash()
    
    Commit a408e4a86b36 ("ima: open a new file instance if no read
    permissions") tries to create a new file descriptor to calculate a file
    digest if the file has not been opened with O_RDONLY flag. However, if a
    new file descriptor cannot be obtained, it sets the FMODE_READ flag to
    file->f_flags instead of file->f_mode.
    
    This patch fixes this issue by replacing f_flags with f_mode as it was
    before that commit.
    
    Cc: stable@vger.kernel.org # 4.20.x
    Fixes: a408e4a86b36 ("ima: open a new file instance if no read permissions")
    Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
    Reviewed-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
    Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246266D7C98
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 14:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518492.805111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2GH-0007Nb-HS; Wed, 05 Apr 2023 12:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518492.805111; Wed, 05 Apr 2023 12:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk2GH-0007LN-DW; Wed, 05 Apr 2023 12:29:13 +0000
Received: by outflank-mailman (input) for mailman id 518492;
 Wed, 05 Apr 2023 12:29:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2GG-0007LA-2h; Wed, 05 Apr 2023 12:29:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2GF-0007Kf-T4; Wed, 05 Apr 2023 12:29:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2GF-0002Bf-JC; Wed, 05 Apr 2023 12:29:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pk2GF-0002bc-HU; Wed, 05 Apr 2023 12:29:11 +0000
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
	bh=rSmjIYVoguXEwcp7J0Zysrmo9pmK9TI7ocrw0C3tQCk=; b=42NFmFsjaNY1OO5PRjMUNrGtJd
	PXP7zhPgpOwc6BzvqFbS9JKHIFqbQNIdd7mSNt2gcsJc1zJRSH2AKwT+4xfQdiq8XWI8P/jT0DCtq
	iUMeQJ2JO5rwLrrQFHsFwFdtBou0SFpz0j9iLTAgQ/3IsxicPYreRhbOlnmvoYEEfJHU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180146-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 180146: tolerable trouble: fail/pass/starved - PUSHED
X-Osstest-Failures:
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:windows-install:fail:heisenbug
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-qcow2:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:build-check(1):starved:nonblocking
    qemu-mainline:build-armhf-libvirt:build-check(1):starved:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:build-check(1):starved:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:hosts-allocate:starved:nonblocking
    qemu-mainline:test-arm64-arm64-xl-vhd:hosts-allocate:starved:nonblocking
    qemu-mainline:build-armhf:hosts-allocate:starved:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:hosts-allocate:starved:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:hosts-allocate:starved:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-raw:hosts-allocate:starved:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:hosts-allocate:starved:nonblocking
    qemu-mainline:test-arm64-arm64-xl:hosts-allocate:starved:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    qemuu=7d0334e49111787ae19fbc8d29ff6e7347f0605e
X-Osstest-Versions-That:
    qemuu=51a6dc9d394098e8f4141fad869a1ee9585f54f8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Apr 2023 12:29:11 +0000

flight 180146 qemu-mainline real [real]
flight 180151 qemu-mainline real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/180146/
http://logs.test-lab.xenproject.org/osstest/logs/180151/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-win7-amd64 12 windows-install fail pass in 180151-retest

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop   fail in 180151 like 180136
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180136
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180136
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180136
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180136
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt      1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               starved  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               starved  n/a
 build-armhf-libvirt           1 build-check(1)               starved  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               starved  n/a
 test-arm64-arm64-xl-thunderx  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-vhd       3 hosts-allocate               starved  n/a
 build-armhf                   2 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-xsm       3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit2   3 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-raw  3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl-credit1   3 hosts-allocate               starved  n/a
 test-arm64-arm64-xl           3 hosts-allocate               starved  n/a
 test-arm64-arm64-libvirt-xsm  3 hosts-allocate               starved  n/a

version targeted for testing:
 qemuu                7d0334e49111787ae19fbc8d29ff6e7347f0605e
baseline version:
 qemuu                51a6dc9d394098e8f4141fad869a1ee9585f54f8

Last test of basis   180136  2023-04-04 13:08:44 Z    0 days
Testing same since   180146  2023-04-05 03:09:37 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Bennée <alex.bennee@linaro.org>
  Daniel P. Berrangé <berrange@redhat.com>
  David Woodhouse <dwmw@amazon.co.uk>
  Dr. David Alan Gilbert <dave@treblig.org>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Eric Blake <eblake@redhat.com>
  Junqiang Wang <wangjunqiang@iscas.ac.cn>
  Marco Liebel <quic_mliebel@quicinc.com>
  Peter Maydell <peter.maydell@linaro.org>
  Philippe Mathieu-Daudé <philmd@linaro.org>
  Richard Henderson <richard.henderson@linaro.org>
  Song Gao <gaosong@loongson.cn>
  tanhongze <tanhongze@loongson.cn>
  Thomas Huth <thuth@redhat.com>
  Tianrui Zhao <zhaotianrui@loongson.cn>
  Warner Losh <imp@bsdimp.com>
  Weiwei Li <liweiwei@iscas.ac.cn>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  starved 
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          starved 
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          starved 
 test-armhf-armhf-xl                                          starved 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 starved 
 test-amd64-i386-libvirt-xsm                                  pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      starved 
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  starved 
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  starved 
 test-armhf-armhf-xl-credit2                                  starved 
 test-armhf-armhf-xl-cubietruck                               starved 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     starved 
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                starved 
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 starved 
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 starved 
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      starved 
 test-armhf-armhf-xl-vhd                                      starved 
 test-amd64-i386-xl-vhd                                       pass    


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


Pushing revision :

To xenbits.xen.org:/home/xen/git/qemu-xen.git
   51a6dc9d39..7d0334e491  7d0334e49111787ae19fbc8d29ff6e7347f0605e -> upstream-tested


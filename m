Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A6175A2E9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 01:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566238.884790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMGnj-0000et-Dr; Wed, 19 Jul 2023 23:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566238.884790; Wed, 19 Jul 2023 23:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMGnj-0000dE-BA; Wed, 19 Jul 2023 23:41:47 +0000
Received: by outflank-mailman (input) for mailman id 566238;
 Wed, 19 Jul 2023 23:41:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMGnh-0000cj-Te; Wed, 19 Jul 2023 23:41:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMGnh-0001Kq-Hm; Wed, 19 Jul 2023 23:41:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMGnh-0003jk-4T; Wed, 19 Jul 2023 23:41:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qMGnh-0007Dv-3y; Wed, 19 Jul 2023 23:41:45 +0000
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
	bh=RIthBuDGdtNFoG8sxOS1BCkQU+TGbiIpyJkwcd23lsY=; b=rNZ82+AkRfTp2M4LawoPR/lc/l
	gwcZYqIBxVq8Nn72bNXRlQMJNpi8/s7Nbgah7YaOJN4eGdz/V6h5ACeiWJlnYff39xKDRyVMmNCYw
	7iAgd2e1jszJ8oYUOc/gec7znS9f+5EXqb3T5dGZq2nrncJ6oSPVkPA06yi8QD3yV2RM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181889-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-upstream-4.17-testing test] 181889: regressions - trouble: fail/pass/starved
X-Osstest-Failures:
    qemu-upstream-4.17-testing:build-arm64-pvops:kernel-build:fail:regression
    qemu-upstream-4.17-testing:test-amd64-i386-xl-vhd:guest-start.2:fail:heisenbug
    qemu-upstream-4.17-testing:test-amd64-i386-xl-qemuu-ws16-amd64:xen-install:fail:heisenbug
    qemu-upstream-4.17-testing:test-amd64-i386-libvirt:guest-start/debian.repeat:fail:heisenbug
    qemu-upstream-4.17-testing:test-amd64-i386-qemuu-rhel6hvm-amd:redhat-install:fail:heisenbug
    qemu-upstream-4.17-testing:test-amd64-i386-xl-vhd:xen-install:fail:heisenbug
    qemu-upstream-4.17-testing:test-amd64-i386-pair:xen-install/src_host:fail:heisenbug
    qemu-upstream-4.17-testing:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-i386-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-libvirt:hosts-allocate:starved:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-libvirt-qcow2:hosts-allocate:starved:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-libvirt-raw:hosts-allocate:starved:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-rtds:hosts-allocate:starved:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-vhd:hosts-allocate:starved:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl:hosts-allocate:starved:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-arndale:hosts-allocate:starved:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-multivcpu:hosts-allocate:starved:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-credit1:hosts-allocate:starved:nonblocking
    qemu-upstream-4.17-testing:test-armhf-armhf-xl-credit2:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    qemuu=eeaede60ffb1760c06850cae562d104e4f98c859
X-Osstest-Versions-That:
    qemuu=b746458e1ce1bec85e58b458386f8b7a0bedfaa6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 19 Jul 2023 23:41:45 +0000

flight 181889 qemu-upstream-4.17-testing real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181889/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-arm64-pvops             6 kernel-build   fail in 181841 REGR. vs. 175008

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-vhd       22 guest-start.2    fail in 181865 pass in 181841
 test-amd64-i386-xl-qemuu-ws16-amd64 7 xen-install fail in 181865 pass in 181889
 test-amd64-i386-libvirt 20 guest-start/debian.repeat fail in 181865 pass in 181889
 test-amd64-i386-qemuu-rhel6hvm-amd 12 redhat-install fail in 181865 pass in 181889
 test-amd64-i386-xl-vhd        7 xen-install                fail pass in 181865
 test-amd64-i386-pair         10 xen-install/src_host       fail pass in 181865

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-libvirt-xsm  1 build-check(1)           blocked in 181841 n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)           blocked in 181841 n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)           blocked in 181841 n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)           blocked in 181841 n/a
 test-arm64-arm64-xl           1 build-check(1)           blocked in 181841 n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)           blocked in 181841 n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)           blocked in 181841 n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)           blocked in 181841 n/a
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 181865 like 175008
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail in 181865 like 175008
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check fail in 181865 like 175008
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 181865 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 181865 never pass
 test-armhf-armhf-xl-credit2 15 migrate-support-check fail in 181865 never pass
 test-armhf-armhf-xl-credit2 16 saverestore-support-check fail in 181865 never pass
 test-armhf-armhf-xl-arndale 15 migrate-support-check fail in 181865 never pass
 test-armhf-armhf-xl-arndale 16 saverestore-support-check fail in 181865 never pass
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 181865 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 181865 never pass
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 181865 never pass
 test-armhf-armhf-xl-rtds    15 migrate-support-check fail in 181865 never pass
 test-armhf-armhf-xl         15 migrate-support-check fail in 181865 never pass
 test-armhf-armhf-xl-rtds 16 saverestore-support-check fail in 181865 never pass
 test-armhf-armhf-xl     16 saverestore-support-check fail in 181865 never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check fail in 181865 never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check fail in 181865 never pass
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 181865 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 181865 never pass
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 175008
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 175008
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 175008
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 175008
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 175008
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-i386-libvirt-raw  14 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt      3 hosts-allocate               starved  n/a
 test-armhf-armhf-libvirt-qcow2  3 hosts-allocate               starved  n/a
 test-armhf-armhf-libvirt-raw  3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-rtds      3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-vhd       3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl           3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-arndale   3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-multivcpu  3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-credit1   3 hosts-allocate               starved  n/a
 test-armhf-armhf-xl-credit2   3 hosts-allocate               starved  n/a

version targeted for testing:
 qemuu                eeaede60ffb1760c06850cae562d104e4f98c859
baseline version:
 qemuu                b746458e1ce1bec85e58b458386f8b7a0bedfaa6

Last test of basis   175008  2022-12-01 11:10:52 Z  230 days
Testing same since   181841  2023-07-17 11:41:16 Z    2 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Haochen Tong <i@hexchain.org>
  Jason Wang <jasowang@redhat.com>
  Miroslav Rezanina <mrezanin@redhat.com>
  Thomas Huth <thuth@redhat.com>

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
 test-armhf-armhf-xl                                          starved 
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
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
 test-armhf-armhf-xl-arndale                                  starved 
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  starved 
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  starved 
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
 test-amd64-i386-pair                                         fail    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-armhf-armhf-libvirt-qcow2                               starved 
 test-amd64-amd64-xl-qcow2                                    pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 starved 
 test-amd64-i386-libvirt-raw                                  pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     starved 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      starved 
 test-amd64-i386-xl-vhd                                       fail    


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
commit eeaede60ffb1760c06850cae562d104e4f98c859
Author: Miroslav Rezanina <mrezanin@redhat.com>
Date:   Wed Nov 9 10:57:13 2022 -0500

    qemu-img: remove unused variable
    
    Variable block_count used in img_dd function is only incremented but never read.
    This causes 'Unused but set variable' warning on Clang 15.0.1 compiler.
    
    Removing the variable to prevent the warning.
    
    Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
    Reviewed-by: Thomas Huth <thuth@redhat.com>
    Message-Id: <e86d5b57f9d13bde995c616a533b876f1fb8a527.1668009030.git.mrezanin@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>
    (cherry picked from commit 0f48c47c679bc29fceb3a67283ee3b78175524bf)

commit 83b8b039db0efefd851dc62160728a69b36e09aa
Author: Miroslav Rezanina <mrezanin@redhat.com>
Date:   Wed Nov 9 10:57:12 2022 -0500

    tulip: Remove unused variable
    
    Variable n used in tulip_idblock_crc function is only incremented but never read.
    This causes 'Unused but set variable' warning on Clang 15.0.1 compiler.
    
    Removing the variable to prevent the warning.
    
    Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
    Reviewed-by: Thomas Huth <thuth@redhat.com>
    Message-Id: <02e1560d115c208df32236df8916fed98429fda1.1668009030.git.mrezanin@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>
    (cherry picked from commit 6083dcad80743718620a3f8a72fb76ea8b7c28ca)

commit 7385a130d841aeaf39e8773af869eb54cc7d6a7f
Author: Miroslav Rezanina <mrezanin@redhat.com>
Date:   Wed Nov 9 10:57:11 2022 -0500

    rtl8139: Remove unused variable
    
    Variable send_count used in rtl8139_cplus_transmit_one function is only
    incremented but never read. This causes 'Unused but set variable' warning
    on Clang 15.0.1 compiler.
    
    Removing the variable to prevent the warning.
    
    Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
    Reviewed-by: Thomas Huth <thuth@redhat.com>
    Message-Id: <15a32dd06c492216cbf27cd3ddcbe1e9afb8d8f5.1668009030.git.mrezanin@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>
    (cherry picked from commit 7d7238c72b983cff5064734349d2d45be9c6282c)

commit 27ca28d169038bf7fe70341c4cbb8fddd3791e8b
Author: Haochen Tong <i@hexchain.org>
Date:   Sat May 28 03:06:58 2022 +0800

    ebpf: replace deprecated bpf_program__set_socket_filter
    
    bpf_program__set_<TYPE> functions have been deprecated since libbpf 0.8.
    Replace with the equivalent bpf_program__set_type call to avoid a
    deprecation warning.
    
    Signed-off-by: Haochen Tong <i@hexchain.org>
    Reviewed-by: Zhang Chen <chen.zhang@intel.com>
    Signed-off-by: Jason Wang <jasowang@redhat.com>
    (cherry picked from commit a495eba03c31c96d6a0817b13598ce2219326691)


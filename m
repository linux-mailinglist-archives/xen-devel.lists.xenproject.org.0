Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD8D9A1EE0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 11:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820483.1233978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1N6e-0007U6-LH; Thu, 17 Oct 2024 09:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820483.1233978; Thu, 17 Oct 2024 09:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1N6e-0007Rv-H1; Thu, 17 Oct 2024 09:47:44 +0000
Received: by outflank-mailman (input) for mailman id 820483;
 Thu, 17 Oct 2024 09:47:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1N6c-0007Rj-EW; Thu, 17 Oct 2024 09:47:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1N6c-0007jR-Bk; Thu, 17 Oct 2024 09:47:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1N6b-0001CI-Ug; Thu, 17 Oct 2024 09:47:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t1N6b-00040J-UD; Thu, 17 Oct 2024 09:47:41 +0000
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
	bh=XcZo4/EGn+e98cDIzm35qzOydv//5OQQciqVIOt4pLg=; b=U1NUTtBN/yKELzoYhrR031tlAO
	fUv9BzuMQ5FwBdhonoGCAMEKvfLG77ZWBSPsLSLgN5Pai5BjtSs+BglXiSEr3P6oJ1r7X7jzjl2xp
	JQJu1CH2eTujZbah9xCo1YNGNpTz5fzihl2PXC+ps8LNptfcR0XmlubrnjGxpLyzd/Y0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-188132-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 188132: regressions - FAIL
X-Osstest-Failures:
    linux-linus:build-amd64-pvops:kernel-build:fail:regression
    linux-linus:test-amd64-amd64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-raw:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-examine-bios:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-examine-uefi:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=c964ced7726294d40913f2127c3f185a92cb4a41
X-Osstest-Versions-That:
    linux=2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 17 Oct 2024 09:47:41 +0000

flight 188132 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/188132/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-pvops             6 kernel-build             fail REGR. vs. 188098

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-raw       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qemut-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-win7-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 test-amd64-amd64-xl-qemut-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine      1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine-bios  1 build-check(1)               blocked  n/a
 test-amd64-amd64-examine-uefi  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 188098
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                c964ced7726294d40913f2127c3f185a92cb4a41
baseline version:
 linux                2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2

Last test of basis   188098  2024-10-15 19:12:44 Z    1 days
Testing same since   188132  2024-10-16 21:13:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abhishek Mohapatra <abhishek.mohapatra@broadcom.com>
  Abhishek Mohapatra<abhishek.mohapatra@broadcom.com>
  Alexander Zubkov <green@qrator.net>
  Anumula Murali Mohan Reddy <anumula@chelsio.com>
  Atte Heikkilä <atteh.mailbox@gmail.com>
  Bart Van Assche <bvanassche@acm.org>
  Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
  Björn Töpel <bjorn@rivosinc.com>
  Chandramohan Akula <chandramohan.akula@broadcom.com>
  Christian Heusel <christian@heusel.eu>
  David Sterba <dsterba@suse.com>
  David Vernet <void@manifault.com>
  Filipe Manana <fdmanana@suse.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  Honglei Wang <jameshongleiwang@126.com>
  Jason Gunthorpe <jgg@nvidia.com>
  Kalesh AP <kalesh-anakkur.purayil@broadcom.com>
  Kashyap Desai <kashyap.desai@broadcom.com>
  Leon Romanovsky <leon@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Mark Brown <broonie@kernel.org>
  Namjae Jeon <linkinjeon@kernel.org>
  Potnuri Bharat Teja <bharat@chelsio.com>
  Qianqiang Liu <qianqiang.liu@163.com>
  Roi Martin <jroi.martin@gmail.com>
  Saravanan Vajravel <saravanan.vajravel@broadcom.com>
  Selvin Xavier <selvin.xavier@broadcom.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Showrya M N <showrya@chelsio.com>
  Steve French <stfrench@microsoft.com>
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
 build-amd64-pvops                                            fail    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        blocked 
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              blocked 
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       blocked 
 test-amd64-amd64-qemuu-freebsd12-amd64                       blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-amd64-xl-qemut-win7-amd64                         blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-amd64-xl-qemut-ws16-amd64                         blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                blocked 
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-amd64-examine                                     blocked 
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-libvirt-qcow2                               blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-xl-qcow2                                    pass    
 test-amd64-amd64-libvirt-raw                                 blocked 
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      blocked 
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-libvirt-vhd                                 pass    
 test-amd64-amd64-xl-vhd                                      blocked 
 test-arm64-arm64-xl-vhd                                      pass    


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

(No revision log; it would be 926 lines long.)


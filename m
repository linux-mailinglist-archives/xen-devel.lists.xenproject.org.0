Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CDD4246A5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 21:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203157.358222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYCVJ-00083F-1z; Wed, 06 Oct 2021 19:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203157.358222; Wed, 06 Oct 2021 19:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYCVI-00081A-Uj; Wed, 06 Oct 2021 19:23:00 +0000
Received: by outflank-mailman (input) for mailman id 203157;
 Wed, 06 Oct 2021 19:22:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mYCVG-000810-Rj; Wed, 06 Oct 2021 19:22:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mYCVG-0002KF-JJ; Wed, 06 Oct 2021 19:22:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mYCVG-0004Aj-AH; Wed, 06 Oct 2021 19:22:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mYCVG-0005zC-9e; Wed, 06 Oct 2021 19:22:58 +0000
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
	bh=0MouNFrlRUVkkZ502r92jEoRSaZ41UXiWd4jjJCGI54=; b=pxL04T/+37apX73INOCDEy0lX9
	tredqQdDKkNAe5weKYlTSQwsvh61T2XyDS8aod8SDqCHyU90c+ip1+nEdDfe023j+Yh+NPnR9dfDS
	MqrZL9wJaOw4ah5JSKM99RZMuJopjA+Dg1lgqQP6N0ZvbCIooAsg4Jcb/IOz6IPozkWw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165391-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-arm-xen test] 165391: tolerable all pass - PUSHED
X-Osstest-Failures:
    linux-arm-xen:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-rtds:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-libvirt:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-libvirt:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-arm-xen:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=f0f0e602f7c9781699ecda9be763eac0b03d54f0
X-Osstest-Versions-That:
    linux=a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Oct 2021 19:22:58 +0000

flight 165391 linux-arm-xen real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165391/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check fail baseline untested
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 146859
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 146859
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-arm64-arm64-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-rtds     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-arm64-arm64-libvirt-qcow2 15 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                f0f0e602f7c9781699ecda9be763eac0b03d54f0
baseline version:
 linux                a6c5dd1dbaffe4cc398d8454546ba9246b9a95c9

Last test of basis   146859  2020-02-11 11:11:57 Z  603 days
Testing same since   165391  2021-10-05 21:41:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>

jobs:
 build-arm64-xsm                                              pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-armhf-armhf-xl-arndale                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-arm64-arm64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-arm64-arm64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-arm64-arm64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-arm64-arm64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-arm64-arm64-xl-vhd                                      pass    
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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   a6c5dd1dbaff..f0f0e602f7c9  f0f0e602f7c9781699ecda9be763eac0b03d54f0 -> tested/linux-arm-xen


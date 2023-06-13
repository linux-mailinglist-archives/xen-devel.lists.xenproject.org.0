Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94BB72EC9F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 22:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548387.856329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9AMP-0002h5-Ui; Tue, 13 Jun 2023 20:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548387.856329; Tue, 13 Jun 2023 20:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9AMP-0002ej-Ry; Tue, 13 Jun 2023 20:11:25 +0000
Received: by outflank-mailman (input) for mailman id 548387;
 Tue, 13 Jun 2023 20:11:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9AMN-0002eZ-JT; Tue, 13 Jun 2023 20:11:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9AMN-0003w8-HC; Tue, 13 Jun 2023 20:11:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q9AMN-0006e0-4G; Tue, 13 Jun 2023 20:11:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q9AMN-0001Lz-3c; Tue, 13 Jun 2023 20:11:23 +0000
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
	bh=1sVWlo06baPWAsamw50hWuQ80RZfHi7un5Qd0L7Giyg=; b=3SuDexJvSPT3IQdnxxl6mtiB2c
	n+eN8ncRPo+KAJx+RfT+DzCF+S9M/Bq3Sk+2AEk2wNmHM0vNH7KqAXyzVScjle1ZpD78slJcRW7uG
	LPsYNlK8XQx1loGHf9B/nlvHKk1gVlZs9TGQcCch0+eHz1zXpBtfQTZcDg8YjqmnjkCE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181408-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 181408: regressions - FAIL
X-Osstest-Failures:
    seabios:test-amd64-i386-qemuu-rhel6hvm-amd:xen-install:fail:regression
    seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    seabios=4db444b9a78abf9f6dc981f0e79db749765dc6e8
X-Osstest-Versions-That:
    seabios=be7e899350caa7b74d8271a34264c3b4aef25ab0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 13 Jun 2023 20:11:23 +0000

flight 181408 seabios real [real]
flight 181411 seabios real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/181408/
http://logs.test-lab.xenproject.org/osstest/logs/181411/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install        fail REGR. vs. 180681

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180681
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 180681
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180681
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180681
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 180681
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass

version targeted for testing:
 seabios              4db444b9a78abf9f6dc981f0e79db749765dc6e8
baseline version:
 seabios              be7e899350caa7b74d8271a34264c3b4aef25ab0

Last test of basis   180681  2023-05-16 11:10:38 Z   28 days
Testing same since   181408  2023-06-13 15:12:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  José Martínez <xose@google.com>

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
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
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
commit 4db444b9a78abf9f6dc981f0e79db749765dc6e8
Author: José Martínez <xose@google.com>
Date:   Tue Jun 13 11:01:34 2023 -0400

    Fix high memory zone initialization in CSM mode
    
    malloc_high() cannot allocate any memory in CSM mode due to an empty
    ZoneHigh. SeaBIOS cannot find any disk to boot from because device
    initialization fails.
    
    The bug was introduced in 1.16.1 (commit dc88f9b) when the meaning of
    BUILD_MAX_HIGHTABLE changed but CSM code was not updated. This patch
    reverts to the previous behavior by using BUILD_MIN_HIGHTABLE in CSM
    methods.
    
    Signed-off-by: José Martínez <xose@google.com>


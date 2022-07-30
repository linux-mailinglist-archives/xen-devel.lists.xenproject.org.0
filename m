Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D224F585917
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jul 2022 10:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378018.611346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHhc0-0003Ni-Hu; Sat, 30 Jul 2022 08:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378018.611346; Sat, 30 Jul 2022 08:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHhc0-0003LY-Eg; Sat, 30 Jul 2022 08:14:16 +0000
Received: by outflank-mailman (input) for mailman id 378018;
 Sat, 30 Jul 2022 08:14:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHhby-0003LM-CP; Sat, 30 Jul 2022 08:14:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHhby-00079R-AT; Sat, 30 Jul 2022 08:14:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oHhby-0004xs-0y; Sat, 30 Jul 2022 08:14:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oHhby-0001mu-0Y; Sat, 30 Jul 2022 08:14:14 +0000
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
	bh=TpcwEUqoJGXh5K0k4J6scREwoNEvJzNv1FwtNYpGKVk=; b=A9V62TBVLtKP8MefsKbms4hq3/
	/z7kZ/QX3iuVszS59X4Ez9txEsk0e5g6DC/GcBN5deMsj0bfEg9ZreYmT8T0oF184PDhwhvBYR9Tq
	eSlLnfiydrjdCzm9IAA9gUnTdwZWTVrpRoGzFD+tW4ZEsJBPQRxvgv/r8Sro6ZaQ3xcA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171936-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171936: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:build-amd64-libvirt:libvirt-build:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=9dc3f006a831cd20d531123f097e3de176ac3cae
X-Osstest-Versions-That:
    xen=f732240fd3bac25116151db5ddeb7203b62e85ce
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 30 Jul 2022 08:14:14 +0000

flight 171936 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171936/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 171884

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  9dc3f006a831cd20d531123f097e3de176ac3cae
baseline version:
 xen                  f732240fd3bac25116151db5ddeb7203b62e85ce

Last test of basis   171884  2022-07-27 12:03:31 Z    2 days
Failing since        171899  2022-07-28 19:01:47 Z    1 days   10 attempts
Testing same since   171934  2022-07-30 02:00:28 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Daniel P. Smith <dpsmith@apertussolutions.com>
  George Dunlap <george.dunlap@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jiamei Xie <jiamei.xie@arm.com>
  Julien Grall <jgrall@amazon.com>
  Julien Grall <julien.grall@arm.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Stefano Stabellini <stefano.stabellini@amd.com>
  Xenia Ragiadakou <burzalodowa@gmail.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          fail    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     blocked 


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

(No revision log; it would be 451 lines long.)


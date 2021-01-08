Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79F2EF5C0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 17:32:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63696.113050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxufP-0004Fz-OP; Fri, 08 Jan 2021 16:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63696.113050; Fri, 08 Jan 2021 16:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxufP-0004FP-JL; Fri, 08 Jan 2021 16:31:11 +0000
Received: by outflank-mailman (input) for mailman id 63696;
 Fri, 08 Jan 2021 16:31:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxufO-0004FH-1X; Fri, 08 Jan 2021 16:31:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxufN-0004ct-Nb; Fri, 08 Jan 2021 16:31:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxufN-0004VZ-Ek; Fri, 08 Jan 2021 16:31:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kxufN-0003eb-EF; Fri, 08 Jan 2021 16:31:09 +0000
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
	bh=MyYitxPA0junujhHOD+0lP+ATlGlasZVGP3agjOCjR4=; b=ARQilmrgtavEhhNyqdj8311IaD
	YHKBQvBQVfGic7ZzjpJhnhEbPYTvC7MOjF+OLmfCybO/GnaXMk0Wk9MvnsZwFCgmPtG7Tombp7yUd
	w+IuWX3ObHvaaPI2EsUnsGfjqSt9vf3vE7+YqmpAZ4lxfkPKZun8j2lsCdP61WeJnGDs=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158279-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 158279: regressions - trouble: broken/fail/pass
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:<job status>:broken:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:host-install(5):broken:regression
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=3e6c560ea1931ff579fc2c9504a6e46e5c4572c9
X-Osstest-Versions-That:
    xen=7ba2ab495be54f608cb47440e1497b2795bd301a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Jan 2021 16:31:09 +0000

flight 158279 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158279/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm         <job status>                 broken
 test-arm64-arm64-xl-xsm       5 host-install(5)        broken REGR. vs. 158134
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 158134

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass

version targeted for testing:
 xen                  3e6c560ea1931ff579fc2c9504a6e46e5c4572c9
baseline version:
 xen                  7ba2ab495be54f608cb47440e1497b2795bd301a

Last test of basis   158134  2021-01-04 15:01:26 Z    4 days
Failing since        158142  2021-01-05 02:00:25 Z    3 days   21 attempts
Testing same since   158278  2021-01-08 11:01:43 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Manuel Bouyer <bouyer@antioche.eu.org>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Olaf Hering <olaf@aepfle.de>
  Roger Pau Monne <roger.pau@citrix.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Roman Skakun <roman_skakun@epam.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Volodymyr Babchyk <volodymyr_babchuk@epam.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      broken  
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


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

broken-job test-arm64-arm64-xl-xsm broken
broken-step test-arm64-arm64-xl-xsm host-install(5)

Not pushing.

(No revision log; it would be 638 lines long.)


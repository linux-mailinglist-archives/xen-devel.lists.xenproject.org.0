Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEFD299543
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 19:27:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12538.32632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX7Co-0001rm-Bi; Mon, 26 Oct 2020 18:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12538.32632; Mon, 26 Oct 2020 18:26:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX7Co-0001rP-8Q; Mon, 26 Oct 2020 18:26:54 +0000
Received: by outflank-mailman (input) for mailman id 12538;
 Mon, 26 Oct 2020 18:26:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRSk=EB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kX7Cl-0001rK-U0
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 18:26:51 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf3951eb-d0a1-4247-8cfc-11f6b2977988;
 Mon, 26 Oct 2020 18:26:50 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kX7Cj-0002pa-Ou; Mon, 26 Oct 2020 18:26:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kX7Cj-0007u1-F5; Mon, 26 Oct 2020 18:26:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kX7Cj-0001Yk-EY; Mon, 26 Oct 2020 18:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WRSk=EB=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kX7Cl-0001rK-U0
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 18:26:51 +0000
X-Inumbo-ID: cf3951eb-d0a1-4247-8cfc-11f6b2977988
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cf3951eb-d0a1-4247-8cfc-11f6b2977988;
	Mon, 26 Oct 2020 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=1gE7/dhsBVfChUkPY21HhW3wphWny/eSKOmSIQeQi+Y=; b=6FPU+ItoK6J4fDjaDW4G7IwKJ1
	TCYTpUJ/HA2dkjJMukyUeZycsHWKImm24d6Xl8ozr/Ny1633gn1vEiVUNH/rOGwVKYleoWpcy8YHt
	nZg4mNCZIRMy1jiZmFDqLgBK/n5An1OhKxgbYiGVhT0rzT9BxFE76ctTeZn+F8SL5oek=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kX7Cj-0002pa-Ou; Mon, 26 Oct 2020 18:26:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kX7Cj-0007u1-F5; Mon, 26 Oct 2020 18:26:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kX7Cj-0001Yk-EY; Mon, 26 Oct 2020 18:26:49 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156245-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 156245: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=964781c6f162893677c50a779b7d562a299727ba
X-Osstest-Versions-That:
    xen=6ca70821b59849ad97c3fadc47e63c1a4af1a78c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 26 Oct 2020 18:26:49 +0000

flight 156245 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156245/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  964781c6f162893677c50a779b7d562a299727ba
baseline version:
 xen                  6ca70821b59849ad97c3fadc47e63c1a4af1a78c

Last test of basis   156117  2020-10-23 09:01:23 Z    3 days
Failing since        156120  2020-10-23 14:01:24 Z    3 days   38 attempts
Testing same since   156245  2020-10-26 16:01:22 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Bertrand Marquis <bertrand.marquis@arm.com>
  Christian Lindig <christian.lindig@citrix.com>
  George Dunlap <george.dunlap@citrix.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Wei Liu <wl@xen.org>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
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


Pushing revision :

To xenbits.xen.org:/home/xen/git/xen.git
   6ca70821b5..964781c6f1  964781c6f162893677c50a779b7d562a299727ba -> smoke


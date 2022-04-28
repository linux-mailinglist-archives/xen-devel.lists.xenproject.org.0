Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A6C513C06
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 21:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316752.535782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk9Xa-0006DY-W9; Thu, 28 Apr 2022 19:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316752.535782; Thu, 28 Apr 2022 19:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk9Xa-0006Aw-ST; Thu, 28 Apr 2022 19:11:02 +0000
Received: by outflank-mailman (input) for mailman id 316752;
 Thu, 28 Apr 2022 19:11:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nk9XZ-0006Am-0m; Thu, 28 Apr 2022 19:11:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nk9XY-0005An-Vw; Thu, 28 Apr 2022 19:11:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nk9XY-0001zA-DT; Thu, 28 Apr 2022 19:11:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nk9XY-0002On-D2; Thu, 28 Apr 2022 19:11:00 +0000
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
	bh=cu+7elJyLIFFlFfjO000YWxNKK1fLf1zrDpGOu/G6fI=; b=q/O1PLnbCGXbuIXntc07pL6xwx
	/bSxsFcLcUYi6E+SW3+qxN3d0b6lyzKoulG/fiMrA4LEaIlXXtemUlnbzdcHZUU/hZ+ws8HQmV5MT
	/r8UsrgLso8QZbJlHhL/5kFhnO1ojJPCX/T3lm7Y1w2034zPBmpx0sfz7lbTF98zR4r0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169824-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 169824: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=d711a8e5279d830d2e4f0f55246ed0c6e4a6bbed
X-Osstest-Versions-That:
    xen=da28439ba55b8a571032b3358af567cff749f612
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 28 Apr 2022 19:11:00 +0000

flight 169824 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169824/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  d711a8e5279d830d2e4f0f55246ed0c6e4a6bbed
baseline version:
 xen                  da28439ba55b8a571032b3358af567cff749f612

Last test of basis   169800  2022-04-27 23:01:43 Z    0 days
Failing since        169807  2022-04-28 09:01:41 Z    0 days    2 attempts
Testing same since   169824  2022-04-28 16:00:24 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>

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
   da28439ba5..d711a8e527  d711a8e5279d830d2e4f0f55246ed0c6e4a6bbed -> smoke


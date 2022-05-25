Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830D353423B
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 19:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337306.561863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntusL-0002tp-Am; Wed, 25 May 2022 17:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337306.561863; Wed, 25 May 2022 17:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntusL-0002r1-74; Wed, 25 May 2022 17:32:49 +0000
Received: by outflank-mailman (input) for mailman id 337306;
 Wed, 25 May 2022 17:32:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntusJ-0002qr-QZ; Wed, 25 May 2022 17:32:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntusJ-0005lX-OB; Wed, 25 May 2022 17:32:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntusJ-00071q-Ev; Wed, 25 May 2022 17:32:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ntusJ-0007Tf-EW; Wed, 25 May 2022 17:32:47 +0000
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
	bh=UabrJf7BKrKzFP/7ats1DPPoLoP9l4yBG19SfznrJwM=; b=sIB3Lfy7KBrmaNR2uaY+Wgv0to
	aN5FGpzKB1zAXOjiFmWZjznIbcqAX+OJA8AYTTBmrfYy2Y9Eo3Wbe8x87Glw8gmuGVHCnROWCJiMO
	DY0eHKPxPoHPooYcfGUSYwiss8ezLZZigkQUnWg2QCsN1a4KziSxUhrsJwm+j+V9WqYE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170730-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 170730: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=49dd52fb1311dadab29f6634d0bc1f4c022c357a
X-Osstest-Versions-That:
    xen=49399b101e38fb2c11478c849ffdaaace8e318a8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 May 2022 17:32:47 +0000

flight 170730 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170730/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  49dd52fb1311dadab29f6634d0bc1f4c022c357a
baseline version:
 xen                  49399b101e38fb2c11478c849ffdaaace8e318a8

Last test of basis   170719  2022-05-25 00:00:26 Z    0 days
Failing since        170725  2022-05-25 09:01:46 Z    0 days    2 attempts
Testing same since   170730  2022-05-25 14:01:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bertrand Marquis <bertrand.marquis@arm.com>
  Elliott Mitchell <ehem+xen@m5p.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>

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
   49399b101e..49dd52fb13  49dd52fb1311dadab29f6634d0bc1f4c022c357a -> smoke


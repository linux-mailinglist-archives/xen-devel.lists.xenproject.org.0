Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5AE42B450
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 06:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207863.363810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maW4G-0000H1-Tw; Wed, 13 Oct 2021 04:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207863.363810; Wed, 13 Oct 2021 04:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maW4G-0000Ee-PK; Wed, 13 Oct 2021 04:40:40 +0000
Received: by outflank-mailman (input) for mailman id 207863;
 Wed, 13 Oct 2021 04:40:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maW4F-0000EU-AN; Wed, 13 Oct 2021 04:40:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maW4F-0003me-2K; Wed, 13 Oct 2021 04:40:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maW4E-0000wL-R2; Wed, 13 Oct 2021 04:40:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1maW4E-0005mr-QY; Wed, 13 Oct 2021 04:40:38 +0000
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
	bh=fyF1D4eM0sYkn4pp9UcwT03FKSraPrR1G+jWvkfu0+o=; b=icaOiYgL7lZtg9o9UGA/Zczb8T
	wAD7ahn56xk8eDukWrZfZWjQ2gHT6eli640t8I53VwobjAeJClspLrX1Cx9LjBE+tLE0DSi5JSLR9
	kpRfKhErcRmKpEcOMC/X+zUIzgw6eLnzBjvcLlXZ4rXO+nxvAULI8kFeIH3nmBFIF7jo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165485-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 165485: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=f9294486926c865a3ef11cacd7cb6b26cce6f4a4
X-Osstest-Versions-That:
    xen=eb7518b89be6df874ec9b2bafadeaaa7c874ea6b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Oct 2021 04:40:38 +0000

flight 165485 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165485/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  f9294486926c865a3ef11cacd7cb6b26cce6f4a4
baseline version:
 xen                  eb7518b89be6df874ec9b2bafadeaaa7c874ea6b

Last test of basis   165482  2021-10-12 19:02:46 Z    0 days
Testing same since   165485  2021-10-13 01:00:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Christian Lindig <christian.lindig@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Michal Orzel <michal.orzel@arm.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   eb7518b89b..f929448692  f9294486926c865a3ef11cacd7cb6b26cce6f4a4 -> smoke


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A8644980
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 17:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455339.712785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ay2-0002gY-JV; Tue, 06 Dec 2022 16:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455339.712785; Tue, 06 Dec 2022 16:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ay2-0002eA-Fi; Tue, 06 Dec 2022 16:38:50 +0000
Received: by outflank-mailman (input) for mailman id 455339;
 Tue, 06 Dec 2022 16:38:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2ay0-0002e0-Sx; Tue, 06 Dec 2022 16:38:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2ay0-0004WN-QS; Tue, 06 Dec 2022 16:38:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p2ay0-0002UR-B8; Tue, 06 Dec 2022 16:38:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p2ay0-0005x5-Ag; Tue, 06 Dec 2022 16:38:48 +0000
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
	bh=T6ZehiggJxqDCXjkwx31wW2Mz9XZaVD0ufVACp3SXu4=; b=6X3UYOsWJx4YEB38HHFQz2OHil
	fLhlxpCo2EDkt0blQyBz0/CV77wjHQKh3q+8Jh5BcP8ou8p9YgWBEM0uZLroKQw05JrI99iTWEnRc
	sFxtEQpjTkkFPJvTkkrmzCDxWP+tGgVoCssz4+/w9iSXdb1dLlY9E70JAr0e1aQgIjR4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175060-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175060: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=a6da84524ceaf24ff997d03407b93f60c12857f3
X-Osstest-Versions-That:
    xen=9d67161388d8f611467660300bdf9715b7f110b0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 06 Dec 2022 16:38:48 +0000

flight 175060 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175060/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  a6da84524ceaf24ff997d03407b93f60c12857f3
baseline version:
 xen                  9d67161388d8f611467660300bdf9715b7f110b0

Last test of basis   175049  2022-12-05 15:00:25 Z    1 days
Testing same since   175060  2022-12-06 13:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Demi Marie Obenour <demi@invisiblethingslab.com>
  Jan Beulich <jbeulich@suse.com>
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
   9d67161388..a6da84524c  a6da84524ceaf24ff997d03407b93f60c12857f3 -> smoke


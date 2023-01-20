Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB56758F8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:45:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481970.747234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItZk-0005XP-5R; Fri, 20 Jan 2023 15:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481970.747234; Fri, 20 Jan 2023 15:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItZk-0005U1-1o; Fri, 20 Jan 2023 15:45:08 +0000
Received: by outflank-mailman (input) for mailman id 481970;
 Fri, 20 Jan 2023 15:45:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pItZi-0005Tr-T0; Fri, 20 Jan 2023 15:45:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pItZi-0000q9-R0; Fri, 20 Jan 2023 15:45:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pItZi-0002uf-CE; Fri, 20 Jan 2023 15:45:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pItZi-0008FQ-Bq; Fri, 20 Jan 2023 15:45:06 +0000
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
	bh=QPDFzd0om3tcvGwU2h/eUE4PWG30okiPUKAFQLDGxZ8=; b=DLMiNH1jrNvAvjMWHGeujEblfu
	KNKIRTJOtaUzUldSqy63UAeypDZsRrM4cWQe+OfquxQW9OF95gdr59gyOfoADoh2YimF5MIJnBnDL
	fuDHMVN4zhCGEKR9uSho+XNO861cAV+ijmVYib66QVrdRMwhvTCpfBx2opBfHjEveXeo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175997-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 175997: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=89cc5d96a9d1fce81cf58b6814dac62a9e07fbee
X-Osstest-Versions-That:
    xen=90caa47aa33efb6408514ce09721624a2bdf6694
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 20 Jan 2023 15:45:06 +0000

flight 175997 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175997/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  89cc5d96a9d1fce81cf58b6814dac62a9e07fbee
baseline version:
 xen                  90caa47aa33efb6408514ce09721624a2bdf6694

Last test of basis   175995  2023-01-20 09:00:27 Z    0 days
Testing same since   175997  2023-01-20 13:01:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ayan Kumar Halder <ayan.kumar.halder@amd.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Stefano Stabellini <sstabellini@kernel.org>

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
   90caa47aa3..89cc5d96a9  89cc5d96a9d1fce81cf58b6814dac62a9e07fbee -> smoke


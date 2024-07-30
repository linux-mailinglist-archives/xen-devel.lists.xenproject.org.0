Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44A1941480
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 16:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767886.1178588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYnxE-00070A-1T; Tue, 30 Jul 2024 14:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767886.1178588; Tue, 30 Jul 2024 14:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYnxD-0006yA-Ut; Tue, 30 Jul 2024 14:35:55 +0000
Received: by outflank-mailman (input) for mailman id 767886;
 Tue, 30 Jul 2024 14:35:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYnxC-0006y0-QU; Tue, 30 Jul 2024 14:35:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYnxC-0006al-LD; Tue, 30 Jul 2024 14:35:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYnxC-0007Bv-57; Tue, 30 Jul 2024 14:35:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sYnxC-0000i8-4X; Tue, 30 Jul 2024 14:35:54 +0000
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
	bh=2+gM/6f0MDNWoAhFrewR7nF5hOblejW6XVzt5OYZRx8=; b=fP3RjeyuNuaaiFPFyIAj5riizL
	mbrQl8X3+9zvMOC23xS/85XqMIRYmdGBN+U3FjgpGaqe+7pTK5NDb9Xo5mRj/6VPUn5JUe7zd5SVk
	yh0HawtfimTtb8Niv/Re4DTt7N0wIKOTpf7whIM25u+Ekump7QWAdB6a1+nTVB+Sn/bo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187054-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187054: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=303d3ff85c90ee4af4bad4e3b1d4932fa2634d64
X-Osstest-Versions-That:
    xen=8b5016e28737f140926619b14b8ca291dc4c5e62
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Jul 2024 14:35:54 +0000

flight 187054 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187054/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  303d3ff85c90ee4af4bad4e3b1d4932fa2634d64
baseline version:
 xen                  8b5016e28737f140926619b14b8ca291dc4c5e62

Last test of basis   187043  2024-07-29 16:02:08 Z    0 days
Testing same since   187054  2024-07-30 10:02:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Huang Rui <ray.huang@amd.com>
  Jan Beulich <jbeulich@suse.com>
  Jiqian Chen <Jiqian.Chen@amd.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Ross Lagerwall <ross.lagerwall@citrix.com>
  Simone Ballarin <simone.ballarin@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stewart Hildebrand <stewart.hildebrand@amd.com>

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
   8b5016e287..303d3ff85c  303d3ff85c90ee4af4bad4e3b1d4932fa2634d64 -> smoke


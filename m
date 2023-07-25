Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21E761122
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 12:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569613.890516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOFWT-0004Z4-6a; Tue, 25 Jul 2023 10:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569613.890516; Tue, 25 Jul 2023 10:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOFWT-0004Vk-3v; Tue, 25 Jul 2023 10:44:09 +0000
Received: by outflank-mailman (input) for mailman id 569613;
 Tue, 25 Jul 2023 10:44:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qOFWR-0004VT-PL; Tue, 25 Jul 2023 10:44:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qOFWR-0006CQ-OT; Tue, 25 Jul 2023 10:44:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qOFWR-0002jO-BB; Tue, 25 Jul 2023 10:44:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qOFWR-0004Qk-Af; Tue, 25 Jul 2023 10:44:07 +0000
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
	bh=6ODv3fRc/wW6IHpaFTVdMdbVFp3Tz/II2Y0CK8w025M=; b=VAeDJqZSihGC0u0KkS5zk5+vc4
	SYGWivlyw4ssTVSdpIMthxf0JO+gStQTlC41ISmL7IDN0xQPAapKhSlO5NSh9hBx0rPW8IuNV+6LL
	o14IS9fFGFhaJAn3UJUBFZWu/zz8GSrk+n76BQ/lMUnsutEYpz3RXoCuyh4GkiOdjxS0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182009-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 182009: tolerable FAIL - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:heisenbug
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:guest-localmigrate/x10:fail:heisenbug
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0b1171be87698bc7d14760383c0770aeb6e41dd4
X-Osstest-Versions-That:
    xen=f91c5ea970675637721bb7f18adaa189837eb783
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Jul 2023 10:44:07 +0000

flight 182009 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/182009/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl           8 xen-boot         fail in 182002 pass in 182009
 test-amd64-amd64-xl-qemuu-debianhvm-amd64 18 guest-localmigrate/x10 fail pass in 182002

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0b1171be87698bc7d14760383c0770aeb6e41dd4
baseline version:
 xen                  f91c5ea970675637721bb7f18adaa189837eb783

Last test of basis   181999  2023-07-24 17:02:22 Z    0 days
Testing same since   182002  2023-07-25 01:03:53 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Stefano Stabellini <stefano.stabellini@amd.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
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
   f91c5ea970..0b1171be87  0b1171be87698bc7d14760383c0770aeb6e41dd4 -> smoke


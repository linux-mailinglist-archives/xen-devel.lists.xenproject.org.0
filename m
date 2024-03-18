Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F1C87ED6B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694880.1084087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFjL-0002Sf-Jk; Mon, 18 Mar 2024 16:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694880.1084087; Mon, 18 Mar 2024 16:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFjL-0002PS-GK; Mon, 18 Mar 2024 16:20:55 +0000
Received: by outflank-mailman (input) for mailman id 694880;
 Mon, 18 Mar 2024 16:20:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmFjK-0002PI-9x; Mon, 18 Mar 2024 16:20:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmFjK-0005Jd-3z; Mon, 18 Mar 2024 16:20:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rmFjJ-0005Py-Pj; Mon, 18 Mar 2024 16:20:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rmFjJ-0004wb-PG; Mon, 18 Mar 2024 16:20:53 +0000
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
	bh=J24nDWbpyGkzzbQURknPrGOdkzkl69e6x+GFRm8FqTE=; b=P4sbNpV/ftoTTsNhpogerSM8Kc
	SRRTszwlVByMc9R5qnW08aC9YZB/aV6GeHubfYP0c134ynVAuuH+SW0o4VYZM3ptFPig/w6N2lH0v
	c8OPgH0om1XiSLB49Bty7RXSm4PPTefqexEuzjmXsA2r5pKY6yFB8SOQse3lIANxyVpY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185081-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 185081: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=62018f08708a5ff6ef8fc8ff2aaaac46e5a60430
X-Osstest-Versions-That:
    xen=d638e304f13a5ef7d125de5ace5f7828a7b25bac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 Mar 2024 16:20:53 +0000

flight 185081 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185081/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  62018f08708a5ff6ef8fc8ff2aaaac46e5a60430
baseline version:
 xen                  d638e304f13a5ef7d125de5ace5f7828a7b25bac

Last test of basis   185041  2024-03-14 19:01:16 Z    3 days
Testing same since   185081  2024-03-18 13:00:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  George Dunlap <george.dunlap@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Kevin Tian <kevin.tian@intel.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Vaishali Thakkar <vaishali.thakkar@vates.tech>
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
   d638e304f1..62018f0870  62018f08708a5ff6ef8fc8ff2aaaac46e5a60430 -> smoke


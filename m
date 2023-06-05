Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39BF723003
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 21:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543898.849270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6GA3-00014Z-KE; Mon, 05 Jun 2023 19:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543898.849270; Mon, 05 Jun 2023 19:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6GA3-000125-HR; Mon, 05 Jun 2023 19:46:39 +0000
Received: by outflank-mailman (input) for mailman id 543898;
 Mon, 05 Jun 2023 19:46:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6GA1-00011h-VC; Mon, 05 Jun 2023 19:46:37 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6GA1-0004XK-UM; Mon, 05 Jun 2023 19:46:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q6GA1-00010K-CG; Mon, 05 Jun 2023 19:46:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q6GA1-0001Rm-BZ; Mon, 05 Jun 2023 19:46:37 +0000
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
	bh=QseIdhKNMxiSNWhDoxvD6K+3vyVUbzpEUOqF3aPvPW0=; b=JtgQkjjECOojVVbFdM+QariXfB
	XcGIkcwBg+phKRFBTJqIOZzeMMViIjdsPVKqbX9kV3j9RaXO+higmqsooKsBvhdKIObhSlY7Nsikh
	3q0XIhN7o5RnPhTK7aOgGqLtTmBXP6BsqMRb1oqZJDADd1gHGEqzknfSzjhRTxvL5dNg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181195-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 181195: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=b35b22acb887f682efe8385b3df165220bc84c86
X-Osstest-Versions-That:
    xen=b3880c365db89051728e1de6b6889c750cbdd915
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 05 Jun 2023 19:46:37 +0000

flight 181195 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181195/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  b35b22acb887f682efe8385b3df165220bc84c86
baseline version:
 xen                  b3880c365db89051728e1de6b6889c750cbdd915

Last test of basis   181191  2023-06-05 14:01:55 Z    0 days
Testing same since   181195  2023-06-05 17:02:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Henry Wang <Henry.Wang@arm.com> # CHANGELOG
  Jan Beulich <jbeulich@suse.com>

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
   b3880c365d..b35b22acb8  b35b22acb887f682efe8385b3df165220bc84c86 -> smoke


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33DA7F1487
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 14:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636727.992447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r54UI-0007Rn-8o; Mon, 20 Nov 2023 13:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636727.992447; Mon, 20 Nov 2023 13:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r54UI-0007Pi-6G; Mon, 20 Nov 2023 13:38:54 +0000
Received: by outflank-mailman (input) for mailman id 636727;
 Mon, 20 Nov 2023 13:38:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r54UG-0007PY-Q3; Mon, 20 Nov 2023 13:38:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r54UG-0007Ds-NR; Mon, 20 Nov 2023 13:38:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r54UG-0002Nq-9D; Mon, 20 Nov 2023 13:38:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r54UG-0002Ti-8l; Mon, 20 Nov 2023 13:38:52 +0000
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
	bh=jzMQgvbF9R/RrteR0pJcfp4HlQaZPhF9RCXsbbU+B9g=; b=YUu8AWiDDzBWkW0mUtsRwpKXWX
	Y3KpK4nwTCiURidpN5xp23+EeHnaQ546q9Box6TxzUOpiU7OJCMzK258e5t98N+vbLppF4xKdRVfW
	saidk8eGgK38t9MeDXyeSAnJZccQGQtz3IbvaFcwkAGApZac7ApPL7rUeK0nq86qS1gY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183798-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 183798: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=cfb777791d39e025cf625ba1fa080597d4defef6
X-Osstest-Versions-That:
    xen=98758ae48974d6d24f999e4d9324e463d326f66f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 Nov 2023 13:38:52 +0000

flight 183798 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183798/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  cfb777791d39e025cf625ba1fa080597d4defef6
baseline version:
 xen                  98758ae48974d6d24f999e4d9324e463d326f66f

Last test of basis   183786  2023-11-18 03:02:10 Z    2 days
Testing same since   183798  2023-11-20 10:00:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Federico Serafini <federico.serafini@bugseng.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>

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
   98758ae489..cfb777791d  cfb777791d39e025cf625ba1fa080597d4defef6 -> smoke


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78AF8178BB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 18:29:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656321.1024442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFHR3-0003hd-NA; Mon, 18 Dec 2023 17:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656321.1024442; Mon, 18 Dec 2023 17:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFHR3-0003fQ-KH; Mon, 18 Dec 2023 17:29:45 +0000
Received: by outflank-mailman (input) for mailman id 656321;
 Mon, 18 Dec 2023 17:29:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFHR1-0003dp-GP; Mon, 18 Dec 2023 17:29:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFHR1-0002yn-9m; Mon, 18 Dec 2023 17:29:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rFHR0-0003ve-SR; Mon, 18 Dec 2023 17:29:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rFHR0-0005vv-Rx; Mon, 18 Dec 2023 17:29:42 +0000
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
	bh=9Y/9aLfwSEBcT8CyWzLhQvWFgPHW1vjKutqcD6Ys5AA=; b=i9k16gaT6rMaq/R6t7E/PLE+EL
	RZbsxR9xP+uN8AednZAj5pwxwoh1XCV6vwfITWmTHp/tCtCTM5j7z6BiVb5pR+qo8SJxoHWZGG5j+
	g+n70M6Gg4NNu1Oj3SHe5CmLA46FzBDWdx5G56jszyudeAAtgfskDHB/Zs4jgEr6X0Dg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184168-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 184168: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=0cc74376d6823e0883f89556be2a267f2240a558
X-Osstest-Versions-That:
    xen=a60067f39882a4f40547fc0cd8177bac89cb01b7
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 Dec 2023 17:29:42 +0000

flight 184168 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184168/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  0cc74376d6823e0883f89556be2a267f2240a558
baseline version:
 xen                  a60067f39882a4f40547fc0cd8177bac89cb01b7

Last test of basis   184147  2023-12-15 22:03:52 Z    2 days
Testing same since   184168  2023-12-18 15:03:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jan Beulich <jbeulich@suse.com>
  Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
  Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Simone Ballarin  <simone.ballarin@bugseng.com>

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
   a60067f398..0cc74376d6  0cc74376d6823e0883f89556be2a267f2240a558 -> smoke


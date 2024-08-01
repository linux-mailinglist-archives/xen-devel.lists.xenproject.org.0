Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EC7943D21
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 02:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769233.1180119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZK2I-0003Sl-Ax; Thu, 01 Aug 2024 00:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769233.1180119; Thu, 01 Aug 2024 00:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZK2I-0003PZ-7u; Thu, 01 Aug 2024 00:51:18 +0000
Received: by outflank-mailman (input) for mailman id 769233;
 Thu, 01 Aug 2024 00:51:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZK2G-0003PO-MY; Thu, 01 Aug 2024 00:51:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZK2G-0000kP-F9; Thu, 01 Aug 2024 00:51:16 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZK2G-0001xx-2Q; Thu, 01 Aug 2024 00:51:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZK2G-0006SS-1w; Thu, 01 Aug 2024 00:51:16 +0000
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
	bh=X2RosKM0+K+qecn+jBP+NHC9m751SatRn1UxPGjhhOk=; b=L/NfAkwj7ELS0jMM9qp5sQOLbC
	lOZN9C9iTmu4b+3TjTXmi/9qvjy7q6DdNkiCM7oXWNjlr8vd6RRs9/3XcrlYv7sjPNuIfLtj2Exmm
	bu3suvP918zarO4IifwUlHFMqxAJewmFdzbEElSfG1USwKP6IOheUNnx0T9uvGyl1jdU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187092-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 187092: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-xl-qemuu-debianhvm-amd64:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:xen-boot:fail:regression
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    xen-unstable-smoke:test-armhf-armhf-xl:xen-boot:fail:regression
X-Osstest-Versions-This:
    xen=e05e3cedb6dbe50e43b1d6a647c16a47219fde1d
X-Osstest-Versions-That:
    xen=6979e17b3f8a18d2ba5dbd4f0623c4061dae0dfc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Aug 2024 00:51:16 +0000

flight 187092 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187092/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  8 xen-boot    fail REGR. vs. 187068
 test-amd64-amd64-libvirt      8 xen-boot                 fail REGR. vs. 187068
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 187068
 test-armhf-armhf-xl           8 xen-boot                 fail REGR. vs. 187068

version targeted for testing:
 xen                  e05e3cedb6dbe50e43b1d6a647c16a47219fde1d
baseline version:
 xen                  6979e17b3f8a18d2ba5dbd4f0623c4061dae0dfc

Last test of basis   187068  2024-07-31 02:02:09 Z    0 days
Failing since        187075  2024-07-31 11:02:13 Z    0 days    3 attempts
Testing same since   187088  2024-07-31 17:00:43 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
  Andrew Cooper <andrew.cooper3@citrix.com>
  Federico Serafini <federico.serafini@bugseng.com>
  Fouad Hilly <fouad.hilly@cloud.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
  Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
  Nicola Vetrini <nicola.vetrini@bugseng.com>
  Oleksii Kurochko <oleksii.kurochko@gmail.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Simone Ballarin  <simone.ballarin@bugseng.com>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          fail    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    fail    
 test-amd64-amd64-libvirt                                     fail    


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


Not pushing.

(No revision log; it would be 383 lines long.)


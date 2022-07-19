Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E743A57A22C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 16:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370730.602597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDoWu-0007Jg-EC; Tue, 19 Jul 2022 14:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370730.602597; Tue, 19 Jul 2022 14:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDoWu-0007GE-B7; Tue, 19 Jul 2022 14:48:56 +0000
Received: by outflank-mailman (input) for mailman id 370730;
 Tue, 19 Jul 2022 14:48:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDoWt-0007G4-2V; Tue, 19 Jul 2022 14:48:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDoWt-0001fB-06; Tue, 19 Jul 2022 14:48:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oDoWs-00089D-IN; Tue, 19 Jul 2022 14:48:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oDoWs-0005LG-Ht; Tue, 19 Jul 2022 14:48:54 +0000
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
	bh=Xq/Uv3/bXo4b3mWuNU0DVmcCXOhHsuF58kMGgqKe3yg=; b=Jtt7P9rrho9u/6KA6vXDisqhfu
	Yilj5zrfR+xFLVEkOz0c8WF+ub6kYcFz418ISVeYlxzBnQnT8CchcmGEvUVnOCBKsvGcPx4woUcB/
	SLuFw2NpFDhBKM6fMvYVL2gclXvyVZjvCQCdqEShcoCeh3Uzq5hFCy0mzSuhZKMXfq1s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171685-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 171685: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=e500b6b8d07f87593a9d0e3a391456ef4ac5ee34
X-Osstest-Versions-That:
    xen=9723507daf2120131410c91980d4e4d9b0d0aa90
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 19 Jul 2022 14:48:54 +0000

flight 171685 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171685/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  e500b6b8d07f87593a9d0e3a391456ef4ac5ee34
baseline version:
 xen                  9723507daf2120131410c91980d4e4d9b0d0aa90

Last test of basis   171682  2022-07-19 07:06:21 Z    0 days
Testing same since   171685  2022-07-19 11:03:41 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Elliott Mitchell <ehem+xen@m5p.com>
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
   9723507daf..e500b6b8d0  e500b6b8d07f87593a9d0e3a391456ef4ac5ee34 -> smoke


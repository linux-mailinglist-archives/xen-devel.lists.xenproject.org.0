Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94942ABA0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 20:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207605.363486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maMB0-0001Ks-9A; Tue, 12 Oct 2021 18:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207605.363486; Tue, 12 Oct 2021 18:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maMB0-0001Iu-56; Tue, 12 Oct 2021 18:06:58 +0000
Received: by outflank-mailman (input) for mailman id 207605;
 Tue, 12 Oct 2021 18:06:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maMAy-0001Ik-6o; Tue, 12 Oct 2021 18:06:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maMAy-0007J5-0N; Tue, 12 Oct 2021 18:06:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maMAx-0002Pz-OC; Tue, 12 Oct 2021 18:06:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1maMAx-00086r-Nd; Tue, 12 Oct 2021 18:06:55 +0000
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
	bh=2S1WWrAsyPP+hLebhUVX/oqJZIfqiNGJIct5zoNddG8=; b=RyK3B9MONZVA/Ad8Z2J7KUgYoP
	1WTWnVnPA0cM39PtYo+a/aacxq8xZuqbRuYVGLCatnaV2GSLwxNEmU1/7SYAP+Zrk86TbyXkTKHxd
	+QjljWl7mOe8N0pNn2eCqUqs9LYtIHoC/IPvxmCjCuvKsZfuuya8rQnJH+YgkYkyj/es=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165479-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 165479: tolerable all pass - PUSHED
X-Osstest-Failures:
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=2faeb4213d9b412836fe80e5685bfcccc51feb92
X-Osstest-Versions-That:
    xen=d3b05f9b16d6ba9c550c3a35ac11ed292bf87f68
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 12 Oct 2021 18:06:55 +0000

flight 165479 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165479/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  2faeb4213d9b412836fe80e5685bfcccc51feb92
baseline version:
 xen                  d3b05f9b16d6ba9c550c3a35ac11ed292bf87f68

Last test of basis   165475  2021-10-12 10:01:35 Z    0 days
Testing same since   165479  2021-10-12 14:00:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dmitry Isaykin <isaikin-dmitry@yandex.ru>

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
   d3b05f9b16..2faeb4213d  2faeb4213d9b412836fe80e5685bfcccc51feb92 -> smoke


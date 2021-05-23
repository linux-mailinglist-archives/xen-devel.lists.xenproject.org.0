Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78D38DAD5
	for <lists+xen-devel@lfdr.de>; Sun, 23 May 2021 12:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131564.245842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkkyv-0000HU-Jn; Sun, 23 May 2021 10:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131564.245842; Sun, 23 May 2021 10:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkkyv-0000Ew-Du; Sun, 23 May 2021 10:05:13 +0000
Received: by outflank-mailman (input) for mailman id 131564;
 Sun, 23 May 2021 10:05:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lkkyu-0000Em-Nt; Sun, 23 May 2021 10:05:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lkkyu-0001Xq-Fc; Sun, 23 May 2021 10:05:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lkkyu-0004WU-6c; Sun, 23 May 2021 10:05:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lkkyu-0003ci-60; Sun, 23 May 2021 10:05:12 +0000
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
	bh=Ul/wf4zYy8MDG/sXGglWks2KnUp3FRCc1zQIL6Wuh+g=; b=k04nD9lNtpkkuWc2XKQQwx+WVn
	0SUu2YuUFIop63QvmhPlBV3D6fJvhY6eeiGC3yaCrlK4gdl5JlDs3P8ZYmdaJy4bo4J6yBQYfL/1D
	A4ea47UWMROpwCRm3Qe2WMDleET+K8r78/R+O+A0ErENUibm3BnLeoorb/LBhwbmZrlY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162130-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 162130: all pass - PUSHED
X-Osstest-Versions-This:
    xen=aa77acc28098d04945af998f3fc0dbd3759b5b41
X-Osstest-Versions-That:
    xen=caa9c4471d1d74b2d236467aaf7e63a806ac11a4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 23 May 2021 10:05:12 +0000

flight 162130 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162130/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  aa77acc28098d04945af998f3fc0dbd3759b5b41
baseline version:
 xen                  caa9c4471d1d74b2d236467aaf7e63a806ac11a4

Last test of basis   162086  2021-05-19 09:18:32 Z    4 days
Testing same since   162130  2021-05-23 09:20:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


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
   caa9c4471d..aa77acc280  aa77acc28098d04945af998f3fc0dbd3759b5b41 -> coverity-tested/smoke


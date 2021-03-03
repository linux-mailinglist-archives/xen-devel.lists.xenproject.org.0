Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F57B32B65D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 10:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92793.174906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHOEx-00016p-KP; Wed, 03 Mar 2021 09:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92793.174906; Wed, 03 Mar 2021 09:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHOEx-00016O-Gg; Wed, 03 Mar 2021 09:56:23 +0000
Received: by outflank-mailman (input) for mailman id 92793;
 Wed, 03 Mar 2021 09:56:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lHOEv-00016F-Iy; Wed, 03 Mar 2021 09:56:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lHOEv-00051I-B2; Wed, 03 Mar 2021 09:56:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lHOEu-0006Xj-9a; Wed, 03 Mar 2021 09:56:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lHOEu-0003pl-95; Wed, 03 Mar 2021 09:56:20 +0000
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
	bh=1tS8efy4ykp6mLwQ/z0RMqwqu1PxBXBUmWaQK0M/tLk=; b=GQ6R8c3o4jDuDKVVPjdBQRqQKc
	96/dHisHf+xboGJKAdOLIVVt7TteAxAQI2uCAfala+Fo9a6moLepmv8TCFQsubCwROIHUVEQCqhfE
	kkfzK0NQrX7CVMGKcGv3HX11KQAbIddLk3j5sYtop0sIBBHVpkpssHZLhivx6hMWL9Ts=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159815-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 159815: all pass - PUSHED
X-Osstest-Versions-This:
    xen=4834936549f788378918da8e9bc97df7dd3ee16d
X-Osstest-Versions-That:
    xen=c4441ab1f1d506a942002ccc55fdde2fe30ef626
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Mar 2021 09:56:20 +0000

flight 159815 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159815/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  4834936549f788378918da8e9bc97df7dd3ee16d
baseline version:
 xen                  c4441ab1f1d506a942002ccc55fdde2fe30ef626

Last test of basis   159783  2021-02-28 09:19:28 Z    3 days
Testing same since   159815  2021-03-03 09:19:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Tim Deegan <tim@xen.org>

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
   c4441ab1f1..4834936549  4834936549f788378918da8e9bc97df7dd3ee16d -> coverity-tested/smoke


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BFD2F91AA
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jan 2021 11:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69202.123872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l155G-0007HM-3X; Sun, 17 Jan 2021 10:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69202.123872; Sun, 17 Jan 2021 10:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l155G-0007Gx-0H; Sun, 17 Jan 2021 10:14:58 +0000
Received: by outflank-mailman (input) for mailman id 69202;
 Sun, 17 Jan 2021 10:14:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l155E-0007Gp-Tk; Sun, 17 Jan 2021 10:14:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l155E-00081o-L5; Sun, 17 Jan 2021 10:14:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l155E-00021G-C9; Sun, 17 Jan 2021 10:14:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l155E-0007t2-Bf; Sun, 17 Jan 2021 10:14:56 +0000
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
	bh=YISP/stlG6VD4p1ZxND7ggrwYhBHohh8XIMNVBqHFY4=; b=indMbBVGVzaavO1pJXX00yarf5
	oRSVbRr0heXXJCS5IUyJFhtmTVdFSAjyggFKVMUbOUE7f4jLOt11JAeulg6NQ/5l3pELR06Z1aXS+
	F2UZumZZsB4uXCipDIhNIH3aRgX36KcLowUy/5mBzgC27a2YztPotHfg8qJq5SoJiEiU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158472-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 158472: all pass - PUSHED
X-Osstest-Versions-This:
    xen=db9c4ad1b1abaef3c38027b9b2700d9250d13125
X-Osstest-Versions-That:
    xen=414be7b66349e7dca42bc1fd47c2b2f5b2d27432
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 17 Jan 2021 10:14:56 +0000

flight 158472 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158472/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  db9c4ad1b1abaef3c38027b9b2700d9250d13125
baseline version:
 xen                  414be7b66349e7dca42bc1fd47c2b2f5b2d27432

Last test of basis   158404  2021-01-13 09:20:27 Z    4 days
Testing same since   158472  2021-01-17 09:19:26 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Christopher Clark <christopher.w.clark@gmail.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Manuel Bouyer <bouyer@netbsd.org>
  Olaf Hering <olaf@aepfle.de>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>
  Tamas K Lengyel <tamas@tklengyel.com>
  Wei Chen <wei.chen@arm.com>
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
   414be7b663..db9c4ad1b1  db9c4ad1b1abaef3c38027b9b2700d9250d13125 -> coverity-tested/smoke


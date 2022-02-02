Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7AF4A6E56
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 11:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263991.456937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCVu-0004OI-VK; Wed, 02 Feb 2022 10:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263991.456937; Wed, 02 Feb 2022 10:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCVu-0004LF-QC; Wed, 02 Feb 2022 10:05:22 +0000
Received: by outflank-mailman (input) for mailman id 263991;
 Wed, 02 Feb 2022 10:05:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFCVt-0004JY-DG; Wed, 02 Feb 2022 10:05:21 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFCVt-0006z2-CR; Wed, 02 Feb 2022 10:05:21 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nFCVt-0002Tc-2Q; Wed, 02 Feb 2022 10:05:21 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nFCVt-0001dr-1t; Wed, 02 Feb 2022 10:05:21 +0000
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
	bh=IhWjaQVTpxC8y0I1FLsDhAHU05+oZDYtsN3QsbkigPI=; b=Z7QOHCnWUlhPp8O0JZNTOXkxVu
	ZwXZ/G4lV6XpHs+rjk7rQ5XY/jozy6XRFUqfK+t2eR5IoQBWTF1RZRiZ0F7gDdJL80wdfiLiTwupJ
	FkRNSnpwfGXW+vj5A5uRXi9wPSRs9UOEn0hLXLi2DbO/K0W3nm1bLj5ECHP1QkJ2OLvs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167984-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 167984: all pass - PUSHED
X-Osstest-Versions-This:
    xen=9ce3ef20b4f085a7dc8ee41b0fec6fdeced3773e
X-Osstest-Versions-That:
    xen=21170a738c11b24815b4afab2151bd3aa2a29acc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Feb 2022 10:05:21 +0000

flight 167984 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167984/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  9ce3ef20b4f085a7dc8ee41b0fec6fdeced3773e
baseline version:
 xen                  21170a738c11b24815b4afab2151bd3aa2a29acc

Last test of basis   167953  2022-01-30 09:20:52 Z    3 days
Testing same since   167984  2022-02-02 09:19:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Dario Faggioli <dfaggioli@suse.com>
  James Fehlig <jfehlig@suse.com>
  Jan Beulich <jbeulich@suse.com>
  Juergen Gross <jgross@suse.com>
  Julien Grall <jgrall@amazon.com>
  Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
  Rahul Singh <rahul.singh@arm.com>

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
   21170a738c..9ce3ef20b4  9ce3ef20b4f085a7dc8ee41b0fec6fdeced3773e -> coverity-tested/smoke


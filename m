Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7567A36D53E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 11:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119166.225560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgyh-00049W-UG; Wed, 28 Apr 2021 09:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119166.225560; Wed, 28 Apr 2021 09:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgyh-000491-Q4; Wed, 28 Apr 2021 09:59:31 +0000
Received: by outflank-mailman (input) for mailman id 119166;
 Wed, 28 Apr 2021 09:59:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbgyg-00048o-Ll; Wed, 28 Apr 2021 09:59:30 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbgyg-0002V5-Dd; Wed, 28 Apr 2021 09:59:30 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lbgyg-0004in-1F; Wed, 28 Apr 2021 09:59:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lbgyg-0000lI-0l; Wed, 28 Apr 2021 09:59:30 +0000
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
	bh=ENQz2cl4j+JD7MjieK67i2HCZC49BT6bZxKbqVe40ys=; b=tViAdRhPB6K7OWklHQXsN8m1w9
	Jy3F0EFiV3aaJxpjUxD0wJB3TrFxOSK/6Y1EnpM5jN3ftiweI/NbNzv8ZiGp1B7g7AIXVcLAH1AX/
	ld5/gZ3Qpo9CFKJz/pHQjIiVSRp5AGp2MSUEAvqKY/ihqv32pMwqUgnyGd/2u9Fgissw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161502-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161502: all pass - PUSHED
X-Osstest-Versions-This:
    xen=972ba1d1d4bcb77018b50fd2bb63c0e628859ed3
X-Osstest-Versions-That:
    xen=bea65a212c0581520203b6ad0d07615693f42f73
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Apr 2021 09:59:30 +0000

flight 161502 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161502/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  972ba1d1d4bcb77018b50fd2bb63c0e628859ed3
baseline version:
 xen                  bea65a212c0581520203b6ad0d07615693f42f73

Last test of basis   161447  2021-04-25 09:19:30 Z    3 days
Testing same since   161502  2021-04-28 09:18:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chao Gao <chao.gao@intel.com>
  Igor Druzhinin <igor.druzhinin@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
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
   bea65a212c..972ba1d1d4  972ba1d1d4bcb77018b50fd2bb63c0e628859ed3 -> coverity-tested/smoke


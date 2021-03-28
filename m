Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7132934BBD6
	for <lists+xen-devel@lfdr.de>; Sun, 28 Mar 2021 11:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102373.196069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQS2h-0005AN-Jc; Sun, 28 Mar 2021 09:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102373.196069; Sun, 28 Mar 2021 09:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQS2h-00059r-Dy; Sun, 28 Mar 2021 09:49:11 +0000
Received: by outflank-mailman (input) for mailman id 102373;
 Sun, 28 Mar 2021 09:49:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lQS2f-00059j-6r; Sun, 28 Mar 2021 09:49:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lQS2e-0003uh-TL; Sun, 28 Mar 2021 09:49:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lQS2e-0003C7-KD; Sun, 28 Mar 2021 09:49:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lQS2e-00077Z-Jf; Sun, 28 Mar 2021 09:49:08 +0000
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
	bh=vKkU5mXyuOc+SfEBE+uDK+Usx5E46C7Ty6lAFRyWESw=; b=rpMBX2t7ve59Uxl0M4/s9W8YBK
	ISr3qs53NNc6asz8PvmIN5ZUzxkiiaNNrzlKGscfM+9Cli/vnAaW3f4StuFpgj9a+JQPEcLlyJZde
	USIQd/AbWV3wLzCvadY9td0vQvKoteFZbmUluwRfh5T0lqJAsi7i5baAl2chXNyQJ9w8=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160495-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 160495: all pass - PUSHED
X-Osstest-Versions-This:
    xen=e680cc48b7184d3489873d6776f84ba1fc238ced
X-Osstest-Versions-That:
    xen=b9b3082002cac68726fb303e0abd2ff0113d4657
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Mar 2021 09:49:08 +0000

flight 160495 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160495/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  e680cc48b7184d3489873d6776f84ba1fc238ced
baseline version:
 xen                  b9b3082002cac68726fb303e0abd2ff0113d4657

Last test of basis   160385  2021-03-24 09:18:28 Z    4 days
Testing same since   160495  2021-03-28 09:19:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Tamas K Lengyel <tamas.lengyel@intel.com>

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
   b9b3082002..e680cc48b7  e680cc48b7184d3489873d6776f84ba1fc238ced -> coverity-tested/smoke


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD37381DCD
	for <lists+xen-devel@lfdr.de>; Sun, 16 May 2021 12:08:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127917.240305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liDgk-0001p3-6I; Sun, 16 May 2021 10:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127917.240305; Sun, 16 May 2021 10:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liDgk-0001lT-09; Sun, 16 May 2021 10:07:58 +0000
Received: by outflank-mailman (input) for mailman id 127917;
 Sun, 16 May 2021 10:07:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1liDgi-0001kT-3A; Sun, 16 May 2021 10:07:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1liDgh-0002Tt-Rx; Sun, 16 May 2021 10:07:55 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1liDgh-0005jD-Ko; Sun, 16 May 2021 10:07:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1liDgh-0005ww-KE; Sun, 16 May 2021 10:07:55 +0000
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
	bh=7IBT4hdzKo0Nr4gpXKsP+oaYWReQYY4f9EpbqK83PwU=; b=1zM+IlHtVy1fJnDVr3mRHUiV9w
	AnMIOl9WZoZndfz48uhQXpc4jz85bQT2h9JhJC58/LO+w5tSZ4dRRi7BtEKtY1b55lt5sPVMrOfxM
	kxgoXSshUlqE9uH8ib3cDWZzjjLDZuIcWM37x1X7zgEskTnqQbm9F9uFZtm/SRYbifIg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-161968-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 161968: all pass - PUSHED
X-Osstest-Versions-This:
    xen=cb199cc7de987cfda4659fccf51059f210f6ad34
X-Osstest-Versions-That:
    xen=d4fb5f166c2bfbaf9ba0de69da0d411288f437a9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 16 May 2021 10:07:55 +0000

flight 161968 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/161968/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  cb199cc7de987cfda4659fccf51059f210f6ad34
baseline version:
 xen                  d4fb5f166c2bfbaf9ba0de69da0d411288f437a9

Last test of basis   161916  2021-05-12 09:19:39 Z    4 days
Testing same since   161968  2021-05-16 09:19:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Julien Grall <jgrall@amazon.com>
  Olaf Hering <olaf@aepfle.de>
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
   d4fb5f166c..cb199cc7de  cb199cc7de987cfda4659fccf51059f210f6ad34 -> coverity-tested/smoke


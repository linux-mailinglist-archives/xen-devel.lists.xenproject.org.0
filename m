Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3254B850C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 11:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273908.469210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKH6r-000389-4A; Wed, 16 Feb 2022 10:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273908.469210; Wed, 16 Feb 2022 10:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKH6r-000364-0p; Wed, 16 Feb 2022 10:00:29 +0000
Received: by outflank-mailman (input) for mailman id 273908;
 Wed, 16 Feb 2022 10:00:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nKH6p-00035u-I8; Wed, 16 Feb 2022 10:00:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nKH6p-0004nu-FW; Wed, 16 Feb 2022 10:00:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nKH6p-0004qH-1F; Wed, 16 Feb 2022 10:00:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nKH6p-0001lL-0n; Wed, 16 Feb 2022 10:00:27 +0000
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
	bh=ijzd62xUzpqjs1/+JMu9Yu+QsrnDnhAeuq0+OvmMfmU=; b=WY5B+nx6ji57XGhDSTv1nVJbJo
	HFXWQXuIjMwNfkmmNcG/uZi4jsRmJzwOj5NR9rRJhxd925/VkQbrsD24r4Ix96IqhoUMsoQsaXjxb
	2NnxMHzbBeqxkFCYrCMSyXd+r7CjO9ra97BSJricupGgnXl7Axyms8qu24EYv38qYwwA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168128-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 168128: all pass - PUSHED
X-Osstest-Versions-This:
    xen=e7c2017cf4a91ab6a0fea6adca2d9dd2ab1603b0
X-Osstest-Versions-That:
    xen=87319afb96973213ec0a76270d93696f3b8d6743
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 16 Feb 2022 10:00:27 +0000

flight 168128 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168128/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  e7c2017cf4a91ab6a0fea6adca2d9dd2ab1603b0
baseline version:
 xen                  87319afb96973213ec0a76270d93696f3b8d6743

Last test of basis   168100  2022-02-13 09:18:29 Z    3 days
Testing same since   168128  2022-02-16 09:19:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Norbert Manthey <nmanthey@amazon.de>
  Roger Pau Monné <roger.pau@citrix.com>
  Stefano Stabellini <sstabellini@kernel.org>
  Stefano Stabellini <stefano.stabellini@xilinx.com>

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
   87319afb96..e7c2017cf4  e7c2017cf4a91ab6a0fea6adca2d9dd2ab1603b0 -> coverity-tested/smoke


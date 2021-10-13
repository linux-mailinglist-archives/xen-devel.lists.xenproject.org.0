Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CFB42BC31
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 11:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208161.364206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maaxL-0005u0-V9; Wed, 13 Oct 2021 09:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208161.364206; Wed, 13 Oct 2021 09:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maaxL-0005ru-RB; Wed, 13 Oct 2021 09:53:51 +0000
Received: by outflank-mailman (input) for mailman id 208161;
 Wed, 13 Oct 2021 09:53:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maaxK-0005ri-Oz; Wed, 13 Oct 2021 09:53:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maaxK-0001fv-KM; Wed, 13 Oct 2021 09:53:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1maaxK-0002Ta-E8; Wed, 13 Oct 2021 09:53:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1maaxK-0005ql-De; Wed, 13 Oct 2021 09:53:50 +0000
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
	bh=PLAiH6vnY6DFnKqdANXhN9nmXNklGtMUr1hrUbnFSx4=; b=bq3HPOnt/g3bur8j3gW8QAhEGS
	obt9cyJcePG0IDZst6qToicjA2vEzchGSvwppZRVGspKcc54silroF713rjFMhK9GDc9cKZsExtd1
	bL6Iwx/vcC66lBmIn4QbhFfw1ZkqjbKKvcvUk+jH5k/P40MQIzhHXdcuqAtPm/kRXePI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165493-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 165493: all pass - PUSHED
X-Osstest-Versions-This:
    xen=f9294486926c865a3ef11cacd7cb6b26cce6f4a4
X-Osstest-Versions-That:
    xen=664cc3c3d381e4f9a61dcb68cbd7a6a00070370e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Oct 2021 09:53:50 +0000

flight 165493 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165493/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  f9294486926c865a3ef11cacd7cb6b26cce6f4a4
baseline version:
 xen                  664cc3c3d381e4f9a61dcb68cbd7a6a00070370e

Last test of basis   165453  2021-10-10 09:19:39 Z    3 days
Testing same since   165493  2021-10-13 09:20:53 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Anthony PERARD <anthony.perard@citrix.com>
  Christian Lindig <christian.lindig@citrix.com>
  Christopher Clark <christopher.w.clark@gmail.com>
  Dmitry Isaykin <isaikin-dmitry@yandex.ru>
  Ian Jackson <iwj@xenproject.org>
  Jan Beulich <jbeulich@suse.com>
  Julien Grall <jgrall@amazon.com>
  Luca Fancellu <luca.fancellu@arm.com>
  Michal Orzel <michal.orzel@arm.com>
  Nick Rosbrook <rosbrookn@ainfosec.com>
  Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  Rahul Singh <rahul.singh@arm.com>
  Roger Pau Monne <roger.pau@citrix.com>
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
   664cc3c3d3..f929448692  f9294486926c865a3ef11cacd7cb6b26cce6f4a4 -> coverity-tested/smoke


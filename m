Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF2748190
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559008.873647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzIq-0006w4-Ny; Wed, 05 Jul 2023 10:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559008.873647; Wed, 05 Jul 2023 10:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzIq-0006uu-L4; Wed, 05 Jul 2023 10:00:04 +0000
Received: by outflank-mailman (input) for mailman id 559008;
 Wed, 05 Jul 2023 10:00:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qGzIp-0006hl-Ft; Wed, 05 Jul 2023 10:00:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qGzIp-0003ye-AN; Wed, 05 Jul 2023 10:00:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qGzIo-0003VF-Pq; Wed, 05 Jul 2023 10:00:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qGzIo-0002RK-PP; Wed, 05 Jul 2023 10:00:02 +0000
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
	bh=T0rZCL7xykdFm88wEhYGTOg4bjGxge2L9LXulpto4QM=; b=c2Jf5UwnoiU/75AaUNFVoXux+7
	ZZN2RpdbXYxZFBzuw36wFqd17yH15tyKN1AWiJRZdhyKmBzd14VbpykZFGhWKGIZlyDBvi57Kiut0
	9ZMAA12bJJU7YmPIIlwl6PBVsHp5sh3YoDGhjagf5EB1UNWqZNG/FKqX6z/tlN4Q7bQg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181702-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181702: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1fadd18d0c0c65ffde9e128a486414ba43b3387c
X-Osstest-Versions-That:
    ovmf=6c744465b6970080dadb1f297db024284153c912
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 05 Jul 2023 10:00:02 +0000

flight 181702 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181702/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1fadd18d0c0c65ffde9e128a486414ba43b3387c
baseline version:
 ovmf                 6c744465b6970080dadb1f297db024284153c912

Last test of basis   181687  2023-07-03 14:42:16 Z    1 days
Testing same since   181702  2023-07-05 07:40:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Hongbin1 Zhang <hongbin1.zhang@intel.com>
  Zhang, Hongbin1 <Hongbin1.Zhang@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    


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

To xenbits.xen.org:/home/xen/git/osstest/ovmf.git
   6c744465b6..1fadd18d0c  1fadd18d0c0c65ffde9e128a486414ba43b3387c -> xen-tested-master


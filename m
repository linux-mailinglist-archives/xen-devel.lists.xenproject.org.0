Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B463FD19E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 05:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176029.320428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLGVj-0004Md-3I; Wed, 01 Sep 2021 03:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176029.320428; Wed, 01 Sep 2021 03:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLGVi-0004JT-Ul; Wed, 01 Sep 2021 03:01:58 +0000
Received: by outflank-mailman (input) for mailman id 176029;
 Wed, 01 Sep 2021 03:01:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLGVh-0004JJ-4j; Wed, 01 Sep 2021 03:01:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLGVg-0007rS-Q4; Wed, 01 Sep 2021 03:01:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mLGVg-0005wc-Ec; Wed, 01 Sep 2021 03:01:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mLGVg-00054f-E8; Wed, 01 Sep 2021 03:01:56 +0000
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
	bh=8XobyDTf2lcU9muUOeEgU4L9AZs5529FnQYkcyxysuM=; b=PYihxzdfiY+wI3VTce7ppsF7a9
	vv6SuHrCXIO6JoZE8kDDgDWccJXh0luobnspQWPRz465EuZPuqv586J8V1vcyoT84Z277CQ5XIv5P
	8XdScBPNdlEl4ABI+h859rhQd/AwCY1MoNE0G1DLBmfSsHwPv/yUsg5eGbK0jZZAUvLk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164674-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164674: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cae735f61328d64e2e8991036707b9e78c0f5f63
X-Osstest-Versions-That:
    ovmf=77d5fa80246e8784f89e109ff9dadfeb7089ff85
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Sep 2021 03:01:56 +0000

flight 164674 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164674/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cae735f61328d64e2e8991036707b9e78c0f5f63
baseline version:
 ovmf                 77d5fa80246e8784f89e109ff9dadfeb7089ff85

Last test of basis   164630  2021-08-30 01:10:45 Z    2 days
Testing same since   164674  2021-08-31 02:56:52 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Cheng Zhou <zhoucheng@phytium.com.cn>
  Grzegorz Bernacki <gjb@semihalf.com>
  Hao A Wu <hao.a.wu@intel.com>
  Marvin H?user <mhaeuser@posteo.de>
  zhoucheng <zhoucheng@phytium.com.cn>

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
   77d5fa8024..cae735f613  cae735f61328d64e2e8991036707b9e78c0f5f63 -> xen-tested-master


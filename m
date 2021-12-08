Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A246CF43
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 09:42:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242072.418727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1musX5-0000Lp-2V; Wed, 08 Dec 2021 08:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242072.418727; Wed, 08 Dec 2021 08:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1musX4-0000Iu-TV; Wed, 08 Dec 2021 08:42:34 +0000
Received: by outflank-mailman (input) for mailman id 242072;
 Wed, 08 Dec 2021 08:42:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1musX3-0000Ik-Jx; Wed, 08 Dec 2021 08:42:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1musX3-00019D-Cp; Wed, 08 Dec 2021 08:42:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1musX2-0003oN-Iz; Wed, 08 Dec 2021 08:42:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1musX2-000681-IV; Wed, 08 Dec 2021 08:42:32 +0000
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
	bh=W5Gv22lpteJhmF8Fk/ewlsVCUwYPbR9GScnlHmN7BTA=; b=aIPTfPFcZ7YH703cLJyPhG8wot
	KCpw5OWDK1/2zAWkL/t3nI0Oeh4oInHcJZeapXqTGqKmzg+Hcxj5+IPdAKWBM28tNWlkl2iNqOQyc
	wO8xxbGViFf4DfjiW608G3P2ITAe/V7AiYjbsmKBZGsKawCr/s687KKQ1Wp+5kf23ZHM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167225-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167225: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7c0ad2c33810ead45b7919f8f8d0e282dae52e71
X-Osstest-Versions-That:
    ovmf=dfafa8e45382939fb5dc78e9d37b97b500a43613
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 08 Dec 2021 08:42:32 +0000

flight 167225 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167225/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7c0ad2c33810ead45b7919f8f8d0e282dae52e71
baseline version:
 ovmf                 dfafa8e45382939fb5dc78e9d37b97b500a43613

Last test of basis   167122  2021-12-04 23:14:58 Z    3 days
Testing same since   167225  2021-12-07 17:43:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   dfafa8e453..7c0ad2c338  7c0ad2c33810ead45b7919f8f8d0e282dae52e71 -> xen-tested-master


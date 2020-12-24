Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6B22E2873
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 18:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58782.103587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksUnN-0001wj-Bd; Thu, 24 Dec 2020 17:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58782.103587; Thu, 24 Dec 2020 17:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksUnN-0001wD-7Q; Thu, 24 Dec 2020 17:53:01 +0000
Received: by outflank-mailman (input) for mailman id 58782;
 Thu, 24 Dec 2020 17:52:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ksUnL-0001w5-OU; Thu, 24 Dec 2020 17:52:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ksUnL-0002YZ-I7; Thu, 24 Dec 2020 17:52:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ksUnL-00030a-AG; Thu, 24 Dec 2020 17:52:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ksUnL-0007k0-9m; Thu, 24 Dec 2020 17:52:59 +0000
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
	bh=Ez3mjcQ/05l9Pas12JrKdbN5DuCxBHEUK39yGX5beHM=; b=jht1NPKy/UwdahFf2npy4XtgP6
	5VPteNlAZxJFp8OEHd5fusmcM3cD4MxTwFipNVHYWRy1dr57XXYm3KuygvH60NobYMl+/Tx32RH2y
	Zgc82UXwN5MBejnrrdjUaXERKBxMt7hEh6gCeoniy5uABOQTXS7IzdzwZTNStBW2pXcM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157875-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157875: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=140674a4601f804302e79d08cb06f91c882ddf28
X-Osstest-Versions-That:
    ovmf=e2747dbb5a44f4a463ecc6dd0f7fd113ee57bd67
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 24 Dec 2020 17:52:59 +0000

flight 157875 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157875/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 140674a4601f804302e79d08cb06f91c882ddf28
baseline version:
 ovmf                 e2747dbb5a44f4a463ecc6dd0f7fd113ee57bd67

Last test of basis   157856  2020-12-23 14:11:47 Z    1 days
Testing same since   157875  2020-12-24 14:39:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>

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
   e2747dbb5a..140674a460  140674a4601f804302e79d08cb06f91c882ddf28 -> xen-tested-master


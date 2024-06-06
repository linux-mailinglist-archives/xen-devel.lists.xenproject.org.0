Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DC68FDB53
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 02:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735859.1141976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF0qP-000423-Ft; Thu, 06 Jun 2024 00:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735859.1141976; Thu, 06 Jun 2024 00:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF0qP-00040K-Cs; Thu, 06 Jun 2024 00:19:05 +0000
Received: by outflank-mailman (input) for mailman id 735859;
 Thu, 06 Jun 2024 00:19:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sF0qN-00040A-G9; Thu, 06 Jun 2024 00:19:03 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sF0qN-0004SE-Dl; Thu, 06 Jun 2024 00:19:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sF0qN-0006D6-24; Thu, 06 Jun 2024 00:19:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sF0qN-0008SJ-1e; Thu, 06 Jun 2024 00:19:03 +0000
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
	bh=wSqcDAMk6I3+V57lptTSwCLgHyBLCa0YB0XZqp2dzF8=; b=PStgLMYgaxCInVG8oFI+tCh1Px
	WWKRZY7bdudMqrpPJbfq0uztfGghQSAq518BLobbT5oCmccIU/Hb1pQtGnggsBTTrJjz3CPyJmv5a
	zWufTROGkt70r4PBxx7m4eAB5a7Q0bz4acXPhJ5ge2Xfgm6GaG3nU5eQ5UyD7g2WQ+x4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186259-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186259: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=10ab1c67c489942b787b784a48d46623b442cfd1
X-Osstest-Versions-That:
    ovmf=10cd8b45ce36152996bcb1520ba36107a8cdc63f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 06 Jun 2024 00:19:03 +0000

flight 186259 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186259/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 10ab1c67c489942b787b784a48d46623b442cfd1
baseline version:
 ovmf                 10cd8b45ce36152996bcb1520ba36107a8cdc63f

Last test of basis   186256  2024-06-05 12:44:34 Z    0 days
Testing same since   186259  2024-06-05 22:11:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chao Li <lichao@loongson.cn>

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
   10cd8b45ce..10ab1c67c4  10ab1c67c489942b787b784a48d46623b442cfd1 -> xen-tested-master


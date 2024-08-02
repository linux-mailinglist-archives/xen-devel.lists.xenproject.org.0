Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFF394558E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 02:38:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770031.1180886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZgHt-00053u-8U; Fri, 02 Aug 2024 00:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770031.1180886; Fri, 02 Aug 2024 00:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZgHt-00051N-5k; Fri, 02 Aug 2024 00:36:53 +0000
Received: by outflank-mailman (input) for mailman id 770031;
 Fri, 02 Aug 2024 00:36:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZgHr-00051D-P2; Fri, 02 Aug 2024 00:36:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZgHr-0002Q9-CL; Fri, 02 Aug 2024 00:36:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sZgHq-00061Y-RK; Fri, 02 Aug 2024 00:36:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sZgHq-0000CU-Qn; Fri, 02 Aug 2024 00:36:50 +0000
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
	bh=I57gTzq18IBgXP2u4PMx0g93frw1WHbAJNMHL8Da+0Y=; b=pu718di1N8kKKOi1RK11ccs5Pr
	dmufQCbHzgstcxXEuBhMu5CrLcO4Vft+pK2+prcXVROmZr6D6zyqkaktcJgyAnTHN9Awx8RAfc2ML
	t/E5YKhJTHpWOO/zZBTRZ0/EejM2zv8JYDCReb7LfrsJDuE+nKMXq2prqFvHjJEoAHgM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187114-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187114: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bbee1cc852fa8676ed0b530b1c67c92f32f4f740
X-Osstest-Versions-That:
    ovmf=b0e7a75a4959a481cc6b857d6e6a9607d14523bf
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Aug 2024 00:36:50 +0000

flight 187114 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187114/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bbee1cc852fa8676ed0b530b1c67c92f32f4f740
baseline version:
 ovmf                 b0e7a75a4959a481cc6b857d6e6a9607d14523bf

Last test of basis   187111  2024-08-01 19:45:07 Z    0 days
Testing same since   187114  2024-08-01 21:42:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Rebecca Cran <rebecca@bsdio.com>

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
   b0e7a75a49..bbee1cc852  bbee1cc852fa8676ed0b530b1c67c92f32f4f740 -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EE973E10A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 15:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555515.867334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmba-0003Mo-Rf; Mon, 26 Jun 2023 13:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555515.867334; Mon, 26 Jun 2023 13:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDmba-0003KT-Oz; Mon, 26 Jun 2023 13:50:10 +0000
Received: by outflank-mailman (input) for mailman id 555515;
 Mon, 26 Jun 2023 13:50:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qDmbZ-0003KJ-Sf; Mon, 26 Jun 2023 13:50:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qDmbZ-0002OM-Ke; Mon, 26 Jun 2023 13:50:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qDmbZ-0002eM-3C; Mon, 26 Jun 2023 13:50:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qDmbZ-0005eT-2m; Mon, 26 Jun 2023 13:50:09 +0000
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
	bh=FeapFizS6o3P3muZEOUMRmwhrLP5hYeG7FLsdjainu4=; b=QTIl1M15Vn3cWwGk1mxG90hB5o
	iWx3hzTDqOt9cZjeCZxtDo9CV8KfM6ctbWOc2KpUIK0bHE02EMck5uzIDoZV9dOK5cxjL68rayRRi
	U1zxW5RpffBDK2bruVFJyLuTPZ7H2gkfppsXFF1iNHO/2+/emXLJNtneWc/+W3+rCzWg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181602-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181602: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=638dfb4135441347f4bb8f242b4003a4e4395456
X-Osstest-Versions-That:
    ovmf=5542e528cd2710f521e8bf5dd4efd5adbdf86b71
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 26 Jun 2023 13:50:09 +0000

flight 181602 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181602/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 638dfb4135441347f4bb8f242b4003a4e4395456
baseline version:
 ovmf                 5542e528cd2710f521e8bf5dd4efd5adbdf86b71

Last test of basis   181601  2023-06-26 09:43:47 Z    0 days
Testing same since   181602  2023-06-26 11:42:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   5542e528cd..638dfb4135  638dfb4135441347f4bb8f242b4003a4e4395456 -> xen-tested-master


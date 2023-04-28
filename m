Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E554D6F1D65
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527427.819993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psRsB-0002Az-Sk; Fri, 28 Apr 2023 17:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527427.819993; Fri, 28 Apr 2023 17:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psRsB-00027d-Pe; Fri, 28 Apr 2023 17:27:07 +0000
Received: by outflank-mailman (input) for mailman id 527427;
 Fri, 28 Apr 2023 17:27:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psRsA-00027T-Pe; Fri, 28 Apr 2023 17:27:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psRsA-0003hd-Mg; Fri, 28 Apr 2023 17:27:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1psRsA-0001sr-B4; Fri, 28 Apr 2023 17:27:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1psRsA-00040N-Ac; Fri, 28 Apr 2023 17:27:06 +0000
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
	bh=zEoH3ROC2+vPjXmIHA0C7J5uCqiqgxVhCfHX5FOY0Pw=; b=FGH3I8yEfAmA1a4jL3W41UmBl1
	StEwc0MikBjQKbaqp+NxJEiBRRLE5jJX8D0vvpqI/o8BDboOi3cdkat/ei7bUOMDGl1lxDy+lg31m
	/wbnGYBui2dFFXnuSwfkcxjcsLV6cypYOzaqI0K8va7bLJPsQNZFedDNV1kAQbXwcJ2c=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180470-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180470: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=56e9828380b7425678a080bd3a08e7c741af67ba
X-Osstest-Versions-That:
    ovmf=ecbcff0f4935395f66ecc9e9ac76b804ecdec2e8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 28 Apr 2023 17:27:06 +0000

flight 180470 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180470/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 56e9828380b7425678a080bd3a08e7c741af67ba
baseline version:
 ovmf                 ecbcff0f4935395f66ecc9e9ac76b804ecdec2e8

Last test of basis   180467  2023-04-28 09:42:13 Z    0 days
Testing same since   180470  2023-04-28 12:40:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

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
   ecbcff0f49..56e9828380  56e9828380b7425678a080bd3a08e7c741af67ba -> xen-tested-master


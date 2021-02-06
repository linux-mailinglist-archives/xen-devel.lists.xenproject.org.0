Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D66D311C1E
	for <lists+xen-devel@lfdr.de>; Sat,  6 Feb 2021 09:22:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82076.151687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8Iq6-0007cl-LX; Sat, 06 Feb 2021 08:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82076.151687; Sat, 06 Feb 2021 08:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8Iq6-0007cD-FF; Sat, 06 Feb 2021 08:21:10 +0000
Received: by outflank-mailman (input) for mailman id 82076;
 Sat, 06 Feb 2021 08:21:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8Iq5-0007c5-6H; Sat, 06 Feb 2021 08:21:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8Iq5-0004Eb-0Y; Sat, 06 Feb 2021 08:21:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l8Iq4-0005L5-OA; Sat, 06 Feb 2021 08:21:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l8Iq4-0006dw-Mu; Sat, 06 Feb 2021 08:21:08 +0000
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
	bh=gReh7YXfF8eRV2ycHIeSkmDo4JCNgilceXRQ/e9UBd4=; b=EHS97wXoMkVfRPC1eZltWAZTte
	45ey6nlUj35NhbeQ9KuA44ihL7uxDU1gkEgVIWoCodVQG8DMOfSYaEcRMho3AIWZonE2rN1PjlhuC
	oSe0QAKLZtOSHXnx2lYd+wM01R9A78AkASpWBubK7FlzV7aJKf1hpQbNhNn1KdNDhock=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159040-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159040: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0d96664df322d50e0ac54130e129c0bf4f2b72df
X-Osstest-Versions-That:
    ovmf=1b6c3a94eca7f12f6a3b65a3e8619d2e2e7c1eb6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 Feb 2021 08:21:08 +0000

flight 159040 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159040/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0d96664df322d50e0ac54130e129c0bf4f2b72df
baseline version:
 ovmf                 1b6c3a94eca7f12f6a3b65a3e8619d2e2e7c1eb6

Last test of basis   159019  2021-02-04 16:41:43 Z    1 days
Testing same since   159040  2021-02-05 11:11:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Fan Wang <fan.wang@intel.com>
  Jiaxin Wu <jiaxin.wu@intel.com>
  Siyuan Fu <siyuan.fu@intel.com>

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
   1b6c3a94ec..0d96664df3  0d96664df322d50e0ac54130e129c0bf4f2b72df -> xen-tested-master


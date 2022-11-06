Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3BC61E5D9
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 21:19:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438956.692848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orm6R-0003uF-Gx; Sun, 06 Nov 2022 20:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438956.692848; Sun, 06 Nov 2022 20:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orm6R-0003rL-EJ; Sun, 06 Nov 2022 20:18:47 +0000
Received: by outflank-mailman (input) for mailman id 438956;
 Sun, 06 Nov 2022 20:18:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1orm6Q-0003rB-P4; Sun, 06 Nov 2022 20:18:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1orm6Q-0008Gv-NH; Sun, 06 Nov 2022 20:18:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1orm6Q-0006u5-Ax; Sun, 06 Nov 2022 20:18:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1orm6Q-0004Jr-AP; Sun, 06 Nov 2022 20:18:46 +0000
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
	bh=Ec8Rbn8P5z4x3wjuK6grto61wsmTGPrlhOCpRx0bnpY=; b=oCSsFFU7vk0wKzNyc2f9HTGuwm
	ekWQo2sZS9Q1hVBXKExp90JdjdpbbZA0U/+XYfPZ99R4tctuhBXZ6/Is0U2WKOzdc05Ph98L0ISqI
	oefKOGh462OZXt3PyZ1O0sqR1uPQl1ojcXzWqMviy5xcHJQU6vUqNPrq85kE7KUs5XEk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174648-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174648: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b556f2445c251adf405ac966b48c237d20c0d46c
X-Osstest-Versions-That:
    ovmf=cc650a0378f86a4980e7a0d37fef90d46d33afe1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Nov 2022 20:18:46 +0000

flight 174648 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174648/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b556f2445c251adf405ac966b48c237d20c0d46c
baseline version:
 ovmf                 cc650a0378f86a4980e7a0d37fef90d46d33afe1

Last test of basis   174647  2022-11-06 15:43:37 Z    0 days
Testing same since   174648  2022-11-06 18:11:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiewen Yao <jiewen.yao@intel.com>
  Leif Lindholm <quic_llindhol@quicinc.com>
  Pierre Gondois <pierre.gondois@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   cc650a0378..b556f2445c  b556f2445c251adf405ac966b48c237d20c0d46c -> xen-tested-master


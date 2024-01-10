Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A15882A048
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 19:31:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665708.1035984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNdLx-0006Hp-E7; Wed, 10 Jan 2024 18:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665708.1035984; Wed, 10 Jan 2024 18:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNdLx-0006FB-Ao; Wed, 10 Jan 2024 18:31:01 +0000
Received: by outflank-mailman (input) for mailman id 665708;
 Wed, 10 Jan 2024 18:31:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNdLw-0006F1-2G; Wed, 10 Jan 2024 18:31:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNdLv-00015l-Qw; Wed, 10 Jan 2024 18:30:59 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNdLv-00047E-GI; Wed, 10 Jan 2024 18:30:59 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNdLv-0001Yn-Fi; Wed, 10 Jan 2024 18:30:59 +0000
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
	bh=Q9Mh8IccJvLs3cqDBvj4MiuFeyIuyzS2MlRhPUCT/V4=; b=piN6+lzG6JlS6IDE6u6/UDkcDL
	ilDT9om+jVLQ60EO07thDWFpcdVc4wafhd6BjxIWB7jTriUEGN3gvaIdNg6Guom5fdzzCTcYr4Sx2
	J7bcmQYsuuTHm/UFAWZKCp2Y4A/60tv3ZvO4oQxL2TgQU+4Ql0npt3q7GqnjaKyeLbic=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184310-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184310: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e7cfdc5f14b408e85fcbcb335aae7c15bbce4dfb
X-Osstest-Versions-That:
    ovmf=7d055812cc7a7d2b062cf56291211e8cecca36ed
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 10 Jan 2024 18:30:59 +0000

flight 184310 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184310/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e7cfdc5f14b408e85fcbcb335aae7c15bbce4dfb
baseline version:
 ovmf                 7d055812cc7a7d2b062cf56291211e8cecca36ed

Last test of basis   184307  2024-01-10 12:41:03 Z    0 days
Testing same since   184310  2024-01-10 16:11:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hou, Wenxing <wenxing.hou@intel.com>
  Joey Vagedes <joey.vagedes@gmail.com>
  Wenxing Hou <wenxing.hou@intel.com>

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
   7d055812cc..e7cfdc5f14  e7cfdc5f14b408e85fcbcb335aae7c15bbce4dfb -> xen-tested-master


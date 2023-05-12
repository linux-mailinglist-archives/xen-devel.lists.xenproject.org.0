Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A695700302
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 10:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533754.830663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxOX3-0004mb-BV; Fri, 12 May 2023 08:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533754.830663; Fri, 12 May 2023 08:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxOX3-0004jO-88; Fri, 12 May 2023 08:53:45 +0000
Received: by outflank-mailman (input) for mailman id 533754;
 Fri, 12 May 2023 08:53:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pxOX2-0004jE-1c; Fri, 12 May 2023 08:53:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pxOX1-0006fH-UN; Fri, 12 May 2023 08:53:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pxOX1-0002Hk-KE; Fri, 12 May 2023 08:53:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pxOX1-0004lT-Jp; Fri, 12 May 2023 08:53:43 +0000
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
	bh=jb0A/CrUvyljcxoFqhu6C0WCo3Rm9S9Bd3MvaSsiteA=; b=UDvs9qD595YzADj2oDEmQP4fow
	IlTyFycXa6c6TRBKqlIq1pEyZIxaPh+1k9dQUg7thXOhJFAwp0h0BgphFc3C8Zw8KT1IQHzbUcZmv
	nwoJqsj1LUMnuOgwZsuPw/9d81VgYN2AT4MJBs5mxecW67Vr1MTFcoMKW9cLHaBXiCIw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180629-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180629: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=0b37723186ec1525b6caf14b0309fb0ed04084d7
X-Osstest-Versions-That:
    ovmf=c08a3a96fd19ac8adc75f00d373b4a1606b26c00
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 12 May 2023 08:53:43 +0000

flight 180629 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180629/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 0b37723186ec1525b6caf14b0309fb0ed04084d7
baseline version:
 ovmf                 c08a3a96fd19ac8adc75f00d373b4a1606b26c00

Last test of basis   180627  2023-05-12 04:12:20 Z    0 days
Testing same since   180629  2023-05-12 06:42:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Giri Mudusuru <girim@apple.com>

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
   c08a3a96fd..0b37723186  0b37723186ec1525b6caf14b0309fb0ed04084d7 -> xen-tested-master


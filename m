Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A16C39CFC8
	for <lists+xen-devel@lfdr.de>; Sun,  6 Jun 2021 17:32:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137422.254632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpuju-0007ug-4D; Sun, 06 Jun 2021 15:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137422.254632; Sun, 06 Jun 2021 15:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpuju-0007sf-09; Sun, 06 Jun 2021 15:31:02 +0000
Received: by outflank-mailman (input) for mailman id 137422;
 Sun, 06 Jun 2021 15:31:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpujs-0007sV-MV; Sun, 06 Jun 2021 15:31:00 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpujs-0003VJ-GF; Sun, 06 Jun 2021 15:31:00 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lpujs-000289-6h; Sun, 06 Jun 2021 15:31:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lpujs-0007I4-6C; Sun, 06 Jun 2021 15:31:00 +0000
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
	bh=BpQ/vjy5xbn89yaOqrFETvInQzcNgKmzsCBrqq2rQA4=; b=JpoFPUsFHh7HDwx4AI7NDmi/AK
	Zz539u9Z+DNDldsij+PGt4itKVHwD7Ia0KzUL7sM2mFa2a7FlF9+3xLhRB+8L2MHcjERPPAlIMIXb
	EUeY/QJx+GBqkOrkhQ6bsSZyaP1TzFkxdDpe3HKjenWeAxkdDoUZY0fJp8g7oJCmdyz0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162436-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162436: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:nonblocking
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:debian-hvm-install:fail:nonblocking
X-Osstest-Versions-This:
    ovmf=ddb3fdbef30de5a2946f9bd51060e8d5b1987aef
X-Osstest-Versions-That:
    ovmf=51adb689e1db695cffdeeacafad218768fbc018c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 06 Jun 2021 15:31:00 +0000

flight 162436 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162436/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-ovmf-amd64 12 debian-hvm-install     fail like 162371
 test-amd64-amd64-xl-qemuu-ovmf-amd64 12 debian-hvm-install    fail like 162371

version targeted for testing:
 ovmf                 ddb3fdbef30de5a2946f9bd51060e8d5b1987aef
baseline version:
 ovmf                 51adb689e1db695cffdeeacafad218768fbc018c

Last test of basis   162371  2021-06-04 17:41:31 Z    1 days
Testing same since   162436  2021-06-06 08:13:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <leif@nuviainc.com>
  Liming Gao <gaoliming@byosoft.com.cn>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         fail    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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
   51adb689e1..ddb3fdbef3  ddb3fdbef30de5a2946f9bd51060e8d5b1987aef -> xen-tested-master


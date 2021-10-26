Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48F43A65E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 00:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216087.375549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf8FX-00016U-Qc; Mon, 25 Oct 2021 22:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216087.375549; Mon, 25 Oct 2021 22:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf8FX-00014N-MP; Mon, 25 Oct 2021 22:15:23 +0000
Received: by outflank-mailman (input) for mailman id 216087;
 Mon, 25 Oct 2021 22:15:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mf8FW-00014D-W4; Mon, 25 Oct 2021 22:15:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mf8FW-00074r-Lg; Mon, 25 Oct 2021 22:15:22 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mf8FW-0003Gv-EQ; Mon, 25 Oct 2021 22:15:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mf8FW-0002Q2-Dw; Mon, 25 Oct 2021 22:15:22 +0000
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
	bh=5wAKhshuCL7HEunn8JkPRMaY+2J7tGbb3Cu2dtreOFI=; b=QykLss0opI/mgJ1v0ik32hXLxh
	O/wIIAzwoVmGen5GdBK49jgocgbUTmOh5tZK9dviE7alz4vML7IfZGS6fPKmYQVz43PRDNPd8y+pC
	FfZrA/EpSm4mq1692FKMleXMl5eKnMH+xbu2R71pkKkoEAT5FiCNy1TOwX02N2Ya7zyo=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165862-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165862: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=b80c17b62d989ec00e528c6307c726ce6800bcc4
X-Osstest-Versions-That:
    ovmf=8b76f235340922a6d293bff05978ba57d3b498e1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 25 Oct 2021 22:15:22 +0000

flight 165862 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165862/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 b80c17b62d989ec00e528c6307c726ce6800bcc4
baseline version:
 ovmf                 8b76f235340922a6d293bff05978ba57d3b498e1

Last test of basis   165827  2021-10-24 02:10:08 Z    1 days
Testing same since   165862  2021-10-25 17:41:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guo Dong <guo.dong@intel.com>

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
   8b76f23534..b80c17b62d  b80c17b62d989ec00e528c6307c726ce6800bcc4 -> xen-tested-master


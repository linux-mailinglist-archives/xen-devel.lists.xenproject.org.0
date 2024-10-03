Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D798EEA3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 13:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809296.1221548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKTl-0000Mp-Oh; Thu, 03 Oct 2024 11:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809296.1221548; Thu, 03 Oct 2024 11:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKTl-0000KD-M9; Thu, 03 Oct 2024 11:58:45 +0000
Received: by outflank-mailman (input) for mailman id 809296;
 Thu, 03 Oct 2024 11:58:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swKTk-0000K3-SJ; Thu, 03 Oct 2024 11:58:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swKTk-0001SI-FU; Thu, 03 Oct 2024 11:58:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swKTj-0008Hc-PO; Thu, 03 Oct 2024 11:58:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1swKTj-0001Tu-Or; Thu, 03 Oct 2024 11:58:43 +0000
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
	bh=CwOetPLBtvVpqD7kJnBjKFTtEH7Jdmwf60FQLF+SK5s=; b=mMd0/zbcRlkhQ/9RaqTcTBo+7l
	+rCR2w3MGBVgdulFdlyD2ZAGvz5HLDkniSf8ImOAE3d5RLk1+2mc+qqsSP/cGKPM9lkxxYZo764Nc
	7tuatyNeOjQZpKPXfyqAdbYwjY49arwSb7wP5YtNfr1HlwpnoPCK77VS+3ord9hstIuE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187949-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187949: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f962adc8a089949ecc730ba17f08234b52e3952d
X-Osstest-Versions-That:
    ovmf=d2e8118461ef82c975d9e1ce3855a2b9d44fa719
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 03 Oct 2024 11:58:43 +0000

flight 187949 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187949/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f962adc8a089949ecc730ba17f08234b52e3952d
baseline version:
 ovmf                 d2e8118461ef82c975d9e1ce3855a2b9d44fa719

Last test of basis   187947  2024-10-03 07:43:32 Z    0 days
Testing same since   187949  2024-10-03 09:43:20 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>

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
   d2e8118461..f962adc8a0  f962adc8a089949ecc730ba17f08234b52e3952d -> xen-tested-master


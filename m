Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF875C051
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 09:46:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567387.886369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMkpy-0005Zy-HY; Fri, 21 Jul 2023 07:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567387.886369; Fri, 21 Jul 2023 07:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMkpy-0005X6-EU; Fri, 21 Jul 2023 07:46:06 +0000
Received: by outflank-mailman (input) for mailman id 567387;
 Fri, 21 Jul 2023 07:46:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMkpw-0005Ww-Jv; Fri, 21 Jul 2023 07:46:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMkpw-0005gd-ES; Fri, 21 Jul 2023 07:46:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qMkpw-000417-02; Fri, 21 Jul 2023 07:46:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qMkpv-0007sc-Vi; Fri, 21 Jul 2023 07:46:03 +0000
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
	bh=UozbeEc3KoIXWxan89R2q4bB2nujBCbGhZu8Oyz8Csc=; b=xd1PActr2gWjrU6yt+5rzp/JpX
	zKQfYw7s8Lic0JuW/fF+XcR5BdclGOu1Gf51Vg/zqtdRluk4Y5TEtS9jP1GkUY1ZX0G6g9ooT0HWH
	6j58/TbCZxJ1TxlgsOXvaolxWWFpNA+u/R/FoiaN4RKrHDk/zNOCvVuKmeWMedY2kTuA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181944-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181944: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=925c445fd37bf529ca78f9d6c416cca37c7e6da5
X-Osstest-Versions-That:
    ovmf=c6b512962e92ae54a895bdfd2147abaf2c9e3e22
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Jul 2023 07:46:03 +0000

flight 181944 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181944/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 925c445fd37bf529ca78f9d6c416cca37c7e6da5
baseline version:
 ovmf                 c6b512962e92ae54a895bdfd2147abaf2c9e3e22

Last test of basis   181937  2023-07-20 20:42:43 Z    0 days
Testing same since   181944  2023-07-21 06:13:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sunil V L <sunilvl@ventanamicro.com>

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
   c6b512962e..925c445fd3  925c445fd37bf529ca78f9d6c416cca37c7e6da5 -> xen-tested-master


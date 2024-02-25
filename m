Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79973862CA6
	for <lists+xen-devel@lfdr.de>; Sun, 25 Feb 2024 20:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685210.1065605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reKVK-0000sX-R3; Sun, 25 Feb 2024 19:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685210.1065605; Sun, 25 Feb 2024 19:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reKVK-0000qK-OC; Sun, 25 Feb 2024 19:49:42 +0000
Received: by outflank-mailman (input) for mailman id 685210;
 Sun, 25 Feb 2024 19:49:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1reKVI-0000qA-J8; Sun, 25 Feb 2024 19:49:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1reKVI-0008If-HL; Sun, 25 Feb 2024 19:49:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1reKVI-0005Wj-9C; Sun, 25 Feb 2024 19:49:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1reKVI-0004U2-8h; Sun, 25 Feb 2024 19:49:40 +0000
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
	bh=fotXBprdfnK+Td3/V29nr+eRDldi6Ddwn1FxNR6ws0E=; b=AuUAwoqCNLrWfHWkcu9LK92cg1
	ygU6yJ1PbBLvfDysBMvkmeVSJ9tEyVKKBkPVkZycTk2RpHfJRj/WO8BCIfBgeDsJoNtatiaLZei3V
	EE7p2zMHSv4FP3G+ekFQIl6VpLcTIS0wSM/GaO6GiCYD+HWI//RByFr4RQ7QOu3DnA44=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184759-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184759: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f881b4d129602a49e3403043fc27550a74453234
X-Osstest-Versions-That:
    ovmf=7fa4a984c438b897086f5e2fea6b9e9ad17867c4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 25 Feb 2024 19:49:40 +0000

flight 184759 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184759/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f881b4d129602a49e3403043fc27550a74453234
baseline version:
 ovmf                 7fa4a984c438b897086f5e2fea6b9e9ad17867c4

Last test of basis   184751  2024-02-24 13:41:24 Z    1 days
Testing same since   184759  2024-02-25 17:44:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Laszlo Ersek <lersek@redhat.com>

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
   7fa4a984c4..f881b4d129  f881b4d129602a49e3403043fc27550a74453234 -> xen-tested-master


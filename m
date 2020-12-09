Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC92D4492
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:43:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48338.85469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0g8-00012k-PP; Wed, 09 Dec 2020 14:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48338.85469; Wed, 09 Dec 2020 14:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0g8-000123-LD; Wed, 09 Dec 2020 14:42:52 +0000
Received: by outflank-mailman (input) for mailman id 48338;
 Wed, 09 Dec 2020 14:42:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kn0g6-00010E-Aj; Wed, 09 Dec 2020 14:42:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kn0g6-0001kI-1j; Wed, 09 Dec 2020 14:42:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kn0g5-000766-Oq; Wed, 09 Dec 2020 14:42:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kn0g5-0002cY-ON; Wed, 09 Dec 2020 14:42:49 +0000
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
	bh=aX1uy8yfwbuk8OHBd10Z4YsFCsgWoNqldb9F4jAPKpY=; b=jzpgOM4xdarNdZirsG+W0bCvny
	rpXqpzg9cO+0f/U7g8eTHpvk7ADVr2Cb4lMV+0oz9SaUn04wuqqlbcE3LHA2l53E1Nl+rRiL4Iux8
	nCW4AiRCO3eqDJvSzUM8UwrII4bRoU61zKQjVNOvzkf5kSBNXUJAaq5i2JhbdwsguSDQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-157345-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 157345: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f95e80d832e923046c92cd6f0b8208cec147138e
X-Osstest-Versions-That:
    ovmf=7061294be500de021bef3d4bc5218134d223315f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Dec 2020 14:42:49 +0000

flight 157345 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/157345/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f95e80d832e923046c92cd6f0b8208cec147138e
baseline version:
 ovmf                 7061294be500de021bef3d4bc5218134d223315f

Last test of basis   157338  2020-12-09 03:48:15 Z    0 days
Testing same since   157345  2020-12-09 12:40:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>
  Yuwei Chen <yuwei.chen@intel.com>

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
   7061294be5..f95e80d832  f95e80d832e923046c92cd6f0b8208cec147138e -> xen-tested-master


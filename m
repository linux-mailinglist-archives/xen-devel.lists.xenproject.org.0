Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978E55F9BB6
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 11:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419173.663924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohorQ-0000kM-Ur; Mon, 10 Oct 2022 09:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419173.663924; Mon, 10 Oct 2022 09:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohorQ-0000hf-R2; Mon, 10 Oct 2022 09:14:08 +0000
Received: by outflank-mailman (input) for mailman id 419173;
 Mon, 10 Oct 2022 09:14:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ohorP-0000hV-LA; Mon, 10 Oct 2022 09:14:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ohorP-0001aE-JG; Mon, 10 Oct 2022 09:14:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ohorP-0007GZ-5k; Mon, 10 Oct 2022 09:14:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ohorP-0006fJ-5J; Mon, 10 Oct 2022 09:14:07 +0000
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
	bh=yyr4Gtg7ZKRp7iv5zTFXj8RL4w+krodwdgmXgwVBsuU=; b=yN4LvFOSm8EmuoLsD1PNiXRoKk
	UQDDc7l+rfIU36s7kOBM9cJ/WhQvu85taOMOmL3f0hhdB2PWIzHpX4ci5BRRhtcLdoNmoOG9jQgUz
	U2s1AoWSD8dq8aSDkxg3YMi2rYagh50u+5tZFZ0niHI3Vik3JdsIyYok8ispspbxhUCQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173484-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173484: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=8db4e9f9a0c2ec992e28259ceb7a8eb316716b05
X-Osstest-Versions-That:
    ovmf=3c9e2f239a38590b4e3a8c1ec2304227f2af0103
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 10 Oct 2022 09:14:07 +0000

flight 173484 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173484/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 8db4e9f9a0c2ec992e28259ceb7a8eb316716b05
baseline version:
 ovmf                 3c9e2f239a38590b4e3a8c1ec2304227f2af0103

Last test of basis   173481  2022-10-10 01:11:51 Z    0 days
Testing same since   173484  2022-10-10 06:43:17 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael D Kinney <michael.d.kinney@intel.com>
  Yi Li <yi1.li@intel.com>

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
   3c9e2f239a..8db4e9f9a0  8db4e9f9a0c2ec992e28259ceb7a8eb316716b05 -> xen-tested-master


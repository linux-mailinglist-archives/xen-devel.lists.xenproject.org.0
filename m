Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9F4AC06B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:03:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266962.460662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4bQ-0006YX-DY; Mon, 07 Feb 2022 14:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266962.460662; Mon, 07 Feb 2022 14:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4bQ-0006W5-AV; Mon, 07 Feb 2022 14:02:48 +0000
Received: by outflank-mailman (input) for mailman id 266962;
 Mon, 07 Feb 2022 14:02:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH4bP-0006Vv-2O; Mon, 07 Feb 2022 14:02:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH4bP-0003oQ-0c; Mon, 07 Feb 2022 14:02:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nH4bO-00014k-Lf; Mon, 07 Feb 2022 14:02:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nH4bO-0003OI-LD; Mon, 07 Feb 2022 14:02:46 +0000
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
	bh=5x/8UJnM1nwrjMbytt0n24HtR3tNsXzAZxWh/qs59qk=; b=BWhg+5+8FBKyiQSTB544BlR13I
	kGTzV5dWSjWs3PbV1A0MjsPR5OFZeAZX1DefX+7urYloJ0lofsuJgKauP5dYOZj24WSck2rOAgiPP
	m5PEsLyuQzvN3BAFZT/mgCpjhW88fRmEhFVMGqTAM5VavIUSK2ZjLghUeVdrYRJYY6Uw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168043-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 168043: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=96b8b5fd108a1f27960eee3915c0b10db191c849
X-Osstest-Versions-That:
    ovmf=f78b937c95ddc4f7a29e41fee98e96076828a108
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 07 Feb 2022 14:02:46 +0000

flight 168043 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/168043/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 96b8b5fd108a1f27960eee3915c0b10db191c849
baseline version:
 ovmf                 f78b937c95ddc4f7a29e41fee98e96076828a108

Last test of basis   168042  2022-02-07 06:41:36 Z    0 days
Testing same since   168043  2022-02-07 10:42:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Matt DeVillier <matt.devillier@gmail.com>

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
   f78b937c95..96b8b5fd10  96b8b5fd108a1f27960eee3915c0b10db191c849 -> xen-tested-master


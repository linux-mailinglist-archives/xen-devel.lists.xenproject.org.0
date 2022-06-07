Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257985344C3
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 22:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337366.561932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntxQf-00044H-S7; Wed, 25 May 2022 20:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337366.561932; Wed, 25 May 2022 20:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntxQf-000418-Oi; Wed, 25 May 2022 20:16:25 +0000
Received: by outflank-mailman (input) for mailman id 337366;
 Wed, 25 May 2022 20:16:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntxQe-00040y-Hd; Wed, 25 May 2022 20:16:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntxQe-0000IX-GS; Wed, 25 May 2022 20:16:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ntxQe-0007kf-5s; Wed, 25 May 2022 20:16:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ntxQe-0001Da-5T; Wed, 25 May 2022 20:16:24 +0000
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
	bh=hcNIdoNOX/UvS4gPAAlK7owjefwML92+gAr63F+2+3I=; b=djeNhM58BFANUsrADG4OTpErCq
	PKf7qETZcLVZoH4WvS+8j+RS7IZu5uTOo6kfmRtfzelZfe4F/jMHJAlgfJcs3Fz63wVGMhL1cF5J0
	NM1AB6OG+Po7ycXNv4mAI3q4/se+zIXX4xeZJXP+WMKoqAHwSlOJMDHfXknI73kcKVqs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170733-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170733: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=07c0c2eb0a5970db614ebce1060fc79d6904bdfd
X-Osstest-Versions-That:
    ovmf=9c733f0b90b31a7e3711f60da314f2a5cfe5fe8a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 25 May 2022 20:16:24 +0000

flight 170733 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170733/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 07c0c2eb0a5970db614ebce1060fc79d6904bdfd
baseline version:
 ovmf                 9c733f0b90b31a7e3711f60da314f2a5cfe5fe8a

Last test of basis   170728  2022-05-25 12:40:37 Z    0 days
Testing same since   170733  2022-05-25 17:10:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   9c733f0b90..07c0c2eb0a  07c0c2eb0a5970db614ebce1060fc79d6904bdfd -> xen-tested-master


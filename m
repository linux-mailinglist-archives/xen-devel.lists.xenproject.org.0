Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFE168AC8C
	for <lists+xen-devel@lfdr.de>; Sat,  4 Feb 2023 22:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489601.757940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOPsj-0005BD-76; Sat, 04 Feb 2023 21:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489601.757940; Sat, 04 Feb 2023 21:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOPsj-00059U-3m; Sat, 04 Feb 2023 21:15:33 +0000
Received: by outflank-mailman (input) for mailman id 489601;
 Sat, 04 Feb 2023 21:15:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOPsh-00059K-Sy; Sat, 04 Feb 2023 21:15:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOPsh-0000JO-Rq; Sat, 04 Feb 2023 21:15:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOPsh-0003P8-Fz; Sat, 04 Feb 2023 21:15:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pOPsh-0002vk-Fa; Sat, 04 Feb 2023 21:15:31 +0000
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
	bh=p38ZEoxgfDA5ZXNy4UoU4n4PZozke2dQ2uRV6D+fjis=; b=iB1IyNkfQneWWbKcbsLyrvDHlr
	wcLYRAzZLVHOJmebo/pq5J+de+8SZCtfyhsPxcpghETtg/mfgLhYq/WvFvRQanlfj+c1742gxYwUs
	tRSlSZtLv0tn4aJ4cw9vVxa/lq6ACE9LED4/tKW/rIkex3d/6UcmFfJ3z8Vl9fIY6l94=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176370-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176370: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9d669016d968b0f3e17ce7df16ae51d85b0adfcf
X-Osstest-Versions-That:
    ovmf=7c138e400862a3a742489ca6f21d31afa9a3dd8a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Feb 2023 21:15:31 +0000

flight 176370 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176370/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9d669016d968b0f3e17ce7df16ae51d85b0adfcf
baseline version:
 ovmf                 7c138e400862a3a742489ca6f21d31afa9a3dd8a

Last test of basis   176363  2023-02-04 11:26:05 Z    0 days
Testing same since   176370  2023-02-04 15:12:29 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jan Bobek <jbobek@nvidia.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   7c138e4008..9d669016d9  9d669016d968b0f3e17ce7df16ae51d85b0adfcf -> xen-tested-master


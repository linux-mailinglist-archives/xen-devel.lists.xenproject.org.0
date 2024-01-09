Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC21828D2F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 20:16:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664916.1035048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNHa2-0002bY-1n; Tue, 09 Jan 2024 19:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664916.1035048; Tue, 09 Jan 2024 19:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNHa1-0002Zz-UJ; Tue, 09 Jan 2024 19:16:05 +0000
Received: by outflank-mailman (input) for mailman id 664916;
 Tue, 09 Jan 2024 19:16:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNHa0-0002Zp-Tj; Tue, 09 Jan 2024 19:16:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNHa0-0007Em-RQ; Tue, 09 Jan 2024 19:16:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rNHa0-0003L4-CL; Tue, 09 Jan 2024 19:16:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rNHa0-00081p-Bq; Tue, 09 Jan 2024 19:16:04 +0000
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
	bh=nNkKQxh3sHMm1Ih1B4JoQhJPTPg0n6ny72CoqeOQROE=; b=x2iNlAxhhDIJEwnKPzAAKrWTJW
	GLcnBBJKdEwLX3/WUDE3vP0TGH5fQucVZGJmNKcMbpkMRZhOvJsBn7hoIWcT7YgQBqg8V6wy0B54C
	nqkFEZSbR5sqPV/AiBfYtU6yBXv3k9GqrfuIZqwx4FOQOW/FXG7Dl61ddqdwXelprV4Q=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184297-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184297: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4a443f73fd67ca8caaf0a3e1a01f8231b330d2e0
X-Osstest-Versions-That:
    ovmf=f2b074398ca0624206355524a1c5f653ff87876a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Jan 2024 19:16:04 +0000

flight 184297 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184297/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4a443f73fd67ca8caaf0a3e1a01f8231b330d2e0
baseline version:
 ovmf                 f2b074398ca0624206355524a1c5f653ff87876a

Last test of basis   184288  2024-01-09 03:12:49 Z    0 days
Testing same since   184297  2024-01-09 16:43:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  duntan <dun.tan@intel.com>
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
   f2b074398c..4a443f73fd  4a443f73fd67ca8caaf0a3e1a01f8231b330d2e0 -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C0966FFA
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2024 09:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787124.1196767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skILk-0002PM-1S; Sat, 31 Aug 2024 07:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787124.1196767; Sat, 31 Aug 2024 07:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skILj-0002Nk-Sj; Sat, 31 Aug 2024 07:16:43 +0000
Received: by outflank-mailman (input) for mailman id 787124;
 Sat, 31 Aug 2024 07:16:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skILi-0002NV-HX; Sat, 31 Aug 2024 07:16:42 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skILi-0002gA-F9; Sat, 31 Aug 2024 07:16:42 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1skILi-00023k-1H; Sat, 31 Aug 2024 07:16:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1skILi-0001UM-0s; Sat, 31 Aug 2024 07:16:42 +0000
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
	bh=v2QifotP+8M1o3Zy/j1rmEcvvT4QZxQa+RPEqcBtqMM=; b=Y5qaXxWp8vnjlQMqslPp83uTXy
	0ZFoWWBpJBrVKamiidfAgYXqe65z9rulwdYd4Bfk9i+PtI6UT+36iP8qVEaC2tfY4K94ocFSvjq6A
	9NdBxc2P4Jm94ITz9yMtTwYUtdIFuJyTW/Io+mwPa0GDRO151an1z1YSrFs4uqt9dKHg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187433-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187433: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=95ee7f3ef7a34773e0528410fd0178aecfdd89b5
X-Osstest-Versions-That:
    ovmf=90d861f63d0fe467cec9659703f02d3d32969dc3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 31 Aug 2024 07:16:42 +0000

flight 187433 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187433/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 95ee7f3ef7a34773e0528410fd0178aecfdd89b5
baseline version:
 ovmf                 90d861f63d0fe467cec9659703f02d3d32969dc3

Last test of basis   187432  2024-08-31 03:19:43 Z    0 days
Testing same since   187433  2024-08-31 05:13:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Joey Vagedes <joey.vagedes@gmail.com>

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
   90d861f63d..95ee7f3ef7  95ee7f3ef7a34773e0528410fd0178aecfdd89b5 -> xen-tested-master


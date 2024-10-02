Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15998E76A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 01:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809110.1221279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw993-0004mU-Rp; Wed, 02 Oct 2024 23:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809110.1221279; Wed, 02 Oct 2024 23:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw993-0004jy-P1; Wed, 02 Oct 2024 23:52:37 +0000
Received: by outflank-mailman (input) for mailman id 809110;
 Wed, 02 Oct 2024 23:52:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sw992-0004jo-AC; Wed, 02 Oct 2024 23:52:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sw992-0003uv-1F; Wed, 02 Oct 2024 23:52:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sw991-0005oj-MI; Wed, 02 Oct 2024 23:52:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sw991-00019j-Lk; Wed, 02 Oct 2024 23:52:35 +0000
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
	bh=LOd+OpdQtgmZEx6p7spb56a1Dxu6f+Vv4kKsxV5bDKs=; b=zFj0ES9MD710a6yx6PbC+x+3sI
	Qa1SFrowuf7V3/GoHfEhAW2fh8dLfbqf4tpdyXifxIXjUFB4jhh+vKs+3CgJBkgYEVPn2FiaiEavm
	WR4B1rK2JiT1MmeWgA8yKglVXyeh/BJ8+oAxSsvQt+f6T/BivnfZbJkSr0zZvQ0Fza54=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187942-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187942: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e73ec569429ba72fbb6829518d6c192b4cd3346f
X-Osstest-Versions-That:
    ovmf=cac73c45c4a9eaf81613260fb52bfc990e59bc0d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Oct 2024 23:52:35 +0000

flight 187942 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187942/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e73ec569429ba72fbb6829518d6c192b4cd3346f
baseline version:
 ovmf                 cac73c45c4a9eaf81613260fb52bfc990e59bc0d

Last test of basis   187934  2024-10-02 08:13:17 Z    0 days
Testing same since   187942  2024-10-02 20:14:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Doug Flick <dougflick@microsoft.com>

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
   cac73c45c4..e73ec56942  e73ec569429ba72fbb6829518d6c192b4cd3346f -> xen-tested-master


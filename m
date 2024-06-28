Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0DD91C483
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 19:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750729.1158797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNF5H-0005qi-LB; Fri, 28 Jun 2024 17:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750729.1158797; Fri, 28 Jun 2024 17:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNF5H-0005or-IG; Fri, 28 Jun 2024 17:08:27 +0000
Received: by outflank-mailman (input) for mailman id 750729;
 Fri, 28 Jun 2024 17:08:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sNF5G-0005oh-2k; Fri, 28 Jun 2024 17:08:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sNF5F-0003lv-WD; Fri, 28 Jun 2024 17:08:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sNF5F-0002xL-PC; Fri, 28 Jun 2024 17:08:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sNF5F-00054R-Oi; Fri, 28 Jun 2024 17:08:25 +0000
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
	bh=bT4FlEWsff8O6H3qI7PuEX84K88Gm30tJDLXkOQr1JY=; b=DOtEY1YtVYdPkjOY2XbsfIPMp5
	5FF0ssK/x0Y0wKaVszD5ahFk2g+RO1C/DdAHDaaKebiNA0SQehQ/9HLFvl5HcmED8JZ/gfBhyaybd
	blrywlpwrU07zfkYQspVWh9afCdL6U7zdM8Yx/RjSbBDOnc7EVZgp9ZNWF+OO3Y3IAN8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186553-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186553: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3b2025969e6e8a2f6542996182cd4132868641c6
X-Osstest-Versions-That:
    ovmf=dc3ed379dfb62ed720e46f10b6c6d0ebda6bde5f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 28 Jun 2024 17:08:25 +0000

flight 186553 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186553/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3b2025969e6e8a2f6542996182cd4132868641c6
baseline version:
 ovmf                 dc3ed379dfb62ed720e46f10b6c6d0ebda6bde5f

Last test of basis   186543  2024-06-28 06:13:12 Z    0 days
Testing same since   186553  2024-06-28 15:11:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
  dependabot[bot] <support@github.com>

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
   dc3ed379df..3b2025969e  3b2025969e6e8a2f6542996182cd4132868641c6 -> xen-tested-master


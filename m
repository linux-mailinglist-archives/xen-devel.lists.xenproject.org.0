Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763866E3BE7
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 22:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521671.810468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po8yE-0005Ha-UT; Sun, 16 Apr 2023 20:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521671.810468; Sun, 16 Apr 2023 20:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po8yE-0005Fd-RS; Sun, 16 Apr 2023 20:27:34 +0000
Received: by outflank-mailman (input) for mailman id 521671;
 Sun, 16 Apr 2023 20:27:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1po8yD-0005FT-5W; Sun, 16 Apr 2023 20:27:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1po8yC-000577-Un; Sun, 16 Apr 2023 20:27:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1po8yC-0005LA-F3; Sun, 16 Apr 2023 20:27:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1po8yC-0000cB-EY; Sun, 16 Apr 2023 20:27:32 +0000
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
	bh=jdx1PLPkrfeJjN9pEnneMxJlu1Hfj1VOagqD8QJthec=; b=aQO/jN4+y2atOpbn/syR+3yP/2
	TylVh8iCp1Ef9FBUrlHuWaopPxQafhAML+jmNMnF67+LY+evxqV6ad7lY943JrDPNnrJWWHpwsqfL
	np0+u1P5xNDacBeiE5V7pIKaQGsnhcOs0NGh4PM8EMHtA/7h3Hmbtc0HH1OAQxF34NkY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180277-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180277: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6ded9f50c3aa123fe581c42ff6c03789b9b593c1
X-Osstest-Versions-That:
    ovmf=797f526ae2a83811b0ccbde0138c65a9f137eba5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 16 Apr 2023 20:27:32 +0000

flight 180277 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180277/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6ded9f50c3aa123fe581c42ff6c03789b9b593c1
baseline version:
 ovmf                 797f526ae2a83811b0ccbde0138c65a9f137eba5

Last test of basis   180262  2023-04-14 16:12:08 Z    2 days
Testing same since   180277  2023-04-16 18:10:48 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Pedro Falcato <pedro.falcato@gmail.com>

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
   797f526ae2..6ded9f50c3  6ded9f50c3aa123fe581c42ff6c03789b9b593c1 -> xen-tested-master


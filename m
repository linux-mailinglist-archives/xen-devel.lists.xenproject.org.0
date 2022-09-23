Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C905E85CA
	for <lists+xen-devel@lfdr.de>; Sat, 24 Sep 2022 00:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410963.654146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obr37-0005Ux-Py; Fri, 23 Sep 2022 22:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410963.654146; Fri, 23 Sep 2022 22:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obr37-0005SZ-NF; Fri, 23 Sep 2022 22:21:33 +0000
Received: by outflank-mailman (input) for mailman id 410963;
 Fri, 23 Sep 2022 22:21:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obr36-0005SP-KI; Fri, 23 Sep 2022 22:21:32 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obr36-0005YR-JG; Fri, 23 Sep 2022 22:21:32 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1obr35-0005Jh-Vu; Fri, 23 Sep 2022 22:21:32 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1obr35-0003r2-VS; Fri, 23 Sep 2022 22:21:31 +0000
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
	bh=ObZSNOpc8yPHSV15thgzRZB2Y0diAO1cO7afP+6GeTQ=; b=LLp/9TFWgk76C6w7faPigq/lSA
	lGgzkK+Foh3NQj9QoNQwtCLRsXnnVi70YrO9+PxjKEUdGNWrkFOR/bnG2psJLYFDsyjmCk1ceyvfG
	OTjaIeHnrmwPP2UhHeOu/SacISHnBpuPPCC68Fr19/PdjlzLnE6YT89NUfBkKYmpz3uQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173298-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173298: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ef9974b298583037a1686f08ee02798110a20ded
X-Osstest-Versions-That:
    ovmf=2500ce101178e55ed29cd18931ab8a73d0ca6e4d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 23 Sep 2022 22:21:31 +0000

flight 173298 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173298/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ef9974b298583037a1686f08ee02798110a20ded
baseline version:
 ovmf                 2500ce101178e55ed29cd18931ab8a73d0ca6e4d

Last test of basis   173297  2022-09-23 17:43:16 Z    0 days
Testing same since   173298  2022-09-23 20:13:06 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jeff Brasen <jbrasen@nvidia.com>

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
   2500ce1011..ef9974b298  ef9974b298583037a1686f08ee02798110a20ded -> xen-tested-master


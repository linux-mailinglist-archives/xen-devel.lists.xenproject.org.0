Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0B719A2F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 12:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542384.846181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fv2-0001Ax-Kk; Thu, 01 Jun 2023 10:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542384.846181; Thu, 01 Jun 2023 10:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fv2-00019I-Hq; Thu, 01 Jun 2023 10:52:36 +0000
Received: by outflank-mailman (input) for mailman id 542384;
 Thu, 01 Jun 2023 10:52:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4fv0-000198-HS; Thu, 01 Jun 2023 10:52:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4fv0-0006ik-6k; Thu, 01 Jun 2023 10:52:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4fuz-0005Bn-Rs; Thu, 01 Jun 2023 10:52:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4fuz-0002Ka-RL; Thu, 01 Jun 2023 10:52:33 +0000
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
	bh=NgY8gYwNfsS+aYewhIx2JXCn2wF4roWse+rGsJR6iFY=; b=oAVnJQCu63UQE/NZyiL5Em/sKE
	XTfI6bkX6zoglp/pODiRGmeBasGgAZLyC/FkzVP3H8l7IQFL0MDoWI4MWLpNnvqKHJpBgpyr5/Nbe
	r2ANZzFqR/axOzzvbyIumwwmqJZ1Y6nuOkrsiu9YaV469zZVdzZld0gtwSWwNdrFO6BI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181072-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181072: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c1e853769046b322690ad336fdb98966757e7414
X-Osstest-Versions-That:
    ovmf=9f12d6b6ecf8ffe9cd4d93fe0976fdbaf2ded4f0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Jun 2023 10:52:33 +0000

flight 181072 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181072/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c1e853769046b322690ad336fdb98966757e7414
baseline version:
 ovmf                 9f12d6b6ecf8ffe9cd4d93fe0976fdbaf2ded4f0

Last test of basis   181036  2023-05-31 13:10:43 Z    0 days
Testing same since   181072  2023-06-01 09:10:44 Z    0 days    1 attempts

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
   9f12d6b6ec..c1e8537690  c1e853769046b322690ad336fdb98966757e7414 -> xen-tested-master


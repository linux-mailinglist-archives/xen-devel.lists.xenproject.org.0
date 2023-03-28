Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5716CC967
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 19:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516004.799484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phDFY-0002M7-5S; Tue, 28 Mar 2023 17:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516004.799484; Tue, 28 Mar 2023 17:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phDFY-0002Ih-1n; Tue, 28 Mar 2023 17:36:48 +0000
Received: by outflank-mailman (input) for mailman id 516004;
 Tue, 28 Mar 2023 17:36:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phDFW-0002IX-MA; Tue, 28 Mar 2023 17:36:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phDFW-0003rp-Jw; Tue, 28 Mar 2023 17:36:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1phDFV-0007HM-Ux; Tue, 28 Mar 2023 17:36:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1phDFV-0005pe-UR; Tue, 28 Mar 2023 17:36:45 +0000
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
	bh=iiIKH/Fa1IWA9f63ur/OLX0N1f5X24E5Gp4u6rcv8bo=; b=jpiqdBSgRscXXk4tHInuxIaRpo
	f0i2/JHXf3O5r3R+T0en0sF6NGviwbnooLNycDV8mZV1k7cmnYhFGee7dc4Zu+XfD2WpEx+ylV1rj
	75ZcJfZO9R8sXJA3ph/wvis/yAtuDpbdtVKeyUTtGRSfKoDQ3NKfwoXSJcMMf/SKKKpM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180042-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180042: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=07e17188df9042d6a6af96f21b0fb7bc5595ec07
X-Osstest-Versions-That:
    ovmf=e4b3fd905a170b185dcea11e2997cfe935fea208
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 28 Mar 2023 17:36:45 +0000

flight 180042 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180042/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 07e17188df9042d6a6af96f21b0fb7bc5595ec07
baseline version:
 ovmf                 e4b3fd905a170b185dcea11e2997cfe935fea208

Last test of basis   180039  2023-03-28 09:42:23 Z    0 days
Testing same since   180042  2023-03-28 15:13:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Tinh Nguyen <tinhnguyen@os.amperecomputing.com>

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
   e4b3fd905a..07e17188df  07e17188df9042d6a6af96f21b0fb7bc5595ec07 -> xen-tested-master


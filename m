Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB3422FA8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 20:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202287.356999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXoqW-0003BV-UA; Tue, 05 Oct 2021 18:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202287.356999; Tue, 05 Oct 2021 18:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXoqW-00039D-Q2; Tue, 05 Oct 2021 18:07:20 +0000
Received: by outflank-mailman (input) for mailman id 202287;
 Tue, 05 Oct 2021 18:07:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXoqV-000393-VC; Tue, 05 Oct 2021 18:07:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXoqV-0001B8-Pe; Tue, 05 Oct 2021 18:07:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXoqV-0006Ct-Fy; Tue, 05 Oct 2021 18:07:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mXoqV-0002wJ-FP; Tue, 05 Oct 2021 18:07:19 +0000
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
	bh=KJ6WQoQolZ7EzykfvWe8jqPhGlAr3WJBQXyA9R8bVtY=; b=Wy3lYgu57ZVl2BzI+rHs/XcPpk
	08L2/JFTJYatWkabMKjl51udb4xDq1RaXXaGWTg/wob9kUq/3zcP6wa2OtblwZLdaEKtCq65JzKwH
	EVjKdLcuJI97cnY2HrlaUQkwUsB5Lrm6sB/aiplfNNbQN9fMtSCJJWKdlkUMw2MrNSxE=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165377-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165377: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c49cb8f30e6223dc6b55903af178afa1dfde857f
X-Osstest-Versions-That:
    ovmf=4cc1458dbe004b1d70534caa55f475f6d19fe14a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 05 Oct 2021 18:07:19 +0000

flight 165377 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165377/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c49cb8f30e6223dc6b55903af178afa1dfde857f
baseline version:
 ovmf                 4cc1458dbe004b1d70534caa55f475f6d19fe14a

Last test of basis   165347  2021-10-04 12:43:18 Z    1 days
Testing same since   165377  2021-10-05 09:40:15 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>
  Rebecca Cran <rebecca@nuviainc.com>

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
   4cc1458dbe..c49cb8f30e  c49cb8f30e6223dc6b55903af178afa1dfde857f -> xen-tested-master


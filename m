Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0346ADD78
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 12:32:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507305.780641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVYF-0003EV-W2; Tue, 07 Mar 2023 11:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507305.780641; Tue, 07 Mar 2023 11:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZVYF-0003CR-Ss; Tue, 07 Mar 2023 11:32:15 +0000
Received: by outflank-mailman (input) for mailman id 507305;
 Tue, 07 Mar 2023 11:32:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pZVYF-0003CF-0w; Tue, 07 Mar 2023 11:32:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pZVYE-0004wa-W0; Tue, 07 Mar 2023 11:32:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pZVYE-0003d9-ME; Tue, 07 Mar 2023 11:32:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pZVYE-0005mx-Lm; Tue, 07 Mar 2023 11:32:14 +0000
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
	bh=kYehbZCZUz0eRMjUjorydqseqmwbZehZfDAXg/dhL4w=; b=JjT5rwDTv57SEsivxq82ND22Fa
	FxDo2Dim2nGZUdbDl1zs78Tkyj3OA1O4l4NJ0OFLqgHJnbbPcTXbZinn6KALl2jx+UFHgxxNuxIBY
	Av1RlY6FjaAArFU9u4hAcptBZA/XsTVyJ9entadd81u0cOnCVTB5dDiDVqQSTmRX0XUY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179487-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179487: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c7c25997595aa34ce0a7a21ca2e1fc5b0f9b38a6
X-Osstest-Versions-That:
    ovmf=46f51898ff716e53921b93e8d78af0fc7d06a2f9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 07 Mar 2023 11:32:14 +0000

flight 179487 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179487/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c7c25997595aa34ce0a7a21ca2e1fc5b0f9b38a6
baseline version:
 ovmf                 46f51898ff716e53921b93e8d78af0fc7d06a2f9

Last test of basis   179476  2023-03-07 07:10:44 Z    0 days
Testing same since   179487  2023-03-07 09:43:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Xie, Yuanhao <yuanhao.xie@intel.com>
  Yuanhao Xie <yuanhao.xie@intel.com>

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
   46f51898ff..c7c2599759  c7c25997595aa34ce0a7a21ca2e1fc5b0f9b38a6 -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A50813F7D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 02:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654825.1022230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDxNq-0002az-HR; Fri, 15 Dec 2023 01:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654825.1022230; Fri, 15 Dec 2023 01:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDxNq-0002Ya-Ei; Fri, 15 Dec 2023 01:52:58 +0000
Received: by outflank-mailman (input) for mailman id 654825;
 Fri, 15 Dec 2023 01:52:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDxNo-0002YO-Sx; Fri, 15 Dec 2023 01:52:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDxNo-0000Je-Nl; Fri, 15 Dec 2023 01:52:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rDxNo-0001OW-8z; Fri, 15 Dec 2023 01:52:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rDxNo-0005EO-7Y; Fri, 15 Dec 2023 01:52:56 +0000
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
	bh=OH1TZrrHV0yaKLFxqbRlPpLK06QMCY/asXnvQyy2e0k=; b=suY4w56efCNHeTIfSzrh3PfSV9
	C+u0l2zGi0uV+WUcWzvWTTQwUflizZPz/IC8YHdnTSGOe4dVEmJhcGyVLp9LCZkTFhP0BO7OsbCkZ
	3HcS3VakskmgX+WCnzvxRxTbkJU6+N1SBBukaNnwIB6RXtWdXP+N80U67BewRoIlvpBg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184142-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 184142: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3ce5f2d445e51efe2aebaa227a055e5c8522d00b
X-Osstest-Versions-That:
    ovmf=7f5e75895bd6bbfbde191fb8458d324033f76c57
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 15 Dec 2023 01:52:56 +0000

flight 184142 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184142/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3ce5f2d445e51efe2aebaa227a055e5c8522d00b
baseline version:
 ovmf                 7f5e75895bd6bbfbde191fb8458d324033f76c57

Last test of basis   184138  2023-12-14 16:44:15 Z    0 days
Testing same since   184142  2023-12-14 22:12:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   7f5e75895b..3ce5f2d445  3ce5f2d445e51efe2aebaa227a055e5c8522d00b -> xen-tested-master


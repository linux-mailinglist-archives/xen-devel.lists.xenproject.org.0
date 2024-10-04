Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC16990C63
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 20:48:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810602.1223316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swnKy-0000tI-Iv; Fri, 04 Oct 2024 18:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810602.1223316; Fri, 04 Oct 2024 18:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swnKy-0000r5-Ew; Fri, 04 Oct 2024 18:47:36 +0000
Received: by outflank-mailman (input) for mailman id 810602;
 Fri, 04 Oct 2024 18:47:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swnKw-0000qv-7s; Fri, 04 Oct 2024 18:47:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swnKv-0002gA-WD; Fri, 04 Oct 2024 18:47:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1swnKv-0002Zt-LH; Fri, 04 Oct 2024 18:47:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1swnKv-0002zR-Ki; Fri, 04 Oct 2024 18:47:33 +0000
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
	bh=cGof+zdlc8m31Llh0wBK2eVEEzkM096EL8Sqcbiycac=; b=53Rbu0tsJ2nw4HBLkMstsSoeWF
	WrZYKm69ELZV5pL8s9qM2a+2GPnR7BTO4sGPetqVsO6N1LOF+3I9BN/VOmYrF63rCjQ12eDj8xFsh
	o/1qjSJRM5SNT+YjcwKM+gwkRaOrDapY1AmKvjOAtPd3sL9RBswgQrByO9ck8u6HFjEs=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187969-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187969: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c82bf392c58e60e3e656b13627e3076d709ab796
X-Osstest-Versions-That:
    ovmf=91d806917fd2be763f067a58ef05fadcf43efab1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Oct 2024 18:47:33 +0000

flight 187969 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187969/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c82bf392c58e60e3e656b13627e3076d709ab796
baseline version:
 ovmf                 91d806917fd2be763f067a58ef05fadcf43efab1

Last test of basis   187963  2024-10-04 05:11:31 Z    0 days
Testing same since   187969  2024-10-04 16:43:30 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Carsten Haitzler <carsten.haitzler@foss.arm.com>

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
   91d806917f..c82bf392c5  c82bf392c58e60e3e656b13627e3076d709ab796 -> xen-tested-master


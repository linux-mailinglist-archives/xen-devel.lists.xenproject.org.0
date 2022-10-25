Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807060D2A1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 19:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430027.681475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onNsa-0005BV-2L; Tue, 25 Oct 2022 17:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430027.681475; Tue, 25 Oct 2022 17:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onNsZ-00058n-VV; Tue, 25 Oct 2022 17:38:19 +0000
Received: by outflank-mailman (input) for mailman id 430027;
 Tue, 25 Oct 2022 17:38:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onNsY-00058d-IP; Tue, 25 Oct 2022 17:38:18 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onNsY-0008Vp-FH; Tue, 25 Oct 2022 17:38:18 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1onNsY-0005a3-2F; Tue, 25 Oct 2022 17:38:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1onNsY-0006qA-1l; Tue, 25 Oct 2022 17:38:18 +0000
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
	bh=1cD5Dt/E+YfUKYYEGdWBDn7hVxbJSp1zijv3APyRUTE=; b=PfDxCFZvrKpBpU4Q7M2KhXHfrB
	0MzM2byhWq8n9hW1O5dMLFE/Ff5OpVGMGb24z03AkYRFibCN+6CrEFKUUqnJaCG3ieaYe9yZHSGS+
	TfCiOhG/qSBmVkPK8NbRqQ44RPh3WtoL6GhZnTo+WQARo7OWe+mGYY6GsycOsQsvaxeU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174393-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174393: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=db2c22633f3c761975d8f469a0e195d8b79e1287
X-Osstest-Versions-That:
    ovmf=fb493ac84ebc6860e1690770fb88183effadebfb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 25 Oct 2022 17:38:18 +0000

flight 174393 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174393/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 db2c22633f3c761975d8f469a0e195d8b79e1287
baseline version:
 ovmf                 fb493ac84ebc6860e1690770fb88183effadebfb

Last test of basis   174370  2022-10-24 22:42:23 Z    0 days
Testing same since   174393  2022-10-25 08:22:32 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hao A Wu <hao.a.wu@intel.com>
  Matt DeVillier <matt.devillier@gmail.com>
  Sean Rhodes <sean@starlabs.systems>

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
   fb493ac84e..db2c22633f  db2c22633f3c761975d8f469a0e195d8b79e1287 -> xen-tested-master


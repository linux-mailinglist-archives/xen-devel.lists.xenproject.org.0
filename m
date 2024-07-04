Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9B927BD1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 19:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753929.1162202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPQ6k-0005wB-RO; Thu, 04 Jul 2024 17:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753929.1162202; Thu, 04 Jul 2024 17:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPQ6k-0005ud-Oh; Thu, 04 Jul 2024 17:18:58 +0000
Received: by outflank-mailman (input) for mailman id 753929;
 Thu, 04 Jul 2024 17:18:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPQ6j-0005uT-BO; Thu, 04 Jul 2024 17:18:57 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPQ6j-0007YC-9a; Thu, 04 Jul 2024 17:18:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sPQ6i-0001Au-UJ; Thu, 04 Jul 2024 17:18:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sPQ6i-0002O1-Ti; Thu, 04 Jul 2024 17:18:56 +0000
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
	bh=sZ0lsiNT5Z1HKCYB2t7Bab+xXAjVdiDCIlbKL80ZoqY=; b=qyBNetV67xLHzRMNlqReSgt8qk
	vnhnIMbGuJUdPa8C5t3rDJScC+Uca1rmQwvBrWf+TCe84ej4e4ofTYnvAFppu4/xZ1aX6sPBBKgqu
	4dGSnbxn8iB76LH496QDZz5l3kM5eG1t0Oc2JYN1OnNRn9NlXY0yUfCMj//xPWhHvfj8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186658-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186658: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4e36bed8128f67fc73f41acb1beaffd77ef76e90
X-Osstest-Versions-That:
    ovmf=6b9307192bf590b3136e690a07196d4255051fdc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 Jul 2024 17:18:56 +0000

flight 186658 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186658/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4e36bed8128f67fc73f41acb1beaffd77ef76e90
baseline version:
 ovmf                 6b9307192bf590b3136e690a07196d4255051fdc

Last test of basis   186656  2024-07-04 12:41:11 Z    0 days
Testing same since   186658  2024-07-04 15:15:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Mike Maslenkin <mike.maslenkin@gmail.com>

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
   6b9307192b..4e36bed812  4e36bed8128f67fc73f41acb1beaffd77ef76e90 -> xen-tested-master


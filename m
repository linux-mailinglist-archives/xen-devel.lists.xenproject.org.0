Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71C75774E5
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jul 2022 09:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368951.600364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCyTH-0007UQ-Ts; Sun, 17 Jul 2022 07:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368951.600364; Sun, 17 Jul 2022 07:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCyTH-0007R0-R5; Sun, 17 Jul 2022 07:13:43 +0000
Received: by outflank-mailman (input) for mailman id 368951;
 Sun, 17 Jul 2022 07:13:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCyTF-0007Qq-RJ; Sun, 17 Jul 2022 07:13:41 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCyTF-0007mT-P6; Sun, 17 Jul 2022 07:13:41 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oCyTF-0006HV-9N; Sun, 17 Jul 2022 07:13:41 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oCyTF-00051s-8w; Sun, 17 Jul 2022 07:13:41 +0000
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
	bh=ZQQ9HOSGY0a0tF1ikHlIOlWOtQUIAHxKGNn3jKip2PI=; b=1c6o5ksXSagvw46fWBqkzzDeC4
	UIk8RIfPet1CX14rbgXtREspTtdNbSsa9grlouzH0wv1aZeCHwv8atYgbaTOwDrwceGMd3+2y24Vb
	be9WUDM3/PJ1TyvX4IWRfaVwAwGYB7QNqqTFL5nxb+lW7U7mVTi+KpdqPlQZWm4ombWo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171657-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171657: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=176016387f0a6ad16efcfdcef19fd90bdc3a77e4
X-Osstest-Versions-That:
    ovmf=07c8e5e59b117f2414d7c928d3f86c85574f1fc3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 17 Jul 2022 07:13:41 +0000

flight 171657 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171657/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 176016387f0a6ad16efcfdcef19fd90bdc3a77e4
baseline version:
 ovmf                 07c8e5e59b117f2414d7c928d3f86c85574f1fc3

Last test of basis   171647  2022-07-16 03:10:43 Z    1 days
Testing same since   171657  2022-07-17 02:41:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chen, Christine <Yuwei.Chen@intel.com>
  Yuwei Chen <yuwei.chen@intel.com>

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
   07c8e5e59b..176016387f  176016387f0a6ad16efcfdcef19fd90bdc3a77e4 -> xen-tested-master


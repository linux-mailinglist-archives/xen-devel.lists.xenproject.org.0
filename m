Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFB857F60D
	for <lists+xen-devel@lfdr.de>; Sun, 24 Jul 2022 18:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374180.606288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFeoc-000640-7e; Sun, 24 Jul 2022 16:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374180.606288; Sun, 24 Jul 2022 16:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFeoc-000628-4B; Sun, 24 Jul 2022 16:50:50 +0000
Received: by outflank-mailman (input) for mailman id 374180;
 Sun, 24 Jul 2022 16:50:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFeoa-00061y-Fv; Sun, 24 Jul 2022 16:50:48 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFeoa-0004uz-D8; Sun, 24 Jul 2022 16:50:48 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oFeoa-0008Rj-5J; Sun, 24 Jul 2022 16:50:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oFeoa-0004jf-4p; Sun, 24 Jul 2022 16:50:48 +0000
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
	bh=6PsmIGIlwPq2KRDIXFGlvH2VaGK17daDfEAH5kp6fUQ=; b=kQSd77CGWHeKjnDRuOLXJfG8qM
	9P8e9iMzeEFCcctmHtxVrk6ai2+qZ+xeqOoCvayUZ1sjvU5iP/jNMstovsVFeNgQORReChEh/PzFc
	7TioE629gVPZ8gyAHywGHwfa3epCk9snZH12mXlpeKc+65F0Kw04C8hmuIv8Aou3v5m4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171843-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171843: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c0b7679aac90ab6c757bbc61ac4ccfa293ab14df
X-Osstest-Versions-That:
    ovmf=8ee26529d1b554a31c1041f0b9ed4e2dd250bd7a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 24 Jul 2022 16:50:48 +0000

flight 171843 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171843/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c0b7679aac90ab6c757bbc61ac4ccfa293ab14df
baseline version:
 ovmf                 8ee26529d1b554a31c1041f0b9ed4e2dd250bd7a

Last test of basis   171841  2022-07-24 11:40:22 Z    0 days
Testing same since   171843  2022-07-24 14:13:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Konstantin Aladyshev <aladyshev22@gmail.com>

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
   8ee26529d1..c0b7679aac  c0b7679aac90ab6c757bbc61ac4ccfa293ab14df -> xen-tested-master


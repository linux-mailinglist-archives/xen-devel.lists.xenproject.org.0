Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AABBE6FB4FF
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 18:25:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531662.827438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw3et-00068o-74; Mon, 08 May 2023 16:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531662.827438; Mon, 08 May 2023 16:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw3et-00066Q-4I; Mon, 08 May 2023 16:24:19 +0000
Received: by outflank-mailman (input) for mailman id 531662;
 Mon, 08 May 2023 16:24:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pw3er-00066G-N5; Mon, 08 May 2023 16:24:17 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pw3er-0004Fd-Jq; Mon, 08 May 2023 16:24:17 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pw3er-0008Na-84; Mon, 08 May 2023 16:24:17 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pw3er-0006IE-7Y; Mon, 08 May 2023 16:24:17 +0000
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
	bh=7T/Mf8EIeVQAtInc3rUYrcfmXoVWfLE/3x/1YA1UFkg=; b=RBjTSEB5GemIBRusAkzl42JITy
	awyInhWcIVNAdfW4IQ1qFsBgz1ZKkHEn6Df+U72zBvUtfmELqHRU1JKMTA/2Y0ceZX8UDjWu/dmqX
	bsJ25w62o2b2xJWkknsDzTCLOsZgDanXxpAkWJFFu2AELatJgRbKhN2cMCgBaDCsmSbo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180579-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180579: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6eeb58ece38060be3b0f7111649a93cc8b2dca49
X-Osstest-Versions-That:
    ovmf=d89492456f79e014679cb6c29b144ea26b910918
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 May 2023 16:24:17 +0000

flight 180579 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180579/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6eeb58ece38060be3b0f7111649a93cc8b2dca49
baseline version:
 ovmf                 d89492456f79e014679cb6c29b144ea26b910918

Last test of basis   180575  2023-05-08 11:43:41 Z    0 days
Testing same since   180579  2023-05-08 13:40:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Minh Nguyen <minhnguyen1@os.amperecomputing.com>
  Nhi Pham <nhi@os.amperecomputing.com>
  Vu Nguyen <vunguyen@os.amperecomputing.com>

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
   d89492456f..6eeb58ece3  6eeb58ece38060be3b0f7111649a93cc8b2dca49 -> xen-tested-master


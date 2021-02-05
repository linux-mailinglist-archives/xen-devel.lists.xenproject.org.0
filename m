Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9533109ED
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 12:10:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81604.150899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7z0G-0003fF-SQ; Fri, 05 Feb 2021 11:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81604.150899; Fri, 05 Feb 2021 11:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7z0G-0003eq-P2; Fri, 05 Feb 2021 11:10:20 +0000
Received: by outflank-mailman (input) for mailman id 81604;
 Fri, 05 Feb 2021 11:10:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7z0G-0003ei-6l; Fri, 05 Feb 2021 11:10:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7z0F-0004QN-Uw; Fri, 05 Feb 2021 11:10:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7z0F-00020H-JN; Fri, 05 Feb 2021 11:10:19 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l7z0F-00025s-Iu; Fri, 05 Feb 2021 11:10:19 +0000
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
	bh=Is8i9PnX2FAMu9Lz0qYZF9EzAZIG5xYGkVEhxcjsCpI=; b=1Fbbxnj/wRcuOZNh6hyAgcoSdI
	xJE2+d1ALUFjbGTA0UH2YVAFH55XwDJ3K/URwCk8YYZgKzYNDf6U1RhS2+JnMFQ1vYhZKsUrP/uwe
	dUbZHil1BUrwbAUndpVwFulDLht9QIWOXw702AF8AvzxT9vhASnAzYRJp5dB2qNnlkB0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159019-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159019: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1b6c3a94eca7f12f6a3b65a3e8619d2e2e7c1eb6
X-Osstest-Versions-That:
    ovmf=f6ec1dd34fb6b9757b5ead465ee2ea20c182b0ac
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Feb 2021 11:10:19 +0000

flight 159019 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159019/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1b6c3a94eca7f12f6a3b65a3e8619d2e2e7c1eb6
baseline version:
 ovmf                 f6ec1dd34fb6b9757b5ead465ee2ea20c182b0ac

Last test of basis   159000  2021-02-04 01:40:54 Z    1 days
Testing same since   159019  2021-02-04 16:41:43 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>

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
   f6ec1dd34f..1b6c3a94ec  1b6c3a94eca7f12f6a3b65a3e8619d2e2e7c1eb6 -> xen-tested-master


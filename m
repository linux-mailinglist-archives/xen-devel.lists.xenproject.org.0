Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D019A4815AB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 18:15:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252363.433381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2cX6-0001Rp-OJ; Wed, 29 Dec 2021 17:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252363.433381; Wed, 29 Dec 2021 17:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2cX6-0001Py-Ko; Wed, 29 Dec 2021 17:14:36 +0000
Received: by outflank-mailman (input) for mailman id 252363;
 Wed, 29 Dec 2021 17:14:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n2cX5-0001Po-OC; Wed, 29 Dec 2021 17:14:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n2cX5-0004bq-Ls; Wed, 29 Dec 2021 17:14:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n2cX5-0004Wv-8k; Wed, 29 Dec 2021 17:14:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n2cX5-0007A2-8I; Wed, 29 Dec 2021 17:14:35 +0000
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
	bh=zeWCcBOc4yVHRc+voyrAUHjPdNMAr4Gn0lY3+xceJbU=; b=rDtNra3z/0NTEN7W7T9h9uuJSF
	IAFPOsXrOaah7EFWC9xEXKfCmlQaUUB0yYzkQ7rcTFJ3X7+9gpzVzQkZB4Fxywe2wqAzIxkxoKwop
	Qa/nj5lvHyobPwvecNmRdtTEik5woCvnY0bojXAuKg/4jOl4fIQmOsbOj5RDKht1s8R8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167559-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167559: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c095122d4b5f3152417cd97dabecfe31cc3b6508
X-Osstest-Versions-That:
    ovmf=7935be0fbd8f47266e5972f4cba1a1e58505061a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 29 Dec 2021 17:14:35 +0000

flight 167559 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167559/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c095122d4b5f3152417cd97dabecfe31cc3b6508
baseline version:
 ovmf                 7935be0fbd8f47266e5972f4cba1a1e58505061a

Last test of basis   167555  2021-12-29 02:10:20 Z    0 days
Testing same since   167559  2021-12-29 14:11:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Damian Bassa <damian.bassa@intel.com>
  Ray Ni <ray.ni@intel.com>

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
   7935be0fbd..c095122d4b  c095122d4b5f3152417cd97dabecfe31cc3b6508 -> xen-tested-master


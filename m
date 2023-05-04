Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DC46F721D
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 20:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529877.824805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pudzf-0001SS-Su; Thu, 04 May 2023 18:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529877.824805; Thu, 04 May 2023 18:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pudzf-0001Qi-Ph; Thu, 04 May 2023 18:47:55 +0000
Received: by outflank-mailman (input) for mailman id 529877;
 Thu, 04 May 2023 18:47:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pudzd-0001QU-Kq; Thu, 04 May 2023 18:47:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pudzd-0006Sp-Bw; Thu, 04 May 2023 18:47:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pudzc-0006Wb-SI; Thu, 04 May 2023 18:47:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pudzc-0003ar-Rm; Thu, 04 May 2023 18:47:52 +0000
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
	bh=Jd4tqMh94nxAFtcL3IuvD56wAwIQCkHfrRc5dvBrkkQ=; b=paJQuS9CKXMztABLjimo1lFZ6J
	2aT/wV84FHBQcysE3MNfnkmDMUD4fVJgQaAjp1DRddIxuiJv3+N4Bg1SfqL7eQTagHFsCShwm/iUF
	mSvhG3a+eUvfYCcYkoUt1YBPP6hn7+Hunp1vSspbrPUgZjPMdoUhh8NHeJqy8frmR4FQ=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180532-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180532: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4b02045f86d6aac8a617bf3f65f9cb2146630ce3
X-Osstest-Versions-That:
    ovmf=d6b42ed7ed1b0c4584097f0d76798cff74c96379
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 04 May 2023 18:47:52 +0000

flight 180532 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180532/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4b02045f86d6aac8a617bf3f65f9cb2146630ce3
baseline version:
 ovmf                 d6b42ed7ed1b0c4584097f0d76798cff74c96379

Last test of basis   180508  2023-05-02 16:10:54 Z    2 days
Testing same since   180532  2023-05-04 14:40:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Oliver Steffen <osteffen@redhat.com>
  Patrik Berglund <patrik.berglund@arm.com>
  Pierre Gondois <pierre.gondois@arm.com>

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
   d6b42ed7ed..4b02045f86  4b02045f86d6aac8a617bf3f65f9cb2146630ce3 -> xen-tested-master


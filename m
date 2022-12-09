Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C4E64815B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 12:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457825.715810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3bGT-0004oR-4p; Fri, 09 Dec 2022 11:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457825.715810; Fri, 09 Dec 2022 11:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3bGT-0004m9-27; Fri, 09 Dec 2022 11:10:01 +0000
Received: by outflank-mailman (input) for mailman id 457825;
 Fri, 09 Dec 2022 11:09:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3bGR-0004lz-1X; Fri, 09 Dec 2022 11:09:59 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3bGQ-0007UK-UT; Fri, 09 Dec 2022 11:09:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p3bGQ-0007Or-JH; Fri, 09 Dec 2022 11:09:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p3bGQ-0005HT-Ip; Fri, 09 Dec 2022 11:09:58 +0000
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
	bh=Xn4gz/1K4CB5x6hC+MXNZrLLwnGH5QAaTukPLMgiJhU=; b=udJvvow8zLURSN0waCf25NcXi2
	AAxMyf9hF2yItECo+V8hBG/ezCHh9zzVFFFdYtlrjpas40gV9Qd3BIBuizA/sm/W2V/1Z7Rs82iN8
	tlodohtbxTlwBXN2fEIJ0dTshsXlj3QoABE7Ost2cnLRZqRaZMktEa7QJQRGawL0hCmw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175119-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175119: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=127e2c531556b968a51e8e2191d6e4580281856a
X-Osstest-Versions-That:
    ovmf=54d81d06fc165fcb8eb832acd6a7cf644b029549
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Dec 2022 11:09:58 +0000

flight 175119 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175119/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 127e2c531556b968a51e8e2191d6e4580281856a
baseline version:
 ovmf                 54d81d06fc165fcb8eb832acd6a7cf644b029549

Last test of basis   175101  2022-12-08 21:43:51 Z    0 days
Testing same since   175119  2022-12-09 07:10:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ryan Afranji <afranji@google.com>

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
   54d81d06fc..127e2c5315  127e2c531556b968a51e8e2191d6e4580281856a -> xen-tested-master


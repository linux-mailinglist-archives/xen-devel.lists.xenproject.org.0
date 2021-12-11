Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AF547150C
	for <lists+xen-devel@lfdr.de>; Sat, 11 Dec 2021 18:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245409.423470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw6N6-0005YP-JO; Sat, 11 Dec 2021 17:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245409.423470; Sat, 11 Dec 2021 17:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mw6N6-0005Vc-E3; Sat, 11 Dec 2021 17:41:20 +0000
Received: by outflank-mailman (input) for mailman id 245409;
 Sat, 11 Dec 2021 17:41:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mw6N5-0005VS-Ak; Sat, 11 Dec 2021 17:41:19 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mw6N5-0006Ea-2E; Sat, 11 Dec 2021 17:41:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mw6N4-0006iH-Nc; Sat, 11 Dec 2021 17:41:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mw6N4-0001Mw-NB; Sat, 11 Dec 2021 17:41:18 +0000
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
	bh=DgK76rNs0bZAEOoEhy//Fm0Z+qWhLFN9xrHoTrzU8mU=; b=utoegIClBefXPxtNzP6xP4hnjv
	sgaYGQzCFRaDr9/Mf4xlIV3ktNFXn9T8/GDFzyurPmptTKZgvVzBIt5QmMoo4PN8zM9Aoxn4iTABO
	XwgRfwLQeBR0fhJEbG+TLEfc+cbRVWyNhU/TxaGEKmMDZ1KWLZCWTUlpw8dEf2ByjWtc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167377-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167377: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f6df289a1c43f60143bba530a823d3fd2eba6223
X-Osstest-Versions-That:
    ovmf=c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 11 Dec 2021 17:41:18 +0000

flight 167377 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167377/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f6df289a1c43f60143bba530a823d3fd2eba6223
baseline version:
 ovmf                 c82ab4d8c148c4009e0b31d1dd2ea6f7d4aea80d

Last test of basis   167239  2021-12-09 06:23:17 Z    2 days
Failing since        167240  2021-12-09 08:42:46 Z    2 days   58 attempts
Testing same since   167377  2021-12-11 16:10:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Brijesh Singh <brijesh.singh@amd.com>
  Brijesh Singh via groups.io <brijesh.singh=amd.com@groups.io>
  Chris Jones <christopher.jones@arm.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Michael Roth <michael.roth@amd.com>
  Philippe Mathieu-Daude <philmd@redhat.com>
  Ray Ni <ray.ni@intel.com>
  Rob Bradford <robert.bradford@intel.com>
  Sebastien Boeuf <sebastien.boeuf@intel.com>
  Tom Lendacky <thomas.lendacky@amd.com>

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
   c82ab4d8c1..f6df289a1c  f6df289a1c43f60143bba530a823d3fd2eba6223 -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8E56603C8
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 16:57:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472798.733169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDp5l-0004YM-83; Fri, 06 Jan 2023 15:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472798.733169; Fri, 06 Jan 2023 15:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDp5l-0004Wb-4t; Fri, 06 Jan 2023 15:57:13 +0000
Received: by outflank-mailman (input) for mailman id 472798;
 Fri, 06 Jan 2023 15:57:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pDp5j-0004WR-Ot; Fri, 06 Jan 2023 15:57:11 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pDp5j-0002vJ-My; Fri, 06 Jan 2023 15:57:11 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pDp5j-00066P-Ap; Fri, 06 Jan 2023 15:57:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pDp5j-00086t-AP; Fri, 06 Jan 2023 15:57:11 +0000
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
	bh=g/I03d3MZ7AG/eC5r5t5Zb6LOu2cfQNNU6Ha2XHJIEY=; b=y91qi223mU9LjwTNZughHSzKX0
	XxFWUc2P1OXcusu2LIUp/kHRWkyx8rbpbDoUDFGHMCQgGp7O7sPVutHxmn/QV4/1QMtGLqXfFHDew
	0pFQee3Qn3QU2R40Gb4fZeLi4ml4I6msVaKkrs/7cFPfm4KufugJrTRV/akUsrDjySy8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175604-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175604: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5386c9e6dab2f6a555e679aff9f6a59f60c8e029
X-Osstest-Versions-That:
    ovmf=0aca5901e34489573c4e9558729704f76869e3d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 06 Jan 2023 15:57:11 +0000

flight 175604 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175604/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5386c9e6dab2f6a555e679aff9f6a59f60c8e029
baseline version:
 ovmf                 0aca5901e34489573c4e9558729704f76869e3d0

Last test of basis   175602  2023-01-06 08:41:27 Z    0 days
Testing same since   175604  2023-01-06 13:12:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jiewen Yao <jiewen.yao@intel.com>
  Michael Roth <michael.roth@amd.com>
  Min M Xu <min.m.xu@intel.com>
  Min Xu <min.m.xu@intel.com>

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
   0aca5901e3..5386c9e6da  5386c9e6dab2f6a555e679aff9f6a59f60c8e029 -> xen-tested-master


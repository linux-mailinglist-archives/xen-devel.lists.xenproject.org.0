Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C43F6EFDC0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 00:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526845.818867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pro5L-0007qb-LH; Wed, 26 Apr 2023 22:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526845.818867; Wed, 26 Apr 2023 22:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pro5L-0007oY-IM; Wed, 26 Apr 2023 22:58:03 +0000
Received: by outflank-mailman (input) for mailman id 526845;
 Wed, 26 Apr 2023 22:58:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pro5K-0007oO-Dm; Wed, 26 Apr 2023 22:58:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pro5K-0001oY-6G; Wed, 26 Apr 2023 22:58:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pro5J-0005FU-LW; Wed, 26 Apr 2023 22:58:01 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pro5J-00071M-L3; Wed, 26 Apr 2023 22:58:01 +0000
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
	bh=7Gqe92FT1OYXjqC1w59XI32XEMNV2C3j/c59wHLBwTY=; b=l0B+s+ybufg16suKmeSEFx7mGH
	jFREcHwDo9EfyKXW8q5qNww2gc/wKzBpUANKJb2Tj+LyeUoDnvvQXzSc4upDi3cWePak080bjZ60g
	j/jl8EuOnsBr5mfmYxs9VFlw+Mplzeo4Mhp3cWUgKBVqIzlg4hAHPmw0b68tbP3X8B50=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180436-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180436: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=edacc551e6586258ab046dd852f65d674e3e2af0
X-Osstest-Versions-That:
    ovmf=ede0bd1496405f72147308b9570efba0234349b2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Apr 2023 22:58:01 +0000

flight 180436 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180436/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 edacc551e6586258ab046dd852f65d674e3e2af0
baseline version:
 ovmf                 ede0bd1496405f72147308b9570efba0234349b2

Last test of basis   180429  2023-04-26 09:41:52 Z    0 days
Testing same since   180436  2023-04-26 17:42:39 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <jiewen.yao@intel.com>
  Michael Roth <michael.roth@amd.com>
  Roth, Michael via groups.io <Michael.Roth=amd.com@groups.io>

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
   ede0bd1496..edacc551e6  edacc551e6586258ab046dd852f65d674e3e2af0 -> xen-tested-master


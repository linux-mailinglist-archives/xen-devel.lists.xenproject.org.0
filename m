Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524E64C384
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 06:32:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461712.719853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5KNL-00069s-Kz; Wed, 14 Dec 2022 05:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461712.719853; Wed, 14 Dec 2022 05:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5KNL-00066u-HR; Wed, 14 Dec 2022 05:32:15 +0000
Received: by outflank-mailman (input) for mailman id 461712;
 Wed, 14 Dec 2022 05:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5KNJ-00066k-Do; Wed, 14 Dec 2022 05:32:13 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5KNJ-0006IT-CL; Wed, 14 Dec 2022 05:32:13 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5KNI-0001HR-RT; Wed, 14 Dec 2022 05:32:12 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5KNI-00043w-Qz; Wed, 14 Dec 2022 05:32:12 +0000
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
	bh=L14NSuqy8YkxZC8fZFIZI/r9WwVmJeZGPmM6556k3HE=; b=sfep1dugZe8fo8LwcPl0ORlVUa
	3JljLl1BFjv7qfIDmw/EVWkekCeFrNty1Ptk7jFUG/p4vn6R7kvdS6k46uKL26iJC9wtFTMXFWXVb
	VnTShmcCb7LBV0oE+2MbqoTD+BcLpby7AACLnv8HbuhrefdHIubPqxTB3u4/UTRzVf9o=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175187-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175187: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=804e8c656643642894a26a2ce3652ad4567b658f
X-Osstest-Versions-That:
    ovmf=592bf33a29360e8a447ed8b75daefe94c0888642
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Dec 2022 05:32:12 +0000

flight 175187 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175187/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 804e8c656643642894a26a2ce3652ad4567b658f
baseline version:
 ovmf                 592bf33a29360e8a447ed8b75daefe94c0888642

Last test of basis   175182  2022-12-13 21:40:55 Z    0 days
Testing same since   175187  2022-12-14 01:40:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>

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
   592bf33a29..804e8c6566  804e8c656643642894a26a2ce3652ad4567b658f -> xen-tested-master


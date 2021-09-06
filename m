Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4199401F8D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 20:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180183.326724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJKb-00018x-Es; Mon, 06 Sep 2021 18:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180183.326724; Mon, 06 Sep 2021 18:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJKb-00016R-BS; Mon, 06 Sep 2021 18:26:57 +0000
Received: by outflank-mailman (input) for mailman id 180183;
 Mon, 06 Sep 2021 18:26:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNJKa-00016H-7J; Mon, 06 Sep 2021 18:26:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNJKa-00027m-0y; Mon, 06 Sep 2021 18:26:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mNJKZ-0005bA-NP; Mon, 06 Sep 2021 18:26:55 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mNJKZ-0004PX-Mt; Mon, 06 Sep 2021 18:26:55 +0000
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
	bh=lWdWNKadwgxsJNhNnduT+sZdtFoV9PHBnDpc+LCqw2k=; b=ajhqKq/NWQoPP/2xQukCuNGorP
	JvA/oNrbcKOz2eu6RcZrB+Iv5dwIdzXiprvVUpPS4nMjHHzUzJ0az9bpGOyEU9VLZvzEIUyzSDl+Q
	s54tVYptwUsqmG5BHBQyVKgeyIcu+2TsQKAlBXiIMz7gR7nxl0P5NpqV1tc83YBHbIsc=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164862-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164862: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4473834e7d49c555eca81f96383a1d6d6f5f4bb2
X-Osstest-Versions-That:
    ovmf=cae735f61328d64e2e8991036707b9e78c0f5f63
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 06 Sep 2021 18:26:55 +0000

flight 164862 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164862/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4473834e7d49c555eca81f96383a1d6d6f5f4bb2
baseline version:
 ovmf                 cae735f61328d64e2e8991036707b9e78c0f5f63

Last test of basis   164674  2021-08-31 02:56:52 Z    6 days
Failing since        164686  2021-09-01 03:03:43 Z    5 days   69 attempts
Testing same since   164862  2021-09-06 15:10:03 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  DunTan <dun.tan@intel.com>
  Gary Lin <gary.lin@hpe.com>
  Hao A Wu <hao.a.wu@intel.com>
  Jim Fehlig <jfehlig@suse.com>
  Lin, Gary (HPS OE-Linux) <gary.lin@hpe.com>
  Loo Tung Lun <tung.lun.loo@intel.com>
  Loo, Tung Lun <tung.lun.loo@intel.com>
  Mark Wilson <Mark.Wilson@amd.com>
  Marvin H?user <mhaeuser@posteo.de>
  Michael Kubacki <michael.kubacki@microsoft.com>
  Rebecca Cran <rebecca@bsdio.com>
  Wenxing Hou <wenxing.hou@intel.com>
  Wenyi Xie <xiewenyi2@huawei.com>

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
   cae735f613..4473834e7d  4473834e7d49c555eca81f96383a1d6d6f5f4bb2 -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F208B3E46DB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 15:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165001.301514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD5Zo-00075A-QV; Mon, 09 Aug 2021 13:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165001.301514; Mon, 09 Aug 2021 13:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD5Zo-00072X-MV; Mon, 09 Aug 2021 13:44:24 +0000
Received: by outflank-mailman (input) for mailman id 165001;
 Mon, 09 Aug 2021 13:44:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mD5Zn-00072N-Lm; Mon, 09 Aug 2021 13:44:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mD5Zn-00063B-A7; Mon, 09 Aug 2021 13:44:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mD5Zn-0007lK-1v; Mon, 09 Aug 2021 13:44:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mD5Zn-0003Eq-1R; Mon, 09 Aug 2021 13:44:23 +0000
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
	bh=/0YQBfNp0FeBJWWY3CbtRRdlDDmU/aDqouTc23rekzI=; b=5bM0/TRV4kUpypqlYMEPaae1PA
	p+2norS85N6qlDMEx5pJo5GRruvS2Z7abLcOaV1HX+krcFoEmSERR07xThBKfaf2pgeRiSiG7/QZS
	2ij2bntA6rQHduhSc12USkcJopNKEUtI9gdi6SomLyJvYJUcFfaNWpHxW7wOvQqGE6bI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164142-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164142: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d02dbb53cd78de799e6afaa237e98771fb5148db
X-Osstest-Versions-That:
    ovmf=4de77ae9890d241271f543e9195ab3516f3abec6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Aug 2021 13:44:23 +0000

flight 164142 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164142/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d02dbb53cd78de799e6afaa237e98771fb5148db
baseline version:
 ovmf                 4de77ae9890d241271f543e9195ab3516f3abec6

Last test of basis   164139  2021-08-09 03:11:13 Z    0 days
Testing same since   164142  2021-08-09 11:42:25 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  DunTan <dun.tan@intel.com>
  Rodrigo Gonzalez del Cueto <rodrigo.gonzalez.del.cueto@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   4de77ae989..d02dbb53cd  d02dbb53cd78de799e6afaa237e98771fb5148db -> xen-tested-master


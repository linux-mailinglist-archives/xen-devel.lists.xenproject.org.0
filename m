Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C6752AFF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 21:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563386.880615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK225-0000tM-RL; Thu, 13 Jul 2023 19:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563386.880615; Thu, 13 Jul 2023 19:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK225-0000rA-OI; Thu, 13 Jul 2023 19:31:21 +0000
Received: by outflank-mailman (input) for mailman id 563386;
 Thu, 13 Jul 2023 19:31:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qK224-0000r0-Ux; Thu, 13 Jul 2023 19:31:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qK224-00029Q-Mw; Thu, 13 Jul 2023 19:31:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qK224-0004UA-6R; Thu, 13 Jul 2023 19:31:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qK224-00031R-62; Thu, 13 Jul 2023 19:31:20 +0000
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
	bh=MitiP5G40hyoOMZQ/MBxTPugJsvfQu8Ivpbc5fgxhkQ=; b=ppMNQN6eannBg2yAAnSKAjm3fr
	Ei26NJSF9hefcPxyKiDULdSaaf4ieBgJ1xQyE86fB1AH5MAOVb+DTsOzD2cUzDHExskxJZbrRyJvg
	s0mc6uuwh64luhjjN7+9nBuH9v558a/vp5FlJONDbmW5AGgGO4D21jz9BoWTv3O4eV18=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181786-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181786: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ff3382a51ca726a90f49623a2b2d2e8ad8459ce2
X-Osstest-Versions-That:
    ovmf=8dab4eebe435fc28cae329867a74cee45d040d3e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 13 Jul 2023 19:31:20 +0000

flight 181786 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181786/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ff3382a51ca726a90f49623a2b2d2e8ad8459ce2
baseline version:
 ovmf                 8dab4eebe435fc28cae329867a74cee45d040d3e

Last test of basis   181760  2023-07-11 06:42:24 Z    2 days
Testing same since   181786  2023-07-13 17:42:16 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Hao A Wu <hao.a.wu@intel.com>
  Richard Ho <richardho@ami.com>
  Tinh Nguyen <tinhnguyen@os.amperecomputing.com>

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
   8dab4eebe4..ff3382a51c  ff3382a51ca726a90f49623a2b2d2e8ad8459ce2 -> xen-tested-master


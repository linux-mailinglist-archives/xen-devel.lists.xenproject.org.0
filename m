Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34D2441073
	for <lists+xen-devel@lfdr.de>; Sun, 31 Oct 2021 20:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.218927.379567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhGTZ-0000Me-PA; Sun, 31 Oct 2021 19:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218927.379567; Sun, 31 Oct 2021 19:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhGTZ-0000JX-Lb; Sun, 31 Oct 2021 19:26:41 +0000
Received: by outflank-mailman (input) for mailman id 218927;
 Sun, 31 Oct 2021 19:26:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mhGTY-0000JJ-B4; Sun, 31 Oct 2021 19:26:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mhGTY-0006zF-6t; Sun, 31 Oct 2021 19:26:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mhGTX-0001hs-UT; Sun, 31 Oct 2021 19:26:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mhGTX-0000hX-Tz; Sun, 31 Oct 2021 19:26:39 +0000
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
	bh=fuPUnKVREy3d14eqnRAxPY8sZkpn2M/HRMSEW8Epy2s=; b=SPGdDVPbHTQIcHn0G6j+n/aG3B
	uk0ezmDCw201ngmx7WnfduBXYjxffsSWMbknYjk0/Q1B4A6GgOoBFlayN0xkU7/M5qtVZ11xMJRY7
	ua1aKePlx2BoKlLb8wNW5RpPNPxK/e7arH/DRg0yOUnFn30m35n5T3Fie+FWVFt2CnzU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165962-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165962: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c8594a53119c72022f8ff5977b01e4e632ca7a04
X-Osstest-Versions-That:
    ovmf=91b772ab626913bf740e9e1b20387b25bcb2de97
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 31 Oct 2021 19:26:39 +0000

flight 165962 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165962/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c8594a53119c72022f8ff5977b01e4e632ca7a04
baseline version:
 ovmf                 91b772ab626913bf740e9e1b20387b25bcb2de97

Last test of basis   165950  2021-10-30 20:41:07 Z    0 days
Testing same since   165962  2021-10-31 17:10:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Guomin Jiang <guomin.jiang@intel.com>

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
   91b772ab62..c8594a5311  c8594a53119c72022f8ff5977b01e4e632ca7a04 -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9662F43262C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 20:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212509.370376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcXA0-0005Ur-98; Mon, 18 Oct 2021 18:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212509.370376; Mon, 18 Oct 2021 18:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcXA0-0005SQ-5D; Mon, 18 Oct 2021 18:14:56 +0000
Received: by outflank-mailman (input) for mailman id 212509;
 Mon, 18 Oct 2021 18:14:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcX9y-0005SG-FQ; Mon, 18 Oct 2021 18:14:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcX9y-0002r1-8W; Mon, 18 Oct 2021 18:14:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mcX9x-00061x-V9; Mon, 18 Oct 2021 18:14:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mcX9x-0002r7-Ud; Mon, 18 Oct 2021 18:14:53 +0000
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
	bh=q5QK8wKp4OBWQYDrsPkEBthM2QzevLY+R9DAY3s8CuU=; b=MrpYdEwkLxqv4pyEO/eghqjrOj
	9vcS+YpHYO58zSHa51VcZ+sM7PTp84+wA/P4szre36MV/GmMyXCt98NZIb87z4pQV3/Mi5oPqxcbR
	T403ykL7I7ido6cghAXSvfpRVexzNwlvc+m2BuXaZmu1L2rzYJa94F5lFh6WIb/JmpmI=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165637-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165637: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=210869834639c1150b1f016e2022472a55cdd884
X-Osstest-Versions-That:
    ovmf=f10a112f08f3fb4a92c3d22f069f6066a12db3be
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 18 Oct 2021 18:14:53 +0000

flight 165637 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165637/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 210869834639c1150b1f016e2022472a55cdd884
baseline version:
 ovmf                 f10a112f08f3fb4a92c3d22f069f6066a12db3be

Last test of basis   165531  2021-10-15 22:11:21 Z    2 days
Testing same since   165637  2021-10-18 13:41:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Marvin Häuser <mhaeuser@posteo.de>
  Shi Steven <steven.shi@intel.com>

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
   f10a112f08..2108698346  210869834639c1150b1f016e2022472a55cdd884 -> xen-tested-master


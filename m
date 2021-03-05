Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E066032EF88
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 17:02:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93859.177315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICtg-0001Ja-Ma; Fri, 05 Mar 2021 16:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93859.177315; Fri, 05 Mar 2021 16:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICtg-0001J6-Gw; Fri, 05 Mar 2021 16:01:48 +0000
Received: by outflank-mailman (input) for mailman id 93859;
 Fri, 05 Mar 2021 16:01:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lICtf-0001Iy-04; Fri, 05 Mar 2021 16:01:47 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lICte-0001g1-Lk; Fri, 05 Mar 2021 16:01:46 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lICte-0004FW-DX; Fri, 05 Mar 2021 16:01:46 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lICte-0001SW-D6; Fri, 05 Mar 2021 16:01:46 +0000
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
	bh=tK1NEKL7mcfE2/g3g1TU4vfS7U2LPKrr4qxrkACDkQI=; b=1758Th7SvuNOiykohOAypEY2mb
	KPoHMW7fn7rf9AR3IPMraC4v0c7NCtvC0gW5cF2S5eGBItuv7fYZRPpQ6v4EkKsD1UzxpD39Pm4LE
	d6WkAgL0m2sm3eIDCWQjwb4nuVuq1NeDL32V93fhUf88JCLtaR9zkMRyGdobdVSnKp/I=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159836-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159836: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c5740f360636479fb91681093b1dee1cc366075c
X-Osstest-Versions-That:
    ovmf=ef91b07388e1c0a50c604e5350eeda98428ccea6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 Mar 2021 16:01:46 +0000

flight 159836 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159836/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c5740f360636479fb91681093b1dee1cc366075c
baseline version:
 ovmf                 ef91b07388e1c0a50c604e5350eeda98428ccea6

Last test of basis   159800  2021-03-02 05:40:45 Z    3 days
Testing same since   159836  2021-03-05 09:09:50 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bandaru <purna.chandra.rao.bandaru@intel.com>
  Bandaru, Purna Chandra Rao <Purna.Chandra.Rao.Bandaru@intel.com>

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
   ef91b07388..c5740f3606  c5740f360636479fb91681093b1dee1cc366075c -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B646F2EF996
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 21:52:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63845.113241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxyjb-00062u-0E; Fri, 08 Jan 2021 20:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63845.113241; Fri, 08 Jan 2021 20:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxyja-00062Q-Rs; Fri, 08 Jan 2021 20:51:46 +0000
Received: by outflank-mailman (input) for mailman id 63845;
 Fri, 08 Jan 2021 20:51:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxyjY-00062H-Rw; Fri, 08 Jan 2021 20:51:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxyjY-0000fg-LR; Fri, 08 Jan 2021 20:51:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxyjY-0005hV-Au; Fri, 08 Jan 2021 20:51:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kxyjY-00028i-AQ; Fri, 08 Jan 2021 20:51:44 +0000
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
	bh=nmR+HHrreKaPMskMEdJT9lmEegSh/frXLM13i5hsVck=; b=FQA/ke7CmcXEQFUquTuWdlAtVs
	RLHJNKypg+eITsgfyClC3WgZscDRofVXANpRTJhgMKmuePUb2WigCceZ5Lr49FCiRolNki7xW5QYK
	BQlCdA4FgM7ZG8drbxa4E0QH4ELS7atdA70ezm57s9XdbIPXE88dk7BvC8GPDTXvTl84=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158280-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158280: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fabeffb09e3bbf38748c4c073fb7fc6b7e64c20c
X-Osstest-Versions-That:
    ovmf=1d3d5e3256018476e37ed6621fecbdbcfb2da58e
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Jan 2021 20:51:44 +0000

flight 158280 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158280/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fabeffb09e3bbf38748c4c073fb7fc6b7e64c20c
baseline version:
 ovmf                 1d3d5e3256018476e37ed6621fecbdbcfb2da58e

Last test of basis   158273  2021-01-08 04:09:47 Z    0 days
Testing same since   158280  2021-01-08 14:39:45 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ard.biesheuvel@arm.com>
  Leif Lindholm <leif@nuviainc.com>
  Liu, WeiX C <weix.c.liu@intel.com>
  Wei Liu <weix.c.liu@intel.com>

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
   1d3d5e3256..fabeffb09e  fabeffb09e3bbf38748c4c073fb7fc6b7e64c20c -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237A57B1CC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 09:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371427.603345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE4BX-0000yU-ML; Wed, 20 Jul 2022 07:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371427.603345; Wed, 20 Jul 2022 07:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE4BX-0000vs-IT; Wed, 20 Jul 2022 07:31:55 +0000
Received: by outflank-mailman (input) for mailman id 371427;
 Wed, 20 Jul 2022 07:31:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oE4BV-0000vi-V7; Wed, 20 Jul 2022 07:31:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oE4BV-0002bd-Tu; Wed, 20 Jul 2022 07:31:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oE4BV-0000Gh-JZ; Wed, 20 Jul 2022 07:31:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oE4BV-0004ic-J8; Wed, 20 Jul 2022 07:31:53 +0000
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
	bh=5mpJzztRJl4Q53W07jqEHuUWMDj/2VfI1zRZAnqxy90=; b=DYfHoyNaZhph6JeZDmizL0yiji
	J2O4WYcqyz07B1Ea1Y0EA7QbRRuz+obB/4NP1835R2DFYVqkpldFK3GbvaalThtnAj/eCEkzDG1pb
	WisNx4ukpjlX57RdX29HZtC5ycxfjX465baInXw0ipt6L3eRgr6vY+LAJqO0f4n8Jlik=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171696-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171696: tolerable FAIL - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:xen-install:fail:heisenbug
X-Osstest-Versions-This:
    ovmf=24eac4caf31afae48349af44588a52783c1819b8
X-Osstest-Versions-That:
    ovmf=671b0cea510ad6de02ee9d6dbdf8f9bbb881f35d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 20 Jul 2022 07:31:53 +0000

flight 171696 ovmf real [real]
flight 171699 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/171696/
http://logs.test-lab.xenproject.org/osstest/logs/171699/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install  fail pass in 171699-retest

version targeted for testing:
 ovmf                 24eac4caf31afae48349af44588a52783c1819b8
baseline version:
 ovmf                 671b0cea510ad6de02ee9d6dbdf8f9bbb881f35d

Last test of basis   171691  2022-07-19 19:12:59 Z    0 days
Testing same since   171696  2022-07-19 22:40:31 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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
   671b0cea51..24eac4caf3  24eac4caf31afae48349af44588a52783c1819b8 -> xen-tested-master


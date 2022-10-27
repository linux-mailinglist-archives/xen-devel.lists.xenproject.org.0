Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF46E610607
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 00:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431256.684074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooBnD-00022Y-Bo; Thu, 27 Oct 2022 22:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431256.684074; Thu, 27 Oct 2022 22:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooBnD-0001zt-92; Thu, 27 Oct 2022 22:56:07 +0000
Received: by outflank-mailman (input) for mailman id 431256;
 Thu, 27 Oct 2022 22:56:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ooBnB-0001zj-Qo; Thu, 27 Oct 2022 22:56:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ooBnB-0005L0-Q1; Thu, 27 Oct 2022 22:56:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ooBnB-0000JM-IC; Thu, 27 Oct 2022 22:56:05 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ooBnB-0002a2-Hm; Thu, 27 Oct 2022 22:56:05 +0000
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
	bh=53JNHjd2aAFDGjQ0OH2hnqUYr86eVIdCIg0VVzVInCk=; b=Y6XbLD85AKv73E6bapq6Lfi5yy
	StUKWXsLJ00WdHm7+EIHFu5qe7QNw+/ZPuSvjtRA97uCtomqK+mu0ks2sdj80w7789eIzg55kGe67
	xQW7SnetNmRsBm8S4JwYtxVT8tuW0wSn9jecrOmhGXHAg1Me+z8gASi2YpNzrIxsMSX4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-174512-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 174512: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=99338ef81ed6e48be57f71c01af85fbbdd7030ed
X-Osstest-Versions-That:
    ovmf=115cebbe4d7541c795b4f9baefc38f9a1733b7f6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 27 Oct 2022 22:56:05 +0000

flight 174512 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/174512/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 99338ef81ed6e48be57f71c01af85fbbdd7030ed
baseline version:
 ovmf                 115cebbe4d7541c795b4f9baefc38f9a1733b7f6

Last test of basis   174478  2022-10-26 22:43:36 Z    1 days
Testing same since   174512  2022-10-27 17:10:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   115cebbe4d..99338ef81e  99338ef81ed6e48be57f71c01af85fbbdd7030ed -> xen-tested-master


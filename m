Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7A53C9D1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 14:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341463.566682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx6Ec-00055S-Ig; Fri, 03 Jun 2022 12:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341463.566682; Fri, 03 Jun 2022 12:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx6Ec-00053D-E7; Fri, 03 Jun 2022 12:16:58 +0000
Received: by outflank-mailman (input) for mailman id 341463;
 Fri, 03 Jun 2022 12:16:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nx6Ea-00052y-Qe; Fri, 03 Jun 2022 12:16:56 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nx6Ea-0003S3-OA; Fri, 03 Jun 2022 12:16:56 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nx6Ea-0001om-F3; Fri, 03 Jun 2022 12:16:56 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nx6Ea-0003ko-Ea; Fri, 03 Jun 2022 12:16:56 +0000
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
	bh=+d/6Fr/6OAGRlSULLZCZKT0zXQcSwdJT0zBfRSbP1Co=; b=bi/WgGlscuCYoxUWIv0mAR9c8T
	GC7TCqsdqe3diQRxu+wOMI8WgwFx8Iz+VHMA2DIuETklTmpYfwTl1te2Vatg+UMwn2UTUMCyUmPyF
	pQuOyZguA78udhdCp8fQd8RDtiq9ZZ7W//+bipbREX6jEVdeYh5+TuhQKgMTeRdi8lUg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-170818-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 170818: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=632574ced10fe184d5665b73c62c959109c39961
X-Osstest-Versions-That:
    ovmf=0223898f3e45e8c7e9d8ba01aea5f95a282f420b
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 03 Jun 2022 12:16:56 +0000

flight 170818 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/170818/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 632574ced10fe184d5665b73c62c959109c39961
baseline version:
 ovmf                 0223898f3e45e8c7e9d8ba01aea5f95a282f420b

Last test of basis   170816  2022-06-03 08:41:38 Z    0 days
Testing same since   170818  2022-06-03 10:46:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>

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
   0223898f3e..632574ced1  632574ced10fe184d5665b73c62c959109c39961 -> xen-tested-master


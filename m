Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2EC6C6885
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 13:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513837.795454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKBm-0008Rh-HW; Thu, 23 Mar 2023 12:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513837.795454; Thu, 23 Mar 2023 12:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKBm-0008PW-Ew; Thu, 23 Mar 2023 12:37:06 +0000
Received: by outflank-mailman (input) for mailman id 513837;
 Thu, 23 Mar 2023 12:37:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfKBk-0008PM-V0; Thu, 23 Mar 2023 12:37:04 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfKBk-0007BN-SD; Thu, 23 Mar 2023 12:37:04 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pfKBk-0003s0-Ee; Thu, 23 Mar 2023 12:37:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pfKBk-0002G4-E9; Thu, 23 Mar 2023 12:37:04 +0000
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
	bh=6nLqmQEM8aNTWKhYg2fs49cIjw7EdpUWr/N+7RBqHKE=; b=3YupHDDZUBFWFrmy47zybeAoCR
	bcKHLqiQzf92uPO2a2nnAvnmI/V8fJClRzsTndoy+SXEYBj5cPVX8tvANMiXfEg+yEn3xplYuSOKT
	ZBIzIlYIvwqCJD/DdTVzBFx+X0V/6sdyQEpEvzUnk8Fl20xcOPJnYQb27I7s/R4oxk1w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-179892-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 179892: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=cf6a0a52b07195ba278e48b89cfb7ddbad332ab1
X-Osstest-Versions-That:
    ovmf=4f441d024bee7e1a6438737b58e4b0b6856b3eab
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Mar 2023 12:37:04 +0000

flight 179892 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/179892/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 cf6a0a52b07195ba278e48b89cfb7ddbad332ab1
baseline version:
 ovmf                 4f441d024bee7e1a6438737b58e4b0b6856b3eab

Last test of basis   179860  2023-03-22 04:10:52 Z    1 days
Testing same since   179892  2023-03-23 09:43:42 Z    0 days    1 attempts

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
   4f441d024b..cf6a0a52b0  cf6a0a52b07195ba278e48b89cfb7ddbad332ab1 -> xen-tested-master


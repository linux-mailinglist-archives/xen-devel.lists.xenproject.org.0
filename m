Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC4F2F062F
	for <lists+xen-devel@lfdr.de>; Sun, 10 Jan 2021 10:24:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64401.113817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyWwy-0007dn-Tc; Sun, 10 Jan 2021 09:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64401.113817; Sun, 10 Jan 2021 09:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyWwy-0007dM-PQ; Sun, 10 Jan 2021 09:23:52 +0000
Received: by outflank-mailman (input) for mailman id 64401;
 Sun, 10 Jan 2021 09:23:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyWwx-0007dD-CK; Sun, 10 Jan 2021 09:23:51 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyWwx-0003oz-8h; Sun, 10 Jan 2021 09:23:51 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kyWww-0007nc-Vm; Sun, 10 Jan 2021 09:23:51 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kyWww-0001BM-VK; Sun, 10 Jan 2021 09:23:50 +0000
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
	bh=uVmO5fWGr1PpvYrybtY6rdHUbQk9c5Gilge4B10Y+dQ=; b=Xg62eFkxSTpdUOWKjmwUhjMgQa
	s94B4ZlqCStNuyLg67s+I8I3RDI8JXMvdFOxSWZvp0oajkX9F5C+q1nZR3pdF0c+KK8lx2kxxiAmz
	33iNHCjzI8y5xc4nNj0U/0GpDTl+NURF7zDIujLKz7v+Nw7zMY+/zXMSXp5yVWrpSD0o=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158307-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158307: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=4ea3a6ded844dbeff0a1f1de8830bc9176fa4a7b
X-Osstest-Versions-That:
    ovmf=acabf1b0330897e4e0ac236d8930f2ded1c4ffb8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Jan 2021 09:23:50 +0000

flight 158307 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158307/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 4ea3a6ded844dbeff0a1f1de8830bc9176fa4a7b
baseline version:
 ovmf                 acabf1b0330897e4e0ac236d8930f2ded1c4ffb8

Last test of basis   158292  2021-01-09 03:10:42 Z    1 days
Testing same since   158307  2021-01-10 01:40:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nhi Pham <nhi@os.amperecomputing.com>

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
   acabf1b033..4ea3a6ded8  4ea3a6ded844dbeff0a1f1de8830bc9176fa4a7b -> xen-tested-master


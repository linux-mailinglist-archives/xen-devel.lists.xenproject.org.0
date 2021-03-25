Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1DA349B0C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 21:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101541.194340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPWjR-0007YC-EV; Thu, 25 Mar 2021 20:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101541.194340; Thu, 25 Mar 2021 20:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPWjR-0007Xj-7R; Thu, 25 Mar 2021 20:37:29 +0000
Received: by outflank-mailman (input) for mailman id 101541;
 Thu, 25 Mar 2021 20:37:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lPWjP-0007XZ-Ef; Thu, 25 Mar 2021 20:37:27 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lPWjP-0003sN-BF; Thu, 25 Mar 2021 20:37:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lPWjP-0000Ae-4S; Thu, 25 Mar 2021 20:37:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lPWjP-0002cz-3y; Thu, 25 Mar 2021 20:37:27 +0000
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
	bh=DIvid+FMYtdy9zsdSNEQ7FMOvllYdo3SZDYI0jObqWo=; b=IQrD5V4pJm8pJ5B8oMnJa1u/lP
	vvHrbcWT+z0bfsdHPK1/KICTUTXb83Tf2Dlx85nAMaAFf2/6nKkoSms7OMwVSmfL8zPaE0D0A5o9X
	OdIBxYMRL5QIZA3jUGl5/RREItvgj+di0ULz/ACU0vDB0eZ91GUvrd6jhnHOUvZBToX4=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160399-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160399: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f037af6ecbc3b55042c998a59ed8df8548e64b99
X-Osstest-Versions-That:
    ovmf=0ecdcb6142037dd1cdd08660a2349960bcf0270a
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 25 Mar 2021 20:37:27 +0000

flight 160399 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160399/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f037af6ecbc3b55042c998a59ed8df8548e64b99
baseline version:
 ovmf                 0ecdcb6142037dd1cdd08660a2349960bcf0270a

Last test of basis   160352  2021-03-23 05:41:31 Z    2 days
Testing same since   160399  2021-03-24 22:10:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ross Burton <ross.burton@arm.com>
  Ross Burton <ross@burtonini.com>

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
   0ecdcb6142..f037af6ecb  f037af6ecbc3b55042c998a59ed8df8548e64b99 -> xen-tested-master


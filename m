Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A943D02B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 19:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217158.377036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfnAW-0003xT-Ab; Wed, 27 Oct 2021 17:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217158.377036; Wed, 27 Oct 2021 17:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfnAW-0003uM-57; Wed, 27 Oct 2021 17:56:56 +0000
Received: by outflank-mailman (input) for mailman id 217158;
 Wed, 27 Oct 2021 17:56:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mfnAU-0003uC-Ku; Wed, 27 Oct 2021 17:56:54 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mfnAU-00012R-Gw; Wed, 27 Oct 2021 17:56:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mfnAU-0004cK-9n; Wed, 27 Oct 2021 17:56:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mfnAU-0006bn-71; Wed, 27 Oct 2021 17:56:54 +0000
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
	bh=w274TJilkZqbkjOMyvrxwVUGXyxsmeDbhenjI0SbGsM=; b=S+G8e8argXgwpZGQK/jRKdwPqJ
	MKf0g20LWZhVK4iP2Yh7iV1yZ/2EYTo6s9A6z0cuahK7OBx1X08jB2Y12YZIKkMjVuIn9pnsIbY6u
	O8QiZaTcM/Y52hqKhTN1NIUWqY2fE8lNX4SSw2KKCssMG5E4g6fS/0+eV6h9NCUkL9ss=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165899-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165899: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9a95d11023ac2f2ee49a2958cf80658270442c42
X-Osstest-Versions-That:
    ovmf=2f6f3329add328103cb0654b71d7b814dc0c9759
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 27 Oct 2021 17:56:54 +0000

flight 165899 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165899/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9a95d11023ac2f2ee49a2958cf80658270442c42
baseline version:
 ovmf                 2f6f3329add328103cb0654b71d7b814dc0c9759

Last test of basis   165873  2021-10-26 05:40:10 Z    1 days
Testing same since   165899  2021-10-27 12:10:06 Z    0 days    1 attempts

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
   2f6f3329ad..9a95d11023  9a95d11023ac2f2ee49a2958cf80658270442c42 -> xen-tested-master


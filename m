Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C6488328
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 12:15:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254835.436730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n69gL-00070O-1H; Sat, 08 Jan 2022 11:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254835.436730; Sat, 08 Jan 2022 11:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n69gK-0006x4-Te; Sat, 08 Jan 2022 11:14:44 +0000
Received: by outflank-mailman (input) for mailman id 254835;
 Sat, 08 Jan 2022 11:14:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n69gK-0006wu-0Y; Sat, 08 Jan 2022 11:14:44 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n69gJ-0003F2-TA; Sat, 08 Jan 2022 11:14:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n69gJ-0004Yd-Lr; Sat, 08 Jan 2022 11:14:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n69gJ-000643-LQ; Sat, 08 Jan 2022 11:14:43 +0000
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
	bh=Vaw2VBVL3jw0vITXhiO7mzstfF5OlIWlrRPH56UV54Y=; b=mUxswYMWulYTCOYplXc8ykH1v4
	nkjkzbLAgrnPvxC/oUQ8zbbDFDPlHMDXmiQRtwRL/8vfePg5Oh3iEWO3JdqDhUWo4TE64dBVk+jb0
	n6MHKQEmW22jQejNCxixEdEN9UCXy9ztMnpdwrliPv44OAdXFBd6Rms2i1GIRlTjiRlo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167636-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167636: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=14a731096d388aa20c0afa9fe5af55c998082efb
X-Osstest-Versions-That:
    ovmf=9dd14fc91c174eae87fd122c7ac70073a363527f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 08 Jan 2022 11:14:43 +0000

flight 167636 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167636/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 14a731096d388aa20c0afa9fe5af55c998082efb
baseline version:
 ovmf                 9dd14fc91c174eae87fd122c7ac70073a363527f

Last test of basis   167627  2022-01-07 06:40:23 Z    1 days
Testing same since   167636  2022-01-08 04:11:46 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kuqin12@gmail.com>

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
   9dd14fc91c..14a731096d  14a731096d388aa20c0afa9fe5af55c998082efb -> xen-tested-master


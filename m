Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705433DCAD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 19:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98448.186772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMEZo-0008ID-VF; Tue, 16 Mar 2021 18:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98448.186772; Tue, 16 Mar 2021 18:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMEZo-0008Hg-OM; Tue, 16 Mar 2021 18:37:56 +0000
Received: by outflank-mailman (input) for mailman id 98448;
 Tue, 16 Mar 2021 18:37:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMEZn-0008HY-7E; Tue, 16 Mar 2021 18:37:55 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMEZm-0001HI-UC; Tue, 16 Mar 2021 18:37:54 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMEZm-0001IB-L6; Tue, 16 Mar 2021 18:37:54 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lMEZm-0005BK-Kc; Tue, 16 Mar 2021 18:37:54 +0000
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
	bh=fXQgPlF8vO85Q8Qcdo5c1ie3dZF8M8fRui7KEzJECoE=; b=yuxpEBbTwYkq7y/WgOCEjAPcI3
	zq+VF2guZuJ+AEMY/MSrPnO4zHOn19lPlvOK4ln5mEYQBIqYznJwXD7W4sMimGmBkxrvWPAoMTkOd
	WMt7mo4kei09DVeH8ctd50BpTkBt3pKKqzhk2HnM5OSDlEdeoUqGm850l5zXPB8MPYwQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160098-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160098: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f3bdfc41866edf7c256e689deb9d091a950c8fca
X-Osstest-Versions-That:
    ovmf=4751a48aeb2ab828b0a5cbdc585fd3642967cda1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Mar 2021 18:37:54 +0000

flight 160098 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160098/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f3bdfc41866edf7c256e689deb9d091a950c8fca
baseline version:
 ovmf                 4751a48aeb2ab828b0a5cbdc585fd3642967cda1

Last test of basis   159932  2021-03-11 09:09:46 Z    5 days
Testing same since   160098  2021-03-16 13:41:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ankur Arora <ankur.a.arora@oracle.com>

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
   4751a48aeb..f3bdfc4186  f3bdfc41866edf7c256e689deb9d091a950c8fca -> xen-tested-master


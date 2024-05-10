Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F728C1CA9
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 05:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719452.1122203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5GUM-00089P-MF; Fri, 10 May 2024 03:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719452.1122203; Fri, 10 May 2024 03:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5GUM-00087D-ID; Fri, 10 May 2024 03:00:02 +0000
Received: by outflank-mailman (input) for mailman id 719452;
 Fri, 10 May 2024 03:00:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s5GUL-0007wn-A1; Fri, 10 May 2024 03:00:01 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s5GUL-00020l-51; Fri, 10 May 2024 03:00:01 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1s5GUK-0002jn-PQ; Fri, 10 May 2024 03:00:00 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1s5GUK-00074H-Ox; Fri, 10 May 2024 03:00:00 +0000
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
	bh=eDXRAGAY1EUNLjgTogj+K3rybJjqDZlARxSJva2FpHc=; b=NyyPk+vbrz0jrKpD3QS3rostc6
	fhfLA7e8JUDiqYReTwbkII9jbnqHntZUQgABzx2vNFNEpDV54sN2P4kMxQpa1c6o/kQjUr1ewfRXz
	SzAT7xi+XwPtWuZeaKjPlXytpxZzTtP03u7IwKGfWU0laTkorVKLhI0tS5SI2iWXyOzw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185963-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185963: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3c0b84420f098c5a88281a6be370c2766184c99b
X-Osstest-Versions-That:
    ovmf=25996a3441f4f40fcf457c4ba39a1e88c4f75bdd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 May 2024 03:00:00 +0000

flight 185963 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185963/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3c0b84420f098c5a88281a6be370c2766184c99b
baseline version:
 ovmf                 25996a3441f4f40fcf457c4ba39a1e88c4f75bdd

Last test of basis   185952  2024-05-09 07:13:15 Z    0 days
Testing same since   185963  2024-05-10 01:11:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abdul Lateef Attar <AbdulLateef.Attar@amd.com>

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
   25996a3441..3c0b84420f  3c0b84420f098c5a88281a6be370c2766184c99b -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212CD87A935
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 15:11:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692450.1079602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkPK2-0001YP-3r; Wed, 13 Mar 2024 14:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692450.1079602; Wed, 13 Mar 2024 14:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkPK2-0001WK-1F; Wed, 13 Mar 2024 14:11:10 +0000
Received: by outflank-mailman (input) for mailman id 692450;
 Wed, 13 Mar 2024 14:11:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkPK0-0001WA-Pp; Wed, 13 Mar 2024 14:11:08 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkPK0-0006bK-K7; Wed, 13 Mar 2024 14:11:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1rkPK0-0001l8-94; Wed, 13 Mar 2024 14:11:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1rkPK0-0000w8-8e; Wed, 13 Mar 2024 14:11:08 +0000
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
	bh=YWM3OfH76wwP4st7K6cw3r8mpP/uOjEJQRf0NGUQOMI=; b=Ad8+KY8ym21bbvRrkRXWSpGbNG
	5ytMkqO1RNoJrZ/if0+8G91M//EwCkx+97aPuRoPdFZ8v+k3QkZImcgzdYzKdOljmJv7ziFGt8A6Z
	78MyY4LtMXL1QHOKk0DF2YaL5HSCKChm8sbdy9bmJ9qicQ5zRnQVoinEPNn+JoVQ4/uw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-185018-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 185018: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5572b43c6767f7cc46b074ae1fc288f6eccdc65d
X-Osstest-Versions-That:
    ovmf=6b3a512149ddadb1891f0f96c63eba5dc65c7c69
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 13 Mar 2024 14:11:08 +0000

flight 185018 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/185018/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5572b43c6767f7cc46b074ae1fc288f6eccdc65d
baseline version:
 ovmf                 6b3a512149ddadb1891f0f96c63eba5dc65c7c69

Last test of basis   185015  2024-03-13 03:16:08 Z    0 days
Testing same since   185018  2024-03-13 11:45:09 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Igniculus Fu <igniculus.fu@amd.com>
  Jeshua Smith <jeshuas@nvidia.com>

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
   6b3a512149..5572b43c67  5572b43c6767f7cc46b074ae1fc288f6eccdc65d -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3B487404
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 09:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254311.436048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5kQd-0003sS-Dy; Fri, 07 Jan 2022 08:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254311.436048; Fri, 07 Jan 2022 08:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5kQd-0003qd-Ap; Fri, 07 Jan 2022 08:16:51 +0000
Received: by outflank-mailman (input) for mailman id 254311;
 Fri, 07 Jan 2022 08:16:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n5kQb-0003qT-BO; Fri, 07 Jan 2022 08:16:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n5kQb-0003uM-AM; Fri, 07 Jan 2022 08:16:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n5kQb-0006Fr-3M; Fri, 07 Jan 2022 08:16:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n5kQb-0003fD-2y; Fri, 07 Jan 2022 08:16:49 +0000
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
	bh=MLGE8EcuO4HyQFQTHuMvPYiX4PCpi+GxWU1stdP3n9w=; b=DJFjSe3uQYtgvghgyr1/4qfnlW
	qDYwFRDidd5fn5vIlIoLkzblR5oEty7e/gYoLnzHYnFloQ1HBDtULr5oj13Cklkc9nhCb9oXKVHdg
	i9+C/a5cz7qGD/WdXNWxPdqzf+psFK4MfJPGG/K2dMcvw2op7BxXh5ZhSwM7NbgCB2mg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167627-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167627: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9dd14fc91c174eae87fd122c7ac70073a363527f
X-Osstest-Versions-That:
    ovmf=079a58276b98dc97ca363e3bc8b35cc7baa56d76
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Jan 2022 08:16:49 +0000

flight 167627 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167627/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9dd14fc91c174eae87fd122c7ac70073a363527f
baseline version:
 ovmf                 079a58276b98dc97ca363e3bc8b35cc7baa56d76

Last test of basis   167601  2022-01-04 08:42:53 Z    2 days
Testing same since   167627  2022-01-07 06:40:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Maggie Chu <maggie.chu@intel.com>

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
   079a58276b..9dd14fc91c  9dd14fc91c174eae87fd122c7ac70073a363527f -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8776A0C98
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 16:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500510.771936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDE2-0001Gr-1b; Thu, 23 Feb 2023 15:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500510.771936; Thu, 23 Feb 2023 15:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDE1-0001Dj-U0; Thu, 23 Feb 2023 15:09:37 +0000
Received: by outflank-mailman (input) for mailman id 500510;
 Thu, 23 Feb 2023 15:09:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVDE0-0001DZ-Na; Thu, 23 Feb 2023 15:09:36 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVDE0-0007rn-Mk; Thu, 23 Feb 2023 15:09:36 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pVDE0-0002g4-BB; Thu, 23 Feb 2023 15:09:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pVDE0-0006ta-Ao; Thu, 23 Feb 2023 15:09:36 +0000
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
	bh=859DvAhAQGbkJD5Kl4TQtWsiszCrAkmrr9ZE1CUrDfk=; b=COGdiYMnaT22J7t6oAi4Xo7VJv
	1EpVybAVxWj0HjfEmi5kQarL1UcKKIejxKrjm2r+IpfVAHIT7sIKa27w2irLvRY3rkUnByiLewft0
	qyF+ho5v3H/oG2+B/NJzH1QeEmc25N3re9B+Hm1trDKi7rOAWhb5qqklujl85XhIPA2w=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178201-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 178201: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2c5961cccff1164ac7d0e34baa606d1ba1abcf43
X-Osstest-Versions-That:
    ovmf=02fcfdce1e5ce86f1951191883e7e30de5aa08be
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 Feb 2023 15:09:36 +0000

flight 178201 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178201/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2c5961cccff1164ac7d0e34baa606d1ba1abcf43
baseline version:
 ovmf                 02fcfdce1e5ce86f1951191883e7e30de5aa08be

Last test of basis   177524  2023-02-16 19:12:16 Z    6 days
Testing same since   178201  2023-02-23 04:12:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
  Sunil V L <sunilvl@ventanamicro.com>

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
   02fcfdce1e..2c5961cccf  2c5961cccff1164ac7d0e34baa606d1ba1abcf43 -> xen-tested-master


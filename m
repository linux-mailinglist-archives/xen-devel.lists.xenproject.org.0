Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC392EF3D8
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 15:22:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63484.112690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxsdh-0004SM-0R; Fri, 08 Jan 2021 14:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63484.112690; Fri, 08 Jan 2021 14:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxsdg-0004Rj-PL; Fri, 08 Jan 2021 14:21:16 +0000
Received: by outflank-mailman (input) for mailman id 63484;
 Fri, 08 Jan 2021 14:21:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxsde-0004Rb-V9; Fri, 08 Jan 2021 14:21:14 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxsde-0001j6-Lr; Fri, 08 Jan 2021 14:21:14 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kxsde-0008Pf-BT; Fri, 08 Jan 2021 14:21:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kxsde-0000hx-Am; Fri, 08 Jan 2021 14:21:14 +0000
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
	bh=cmB0UHbQ8Uo9WrhSPYSG7FSqecD862chJlkrFXlDhHc=; b=e1QlIr+XsijbrvYFM4sz+uzdaJ
	c8+A+1KfaF4s8+2T0Kv1VMJCncgY3C68e4D7pIQxazfWfHZI9nekRBlJWsy+RojDHAlmEmmS3JdYM
	7segtZoterG0TCzBHxsgnrkMXe0DtoKzIv0mDCQS115zrL9Cuy2RB5YIPRzvdLrT9eiY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158273-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158273: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=1d3d5e3256018476e37ed6621fecbdbcfb2da58e
X-Osstest-Versions-That:
    ovmf=85b8eac59b8c5bd9c7eb9afdb64357ce1aa2e803
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 08 Jan 2021 14:21:14 +0000

flight 158273 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158273/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 1d3d5e3256018476e37ed6621fecbdbcfb2da58e
baseline version:
 ovmf                 85b8eac59b8c5bd9c7eb9afdb64357ce1aa2e803

Last test of basis   158267  2021-01-07 23:09:45 Z    0 days
Testing same since   158273  2021-01-08 04:09:47 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Marc Moisson-Franckhauser <marc.moisson-franckhauser@arm.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   85b8eac59b..1d3d5e3256  1d3d5e3256018476e37ed6621fecbdbcfb2da58e -> xen-tested-master


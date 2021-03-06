Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C53332F82C
	for <lists+xen-devel@lfdr.de>; Sat,  6 Mar 2021 05:13:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94124.177587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIOIi-0008IH-Er; Sat, 06 Mar 2021 04:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94124.177587; Sat, 06 Mar 2021 04:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIOIi-0008Hp-AW; Sat, 06 Mar 2021 04:12:24 +0000
Received: by outflank-mailman (input) for mailman id 94124;
 Sat, 06 Mar 2021 04:12:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lIOIh-0008Hh-9w; Sat, 06 Mar 2021 04:12:23 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lIOIh-0007tF-30; Sat, 06 Mar 2021 04:12:23 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lIOIg-00008w-R4; Sat, 06 Mar 2021 04:12:22 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lIOIg-0004mM-Po; Sat, 06 Mar 2021 04:12:22 +0000
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
	bh=LXdzffgWgadB57pouIzAfgHI2laskCx4Z80cpcir/C0=; b=UR29HzEv5bYd85FoEE4Xbx5TJf
	APsbOmlcVnFFp93xdlK8++wQgO9QIbNdOvd/SwiIDt8+J5zOzXSKde3pEZ8cdvxLjzqaqAfCBjgSW
	zCCb9C0YZPDAWlwVPltxi/wpni0OqpxVtChh0rJ6IQyWxasJGzWZOM0d2PjH8nRuBLYM=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159841-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 159841: tolerable trouble: pass/starved - PUSHED
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:hosts-allocate:starved:nonblocking
X-Osstest-Versions-This:
    ovmf=59a3ccb09e7a246913d88fbac31412f20f717a3c
X-Osstest-Versions-That:
    ovmf=c5740f360636479fb91681093b1dee1cc366075c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 06 Mar 2021 04:12:22 +0000

flight 159841 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/159841/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-ovmf-amd64  3 hosts-allocate              starved n/a

version targeted for testing:
 ovmf                 59a3ccb09e7a246913d88fbac31412f20f717a3c
baseline version:
 ovmf                 c5740f360636479fb91681093b1dee1cc366075c

Last test of basis   159836  2021-03-05 09:09:50 Z    0 days
Testing same since   159841  2021-03-05 16:11:00 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Kun Qin <kun.q@outlook.com>
  Laszlo Ersek <lersek@redhat.com>

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
 test-amd64-i386-xl-qemuu-ovmf-amd64                          starved 


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
   c5740f3606..59a3ccb09e  59a3ccb09e7a246913d88fbac31412f20f717a3c -> xen-tested-master


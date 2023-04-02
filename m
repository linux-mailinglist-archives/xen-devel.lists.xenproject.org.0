Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017E26D35E3
	for <lists+xen-devel@lfdr.de>; Sun,  2 Apr 2023 09:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517232.802366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piruL-0005y6-AS; Sun, 02 Apr 2023 07:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517232.802366; Sun, 02 Apr 2023 07:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piruL-0005vq-7G; Sun, 02 Apr 2023 07:13:45 +0000
Received: by outflank-mailman (input) for mailman id 517232;
 Sun, 02 Apr 2023 07:13:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piruJ-0005vg-8q; Sun, 02 Apr 2023 07:13:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piruJ-0007Ah-6w; Sun, 02 Apr 2023 07:13:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1piruI-0001m3-Nw; Sun, 02 Apr 2023 07:13:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1piruI-0001Mq-NX; Sun, 02 Apr 2023 07:13:42 +0000
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
	bh=GR17R9eJbS8LKlWxOJKbPKkm5REFoWqCm1j8utK1gno=; b=oC8TE3aXqA4Hmte1DxpHVaCou/
	ueBGyjPU26UpjcAFOLdGlBimsOVHsoZ+p1FxoeJJzraEvnq6rUHONS8mp9B9Xv08ClQT4r+ajk5zo
	11aKsYQ5FTopdQi2X9h4R96RonOZWUe52Ai1IlIeu52u/nkXBkvwkvVn6sQhK2CTlBP4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180112-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180112: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=fc00ff286a541c047b7d343e66ec10890b80d3ea
X-Osstest-Versions-That:
    ovmf=b4af23aaab8a44341e43713a71cbebf23df2c27d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 02 Apr 2023 07:13:42 +0000

flight 180112 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180112/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 fc00ff286a541c047b7d343e66ec10890b80d3ea
baseline version:
 ovmf                 b4af23aaab8a44341e43713a71cbebf23df2c27d

Last test of basis   180109  2023-04-02 02:15:13 Z    0 days
Testing same since   180112  2023-04-02 04:43:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Michael Kubacki <michael.kubacki@microsoft.com>

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
   b4af23aaab..fc00ff286a  fc00ff286a541c047b7d343e66ec10890b80d3ea -> xen-tested-master


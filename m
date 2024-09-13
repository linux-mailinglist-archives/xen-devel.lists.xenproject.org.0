Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7DD9778A0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 08:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797928.1207990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sozRJ-0000hr-So; Fri, 13 Sep 2024 06:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797928.1207990; Fri, 13 Sep 2024 06:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sozRJ-0000fp-Pg; Fri, 13 Sep 2024 06:05:53 +0000
Received: by outflank-mailman (input) for mailman id 797928;
 Fri, 13 Sep 2024 06:05:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sozRI-0000ff-Pu; Fri, 13 Sep 2024 06:05:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sozRI-0006zA-Mx; Fri, 13 Sep 2024 06:05:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sozRI-0004BY-Cr; Fri, 13 Sep 2024 06:05:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sozRI-0006n6-CO; Fri, 13 Sep 2024 06:05:52 +0000
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
	bh=RfHuybO4B5Hd/Eh3ZKhK6j2rGzb9B7j0AuFL7GLfztY=; b=I+BMxS398hS/6JGlxIloTBy44K
	MRG0Fhz2EwKffJ4VPgbwXrJGTdpLsZJzZE1v16Sh6UmjWPy6TuyeHEVIRM/psPRlDoDOCkBInZh4i
	dxAVRaqfanjj4xqSwUrRLcc5pW9Micwu7GF5MslPwOL+llbL7j3DGq66xEbLKah8sU5s=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187685-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187685: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=a9b38305b64ef5997d0ba5f7d2797a75edd1f9ef
X-Osstest-Versions-That:
    ovmf=6706fe6e239253e45b28147e06f71dd68a374007
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Sep 2024 06:05:52 +0000

flight 187685 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187685/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 a9b38305b64ef5997d0ba5f7d2797a75edd1f9ef
baseline version:
 ovmf                 6706fe6e239253e45b28147e06f71dd68a374007

Last test of basis   187684  2024-09-13 00:45:12 Z    0 days
Testing same since   187685  2024-09-13 04:15:10 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Bret Barkelew <brbarkel@microsoft.com>
  Oliver Smith-Denny <osde@linux.microsoft.com>
  Oliver Smith-Denny <osde@microsoft.com>
  Taylor Beebe <taylor.d.beebe@gmail.com>

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
   6706fe6e23..a9b38305b6  a9b38305b64ef5997d0ba5f7d2797a75edd1f9ef -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6870A4A6A18
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 03:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263797.456646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nF5cG-0001Wh-86; Wed, 02 Feb 2022 02:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263797.456646; Wed, 02 Feb 2022 02:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nF5cG-0001Uq-3Y; Wed, 02 Feb 2022 02:43:28 +0000
Received: by outflank-mailman (input) for mailman id 263797;
 Wed, 02 Feb 2022 02:43:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nF5cE-0001Ug-PM; Wed, 02 Feb 2022 02:43:26 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nF5cE-0006VO-Nf; Wed, 02 Feb 2022 02:43:26 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nF5cD-0007K1-S4; Wed, 02 Feb 2022 02:43:26 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nF5cD-0001Un-Pg; Wed, 02 Feb 2022 02:43:25 +0000
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
	bh=Nd0rbmG2iB42xgSREHi30bvdKLcj/AsQJ4NMMl7eayw=; b=45Tb6BsOGCsrWPO8O1jWsIviG1
	LRvz3IBSaGUkA/e0dotYjG7yS+HtQ2Kx+Xk/BRup52M4kWXbCwx1E7K9N5NEGcvzR+ouyPqv49TrR
	lCymJcm7mThhUGjZkxZViVxCAyAWqNyVjRaekKrbkN7xGO+r0HXiF9+yUuaslPjfeMOo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167976-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167976: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=5b3c682d91bd699a3144d36258565ccaa2036db7
X-Osstest-Versions-That:
    ovmf=103fa647d159e3d76be2634d2653c2d215dd0d46
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Feb 2022 02:43:25 +0000

flight 167976 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167976/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 5b3c682d91bd699a3144d36258565ccaa2036db7
baseline version:
 ovmf                 103fa647d159e3d76be2634d2653c2d215dd0d46

Last test of basis   167956  2022-01-30 11:13:00 Z    2 days
Testing same since   167976  2022-02-01 17:41:44 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Pierre Gondois <Pierre.Gondois@arm.com>
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
   103fa647d1..5b3c682d91  5b3c682d91bd699a3144d36258565ccaa2036db7 -> xen-tested-master


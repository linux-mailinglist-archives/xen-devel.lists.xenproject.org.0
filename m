Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81674291FC9
	for <lists+xen-devel@lfdr.de>; Sun, 18 Oct 2020 22:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8567.22917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUF9z-000685-Re; Sun, 18 Oct 2020 20:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8567.22917; Sun, 18 Oct 2020 20:20:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUF9z-00067g-O6; Sun, 18 Oct 2020 20:20:07 +0000
Received: by outflank-mailman (input) for mailman id 8567;
 Sun, 18 Oct 2020 20:20:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MNWJ=DZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kUF9y-00063t-LK
 for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 20:20:06 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4055ad10-0cf0-406a-907b-88545e325fb4;
 Sun, 18 Oct 2020 20:20:04 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUF9v-0003k4-MG; Sun, 18 Oct 2020 20:20:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kUF9v-0006CU-EZ; Sun, 18 Oct 2020 20:20:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kUF9v-0006T5-Dc; Sun, 18 Oct 2020 20:20:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MNWJ=DZ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kUF9y-00063t-LK
	for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 20:20:06 +0000
X-Inumbo-ID: 4055ad10-0cf0-406a-907b-88545e325fb4
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4055ad10-0cf0-406a-907b-88545e325fb4;
	Sun, 18 Oct 2020 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=JPBKx+B6eNbUtFzMMLFpTstIGh+R3YvCs9CFC4RQBkA=; b=jcawda7sv6HeR4HHrI/jxptn2N
	oHrZly6fAMjcVbNYQ49k6dfZmzFxEoqtFSZf5WkigYAcg6JR4t8t8TezLQkaGYkPWQkvMY5wT5YDX
	0R3JejFNJAyAxdENcPKc10KTifR1h9xTkRgUu7CaoP1fo4Jm+8jEufk2O5pOcjgVLeOI=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUF9v-0003k4-MG; Sun, 18 Oct 2020 20:20:03 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUF9v-0006CU-EZ; Sun, 18 Oct 2020 20:20:03 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kUF9v-0006T5-Dc; Sun, 18 Oct 2020 20:20:03 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155957-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155957: regressions - FAIL
X-Osstest-Failures:
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:guest-localmigrate/x10:fail:regression
X-Osstest-Versions-This:
    ovmf=709b163940c55604b983400eb49dad144a2aa091
X-Osstest-Versions-That:
    ovmf=73e3cb6c7eea4f5db81c87574dcefe1282de4772
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 18 Oct 2020 20:20:03 +0000

flight 155957 ovmf real [real]
flight 155967 ovmf real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/155957/
http://logs.test-lab.xenproject.org/osstest/logs/155967/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-i386-xl-qemuu-ovmf-amd64 18 guest-localmigrate/x10 fail REGR. vs. 155942

version targeted for testing:
 ovmf                 709b163940c55604b983400eb49dad144a2aa091
baseline version:
 ovmf                 73e3cb6c7eea4f5db81c87574dcefe1282de4772

Last test of basis   155942  2020-10-18 01:09:50 Z    0 days
Testing same since   155957  2020-10-18 11:07:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Terry Lee <terry.lee@hpe.com>
  Zhichao Gao <zhichao.gao@intel.com>

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
 test-amd64-i386-xl-qemuu-ovmf-amd64                          fail    


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


Not pushing.

------------------------------------------------------------
commit 709b163940c55604b983400eb49dad144a2aa091
Author: Terry Lee <terry.lee@hpe.com>
Date:   Thu Jul 9 10:46:47 2020 +0800

    SecurityPkg/Tcg2PhysicalPresenceLib: Fix incorrect TCG VER comparision
    
    REF: https://bugzilla.tianocore.org/show_bug.cgi?id=2697
    
    Tcg2PhysicalPresenceLibConstructor set the module variable
    mIsTcg2PPVerLowerThan_1_3 with incorrect TCG version comparision.
    
    Cc: Jiewen Yao <jiewen.yao@intel.com>
    Cc: Jian J Wang <jian.j.wang@intel.com>
    Cc: Chao Zhang <chao.b.zhang@intel.com>
    Signed-off-by: Zhichao Gao <zhichao.gao@intel.com>
    Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>


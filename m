Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32858E161
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 22:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383183.618311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLWFq-00053V-Mc; Tue, 09 Aug 2022 20:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383183.618311; Tue, 09 Aug 2022 20:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLWFq-00051p-K5; Tue, 09 Aug 2022 20:55:10 +0000
Received: by outflank-mailman (input) for mailman id 383183;
 Tue, 09 Aug 2022 20:55:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oLWFp-00051f-1v; Tue, 09 Aug 2022 20:55:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oLWFo-0000GJ-Va; Tue, 09 Aug 2022 20:55:08 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oLWFo-0004WQ-Hr; Tue, 09 Aug 2022 20:55:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oLWFo-0004VJ-HN; Tue, 09 Aug 2022 20:55:08 +0000
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
	bh=poi4cKNUnZSJy2QOFRmolAkjcRFRpU1xoNPkbmdfwwE=; b=qyq24nN67PwkQUY2GSfSI6a1kR
	nOb9T6fUonMd9LfiBwAfLP9hy6NpbgCIxqdhHGmprZvoQgLStI5Qb/gQyHwsIZYIPnp6yPqNVZYLQ
	4lMcsThzeuPk3b9LCcCLf4UyhIpZCksyCPumxN0dPGt4O/ik1K43QeHNL6dUXeayOdLE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-172335-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 172335: regressions - FAIL
X-Osstest-Failures:
    ovmf:build-amd64-libvirt:libvirt-build:fail:regression
    ovmf:build-i386-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This:
    ovmf=e9e2ecab2d931069d5f9afaae313e09d42bee6e9
X-Osstest-Versions-That:
    ovmf=444260d45ec2a84e8f8c192b3539a3cd5591d009
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 09 Aug 2022 20:55:08 +0000

flight 172335 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/172335/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 172136
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 172136

version targeted for testing:
 ovmf                 e9e2ecab2d931069d5f9afaae313e09d42bee6e9
baseline version:
 ovmf                 444260d45ec2a84e8f8c192b3539a3cd5591d009

Last test of basis   172136  2022-08-04 06:43:42 Z    5 days
Failing since        172151  2022-08-05 02:40:28 Z    4 days   46 attempts
Testing same since   172322  2022-08-09 08:10:24 Z    0 days    5 attempts

------------------------------------------------------------
People who touched revisions under test:
  Czajkowski, Maciej <maciej.czajkowski@intel.com>
  Edward Pickup <edward.pickup@arm.com>
  Jose Marinho <jose.marinho@arm.com>
  Konstantin Aladyshev <aladyshev22@gmail.com>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Maciej Czajkowski <maciej.czajkowski@intel.com>
  Ray Ni <ray.ni@intel.com>
  Sami Mujawar <sami.mujawar@arm.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
 build-i386-libvirt                                           fail    
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


Not pushing.

(No revision log; it would be 492 lines long.)


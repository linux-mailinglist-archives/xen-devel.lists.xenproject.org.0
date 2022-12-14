Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842D464CF47
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 19:21:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462518.720675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5WN9-0008Mu-J6; Wed, 14 Dec 2022 18:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462518.720675; Wed, 14 Dec 2022 18:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5WN9-0008KS-GM; Wed, 14 Dec 2022 18:20:51 +0000
Received: by outflank-mailman (input) for mailman id 462518;
 Wed, 14 Dec 2022 18:20:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5WN8-0008KG-Eu; Wed, 14 Dec 2022 18:20:50 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5WN8-0000bH-Cp; Wed, 14 Dec 2022 18:20:50 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1p5WN7-0005oN-Mg; Wed, 14 Dec 2022 18:20:49 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1p5WN7-0004gW-MB; Wed, 14 Dec 2022 18:20:49 +0000
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
	bh=Z0NIHBSe+n6innDMUWMGJu+7vvp1G5ztE5qXcM2Nq3g=; b=xCFTu75/0NEQN8wwrWP/PHxlcz
	02pp8hMI/W5SUTPdzmympcF9qox/t26f/c94yyFivoM5/4jRRy2xPGZWkRcufXjRi1mujURTABSb7
	P0dIf08u1CWW6SAmj0kT3K6D3yPOZmayNjBFQtGtgr15mFQJhr4gsUXuf3XJKDZkMBro=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-175202-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 175202: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d103840cfb559c28831c2635b916d60118f671cc
X-Osstest-Versions-That:
    ovmf=804e8c656643642894a26a2ce3652ad4567b658f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 14 Dec 2022 18:20:49 +0000

flight 175202 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/175202/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d103840cfb559c28831c2635b916d60118f671cc
baseline version:
 ovmf                 804e8c656643642894a26a2ce3652ad4567b658f

Last test of basis   175187  2022-12-14 01:40:42 Z    0 days
Testing same since   175202  2022-12-14 13:42:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Ray Ni <ray.ni@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   804e8c6566..d103840cfb  d103840cfb559c28831c2635b916d60118f671cc -> xen-tested-master


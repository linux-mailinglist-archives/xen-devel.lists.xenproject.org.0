Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F2600C14
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 12:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424299.671616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okN5R-0007uR-HG; Mon, 17 Oct 2022 10:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424299.671616; Mon, 17 Oct 2022 10:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okN5R-0007sA-ER; Mon, 17 Oct 2022 10:11:09 +0000
Received: by outflank-mailman (input) for mailman id 424299;
 Mon, 17 Oct 2022 10:11:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1okN5P-0007s0-QT; Mon, 17 Oct 2022 10:11:07 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1okN5P-0004I2-Pd; Mon, 17 Oct 2022 10:11:07 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1okN5P-0002m4-8m; Mon, 17 Oct 2022 10:11:07 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1okN5P-0005Oe-8G; Mon, 17 Oct 2022 10:11:07 +0000
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
	bh=BggJXCiTOpRtLIRFNPZtOEevUIUDYTy4ndzj3ypfxP8=; b=jFWpN1HzFuvFAVzlC6mNUtaEQw
	LhAYhmRop7KHUsByrkACNwVMBDWc/Cl88LGhdg6f7vv630qoaOBMH5f17UAb4X3vdMkP5mggBtdbE
	OZxoj0uMm74ejg3kgV10JhvWqbiDEXlaCqIUigv3hr6B+wFlgu5cGFS6JWvr+HypJMyU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-173982-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 173982: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9d6915ca91519271a79bc6190a31f0af89e339b2
X-Osstest-Versions-That:
    ovmf=d618fe05bf93a8884619e9362bfc5636da55e347
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 17 Oct 2022 10:11:07 +0000

flight 173982 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/173982/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9d6915ca91519271a79bc6190a31f0af89e339b2
baseline version:
 ovmf                 d618fe05bf93a8884619e9362bfc5636da55e347

Last test of basis   173896  2022-10-16 04:41:26 Z    1 days
Testing same since   173982  2022-10-17 08:12:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Dun Tan <dun.tan@intel.com>
  Jason Lou <yun.lou@intel.com>
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Tan, Dun <dun.tan@intel.com>
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
   d618fe05bf..9d6915ca91  9d6915ca91519271a79bc6190a31f0af89e339b2 -> xen-tested-master


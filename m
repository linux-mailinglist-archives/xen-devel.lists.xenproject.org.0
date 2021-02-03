Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EB330D3F0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 08:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80814.148037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7CKR-0000DV-JK; Wed, 03 Feb 2021 07:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80814.148037; Wed, 03 Feb 2021 07:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7CKR-0000Cu-FX; Wed, 03 Feb 2021 07:11:55 +0000
Received: by outflank-mailman (input) for mailman id 80814;
 Wed, 03 Feb 2021 07:11:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7CKP-0000Cl-Sm; Wed, 03 Feb 2021 07:11:53 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7CKP-0001vG-Mg; Wed, 03 Feb 2021 07:11:53 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l7CKP-0006yI-AF; Wed, 03 Feb 2021 07:11:53 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l7CKP-0004xA-9n; Wed, 03 Feb 2021 07:11:53 +0000
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
	bh=IAq08xCMMCDdruQZnbLuyuuylENSLthrYw3XUxNGL7Q=; b=JktLP/2CU4tWDBN9sJw0TmJBRS
	2/R/R8WuotK9RzQjlTHoJ50c2Os9Cm6gOB1mf/v4fNvaIaMr63WbUFUufvo3bQn/+LQU+QwwiPotV
	oPvyytbIw85sAq6dDmOGdRcC/zgQjC8I3Rmrd1KLybp43wsYPPZuCbVLzlnVBwV+AKNQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-158959-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 158959: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3f90ac3ec03512e2374cd2968c047a7e856a8965
X-Osstest-Versions-That:
    ovmf=3b468095cd3dfcd1aa4ae63bc623f534bc2390d2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 03 Feb 2021 07:11:53 +0000

flight 158959 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/158959/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3f90ac3ec03512e2374cd2968c047a7e856a8965
baseline version:
 ovmf                 3b468095cd3dfcd1aa4ae63bc623f534bc2390d2

Last test of basis   158932  2021-02-02 03:10:23 Z    1 days
Testing same since   158959  2021-02-02 16:40:59 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aiden Park <aiden.park@intel.com>

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
   3b468095cd..3f90ac3ec0  3f90ac3ec03512e2374cd2968c047a7e856a8965 -> xen-tested-master


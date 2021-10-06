Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CBB4237BD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 07:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202614.357595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXzwX-0000mZ-DU; Wed, 06 Oct 2021 05:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202614.357595; Wed, 06 Oct 2021 05:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXzwX-0000kJ-AH; Wed, 06 Oct 2021 05:58:17 +0000
Received: by outflank-mailman (input) for mailman id 202614;
 Wed, 06 Oct 2021 05:58:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXzwW-0000k9-2u; Wed, 06 Oct 2021 05:58:16 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXzwV-0004DM-Si; Wed, 06 Oct 2021 05:58:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mXzwV-00038v-Ka; Wed, 06 Oct 2021 05:58:15 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mXzwV-0005h6-Hk; Wed, 06 Oct 2021 05:58:15 +0000
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
	bh=wKvA4hR6srM0IUEaOa4YeSIJ0VfBViBW9+L/yM+KpTw=; b=BUQXN3qJtdiDATc2Hbx5BDoLVe
	NaiJkajJtxfT30/GK5B5vj8iyLmdDC2ygljkM8w5ZhUsRVPi0Qh29eVXyJHlVgFrWmH6BYulnjaYj
	Z4rOrv2bjwLRC4HC8tkgtfaray7C5UJqA1WOc1C6IPxlg2YeVMsT1u5Td9g4ci/jTGXY=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-165382-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 165382: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=942c9bd357d87cc6eed7c8250c213eff218d674e
X-Osstest-Versions-That:
    ovmf=c49cb8f30e6223dc6b55903af178afa1dfde857f
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 06 Oct 2021 05:58:15 +0000

flight 165382 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/165382/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 942c9bd357d87cc6eed7c8250c213eff218d674e
baseline version:
 ovmf                 c49cb8f30e6223dc6b55903af178afa1dfde857f

Last test of basis   165377  2021-10-05 09:40:15 Z    0 days
Testing same since   165382  2021-10-05 18:11:18 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chris Jones <christopher.jones@arm.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Jiewen Yao <Jiewen.yao@intel.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>

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
   c49cb8f30e..942c9bd357  942c9bd357d87cc6eed7c8250c213eff218d674e -> xen-tested-master


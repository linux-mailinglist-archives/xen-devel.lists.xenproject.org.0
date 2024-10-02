Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DACB98CC34
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 06:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808578.1220499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svrFE-0008Gn-7a; Wed, 02 Oct 2024 04:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808578.1220499; Wed, 02 Oct 2024 04:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svrFE-0008Eh-4z; Wed, 02 Oct 2024 04:45:48 +0000
Received: by outflank-mailman (input) for mailman id 808578;
 Wed, 02 Oct 2024 04:45:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1svrFC-0008EU-8d; Wed, 02 Oct 2024 04:45:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1svrFB-0005Uv-UL; Wed, 02 Oct 2024 04:45:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1svrFB-0006H2-LJ; Wed, 02 Oct 2024 04:45:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1svrFB-0007BY-Kn; Wed, 02 Oct 2024 04:45:45 +0000
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
	bh=QC3TpEyXrjKHCblfSmL21UKbHD9JZcKnJFlo9OFUewE=; b=a7eFVU43aKu6cSHmSBEB8HsCee
	FECrhGxON+Q2/oC9Pau19sxP1iItSWBmhUQD5tpLqdtqke1DLQHTaIPgUy6DIskFlCky3v7AI68gY
	ZWVgIAF/Q+bWNX5BTF25WzXSLIVi/TfBVBEjn4zk8zAPTkcgH1Exm6wS5+c4spi2aQto=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187931-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187931: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=3297be20bb8f575feb79ef782bd1c41eeb2feced
X-Osstest-Versions-That:
    ovmf=4f4673846fc9d6fc1c10a6c025da4739d872a6a0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 02 Oct 2024 04:45:45 +0000

flight 187931 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187931/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 3297be20bb8f575feb79ef782bd1c41eeb2feced
baseline version:
 ovmf                 4f4673846fc9d6fc1c10a6c025da4739d872a6a0

Last test of basis   187914  2024-10-01 01:43:57 Z    1 days
Testing same since   187931  2024-10-02 03:13:38 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Leif Lindholm <quic_llindhol@quicinc.com>

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
   4f4673846f..3297be20bb  3297be20bb8f575feb79ef782bd1c41eeb2feced -> xen-tested-master


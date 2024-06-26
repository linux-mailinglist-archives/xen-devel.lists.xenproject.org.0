Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C48A917954
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 09:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748393.1156094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMMki-0007fW-7P; Wed, 26 Jun 2024 07:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748393.1156094; Wed, 26 Jun 2024 07:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMMki-0007e2-3b; Wed, 26 Jun 2024 07:07:36 +0000
Received: by outflank-mailman (input) for mailman id 748393;
 Wed, 26 Jun 2024 07:07:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMMkh-0007dZ-B6; Wed, 26 Jun 2024 07:07:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMMkh-0008St-4S; Wed, 26 Jun 2024 07:07:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sMMkg-0005Et-RP; Wed, 26 Jun 2024 07:07:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sMMkg-0008NI-Qx; Wed, 26 Jun 2024 07:07:34 +0000
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
	bh=4ujRkh01oVSHrsOP/IFvaETM+7eoew4/dTipxM6M5ig=; b=SLQX7KsM5xUzzdhPK1w/+UGJjb
	Tie1JkwM1+Rfp6MCfV2kqE81Ag4/jBUm/RRimGrNUYz50VsbRqrmg1mpFoPDkaNyrpuu+0jm6rjq/
	GFYwYHLkjD3mohILk6+j/o40SQUN/QcBrcp8Gl8OwAstkwm6t/CvTrOZuBDmQgmA/fXU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186509-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186509: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e21bfae345f9eee1c3f585013ca50ad6ab4f86a1
X-Osstest-Versions-That:
    ovmf=0333faf50e49d3b3ea2c624b4d403b405b3107a1
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 26 Jun 2024 07:07:34 +0000

flight 186509 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186509/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e21bfae345f9eee1c3f585013ca50ad6ab4f86a1
baseline version:
 ovmf                 0333faf50e49d3b3ea2c624b4d403b405b3107a1

Last test of basis   186505  2024-06-26 02:03:04 Z    0 days
Testing same since   186509  2024-06-26 04:41:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Wenxing Hou <wenxing.hou@intel.com>

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
   0333faf50e..e21bfae345  e21bfae345f9eee1c3f585013ca50ad6ab4f86a1 -> xen-tested-master


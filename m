Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95C44066B8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 07:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184017.332513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZ37-0006dY-D4; Fri, 10 Sep 2021 05:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184017.332513; Fri, 10 Sep 2021 05:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZ37-0006b6-9g; Fri, 10 Sep 2021 05:26:05 +0000
Received: by outflank-mailman (input) for mailman id 184017;
 Fri, 10 Sep 2021 05:26:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mOZ34-0006aw-TY; Fri, 10 Sep 2021 05:26:02 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mOZ34-0006jI-HB; Fri, 10 Sep 2021 05:26:02 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mOZ34-0006rx-3I; Fri, 10 Sep 2021 05:26:02 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mOZ34-0006PD-2q; Fri, 10 Sep 2021 05:26:02 +0000
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
	bh=DNtD9QnBpbTHuWk8p6RmDAF2foR0BtxKJq368sAbQYQ=; b=URqvsxfwJsxZQbsGvki2taf9Cm
	r2m4Hi+zLA8+S8MRSZoY3L509+jYBTKU+mjcaZbSSEAIPYa4rSO04vCijR8LK9kNw+SqUtC2Di/u0
	OmZJngyie/8LwE3XoaS2/eBYZ/eyEtfSK2r+NpchsfS8xkduVUjw1r5WWcgKMFsvTjzg=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-164913-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 164913: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=d248516b3a190c5cb5d51164b5721ead9d24469a
X-Osstest-Versions-That:
    ovmf=a7cf2c5664b9605162b20ab6b51c7bdcab3e14f0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Sep 2021 05:26:02 +0000

flight 164913 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/164913/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 d248516b3a190c5cb5d51164b5721ead9d24469a
baseline version:
 ovmf                 a7cf2c5664b9605162b20ab6b51c7bdcab3e14f0

Last test of basis   164869  2021-09-07 04:11:11 Z    3 days
Testing same since   164913  2021-09-09 13:11:28 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Sravanthi <k.kavyax.sravanthi@intel.com>

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
   a7cf2c5664..d248516b3a  d248516b3a190c5cb5d51164b5721ead9d24469a -> xen-tested-master


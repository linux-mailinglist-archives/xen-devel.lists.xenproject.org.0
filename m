Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BEC288306
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 08:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4698.12431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQmHV-0000oF-ET; Fri, 09 Oct 2020 06:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4698.12431; Fri, 09 Oct 2020 06:53:33 +0000
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
	id 1kQmHV-0000nq-B9; Fri, 09 Oct 2020 06:53:33 +0000
Received: by outflank-mailman (input) for mailman id 4698;
 Fri, 09 Oct 2020 06:53:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNj9=DQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kQmHT-0000nl-MG
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 06:53:31 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 805574ae-a9ef-47b2-9a4d-9e4bd3ef26b3;
 Fri, 09 Oct 2020 06:53:30 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQmHR-00046q-UW; Fri, 09 Oct 2020 06:53:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kQmHR-00040C-Nx; Fri, 09 Oct 2020 06:53:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kQmHR-0001TO-NW; Fri, 09 Oct 2020 06:53:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VNj9=DQ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kQmHT-0000nl-MG
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 06:53:31 +0000
X-Inumbo-ID: 805574ae-a9ef-47b2-9a4d-9e4bd3ef26b3
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 805574ae-a9ef-47b2-9a4d-9e4bd3ef26b3;
	Fri, 09 Oct 2020 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=H6BHX48+Knvhj5mJ+i/RLJtofuxMAP+YxfljBhXCigM=; b=2Vc7bcyP9WkVfrc97xyVzbFoo1
	rT4BUEQIcilFwQmLySEVjFpEwtm7ZoLIRH7afKFFZdj4P7sjPCBnrnsi4q+VAdjPEOkjWP2GzI+k1
	hW9gslvRKkYgl/spchJmOXr6wVWqqYw9f7XYjHf4viKBuVaZaLdJc6nG6x9ahxa9jDTo=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQmHR-00046q-UW; Fri, 09 Oct 2020 06:53:29 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQmHR-00040C-Nx; Fri, 09 Oct 2020 06:53:29 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kQmHR-0001TO-NW; Fri, 09 Oct 2020 06:53:29 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155548-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155548: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=69e95b9efed520e643b9e5b0573180aa7c5ecaca
X-Osstest-Versions-That:
    ovmf=c640186ec8aae6164123ee38de6409aed69eab12
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Oct 2020 06:53:29 +0000

flight 155548 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155548/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 69e95b9efed520e643b9e5b0573180aa7c5ecaca
baseline version:
 ovmf                 c640186ec8aae6164123ee38de6409aed69eab12

Last test of basis   155512  2020-10-07 04:39:54 Z    2 days
Testing same since   155548  2020-10-08 13:39:54 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Abner Chang <abner.chang@hpe.com>
  Chang Abner <abner.chang@hpe.com>
  Fu Siyuan <siyuan.fu@intel.com>
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Wang Fan <fan.wang@intel.com>
  Wu Jiaxin <jiaxin.wu@intel.com>

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
   c640186ec8..69e95b9efe  69e95b9efed520e643b9e5b0573180aa7c5ecaca -> xen-tested-master


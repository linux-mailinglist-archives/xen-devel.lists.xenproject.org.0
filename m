Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAAC33EB95
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 09:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98578.187067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMRd1-000379-S8; Wed, 17 Mar 2021 08:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98578.187067; Wed, 17 Mar 2021 08:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMRd1-00036l-OV; Wed, 17 Mar 2021 08:34:07 +0000
Received: by outflank-mailman (input) for mailman id 98578;
 Wed, 17 Mar 2021 08:34:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMRd0-00036d-J0; Wed, 17 Mar 2021 08:34:06 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMRd0-0001sM-D8; Wed, 17 Mar 2021 08:34:06 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lMRd0-00086I-3v; Wed, 17 Mar 2021 08:34:06 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lMRd0-0004vb-3R; Wed, 17 Mar 2021 08:34:06 +0000
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
	bh=QaIbv1ER/P94OYH7MiV+WmhlXnELwJ785Y9V9o6oNws=; b=rSPmCPO0Nq56jkD17GvfKA3apY
	mqeqb2dJBkg3DVOrlfDcrskfwFX4afjumiwyl8qbwp7l+NuozfpVGHbl52aGLTkWb+2Lgb7KIuxpa
	5h3XTY2xCqw0R5D3ObMiorFdWRoD9HV5oqO/o+X1+PKxEMAZqjpzRd+1TUGatj49Llcw=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-160106-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 160106: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2e51b27fed31eb7b2a2cb4245806c8c7859207f7
X-Osstest-Versions-That:
    ovmf=66a31de7eeed62a7aa68fe0613a597a8bf08bc16
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 17 Mar 2021 08:34:06 +0000

flight 160106 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/160106/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2e51b27fed31eb7b2a2cb4245806c8c7859207f7
baseline version:
 ovmf                 66a31de7eeed62a7aa68fe0613a597a8bf08bc16

Last test of basis   160103  2021-03-16 21:09:41 Z    0 days
Testing same since   160106  2021-03-17 04:11:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chandramohan Akula <chandramohan.akula@broadcom.com>

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
   66a31de7ee..2e51b27fed  2e51b27fed31eb7b2a2cb4245806c8c7859207f7 -> xen-tested-master


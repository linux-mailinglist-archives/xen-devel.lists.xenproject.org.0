Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890F16F7D75
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 09:06:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530247.825756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pupWW-0003hW-6A; Fri, 05 May 2023 07:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530247.825756; Fri, 05 May 2023 07:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pupWW-0003fH-30; Fri, 05 May 2023 07:06:36 +0000
Received: by outflank-mailman (input) for mailman id 530247;
 Fri, 05 May 2023 07:06:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pupWU-0003f3-U7; Fri, 05 May 2023 07:06:34 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pupWU-00024s-M1; Fri, 05 May 2023 07:06:34 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pupWU-00037F-CX; Fri, 05 May 2023 07:06:34 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pupWU-0006KC-C0; Fri, 05 May 2023 07:06:34 +0000
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
	bh=rFn4o8+zAAi6yzkB/TxryAda6Zjq1jCidQ/Gt0GSWZY=; b=bsKTxqphoR0YGckec+61IQpjc/
	GQbEj2ihjQv1f/JU+G+h79GKPeimuG6GsHj1VJIPFw+wdeeXbvXgWGHVggnhsQe8ROE7eJ7jRT9gN
	0oT+LFsbU6TdrjWOSBl2YBZs7xhvSzz6FqQ7oZPokIQY4Q/6z03HoiYMoE0m4Ro66zuM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-180538-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 180538: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ff7cb2d7c98f8b832180e054848459fc24a0910a
X-Osstest-Versions-That:
    ovmf=d992a05ade3d1bebc6e7a81aaf700286e0e217c8
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 05 May 2023 07:06:34 +0000

flight 180538 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/180538/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ff7cb2d7c98f8b832180e054848459fc24a0910a
baseline version:
 ovmf                 d992a05ade3d1bebc6e7a81aaf700286e0e217c8

Last test of basis   180535  2023-05-04 19:12:15 Z    0 days
Testing same since   180538  2023-05-05 04:12:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Benny Lin <benny.lin@intel.com>
  Pedro Falcato <pedro.falcato@gmail.com>

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
   d992a05ade..ff7cb2d7c9  ff7cb2d7c98f8b832180e054848459fc24a0910a -> xen-tested-master


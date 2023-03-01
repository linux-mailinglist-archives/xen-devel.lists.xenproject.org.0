Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A16A7267
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 18:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504200.776777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXQfd-0001Io-3t; Wed, 01 Mar 2023 17:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504200.776777; Wed, 01 Mar 2023 17:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXQfd-0001Gl-0p; Wed, 01 Mar 2023 17:55:17 +0000
Received: by outflank-mailman (input) for mailman id 504200;
 Wed, 01 Mar 2023 17:55:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pXQfb-0001Gb-25; Wed, 01 Mar 2023 17:55:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pXQfb-00061x-1G; Wed, 01 Mar 2023 17:55:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pXQfa-0001rw-Pz; Wed, 01 Mar 2023 17:55:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pXQfa-00021W-PT; Wed, 01 Mar 2023 17:55:14 +0000
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
	bh=+QF09Olj3OHB6VEtLHZn7VMUy/kRmivcm+58qTTgUPA=; b=4y8XM89mZ+6JrowkcVfjqksqjN
	iyORWiu/P7dtKhvNH9plji9YXDn1OnLHn2jR0y3Q0MmJe0QUtDhVYYJpeMO2kAR07L7kbEZM2vUpE
	9wCryF+QJcc9mmVV7cp3NYRmkKrr8oPOKFYv5HEdrQAVVTg577LxVcuw8Jw9rh3wHrW0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-178885-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 178885: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f80f052277c88a67c55e107b550f504eeea947d3
X-Osstest-Versions-That:
    ovmf=1eeca0750af5af2f0e78437bf791ac2de74bde74
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 01 Mar 2023 17:55:14 +0000

flight 178885 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/178885/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f80f052277c88a67c55e107b550f504eeea947d3
baseline version:
 ovmf                 1eeca0750af5af2f0e78437bf791ac2de74bde74

Last test of basis   178254  2023-02-23 15:11:10 Z    6 days
Testing same since   178885  2023-03-01 15:12:19 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrei Warkentin <andrei.warkentin@intel.com>
  Sunil V L <sunilvl@ventanamicro.com>

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
   1eeca0750a..f80f052277  f80f052277c88a67c55e107b550f504eeea947d3 -> xen-tested-master


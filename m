Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DC9633D1
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 23:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785152.1194558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQC4-0008Th-71; Wed, 28 Aug 2024 21:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785152.1194558; Wed, 28 Aug 2024 21:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQC4-0008Qq-3g; Wed, 28 Aug 2024 21:27:08 +0000
Received: by outflank-mailman (input) for mailman id 785152;
 Wed, 28 Aug 2024 21:27:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjQC1-0008Qg-Rx; Wed, 28 Aug 2024 21:27:05 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjQC1-000338-BD; Wed, 28 Aug 2024 21:27:05 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sjQC0-000485-Ri; Wed, 28 Aug 2024 21:27:04 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sjQC0-0003Qc-R3; Wed, 28 Aug 2024 21:27:04 +0000
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
	bh=hrNJiNQSxlMnTrA9O0wFNIBL/2ogkx3l4L2PYWWCf0M=; b=mQ3Aioz/p3tnwt8+Y87nn4RPS/
	41Nw+iLyale5Jl2fnK5wqVeGcrg3MqcfaRBx98jgwgUUmhM53LAs21z31n8GSwvl5aiQFWobi8Hsx
	OXIpz+Enxgzbydtl33tAz6XtfXWOqE/pPIf9eMljrWhqWr/Pm0Hf7Q0zgHpyWCo/Zz+Y=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187387-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187387: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=319835abb8517fde84bff31740fb1e61b33a3ae8
X-Osstest-Versions-That:
    ovmf=84e7b74c8c643c59ee32d4da769f48a3c8c277a4
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 28 Aug 2024 21:27:04 +0000

flight 187387 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187387/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 319835abb8517fde84bff31740fb1e61b33a3ae8
baseline version:
 ovmf                 84e7b74c8c643c59ee32d4da769f48a3c8c277a4

Last test of basis   187384  2024-08-28 16:41:33 Z    0 days
Testing same since   187387  2024-08-28 19:11:27 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ray Ni <ray.ni@intel.com>

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
   84e7b74c8c..319835abb8  319835abb8517fde84bff31740fb1e61b33a3ae8 -> xen-tested-master


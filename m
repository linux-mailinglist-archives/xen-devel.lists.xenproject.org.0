Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDD0942327
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 00:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768107.1178854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYvjm-0006lL-Op; Tue, 30 Jul 2024 22:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768107.1178854; Tue, 30 Jul 2024 22:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYvjm-0006jg-Lj; Tue, 30 Jul 2024 22:54:34 +0000
Received: by outflank-mailman (input) for mailman id 768107;
 Tue, 30 Jul 2024 22:54:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYvjl-0006jW-Le; Tue, 30 Jul 2024 22:54:33 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYvjl-00006e-8I; Tue, 30 Jul 2024 22:54:33 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sYvjk-0007ne-V9; Tue, 30 Jul 2024 22:54:33 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sYvjk-00015N-Ud; Tue, 30 Jul 2024 22:54:32 +0000
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
	bh=EPcK4VCO+NsIBVAU/bO4P5Fgx9aVgJg5H/JUJGfbZy8=; b=FWD5LlEq7GjhSiPg5ErGvWERgr
	zvI1JYl/oHzHfkFxBaZho9HLlX5UKY0SO/QcWgNtCqTufGOFpJ8IXqQDUcuKoalgKqyZVMe8S21uM
	8voXTUzPXn6WlGE2S5H09PMd4krgwt0ZcTGQSh6T4AdMDtDCKNE5XxoYVrxHrUakOE60=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-187066-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 187066: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=f8f34edd9db82882fd70f14cb97ab28e9bb0b9a3
X-Osstest-Versions-That:
    ovmf=5b08df03f8193261e4837ed4e91ff81fa7d17e4d
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 30 Jul 2024 22:54:32 +0000

flight 187066 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/187066/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 f8f34edd9db82882fd70f14cb97ab28e9bb0b9a3
baseline version:
 ovmf                 5b08df03f8193261e4837ed4e91ff81fa7d17e4d

Last test of basis   187058  2024-07-30 14:13:07 Z    0 days
Testing same since   187066  2024-07-30 21:13:14 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason1 Lin <jason1.lin@intel.com>

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
   5b08df03f8..f8f34edd9d  f8f34edd9db82882fd70f14cb97ab28e9bb0b9a3 -> xen-tested-master


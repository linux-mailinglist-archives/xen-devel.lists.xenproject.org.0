Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C30580900
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 03:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374908.607107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG9M5-0005eF-Na; Tue, 26 Jul 2022 01:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374908.607107; Tue, 26 Jul 2022 01:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG9M5-0005aq-KO; Tue, 26 Jul 2022 01:27:25 +0000
Received: by outflank-mailman (input) for mailman id 374908;
 Tue, 26 Jul 2022 01:27:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oG9M4-0005ag-BV; Tue, 26 Jul 2022 01:27:24 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oG9M4-0006Ve-9d; Tue, 26 Jul 2022 01:27:24 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1oG9M3-0006JQ-Q1; Tue, 26 Jul 2022 01:27:23 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1oG9M3-0000qR-PZ; Tue, 26 Jul 2022 01:27:23 +0000
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
	bh=y5CH2wKBf9bItHneELWC3wZbeyTKoMs2mC5d/YfqU/8=; b=dHZKR6CB5uDyELxAEW7UmHX+7O
	HXoF6uO+qzZ+KhoDFBLc3fwUVFDtJsPjReoNGQGdLxco7vqtn342LBghnecJOA0/ANb1WS3cnM4uf
	ClKIOdw2jQzMBsq5rR14grETDJurTOY9J4lExwPJaEnPkCowY9PbUrS6+PFOU5wKSROk=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171858-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171858: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7f1c89f16790fc2fa8bc88330dc896941b9b40bb
X-Osstest-Versions-That:
    ovmf=a47241f1337c2ce78179b7db939faebd7828d8d0
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 26 Jul 2022 01:27:23 +0000

flight 171858 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171858/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7f1c89f16790fc2fa8bc88330dc896941b9b40bb
baseline version:
 ovmf                 a47241f1337c2ce78179b7db939faebd7828d8d0

Last test of basis   171855  2022-07-25 16:40:24 Z    0 days
Testing same since   171858  2022-07-25 23:40:21 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Anthony PERARD <anthony.perard@citrix.com>
  Gary Lin <gary.lin@hpe.com>
  Michael D Kinney <michael.d.kinney@intel.com>

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
   a47241f133..7f1c89f167  7f1c89f16790fc2fa8bc88330dc896941b9b40bb -> xen-tested-master


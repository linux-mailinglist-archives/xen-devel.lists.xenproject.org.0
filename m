Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B83281E62
	for <lists+xen-devel@lfdr.de>; Sat,  3 Oct 2020 00:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2363.7015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOTbC-0003W2-3u; Fri, 02 Oct 2020 22:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2363.7015; Fri, 02 Oct 2020 22:32:22 +0000
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
	id 1kOTbC-0003Vg-0s; Fri, 02 Oct 2020 22:32:22 +0000
Received: by outflank-mailman (input) for mailman id 2363;
 Fri, 02 Oct 2020 22:32:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6tcj=DJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kOTbA-0003Vb-Rk
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 22:32:20 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1902266-7472-4262-abd2-4c5402e36ffe;
 Fri, 02 Oct 2020 22:32:19 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOTb9-0003Nz-4R; Fri, 02 Oct 2020 22:32:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kOTb8-000543-Tp; Fri, 02 Oct 2020 22:32:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kOTb8-0000ab-TJ; Fri, 02 Oct 2020 22:32:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6tcj=DJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kOTbA-0003Vb-Rk
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 22:32:20 +0000
X-Inumbo-ID: f1902266-7472-4262-abd2-4c5402e36ffe
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f1902266-7472-4262-abd2-4c5402e36ffe;
	Fri, 02 Oct 2020 22:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=m9W0ZiwOauoI0jGKbDALJn5xIhFJ2m4CAVmbqd+/fMk=; b=UIO9pIZE6LhWyypBX7u+qLVYHn
	ElBkcONs6VYZMobNXbDKgBXJtqWUEsUxc+UYUT4UdjJcIq2Qk4tA+CqBfoNXumGYZ/AdCB3TzQLDo
	XLewomjvNBlOWPtX+KOnUso3myaOur1iGZ23URiit9luKwXj3v2fpxGZyVt3Au6fYKQU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOTb9-0003Nz-4R; Fri, 02 Oct 2020 22:32:19 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOTb8-000543-Tp; Fri, 02 Oct 2020 22:32:18 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kOTb8-0000ab-TJ; Fri, 02 Oct 2020 22:32:18 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155223-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 155223: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=2d8ca4f90eaeb61bd7e9903b56bf412f0d187137
X-Osstest-Versions-That:
    ovmf=d8ab884fe9b4dd148980bf0d8673187f8fb25887
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 02 Oct 2020 22:32:18 +0000

flight 155223 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155223/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 2d8ca4f90eaeb61bd7e9903b56bf412f0d187137
baseline version:
 ovmf                 d8ab884fe9b4dd148980bf0d8673187f8fb25887

Last test of basis   155121  2020-09-30 03:52:34 Z    2 days
Testing same since   155223  2020-10-01 11:40:36 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Laszlo Ersek <lersek@redhat.com>
  Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>

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
   d8ab884fe9..2d8ca4f90e  2d8ca4f90eaeb61bd7e9903b56bf412f0d187137 -> xen-tested-master


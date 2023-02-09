Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38054691438
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 00:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493017.762823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQG2m-0007OP-PP; Thu, 09 Feb 2023 23:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493017.762823; Thu, 09 Feb 2023 23:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQG2m-0007LO-MS; Thu, 09 Feb 2023 23:09:32 +0000
Received: by outflank-mailman (input) for mailman id 493017;
 Thu, 09 Feb 2023 23:09:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQG2l-0007LE-Bh; Thu, 09 Feb 2023 23:09:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQG2l-0003A9-4M; Thu, 09 Feb 2023 23:09:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pQG2k-00017b-UL; Thu, 09 Feb 2023 23:09:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pQG2k-0000oy-Tq; Thu, 09 Feb 2023 23:09:30 +0000
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
	bh=wxpzGGWvqvBKb0MP8w/Hzf+LMRCDJSFFdyu1weBksOU=; b=jE1KoU0xHN1puYsJKAzWDt2eGa
	QA33puNbWwBo593H0sCqAmAtPkB9hrcVJC0K4vNadoL5Pi7Cko263cuHStXfFzGl6pY5qRg1FbkBH
	aD1Hl6SZqZObJ7zTpj4ZrQX1BnTti/79S3ucL0DTONSieIBsL+YqpZLPFYNGiD3SusUg=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176764-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176764: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=289d93b79c18f42b9dd09770a22d15a11fd40670
X-Osstest-Versions-That:
    ovmf=f6ce1a5cd8932844ec24701d158254ccf75b6159
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Feb 2023 23:09:30 +0000

flight 176764 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176764/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 289d93b79c18f42b9dd09770a22d15a11fd40670
baseline version:
 ovmf                 f6ce1a5cd8932844ec24701d158254ccf75b6159

Last test of basis   176694  2023-02-09 02:10:40 Z    0 days
Testing same since   176764  2023-02-09 17:42:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gerd Hoffmann <kraxel@redhat.com>
  Girish Mahadevan <gmahadevan@nvidia.com>
  Rebecca Cran <quic_rcran@quicinc.com>
  Rebecca Cran <rebecca@quicinc.com>

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
   f6ce1a5cd8..289d93b79c  289d93b79c18f42b9dd09770a22d15a11fd40670 -> xen-tested-master


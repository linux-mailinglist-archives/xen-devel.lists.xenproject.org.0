Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D168AAD3
	for <lists+xen-devel@lfdr.de>; Sat,  4 Feb 2023 16:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489546.757882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOK83-0006Es-P8; Sat, 04 Feb 2023 15:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489546.757882; Sat, 04 Feb 2023 15:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOK83-0006BV-Lu; Sat, 04 Feb 2023 15:06:59 +0000
Received: by outflank-mailman (input) for mailman id 489546;
 Sat, 04 Feb 2023 15:06:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOK82-0006BJ-I6; Sat, 04 Feb 2023 15:06:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOK82-0008LV-Fc; Sat, 04 Feb 2023 15:06:58 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pOK81-0000L9-VX; Sat, 04 Feb 2023 15:06:58 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pOK81-0004dj-Uv; Sat, 04 Feb 2023 15:06:57 +0000
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
	bh=BAJLxPy72boX9/NIshrdLBu8m9AJJUluNxsIBvcOz5k=; b=oxtNxkjbeBHai+joe7KZeIMliL
	EAeqfLioQrD25ZXy9y00gyh1PhLOiGOU4M4aTN78KnMxbyYGG7uK0tqWNdfNStT9bMF4gNpiXubaR
	SnFOXsYDlMktqU99mI0MqCleTZeliQR1CdYS9RU3lNS0aZiD6ZjQRogXgLPSTPfgTYcw=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-176363-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 176363: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=7c138e400862a3a742489ca6f21d31afa9a3dd8a
X-Osstest-Versions-That:
    ovmf=4d37059d8e1eeda124270a158416795605327cbd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 04 Feb 2023 15:06:57 +0000

flight 176363 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/176363/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 7c138e400862a3a742489ca6f21d31afa9a3dd8a
baseline version:
 ovmf                 4d37059d8e1eeda124270a158416795605327cbd

Last test of basis   176359  2023-02-04 04:40:49 Z    0 days
Testing same since   176363  2023-02-04 11:26:05 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>

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
   4d37059d8e..7c138e4008  7c138e400862a3a742489ca6f21d31afa9a3dd8a -> xen-tested-master


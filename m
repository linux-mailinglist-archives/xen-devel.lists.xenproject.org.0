Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBD071F301
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 21:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542717.846899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4o2r-00061L-GD; Thu, 01 Jun 2023 19:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542717.846899; Thu, 01 Jun 2023 19:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4o2r-0005yh-Cv; Thu, 01 Jun 2023 19:33:13 +0000
Received: by outflank-mailman (input) for mailman id 542717;
 Thu, 01 Jun 2023 19:33:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4o2q-0005yU-77; Thu, 01 Jun 2023 19:33:12 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4o2q-0002Fv-5P; Thu, 01 Jun 2023 19:33:12 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1q4o2p-0000hA-Rp; Thu, 01 Jun 2023 19:33:11 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1q4o2p-0004uM-RI; Thu, 01 Jun 2023 19:33:11 +0000
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
	bh=tfG1Y8xtFq2lhOB5OnnY4JOJeNqKG0PH/PG5NDxcRF4=; b=ANyUVS0bAAR9fIdDvgRKQvAon4
	96rQItUd4Yd740qJhtoyZCHySZJX5bpF5DeJtjGZLkUvDmatF2ZqNKykBmKjXoYqfKcOwf/zOwgRy
	ycOBLxMqdk56aOFd+DLGn9VjSyw7PDOBSlZJekov8mZ8V2V+uoCTDmMI7rvZeZad09J4=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-181087-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 181087: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=ded1d5414b5a0161de8fcf234b7fb200fb59fb2c
X-Osstest-Versions-That:
    ovmf=15f83fa36442eaa272300b31699b3b82ce7e07a9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 01 Jun 2023 19:33:11 +0000

flight 181087 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/181087/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 ded1d5414b5a0161de8fcf234b7fb200fb59fb2c
baseline version:
 ovmf                 15f83fa36442eaa272300b31699b3b82ce7e07a9

Last test of basis   181081  2023-06-01 13:15:20 Z    0 days
Testing same since   181087  2023-06-01 17:10:49 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Neil Jones <neil.jones@blaize.com>
  Sami Mujawar <sami.mujawar@arm.com>

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
   15f83fa364..ded1d5414b  ded1d5414b5a0161de8fcf234b7fb200fb59fb2c -> xen-tested-master


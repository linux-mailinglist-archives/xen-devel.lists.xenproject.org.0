Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B1247EEE2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 13:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251362.432656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0k4q-0006Vt-FX; Fri, 24 Dec 2021 12:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251362.432656; Fri, 24 Dec 2021 12:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0k4q-0006Tr-BP; Fri, 24 Dec 2021 12:53:40 +0000
Received: by outflank-mailman (input) for mailman id 251362;
 Fri, 24 Dec 2021 12:53:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n0k4p-0006Th-GD; Fri, 24 Dec 2021 12:53:39 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n0k4p-0001z5-Cu; Fri, 24 Dec 2021 12:53:39 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1n0k4p-0001Vq-2I; Fri, 24 Dec 2021 12:53:39 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1n0k4p-0002NM-1n; Fri, 24 Dec 2021 12:53:39 +0000
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
	bh=nKpEthBWE6Tl9jhkqlBjnnyFl7ikcWrfeU6mbceixrs=; b=rpVeaNzI+j1LOyj6uVRmBKaEyM
	sBRy42khGjBle3uCMuRSv4IB3041H+I0VwUM5OYYafKWzQ+Qyi3K1vfJ2t+lV9VP15cy1QLgHsbYl
	sJX0kw/AOBoQ34YYytYNVl6pMxlWw418sBc6v08oGpPt/Ly7rOnolUflcUg3WptOied0=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167535-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167535: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=6612ff85611bc2be16dc0fd5de0e1413df88941a
X-Osstest-Versions-That:
    ovmf=15c596aeebc24bb97deb78d98bd8517a8b9ac243
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 Dec 2021 12:53:39 +0000

flight 167535 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167535/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 6612ff85611bc2be16dc0fd5de0e1413df88941a
baseline version:
 ovmf                 15c596aeebc24bb97deb78d98bd8517a8b9ac243

Last test of basis   167527  2021-12-23 08:11:36 Z    1 days
Testing same since   167535  2021-12-24 09:12:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Longlong Yang <longlong.yang@intel.com>
  Yang, Longlong <longlong.yang@intel.com>

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
   15c596aeeb..6612ff8561  6612ff85611bc2be16dc0fd5de0e1413df88941a -> xen-tested-master


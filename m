Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7C67E6C88
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 15:40:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629660.982017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r16CO-0001HV-Gj; Thu, 09 Nov 2023 14:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629660.982017; Thu, 09 Nov 2023 14:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r16CO-0001Eu-DT; Thu, 09 Nov 2023 14:40:00 +0000
Received: by outflank-mailman (input) for mailman id 629660;
 Thu, 09 Nov 2023 14:39:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r16CM-0001Ek-7p; Thu, 09 Nov 2023 14:39:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r16CL-0007Eg-Sb; Thu, 09 Nov 2023 14:39:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1r16CL-0002I2-JK; Thu, 09 Nov 2023 14:39:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1r16CL-0008F7-Iq; Thu, 09 Nov 2023 14:39:57 +0000
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
	bh=DZlN/NqArZQtOcjAU379846pEJjwIZUIzAa3jCMYWLo=; b=rYsV8HW9ovDesL1TFJju+MdCsE
	uGZwoXEwoTclGz2X/ZULMzYaGIv+oB//4OuCpwfiRfYd/M6cb8cT4FlREjiqeezH33TRePM+OgF3S
	vTJjD1Y5C8MTLIa4PskMYlnJgXf0f0X2kKd2/CCdwykxRvSbG809cYapVlPW4NmFTvtc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-183720-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 183720: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=616f0d503707c2e3fbdbc397ccb16a822f584b03
X-Osstest-Versions-That:
    ovmf=bb18fb80abb9d35d01be5d693086a9ed4b9d65b5
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 09 Nov 2023 14:39:57 +0000

flight 183720 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/183720/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 616f0d503707c2e3fbdbc397ccb16a822f584b03
baseline version:
 ovmf                 bb18fb80abb9d35d01be5d693086a9ed4b9d65b5

Last test of basis   183711  2023-11-08 03:11:06 Z    1 days
Testing same since   183720  2023-11-09 12:44:23 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Jason Hsu <jasonx.hsu@intel.com>
  JasonX.Hsu <jasonx.hsu@intel.com>

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
   bb18fb80ab..616f0d5037  616f0d503707c2e3fbdbc397ccb16a822f584b03 -> xen-tested-master


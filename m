Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAAD561534
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358316.587460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pf6-000313-Tk; Thu, 30 Jun 2022 08:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358316.587460; Thu, 30 Jun 2022 08:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pf6-0002yh-Pr; Thu, 30 Jun 2022 08:36:32 +0000
Received: by outflank-mailman (input) for mailman id 358316;
 Thu, 30 Jun 2022 08:36:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6pf5-0002yX-LD; Thu, 30 Jun 2022 08:36:31 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6pf5-0007sV-FC; Thu, 30 Jun 2022 08:36:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o6pf4-0006as-US; Thu, 30 Jun 2022 08:36:30 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o6pf4-0003GH-Tx; Thu, 30 Jun 2022 08:36:30 +0000
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
	bh=AS2SdKLlkNzUIknTI7V65MpprXSdZA0In9JCsmDF3Ik=; b=7IxoIm7ikn1IPBbbnMysw4zwGe
	Y3VoYezZ/2cz/9ZwKJYx7/2SK+9ci3UycK3tRF2DRc59YfoT0zkPN0LWsXNH3ugs7Xj1WG7Mer08A
	tL3cliAHwGnyZ79Tt+gZCaqT1KTLbpOvsa/guP0N4xudEeUhK8KOJjpdaaLWIwqIogsA=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171418-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171418: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=21e6ef752239c3c840bc31745e14b391bf9c4691
X-Osstest-Versions-That:
    ovmf=c13377153f74d66adc83702b4e4ca5e9eadde2fd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 Jun 2022 08:36:30 +0000

flight 171418 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171418/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 21e6ef752239c3c840bc31745e14b391bf9c4691
baseline version:
 ovmf                 c13377153f74d66adc83702b4e4ca5e9eadde2fd

Last test of basis   171395  2022-06-29 03:10:27 Z    1 days
Testing same since   171418  2022-06-30 04:14:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Gua Guo <gua.guo@intel.com>

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
   c13377153f..21e6ef7522  21e6ef752239c3c840bc31745e14b391bf9c4691 -> xen-tested-master


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE738D4AF6
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 13:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732685.1138725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCeBq-00037X-V8; Thu, 30 May 2024 11:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732685.1138725; Thu, 30 May 2024 11:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCeBq-00035D-RU; Thu, 30 May 2024 11:43:26 +0000
Received: by outflank-mailman (input) for mailman id 732685;
 Thu, 30 May 2024 11:43:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCeBp-000353-Nz; Thu, 30 May 2024 11:43:25 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCeBp-0006HM-LA; Thu, 30 May 2024 11:43:25 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sCeBp-0003ZS-DB; Thu, 30 May 2024 11:43:25 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sCeBp-0007TR-Cc; Thu, 30 May 2024 11:43:25 +0000
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
	bh=nbr3VhcRmHb3kXSxKpJ1MPsh/agb+c2sEcAAQFgA1aM=; b=FV5bL2iDyL1U3AboIg48crMaHS
	631m/CE7ExVAy2okdTHU6AzhU1Xl7QOCeiamQUIo9yLkdhJr83ZWwOktEgaoz2PO4cf4APF/7RpOt
	au+XiR84UEEOMuLW+0fqupCBmeH1Pp1a7rgqD3FwkCDsAZlX50HCuo8W/yJWUju8+zi8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186195-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186195: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=c695e3182aa7497833f1b0fc69f6776fec8cb8cf
X-Osstest-Versions-That:
    ovmf=cd4cebabf5834c403c9d9ac4f162e8336024bbcd
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 30 May 2024 11:43:25 +0000

flight 186195 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186195/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 c695e3182aa7497833f1b0fc69f6776fec8cb8cf
baseline version:
 ovmf                 cd4cebabf5834c403c9d9ac4f162e8336024bbcd

Last test of basis   186193  2024-05-30 07:11:07 Z    0 days
Testing same since   186195  2024-05-30 09:41:11 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Nickle Wang <nicklew@nvidia.com>

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
   cd4cebabf5..c695e3182a  c695e3182aa7497833f1b0fc69f6776fec8cb8cf -> xen-tested-master


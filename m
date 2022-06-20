Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB305510CF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 08:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352409.579167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BNQ-00008a-0O; Mon, 20 Jun 2022 06:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352409.579167; Mon, 20 Jun 2022 06:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BNP-00006U-Ta; Mon, 20 Jun 2022 06:59:11 +0000
Received: by outflank-mailman (input) for mailman id 352409;
 Mon, 20 Jun 2022 06:59:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o3BNO-00006K-1e; Mon, 20 Jun 2022 06:59:10 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o3BNN-0005Zf-Vi; Mon, 20 Jun 2022 06:59:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1o3BNN-0000pz-9d; Mon, 20 Jun 2022 06:59:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1o3BNN-0004WO-9C; Mon, 20 Jun 2022 06:59:09 +0000
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
	bh=/PVE0EPZULRRUH+uMuuJ9/kmXY0lcbWPQKC8EtYewaE=; b=5WygCbGZdaHC1a/3zqFD2EIqpz
	CWpQx+dBmW0Et9HoxZ4XGaSOod5+kYXPG9JtdQSkWUtP00F5W7uJQ25jVVpZyxsDWCT3NyOBrUrhf
	29TwHUe9cUoUO5WH30LFmTBvc7xgXVRZixxNcw5FnQDlj+/zRxIWsPfOLEZBEmjA8cvI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-171286-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 171286: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=e8034b534ab51635b62dca631514bb6305850a5a
X-Osstest-Versions-That:
    ovmf=cc2db6ebfb6d9d85ba4c7b35fba1fa37fffc0bc2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 20 Jun 2022 06:59:09 +0000

flight 171286 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/171286/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 e8034b534ab51635b62dca631514bb6305850a5a
baseline version:
 ovmf                 cc2db6ebfb6d9d85ba4c7b35fba1fa37fffc0bc2

Last test of basis   171243  2022-06-17 09:43:17 Z    2 days
Testing same since   171286  2022-06-20 05:11:51 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Liu, Zhiguang <Zhiguang.Liu@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

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
   cc2db6ebfb..e8034b534a  e8034b534ab51635b62dca631514bb6305850a5a -> xen-tested-master


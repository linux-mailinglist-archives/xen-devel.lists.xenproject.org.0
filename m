Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F081947CFC5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 11:13:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250723.431804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzyby-0002m6-J5; Wed, 22 Dec 2021 10:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250723.431804; Wed, 22 Dec 2021 10:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzyby-0002jv-Eo; Wed, 22 Dec 2021 10:12:42 +0000
Received: by outflank-mailman (input) for mailman id 250723;
 Wed, 22 Dec 2021 10:12:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzybw-0002jk-IJ; Wed, 22 Dec 2021 10:12:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzybw-0001Oi-Ew; Wed, 22 Dec 2021 10:12:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mzybw-0003Qf-76; Wed, 22 Dec 2021 10:12:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mzybw-0004Rp-50; Wed, 22 Dec 2021 10:12:40 +0000
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
	bh=of9VwsHsY44VXapZkGz0wQQW9Nr72pvLP5ouRWW0e4A=; b=ZXxWegrT0PaadJNlPm0mzzeoUe
	8arUXFd0ezsBHT8d1782LBwMp3we2fn7mZGyBAqk4mJQXAVHH03GCZwT8mTO1blK/6/J0EESQE5uJ
	8kxZoDdFgiwcYelj7FilRooZrN2Ptu5Eyxc0VGosMVn+kArhoreuwXHa8qpZBpoBSphI=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-167513-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 167513: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=9ec2cc1f3138ef9314314df29fc6ce0aa5e120b9
X-Osstest-Versions-That:
    ovmf=de9e5b7dc721d4ca319c0455cf83577347e0abef
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Dec 2021 10:12:40 +0000

flight 167513 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167513/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 9ec2cc1f3138ef9314314df29fc6ce0aa5e120b9
baseline version:
 ovmf                 de9e5b7dc721d4ca319c0455cf83577347e0abef

Last test of basis   167487  2021-12-20 04:11:39 Z    2 days
Testing same since   167513  2021-12-22 05:41:33 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chasel Chiu <chasel.chiu@intel.com>

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
   de9e5b7dc7..9ec2cc1f31  9ec2cc1f3138ef9314314df29fc6ce0aa5e120b9 -> xen-tested-master


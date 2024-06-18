Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640DE90DA28
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 19:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743253.1150142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJcBQ-00076Q-1M; Tue, 18 Jun 2024 16:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743253.1150142; Tue, 18 Jun 2024 16:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJcBP-00074i-Tm; Tue, 18 Jun 2024 16:59:47 +0000
Received: by outflank-mailman (input) for mailman id 743253;
 Tue, 18 Jun 2024 16:59:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJcBO-00074Y-7y; Tue, 18 Jun 2024 16:59:46 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJcBN-0005mk-VE; Tue, 18 Jun 2024 16:59:45 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sJcBN-0001BV-N1; Tue, 18 Jun 2024 16:59:45 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sJcBN-0004Gv-MV; Tue, 18 Jun 2024 16:59:45 +0000
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
	bh=BHocqoz+i15sGRgpltDp2gqvvBTyJe3Fogb4yn8qNLA=; b=DmWlv09YtFpVJTpdl51OlxPsEn
	5O4eb0kMeASwYKCuNz5TEoxxIXME1i/MkGuFbfbVrGUcI4zpG5w0VZ8UKlD2hisj/m4k8W8rgg1Zd
	fQCoI+9/9y4dhQ9J+fou//vc5aLES1SlAnvfL3R9kz+pq4ENcHeaWppqLGivGO/m1aws=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186397-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 186397: all pass - PUSHED
X-Osstest-Versions-This:
    ovmf=bfda27ddc89502190c79f74fc20cb81458d58449
X-Osstest-Versions-That:
    ovmf=b0c5781671f322472836ff25ee11242f59aa9945
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 18 Jun 2024 16:59:45 +0000

flight 186397 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186397/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 ovmf                 bfda27ddc89502190c79f74fc20cb81458d58449
baseline version:
 ovmf                 b0c5781671f322472836ff25ee11242f59aa9945

Last test of basis   186394  2024-06-18 11:42:54 Z    0 days
Testing same since   186397  2024-06-18 15:12:52 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Chao Li <lichao@loongson.cn>
  Gerd Hoffmann <kraxel@redhat.com>

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
   b0c5781671..bfda27ddc8  bfda27ddc89502190c79f74fc20cb81458d58449 -> xen-tested-master


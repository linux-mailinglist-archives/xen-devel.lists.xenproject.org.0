Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07AF1B35EE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 06:07:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jR6fU-0008Ff-OV; Wed, 22 Apr 2020 04:07:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GuZW=6G=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jR6fT-0008Fa-Ih
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 04:07:23 +0000
X-Inumbo-ID: c17bf734-844e-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c17bf734-844e-11ea-b4f4-bc764e2007e4;
 Wed, 22 Apr 2020 04:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q8mX2eH9rU5rtVGBrckLfA8MpaDTOodZiOpBsQRXbJU=; b=kby01qVlXvPwXNyjVopGMcA4X
 CYmJAJ8el35fho08b+7hpNPs/Df9L97fI4Xy2/AOwrqOESqyR+khgJLYAUgUmwNbEXBoj804hXO8R
 sH6dpTzG37PqrAn9f40/lMg3xYzxkmf17SKJEgTp2ufUauyX2VZ+ouyhgycB4zTjPk6PQ=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jR6fN-0006mo-BN; Wed, 22 Apr 2020 04:07:17 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jR6fM-0002Qi-O7; Wed, 22 Apr 2020 04:07:16 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jR6fM-0002Zm-NF; Wed, 22 Apr 2020 04:07:16 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-149712-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [seabios test] 149712: tolerable FAIL - PUSHED
X-Osstest-Failures: seabios:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
 seabios:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 seabios:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
 seabios:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
X-Osstest-Versions-This: seabios=eaaf726038cb9b2d01312d6430b4e93842aa96eb
X-Osstest-Versions-That: seabios=6a3b59ab9c7dc00331c21346052dfa6a0df45aa3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 22 Apr 2020 04:07:16 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

flight 149712 seabios real [real]
http://logs.test-lab.xenproject.org/osstest/logs/149712/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-i386-xl-qemuu-win7-amd64 17 guest-stop             fail like 149211
 test-amd64-amd64-xl-qemuu-ws16-amd64 17 guest-stop            fail like 149211
 test-amd64-amd64-xl-qemuu-win7-amd64 17 guest-stop            fail like 149211
 test-amd64-i386-xl-qemuu-ws16-amd64 17 guest-stop             fail like 149211
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 11 migrate-support-check fail never pass
 test-amd64-amd64-qemuu-nested-amd 17 debian-hvm-install/l1/l2  fail never pass

version targeted for testing:
 seabios              eaaf726038cb9b2d01312d6430b4e93842aa96eb
baseline version:
 seabios              6a3b59ab9c7dc00331c21346052dfa6a0df45aa3

Last test of basis   149211  2020-03-30 13:24:09 Z   22 days
Testing same since   149712  2020-04-21 10:44:40 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    


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

To xenbits.xen.org:/home/xen/git/osstest/seabios.git
   6a3b59a..eaaf726  eaaf726038cb9b2d01312d6430b4e93842aa96eb -> xen-tested-master


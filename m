Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B623320C760
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jun 2020 12:17:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpULq-0002Wf-4D; Sun, 28 Jun 2020 10:15:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lqO6=AJ=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1jpULo-0002WZ-7B
 for xen-devel@lists.xenproject.org; Sun, 28 Jun 2020 10:15:52 +0000
X-Inumbo-ID: 57e0b846-b928-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57e0b846-b928-11ea-bca7-bc764e2007e4;
 Sun, 28 Jun 2020 10:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oIJsDNDRnNkJXzrWVLMXS1L8SqJ0WMrdrc2ScV5WADg=; b=6BOuBLuacgrkG6g2xanP40UFy
 kh65EdltjP3y2aE/bpb5a2Tu+UjA1NFScMpn+eNG/Avj1ZVk47pd+X0ZRDekpxD34RqIDlu1zx+Te
 bVULgx4JOcHkjIv1vGQZgKyWdtEmWUIAGcWSexzRz8aM2rHXgs9e6J6L/jHIZ2eYWuwHU=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jpULm-00037e-RC; Sun, 28 Jun 2020 10:15:50 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1jpULm-000894-ER; Sun, 28 Jun 2020 10:15:50 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1jpULm-00072z-Dh; Sun, 28 Jun 2020 10:15:50 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-151428-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-coverity test] 151428: all pass - PUSHED
X-Osstest-Versions-This: xen=88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
X-Osstest-Versions-That: xen=fde76f895d0aa817a1207d844d793239c6639bc6
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 28 Jun 2020 10:15:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

flight 151428 xen-unstable-coverity real [real]
http://logs.test-lab.xenproject.org/osstest/logs/151428/

Perfect :-)
All tests in this flight passed as required
version targeted for testing:
 xen                  88cfd062e8318dfeb67c7d2eb50b6cd224b0738a
baseline version:
 xen                  fde76f895d0aa817a1207d844d793239c6639bc6

Last test of basis   151271  2020-06-21 09:18:26 Z    7 days
Testing same since   151428  2020-06-28 09:23:57 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Grzegorz Uriasz <gorbak25@gmail.com>
  Ian Jackson <ian.jackson@eu.citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Jason Andryuk <jandryuk@gmail.com>
  Tim Deegan <tim@xen.org>
  Wei Liu <wl@xen.org>

jobs:
 coverity-amd64                                               pass    


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

To xenbits.xen.org:/home/xen/git/xen.git
   fde76f895d..88cfd062e8  88cfd062e8318dfeb67c7d2eb50b6cd224b0738a -> coverity-tested/smoke


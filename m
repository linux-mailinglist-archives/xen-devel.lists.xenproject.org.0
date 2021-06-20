Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914443ADC21
	for <lists+xen-devel@lfdr.de>; Sun, 20 Jun 2021 02:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145165.267084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lul0K-0003Eb-4C; Sun, 20 Jun 2021 00:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145165.267084; Sun, 20 Jun 2021 00:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lul0J-0003CX-W8; Sun, 20 Jun 2021 00:07:59 +0000
Received: by outflank-mailman (input) for mailman id 145165;
 Sun, 20 Jun 2021 00:07:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lul0I-0003CN-BE; Sun, 20 Jun 2021 00:07:58 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lul0H-0002kW-S2; Sun, 20 Jun 2021 00:07:57 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1lul0H-0001wp-IF; Sun, 20 Jun 2021 00:07:57 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1lul0H-0001pJ-Hk; Sun, 20 Jun 2021 00:07:57 +0000
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
	bh=31qRUpCf7+nL20gEzoITmnh1ERknlB1XbPFOK8sFPfI=; b=JpTVn5nZXNNVnLjrUiYdsWNKf/
	3bmadjEhPZNriouY0Y5DKklqDKv9PMW5owF1lmZsuMHBQgKKqD5fNLWLdwHqtM+q5Ss9Et7BcPSZa
	D8oc51c8n4syBWG8xFaDidfNboyq1HbcUayFOVGC+B7U9hHbV6HYmuNYS6mEkHllOfsU=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-162900-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [ovmf test] 162900: trouble: blocked/broken/pass
X-Osstest-Failures:
    ovmf:build-i386:<job status>:broken:regression
    ovmf:build-i386-pvops:<job status>:broken:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:<job status>:broken:regression
    ovmf:build-i386:host-install(4):broken:regression
    ovmf:test-amd64-amd64-xl-qemuu-ovmf-amd64:host-install(5):broken:regression
    ovmf:build-i386-pvops:host-install(4):broken:regression
    ovmf:build-i386-libvirt:build-check(1):blocked:nonblocking
    ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    ovmf=a63914d3f603580e5aeceb5edbafe56688210141
X-Osstest-Versions-That:
    ovmf=c410ad4da4b7785170d3d42a3ba190c2caac6feb
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 20 Jun 2021 00:07:57 +0000

flight 162900 ovmf real [real]
http://logs.test-lab.xenproject.org/osstest/logs/162900/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-i386                      <job status>                 broken
 build-i386-pvops                <job status>                 broken
 test-amd64-amd64-xl-qemuu-ovmf-amd64    <job status>                 broken
 build-i386                    4 host-install(4)        broken REGR. vs. 162359
 test-amd64-amd64-xl-qemuu-ovmf-amd64 5 host-install(5) broken REGR. vs. 162359
 build-i386-pvops              4 host-install(4)        broken REGR. vs. 162359

Tests which did not succeed, but are not blocking:
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a

version targeted for testing:
 ovmf                 a63914d3f603580e5aeceb5edbafe56688210141
baseline version:
 ovmf                 c410ad4da4b7785170d3d42a3ba190c2caac6feb

Last test of basis   162359  2021-06-04 03:40:08 Z   15 days
Failing since        162368  2021-06-04 15:42:59 Z   15 days   33 attempts
Testing same since   162900  2021-06-19 07:19:12 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Ard Biesheuvel <ardb@kernel.org>
  gaoliming <gaoliming@byosoft.com.cn>
  Hao A Wu <hao.a.wu@intel.com>
  Jian J Wang <jian.j.wang@intel.com>
  Kaaira Gupta <kaaira7319@gmail.com>
  Kun Qin <kuqin12@gmail.com>
  Laszlo Ersek <lersek@redhat.com>
  Leif Lindholm <leif@nuviainc.com>
  Liming Gao <gaoliming@byosoft.com.cn>
  Maurice Ma <maurice.ma@intel.com>
  Ni, Ray <ray.ni@intel.com>
  Patrick Rudolph <patrick.rudolph@9elements.com>
  Ray Ni <ray.ni@intel.com>
  Rebecca Cran <rebecca@nuviainc.com>
  Scottie Kuo <scottie.kuo@intel.com>
  Sean Brogan <sean.brogan@microsoft.com>
  Sean Brogan <spbrogan@live.com>
  Sumana Venur <sumana.venur@intel.com>
  Zhiguang Liu <zhiguang.liu@intel.com>

jobs:
 build-amd64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-i386                                                   broken  
 build-amd64-libvirt                                          pass    
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-i386-pvops                                             broken  
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         broken  
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 


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

broken-job build-i386 broken
broken-job build-i386-pvops broken
broken-job test-amd64-amd64-xl-qemuu-ovmf-amd64 broken
broken-step build-i386 host-install(4)
broken-step test-amd64-amd64-xl-qemuu-ovmf-amd64 host-install(5)
broken-step build-i386-pvops host-install(4)

Not pushing.

(No revision log; it would be 2173 lines long.)


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386FA312F5B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 11:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82725.152871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l943X-0001MD-EP; Mon, 08 Feb 2021 10:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82725.152871; Mon, 08 Feb 2021 10:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l943X-0001LW-8k; Mon, 08 Feb 2021 10:46:11 +0000
Received: by outflank-mailman (input) for mailman id 82725;
 Mon, 08 Feb 2021 10:46:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943V-0001Kw-Md; Mon, 08 Feb 2021 10:46:09 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943V-0001cF-Hg; Mon, 08 Feb 2021 10:46:09 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1l943V-0006qt-51; Mon, 08 Feb 2021 10:46:09 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1l943V-00084i-4V; Mon, 08 Feb 2021 10:46:09 +0000
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
	bh=pPM+drSg55V9+9/AKD6NgLYiBJ2HOoZZhQxJ7nUlRiA=; b=hRjlAkTi27hC4RBXaGHHZ8le+t
	9o7zjkrzVtug2c66SWgFed7IMJtFAIrUUcoEuXYjOvSINEQrGZPFI2YtbkXqr2EzkWFAj0HbjZtya
	/29RiRkggx8n2m1pI6nnYvfGQWBBH0es/SzE6igscx52fgCMNr51xKsYkCHLsfsdWltQ=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-159118-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 159118: trouble: blocked/broken/preparing/queued/running
X-Osstest-Failures:
    libvirt:build-amd64:<job status>:broken:regression
    libvirt:build-amd64-pvops:<job status>:broken:regression
    libvirt:build-armhf:<job status>:broken:regression
    libvirt:build-i386-xsm:host-install(4):broken:regression
    libvirt:build-amd64:host-install(4):broken:regression
    libvirt:build-amd64-pvops:host-install(4):broken:regression
    libvirt:build-armhf:host-install(4):broken:regression
    libvirt:build-arm64-libvirt:<none executed>:queued:regression
    libvirt:build-i386-libvirt:<none executed>:queued:regression
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    libvirt:test-amd64-amd64-libvirt-xsm:<none executed>:queued:regression
    libvirt:test-amd64-i386-libvirt:<none executed>:queued:regression
    libvirt:test-amd64-i386-libvirt-pair:<none executed>:queued:regression
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:<none executed>:queued:regression
    libvirt:test-amd64-i386-libvirt-xsm:<none executed>:queued:regression
    libvirt:test-arm64-arm64-libvirt:<none executed>:queued:regression
    libvirt:test-arm64-arm64-libvirt-qcow2:<none executed>:queued:regression
    libvirt:test-arm64-arm64-libvirt-xsm:<none executed>:queued:regression
    libvirt:test-armhf-armhf-libvirt:<none executed>:queued:regression
    libvirt:test-armhf-armhf-libvirt-raw:<none executed>:queued:regression
    libvirt:build-amd64-xsm:hosts-allocate:running:regression
    libvirt:build-arm64-pvops:hosts-allocate:running:regression
    libvirt:build-armhf-pvops:hosts-allocate:running:regression
    libvirt:build-i386:hosts-allocate:running:regression
    libvirt:build-i386-pvops:hosts-allocate:running:regression
    libvirt:build-arm64:hosts-allocate:running:regression
    libvirt:build-i386-xsm:syslog-server:running:regression
    libvirt:build-arm64-xsm:host-install(4):running:regression
    libvirt:build-arm64-xsm:syslog-server:running:regression
    libvirt:build-amd64-libvirt:build-check(1):blocked:nonblocking
    libvirt:build-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    libvirt=a58edc602ebfef9323d405f846cb0076bdfc8044
X-Osstest-Versions-That:
    libvirt=2c846fa6bcc11929c9fb857a22430fb9945654ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 08 Feb 2021 10:46:09 +0000

flight 159118 libvirt running [real]
http://logs.test-lab.xenproject.org/osstest/logs/159118/

Failures and problems with tests :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                     <job status>                 broken
 build-amd64-pvops               <job status>                 broken
 build-armhf                     <job status>                 broken
 build-i386-xsm                4 host-install(4)        broken REGR. vs. 151777
 build-amd64                   4 host-install(4)        broken REGR. vs. 151777
 build-amd64-pvops             4 host-install(4)        broken REGR. vs. 151777
 build-armhf                   4 host-install(4)        broken REGR. vs. 151777
 build-arm64-libvirt             <none executed>              queued
 build-i386-libvirt              <none executed>              queued
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>   queued
 test-amd64-amd64-libvirt-xsm    <none executed>              queued
 test-amd64-i386-libvirt         <none executed>              queued
 test-amd64-i386-libvirt-pair    <none executed>              queued
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm    <none executed>    queued
 test-amd64-i386-libvirt-xsm     <none executed>              queued
 test-arm64-arm64-libvirt        <none executed>              queued
 test-arm64-arm64-libvirt-qcow2    <none executed>              queued
 test-arm64-arm64-libvirt-xsm    <none executed>              queued
 test-armhf-armhf-libvirt        <none executed>              queued
 test-armhf-armhf-libvirt-raw    <none executed>              queued
 build-amd64-xsm               2 hosts-allocate               running
 build-arm64-pvops             2 hosts-allocate               running
 build-armhf-pvops             2 hosts-allocate               running
 build-i386                    2 hosts-allocate               running
 build-i386-pvops              2 hosts-allocate               running
 build-arm64                   2 hosts-allocate               running
 build-i386-xsm                3 syslog-server                running
 build-arm64-xsm               4 host-install(4)              running
 build-arm64-xsm               3 syslog-server                running

Tests which did not succeed, but are not blocking:
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a

version targeted for testing:
 libvirt              a58edc602ebfef9323d405f846cb0076bdfc8044
baseline version:
 libvirt              2c846fa6bcc11929c9fb857a22430fb9945654ad

Last test of basis   151777  2020-07-10 04:19:19 Z  213 days
Failing since        151818  2020-07-11 04:18:52 Z  212 days  206 attempts
Testing same since   159097  2021-02-07 09:24:19 Z    1 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Adolfo Jayme Barrientos <fitoschido@gmail.com>
  Aleksandr Alekseev <alexander.alekseev@virtuozzo.com>
  Andika Triwidada <andika@gmail.com>
  Andrea Bolognani <abologna@redhat.com>
  Balázs Meskó <meskobalazs@mailbox.org>
  Barrett Schonefeld <bschoney@utexas.edu>
  Bastien Orivel <bastien.orivel@diateam.net>
  Bihong Yu <yubihong@huawei.com>
  Binfeng Wu <wubinfeng@huawei.com>
  Boris Fiuczynski <fiuczy@linux.ibm.com>
  Brian Turek <brian.turek@gmail.com>
  Christian Ehrhardt <christian.ehrhardt@canonical.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Cole Robinson <crobinso@redhat.com>
  Collin Walling <walling@linux.ibm.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Bosdonnat <cbosdonnat@suse.com>
  Côme Borsoi <fedora@borsoi.fr>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel Letai <dani@letai.org.il>
  Daniel P. Berrange <berrange@redhat.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Dmytro Linkin <dlinkin@nvidia.com>
  Eiichi Tsukata <eiichi.tsukata@nutanix.com>
  Erik Skultety <eskultet@redhat.com>
  Fabian Affolter <mail@fabian-affolter.ch>
  Fabian Freyer <fabian.freyer@physik.tu-berlin.de>
  Fangge Jin <fjin@redhat.com>
  Farhan Ali <alifm@linux.ibm.com>
  Fedora Weblate Translation <i18n@lists.fedoraproject.org>
  gongwei <gongwei@smartx.com>
  Guoyi Tu<tu.guoyi@h3c.com>
  Göran Uddeborg <goeran@uddeborg.se>
  Halil Pasic <pasic@linux.ibm.com>
  Han Han <hhan@redhat.com>
  Hao Wang <wanghao232@huawei.com>
  Helmut Grohne <helmut@subdivi.de>
  Ian Wienand <iwienand@redhat.com>
  Jakob Meng <jakobmeng@web.de>
  Jamie Strandboge <jamie@canonical.com>
  Jamie Strandboge <jamie@ubuntu.com>
  Jan Kuparinen <copper_fin@hotmail.com>
  Jean-Baptiste Holcroft <jean-baptiste@holcroft.fr>
  Jianan Gao <jgao@redhat.com>
  Jim Fehlig <jfehlig@suse.com>
  Jin Yan <jinyan12@huawei.com>
  Jiri Denemark <jdenemar@redhat.com>
  John Ferlan <jferlan@redhat.com>
  Jonathan Watt <jwatt@jwatt.org>
  Jonathon Jongsma <jjongsma@redhat.com>
  Julio Faracco <jcfaracco@gmail.com>
  Ján Tomko <jtomko@redhat.com>
  Kashyap Chamarthy <kchamart@redhat.com>
  Kevin Locke <kevin@kevinlocke.name>
  Laine Stump <laine@redhat.com>
  Laszlo Ersek <lersek@redhat.com>
  Liao Pingfang <liao.pingfang@zte.com.cn>
  Lin Ma <lma@suse.com>
  Lin Ma <lma@suse.de>
  Lin Ma <morecache@gmail.com>
  Marc Hartmayer <mhartmay@linux.ibm.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Markus Schade <markus.schade@hetzner.com>
  Martin Kletzander <mkletzan@redhat.com>
  Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
  Matt Coleman <matt@datto.com>
  Matt Coleman <mcoleman@datto.com>
  Mauro Matteo Cascella <mcascell@redhat.com>
  Meina Li <meili@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Michał Smyk <fedora@smyk.it>
  Milo Casagrande <milo@milo.name>
  Moshe Levi <moshele@nvidia.com>
  Muha Aliss <muhaaliss@gmail.com>
  Neal Gompa <ngompa13@gmail.com>
  Nick Shyrokovskiy <nshyrokovskiy@gmail.com>
  Nickys Music Group <nickys.music.group@gmail.com>
  Nico Pache <npache@redhat.com>
  Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>
  Olaf Hering <olaf@aepfle.de>
  Olesya Gerasimenko <gammaray@basealt.ru>
  Orion Poplawski <orion@nwra.com>
  Patrick Magauran <patmagauran.j@gmail.com>
  Paulo de Rezende Pinatti <ppinatti@linux.ibm.com>
  Pavel Hrdina <phrdina@redhat.com>
  Peter Krempa <pkrempa@redhat.com>
  Pino Toscano <ptoscano@redhat.com>
  Pino Toscano <toscano.pino@tiscali.it>
  Piotr Drąg <piotrdrag@gmail.com>
  Prathamesh Chavan <pc44800@gmail.com>
  Ricky Tigg <ricky.tigg@gmail.com>
  Roman Bogorodskiy <bogorodskiy@gmail.com>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Ryan Gahagan <rgahagan@cs.utexas.edu>
  Ryan Schmidt <git@ryandesign.com>
  Sam Hartman <hartmans@debian.org>
  Scott Shambarger <scott-libvirt@shambarger.net>
  Sebastian Mitterle <smitterl@redhat.com>
  Shalini Chellathurai Saroja <shalini@linux.ibm.com>
  Shaojun Yang <yangshaojun@phytium.com.cn>
  Shi Lei <shi_lei@massclouds.com>
  Simon Gaiser <simon@invisiblethingslab.com>
  Stefan Bader <stefan.bader@canonical.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Szymon Scholz <szymonscholz@gmail.com>
  Thomas Huth <thuth@redhat.com>
  Tim Wiederhake <twiederh@redhat.com>
  Tomáš Golembiovský <tgolembi@redhat.com>
  Tomáš Janoušek <tomi@nomi.cz>
  Tuguoyi <tu.guoyi@h3c.com>
  Wang Xin <wangxinxin.wang@huawei.com>
  Weblate <noreply@weblate.org>
  Yalei Li <274268859@qq.com>
  Yalei Li <liyl43@chinatelecom.cn>
  Yang Hang <yanghang44@huawei.com>
  Yanqiu Zhang <yanqzhan@redhat.com>
  Yi Li <yili@winhong.com>
  Yi Wang <wang.yi59@zte.com.cn>
  Yuri Chornoivan <yurchor@ukr.net>
  Zheng Chuan <zhengchuan@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhenyu Zheng <zheng.zhenyu@outlook.com>

jobs:
 build-amd64-xsm                                              preparing
 build-arm64-xsm                                              running 
 build-i386-xsm                                               running 
 build-amd64                                                  broken  
 build-arm64                                                  preparing
 build-armhf                                                  broken  
 build-i386                                                   preparing
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          queued  
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           queued  
 build-amd64-pvops                                            broken  
 build-arm64-pvops                                            preparing
 build-armhf-pvops                                            preparing
 build-i386-pvops                                             preparing
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           queued  
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            queued  
 test-amd64-amd64-libvirt-xsm                                 queued  
 test-arm64-arm64-libvirt-xsm                                 queued  
 test-amd64-i386-libvirt-xsm                                  queued  
 test-amd64-amd64-libvirt                                     blocked 
 test-arm64-arm64-libvirt                                     queued  
 test-armhf-armhf-libvirt                                     queued  
 test-amd64-i386-libvirt                                      queued  
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 queued  
 test-arm64-arm64-libvirt-qcow2                               queued  
 test-armhf-armhf-libvirt-raw                                 queued  
 test-amd64-amd64-libvirt-vhd                                 blocked 


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

broken-job build-amd64 broken
broken-job build-amd64-pvops broken
broken-job build-arm64-libvirt queued
broken-job build-armhf broken
broken-job build-i386-libvirt queued
broken-job test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-amd64-libvirt-xsm queued
broken-job test-amd64-i386-libvirt queued
broken-job test-amd64-i386-libvirt-pair queued
broken-job test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm queued
broken-job test-amd64-i386-libvirt-xsm queued
broken-job test-arm64-arm64-libvirt queued
broken-job test-arm64-arm64-libvirt-qcow2 queued
broken-job test-arm64-arm64-libvirt-xsm queued
broken-job test-armhf-armhf-libvirt queued
broken-job test-armhf-armhf-libvirt-raw queued
broken-step build-i386-xsm host-install(4)
broken-step build-amd64 host-install(4)
broken-step build-amd64-pvops host-install(4)
broken-step build-armhf host-install(4)

Not pushing.

(No revision log; it would be 40506 lines long.)


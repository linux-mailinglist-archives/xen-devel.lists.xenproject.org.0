Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953604FADC5
	for <lists+xen-devel@lfdr.de>; Sun, 10 Apr 2022 14:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302431.516078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndWSU-0004m1-G0; Sun, 10 Apr 2022 12:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302431.516078; Sun, 10 Apr 2022 12:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndWSU-0004j9-CX; Sun, 10 Apr 2022 12:14:22 +0000
Received: by outflank-mailman (input) for mailman id 302431;
 Sun, 10 Apr 2022 12:14:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ndWSS-0004iz-K8; Sun, 10 Apr 2022 12:14:20 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ndWSS-0008HC-F1; Sun, 10 Apr 2022 12:14:20 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1ndWSS-0003lO-4j; Sun, 10 Apr 2022 12:14:20 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1ndWSS-00053U-4N; Sun, 10 Apr 2022 12:14:20 +0000
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
	bh=7RkaIy2tFPJ1smEfRXCpOauKAFl8U+NDNKMiAZNdtxU=; b=aXWmWPERJpKDOzOjPsTiCvOcjz
	jKRD9u6Q55QYtAMu0nbc0tXv7b8DmCXcgaH4O44vqooLxMdHL8ibV/2xk3256W7EcgxexVmdYM3XZ
	/jIX0G36gLRj9Y9zs4hx9xeDGZDENp7WkSjGgW+p1U4Zr2y4bkda2uchscN1uVZAkqNM=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169270-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [libvirt test] 169270: regressions - FAIL
X-Osstest-Failures:
    libvirt:build-amd64-libvirt:libvirt-build:fail:regression
    libvirt:build-arm64-libvirt:libvirt-build:fail:regression
    libvirt:build-i386-libvirt:libvirt-build:fail:regression
    libvirt:build-armhf-libvirt:libvirt-build:fail:regression
    libvirt:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    libvirt:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-qcow2:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    libvirt:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    libvirt:test-armhf-armhf-libvirt-qcow2:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    libvirt=c11fb2132f313b9aa25ad7c57becc72923623874
X-Osstest-Versions-That:
    libvirt=2c846fa6bcc11929c9fb857a22430fb9945654ad
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 10 Apr 2022 12:14:20 +0000

flight 169270 libvirt real [real]
http://logs.test-lab.xenproject.org/osstest/logs/169270/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 151777
 build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 151777
 build-i386-libvirt            6 libvirt-build            fail REGR. vs. 151777
 build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 151777

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-raw   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-qcow2  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-qcow2  1 build-check(1)               blocked  n/a

version targeted for testing:
 libvirt              c11fb2132f313b9aa25ad7c57becc72923623874
baseline version:
 libvirt              2c846fa6bcc11929c9fb857a22430fb9945654ad

Last test of basis   151777  2020-07-10 04:19:19 Z  639 days
Failing since        151818  2020-07-11 04:18:52 Z  638 days  620 attempts
Testing same since   169254  2022-04-09 04:20:15 Z    1 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
    Adolfo Jayme Barrientos <fitoschido@gmail.com>
  Aleksandr Alekseev <alexander.alekseev@virtuozzo.com>
  Aleksei Zakharov <zaharov@selectel.ru>
  Amneesh Singh <natto@weirdnatto.in>
  Andika Triwidada <andika@gmail.com>
  Andrea Bolognani <abologna@redhat.com>
  Andrew Melnychenko <andrew@daynix.com>
  Ani Sinha <ani@anisinha.ca>
  Balázs Meskó <meskobalazs@mailbox.org>
  Barrett Schonefeld <bschoney@utexas.edu>
  Bastian Germann <bastiangermann@fishpost.de>
  Bastien Orivel <bastien.orivel@diateam.net>
  BiaoXiang Ye <yebiaoxiang@huawei.com>
  Bihong Yu <yubihong@huawei.com>
  Binfeng Wu <wubinfeng@huawei.com>
  Bjoern Walk <bwalk@linux.ibm.com>
  Boris Fiuczynski <fiuczy@linux.ibm.com>
  Brad Laue <brad@brad-x.com>
  Brian Turek <brian.turek@gmail.com>
  Bruno Haible <bruno@clisp.org>
  Chris Mayo <aklhfex@gmail.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Ehrhardt <christian.ehrhardt@canonical.com>
  Christian Kirbach <christian.kirbach@gmail.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Christophe Fergeau <cfergeau@redhat.com>
  Claudio Fontana <cfontana@suse.de>
  Cole Robinson <crobinso@redhat.com>
  Collin Walling <walling@linux.ibm.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Bosdonnat <cbosdonnat@suse.com>
  Côme Borsoi <fedora@borsoi.fr>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel Letai <dani@letai.org.il>
  Daniel P. Berrange <berrange@redhat.com>
  Daniel P. Berrangé <berrange@redhat.com>
  Didik Supriadi <didiksupriadi41@gmail.com>
  dinglimin <dinglimin@cmss.chinamobile.com>
  Divya Garg <divya.garg@nutanix.com>
  Dmitrii Shcherbakov <dmitrii.shcherbakov@canonical.com>
  Dmytro Linkin <dlinkin@nvidia.com>
  Eiichi Tsukata <eiichi.tsukata@nutanix.com>
  Emilio Herrera <ehespinosa57@gmail.com>
  Eric Farman <farman@linux.ibm.com>
  Erik Skultety <eskultet@redhat.com>
  Fabian Affolter <mail@fabian-affolter.ch>
  Fabian Freyer <fabian.freyer@physik.tu-berlin.de>
  Fabiano Fidêncio <fabiano@fidencio.org>
  Fangge Jin <fjin@redhat.com>
  Farhan Ali <alifm@linux.ibm.com>
  Fedora Weblate Translation <i18n@lists.fedoraproject.org>
  Franck Ridel <fridel@protonmail.com>
  Gavi Teitz <gavi@nvidia.com>
  gongwei <gongwei@smartx.com>
  Guoyi Tu<tu.guoyi@h3c.com>
  Göran Uddeborg <goeran@uddeborg.se>
  Halil Pasic <pasic@linux.ibm.com>
  Han Han <hhan@redhat.com>
  Hao Wang <wanghao232@huawei.com>
  Haonan Wang <hnwanga1@gmail.com>
  Hela Basa <r45xveza@pm.me>
  Helmut Grohne <helmut@subdivi.de>
  Hiroki Narukawa <hnarukaw@yahoo-corp.jp>
  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
  Ian Wienand <iwienand@redhat.com>
  Ioanna Alifieraki <ioanna-maria.alifieraki@canonical.com>
  Ivan Teterevkov <ivan.teterevkov@nutanix.com>
  Jakob Meng <jakobmeng@web.de>
  Jamie Strandboge <jamie@canonical.com>
  Jamie Strandboge <jamie@ubuntu.com>
  Jan Kuparinen <copper_fin@hotmail.com>
  jason lee <ppark5237@gmail.com>
  Jean-Baptiste Holcroft <jean-baptiste@holcroft.fr>
  Jia Zhou <zhou.jia2@zte.com.cn>
  Jianan Gao <jgao@redhat.com>
  Jim Fehlig <jfehlig@suse.com>
  Jin Yan <jinyan12@huawei.com>
  Jing Qi <jinqi@redhat.com>
  Jinsheng Zhang <zhangjl02@inspur.com>
  Jiri Denemark <jdenemar@redhat.com>
  Joachim Falk <joachim.falk@gmx.de>
  John Ferlan <jferlan@redhat.com>
  John Levon <john.levon@nutanix.com>
  John Levon <levon@movementarian.org>
  Jonathan Watt <jwatt@jwatt.org>
  Jonathon Jongsma <jjongsma@redhat.com>
  Julio Faracco <jcfaracco@gmail.com>
  Justin Gatzen <justin.gatzen@gmail.com>
  Ján Tomko <jtomko@redhat.com>
  Kashyap Chamarthy <kchamart@redhat.com>
  Kevin Locke <kevin@kevinlocke.name>
  Kim InSoo <simmon@nplob.com>
  Koichi Murase <myoga.murase@gmail.com>
  Kristina Hanicova <khanicov@redhat.com>
  Laine Stump <laine@redhat.com>
  Laszlo Ersek <lersek@redhat.com>
  Lee Yarwood <lyarwood@redhat.com>
  Lei Yang <yanglei209@huawei.com>
  Liao Pingfang <liao.pingfang@zte.com.cn>
  Lin Ma <lma@suse.com>
  Lin Ma <lma@suse.de>
  Lin Ma <morecache@gmail.com>
  Liu Yiding <liuyd.fnst@fujitsu.com>
  Lubomir Rintel <lkundrak@v3.sk>
  Luke Yue <lukedyue@gmail.com>
  Luyao Zhong <luyao.zhong@intel.com>
  Marc Hartmayer <mhartmay@linux.ibm.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Markus Schade <markus.schade@hetzner.com>
  Martin Kletzander <mkletzan@redhat.com>
  Martin Pitt <mpitt@debian.org>
  Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
  Matej Cepl <mcepl@cepl.eu>
  Matt Coleman <matt@datto.com>
  Matt Coleman <mcoleman@datto.com>
  Mauro Matteo Cascella <mcascell@redhat.com>
  Meina Li <meili@redhat.com>
  Michal Privoznik <mprivozn@redhat.com>
  Michał Smyk <fedora@smyk.it>
  Milo Casagrande <milo@milo.name>
  Moshe Levi <moshele@nvidia.com>
  Muha Aliss <muhaaliss@gmail.com>
  Nathan <nathan95@live.it>
  Neal Gompa <ngompa13@gmail.com>
  Nick Chevsky <nchevsky@gmail.com>
  Nick Shyrokovskiy <nshyrokovskiy@gmail.com>
  Nickys Music Group <nickys.music.group@gmail.com>
  Nico Pache <npache@redhat.com>
  Nicolas Lécureuil <neoclust@mageia.org>
  Nicolas Lécureuil <nicolas.lecureuil@siveo.net>
  Nikolay Shirokovskiy <nshirokovskiy@openvz.org>
  Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>
  Olaf Hering <olaf@aepfle.de>
  Olesya Gerasimenko <gammaray@basealt.ru>
  Or Ozeri <oro@il.ibm.com>
  Orion Poplawski <orion@nwra.com>
  Pany <geekpany@gmail.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Patrick Magauran <patmagauran.j@gmail.com>
  Paulo de Rezende Pinatti <ppinatti@linux.ibm.com>
  Pavel Hrdina <phrdina@redhat.com>
  Peng Liang <liangpeng10@huawei.com>
  Peter Krempa <pkrempa@redhat.com>
  Pino Toscano <ptoscano@redhat.com>
  Pino Toscano <toscano.pino@tiscali.it>
  Piotr Drąg <piotrdrag@gmail.com>
  Prathamesh Chavan <pc44800@gmail.com>
  Praveen K Paladugu <prapal@linux.microsoft.com>
  Richard W.M. Jones <rjones@redhat.com>
  Ricky Tigg <ricky.tigg@gmail.com>
  Robin Lee <cheeselee@fedoraproject.org>
  Rohit Kumar <rohit.kumar3@nutanix.com>
  Roman Bogorodskiy <bogorodskiy@gmail.com>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Ryan Gahagan <rgahagan@cs.utexas.edu>
  Ryan Schmidt <git@ryandesign.com>
  Sam Hartman <hartmans@debian.org>
  Scott Shambarger <scott-libvirt@shambarger.net>
  Sebastian Mitterle <smitterl@redhat.com>
  SeongHyun Jo <caelus9536@gmail.com>
  Shalini Chellathurai Saroja <shalini@linux.ibm.com>
  Shaojun Yang <yangshaojun@phytium.com.cn>
  shenjiatong <yshxxsjt715@gmail.com>
  Shi Lei <shi_lei@massclouds.com>
  simmon <simmon@nplob.com>
  Simon Chopin <chopin.simon@gmail.com>
  Simon Gaiser <simon@invisiblethingslab.com>
  Simon Rowe <simon.rowe@nutanix.com>
  Stefan Bader <stefan.bader@canonical.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Berger <stefanb@linux.vnet.ibm.com>
  Stefan Hajnoczi <stefanha@gmail.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Szymon Scholz <szymonscholz@gmail.com>
  Thomas Huth <thuth@redhat.com>
  Tim Wiederhake <twiederh@redhat.com>
  Tom Wieczorek <tom@bibbu.net>
  Tomáš Golembiovský <tgolembi@redhat.com>
  Tomáš Janoušek <tomi@nomi.cz>
  Tu Qiang <tu.qiang35@zte.com.cn>
  Tuguoyi <tu.guoyi@h3c.com>
  tuqiang <tu.qiang35@zte.com.cn>
  Vasiliy Ulyanov <vulyanov@suse.de>
  Victor Toso <victortoso@redhat.com>
  Ville Skyttä <ville.skytta@iki.fi>
  Vinayak Kale <vkale@nvidia.com>
  Vineeth Pillai <viremana@linux.microsoft.com>
  Wang Xin <wangxinxin.wang@huawei.com>
  WangJian <wangjian161@huawei.com>
  Weblate <noreply@weblate.org>
  Wei Liu <liuwe@microsoft.com>
  Wei Liu <wei.liu@kernel.org>
  Wei-Chen Chen <weicche@microsoft.com>
  William Douglas <william.douglas@intel.com>
  Xu Chao <xu.chao6@zte.com.cn>
  Yalei Li <274268859@qq.com>
  Yalei Li <liyl43@chinatelecom.cn>
  Yang Fei <yangfei85@huawei.com>
  Yang Hang <yanghang44@huawei.com>
  Yanqiu Zhang <yanqzhan@redhat.com>
  Yaroslav Kargin <ykargin@virtuozzo.com>
  Yasuhiko Kamata <belphegor@belbel.or.jp>
  Yi Li <yili@winhong.com>
  Yi Wang <wang.yi59@zte.com.cn>
  Yuri Chornoivan <yurchor@ukr.net>
  Zbigniew Jędrzejewski-Szmek <zbyszek@in.waw.pl>
  zhangjl02 <zhangjl02@inspur.com>
  zhanglei <zhanglei@smartx.com>
  Zheng Chuan <zhengchuan@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhenyu Ye <yezhenyu2@huawei.com>
  Zhenyu Zheng <zheng.zhenyu@outlook.com>
  Zhenzhong Duan <zhenzhong.duan@intel.com>
  Дамјан Георгиевски <gdamjan@gmail.com>
  김인수 <simmon@nplob.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          fail    
 build-arm64-libvirt                                          fail    
 build-armhf-libvirt                                          fail    
 build-i386-libvirt                                           fail    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-arm64-arm64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-arm64-arm64-libvirt-qcow2                               blocked 
 test-armhf-armhf-libvirt-qcow2                               blocked 
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-libvirt-raw                                  blocked 
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


Not pushing.

(No revision log; it would be 104141 lines long.)


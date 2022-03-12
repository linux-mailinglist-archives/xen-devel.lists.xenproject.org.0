Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193814D6DF7
	for <lists+xen-devel@lfdr.de>; Sat, 12 Mar 2022 11:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289423.490983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSyqg-0004Qz-JB; Sat, 12 Mar 2022 10:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289423.490983; Sat, 12 Mar 2022 10:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSyqg-0004P5-Fe; Sat, 12 Mar 2022 10:19:46 +0000
Received: by outflank-mailman (input) for mailman id 289423;
 Sat, 12 Mar 2022 10:19:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nSyqe-0004Ov-VR; Sat, 12 Mar 2022 10:19:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nSyqe-00089f-SE; Sat, 12 Mar 2022 10:19:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nSyqe-0007Ju-Dx; Sat, 12 Mar 2022 10:19:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nSyqe-0004Ji-DZ; Sat, 12 Mar 2022 10:19:44 +0000
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
	bh=npPajJQUpYkUd14F76k+ZCR0ZC7AG0qozyR7kSSNz9g=; b=oDyufnjGuX0NbuMz4Farc3chV/
	DzTsng6ESi74LnX881/lcd7HLdYEYkV1q/ubhv27BlbQUbu/KoyhsizgDX3ULWXueZYVBfgQNIu8S
	maPYXgeqgXv3omq9DyUWx/1z8SuQGPAmN/XVXAF/Aqf1jz66uK80UaiVLxy91rLHxQvc=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168518-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 168518: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-xsm:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=79b00034e9dcd2b065c1665c8b42f62b6b80a9be
X-Osstest-Versions-That:
    linux=1db333d9a51f3459fba1bcaa564d95befe79f0b3
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 12 Mar 2022 10:19:44 +0000

flight 168518 linux-linus real [real]
flight 168529 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/168518/
http://logs.test-lab.xenproject.org/osstest/logs/168529/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-xl-xsm 22 guest-start/debian.repeat fail pass in 168529-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168507
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168507
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168507
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168507
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168507
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168507
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168507
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168507
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                79b00034e9dcd2b065c1665c8b42f62b6b80a9be
baseline version:
 linux                1db333d9a51f3459fba1bcaa564d95befe79f0b3

Last test of basis   168507  2022-03-10 15:51:11 Z    1 days
Testing same since   168518  2022-03-11 14:42:07 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aleksander Jan Bajkowski <olek2@wp.pl>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Arnd Bergmann <arnd@arndb.de>
  Ben Ben-Ishay <benishay@nvidia.com>
  Bjorn Andersson <bjorn.andersson@linaro.org>
  Chris Clayton <chris2553@googlemail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Claudiu Beznea <claudiu.beznea@microchip.com>
  Clément Léger <clement.leger@bootlin.com>
  Colin Foster <colin.foster@in-advantage.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Bristot de Oliveira <bristot@kernel.org>
  Daniel Palmer <daniel@0x0f.com>
  Dave Airlie <airlied@redhat.com>
  Dave Ertman <david.m.ertman@intel.com>
  David Hildenbrand <david@redhat.com>
  David S. Miller <davem@davemloft.net>
  Dima Chumak <dchumak@nvidia.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Eric Dumazet <edumazet@google.com>
  Erico Nunes <nunes.erico@gmail.com>
  Fabio Estevam <festevam@denx.de>
  Florian Fainelli <f.fainelli@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Grzegorz Siwik <grzegorz.siwik@intel.com>
  Grzegorz Szczurek <grzegorzx.szczurek@intel.com>
  Guillaume Nault <gnault@redhat.com>
  Gurucharan <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Gurucharan G <gurucharanx.g@intel.com> (A Contingent worker at Intel)
  Hans de Goede <hdegoede@redhat.com>
  Hauke Mehrtens <hauke@hauke-m.de>
  Heiner Kallweit <hkallweit1@gmail.com>
  Ivan Vecera <ivecera@redhat.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jedrzej Jagielski <jedrzej.jagielski@intel.com>
  Jens Axboe <axboe@kernel.dk>
  Jeremy Linton <jeremy.linton@arm.com>
  Jernej Skrabec <jernej.skrabec@gmail.com>
  Jia-Ju Bai <baijiaju1990@gmail.com>
  Jianglei Nie <niejianglei2021@163.com>
  Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jisheng Zhang <Jisheng.Zhang@synaptics.com>
  Joel Stanley <joel@jms.id.au>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maloy <jmaloy@redhat.com>
  Jonathan Marek <jonathan@marek.ca>
  Jonathan Toppins <jtoppins@redhat.com>
  José Roberto de Souza <jose.souza@intel.com>
  Jouni Högander <jouni.hogander@intel.com>
  Kai Lueke <kailueke@linux.microsoft.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Kuldeep Singh <singh.kuldeep87k@gmail.com>
  Leszek Kaliszczuk <leszek.kaliszczuk@intel.com>
  Lina Wang <lina.wang@mediatek.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Lyude Paul <lyude@redhat.com>
  Marcel Holtmann <marcel@holtmann.org>
  Matthias Brugger <matthias.bgg@gmail.com>
  Maxime Ripard <maxime@cerno.tech>
  Miaoqian Lin <linmq006@gmail.com>
  Michal Maloszewski <michal.maloszewski@intel.com>
  Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
  Mitch Williams <mitch.a.williams@intel.com>
  Mohammad Kabat <mohammadkab@nvidia.com>
  Moshe Shemesh <moshe@nvidia.com>
  Nicolas Saenz Julienne <nsaenzju@redhat.com>
  Norbert Ciosek <norbertx.ciosek@intel.com>
  Nícolas F. R. A. Prado <nfraprado@collabora.com>
  Pali Rohár <pali@kernel.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul E. McKenney <paulmck@kernel.org>
  Pavel Skripkin <paskripkin@gmail.com>
  Peter Robinson <pbrobinson@gmail.com>
  Petr Oros <poros@redhat.com>
  Robert Foss <robert.foss@linaro.org>
  Robert Hancock <robert.hancock@calian.com>
  Roi Dayan <roid@nvidia.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Saeed Mahameed <saeedm@nvidia.com>
  Scott McNutt <scott.mcnutt@siriusxm.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Stanislav Jakubek <stano.jakubek@gmail.com>
  Steev Klimaszewski <steev@kali.org>
  Stefan Wahren <stefan.wahren@i2se.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Steven Rostedt (Google) <rostedt@goodmis.org>
  Thierry Reding <treding@nvidia.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Toke Høiland-Jørgensen <toke@redhat.com>
  Tom Rix <trix@redhat.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Tung Nguyen <tung.q.nguyen@dektech.com.au>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Zheyu Ma <zheyuma97@gmail.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      fail    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-freebsd11-amd64                             pass    
 test-amd64-amd64-freebsd12-amd64                             pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-armhf-armhf-libvirt-qcow2                               pass    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    
 test-armhf-armhf-xl-vhd                                      pass    


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

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   1db333d9a51f..79b00034e9dc  79b00034e9dcd2b065c1665c8b42f62b6b80a9be -> tested/linux-linus


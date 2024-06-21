Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813909119B0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 06:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745013.1152142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKW8k-0007Aq-M0; Fri, 21 Jun 2024 04:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745013.1152142; Fri, 21 Jun 2024 04:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKW8k-00077h-JO; Fri, 21 Jun 2024 04:44:46 +0000
Received: by outflank-mailman (input) for mailman id 745013;
 Fri, 21 Jun 2024 04:44:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sKW8j-00077X-4f; Fri, 21 Jun 2024 04:44:45 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sKW8i-0007iY-RO; Fri, 21 Jun 2024 04:44:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sKW8i-0000eG-Aq; Fri, 21 Jun 2024 04:44:44 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sKW8i-0007ZT-4S; Fri, 21 Jun 2024 04:44:44 +0000
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
	bh=x7QguehUAENjcU4ture4L91pA4BaYk2jvwLZtLRg158=; b=zI+UhvRgr4HJNdU7mhuJlp6WSe
	frKBiT08EbUSMSXKk7IA5nBUbA4MIhWNC02vEm1oqVjkc8ZCGB7+rBQrHB8eJ1Prx7NKIn4WCHyKh
	n9Rf0TokWjMtAbGuZtGM5/cj/AAniavHhdIB0diNQeVx/WY3VTFX9PUvso7W4kGtk3UU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186437-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186437: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-qcow2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:xen-boot:fail:allowable
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-examine:reboot:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:xen-boot:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=50736169ecc8387247fe6a00932852ce7b057083
X-Osstest-Versions-That:
    linux=e5b3efbe1ab1793bb49ae07d56d0973267e65112
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 21 Jun 2024 04:44:44 +0000

flight 186437 linux-linus real [real]
flight 186439 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186437/
http://logs.test-lab.xenproject.org/osstest/logs/186439/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-qcow2     8 xen-boot            fail pass in 186439-retest
 test-armhf-armhf-libvirt-vhd  8 xen-boot            fail pass in 186439-retest
 test-armhf-armhf-xl-credit1   8 xen-boot            fail pass in 186439-retest
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 186439-retest

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds      8 xen-boot                 fail REGR. vs. 186426

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 186439 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 186439 never pass
 test-armhf-armhf-xl-qcow2   14 migrate-support-check fail in 186439 never pass
 test-armhf-armhf-xl-qcow2 15 saverestore-support-check fail in 186439 never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check fail in 186439 never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check fail in 186439 never pass
 test-armhf-armhf-examine      8 reboot                       fail  like 186413
 test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 186426
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186426
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186426
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186426
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186426
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186426
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186426
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass

version targeted for testing:
 linux                50736169ecc8387247fe6a00932852ce7b057083
baseline version:
 linux                e5b3efbe1ab1793bb49ae07d56d0973267e65112

Last test of basis   186426  2024-06-20 03:49:07 Z    1 days
Testing same since   186437  2024-06-20 20:10:42 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aaron Conole <aconole@redhat.com>
  Adrian Moreno <amorenoz@redhat.com>
  Ajrat Makhmutov <rauty@altlinux.org>
  Ajrat Makhmutov <rautyrauty@gmail.com>
  Alexei Starovoitov <ast@kernel.org>
  Andre Przywara <andre.przywara@arm.com>
  Andy Chi <andy.chi@canonical.com>
  Antje Miederhöfer <a.miederhoefer@gmx.de>
  Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
  Ayala Beker <ayala.beker@intel.com>
  Boris Burkov <boris@bur.io>
  Cyrus Lien <cyrus.lien@canonical.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  David Ruth <druth@chromium.org>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Safonov <0x7f454c46@gmail.com>
  Dustin L. Howett <dustin@howett.net>
  Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
  En-Wei Wu <en-wei.wu@canonical.com>
  Eric Dumazet <edumazet@google.com>
  Florian Westphal <fw@strlen.de>
  Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>
  Geetha sowjanya <gakula@marvell.com>
  Gergely Meszaros <meszaros.gergely97@gmail.com>
  Heng Qi <hengqi@linux.alibaba.com>
  Ignat Korchagin <ignat@cloudflare.com>
  Ilya Maximets <i.maximets@ovn.org>
  Jakub Kicinski <kuba@kernel.org>
  Jason Wang <jasowang@redhat.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jianguo Wu <wujianguo@chinatelecom.cn>
  Jiri Olsa <jolsa@kernel.org>
  Jiri Pirko <jiri@nvidia.com>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Thumshirn <johannes.thumshirn@wdc.com>
  John Fastabend <john.fastabend@gmail.com>
  Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
  Jozsef Kadlecsik <kadlec@netfilter.org>
  Kailang Yang <kailang@realtek.com>
  Kees Cook <kees@kernel.org>
  Kenton Groombridge <concord@gentoo.org>
  Lee Jones <lee@kernel.org>
  Linus Torvalds <torvalds@linux-foundation.org>
  Lorenzo Bianconi <lorenzo@kernel.org>
  Maciej Żenczykowski <maze@google.com>
  Marcin Szycik <marcin.szycik@linux.intel.com>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Michael Chan <michael.chan@broadcom.com>
  Michael S. Tsirkin <mst@redhat.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Neal Cardwell <ncardwell@google.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Oliver Neukum <oneukum@suse.com>
  Ondrej Mosnacek <omosnace@redhat.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Greenwalt <paul.greenwalt@intel.com>
  Pavan Chebbi <pavan.chebbi@broadcom.com>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
  Raju Lakkaraju <Raju.Lakkaraju@microchip.com>
  Remi Pommarel <repk@triplefau.lt>
  Shaul Triebitz <shaul.triebitz@intel.com>
  Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
  Simon Horman <horms@kernel.org>
  Simon Trimmer <simont@opensource.cirrus.com>
  Stanislav Fomichev <sdf@google.com>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Stefan Wahren <wahrenst@gmx.net>
  Sujai Buvaneswaran <sujai.buvaneswaran@intel.com>
  Takashi Iwai <tiwai@suse.de>
  Tony Ambardar <tony.ambardar@gmail.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Wojciech Drewek <wojciech.drewek@intel.com>
  Xiaolei Wang <xiaolei.wang@windriver.com>
  Xin Long <lucien.xin@gmail.com>
  Yongqin Liu <yongqin.liu@linaro.org>
  Yuchung Cheng <ycheng@google.com>
  Yue Haibing <yuehaibing@huawei.com>

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
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 fail    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-armhf-armhf-xl-arndale                                  fail    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     fail    
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
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    fail    
 test-amd64-amd64-libvirt-raw                                 pass    
 test-arm64-arm64-libvirt-raw                                 pass    
 test-amd64-amd64-xl-raw                                      pass    
 test-armhf-armhf-xl-raw                                      pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 fail    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      pass    


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
   e5b3efbe1ab1..50736169ecc8  50736169ecc8387247fe6a00932852ce7b057083 -> tested/linux-linus


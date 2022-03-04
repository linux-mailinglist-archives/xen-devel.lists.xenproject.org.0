Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9594CCC93
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 05:32:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283919.483030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPzbP-0002lh-HR; Fri, 04 Mar 2022 04:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283919.483030; Fri, 04 Mar 2022 04:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPzbP-0002jQ-DL; Fri, 04 Mar 2022 04:31:39 +0000
Received: by outflank-mailman (input) for mailman id 283919;
 Fri, 04 Mar 2022 04:31:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nPzbO-0002jG-4Y; Fri, 04 Mar 2022 04:31:38 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nPzbO-0000Xp-0c; Fri, 04 Mar 2022 04:31:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1nPzbN-0000Qt-P0; Fri, 04 Mar 2022 04:31:37 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1nPzbN-0003oG-OT; Fri, 04 Mar 2022 04:31:37 +0000
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
	bh=Nszxk3DcjokJceqp5lEWXZIWtVen95j6195HrFvK+Bo=; b=A/ZNtMzjI1Hrxh9hQhFiPDnLKB
	VYBdWRfh2yDYIxI7rvfxBxG2a8LQz7cd+AARXPiRWtIyCnit22vWPC1oJMqCkiuk3Ifre/ldf+3sp
	6hUV9IlBeyCbWplGuP/gB7dQ33RixDk8AS/eR2yfMU0rkinO/iLYEA0iZMTojSJZ45BY=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-168383-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 168383: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-vhd:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-xsm:guest-start/debian.repeat:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=b949c21fc23ecaccef89582f251e6281cad1f81e
X-Osstest-Versions-That:
    linux=5859a2b1991101d6b978f3feb5325dad39421f29
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 04 Mar 2022 04:31:37 +0000

flight 168383 linux-linus real [real]
flight 168391 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/168383/
http://logs.test-lab.xenproject.org/osstest/logs/168391/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-vhd       8 xen-boot            fail pass in 168391-retest
 test-amd64-amd64-xl-xsm 22 guest-start/debian.repeat fail pass in 168391-retest

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-vhd     14 migrate-support-check fail in 168391 never pass
 test-armhf-armhf-xl-vhd 15 saverestore-support-check fail in 168391 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 168355
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 168355
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 168355
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 168355
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 168355
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 168355
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 168355
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 168355
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                b949c21fc23ecaccef89582f251e6281cad1f81e
baseline version:
 linux                5859a2b1991101d6b978f3feb5325dad39421f29

Last test of basis   168355  2022-03-03 05:19:36 Z    0 days
Testing same since   168383  2022-03-03 19:41:08 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alex Elder <elder@linaro.org>
  Alexander Lobakin <alobakin@pm.me>
  Amit Cohen <amcohen@nvidia.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Antony Antony <antony.antony@secunet.com>
  Ben Dooks <ben.dooks@codethink.co.uk>
  Brian Gix <brian.gix@intel.com>
  Casper Andersson <casper.casan@gmail.com>
  Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Chuanhong Guo <gch981213@gmail.com>
  Corinna Vinschen <vinschen@redhat.com>
  D. Wythe <alibuda@linux.alibaba.com>
  Daniel Borkmann <daniel@iogearbox.net>
  David S. Miller <davem@davemloft.net>
  Deren Wu <deren.wu@mediatek.com>
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>
  Eric Dumazet <edumazet@google.com>
  Florian Westphal <fw@strlen.de>
  Golan Ben Ami <golan.ben.ami@intel.com>
  Ido Schimmel <idosch@nvidia.com>
  Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
  j.nixdorf@avm.de <j.nixdorf@avm.de>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jakub Sitnicki <jakub@cloudflare.com>
  Jia-Ju Bai <baijiaju1990@gmail.com>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jiri Bohac <jbohac@suse.cz>
  Joe Stringer <joe@cilium.io>
  Johannes Berg <johannes.berg@intel.com>
  Johannes Nixdorf <j.nixdorf@avm.de>
  John Fastabend <john.fastabend@gmail.com>
  Jonathan Lemon <jonathan.lemon@gmail.com>
  Kai-Heng Feng <kai.heng.feng@canonical.com>
  Karsten Graul <kgraul@linux.ibm.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  lena wang <lena.wang@mediatek.com>
  Leon Romanovsky <leonro@nvidia.com>
  Lin Ma <linma@zju.edu.cn>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Coelho <luciano.coelho@intel.com>
  Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Marcel Holtmann <marcel@holtmann.org>
  Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
  Martin Habets <habetsm.xilinx@gmail.com>
  Mat Martineau <mathew.j.martineau@linux.intel.com>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Maurice Baijens <maurice.baijens@ellips.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Miguel Ojeda <ojeda@kernel.org>
  Naama Meir <naamax.meir@linux.intel.com>
  Nicolas Escande <nico.escande@gmail.com>
  Niels Dossche <dossche.niels@gmail.com>
  Oleksandr Natalenko <oleksandr@redhat.com>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Paul Blakey <paulb@nvidia.com>
  Paul Menzel <pmenzel@molgen.mpg.de> (Nokia N9 (MeeGo/Harmattan)
  Phani Burra <phani.r.burra@intel.com>
  Randy Dunlap <rdunlap@infradead.org>
  Remi Pommarel <repk@triplefau.lt>
  Richard Cochran <richardcochran@gmail.com>
  Rui Salvaterra <rsalvaterra@gmail.com>
  Sandeep Penigalapati <sandeep.penigalapati@intel.com>
  Sasha Neftin <sasha.neftin@intel.com>
  Sergio Paracuellos <sergio.paracuellos@gmail.com>
  Simon Wunderlich <sw@simonwunderlich.de>
  Slawomir Laba <slawomirx.laba@intel.com>
  Sreeramya Soratkal <quic_ssramya@quicinc.com>
  Steffen Klassert <steffen.klassert@secunet.com>
  Sukadev Bhattiprolu <sukadev@linux.ibm.com>
  Sven Eckelmann <sven@narfation.org>
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  Tony Lu <tonylu@linux.alibaba.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vincent Mailhol <mailhol.vincent@wanadoo.fr>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  Wang Qing <wangqing@vivo.com>
  Yan Yan <evitayan@google.com>
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
 test-armhf-armhf-xl-vhd                                      fail    


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
   5859a2b19911..b949c21fc23e  b949c21fc23ecaccef89582f251e6281cad1f81e -> tested/linux-linus


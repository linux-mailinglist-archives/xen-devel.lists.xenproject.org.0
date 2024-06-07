Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2BB8FF8BB
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 02:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736184.1142246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFNgj-0001QZ-57; Fri, 07 Jun 2024 00:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736184.1142246; Fri, 07 Jun 2024 00:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFNgi-0001OI-VO; Fri, 07 Jun 2024 00:42:36 +0000
Received: by outflank-mailman (input) for mailman id 736184;
 Fri, 07 Jun 2024 00:42:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFNgh-0001O8-OA; Fri, 07 Jun 2024 00:42:35 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFNgh-0007Xo-KC; Fri, 07 Jun 2024 00:42:35 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sFNgh-0001Rm-6n; Fri, 07 Jun 2024 00:42:35 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sFNgh-00046A-6K; Fri, 07 Jun 2024 00:42:35 +0000
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
	bh=U+WpC/eRlvGk9h2zrlJQeh9xOB1uqQ+n79rnIfQtiTM=; b=f1hKGV2dAJpkBCgizz72S1fidv
	IvweWKwHZMnz6FJ41EyAPTeECXknXCeeTD/EtbitpMVcXMDWPBqwNyxu5otEktwaHm6h/xNhB4tm9
	BxqP6EnRYaDfrgv+Gf+AHBag162CP32kIaZWanle4NkzqnPlYulw29KgArOmqjCWFoeU=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186268-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186268: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-libvirt:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-rtds:host-ping-check-xen:fail:allowable
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:xen-boot:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=d30d0e49da71de8df10bf3ff1b3de880653af562
X-Osstest-Versions-That:
    linux=2df0193e62cf887f373995fb8a91068562784adc
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 07 Jun 2024 00:42:35 +0000

flight 186268 linux-linus real [real]
flight 186269 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/186268/
http://logs.test-lab.xenproject.org/osstest/logs/186269/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-libvirt      8 xen-boot            fail pass in 186269-retest

Regressions which are regarded as allowable (not blocking):
 test-armhf-armhf-xl-rtds     10 host-ping-check-xen      fail REGR. vs. 186260

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-libvirt 16 saverestore-support-check fail in 186269 like 186260
 test-armhf-armhf-libvirt    15 migrate-support-check fail in 186269 never pass
 test-armhf-armhf-libvirt-vhd  8 xen-boot                     fail  like 186260
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186260
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186260
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186260
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186260
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186260
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                d30d0e49da71de8df10bf3ff1b3de880653af562
baseline version:
 linux                2df0193e62cf887f373995fb8a91068562784adc

Last test of basis   186260  2024-06-06 00:12:08 Z    1 days
Testing same since   186268  2024-06-06 17:10:36 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Aditya Kumar Singh <quic_adisi@quicinc.com>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alexei Starovoitov <ast@kernel.org>
  Alexis Lothoré <alexis.lothore@bootlin.com>
  Andrii Nakryiko <andrii@kernel.org>
  Antonio Quartulli <a@unstable.cc>
  Ard Biesheuvel <ardb@kernel.org>
  Ayala Beker <ayala.beker@intel.com>
  Baochen Qiang <quic_bqiang@quicinc.com>
  Benjamin Berg <benjamin.berg@intel.com>
  Bitterblue Smith <rtl8821cerfe2@gmail.com>
  Breno Leitao <leitao@debian.org>
  Carl Huang <quic_cjhuang@quicinc.com>
  Chandan Kumar Rout <chandanx.rout@intel.com>
  Chris Maness <christopher.maness@gmail.com>
  Cong Wang <cong.wang@bytedance.com>
  Dan Cross <crossd@gmail.com>
  Daniel Borkmann <daniel@iogearbox.net>
  David S. Miller <davem@davemloft.net>
  DelphineCCChiu <delphine_cc_chiu@wiwynn.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Dmitry Safonov <0x7f454c46@gmail.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>
  Eric Dumazet <edumazet@google.com>
  Frank Wunderlich <frank-w@public-files.de>
  Geliang Tang <geliang@kernel.org>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Hangbin Liu <liuhangbin@gmail.com>
  Hangyu Hua <hbh25y@gmail.com>
  Heng Qi <hengqi@linux.alibaba.com>
  Huacai Chen <chenhuacai@loongson.cn>
  Ilan Peer <ilan.peer@intel.com>
  Jacob Keller <jacob.e.keller@intel.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason Wang <jasowang@redhat.com>
  Jason Xing <kernelxing@tencent.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jiri Olsa <jolsa@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Kalle Valo <kvalo@kernel.org>
  Kalle Valo <quic_kvalo@quicinc.com>
  Karol Kolacinski <karol.kolacinski@intel.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lars Kellogg-Stedman <lars@oddbit.com>
  Larysa Zaremba <larysa.zaremba@intel.com>
  Lin Ma <linma@zju.edu.cn>
  Lingbo Kong <quic_lingbok@quicinc.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Luca Weiss <luca.weiss@fairphone.com>
  Magnus Karlsson <magnus.karlsson@intel.com>
  Matthias Stocker <mstocker@barracuda.com>
  Matthieu Baerts (NGI0) <matttbe@kernel.org>
  Michael S. Tsirkin <mst@redhat.com>
  Miri Korenblit <miriam.rachel.korenblit@intel.com>
  Mordechay Goodstein <mordechay.goodstein@intel.com>
  Moshe Shemesh <moshe@nvidia.com>
  Naama Meir <naamax.meir@linux.intel.com>
  Nathan Chancellor <nathan@kernel.org>
  Nicolas Escande <nico.escande@gmail.com>
  Paolo Abeni <pabeni@redhat.com>
  Paul Greenwalt <paul.greenwalt@intel.com>
  Peter Geis <pgwipeout@gmail.com>
  Ping-Ke Shih <pkshih@realtek.com>
  Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com>
  Remi Pommarel <repk@triplefau.lt>
  Richard Cochran <richardcochran@gmail.com>
  Sasha Neftin <sasha.neftin@intel.com>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  Sergey Ryazanov <ryazanov.s.a@gmail.com>
  Shahar S Matityahu <shahar.s.matityahu@intel.com>
  Shaul Triebitz <shaul.triebitz@intel.com>
  Shay Drory <shayd@nvidia.com>
  Simon Horman <horms@kernel.org>
  Su Hui <suhui@nfschina.com>
  Subbaraya Sundeep <sbhatta@marvell.com>
  Taehee Yoo <ap420073@gmail.com>
  Tariq Toukan <tariqt@nvidia.com>
  Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
  Thorsten Blum <thorsten.blum@toblux.com>
  Tristram Ha <tristram.ha@microchip.com>
  Vadim Fedorenko <vadfed@meta.com>
  Vinicius Costa Gomes <vinicius.gomes@intel.com>
  Wen Gu <guwen@linux.alibaba.com>
  Yedidya Benshimol <yedidya.ben.shimol@intel.com>

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
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-examine-bios                                pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     fail    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-libvirt-qcow2                               pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-xl-qcow2                                    pass    
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
   2df0193e62cf..d30d0e49da71  d30d0e49da71de8df10bf3ff1b3de880653af562 -> tested/linux-linus


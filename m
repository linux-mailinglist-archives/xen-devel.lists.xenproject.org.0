Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BA34EFD82
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 02:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297677.507161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naRsT-00007u-UC; Sat, 02 Apr 2022 00:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297677.507161; Sat, 02 Apr 2022 00:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naRsT-00005i-QI; Sat, 02 Apr 2022 00:44:29 +0000
Received: by outflank-mailman (input) for mailman id 297677;
 Sat, 02 Apr 2022 00:44:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1naRsS-00005X-0W; Sat, 02 Apr 2022 00:44:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1naRsR-0001rm-R4; Sat, 02 Apr 2022 00:44:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1naRsR-0000Yw-I5; Sat, 02 Apr 2022 00:44:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1naRsR-0004B4-Hb; Sat, 02 Apr 2022 00:44:27 +0000
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
	bh=oA6+EODHNKONrg4oUeW2WNZuIp9BfnQS7UFbDCaGfiY=; b=DfFumE1UZjZcc/oaUcUBhxo1pz
	b0zRmCtF7fZtfYEW0LWfy/KOITCmXZL4FlRQncI7XcscfPut8bTSTY/YP8lgWbJGMbDnG/IWJ4706
	Z3OH/H3gYiiIKo91Yas9Qnw6IcgYl7/YgY8qpqgKmP/+VIhzkFn7VomzMy7bF2T1kg04=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-169100-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 169100: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-libvirt-qcow2:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=e8b767f5e04097aaedcd6e06e2270f9fe5282696
X-Osstest-Versions-That:
    linux=787af64d05cd528aac9ad16752d11bb1c6061bb9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 02 Apr 2022 00:44:27 +0000

flight 169100 linux-linus real [real]
flight 169121 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/169100/
http://logs.test-lab.xenproject.org/osstest/logs/169121/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-libvirt-qcow2  8 xen-boot          fail pass in 169121-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check fail in 169121 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 169055
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 169055
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 169055
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 169055
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 169055
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 169055
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 169055
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 169055
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                e8b767f5e04097aaedcd6e06e2270f9fe5282696
baseline version:
 linux                787af64d05cd528aac9ad16752d11bb1c6061bb9

Last test of basis   169055  2022-03-31 02:32:32 Z    1 days
Testing same since   169100  2022-04-01 04:55:02 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Akira Yokosawa <akiyks@gmail.com>
  Alexander Lobakin <alexandr.lobakin@intel.com>
  Alexei Starovoitov <ast@kernel.org>
  Alistair Francis <alistair@alistair23.me>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Melnychenko <andrew@daynix.com>
  Andrew Price <anprice@redhat.com>
  Andrii Nakryiko <andrii@kernel.org>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anirudh Rayabharam <mail@anirudhrb.com>
  Anton Ivanov <anton.ivanov@cambridgegreys.com>
  Arnaldo Carvalho de Melo <acme@redhat.com>
  Baokun Li <libaokun1@huawei.com>
  Benjamin Beichler <benjamin.beichler@uni-rostock.de>
  Bhupesh Sharma <bhupesh.sharma@linaro.org>
  Bob Peterson <rpeterso@redhat.com>
  Borislav Petkov <bp@suse.de>
  Brendan Higgins <brendanhiggins@google.com>
  Changbin Du <changbin.du@gmail.com>
  Chris Packham <chris.packham@alliedtelesis.co.nz>
  Daniel Bristot de Oliveira <bristot@kernel.org>
  David Gow <davidgow@google.com>
  David Hildenbrand <david@redhat.com>
  David Howells <dhowells@redhat.com>
  Derek Will <derekrobertwill@gmail.com>
  Duoming Zhou <duoming@zju.edu.cn>
  Eduardo Valentin <eduval@amazon.com>
  Eduardo Valentin <evalenti@kernel.org>
  Eelco Chaudron <echaudro@redhat.com>
  Eli Cohen <elic@nvidia.com>
  Elliot Berman <quic_eberman@quicinc.com>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Frédéric Danis <frederic.danis@collabora.com>
  Gautam Dawar <gautam.dawar@xilinx.com>
  Gautam Dawar <gdawar@xilinx.com>
  Gavin Shan <gshan@redhat.com>
  Geert Uytterhoeven <geert+renesas@glider.be>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Geliang Tang <geliang.tang@suse.com>
  Glenn Washburn <development@efficientek.com>
  Guangbin Huang <huangguangbin2@huawei.com>
  Guenter Roeck <linux@roeck-us.net>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Hangyu Hua <hbh25y@gmail.com>
  Herbert Xu <herbert@gondor.apana.org.au>
  hongnanli <hongnan.li@linux.alibaba.com>
  Jakob Koschel <jakobkoschel@gmail.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Wang <jasowang@redhat.com>
  Jean Delvare <jdelvare@suse.de>
  Jeff Layton <jlayton@kernel.org>
  Jeff Layton <jlayton@redhat.com>
  Jeffle Xu <jefflexu@linux.alibaba.com>
  Jiri Olsa <jolsa@kernel.org>
  Johannes Berg <johannes.berg@intel.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Jonathan Corbet <corbet@lwn.net>
  Jonathan Lemon <jonathan.lemon@gmail.com>
  Kees Cook <keescook@chromium.org>
  Keir Fraser <keirf@google.com>
  KP Singh <kpsingh@kernel.org>
  lei he <helei.sig11@bytedance.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Longpeng &lt;<a href="mailto:longpeng2@huawei.com" target="_blank">longpeng2@huawei.com</a>&gt;<br>
  Longpeng &lt;<a href="mailto:longpeng2@huawei.com" target="_blank">longpeng2@huawei.com</a>&gt;<br></blockquote><div><br></div><div>Acked-by: Jason Wang &lt;<a href="mailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt;</div><div> </div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
  Longpeng <longpeng2@huawei.com>
  Maciej Fijalkowski <maciej.fijalkowski@intel.com>
  Magnus Karlsson <magnus.karlsson@intel.com>
  Marc Dionne <marc.dionne@auristor.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Martin Habets <habetsm.xilinx@gmail.com>
  Martin KaFai Lau <kafai@fb.com>
  Martin Varghese <martin.varghese@nokia.com>
  Masahiro Yamada <masahiroy@kernel.org>
  Masami Hiramatsu <mhiramat@kernel.org>
  Mauro Carvalho Chehab <mchehab@kernel.org>
  Miaohe Lin <linmiaohe@huawei.com>
  Miaoqian Lin <linmq006@gmail.com>
  Michael Kelley <mikelley@microsoft.com>
  Michael Qiu <qiudayu@archeros.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Walle <michael@walle.cc>
  Miguel Ojeda <ojeda@kernel.org>
  Milan Landaverde <milan@mdaverde.com>
  Nathan Chancellor <nathan@kernel.org>
  Nathan Chancellor <nathan@kernel.org> #Kconfig tweaks
  Oliver Hartkopp <socketcan@hartkopp.net>
  Paolo Abeni <pabeni@redhat.com>
  Pavel Skripkin <paskripkin@gmail.com>
  Peter Zijlstra (Intel) <peterz@infradead.org>
  Peter Zijlstra <peterz@infradead.org>
  Quentin Monnet <quentin@isovalent.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Rafał Miłecki <rafal@milecki.pl>
  Randy Dunlap <rdunlap@infradead.org>
  Richard Weinberger <richard@nod.at>
  Rob Herring <robh@kernel.org>
  Robert Richter <rrichter@amd.com>
  Roopa Prabhu <roopa@nvidia.com>
  Stefano Garzarella <sgarzare@redhat.com>
  Stephane Graber <stgraber@ubuntu.com>
  Stéphane Graber <stgraber@ubuntu.com>
  Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
  Terry Bowman <terry.bowman@amd.com>
  Thanh Quan <thanh.quan.xn@renesas.com>
  Tom Rix <trix@redhat.com>
  Vasant Hegde <vasant.hegde@amd.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vinod Koul <vkoul@kernel.org>
  Wang Hai <wanghai38@huawei.com>
  Wim Van Sebroeck <wim@linux-watchdog.org>
  Xiaolong Huang <butterflyhuangxx@gmail.com>
  Xuan Zhuo <xuanzhuo@linux.alibaba.com>
  Yang Li <yang.lee@linux.alibaba.com>
  Yonghong Song <yhs@fb.com>
  Yufeng Mo <moyufeng@huawei.com>
  Yuntao Wang <ytcoode@gmail.com>
  Zheng Yongjun <zhengyongjun3@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhihao Cheng <chengzhihao1@huawei.com>
  Zhu Lingshan <lingshan.zhu@intel.com>

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
 test-amd64-amd64-libvirt-qcow2                               fail    
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
   787af64d05cd..e8b767f5e040  e8b767f5e04097aaedcd6e06e2270f9fe5282696 -> tested/linux-linus


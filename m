Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8804F46F919
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 03:25:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243495.421271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvVaI-0000uZ-B9; Fri, 10 Dec 2021 02:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243495.421271; Fri, 10 Dec 2021 02:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvVaI-0000ri-6g; Fri, 10 Dec 2021 02:24:30 +0000
Received: by outflank-mailman (input) for mailman id 243495;
 Fri, 10 Dec 2021 02:24:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvVaG-0000rY-2v; Fri, 10 Dec 2021 02:24:28 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvVaF-00022j-Nw; Fri, 10 Dec 2021 02:24:27 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1mvVaF-00084S-Fu; Fri, 10 Dec 2021 02:24:27 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1mvVaF-0006sb-FP; Fri, 10 Dec 2021 02:24:27 +0000
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
	bh=ZcaARWtgwMDo6U3f0HAwWY9pd4k2ToF9jC6x49f3IA4=; b=FeyJTzNZA8rwzmC80AEVxShTHR
	u5R81+RW1gdzvWfRu/+aAqI+McPvxkaT1YqSq4nHdcxjjytnv7tq7OEw/ozUZ5Mf+BZS3MSdvNKC/
	wMDjbDRiRIudZPGZli2GBPX20hvWhpgNn8XizH9Fl35YrqY06R8FgCnFadR+ZyQatgXk=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-167287-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 167287: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=ded746bfc94398d2ee9de315a187677b207b2004
X-Osstest-Versions-That:
    linux=2a987e65025e2b79c6d453b78cb5985ac6e5eb26
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 10 Dec 2021 02:24:27 +0000

flight 167287 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/167287/

Failures :-/ but no regressions.

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 167229
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 167229
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 167229
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 167229
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 167229
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 167229
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 167229
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 167229
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                ded746bfc94398d2ee9de315a187677b207b2004
baseline version:
 linux                2a987e65025e2b79c6d453b78cb5985ac6e5eb26

Last test of basis   167229  2021-12-08 05:58:09 Z    1 days
Testing same since   167287  2021-12-09 19:40:01 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Alexander Potapenko <glider@google.com>
  Alexei Starovoitov <ast@kernel.org>
  Alok Prasad <palok@marvell.com>
  Ameer Hamza <amhamza.mgc@gmail.com>
  Andrea Mayer <andrea.mayer@uniroma2.it>
  Andrii Nakryiko <andrii@kernel.org>
  Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
  Antoine Tenart <atenart@kernel.org>
  Ariel Elior <aelior@marvell.com>
  Benjamin Tissoires <benjamin.tissoires@redhat.com>
  Bindushree P <Bindushree.p@intel.com>
  Björn Töpel <bjorn@kernel.org>
  Brian Silverman <brian.silverman@bluerivertech.com>
  Cai Huoqing <caihuoqing@baidu.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Borkmann <daniel@iogearbox.net>
  Dave Ertman <david.m.ertman@intel.com>
  David Ahern <dsahern@kernel.org>
  David Howells <dhowells@redhat.com>
  David S. Miller <davem@davemloft.net>
  Davide Caratti <dcaratti@redhat.com>
  Emmanuel Deloget <emmanuel.deloget@eho.link>
  Eric Dumazet <edumazet@google.com>
  Florian Fainelli <f.fainelli@gmail.com>
  Florian Westphal <fw@strlen.de>
  George Kuruvinakunnel <george.kuruvinakunnel@intel.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Grzegorz Szczurek <grzegorzx.szczurek@intel.com>
  Guolin Yang <gyang@vmware.com>
  Gurucharan G <gurucharanx.g@intel.com>
  Hans de Goede <hdegoede@redhat.com>
  Herve Codina <herve.codina@bootlin.com>
  Jakub Kicinski <kuba@kernel.org>
  Jamal Hadi Salim <jhs@mojatatu.com>
  Jani Nikula <jani.nikula@intel.com>
  Jarkko Nikula <jarkko.nikula@linux.intel.com>
  Jeff Layton <jlayton@kernel.org>
  Jeffle Xu <jefflexu@linux.alibaba.com>
  Jesper Dangaard Brouer <brouer@redhat.com>
  Jesse Brandeburg <jesse.brandeburg@intel.com>
  Jianglei Nie <niejianglei2021@163.com>
  Jianguo Wu <wujianguo@chinatelecom.cn>
  Jiasheng Jiang <jiasheng@iscas.ac.cn>
  Jimmy Assarsson <extja@kvaser.com>
  Jiri Kosina <jkosina@suse.cz>
  Jiri Pirko <jiri@nvidia.com>
  Joakim Zhang <qiangqing.zhang@nxp.com>
  Johan Almbladh <johan.almbladh@anyfinetworks.com>
  John Fastabend <john.fastabend@gmail.com>
  Jon Hunter <jonathanh@nvidia.com>
  José Expósito <jose.exposito89@gmail.com>
  Julian Wiedmann <jwi@linux.ibm.com>
  Karen Sornek <karen.sornek@intel.com>
  Konrad Jankowski <konrad0.jankowski@intel.com>
  Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Krzysztof Wilczyński <kw@linux.com>
  Kumar Kartikeya Dwivedi <memxor@gmail.com>
  Kuniyuki Iwashima <kuniyu@amazon.co.jp>
  Lee Jones <lee.jones@linaro.org>
  Li Zhijian <zhijianx.li@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Louis Amas <louis.amas@eho.link>
  M Chetan Kumar <m.chetan.kumar@linux.intel.com>
  Maarten Zanders <maarten.zanders@mind.be>
  Manish Chopra <manishc@marvell.com>
  Marc Kleine-Budde <mkl@pengutronix.de>
  Martyn Welch <martyn.welch@collabora.com>
  Mateusz Palczewski <mateusz.palczewski@intel.com>
  Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
  Maxim Mikityanskiy <maximmi@nvidia.com>
  Michal Maloszewski <michal.maloszewski@intel.com>
  Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
  Miquel Raynal <miquel.raynal@bootlin.com>
  Mitch Williams <mitch.a.williams@intel.com>
  Nicolas Dichtel <nicolas.dichtel@6wind.com>
  Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
  Norbert Zulinski <norbertx.zulinski@intel.com>
  Oliver Hartkopp <socketcan@hartkopp.net>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paul Greenwalt <paul.greenwalt@intel.com>
  Peilin Ye <peilin.ye@bytedance.com>
  Peter Chen <peter.chen@kernel.org>
  Petr Machata <petrm@nvidia.com>
  Prabhakar Kushwaha <pkushwaha@marvell.com>
  Ronak Doshi <doshir@vmware.com>
  Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Russell King <rmk+kernel@armlinux.org.uk>
  Sandeep Penigalapati <sandeep.penigalapati@intel.com>
  Sasha Levin <sashal@kernel.org>
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  SeongJae Park <sj@kernel.org>
  Simon Horman <simon.horman@corigine.com>
  Song Liu <songliubraving@fb.com>
  Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
  Stefano Brivio <sbrivio@redhat.com>
  Sylwester Dziedziuch <sylwesterx.dziedziuch@intel.com>
  Tadeusz Struk <tadeusz.struk@linaro.org>
  Thomas Weißschuh <linux@weissschuh.net>
  Tony Brelinski <tony.brelinski@intel.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Vadim Fedorenko <vfedorenko@novek.ru>
  Vincent Mailhol <mailhol.vincent@wanadoo.fr>
  xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
  Yahui Cao <yahui.cao@intel.com>
  Yanteng Si <siyanteng01@gmail.com>
  Yanteng Si <siyanteng@loongson.cn>

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
   2a987e65025e..ded746bfc943  ded746bfc94398d2ee9de315a187677b207b2004 -> tested/linux-linus


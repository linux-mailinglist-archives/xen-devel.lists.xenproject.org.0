Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01899930BFE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 00:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758645.1168056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sT7xU-0007zk-OC; Sun, 14 Jul 2024 22:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758645.1168056; Sun, 14 Jul 2024 22:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sT7xU-0007xF-LH; Sun, 14 Jul 2024 22:44:44 +0000
Received: by outflank-mailman (input) for mailman id 758645;
 Sun, 14 Jul 2024 22:44:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sT7xT-0007x5-Ca; Sun, 14 Jul 2024 22:44:43 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sT7xT-0001Fp-0q; Sun, 14 Jul 2024 22:44:43 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1sT7xS-0006Lj-J2; Sun, 14 Jul 2024 22:44:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1sT7xS-0005M6-IV; Sun, 14 Jul 2024 22:44:42 +0000
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
	bh=Hwpeqqud4qkL3QtWKTZoC0UxKjpn3yyuWfNrv69UgTw=; b=dZyOXIVvuW6PAmMjmlIK4Z/7BW
	T8ubzt8O3DsIGd+Kvqh+r4lXL0aXGN3nTIbZYIf0NzUO9EAQtgWpyIVgG/xROIi5rV6ySf9CBmm6i
	JlDUJ1T8J4csItUbuojnqT4uyrS6SOvfjL0ARIaMHhntdIzgPOci/dfhaFjAw314w5Wo=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-186798-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 186798: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-credit2:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:heisenbug
    linux-linus:test-armhf-armhf-examine:reboot:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-multivcpu:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemut-debianhvm-i386-xsm:debian-hvm-install:fail:heisenbug
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=4d145e3f830ba2c2745b42bfba5c2f8fcb8d078a
X-Osstest-Versions-That:
    linux=9d9a2f29aefdadc86e450308ff056017a209c755
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 14 Jul 2024 22:44:42 +0000

flight 186798 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/186798/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-armhf-armhf-xl-credit2   8 xen-boot         fail in 186796 pass in 186798
 test-armhf-armhf-xl-credit1   8 xen-boot                   fail pass in 186796
 test-armhf-armhf-examine      8 reboot                     fail pass in 186796
 test-armhf-armhf-xl-multivcpu  8 xen-boot                  fail pass in 186796
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 186796

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-credit1 15 migrate-support-check fail in 186796 never pass
 test-armhf-armhf-xl-credit1 16 saverestore-support-check fail in 186796 never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check fail in 186796 never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check fail in 186796 never pass
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 186761
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 186761
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 186761
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 186761
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 186761
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 186761
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-qcow2    15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-vhd 15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-raw      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-raw      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                4d145e3f830ba2c2745b42bfba5c2f8fcb8d078a
baseline version:
 linux                9d9a2f29aefdadc86e450308ff056017a209c755

Last test of basis   186761  2024-07-11 05:47:53 Z    3 days
Failing since        186766  2024-07-11 19:40:24 Z    3 days    8 attempts
Testing same since   186796  2024-07-14 08:06:59 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Chen, Jian Jun" <jian.jun.chen@intel.com>
  Aaro Koskinen <aaro.koskinen@iki.fi>
  Abel Vesa <abel.vesa@linaro.org>
  Adrian Hunter <adrian.hunter@intel.com>
  Alan Stern <stern@rowland.harvard.edu>
  Aleksander Jan Bajkowski <olek2@wp.pl>
  Aleksandr Loktionov <aleksandr.loktionov@intel.com>
  Aleksandr Mishin <amishin@t-argos.ru>
  Alexei Starovoitov <ast@kernel.org>
  Andi Shyti <andi.shyti@kernel.org>
  Andre Przywara <andre.przywara@arm.com>
  Arnd Bergmann <arnd@arndb.de>
  Baokun Li <libaokun1@huawei.com>
  Bard Liao <yung-chuan.liao@linux.intel.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Bastien Curutchet <bastien.curutchet@bootlin.com>
  Bjorn Andersson <andersson@kernel.org>
  Bjorn Andersson <quic_bjorande@quicinc.com>
  Bjørn Mork <bjorn@mork.no>
  Brian Foster <bfoster@redhat.com>
  Bruce Johnston <bjohnsto@redhat.com>
  Caleb Connolly <caleb.connolly@linaro.org>
  Chandan Kumar Rout <chandanx.rout@intel.com> (A Contingent Worker at Intel)
  Chen Ni <nichen@iscas.ac.cn>
  Chen-Yu Tsai <wens@csie.org>
  Chengen Du <chengen.du@canonical.com>
  Chris Packham <chris.packham@alliedtelesis.co.nz>
  Christian Brauner <brauner@kernel.org>
  Christian Eggers <ceggers@arri.de>
  Christian Kujau <lists@nerdbynature.de>
  Christophe Leroy <christophe.leroy@csgroup.eu>
  Chunyan Zhang <zhangchunyan@iscas.ac.cn>
  Cong Zhang <quic_congzhan@quicinc.com>
  Dan Carpenter <dan.carpenter@linaro.org>
  Daniel Borkmann <daniel@iogearbox.net>
  Daniele Palmas <dnlplm@gmail.com>
  David Lechner <dlechner@baylibre.com>
  David S. Miller <davem@davemloft.net>
  David Sterba <dsterba@suse.com>
  Dmitry Antipov <dmantipov@yandex.ru>
  Dmitry Savin <envelsavinds@gmail.com>
  Dmitry Smirnov <d.smirnov@inbox.lv>
  Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
  Edward Adam Davis <eadavis@qq.com>
  Ekansh Gupta <quic_ekangupt@quicinc.com>
  Eric Dumazet <edumazet@google.com>
  Filipe Manana <fdmanana@suse.com>
  Florian Westphal <fw@strlen.de>
  Geliang Tang <tanggeliang@kylinos.cn>
  Gerald Yang <gerald.yang@canonical.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  He Zhe <zhe.he@windriver.com>
  Heikki Krogerus <heikki.krogerus@linux.intel.com>
  Helge Deller <deller@gmx.de>
  Helge Deller <deller@kernel.org>
  Hou Tao <houtao1@huawei.com>
  Hugh Dickins <hughd@google.com>
  Ian Kent <ikent@redhat.com>
  Ilya Dryomov <idryomov@gmail.com>
  Jacky Huang <ychuang3@nuvoton.com>
  Jakub Kicinski <kuba@kernel.org>
  Jason A. Donenfeld <Jason@zx2c4.com>
  Jason Chen <jason.z.chen@intel.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jeff Johnson <quic_jjohnson@quicinc.com>
  Jeff Layton <jlayton@kernel.org>
  Jian Hui Lee <jianhui.lee@canonical.com>
  Jingbo Xu <jefflexu@linux.alibaba.com>
  jinxiaobo <jinxiaobo@uniontech.com>
  Johan Hovold <johan+linaro@kernel.org>
  Johan Hovold <johan@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Joy Chakraborty <joychakr@google.com>
  João Paulo Gonçalves <joao.goncalves@toradex.com>
  Kai Vehmanen <kai.vehmanen@linux.intel.com>
  Kelvin Kang <kelvin.kang@intel.com>
  Kent Overstreet <kent.overstreet@linux.dev>
  Kevin Hilman <khilman@baylibre.com>
  Kiran Kumar K <kirankumark@marvell.com>
  Komal Bajaj <quic_kbajaj@quicinc.com>
  Konrad Dybcio <konrad.dybcio@linaro.org>
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Kumar Kartikeya Dwivedi <memxor@gmail.com>
  Kuniyuki Iwashima <kuniyu@amazon.com>
  Lee Jones <lee@kernel.org>
  Lex Siegel <usiegl00@gmail.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Mank Wang <mank.wang@netprisma.us>
  Mark Brown <broonie@kernel.org>
  Martin KaFai Lau <martin.lau@kernel.org>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthew Sakai <msakai@redhat.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Michael Chan <michael.chan@broadcom.com>
  Michal Kubiak <michal.kubiak@intel.com>
  Michal Mazur <mmazur2@marvell.com>
  Michał Kopeć <michal.kopec@3mdeb.com>
  Mikulas Patocka <mpatocka@redhat.com>
  Mohammad Shehar Yaar Tausif <sheharyaar48@gmail.com>
  Mor Bar-Gabay <morx.bar.gabay@intel.com> (A Contingent Worker at Intel)
  Mudit Sharma <muditsharma.info@gmail.com>
  Nazar Bilinskyi <nbilinskyi@gmail.com>
  Neal Cardwell <ncardwell@google.com>
  Nithin Dabilpuram <ndabilpuram@marvell.com>
  Oleksij Rempel <o.rempel@pengutronix.de>
  Pablo Neira Ayuso <pablo@netfilter.org>
  Paolo Abeni <pabeni@redhat.com>
  Pedro Pinto <xten@osec.io>
  Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  Rasmus Villemoes <linux@rasmusvillemoes.dk>
  Remi Pommarel <repk@triplefau.lt>
  Richard Fitzgerald <rf@opensource.cirrus.com>
  Roger Quadros <rogerq@kernel.org>
  Ronald Wahl <ronald.wahl@raritan.com>
  Saeed Mahameed <saeedm@nvidia.com>
  Sakari Ailus <sakari.ailus@linux.intel.com>
  Satheesh Paul <psatheesh@marvell.com>
  Shuming Fan <shumingf@realtek.com>
  Slark Xiao <slark_xiao@163.com>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Srujana Challa <schalla@marvell.com>
  Steev Klimaszewski <steev@kali.org>
  Stefan Eichenberger <stefan.eichenberger@toradex.com>
  Steve French <stfrench@microsoft.com>
  Takashi Iwai <tiwai@suse.de>
  Taniya Das <quic_tdas@quicinc.com>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Weißschuh <linux@weissschuh.net>
  Tomas Winker <tomas.winker@intel.com>
  Tony Brelinski <tony.brelinski@intel.com>
  Tony Lindgren <tony@atomide.com>
  Tony Nguyen <anthony.l.nguyen@intel.com>
  Udit Kumar <u-kumar1@ti.com>
  Ulf Hansson <ulf.hansson@linaro.org>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Uwe Kleine-König <ukleinek@kernel.org>
  Vanillan Wang <vanillanwang@163.com>
  Viresh Kumar <viresh.kumar@linaro.org>
  Vitaly Lifshits <vitaly.lifshits@intel.com>
  Vlastimil Babka <vbabka@suse.cz>
  WangYuli <wangyuli@uniontech.com>
  Wentong Wu <wentong.wu@intel.com>
  Wolfram Sang <wsa+renesas@sang-engineering.com>

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
 test-armhf-armhf-xl-arndale                                  pass    
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
 test-armhf-armhf-xl-multivcpu                                fail    
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
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-libvirt-vhd                                 pass    
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
   9d9a2f29aefd..4d145e3f830b  4d145e3f830ba2c2745b42bfba5c2f8fcb8d078a -> tested/linux-linus


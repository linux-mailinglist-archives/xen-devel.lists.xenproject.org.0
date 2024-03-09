Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A462876F6A
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 07:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690517.1076582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riqVd-0007a7-NR; Sat, 09 Mar 2024 06:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690517.1076582; Sat, 09 Mar 2024 06:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riqVd-0007YZ-KD; Sat, 09 Mar 2024 06:48:41 +0000
Received: by outflank-mailman (input) for mailman id 690517;
 Sat, 09 Mar 2024 06:48:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1riqVc-0007YP-HJ; Sat, 09 Mar 2024 06:48:40 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1riqVc-0003jP-Dx; Sat, 09 Mar 2024 06:48:40 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1riqVc-0000Mh-2s; Sat, 09 Mar 2024 06:48:40 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1riqVc-0006WF-2S; Sat, 09 Mar 2024 06:48:40 +0000
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
	bh=aDYFS242V4NI7+0OScDaCqs/YCJtxiT+94E8T8RZHls=; b=3gKAAQD/HTOpHXHvAB3pdUvVwj
	Q/jdytWPQwiH5sayAODDd7Zc0AgHWRy1wgKj/Tw+XVA1/0g5ZIWITAhTKB4N9NRuwP++38RocS0Wq
	EQ7Ap5ecQWVZ3anO+KLOtObHhH2AZ3tnyig2gYGin90b1BOBrAHQwoqjhnrSa6hJfLPE=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-184961-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 184961: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-armhf-armhf-xl-credit1:xen-boot:fail:regression
    linux-linus:build-arm64-pvops:kernel-build:fail:regression
    linux-linus:test-arm64-arm64-examine:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:build-check(1):blocked:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=10d48d70e82d7d19eb9157fdb599bfce4a5768bc
X-Osstest-Versions-That:
    linux=3aaa8ce7a3350d95b241046ae2401103a4384ba2
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 09 Mar 2024 06:48:40 +0000

flight 184961 linux-linus real [real]
http://logs.test-lab.xenproject.org/osstest/logs/184961/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 184942
 build-arm64-pvops             6 kernel-build             fail REGR. vs. 184942

Tests which did not succeed, but are not blocking:
 test-arm64-arm64-examine      1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-raw  1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-vhd       1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184942
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184942
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184942
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184942
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184942
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184942
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184942
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184942
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass

version targeted for testing:
 linux                10d48d70e82d7d19eb9157fdb599bfce4a5768bc
baseline version:
 linux                3aaa8ce7a3350d95b241046ae2401103a4384ba2

Last test of basis   184942  2024-03-08 07:27:45 Z    0 days
Testing same since   184961  2024-03-09 00:14:58 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  Al Raj Hassain <alrajhassain@gmail.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alban Boyé <alban.boye@protonmail.com>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Usyskin <alexander.usyskin@intel.com>
  Andi Shyti <andi.shyti@linux.intel.com>
  Andreas Pape <Andreas.Pape4@bosch.com>
  Andy Chi <andy.chi@canonical.com>
  Angel Iglesias <ang.iglesiasg@gmail.com>
  Animesh Manna <animesh.manna@intel.com>
  Ankit Nautiyal <ankit.k.nautiyal@intel.com>
  Antonio Borneo <antonio.borneo@foss.st.com>
  Badhri Jagan Sridharan <badhri@google.com>
  Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Chris Yokum <linux-usb@mail.totalphase.com>
  Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Cong Yang <yangcong5@huaqin.corp-partner.google.com>
  Cosmin Tanislav <demonsingur@gmail.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Dave Airlie <airlied@redhat.com>
  Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Douglas Anderson <dianders@chromium.org>
  Ekansh Gupta <quic_ekangupt@quicinc.com>
  Eugeniu Rosca <eugeniu.rosca@bosch.com>
  Frej Drejhammar <frej.drejhammar@gmail.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Hans de Goede <hdegoede@redhat.com>
  Ian Abbott <abbotti@mev.co.uk>
  Imre Deak <imre.deak@intel.com>
  Jani Nikula <jani.nikula@intel.com>
  Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
  Javier Carrasco <javier.carrasco.cruz@gmail.com>
  Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
  Jiri Slaby <jirislaby@kernel.org>
  Johan Hovold <johan+linaro@kernel.org>
  Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
  Kailang Yang <kailang@realtek.com>
  Karol Herbst <kherbst@redhat.com>
  Kees Cook <keescook@chromium.org>
  Krishna Kurapati <quic_kriskura@quicinc.com>
  Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Li Ma <li.ma@amd.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linus Walleij <linus.walleij@linaro.org>
  Ma Jun <Jun.Ma2@amd.com>
  Mano Ségransan <mano.segransan@protonmail.com>
  Mark Brown <broonie@kernel.org>
  Mathias Krause <minipli@grsecurity.net>
  Mathias Nyman <mathias.nyman@linux.intel.com>
  Matthew Auld <matthew.auld@intel.com>
  Max Nguyen <maxwell.nguyen@hp.com>
  Maxime Ripard <mripard@kernel.org>
  Maxime Ripard <mripard@redhat.com>
  Melissa Wen <mwen@igalia.com>
  Mika Westerberg <mika.westerberg@linux.intel.com>
  Neil Armstrong <neil.armstrong@linaro.org>
  Nicolas Pitre <nico@fluxnic.net>
  Nirmoy Das <nirmoy.das@intel.com>
  Nuno Sa <nuno.sa@analog.com>
  Paul Menzel <pmenzel@molgen.mpg.de>
  Paul Menzel <pmenzel@molgen.mpg.de> # Dell XPS 15 7590
  Peter Collingbourne <pcc@google.com>
  Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
  RD Babiera <rdbabiera@google.com>
  Rickard x Andersson <rickaran@axis.com>
  Rob Herring <robh@kernel.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Sherry Sun <sherry.sun@nxp.com>
  songxiebing <songxiebing@kylinos.cn>
  Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  Stefan Binding <sbinding@opensource.cirrus.com>
  Stuart Henderson <stuarth@opensource.cirrus.com>
  Suraj Kandpal <suraj.kandpal@intel.com>
  Takashi Iwai <tiwai@suse.de>
  Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
  Thomas Hellström <thomas.hellstrom@linux.intel.com>
  Thomas Zimmermann <tzimmermann@suse.de>
  Tomas Winkler <tomas.winkler@intel.com>
  Tvrtko Ursulin <tvrtko.ursulin@intel.com>
  Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Vasileios Amoiridis <vassilisamir@gmail.com>
  Ville Syrjälä <ville.syrjala@linux.intel.com>
  Wentong Wu <wentong.wu@intel.com>
  William Breathitt Gray <william.gray@linaro.org>
  Yeswanth Rayapati <yeswanth.rayapati@in.bosch.com>
  Yicong Yang <yangyicong@hisilicon.com>

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
 build-arm64-pvops                                            fail    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      blocked 
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
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  fail    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     blocked 
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
 test-arm64-arm64-libvirt-raw                                 blocked 
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-examine-uefi                                pass    
 test-amd64-amd64-xl-vhd                                      pass    
 test-arm64-arm64-xl-vhd                                      blocked 
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


Not pushing.

(No revision log; it would be 2183 lines long.)


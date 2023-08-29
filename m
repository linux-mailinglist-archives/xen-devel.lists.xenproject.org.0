Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9930778C0B6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 10:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592053.924680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qauLD-0002eI-32; Tue, 29 Aug 2023 08:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592053.924680; Tue, 29 Aug 2023 08:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qauLD-0002bl-0F; Tue, 29 Aug 2023 08:44:51 +0000
Received: by outflank-mailman (input) for mailman id 592053;
 Tue, 29 Aug 2023 08:44:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qauLB-0002bb-FN; Tue, 29 Aug 2023 08:44:49 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qauLB-00057W-7i; Tue, 29 Aug 2023 08:44:49 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1qauLA-00046L-Mx; Tue, 29 Aug 2023 08:44:48 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1qauLA-0005p5-MX; Tue, 29 Aug 2023 08:44:48 +0000
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
	bh=RMVex1w+hWiIZ5wP+0MntmrHs61f3/rmDmX9g3gZdy8=; b=L/2jkXRFSCxSX257VXBOL/EnH/
	M3R3Essu5fNnOHY22JgHCQXajpk4gZOs0Yw/+/7FFXmyMdonkVYAkQyT5nTIXgR5sksn+IPl2/MoZ
	q7Pt1Yg8hYx0OdeYL4V0fz/F2gETVdkS85IaLlZmvlQzYnKNdgTqSE3uvdN8vBcNnuI8=;
To: xen-devel@lists.xenproject.org
Message-ID: <osstest-182544-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-linus test] 182544: regressions - FAIL
X-Osstest-Failures:
    linux-linus:test-amd64-amd64-freebsd12-amd64:guest-localmigrate/x10:fail:regression
    linux-linus:test-amd64-amd64-freebsd12-amd64:xen-boot:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-credit2:guest-localmigrate/x10:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:windows-install:fail:heisenbug
    linux-linus:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-qcow2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-linus:test-amd64-amd64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-arm64-arm64-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
    linux-linus:test-armhf-armhf-libvirt-qcow2:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=727dbda16b83600379061c4ca8270ef3e2f51922
X-Osstest-Versions-That:
    linux=2dde18cd1d8fac735875f2e4987f11817cc0bc2c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 29 Aug 2023 08:44:48 +0000

flight 182544 linux-linus real [real]
flight 182552 linux-linus real-retest [real]
http://logs.test-lab.xenproject.org/osstest/logs/182544/
http://logs.test-lab.xenproject.org/osstest/logs/182552/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-amd64-amd64-freebsd12-amd64 19 guest-localmigrate/x10 fail REGR. vs. 182531

Tests which are failing intermittently (not blocking):
 test-amd64-amd64-freebsd12-amd64  8 xen-boot     fail in 182552 pass in 182544
 test-amd64-amd64-xl-credit2 20 guest-localmigrate/x10 fail pass in 182552-retest
 test-amd64-amd64-xl-qemuu-win7-amd64 12 windows-install fail pass in 182552-retest

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop  fail in 182552 like 182531
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 182531
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 182531
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 182531
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 182531
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 182531
 test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 182531
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 182531
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
 test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass

version targeted for testing:
 linux                727dbda16b83600379061c4ca8270ef3e2f51922
baseline version:
 linux                2dde18cd1d8fac735875f2e4987f11817cc0bc2c

Last test of basis   182531  2023-08-27 22:41:14 Z    1 days
Testing same since   182544  2023-08-28 20:42:13 Z    0 days    1 attempts

------------------------------------------------------------
People who touched revisions under test:
  "Christian Brauner (Microsoft)" <brauner@kernel.org>
  "Darrick J. Wong" <djwong@kernel.org>
  "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
  "Guilherme G. Piccoli" <gpiccoli@igalia.com> # Steam Deck
  "Gustavo A. R. Silva" <gustavoars@kernel.org>
  "Matthew Wilcox (Oracle)" <willy@infradead.org>
  "Peter Zijlstra (Intel)" <peterz@infradead.org>
  "Steven Rostedt (Google)" <rostedt@goodmis.org>
  Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>
  Aleksa Sarai <cyphar@cyphar.com>
  Alexander Gordeev <agordeev@linux.ibm.com>
  Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
  Alexey Gladkov <legion@kernel.org>
  Alexey Khoroshilov <khoroshilov@ispras.ru>
  Amir Goldstein <amir73il@gmail.com>
  Anand Jain <anand.jain@oracle.com>
  Anders Larsen <al@alarsen.net>
  Andrei Vagin <avagin@google.com>
  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Anh Tuan Phan <tuananhlfc@gmail.com>
  Anton Ivanov <anton.ivanov@cambridgegreys.com>
  Ard Biesheuvel <ardb@kernel.org>
  Arnd Bergmann <arnd@arndb.de>
  Azeem Shaikh <azeemshaikh38@gmail.com>
  Bob Copeland <me@bobcopeland.com>
  Boris Burkov <boris@bur.io>
  butt3rflyh4ck <butterflyhuangxx@gmail.com>
  Carlos Maiolino <cem@kernel.org>
  Carlos Maiolino <cmaiolino@redhat.com>
  Casey Schaufler <casey@schaufler-ca.com>
  Christian Brauner <brauner@kernel.org>
  Christoph Hellwig <hch@lst.de>
  Chuck Lever <chuck.lever@oracle.com>
  Colin Ian King <colin.i.king@gmail.com>
  Damien Le Moal <dlemoal@kernel.org>
  Darrick J. Wong <djwong@kernel.org>
  Dave Kleikamp <dave.kleikamp@oracle.com>
  David Howells <dhowells@redhat.com>
  David Sterba <dsterba@suse.com>
  Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
  Edward Shishkin <edward.shishkin@gmail.com>
  Elena Reshetova <elena.reshetova@intel.com>
  Enlin Mu <enlin.mu@unisoc.com>
  Eric Biggers <ebiggers@google.com>
  Fabio M. De Francesco <fmdefrancesco@gmail.com>
  Fedor Pchelkin <pchelkin@ispras.ru>
  Ferry Meng <mengferry@linux.alibaba.com>
  Filipe Manana <fdmanana@suse.com>
  Frederic Weisbecker <frederic@kernel.org>
  Gao Xiang <hsiangkao@linux.alibaba.com>
  Gao Xiang <xiang@kernel.org>
  Geert Uytterhoeven <geert@linux-m68k.org>
  Goldwyn Rodrigues <rgoldwyn@suse.com>
  Goldwyn Rodrigues <rgoldwyn@suse.de>
  GONG, Ruiqi <gongruiqi1@huawei.com>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Guilherme G. Piccoli <gpiccoli@igalia.com>
  Gustavo A. R. Silva <gustavoars@kernel.org>
  Hugh Dickins <hughd@google.com>
  Ian Kent <raven@themaw.net>
  Jakub Wilk <jwilk@jwilk.net>
  Jan Kara <jack@suse.cz>
  Jann Horn <jannh@google.com>
  Jarkko Sakkinen <jarkko@kernel.org>
  Jeff Layton <jlayton@kernel.org>
  Jens Axboe <axboe@kernel.dk>
  Jeremy Kerr <jk@ozlabs.org>
  Jingbo Xu <jefflexu@linux.alibaba.com>
  Joel Becker <jlbec@evilplan.org>
  John Johansen <john.johansen@canonical.com>
  Josef Bacik <josef@toxicpanda.com>
  Joseph Qi <joseph.qi@linux.alibaba.com>
  Julia Lawall <Julia.Lawall@inria.fr>
  Justin Stitt <justinstitt@google.com>
  Kees Cook <keescook@chromium.org>
  Kent Overstreet <kent.overstreet@linux.dev>
  Lee Trager <lee@trager.us>
  Linus Torvalds <torvalds@linux-foundation.org>
  Loic Poulain <loic.poulain@linaro.org>
  Luca Vizzarro <Luca.Vizzarro@arm.com>
  Luis Chamberlain <mcgrof@kernel.org>
  Lukas Czerner <lczerner@redhat.com>
  Marcelo Tosatti <mtosatti@redhat.com>
  Marco Elver <elver@google.com>
  Mark Rutland <mark.rutland@arm.com>
  Mateusz Guzik <mjguzik@gmail.com>
  Matthew Wilcox (Oracle) <willy@infradead.org>
  Matthew Wilcox <willy@infradead.org>
  Miguel Ojeda <ojeda@kernel.org>
  Mike Kravetz <mike.kravetz@oracle.com>
  Mimi Zohar <zohar@linux.ibm.com>
  Minjie Du <duminjie@vivo.com>
  Muhammad Usama Anjum <usama.anjum@collabora.com>
  Naohiro Aota <naohiro.aota@wdc.com>
  Nicolas Pitre <nico@fluxnic.net>
  OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
  Palmer Dabbelt <palmer@sifive.com>
  Paul Moore <paul@paul-moore.com>
  Peter Oskolkov <posk@google.com>
  Qu Wenruo <wqu@suse.com>
  Ritesh Harjani (IBM) <ritesh.list@gmail.com>
  Ruan Jinjie <ruanjinjie@huawei.com>
  Ryusuke Konishi <konishi.ryusuke@gmail.com>
  Stas Sergeev <stsp2@yandex.ru>
  Steve French <stfrench@microsoft.com>
  sunshijie <sunshijie@xiaomi.com>
  Theodore Ts'o <tytso@mit.edu>
  Thomas Weißschuh <linux@weissschuh.net>
  Tom Talpey <tom@talpey.com>
  Wang Ming <machel@vivo.com>
  Wen Yang <wenyang.linux@foxmail.com>
  Will Shiu <Will.Shiu@mediatek.com>
  Willy Tarreau <w@1wt.eu>
  Yang Li <yang.lee@linux.alibaba.com>
  Yonghong Song <yonghong.song@linux.dev>
  Yuxiao Zhang <yuxiaozhang@google.com>
  Zhangjin Wu <falcon@tinylab.org>
  Zhen Lei <thunder.leizhen@huawei.com>
  Zhu Wang <wangzhu9@huawei.com>

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
 test-amd64-amd64-freebsd12-amd64                             fail    
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
 test-amd64-amd64-xl-credit2                                  fail    
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


Not pushing.

(No revision log; it would be 10599 lines long.)


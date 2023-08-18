Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A818780E43
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 16:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586369.917595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX0ku-0004BX-LK; Fri, 18 Aug 2023 14:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586369.917595; Fri, 18 Aug 2023 14:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX0ku-00048q-Ho; Fri, 18 Aug 2023 14:47:16 +0000
Received: by outflank-mailman (input) for mailman id 586369;
 Fri, 18 Aug 2023 14:47:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qX0ks-00048W-KZ
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 14:47:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qX0kr-0003gI-IB; Fri, 18 Aug 2023 14:47:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qX0kr-0004me-7W; Fri, 18 Aug 2023 14:47:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=/rlYdzE/U93wtK531F8XJ5d1qfa2PipvGOsUOQ2P0sQ=; b=m+Hi93KrKm0mv9ZliQdrQmoSfp
	OHJsGAWiOF8KRYOdvCGRpCIXmhTHPCBrGn9XPyPlTo2W5dMw++zpXLfIdz6qaUuv30oote2b8wB9I
	6GsZnH+XKtUFcXnrwm+B8snHh+zTuvfsqxIY0YUEGFBBWZhJTe9UIGgiTJs4enTCpJfc=;
Message-ID: <a59c03e7-0d22-4181-8ff2-f826b15ab4cb@xen.org>
Date: Fri, 18 Aug 2023 15:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Drop remains of prior SCMs
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230818144534.1911457-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230818144534.1911457-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 18/08/2023 15:45, Andrew Cooper wrote:
> None of the mercurial metadata has been updated since around Xen 4.2, making
> them more than a decade stale.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> ---
>   .hgignore | 329 ------------------------------------------------------
>   .hgsigs   |  11 --
>   .hgtags   |  59 ----------
>   3 files changed, 399 deletions(-)
>   delete mode 100644 .hgignore
>   delete mode 100644 .hgsigs
>   delete mode 100644 .hgtags
> 
> diff --git a/.hgignore b/.hgignore
> deleted file mode 100644
> index 2d416706321b..000000000000
> --- a/.hgignore
> +++ /dev/null
> @@ -1,329 +0,0 @@
> -.*\.a$
> -.*\.cmi$
> -.*\.cmo$
> -.*\.cmx$
> -\..*\.d$
> -.*\.o$
> -.*\.opic$
> -.*\.pyc$
> -.*\.so$
> -.*\.so\..*$
> -.*\.tar\.bz2$
> -.*\.tar\.gz$
> -.*~$
> -.*\.swp$
> -.*\.tmp$
> -.*\.flc$
> -.*\.orig$
> -.*\.rej$
> -.*\.spot$
> -.*\.spit$
> -.*\.gcno$
> -.*\.gcda$
> -.*/a\.out$
> -.*/Modules\.symvers$
> -.*/cscope\..*$
> -^cscope.*$
> -^[^/]*\.bz2$
> -^\.config$
> -^\.pc
> -(^|/)(tags|TAGS)$
> -(^|/)(GTAGS|GPATH|GSYMS|GRTAGS)$
> -^autom4te\.cache$
> -^config\.log$
> -^config\.status$
> -^config\.cache$
> -^config/Toplevel\.mk$
> -^build-.*$
> -^dist/.*$
> -^docs/autom4te\.cache$
> -^docs/config\.log$
> -^docs/config\.status
> -^docs/config/Toplevel\.mk
> -^docs/.*\.aux$
> -^docs/.*\.dvi$
> -^docs/.*\.log$
> -^docs/.*\.pdf$
> -^docs/.*\.ps$
> -^docs/.*\.toc$
> -^docs/api/.*$
> -^docs/figs/xenserver\.eps$
> -^docs/html/.*$
> -^docs/interface/WARNINGS$
> -^docs/interface/images\.pl$
> -^docs/interface/images\.tex$
> -^docs/interface/img1\.png$
> -^docs/interface/index\.html$
> -^docs/interface/interface\.css$
> -^docs/interface/interface\.html$
> -^docs/interface/labels\.pl$
> -^docs/figs/.*\.png
> -^docs/man1/
> -^docs/man5/
> -^docs/pdf/.*$
> -^docs/ps/.*$
> -^docs/user/WARNINGS$
> -^docs/user/images\.pl$
> -^docs/user/images\.tex$
> -^docs/user/img1\.png$
> -^docs/user/img2\.png$
> -^docs/user/img3\.png$
> -^docs/user/index\.html$
> -^docs/user/internals\.pl$
> -^docs/user/labels\.pl$
> -^docs/user/user\.css$
> -^docs/user/user\.html$
> -^docs/txt/.*$
> -^docs/xen-api/vm_lifecycle.eps$
> -^docs/xen-api/xenapi-datamodel-graph.eps$
> -^docs/xen-api/xenapi.out$
> -^extras/mini-os/include/list\.h$
> -^extras/mini-os/include/mini-os$
> -^extras/mini-os/include/x86/mini-os$
> -^extras/mini-os/include/xen$
> -^extras/mini-os/mini-os.*$
> -^install/.*$
> -^linux-[^/]*-paravirt/.*$
> -^linux-2.6[^/]*/.*$
> -^linux-[^/]*-rc/.*$
> -^linux-[^/]*-tip/.*$
> -^linux-[^/]*-git/.*$
> -^linux-[^/]*\.patch$
> -^mkddbxen$
> -^netbsd-[^/]*-tools/.*$
> -^netbsd-[^/]*-xen0/.*$
> -^netbsd-[^/]*-xenU/.*$
> -^netbsd-[^/]*\.patch$
> -^patches/.*/\.makedep$
> -^patches/ebtables-brnf-5_vs_2\.4\.25\.diff$
> -^patches/ebtables\.diff$
> -^patches/tmp/.*$
> -^pristine-.*$
> -^ref-.*$
> -^tmp-.*$
> -^stubdom/autom4te\.cache$
> -^stubdom/binutils-.*$
> -^stubdom/config\.log$
> -^stubdom/config\.status$
> -^stubdom/config\.cache$
> -^stubdom/cross-root-.*$
> -^stubdom/gcc-.*$
> -^stubdom/include$
> -^stubdom/ioemu$
> -^stubdom/xenstore$
> -^stubdom/libxc-.*$
> -^stubdom/lwip-.*$
> -^stubdom/mini-os-.*$
> -^stubdom/mk-headers-.*$
> -^stubdom/newlib-.*$
> -^stubdom/pciutils-.*$
> -^stubdom/zlib-.*$
> -^stubdom/grub-.*$
> -^stubdom/polarssl-.*$
> -^stubdom/gmp-.*$
> -^stubdom/tpm_emulator-.*$
> -^stubdom/ocaml-.*$
> -^stubdom/lwip/
> -^stubdom/ioemu/
> -^stubdom/stubdompath\.sh$
> -^stubdom/vtpm/vtpm_manager\.h$
> -^tools/.*/build/lib.*/.*\.py$
> -^tools/check/\..*$
> -^tools/console/xenconsole$
> -^tools/console/xenconsoled$
> -^tools/debugger/gdb/gdb-6\.2\.1-linux-i386-xen/.*$
> -^tools/debugger/gdb/gdb-6\.2\.1/.*$
> -^tools/debugger/gdb/gdb-6\.2\.1\.tar\.bz2$
> -^tools/debugger/gdbsx/gdbsx$
> -^tools/debugger/kdd/kdd$
> -^tools/debugger/xenitp/xenitp$
> -^tools/firmware/.*/biossums$
> -^tools/firmware/.*\.bin$
> -^tools/firmware/.*\.sym$
> -^tools/firmware/.*bios/.*bios.*\.txt$
> -^tools/firmware/etherboot/eb-roms\.h$
> -^tools/firmware/etherboot/ipxe/.*$
> -^tools/firmware/etherboot/ipxe\.git/.*$
> -^tools/firmware/extboot/extboot.img$
> -^tools/firmware/extboot/signrom$
> -^tools/firmware/hvmloader/acpi/mk_dsdt$
> -^tools/firmware/hvmloader/acpi/dsdt.*\.c$
> -^tools/firmware/hvmloader/acpi/dsdt_.*\.asl$
> -^tools/firmware/hvmloader/acpi/ssdt_.*\.h$
> -^tools/firmware/hvmloader/hvmloader$
> -^tools/firmware/hvmloader/roms\.inc$
> -^tools/firmware/rombios/BIOS-bochs-[^/]*$
> -^tools/firmware/rombios/_rombios[^/]*_\.c$
> -^tools/firmware/rombios/rombios[^/]*\.s$
> -^tools/firmware/rombios/32bit/32bitbios_flat\.h$
> -^tools/firmware/vgabios/vbetables-gen$
> -^tools/firmware/vgabios/vbetables\.h$
> -^tools/firmware/xen-dir/.*\.old$
> -^tools/firmware/xen-dir/linkfarm.stamp.*$
> -^tools/firmware/xen-dir/xen-root$
> -^tools/firmware/xen-dir/xen-shim$
> -^tools/firmware/xen-dir/xen-shim-syms$
> -^tools/flask/utils/flask-getenforce$
> -^tools/flask/utils/flask-get-bool$
> -^tools/flask/utils/flask-loadpolicy$
> -^tools/flask/utils/flask-setenforce$
> -^tools/flask/utils/flask-set-bool$
> -^tools/flask/utils/flask-label-pci$
> -^tools/fs-back/fs-backend$
> -^tools/hotplug/common/hotplugpath\.sh$
> -^tools/include/xen/.*$
> -^tools/include/xen-foreign/.*\.(c|h|size)$
> -^tools/include/xen-foreign/checker$
> -^tools/libxl/_.*\.h$
> -^tools/libxl/_.*\.c$
> -^tools/libxl/libxlu_cfg_y\.output$
> -^tools/libxl/xl$
> -^tools/libxl/libxl-save-helper$
> -^tools/libxl/testidl$
> -^tools/libxl/testidl\.c$
> -^tools/libxl/tmp\..*$
> -^tools/libxl/.*\.new$
> -^tools/libxl/_libxl\.api-for-check
> -^tools/libxl/libxl\.api-ok
> -^tools/libvchan/vchan-node[12]$
> -^tools/misc/cpuperf/cpuperf-perfcntr$
> -^tools/misc/cpuperf/cpuperf-xen$
> -^tools/misc/xc_shadow$
> -^tools/misc/xen_cpuperf$
> -^tools/misc/xen-detect$
> -^tools/misc/xen-hptool$
> -^tools/misc/xen-hvmcrash$
> -^tools/misc/xen-tmem-list-parse$
> -^tools/misc/xenperf$
> -^tools/misc/xenpm$
> -^tools/misc/xen-hvmctx$
> -^tools/misc/xen-lowmemd$
> -^tools/misc/xenlockprof$
> -^tools/misc/xencov$
> -^tools/pygrub/build/.*$
> -^tools/python/build/.*$
> -^tools/python/xen/util/path\.py$
> -^tools/python/xen/lowlevel/xl/_pyxl_types.c
> -^tools/python/xen/lowlevel/xl/_pyxl_types.h
> -^tools/remus/imqebt/imqebt$
> -^tools/remus/kmod/.*(\.cmd|\.mod|\.ko|\.mod\.c|\.symvers|\.xen)$
> -^tools/security/secpol_tool$
> -^tools/security/xen/.*$
> -^tools/security/xensec_tool$
> -^tools/tests/x86_emulator/blowfish\.bin$
> -^tools/tests/x86_emulator/blowfish\.h$
> -^tools/tests/x86_emulator/test_x86_emulator$
> -^tools/tests/x86_emulator/x86_emulate$
> -^tools/tests/regression/installed/.*$
> -^tools/tests/regression/build/.*$
> -^tools/tests/regression/downloads/.*$
> -^tools/tests/xen-access/xen-access$
> -^tools/tests/mem-sharing/memshrtool$
> -^tools/tests/mce-test/tools/xen-mceinj$
> -^tools/vtpm/tpm_emulator-.*\.tar\.gz$
> -^tools/vtpm/tpm_emulator/.*$
> -^tools/vtpm/vtpm/.*$
> -^tools/vtpm_manager/manager/vtpm_managerd$
> -^tools/xcutils/lsevtchn$
> -^tools/xcutils/xc_restore$
> -^tools/xcutils/xc_save$
> -^tools/xcutils/readnotes$
> -^tools/misc/xenwatchdogd$
> -^tools/xenfb/sdlfb$
> -^tools/xenfb/vncfb$
> -^tools/xenmon/xentrace_setmask$
> -^tools/xenmon/xenbaked$
> -^tools/xenpaging/xenpaging$
> -^tools/xenpmd/xenpmd$
> -^tools/xenstat/xentop/xentop$
> -^tools/xenstore/testsuite/tmp/.*$
> -^tools/xenstore/init-xenstore-domain$
> -^tools/xenstore/xen$
> -^tools/xenstore/xenstore$
> -^tools/xenstore/xenstore-chmod$
> -^tools/xenstore/xenstore-exists$
> -^tools/xenstore/xenstore-list$
> -^tools/xenstore/xenstore-read$
> -^tools/xenstore/xenstore-rm$
> -^tools/xenstore/xenstore-write$
> -^tools/xenstore/xenstore-control$
> -^tools/xenstore/xenstore-ls$
> -^tools/xenstore/xenstore-watch$
> -^tools/xenstore/xenstored$
> -^tools/xenstore/xenstored_test$
> -^tools/xenstore/xs_crashme$
> -^tools/xenstore/xs_random$
> -^tools/xenstore/xs_stress$
> -^tools/xenstore/xs_tdb_dump$
> -^tools/xenstore/xs_test$
> -^tools/xenstore/xs_watch_stress$
> -^tools/xentrace/xentrace_setsize$
> -^tools/xentrace/tbctl$
> -^tools/xentrace/xenctx$
> -^tools/xentrace/xentrace$
> -^tools/firmware/ovmf-remote
> -^tools/firmware/ovmf$
> -^tools/qemu-xen-traditional-dir-remote
> -^tools/qemu-xen-traditional-dir$
> -^tools/qemu-xen-dir-remote
> -^tools/qemu-xen-dir$
> -^tools/firmware/seabios-dir-remote
> -^tools/firmware/seabios-dir$
> -^tools/ocaml/.*/.*\.annot$
> -^tools/ocaml/.*/.*\.cmx?a$
> -^tools/ocaml/.*/META$
> -^tools/ocaml/.*/\.ocamldep\.make$
> -^tools/ocaml/libs/xl/_libxl_types\.ml\.in$
> -^tools/ocaml/libs/xl/_libxl_types\.mli\.in$
> -^tools/ocaml/libs/xl/_libxl_types\.inc$
> -^tools/ocaml/libs/xl/xenlight\.ml$
> -^tools/ocaml/libs/xl/xenlight\.mli$
> -^tools/ocaml/xenstored/oxenstored$
> -^tools/ocaml/test/xtl$
> -^tools/ocaml/test/send_debug_keys$
> -^tools/ocaml/test/list_domains$
> -^tools/autom4te\.cache$
> -^tools/config\.h$
> -^tools/config\.log$
> -^tools/config\.status$
> -^tools/config\.cache$
> -^config/Tools\.mk$
> -^config/Stubdom\.mk$
> -^config/Docs\.mk$
> -^xen/\.banner.*$
> -^xen/System.map$
> -^xen/arch/arm/asm-offsets\.s$
> -^xen/arch/arm/xen\.lds$
> -^xen/arch/x86/asm-offsets\.s$
> -^xen/arch/x86/boot/mkelf32$
> -^xen/arch/x86/xen\.lds$
> -^xen/arch/x86/boot/reloc\.S$
> -^xen/arch/x86/boot/reloc\.bin$
> -^xen/arch/x86/boot/reloc\.lnk$
> -^xen/arch/x86/efi\.lds$
> -^xen/arch/x86/efi/check\.efi$
> -^xen/arch/x86/efi/disabled$
> -^xen/arch/x86/efi/mkreloc$
> -^xen/ddb/.*$
> -^xen/include/headers\.chk$
> -^xen/include/asm$
> -^xen/include/asm-.*/asm-offsets\.h$
> -^xen/include/compat/.*$
> -^xen/include/hypervisor-ifs/arch$
> -^xen/include/linux$
> -^xen/include/public/public$
> -^xen/include/xen/.*\.new$
> -^xen/include/xen/acm_policy\.h$
> -^xen/include/xen/banner\.h$
> -^xen/include/xen/compile\.h$
> -^xen/tools/figlet/figlet$
> -^xen/tools/symbols$
> -^xen/xsm/flask/include/av_perm_to_string\.h$
> -^xen/xsm/flask/include/av_permissions\.h$
> -^xen/xsm/flask/include/class_to_string\.h$
> -^xen/xsm/flask/include/flask\.h$
> -^xen/xsm/flask/include/initial_sid_to_string\.h$
> -^xen/xen$
> -^xen/xen-syms$
> -^xen/xen\..*$
> -^LibVNCServer.*
> diff --git a/.hgsigs b/.hgsigs
> deleted file mode 100644
> index 7dc4a6128279..000000000000
> --- a/.hgsigs
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -2a60be40e2cb2a3c62836e690927588c3e31d01c 0 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
> -6241fa0ad1a939d2eba11bdec929564276f56a9e 0 iQEcBAABAgAGBQJNcSJqAAoJEIP+FMlX6CvZbxEH/206722t0t46MfPq0/buPpQDNiB0HtFZY79u1Yc8xGTo23rQ2NTG10JdCurN2pyxwFesiSIZ4Ua3zqpZ0EA2EN6xAFY9Vua4WEPNJwK8pxxWABcHI017QTidQs41bEaUn92yyfmixq6iYCGvR+b46KWbip/i9Z6vZpw0g3JyOaxgAhkA+p4w90yUIKUkjTrtiuqnI31MUQE0urwWAXQUj78knrqEu3wb91+me1KLH9WzReBB7tt3/GmaK4qSdnHNpIkulVK0XJYzFkJzFr5eHVeYTGFb25Sgir2sIN2gxaCPI3/p90akFMJKmeNV5XCmOQ5g2GWUZTff8LGF6Fk0Me8=
> -8e620dc570ce42564c1630de5798e23909ee809c 0 iQEcBAABAgAGBQJQFqUYAAoJEIP+FMlX6CvZDGEH/jxUFG29okRASHY6XwFrJ4AU7tLyC8Bt2vAH3ZaA/h1Tn2GWkQXf4tzBAvvwWNBrm1hdj73OaB7dD2l2kvL551AhoSd4/5z+pPtpC72ItwFFTr3Ep9GRZEvEHculuei5IUzw1lxZuNCPCScBxQl+KI+dZHIeP0YO46VZTtG+EeBlj0SJ7JojKN4REd382eIgSLvpEFHCM6vqeCWM9FtDyomiMXdSosDLcWdFauFmV7cdWybA5WPj6bkJenABwX0A1V9uf225S0DTdO0t/7ncZ8h+wXTzqiixywA+lqza+u+HzNyopWmwiFcseFZjuHbKx6M2v0EvKPBcyTgdRZF/+Kg=
> -f4c47bcc01e13cb2e3b4b71fd588d86278875442 0 iQEcBAABAgAGBQJQIpupAAoJEIP+FMlX6CvZnBwH/3qlibrquTmD2p3rcdVi/JkWixaKK3KH4Ows/76sAJYCdx9YkmtkgC4zyz5aph4Rfy7dYnQIUhbwNNdZNBDd0XOVkjQm0ZX1wQjv3yA3Eq9NOUDmfFWldF+oosOG3h/+MLm/36CkB7gFku1ENQ8kagytXe4rN3QdOiJ9Rz84BAv6nJoT/1OX+m+MlBs948orC23aNEfWxrsrv2s92v5fJcAfSLW/AtER2JnASIxWECJ/TOkuHtrO2QPoBymSnifM2R624L+ySwRxSxo+Owfpooje5eekk0ekifvdYtaJ3pOfoOCv8yGEtb7mXv62WowVkasUZa/q+rGdVpHuK0UlBjI=
> -d44f290e81df5f78f0e3545742e3c4ff5415b0a7 0 iQEcBAABAgAGBQJQNji7AAoJEIP+FMlX6CvZvBcIAJPiA6ydvolYCvZsfGgafqCpcpG3f+PbUOwQRWfUcaKHPWFKnwRkmx9MAP9tEjXFNZcbimktDrofmee6XfLb8NLnCcHWZT8trRXYTNw2lM6DpK+AROUpAcShF3gCHQEtCJC6+NArD75aUkUji3awbGlhplHbyWvgvSSULhga+2xfYszRC7eI/g+7/f4JNkvqeWllAtd9fwftXaGhQi2V4LT5IimpJI7PivlDi0wi+BtqXHcmZhlnw3zpR51NRujsMVTNZMqe733kGdt8Y8j3vvsfXBye4+YAkEKFrzW3jTYlA9ws71oNVvWmwmOjOHpx6ASfquP3hhAoiHvb2c6Wims=
> -68640a3c99cefa86ae70fc49871025864e5671f2 0 iQEcBAABAgAGBQJQSdgUAAoJEIP+FMlX6CvZeWUH/1SeYnKXtkt7n+WuMyF2LvCzZQApmOo+hqVB7m0Pe4Yh9bEq1PAE+sJOAoQIBklCpY3WFsNGQN8yIbYyWRzbIM7oavknwoUoSn50zMk12HczqHigXvhL/eOghRKNsK9BrQnRV+byNHRjzSHPReNxpzueKBOTrCMlXtYMDb94swc+hatEDItT4TwZcaNPri3kiWND0DPmOk58Ke96ml9rpomS1ff976hYAZl+N1Q3Pt998SXiaglZ9EeL0Y8cY759XqZII4D4o6/oQW8MzWrQZr4woHHU7MfK3OWslelzP486esHyyjotEWeelhgl/RjIl0crNBbmCWU15BOAw7wSZh4=
> diff --git a/.hgtags b/.hgtags
> deleted file mode 100644
> index e9fddab036d8..000000000000
> --- a/.hgtags
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -42882b3e0dda89f3a8ec00da568f86e9b3c230f1 RELEASE-2.0.0
> -475a162b66e2c19b1e9468b234a4ba705334905e RELEASE-2.0.1
> -dc2f08429f17e6614fd2f1ab88cc09ca0a850f32 RELEASE-2.0.2
> -6e1bbc13911751efa0b1c018425c1b085820fa02 RELEASE-2.0.3
> -fb875591fd72e15c31879c0e9034d99b80225595 RELEASE-2.0.4
> -1a522944f76540ea9d73fcc1b0d13d0f670183f0 RELEASE-2.0.5
> -2a5814ad2e5634a5fa291b703a152e7fc0b4faf0 RELEASE-2.0.6
> -487b2ee37d1cecb5f3e7a546b05ad097a0226f2f beta1
> -6a65fe0f84c8339b5b89362d0ec34d8abab752b0 ia64-stable
> -3d330e41f41ce1bc118c02346e18949ad5d67f6b latest-semistable
> -30c521db4c71960b0cf1d9c9e1b658e77b535a3e latest-stable
> -9afec5bc14aeb197ef37ea54a57eacd427463fc3 semistable
> -30c521db4c71960b0cf1d9c9e1b658e77b535a3e split-1.0
> -3d330e41f41ce1bc118c02346e18949ad5d67f6b split-1.1
> -c8fdb0caa77b429cf47f9707926e83947778cb48 RELEASE-3.0.0
> -af0573e9e5258db0a9d28aa954dd302ddd2c2d23 3.0.2-rc
> -d0d3fef37685be264a7f52201f8ef44c030daad3 3.0.2-branched
> -6ed4368b4a9e1924c983774c4b1a2b6baf8e98a6 3.0.3-branched
> -057f7c4dbed1c75a3fbe446d346cee04cff31497 3.0.4-branched
> -d2ef85c6bf84cc619ca2d42c2edfc6229e70a6ad 3.1.0-branched
> -bd3d6b4c52ec809f080c89c4ffcf61dc6e445978 sparse-tree-deprecated
> -1f0c6e0d74a4acc1d3796ff705adc8485eba9377 3.2.0-rc1
> -458dc123dd02d38aaa9acb513d6f237a1c6e967e 3.2.0-rc2
> -ed79613b48817d5e0d1f9b3cf104c0e4e8b0d8cf 3.2.0-rc3
> -c5deb251b9dcece9e466a48a66d3528ca1797db4 3.2.0-rc4
> -36bb2ab4722733d919d32e4555eb46cc6a06cb8f 3.2.0-rc5
> -9facc624a238f2b9437b07fa28ff65884aa867f2 3.2.0-rc6
> -c3494402098e26507fc61a6579832c0149351d6a 3.3.0-rc1
> -dde12ff94c96331668fe38a7b09506fa94d03c34 3.3.0-rc2
> -57fca3648f25dcc085ee380954342960a7979987 3.3.0-rc3
> -96d0a48e87ee46ba7b73e8c906a7e2e0baf60e2e 3.3.0-rc4
> -b4dba6a0e97cb6dd080fa566468e3cc972c34d7a 3.3.0-rc5
> -bc372510f1794ee41a8b0501cc84f8a65d05e094 3.3.0-rc6
> -daf1193bcd11345d566a4747fe1f12c90b44452c 3.3.0-rc7
> -1e99ba54035623731bc7318a8357aa6a118c5da1 3.3.0-branched
> -d611d9ac6d0271b53eb1d4e5d0c4ef20b269eea8 3.4.0-rc1
> -087854cf3ed9e30ce6bcf7499c9675b759e1e9e7 3.4.0-rc2
> -22e01301ff64c6f9f835f604523ac019f0f5e993 3.4.0-rc3
> -67b5ad8ae87e64159807374ad66d5b5b2fb2ca1f 4.0.0-rc1
> -e5e4573bcaba68a8b93a35768c825c1e8daa23be 4.0.0-rc2
> -7d565d58f49859a2161f0e74844773d3b3312634 4.0.0-rc3
> -912295f1b1f30307975c7514569f6f9c8faae4a7 4.0.0-rc4
> -92f2ee87e5018073edc08734b425bc60bcd80bcd 4.0.0-rc5
> -b4a1832a916f1e8f2aa2ad5b1efa155f9dd0cb4f 4.0.0-rc6
> -ec8f2e7dea44905eb86bb794516506451e4771cb 4.0.0-rc7
> -542211ba675c74813ed0df3be686d7cd201e82e9 4.0.0-rc8
> -91232efdcfdcfb6402b4c0e3724716655ee42af6 4.0.0-branched
> -2a60be40e2cb2a3c62836e690927588c3e31d01c 4.1.0-rc1
> -9dca60d88c630fcc7a07ad68fd3a0dce02aee646 4.1.0-rc2
> -e7b31cc0093c6002effce7d038e929d936ed023f 4.1.0-rc3
> -8df0c7f9cda6cb271a1414114e26f72e1d93a69a 4.1.0-rc4
> -d2d27d989ebce4325575f871415337cc54891dde 4.1.0-rc5
> -7b6791dbfecdb2eba6acd2c8bf0ced17d06746b2 4.1.0-rc6
> -6241fa0ad1a939d2eba11bdec929564276f56a9e 4.1.0-branched
> -8e620dc570ce42564c1630de5798e23909ee809c 4.2.0-rc1
> -f4c47bcc01e13cb2e3b4b71fd588d86278875442 4.2.0-rc2
> -d44f290e81df5f78f0e3545742e3c4ff5415b0a7 4.2.0-rc3
> -68640a3c99cefa86ae70fc49871025864e5671f2 4.2.0-rc4
> -528f0708b6db392e10303b7ed2ab529bb8b512b7 4.2.0-branched
> 
> base-commit: cd36188b2762a05c322a5f56bcfce59c2d9cac2e

-- 
Julien Grall


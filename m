Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A448C5D6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 15:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256640.440581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7eU6-0000mv-AP; Wed, 12 Jan 2022 14:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256640.440581; Wed, 12 Jan 2022 14:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7eU6-0000kl-6z; Wed, 12 Jan 2022 14:20:18 +0000
Received: by outflank-mailman (input) for mailman id 256640;
 Wed, 12 Jan 2022 14:17:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKq3=R4=web.de=starchip2000@srs-se1.protection.inumbo.net>)
 id 1n7eRg-0008P0-Pa
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 14:17:49 +0000
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69cd46d2-73b2-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 15:17:46 +0100 (CET)
Received: from [192.168.25.251] ([62.245.250.29]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4N9I-1mNlbI0DB8-011l61 for
 <xen-devel@lists.xenproject.org>; Wed, 12 Jan 2022 15:17:46 +0100
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
X-Inumbo-ID: 69cd46d2-73b2-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1641997066;
	bh=XHiM9J9rq/UyQy4dppSclzUFU4s+1vLEPAfRgLMPeuI=;
	h=X-UI-Sender-Class:Date:To:From:Subject;
	b=Ohhr2mJZmBkxcOpMDGEY6bNjYzKqurejA0FEM77pVVTGqQBsbaSyY++nzD3qf1vIJ
	 l0bjm9RGqPZxfRtVwrqN1Yh45+jPMn9EcuH2P8R/r1tUW3rNEpJWRopS47E4rAIfyv
	 vqPY8rpAyuMnaBT2Y2+lduFe2T4lUZbprQLz8D5I=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Message-ID: <8b95ffea-d664-ce87-e386-73a06c265cac@web.de>
Date: Wed, 12 Jan 2022 15:17:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
To: xen-devel@lists.xenproject.org
From: Ronny Wagner <starchip2000@web.de>
Subject: device model: spawn failed (rc=-3)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Vba34hoxDj4R7jIWblcn91avGVRF2+/n8/qLwXoe/EbE+xOSiAa
 v3Zo1wzTk+le6j8EJhhYCsJGmfE/QKY8vBzAy13hjJmBLaa+6+t1nOHJRabSivACIWZ3iub
 kzS/m3rTnhArVhyE+M/phkPOvyEc4GQBfM/KETP+wIO7PdvYDDqzrqyJE6N3BI7ogoW+p+e
 QXY3koyXPKw7p+N8M0M+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZW4w2ldEoCQ=:IHLxvwEe3LwE2D+kPDzCV1
 /+E+ywMgLcnZZkItTnVSC+o7iW7GTTx0atKesTaKiQdNf9kt7AsrFBeySQ2w6pUxrq13powHB
 6hKpOgO4TFqw5T33iqIztJ7oRJQNiEDwfcH/CJZonLSsXBgzvEz8HWiH0mgcaBuXAkL0Xt7iX
 ToYCn8ZxgBETwgKbN79qnLH0GIM/c72cHUI3qGhBposBAARO8HUzyFPJwFhF5QrID3JUNutOH
 4s+56NJJjuaD2HsvpdeTlW3kglyirl6kNdpOMiJBiT7OIB2F8yV6LsbuPuDNVWVRjXzev8lOM
 D6D89Pfefh6kn3ueEMmkj69OnjQM5mgl0bUXmqeSt/F7zZMe3Dob+BgvOHCM31TUA1NIGx/sC
 /j2mWL1R+Jkv1M2n0WpRzevMLaGjm/JKSvSB1Iu6zP8aeOqyRbw2bFcHHkZjvu8q16M+zAwq/
 /IdTE3F0ZBoLs1RD+eIx4OwgOja8QfiPFrbXMq6+x9SdFk3YO6D6YR7Lqok8ZRoSxkNhyA/tP
 WifpfHlwgfLAZwfFMQy5fiTRVIjdg7COYXTLfmXRugKUI3mU6GnAoYAZj5DzvhxKs2MccEyrV
 7fJM4q8kumFuNs9AgNIlsH2ugzxbxuqyvUJN8FJAulJgtso2skzy/MvOIHSJDmxFEjKge4sIr
 1USCwvXSh547MWx7WyeR7h1B2ogVHKc+diSGOqxBnMMumcL1WxEkKIrbTI9BfMbmD5E28Tk3x
 nTWZyiWZs7FiZLPozeDtVGINBJ94LLdPCeaBv4aKXPc/aIDrZM+Xqkc4TAPVkfjejY4FLQAzs
 rz0aQaIP9FTdVZlVYO2kbTXzlN6cabbQsRPc5MBPWdEW+tSPrS1kYeDl0KA3PesAPtK26Oa4K
 OKGXv5QWkEDHm3cwPzoX46JheUOsKbJSxfHEXAP/zHvGla5cKpmrQLpxQMmtG6/ZHfGhNC5t8
 2g7tEOrs76emRdEbZvQ0mTh26aJJ2RKYoCrqtH82HIn9d4M06lapwAvsvtBUWeLteBBCyxen5
 8obrz4zJOO6u+dgNCsoXvjgosoP0HWmlCW81fYJQyIfOlNsk1VE5WbUNNDPm3n1O1/9dDu4oH
 nsKQMDkOjjaxu4=

Hello,

i restart my windows domU today.

And now, the domU don't start. Have anyone a idea, why? I am not change
any config on the Host.

Thank you for helping!

Fail-Message:
root@server ~ # xl create -f /etc/xen/domU.cfg
Parsing config from /etc/xen/domU.cfg
libxl: error: libxl_dm.c:3131:device_model_spawn_outcome: Domain
24:domain 24 device model: spawn failed (rc=3D-3)
libxl: error: libxl_dm.c:3351:device_model_postconfig_done: Domain
24:Post DM startup configs failed, rc=3D-3
libxl: error: libxl_create.c:1867:domcreate_devmodel_started: Domain
24:device model did not start: -3
libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Model
already exited
libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
24:Non-existant domain
libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
24:Unable to destroy guest
libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
24:Destruction of domain failed

xl info:
host=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : server
release=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : 5.10.0-10-amd64
version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : #1 SMP Debian 5.10.84-1 (2021-12-08)
machine=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : x86_64
nr_cpus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : 12
max_cpu_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 : 11
nr_nodes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 : 1
cores_per_socket=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 6
threads_per_core=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 2
cpu_mhz=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 : 3500.033
hw_caps=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 :
bfebfbff:77bee3ff:2c100800:00000001:00000001:00000281:00000000:00000100
virt_caps=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : pv hvm hvm_directio pv_directio hap shadow
iommu_hap_pt_share gnttab-v1 gnttab-v2
total_memory=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=
 65501
free_memory=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : 25760
sharing_freed_memory=C2=A0=C2=A0 : 0
sharing_used_memory=C2=A0=C2=A0=C2=A0 : 0
outstanding_claims=C2=A0=C2=A0=C2=A0=C2=A0 : 0
free_cpus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : 0
xen_major=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : 4
xen_minor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : 16
xen_extra=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : .0
xen_version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : 4.16.0
xen_caps=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p
hvm-3.0-x86_64
xen_scheduler=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : cred=
it2
xen_pagesize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=
 4096
platform_params=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : virt_start=3D0=
xffff800000000000
xen_changeset=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
xen_commandline=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : placeholder do=
m0_mem=3D1024M,max:2048M
dom0_max_vcpus=3D8 dom0_vcpus_pin
cc_compiler=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 : gcc (Debian 10.2.1-6) 10.2.1 20210110
cc_compile_by=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : root
cc_compile_domain=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
cc_compile_date=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : Sat Dec 25 21:=
39:55 CET 2021
build_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 : 7d1546babc012bbc675a954b2be5ff1f9474863e
xend_config_format=C2=A0=C2=A0=C2=A0=C2=A0 : 4

Detail message:
Parsing config from /etc/xen/domU.cfg
libxl: debug: libxl_create.c:2052:do_domain_create: ao 0x55dd8566e6f0:
create: how=3D(nil) callback=3D(nil) poller=3D0x55dd8566e790
libxl: detail: libxl_create.c:653:libxl__domain_make: passthrough: disable=
d
libxl: debug: libxl_device.c:379:libxl__device_disk_set_backend: Disk
vdev=3Dhda spec.backend=3Dunknown
libxl: debug: libxl_device.c:413:libxl__device_disk_set_backend: Disk
vdev=3Dhda, using backend phy
libxl: debug: libxl_device.c:379:libxl__device_disk_set_backend: Disk
vdev=3Dhdb spec.backend=3Dunknown
libxl: debug: libxl_device.c:413:libxl__device_disk_set_backend: Disk
vdev=3Dhdb, using backend phy
libxl: debug: libxl_create.c:1313:initiate_domain_create: Domain
25:running bootloader
libxl: debug: libxl_bootloader.c:328:libxl__bootloader_run: Domain
25:not a PV/PVH domain, skipping bootloader
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x55dd856687d0: deregister unregistered
libxl: detail: libxl_x86.c:342:hvm_set_viridian_features: base group enabl=
ed
libxl: detail: libxl_x86.c:342:hvm_set_viridian_features: freq group enabl=
ed
libxl: detail: libxl_x86.c:342:hvm_set_viridian_features: time_ref_count
group enabled
libxl: detail: libxl_x86.c:342:hvm_set_viridian_features: apic_assist
group enabled
libxl: detail: libxl_x86.c:342:hvm_set_viridian_features: crash_ctl
group enabled
libxl: detail: libxl_x86.c:342:hvm_set_viridian_features: no_vp_limit
group enabled
libxl: detail: libxl_x86.c:342:hvm_set_viridian_features: cpu_hotplug
group enabled
domainbuilder: detail: xc_dom_allocate: cmdline=3D"", features=3D""
domainbuilder: detail: xc_dom_kernel_file:
filename=3D"/usr/local/lib/xen/boot/hvmloader"
domainbuilder: detail: xc_dom_malloc_filemap=C2=A0=C2=A0=C2=A0 : 178 kB
libxl: debug: libxl_dom.c:822:libxl__load_hvm_firmware_module: Loading
BIOS: /usr/local/lib/xen/boot/seabios.bin
domainbuilder: detail: xc_dom_boot_xen_init: ver 4.16, caps
xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
domainbuilder: detail: xc_dom_parse_image: called
domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary
loader ...
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ...
domainbuilder: detail: loader probe OK
xc: detail: ELF: phdr: paddr=3D0x100000 memsz=3D0x34a20
xc: detail: ELF: memory: 0x100000 -> 0x134a20
domainbuilder: detail: xc_dom_compat_check: supported guest type:
xen-3.0-x86_64
domainbuilder: detail: xc_dom_compat_check: supported guest type:
hvm-3.0-x86_32 <=3D matches
domainbuilder: detail: xc_dom_compat_check: supported guest type:
hvm-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type:
hvm-3.0-x86_64
domainbuilder: detail: xc_dom_mem_init: mem 24560 MB, pages 0x5ff000
pages, 4k each
domainbuilder: detail: xc_dom_mem_init: 0x5ff000 pages
domainbuilder: detail: xc_dom_boot_mem_init: called
domainbuilder: detail: range: start=3D0x0 end=3D0xf0000000
domainbuilder: detail: range: start=3D0x100000000 end=3D0x60f000000
xc: detail: PHYSICAL MEMORY ALLOCATION:
xc: detail:=C2=A0=C2=A0 4KB PAGES: 0x0000000000000200
xc: detail:=C2=A0=C2=A0 2MB PAGES: 0x00000000000003f7
xc: detail:=C2=A0=C2=A0 1GB PAGES: 0x0000000000000016
domainbuilder: detail: xc_dom_build_image: called
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn
0x100+0x35 at 0x7fbb592a5000
domainbuilder: detail: xc_dom_alloc_segment:=C2=A0=C2=A0 kernel=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0x100000
-> 0x135000=C2=A0 (pfn 0x100 + 0x35 pages)
xc: detail: ELF: phdr 0 at 0x7fbb59270000 -> 0x7fbb5929afa0
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn
0x135+0x40 at 0x7fbb59265000
domainbuilder: detail: xc_dom_alloc_segment:=C2=A0=C2=A0 System Firmware m=
odule :
0x135000 -> 0x175000=C2=A0 (pfn 0x135 + 0x40 pages)
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn
0x175+0x1 at 0x7fbb59814000
domainbuilder: detail: xc_dom_alloc_segment:=C2=A0=C2=A0 HVM start info : =
0x175000
-> 0x176000=C2=A0 (pfn 0x175 + 0x1 pages)
domainbuilder: detail: xc_dom_build_image=C2=A0 : virt_alloc_end : 0x17600=
0
domainbuilder: detail: xc_dom_build_image=C2=A0 : virt_pgtab_end : 0x0
domainbuilder: detail: xc_dom_boot_image: called
domainbuilder: detail: domain builder memory footprint
domainbuilder: detail:=C2=A0=C2=A0=C2=A0 allocated
domainbuilder: detail:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 malloc=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 5928 byt=
es
domainbuilder: detail:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anon mmap=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0 bytes
domainbuilder: detail:=C2=A0=C2=A0=C2=A0 mapped
domainbuilder: detail:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file mmap=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 178 kB
domainbuilder: detail:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domU mmap=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 472 kB
domainbuilder: detail: vcpu_hvm: called
domainbuilder: detail: xc_dom_set_gnttab_entry: d25 gnt[0] -> d0 0xfefff
domainbuilder: detail: xc_dom_set_gnttab_entry: d25 gnt[1] -> d0 0xfeffc
domainbuilder: detail: xc_dom_release: called
libxl: debug: libxl_device.c:379:libxl__device_disk_set_backend: Disk
vdev=3Dhda spec.backend=3Dphy
libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch
w=3D0x55dd8566fea0 wpath=3D/local/domain/0/backend/vbd/25/768/state
token=3D3/0: register slotnum=3D3
libxl: debug: libxl_device.c:379:libxl__device_disk_set_backend: Disk
vdev=3Dhdb spec.backend=3Dphy
libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch
w=3D0x55dd8566c780 wpath=3D/local/domain/0/backend/vbd/25/832/state
token=3D2/1: register slotnum=3D2
libxl: debug: libxl_create.c:2090:do_domain_create: ao 0x55dd8566e6f0:
inprogress: poller=3D0x55dd8566e790, flags=3Di
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=3D0x55dd8566fea0
wpath=3D/local/domain/0/backend/vbd/25/768/state token=3D3/0: event
epath=3D/local/domain/0/backend/vbd/25/768/state
libxl: debug: libxl_event.c:1052:devstate_callback: backend
/local/domain/0/backend/vbd/25/768/state wanted state 2 ok
libxl: debug: libxl_event.c:850:libxl__ev_xswatch_deregister: watch
w=3D0x55dd8566fea0 wpath=3D/local/domain/0/backend/vbd/25/768/state
token=3D3/0: deregister slotnum=3D3
libxl: debug: libxl_device.c:1096:device_backend_callback: Domain
25:calling device_backend_cleanup
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x55dd8566fea0: deregister unregistered
libxl: debug: libxl_linux.c:194:libxl__hotplug_disk: Domain 25:Args and
environment ready
libxl: debug: libxl_device.c:1197:device_hotplug: Domain 25:calling
hotplug script: /etc/xen/scripts/block add
libxl: debug: libxl_device.c:1198:device_hotplug: Domain 25:extra args:
libxl: debug: libxl_device.c:1206:device_hotplug: Domain 25:env:
libxl: debug: libxl_device.c:1213:device_hotplug: Domain 25:=C2=A0=C2=A0=
=C2=A0 script:
/etc/xen/scripts/block
libxl: debug: libxl_device.c:1213:device_hotplug: Domain 25:=C2=A0=C2=A0=
=C2=A0
XENBUS_TYPE: vbd
libxl: debug: libxl_device.c:1213:device_hotplug: Domain 25:=C2=A0=C2=A0=
=C2=A0
XENBUS_PATH: backend/vbd/25/768
libxl: debug: libxl_device.c:1213:device_hotplug: Domain 25:=C2=A0=C2=A0=
=C2=A0
XENBUS_BASE_PATH: backend
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to
execute: /etc/xen/scripts/block add
libxl: debug: libxl_event.c:720:watchfd_callback: watch
epath=3D/local/domain/0/backend/vbd/25/768/state token=3D3/0: empty slot
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=3D0x55dd8566c780
wpath=3D/local/domain/0/backend/vbd/25/832/state token=3D2/1: event
epath=3D/local/domain/0/backend/vbd/25/832/state
libxl: debug: libxl_event.c:1052:devstate_callback: backend
/local/domain/0/backend/vbd/25/832/state wanted state 2 ok
libxl: debug: libxl_event.c:850:libxl__ev_xswatch_deregister: watch
w=3D0x55dd8566c780 wpath=3D/local/domain/0/backend/vbd/25/832/state
token=3D2/1: deregister slotnum=3D2
libxl: debug: libxl_device.c:1096:device_backend_callback: Domain
25:calling device_backend_cleanup
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x55dd8566c780: deregister unregistered
libxl: debug: libxl_linux.c:194:libxl__hotplug_disk: Domain 25:Args and
environment ready
libxl: debug: libxl_device.c:1197:device_hotplug: Domain 25:calling
hotplug script: /etc/xen/scripts/block add
libxl: debug: libxl_device.c:1198:device_hotplug: Domain 25:extra args:
libxl: debug: libxl_device.c:1206:device_hotplug: Domain 25:env:
libxl: debug: libxl_device.c:1213:device_hotplug: Domain 25:=C2=A0=C2=A0=
=C2=A0 script:
/etc/xen/scripts/block
libxl: debug: libxl_device.c:1213:device_hotplug: Domain 25:=C2=A0=C2=A0=
=C2=A0
XENBUS_TYPE: vbd
libxl: debug: libxl_device.c:1213:device_hotplug: Domain 25:=C2=A0=C2=A0=
=C2=A0
XENBUS_PATH: backend/vbd/25/832
libxl: debug: libxl_device.c:1213:device_hotplug: Domain 25:=C2=A0=C2=A0=
=C2=A0
XENBUS_BASE_PATH: backend
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to
execute: /etc/xen/scripts/block add
libxl: debug: libxl_event.c:720:watchfd_callback: watch
epath=3D/local/domain/0/backend/vbd/25/832/state token=3D2/1: empty slot
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x55dd8566ffa0: deregister unregistered
libxl: debug: libxl_linux.c:211:libxl__get_hotplug_script_info: Domain
25:num_exec 1, not running hotplug scripts
libxl: debug: libxl_device.c:1182:device_hotplug: Domain 25:No hotplug
script to execute
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x55dd8566ffa0: deregister unregistered
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x55dd8566c880: deregister unregistered
libxl: debug: libxl_linux.c:211:libxl__get_hotplug_script_info: Domain
25:num_exec 1, not running hotplug scripts
libxl: debug: libxl_device.c:1182:device_hotplug: Domain 25:No hotplug
script to execute
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x55dd8566c880: deregister unregistered
libxl: debug: libxl_dm.c:179:libxl__domain_get_device_model_uid: Domain
25:dm_restrict disabled, starting QEMU as root
libxl: debug: libxl_disk.c:1158:libxl__device_disk_find_local_path:
Directly accessing local RAW disk /dev/vg0/Legolas-disk
libxl: debug: libxl_disk.c:1158:libxl__device_disk_find_local_path:
Directly accessing local RAW disk /dev/vg0/Legolas-disk-exchange-backup
libxl: debug: libxl_dm.c:2975:libxl__spawn_local_dm: Domain 25:Spawning
device-model /usr/local/lib/xen/bin/qemu-system-i386 with arguments:
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
/usr/local/lib/xen/bin/qemu-system-i386
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -xen=
-domid
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 25
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
-no-shutdown
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -cha=
rdev
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
socket,id=3Dlibxl-cmd,path=3D/var/run/xen/qmp-libxl-25,server=3Don,wait=3D=
off
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -mon
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
chardev=3Dlibxl-cmd,mode=3Dcontrol
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -cha=
rdev
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
socket,id=3Dlibxenstat-cmd,path=3D/var/run/xen/qmp-libxenstat-25,server=3D=
on,wait=3Doff
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -mon
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
chardev=3Dlibxenstat-cmd,mode=3Dcontrol
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -nod=
efaults
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
-no-user-config
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -nam=
e
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 domU
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -vnc
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
127.0.0.1:20,password=3Don,to=3D99
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -dis=
play
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 none
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -k
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 de
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -ser=
ial
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 pty
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -dev=
ice
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
VGA,vgamem_mb=3D16
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -boo=
t
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 orde=
r=3Dc
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -usb
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -smp
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 6,ma=
xcpus=3D6
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -dev=
ice
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
rtl8139,id=3Dnic0,netdev=3Dnet0,mac=3DX:Y:Z
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -net=
dev
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
type=3Dtap,id=3Dnet0,ifname=3Dvif25.0-emu,br=3Dxenbr0,script=3Dno,downscri=
pt=3Dno
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -mac=
hine
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
xenfv,suppress-vmdesc=3Don
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -m
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 2456=
0
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -dri=
ve
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
file=3D/dev/vg0/Legolas-disk,if=3Dide,index=3D0,media=3Ddisk,format=3Draw,=
cache=3Dwriteback
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0 -dri=
ve
libxl: debug: libxl_dm.c:2977:libxl__spawn_local_dm: Domain 25:=C2=A0
file=3D/dev/vg0/Legolas-disk-exchange-backup,if=3Dide,index=3D1,media=3Ddi=
sk,format=3Draw,cache=3Dwriteback
libxl: debug: libxl_dm.c:2979:libxl__spawn_local_dm: Domain 25:Spawning
device-model /usr/local/lib/xen/bin/qemu-system-i386 with additional
environment:
libxl: debug: libxl_dm.c:2981:libxl__spawn_local_dm: Domain 25:=C2=A0
XEN_QEMU_CONSOLE_LIMIT=3D1048576
libxl: debug: libxl_dm.c:2981:libxl__spawn_local_dm: Domain 25:=C2=A0
XEN_DOMAIN_ID=3D25
libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch
w=3D0x55dd85668ac8 wpath=3D/local/domain/0/device-model/25/state token=3D2=
/2:
register slotnum=3D2
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=3D0x55dd85668ac8
wpath=3D/local/domain/0/device-model/25/state token=3D2/2: event
epath=3D/local/domain/0/device-model/25/state
libxl: debug: libxl_exec.c:407:spawn_watch_event: domain 25 device
model: spawn watch p=3D(null)
libxl: debug: libxl_event.c:850:libxl__ev_xswatch_deregister: watch
w=3D0x55dd85668ac8 wpath=3D/local/domain/0/device-model/25/state token=3D2=
/2:
deregister slotnum=3D2
libxl: error: libxl_dm.c:3131:device_model_spawn_outcome: Domain
25:domain 25 device model: spawn failed (rc=3D-3)
libxl: error: libxl_dm.c:3351:device_model_postconfig_done: Domain
25:Post DM startup configs failed, rc=3D-3
libxl: debug: libxl_qmp.c:1921:libxl__ev_qmp_dispose:=C2=A0 ev 0x55dd85668=
ae0
libxl: error: libxl_create.c:1867:domcreate_devmodel_started: Domain
25:device model did not start: -3
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x55dd8566a198: deregister unregistered
libxl: debug: libxl_dm.c:3565:libxl__destroy_device_model: Domain
25:Didn't find dm UID; destroying by pid
libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Model
already exited


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B072633C982
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 23:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98130.186037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLvyw-0003gX-Si; Mon, 15 Mar 2021 22:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98130.186037; Mon, 15 Mar 2021 22:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLvyw-0003g8-P2; Mon, 15 Mar 2021 22:46:38 +0000
Received: by outflank-mailman (input) for mailman id 98130;
 Mon, 15 Mar 2021 22:46:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srjA=IN=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lLvyv-0003g3-8O
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 22:46:37 +0000
Received: from MTA-13-3.privateemail.com (unknown [198.54.118.204])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d779b31-dfd1-4be5-8cdf-2f312d3965c9;
 Mon, 15 Mar 2021 22:46:34 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 002F08006B
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 18:46:33 -0400 (EDT)
Received: from mail-wm1-f53.google.com (unknown [10.20.151.220])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 9340980060
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 18:46:33 -0400 (EDT)
Received: by mail-wm1-f53.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so3021859wmq.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 15:46:33 -0700 (PDT)
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
X-Inumbo-ID: 8d779b31-dfd1-4be5-8cdf-2f312d3965c9
X-Gm-Message-State: AOAM530Klh5HMIlMAZDNpi0G55H+bInrrOeicl2B1wOkBm84sTBLdJPs
	Cx5gvrKzC4IAzfH5Q4sYhC3tdunDOEMIMmaGUvo=
X-Google-Smtp-Source: ABdhPJxlLshNbPYrb7r+qCcYWCPfB52pQbhA1SNRFYaLghJowa+eagbEWkDcTS5YiAcgCc1hYKRm89bsvAkW29UMnuw=
X-Received: by 2002:a7b:c214:: with SMTP id x20mr1748364wmi.186.1615848392236;
 Mon, 15 Mar 2021 15:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <CABfawh=fNCxQs+QBsYw5StA+vNwqzyQUHyiib3_rujDS1W8S9A@mail.gmail.com>
 <YE/TfarPGdr9D7HZ@Air-de-Roger>
In-Reply-To: <YE/TfarPGdr9D7HZ@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 15 Mar 2021 18:45:55 -0400
X-Gmail-Original-Message-ID: <CABfawhmWpz1JvZFoX_esxy4aqH2RzdTNLGQ7bbfRZ210YsLF3w@mail.gmail.com>
Message-ID: <CABfawhmWpz1JvZFoX_esxy4aqH2RzdTNLGQ7bbfRZ210YsLF3w@mail.gmail.com>
Subject: Re: 4.15.0-rc3 can't create domain when dom0 uses newer kernel
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000006e232905bd9b056e"
X-Virus-Scanned: ClamAV using ClamSMTP

--0000000000006e232905bd9b056e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 5:37 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
wrote:
>
> On Mon, Mar 15, 2021 at 04:18:42PM -0400, Tamas K Lengyel wrote:
> > Hi all,
> > I've ran into a pretty strange issue. I have a freshly installed
4.15.0-rc3
> > system and everything works fine with the stock Ubuntu 20.04
> > vmlinuz-5.4.0-66-generic as the dom0 kernel - except vmtrace, which
needs a
> > newer kernel, that's expected. Now if I boot dom0 with
> > vmlinuz-5.8.0-44-generic or vmlinuz-5.10.0-1016-oem I can't start any
> > domains because of some strange disk error:
> >
> > root@t2:/shared/cfg# xl create ubuntu-20.04.cfg
> > Parsing config from ubuntu-20.04.cfg
> > libxl: error: libxl_device.c:1109:device_backend_callback: Domain
1:unable
> > to add device with path /local/domain/0/backend/vbd/1/51712
> > libxl: error: libxl_create.c:1613:domcreate_launch_dm: Domain 1:unable
to
> > add disk devices
>
> Can you paste the output with `xl -vvv create ...`?

Here you go:

Parsing config from ubuntu-20.04.cfg
libxl: debug: libxl_create.c:2022:do_domain_create: ao 0x561348383da0:
create: how=3D(nil) callback=3D(nil) poller=3D0x561348383e40
libxl: detail: libxl_create.c:627:libxl__domain_make: passthrough: disabled
libxl: debug: libxl_device.c:379:libxl__device_disk_set_backend: Disk
vdev=3Dxvda spec.backend=3Dunknown
libxl: debug: libxl_device.c:413:libxl__device_disk_set_backend: Disk
vdev=3Dxvda, using backend phy
libxl: debug: libxl_create.c:1284:initiate_domain_create: Domain 5:running
bootloader
libxl: debug: libxl_bootloader.c:328:libxl__bootloader_run: Domain 5:not a
PV/PVH domain, skipping bootloader
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x561348386270: deregister unregistered
domainbuilder: detail: xc_dom_allocate: cmdline=3D"", features=3D""
domainbuilder: detail: xc_dom_kernel_file:
filename=3D"/usr/local/lib/xen/boot/hvmloader"
domainbuilder: detail: xc_dom_malloc_filemap    : 621 kB
libxl: debug: libxl_dom.c:822:libxl__load_hvm_firmware_module: Loading
BIOS: /usr/local/lib/xen/boot/seabios.bin
domainbuilder: detail: xc_dom_boot_xen_init: ver 4.15, caps xen-3.0-x86_64
xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
domainbuilder: detail: xc_dom_parse_image: called
domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader
...
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ...
domainbuilder: detail: loader probe OK
xc: detail: ELF: phdr: paddr=3D0x100000 memsz=3D0x61e04
xc: detail: ELF: memory: 0x100000 -> 0x161e04
domainbuilder: detail: xc_dom_mem_init: mem 10008 MB, pages 0x271800 pages,
4k each
domainbuilder: detail: xc_dom_mem_init: 0x271800 pages
domainbuilder: detail: xc_dom_boot_mem_init: called
domainbuilder: detail: range: start=3D0x0 end=3D0xf0000000
domainbuilder: detail: range: start=3D0x100000000 end=3D0x281800000
xc: detail: PHYSICAL MEMORY ALLOCATION:
xc: detail:   4KB PAGES: 0x0000000000000200
xc: detail:   2MB PAGES: 0x000000000000038b
xc: detail:   1GB PAGES: 0x0000000000000008
domainbuilder: detail: xc_dom_build_image: called
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn
0x100+0x62 at 0x7fc72dd94000
domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x100000 ->
0x162000  (pfn 0x100 + 0x62 pages)
xc: detail: ELF: phdr 0 at 0x7fc72dd32000 -> 0x7fc72dd8a260
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn
0x162+0x40 at 0x7fc72dd54000
domainbuilder: detail: xc_dom_alloc_segment:   System Firmware module :
0x162000 -> 0x1a2000  (pfn 0x162 + 0x40 pages)
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn
0x1a2+0x1 at 0x7fc72e336000
domainbuilder: detail: xc_dom_alloc_segment:   HVM start info : 0x1a2000 ->
0x1a3000  (pfn 0x1a2 + 0x1 pages)
domainbuilder: detail: xc_dom_build_image  : virt_alloc_end : 0x1a3000
domainbuilder: detail: xc_dom_build_image  : virt_pgtab_end : 0x0
domainbuilder: detail: xc_dom_boot_image: called
domainbuilder: detail: xc_dom_compat_check: supported guest type:
xen-3.0-x86_64
domainbuilder: detail: xc_dom_compat_check: supported guest type:
xen-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type:
hvm-3.0-x86_32 <=3D matches
domainbuilder: detail: xc_dom_compat_check: supported guest type:
hvm-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type:
hvm-3.0-x86_64
domainbuilder: detail: domain builder memory footprint
domainbuilder: detail:    allocated
domainbuilder: detail:       malloc             : 7008 bytes
domainbuilder: detail:       anon mmap          : 0 bytes
domainbuilder: detail:    mapped
domainbuilder: detail:       file mmap          : 621 kB
domainbuilder: detail:       domU mmap          : 652 kB
domainbuilder: detail: vcpu_hvm: called
domainbuilder: detail: xc_dom_set_gnttab_entry: d5 gnt[0] -> d0 0xfefff
domainbuilder: detail: xc_dom_set_gnttab_entry: d5 gnt[1] -> d0 0xfeffc
domainbuilder: detail: xc_dom_release: called
libxl: debug: libxl_device.c:379:libxl__device_disk_set_backend: Disk
vdev=3Dxvda spec.backend=3Dphy
libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch
w=3D0x561348389260 wpath=3D/local/domain/0/backend/vbd/5/51712/state token=
=3D3/0:
register slotnum=3D3
libxl: debug: libxl_create.c:2060:do_domain_create: ao 0x561348383da0:
inprogress: poller=3D0x561348383e40, flags=3Di
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=3D0x561348389260
wpath=3D/local/domain/0/backend/vbd/5/51712/state token=3D3/0: event
epath=3D/local/domain/0/backend/vbd/>libxl: debug:
libxl_event.c:1055:devstate_callback: backend
/local/domain/0/backend/vbd/5/51712/state wanted state 2 still waiting
state 1
libxl: debug: libxl_aoutils.c:88:xswait_timeout_callback: backend
/local/domain/0/backend/vbd/5/51712/state (hoping for state change to 2):
xswait timeout (path=3D/local/doma>libxl: debug:
libxl_event.c:850:libxl__ev_xswatch_deregister: watch w=3D0x561348389260
wpath=3D/local/domain/0/backend/vbd/5/51712/state token=3D3/0: deregister
slotnum=3D3
libxl: debug: libxl_event.c:1039:devstate_callback: backend
/local/domain/0/backend/vbd/5/51712/state wanted state 2  timed out
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x561348389260: deregister unregistered
libxl: debug: libxl_device.c:1096:device_backend_callback: Domain 5:calling
device_backend_cleanup
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x561348389260: deregister unregistered
libxl: error: libxl_device.c:1109:device_backend_callback: Domain 5:unable
to add device with path /local/domain/0/backend/vbd/5/51712
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x561348389360: deregister unregistered
libxl: error: libxl_create.c:1613:domcreate_launch_dm: Domain 5:unable to
add disk devices
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x561348387c28: deregister unregistered
libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch
w=3D0x561348388130 wpath=3D/local/domain/0/backend/vbd/5/51712/state token=
=3D3/1:
register slotnum=3D3
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=3D0x561348388130
wpath=3D/local/domain/0/backend/vbd/5/51712/state token=3D3/1: event
epath=3D/local/domain/0/backend/vbd/>libxl: debug:
libxl_event.c:1055:devstate_callback: backend
/local/domain/0/backend/vbd/5/51712/state wanted state 6 still waiting
state 5
libxl: debug: libxl_aoutils.c:88:xswait_timeout_callback: backend
/local/domain/0/backend/vbd/5/51712/state (hoping for state change to 6):
xswait timeout (path=3D/local/doma>libxl: debug:
libxl_event.c:850:libxl__ev_xswatch_deregister: watch w=3D0x561348388130
wpath=3D/local/domain/0/backend/vbd/5/51712/state token=3D3/1: deregister
slotnum=3D3
libxl: debug: libxl_event.c:1039:devstate_callback: backend
/local/domain/0/backend/vbd/5/51712/state wanted state 6  timed out
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x561348388130: deregister unregistered
libxl: debug: libxl_device.c:1096:device_backend_callback: Domain 5:calling
device_backend_cleanup
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x561348388130: deregister unregistered
libxl: error: libxl_device.c:1109:device_backend_callback: Domain 5:unable
to remove device with path /local/domain/0/backend/vbd/5/51712
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch
w=3D0x561348388230: deregister unregistered
libxl: error: libxl_domain.c:1529:devices_destroy_cb: Domain
5:libxl__devices_destroy failed
libxl: debug: libxl_domain.c:1596:devices_destroy_cb: Domain 5:Forked pid
944059 for destroy of domain
libxl: debug: libxl_event.c:2066:libxl__ao_complete: ao 0x561348383da0:
complete, rc=3D-3
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0x561348383da0:
destroy
libxl: debug: libxl_domain.c:1045:libxl_domain_destroy: Domain 5:ao
0x561348382810: create: how=3D(nil) callback=3D(nil) poller=3D0x561348383e4=
0
libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
5:Non-existant domain
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 5:Unable
to destroy guest
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 5:Destruction
of domain failed
libxl: debug: libxl_event.c:2066:libxl__ao_complete: ao 0x561348382810:
complete, rc=3D-21
libxl: debug: libxl_domain.c:1054:libxl_domain_destroy: Domain 5:ao
0x561348382810: inprogress: poller=3D0x561348383e40, flags=3Dic
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0x561348382810:
destroy
xencall:buffer: debug: total allocations:603 total releases:603
xencall:buffer: debug: current allocations:0 maximum allocations:3
xencall:buffer: debug: cache current size:3
xencall:buffer: debug: cache hits:587 misses:3 toobig:13
xencall:buffer: debug: total allocations:0 total releases:0
xencall:buffer: debug: current allocations:0 maximum allocations:0
xencall:buffer: debug: cache current size:0
xencall:buffer: debug: cache hits:0 misses:0 toobig:0

Thanks,
Tamas

--0000000000006e232905bd9b056e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Mar 15, 2021 at 5:37 PM Roger Pau Monn=C3=
=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt=
; wrote:<br>&gt;<br>&gt; On Mon, Mar 15, 2021 at 04:18:42PM -0400, Tamas K =
Lengyel wrote:<br>&gt; &gt; Hi all,<br>&gt; &gt; I&#39;ve ran into a pretty=
 strange issue. I have a freshly installed 4.15.0-rc3<br>&gt; &gt; system a=
nd everything works fine with the stock Ubuntu 20.04<br>&gt; &gt; vmlinuz-5=
.4.0-66-generic as the dom0 kernel - except vmtrace, which needs a<br>&gt; =
&gt; newer kernel, that&#39;s expected. Now if I boot dom0 with<br>&gt; &gt=
; vmlinuz-5.8.0-44-generic or vmlinuz-5.10.0-1016-oem I can&#39;t start any=
<br>&gt; &gt; domains because of some strange disk error:<br>&gt; &gt;<br>&=
gt; &gt; root@t2:/shared/cfg# xl create ubuntu-20.04.cfg<br>&gt; &gt; Parsi=
ng config from ubuntu-20.04.cfg<br>&gt; &gt; libxl: error: libxl_device.c:1=
109:device_backend_callback: Domain 1:unable<br>&gt; &gt; to add device wit=
h path /local/domain/0/backend/vbd/1/51712<br>&gt; &gt; libxl: error: libxl=
_create.c:1613:domcreate_launch_dm: Domain 1:unable to<br>&gt; &gt; add dis=
k devices<br>&gt;<br>&gt; Can you paste the output with `xl -vvv create ...=
`?<div><br></div><div>Here you go:</div><div><br></div><div>Parsing config =
from ubuntu-20.04.cfg<br>libxl: debug: libxl_create.c:2022:do_domain_create=
: ao 0x561348383da0: create: how=3D(nil) callback=3D(nil) poller=3D0x561348=
383e40<br>libxl: detail: libxl_create.c:627:libxl__domain_make: passthrough=
: disabled<br>libxl: debug: libxl_device.c:379:libxl__device_disk_set_backe=
nd: Disk vdev=3Dxvda spec.backend=3Dunknown<br>libxl: debug: libxl_device.c=
:413:libxl__device_disk_set_backend: Disk vdev=3Dxvda, using backend phy<br=
>libxl: debug: libxl_create.c:1284:initiate_domain_create: Domain 5:running=
 bootloader<br>libxl: debug: libxl_bootloader.c:328:libxl__bootloader_run: =
Domain 5:not a PV/PVH domain, skipping bootloader<br>libxl: debug: libxl_ev=
ent.c:864:libxl__ev_xswatch_deregister: watch w=3D0x561348386270: deregiste=
r unregistered<br>domainbuilder: detail: xc_dom_allocate: cmdline=3D&quot;&=
quot;, features=3D&quot;&quot;<br>domainbuilder: detail: xc_dom_kernel_file=
: filename=3D&quot;/usr/local/lib/xen/boot/hvmloader&quot;<br>domainbuilder=
: detail: xc_dom_malloc_filemap =C2=A0 =C2=A0: 621 kB<br>libxl: debug: libx=
l_dom.c:822:libxl__load_hvm_firmware_module: Loading BIOS: /usr/local/lib/x=
en/boot/seabios.bin<br>domainbuilder: detail: xc_dom_boot_xen_init: ver 4.1=
5, caps xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3=
.0-x86_64<br>domainbuilder: detail: xc_dom_parse_image: called<br>domainbui=
lder: detail: xc_dom_find_loader: trying multiboot-binary loader ...<br>dom=
ainbuilder: detail: loader probe failed<br>domainbuilder: detail: xc_dom_fi=
nd_loader: trying HVM-generic loader ...<br>domainbuilder: detail: loader p=
robe OK<br>xc: detail: ELF: phdr: paddr=3D0x100000 memsz=3D0x61e04<br>xc: d=
etail: ELF: memory: 0x100000 -&gt; 0x161e04<br>domainbuilder: detail: xc_do=
m_mem_init: mem 10008 MB, pages 0x271800 pages, 4k each<br>domainbuilder: d=
etail: xc_dom_mem_init: 0x271800 pages<br>domainbuilder: detail: xc_dom_boo=
t_mem_init: called<br>domainbuilder: detail: range: start=3D0x0 end=3D0xf00=
00000<br>domainbuilder: detail: range: start=3D0x100000000 end=3D0x28180000=
0<br>xc: detail: PHYSICAL MEMORY ALLOCATION:<br>xc: detail: =C2=A0 4KB PAGE=
S: 0x0000000000000200<br>xc: detail: =C2=A0 2MB PAGES: 0x000000000000038b<b=
r>xc: detail: =C2=A0 1GB PAGES: 0x0000000000000008</div><div>domainbuilder:=
 detail: xc_dom_build_image: called<br>domainbuilder: detail: xc_dom_pfn_to=
_ptr_retcount: domU mapping: pfn 0x100+0x62 at 0x7fc72dd94000<br>domainbuil=
der: detail: xc_dom_alloc_segment: =C2=A0 kernel =C2=A0 =C2=A0 =C2=A0 : 0x1=
00000 -&gt; 0x162000 =C2=A0(pfn 0x100 + 0x62 pages)<br>xc: detail: ELF: phd=
r 0 at 0x7fc72dd32000 -&gt; 0x7fc72dd8a260<br>domainbuilder: detail: xc_dom=
_pfn_to_ptr_retcount: domU mapping: pfn 0x162+0x40 at 0x7fc72dd54000<br>dom=
ainbuilder: detail: xc_dom_alloc_segment: =C2=A0 System Firmware module : 0=
x162000 -&gt; 0x1a2000 =C2=A0(pfn 0x162 + 0x40 pages)<br>domainbuilder: det=
ail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x1a2+0x1 at 0x7fc72e336=
000<br>domainbuilder: detail: xc_dom_alloc_segment: =C2=A0 HVM start info :=
 0x1a2000 -&gt; 0x1a3000 =C2=A0(pfn 0x1a2 + 0x1 pages)<br>domainbuilder: de=
tail: xc_dom_build_image =C2=A0: virt_alloc_end : 0x1a3000<br>domainbuilder=
: detail: xc_dom_build_image =C2=A0: virt_pgtab_end : 0x0<br>domainbuilder:=
 detail: xc_dom_boot_image: called<br>domainbuilder: detail: xc_dom_compat_=
check: supported guest type: xen-3.0-x86_64<br>domainbuilder: detail: xc_do=
m_compat_check: supported guest type: xen-3.0-x86_32p<br>domainbuilder: det=
ail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32 &lt;=3D matc=
hes<br>domainbuilder: detail: xc_dom_compat_check: supported guest type: hv=
m-3.0-x86_32p<br>domainbuilder: detail: xc_dom_compat_check: supported gues=
t type: hvm-3.0-x86_64<br>domainbuilder: detail: domain builder memory foot=
print<br>domainbuilder: detail: =C2=A0 =C2=A0allocated<br>domainbuilder: de=
tail: =C2=A0 =C2=A0 =C2=A0 malloc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 : 7008 bytes<br>domainbuilder: detail: =C2=A0 =C2=A0 =C2=A0 anon mmap =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 0 bytes<br>domainbuilder: detail: =C2=A0 =
=C2=A0mapped<br>domainbuilder: detail: =C2=A0 =C2=A0 =C2=A0 file mmap =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 621 kB<br>domainbuilder: detail: =C2=A0 =
=C2=A0 =C2=A0 domU mmap =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 652 kB<br>domai=
nbuilder: detail: vcpu_hvm: called<br>domainbuilder: detail: xc_dom_set_gnt=
tab_entry: d5 gnt[0] -&gt; d0 0xfefff<br>domainbuilder: detail: xc_dom_set_=
gnttab_entry: d5 gnt[1] -&gt; d0 0xfeffc<br>domainbuilder: detail: xc_dom_r=
elease: called<br></div><div>libxl: debug: libxl_device.c:379:libxl__device=
_disk_set_backend: Disk vdev=3Dxvda spec.backend=3Dphy<br>libxl: debug: lib=
xl_event.c:813:libxl__ev_xswatch_register: watch w=3D0x561348389260 wpath=
=3D/local/domain/0/backend/vbd/5/51712/state token=3D3/0: register slotnum=
=3D3<br>libxl: debug: libxl_create.c:2060:do_domain_create: ao 0x561348383d=
a0: inprogress: poller=3D0x561348383e40, flags=3Di<br>libxl: debug: libxl_e=
vent.c:750:watchfd_callback: watch w=3D0x561348389260 wpath=3D/local/domain=
/0/backend/vbd/5/51712/state token=3D3/0: event epath=3D/local/domain/0/bac=
kend/vbd/&gt;libxl: debug: libxl_event.c:1055:devstate_callback: backend /l=
ocal/domain/0/backend/vbd/5/51712/state wanted state 2 still waiting state =
1<br>libxl: debug: libxl_aoutils.c:88:xswait_timeout_callback: backend /loc=
al/domain/0/backend/vbd/5/51712/state (hoping for state change to 2): xswai=
t timeout (path=3D/local/doma&gt;libxl: debug: libxl_event.c:850:libxl__ev_=
xswatch_deregister: watch w=3D0x561348389260 wpath=3D/local/domain/0/backen=
d/vbd/5/51712/state token=3D3/0: deregister slotnum=3D3<br>libxl: debug: li=
bxl_event.c:1039:devstate_callback: backend /local/domain/0/backend/vbd/5/5=
1712/state wanted state 2 =C2=A0timed out<br>libxl: debug: libxl_event.c:86=
4:libxl__ev_xswatch_deregister: watch w=3D0x561348389260: deregister unregi=
stered<br>libxl: debug: libxl_device.c:1096:device_backend_callback: Domain=
 5:calling device_backend_cleanup<br>libxl: debug: libxl_event.c:864:libxl_=
_ev_xswatch_deregister: watch w=3D0x561348389260: deregister unregistered<b=
r>libxl: error: libxl_device.c:1109:device_backend_callback: Domain 5:unabl=
e to add device with path /local/domain/0/backend/vbd/5/51712<br>libxl: deb=
ug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch w=3D0x56134838936=
0: deregister unregistered<br>libxl: error: libxl_create.c:1613:domcreate_l=
aunch_dm: Domain 5:unable to add disk devices<br>libxl: debug: libxl_event.=
c:864:libxl__ev_xswatch_deregister: watch w=3D0x561348387c28: deregister un=
registered<br>libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: w=
atch w=3D0x561348388130 wpath=3D/local/domain/0/backend/vbd/5/51712/state t=
oken=3D3/1: register slotnum=3D3<br>libxl: debug: libxl_event.c:750:watchfd=
_callback: watch w=3D0x561348388130 wpath=3D/local/domain/0/backend/vbd/5/5=
1712/state token=3D3/1: event epath=3D/local/domain/0/backend/vbd/&gt;libxl=
: debug: libxl_event.c:1055:devstate_callback: backend /local/domain/0/back=
end/vbd/5/51712/state wanted state 6 still waiting state 5<br>libxl: debug:=
 libxl_aoutils.c:88:xswait_timeout_callback: backend /local/domain/0/backen=
d/vbd/5/51712/state (hoping for state change to 6): xswait timeout (path=3D=
/local/doma&gt;libxl: debug: libxl_event.c:850:libxl__ev_xswatch_deregister=
: watch w=3D0x561348388130 wpath=3D/local/domain/0/backend/vbd/5/51712/stat=
e token=3D3/1: deregister slotnum=3D3<br>libxl: debug: libxl_event.c:1039:d=
evstate_callback: backend /local/domain/0/backend/vbd/5/51712/state wanted =
state 6 =C2=A0timed out<br>libxl: debug: libxl_event.c:864:libxl__ev_xswatc=
h_deregister: watch w=3D0x561348388130: deregister unregistered<br>libxl: d=
ebug: libxl_device.c:1096:device_backend_callback: Domain 5:calling device_=
backend_cleanup<br>libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregi=
ster: watch w=3D0x561348388130: deregister unregistered<br>libxl: error: li=
bxl_device.c:1109:device_backend_callback: Domain 5:unable to remove device=
 with path /local/domain/0/backend/vbd/5/51712<br>libxl: debug: libxl_event=
.c:864:libxl__ev_xswatch_deregister: watch w=3D0x561348388230: deregister u=
nregistered<br>libxl: error: libxl_domain.c:1529:devices_destroy_cb: Domain=
 5:libxl__devices_destroy failed<br>libxl: debug: libxl_domain.c:1596:devic=
es_destroy_cb: Domain 5:Forked pid 944059 for destroy of domain<br>libxl: d=
ebug: libxl_event.c:2066:libxl__ao_complete: ao 0x561348383da0: complete, r=
c=3D-3<br>libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0x5613483=
83da0: destroy<br>libxl: debug: libxl_domain.c:1045:libxl_domain_destroy: D=
omain 5:ao 0x561348382810: create: how=3D(nil) callback=3D(nil) poller=3D0x=
561348383e40<br>libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Dom=
ain 5:Non-existant domain<br>libxl: error: libxl_domain.c:1136:domain_destr=
oy_callback: Domain 5:Unable to destroy guest<br>libxl: error: libxl_domain=
.c:1063:domain_destroy_cb: Domain 5:Destruction of domain failed<br>libxl: =
debug: libxl_event.c:2066:libxl__ao_complete: ao 0x561348382810: complete, =
rc=3D-21<br>libxl: debug: libxl_domain.c:1054:libxl_domain_destroy: Domain =
5:ao 0x561348382810: inprogress: poller=3D0x561348383e40, flags=3Dic<br></d=
iv><div>libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0x561348382=
810: destroy<br>xencall:buffer: debug: total allocations:603 total releases=
:603<br>xencall:buffer: debug: current allocations:0 maximum allocations:3<=
br>xencall:buffer: debug: cache current size:3<br>xencall:buffer: debug: ca=
che hits:587 misses:3 toobig:13<br>xencall:buffer: debug: total allocations=
:0 total releases:0<br>xencall:buffer: debug: current allocations:0 maximum=
 allocations:0<br>xencall:buffer: debug: cache current size:0<br>xencall:bu=
ffer: debug: cache hits:0 misses:0 toobig:0</div><div><br></div><div>Thanks=
,</div><div>Tamas</div></div>

--0000000000006e232905bd9b056e--


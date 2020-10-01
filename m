Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58D7280310
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 17:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1352.4497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0jI-0004zd-Hk; Thu, 01 Oct 2020 15:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352.4497; Thu, 01 Oct 2020 15:42:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0jI-0004zE-E8; Thu, 01 Oct 2020 15:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1352;
 Thu, 01 Oct 2020 15:42:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HoEC=DI=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1kO0jG-0004z9-Em
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:42:46 +0000
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b28433a5-057c-4b29-81f4-e8e07f927f69;
 Thu, 01 Oct 2020 15:42:44 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7D135A2F67
 for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 779F2A2F59
 for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:42 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cjohqrD-Xtwi for <xen-devel@lists.xenproject.org>;
 Thu,  1 Oct 2020 17:42:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C786FA2F67
 for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:41 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Tmrf6RBOE5U8 for <xen-devel@lists.xenproject.org>;
 Thu,  1 Oct 2020 17:42:41 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AA09FA2F59
 for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9EEB720B6D
 for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:06 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gWshB_rix9df for <xen-devel@lists.xenproject.org>;
 Thu,  1 Oct 2020 17:42:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id AC83A206C5
 for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:00 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id em-h3gH6oaI1 for <xen-devel@lists.xenproject.org>;
 Thu,  1 Oct 2020 17:42:00 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8149720260
 for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:00 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HoEC=DI=cert.pl=michall@srs-us1.protection.inumbo.net>)
	id 1kO0jG-0004z9-Em
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:42:46 +0000
X-Inumbo-ID: b28433a5-057c-4b29-81f4-e8e07f927f69
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b28433a5-057c-4b29-81f4-e8e07f927f69;
	Thu, 01 Oct 2020 15:42:44 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
	by bagnar.nask.net.pl (Postfix) with ESMTP id 7D135A2F67
	for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bagnar.nask.net.pl (Postfix) with ESMTP id 779F2A2F59
	for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:42 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
	by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id cjohqrD-Xtwi for <xen-devel@lists.xenproject.org>;
	Thu,  1 Oct 2020 17:42:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bagnar.nask.net.pl (Postfix) with ESMTP id C786FA2F67
	for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
	by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Tmrf6RBOE5U8 for <xen-devel@lists.xenproject.org>;
	Thu,  1 Oct 2020 17:42:41 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl [195.187.242.210])
	by bagnar.nask.net.pl (Postfix) with ESMTP id AA09FA2F59
	for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by belindir.nask.net.pl (Postfix) with ESMTP id 9EEB720B6D
	for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:06 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
	by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id gWshB_rix9df for <xen-devel@lists.xenproject.org>;
	Thu,  1 Oct 2020 17:42:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by belindir.nask.net.pl (Postfix) with ESMTP id AC83A206C5
	for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
	by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id em-h3gH6oaI1 for <xen-devel@lists.xenproject.org>;
	Thu,  1 Oct 2020 17:42:00 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
	by belindir.nask.net.pl (Postfix) with ESMTP id 8149720260
	for <xen-devel@lists.xenproject.org>; Thu,  1 Oct 2020 17:42:00 +0200 (CEST)
Date: Thu, 1 Oct 2020 17:42:00 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1713934165.348347309.1601566920443.JavaMail.zimbra@cert.pl>
Subject: BUG: SIGSEGV in audio_pcm_sw_write with Windows 7 SP 1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - FF81 (Linux)/8.6.0_GA_1194)
Thread-Topic: SIGSEGV in audio_pcm_sw_write with Windows 7 SP 1
Thread-Index: F/7lr5jIhOMk/9GSjC42aY/5S1cqmw==

Hello,

I'm running the recent Xen master:
https://github.com/xen-project/xen/tree/d4ed1d4132f5825a795d5a78505811ecd27=
17b5e

when I install Windows 7 SP1, qemu-system-i386 crashes on the first attempt=
 to use audio device (i.e. when Windows boots to the Desktop and tries to p=
lay the log-in sound).

Is there some regression in qemu which triggers for my configuration?

Enclosed: xl info, my xl.cfg and the crash report from GDB.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

---

root@zen2:/opt/win7# xl info
host                   : zen2
release                : 4.19.0-10-amd64
version                : #1 SMP Debian 4.19.132-1 (2020-07-24)
machine                : x86_64
nr_cpus                : 4
max_cpu_id             : 3
nr_nodes               : 1
cores_per_socket       : 4
threads_per_core       : 1
cpu_mhz                : 3000.227
hw_caps                : bfebfbff:76faf3bf:2c100800:00000121:0000000f:029c6=
7af:00000000:00000100
virt_caps              : pv hvm hvm_directio pv_directio hap shadow iommu_h=
ap_pt_share
total_memory           : 16292
free_memory            : 4687
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 15
xen_extra              : -unstable
xen_version            : 4.15-unstable
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-=
3.0-x86_32p hvm-3.0-x86_64=20
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          :=20
xen_commandline        : placeholder dom0_mem=3D8192M,max:8192M dom0_max_vc=
pus=3D4 dom0_vcpus_pin=3D1 force-ept=3D1 ept=3Dpml=3D0 hap_1gb=3D0 hap_2mb=
=3D0 altp2m=3D1 smt=3D0
cc_compiler            : gcc (Debian 8.3.0-6) 8.3.0
cc_compile_by          : root
cc_compile_domain      : cert.pl
cc_compile_date        : Thu Oct  1 17:00:45 CEST 2020
build_id               : caeeb34d88d2f2bafc724be963a70ef68a9a552a
xend_config_format     : 4

---

arch =3D 'x86_64'
name =3D "vm-0"
maxmem =3D 3048
memory =3D 3048
vcpus =3D 2
maxvcpus =3D 2
builder =3D "hvm"
boot =3D "cd,menu=3Don,splash=3D/usr/share/drakrun/splash.jpg,splash-time=
=3D2000"
hap =3D 1
acpi =3D 1
on_poweroff =3D "destroy"
on_reboot =3D "restart"
on_crash =3D "destroy"
vnc=3D1
vnclisten=3D"0.0.0.0:0,websocket=3D6400"
vncpasswd=3D"sth123"
usb =3D 1
usbdevice =3D "tablet"
altp2m =3D 2
shadow_memory =3D 16
audio =3D 1
soundhw=3D'hda'
cpuid=3D"host,htt=3D0"
vga=3D"stdvga"
vif =3D [ 'type=3Dioemu,model=3De1000,bridge=3Ddrak0' ]
disk =3D [ "tap:qcow2:/var/lib/drakrun/volumes/vm-0.img,xvda,w", "file:/opt=
/win7/SW_DVD5_Win_Pro_7w_SP1_64BIT_Polish_-2_MLF_X17-59386.ISO,hdc:cdrom,r"=
, "file:/var/lib/drakrun/volumes/unattended.iso,hdd:cdrom,r" ]
processor_trace_buf_kb=3D65536

---

Thread 1 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
audio_pcm_sw_write (sw=3D0x556c610f5330, buf=3D0x0, size=3D1612) at /opt/dr=
akvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/audio/audio.c:739             =
                                                         =20
739             if (!sw->hw->pcm_ops->volume_out) {
(gdb) bt
#0  0x0000556c5e4716cb in audio_pcm_sw_write (sw=3D0x556c610f5330, buf=3D0x=
0, size=3D1612) at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/audi=
o/audio.c:739                                            =20
#1  0x0000556c5e47463e in audio_capture_mix_and_clear (hw=3D0x556c60f1c440,=
 rpos=3D0, samples=3D403) at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xe=
n-dir/audio/audio.c:1069                                 =20
#2  0x0000556c5e474c44 in audio_run_out (s=3D0x556c60f1c170) at /opt/drakvu=
f-sandbox/drakvuf/xen/tools/qemu-xen-dir/audio/audio.c:1203                =
                                                     =20
#3  0x0000556c5e47546e in audio_run (s=3D0x556c60f1c170, msg=3D0x556c5e9bf2=
38 "timer") at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/audio/au=
dio.c:1372                                             =20
#4  0x0000556c5e473f35 in audio_timer (opaque=3D0x556c60f1c170) at /opt/dra=
kvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/audio/audio.c:846              =
                                                     =20
#5  0x0000556c5e85f6a5 in timerlist_run_timers (timer_list=3D0x556c60557500=
) at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/util/qemu-timer.c:=
587                                                  =20
#6  0x0000556c5e85f74f in qemu_clock_run_timers (type=3DQEMU_CLOCK_VIRTUAL)=
 at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/util/qemu-timer.c:6=
01                                                   =20
#7  0x0000556c5e85fa0f in qemu_clock_run_all_timers () at /opt/drakvuf-sand=
box/drakvuf/xen/tools/qemu-xen-dir/util/qemu-timer.c:687                   =
                                                   =20
#8  0x0000556c5e860384 in main_loop_wait (nonblocking=3D0) at /opt/drakvuf-=
sandbox/drakvuf/xen/tools/qemu-xen-dir/util/main-loop.c:573                =
                                                     =20
#9  0x0000556c5e3f1dfc in qemu_main_loop () at /opt/drakvuf-sandbox/drakvuf=
/xen/tools/qemu-xen-dir/softmmu/vl.c:1664                                  =
                                                   =20
#10 0x0000556c5e7fda31 in main (argc=3D45, argv=3D0x7ffea849a5a8, envp=3D0x=
7ffea849a718) at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/softmm=
u/main.c:49                                              =20
(gdb)
#0  0x0000556c5e4716cb in audio_pcm_sw_write (sw=3D0x556c610f5330, buf=3D0x=
0, size=3D1612)
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/audio/audio.c:73=
9
#1  0x0000556c5e47463e in audio_capture_mix_and_clear (hw=3D0x556c60f1c440,=
 rpos=3D0, samples=3D403)
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/audio/audio.c:10=
69
#2  0x0000556c5e474c44 in audio_run_out (s=3D0x556c60f1c170)
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/audio/audio.c:12=
03
#3  0x0000556c5e47546e in audio_run (s=3D0x556c60f1c170, msg=3D0x556c5e9bf2=
38 "timer")
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/audio/audio.c:13=
72
#4  0x0000556c5e473f35 in audio_timer (opaque=3D0x556c60f1c170)
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/audio/audio.c:84=
6
#5  0x0000556c5e85f6a5 in timerlist_run_timers (timer_list=3D0x556c60557500=
)
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/util/qemu-timer.=
c:587
#6  0x0000556c5e85f74f in qemu_clock_run_timers (type=3DQEMU_CLOCK_VIRTUAL)
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/util/qemu-timer.=
c:601
#7  0x0000556c5e85fa0f in qemu_clock_run_all_timers ()
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/util/qemu-timer.=
c:687
#8  0x0000556c5e860384 in main_loop_wait (nonblocking=3D0)
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/util/main-loop.c=
:573
#9  0x0000556c5e3f1dfc in qemu_main_loop ()
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/softmmu/vl.c:166=
4
#10 0x0000556c5e7fda31 in main (argc=3D45, argv=3D0x7ffea849a5a8, envp=3D0x=
7ffea849a718)
    at /opt/drakvuf-sandbox/drakvuf/xen/tools/qemu-xen-dir/softmmu/main.c:4=
9


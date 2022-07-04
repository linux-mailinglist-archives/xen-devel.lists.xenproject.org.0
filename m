Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E2B564DC4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 08:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359804.589098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Fid-0001tW-Ui; Mon, 04 Jul 2022 06:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359804.589098; Mon, 04 Jul 2022 06:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Fid-0001pz-OA; Mon, 04 Jul 2022 06:38:03 +0000
Received: by outflank-mailman (input) for mailman id 359804;
 Mon, 04 Jul 2022 06:38:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbiE=XJ=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o8Fic-0001kK-5g
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 06:38:02 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d739d5c3-fb63-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 08:37:59 +0200 (CEST)
Received: by mail-ej1-f51.google.com with SMTP id g26so14961212ejb.5;
 Sun, 03 Jul 2022 23:37:57 -0700 (PDT)
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
X-Inumbo-ID: d739d5c3-fb63-11ec-bd2d-47488cf2e6aa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=iYZl4R3hj1/kOzoGUfDETMzA8xu2/bZIMDei7qwJjkA=;
        b=UtHrOCyud2do3FdvTIx/m8xhl6us4BHWfJ5gv4uiUF9gf2UnEAp44TNb05LTaA+uMe
         JjS2oqCyYP0O7/nNkQB/+M26Udrk+CV8aRcAXeN8xHdXV2FsKbH39paIBnl/W2HKm2vj
         8/pVR9hr8gHSHUS+m0ams8cM59+v74hWr2umKfht8lhALDzuPxrKmCReU9iV6lWT+vGE
         0uZxmk9BXqliGCu31sdm+LKgU7mLMj+WhpfzzqvCtpWGbodMhmqbdHjIZIQt1pK7dIRw
         0r6smnAb+EAIfq0YhdfSef2CgQrx7QMgCET9p0AvRHzic9L+xoxW8B8PdixZyJpKJ8Kb
         mNfA==
X-Gm-Message-State: AJIora/Q8qAc+6+bFSzUYo2XMcnQoHo+PIOWalnysajjjUr5Ny24rqW5
	OilxmsHD45wlCbDu1AaI/olgbJ7WlO6r2toEE7jYLBouYGo=
X-Google-Smtp-Source: AGRyM1sZKxuXarhXANsTp/C/R6AM2h2yyxr1HOpIeX3JXp3zCGGd7zsmpZX0oJl0g4QV7CUYC+wJr4OoHsCK3dQM4co=
X-Received: by 2002:a17:906:9b8a:b0:722:e50e:2a6d with SMTP id
 dd10-20020a1709069b8a00b00722e50e2a6dmr27840297ejc.724.1656916676647; Sun, 03
 Jul 2022 23:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
In-Reply-To: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Mon, 4 Jul 2022 14:37:44 +0800
Message-ID: <CAKhsbWbqk5zW5D3D6RUdoj6bZaSURB5kTZ66Tq-0kWezWwGfuw@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: xen-users <xen-users@lists.xen.org>, xen-devel <xen-devel@lists.xen.org>
Content-Type: multipart/mixed; boundary="000000000000ef66cb05e2f4f988"

--000000000000ef66cb05e2f4f988
Content-Type: text/plain; charset="UTF-8"

Update some findings with extra triage effort...
Detailed log could be found in the attachments.
1. Confirm stock Debian 11.2 kernel (5.10) shares the same syndrome..
2. With loglvl=all, it reveals why the mapping failure happens, looks
like it comes from some duplicated mapping..
(XEN) memory_map:add: dom1 gfn=f3074 mfn=a2610 nr=2
(XEN) memory_map:add: dom1 gfn=f3077 mfn=a2615 nr=1
(XEN) memory_map:add: dom1 gfn=f3078 mfn=a2616 nr=1 <===========Here
(XEN) ioport_map:add: dom1 gport=c140 mport=4060 nr=20
(XEN) ioport_map:add: dom1 gport=c170 mport=4090 nr=8
(XEN) ioport_map:add: dom1 gport=c178 mport=4080 nr=4
(XEN) memory_map:add: dom1 gfn=f3070 mfn=a2500 nr=2
(XEN) memory_map:add: dom1 gfn=f3073 mfn=a2503 nr=1
(XEN) memory_map:add: dom1 gfn=f3078 mfn=a2504 nr=1 <===========Here
(XEN) d1: GFN 0xf3078 (0xa2616,0,5,7) -> (0xa2504,0,5,7) not permitted
(XEN) domain_crash called from p2m.c:1301
(XEN) Domain 1 reported crashed by domain 0 on cpu#2:
(XEN) memory_map:fail: dom1 gfn=f3078 mfn=a2504 nr=1 ret:-1
(XEN) memory_map:remove: dom1 gfn=f3078 mfn=a2504 nr=1

3. Recompiled kernel with DEBUG enabled for xen_pciback driver and
play with xl pci-assignable-XXX with it
3.1 It's confirmed that the DPC / AER error log happens only when
xen_pciback attempts to seize && release the device
3.1.1 It only happens on each of the first add / remove operations.
3.2 There is still a 'MSI-X preparation failed' message later-on, but
otherwise it appears to be successful to add / remove the device after
the 1st attempt.
3.3 Not necessarily related, but the DPC / AER log looks similar to
this report [1]


[1]: https://patchwork.kernel.org/project/linux-pci/patch/20220127025418.1989642-1-kai.heng.feng@canonical.com/#24713767
PS: Attempting to fix the line-wrapping issue below... Have no idea
what happened about the formatting....

On Sun, Jul 3, 2022 at 1:43 AM G.R. <firemeteor@users.sourceforge.net> wrote:
>
> Hi everybody,
>
> I run into problems passing through a SN570 NVME SSD to a HVM guest.
> So far I have no idea if the problem is with this specific SSD or with
> the CPU + motherboard combination or the SW stack.
> Looking for some suggestions on troubleshooting.
>
> List of build info:
> CPU+motherboard: E-2146G + Gigabyte C246N-WU2
> XEN version: 4.14.3
> Dom0: Linux Kernel 5.10 (built from Debian 11.2 kernel source package)
> The SN570 SSD sits here in the PCI tree:
>            +-1d.0-[05]----00.0  Sandisk Corp Device 501a
>
> Syndromes observed:
> With ASPM enabled, pciback has problem seizing the device.
>
> Jul  2 00:36:54 gaia kernel: [    1.648270] pciback 0000:05:00.0: xen_pciback: seizing device
> ...
> Jul  2 00:36:54 gaia kernel: [    1.768646] pcieport 0000:00:1d.0: AER: enabled with IRQ 150
> Jul  2 00:36:54 gaia kernel: [    1.768716] pcieport 0000:00:1d.0: DPC: enabled with IRQ 150
> Jul  2 00:36:54 gaia kernel: [    1.768717] pcieport 0000:00:1d.0: DPC: error containment capabilities: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, DL_ActiveErr+
> ...
> Jul  2 00:36:54 gaia kernel: [    1.770039] xen: registering gsi 16 triggering 0 polarity 1
> Jul  2 00:36:54 gaia kernel: [    1.770041] Already setup the GSI :16
> Jul  2 00:36:54 gaia kernel: [    1.770314] pcieport 0000:00:1d.0: DPC: containment event, status:0x1f11 source:0x0000
> Jul  2 00:36:54 gaia kernel: [    1.770315] pcieport 0000:00:1d.0: DPC: unmasked uncorrectable error detected
> Jul  2 00:36:54 gaia kernel: [    1.770320] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Receiver ID)
> Jul  2 00:36:54 gaia kernel: [    1.770371] pcieport 0000:00:1d.0: device [8086:a330] error status/mask=00200000/00010000
> Jul  2 00:36:54 gaia kernel: [    1.770413] pcieport 0000:00:1d.0: [21] ACSViol                (First)
> Jul  2 00:36:54 gaia kernel: [    1.770466] pciback 0000:05:00.0: xen_pciback: device is not found/assigned
> Jul  2 00:36:54 gaia kernel: [    1.920195] pciback 0000:05:00.0: xen_pciback: device is not found/assigned
> Jul  2 00:36:54 gaia kernel: [    1.920260] pcieport 0000:00:1d.0: AER: device recovery successful
> Jul  2 00:36:54 gaia kernel: [    1.920263] pcieport 0000:00:1d.0: DPC: containment event, status:0x1f01 source:0x0000
> Jul  2 00:36:54 gaia kernel: [    1.920264] pcieport 0000:00:1d.0: DPC: unmasked uncorrectable error detected
> Jul  2 00:36:54 gaia kernel: [    1.920267] pciback 0000:05:00.0: xen_pciback: device is not found/assigned
> Jul  2 00:36:54 gaia kernel: [    1.938406] xen: registering gsi 16 triggering 0 polarity 1
> Jul  2 00:36:54 gaia kernel: [    1.938408] Already setup the GSI :16
> Jul  2 00:36:54 gaia kernel: [    1.938666] xen_pciback: backend is vpci
> ...
> Jul  2 00:43:48 gaia kernel: [  420.231955] pcieport 0000:00:1d.0: DPC: containment event, status:0x1f01 source:0x0000
> Jul  2 00:43:48 gaia kernel: [  420.231961] pcieport 0000:00:1d.0: DPC: unmasked uncorrectable error detected
> Jul  2 00:43:48 gaia kernel: [  420.231993] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> Jul  2 00:43:48 gaia kernel: [  420.235775] pcieport 0000:00:1d.0: device [8086:a330] error status/mask=00100000/00010000
> Jul  2 00:43:48 gaia kernel: [  420.235779] pcieport 0000:00:1d.0: [20] UnsupReq               (First)
> Jul  2 00:43:48 gaia kernel: [  420.235783] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 05000010 00000000 88458845
> Jul  2 00:43:48 gaia kernel: [  420.235819] pci 0000:05:00.0: AER: can't recover (no error_detected callback)
> Jul  2 00:43:48 gaia kernel: [  420.384349] pcieport 0000:00:1d.0: AER: device recovery successful
> ... // The following might relate to an attempt to assign the device to guest, not very sure...
> Jul  2 00:46:06 gaia kernel: [  559.147333] pciback 0000:05:00.0: xen_pciback: seizing device
> Jul  2 00:46:06 gaia kernel: [  559.147435] pciback 0000:05:00.0: enabling device (0000 -> 0002)
> Jul  2 00:46:06 gaia kernel: [  559.147508] xen: registering gsi 16 triggering 0 polarity 1
> Jul  2 00:46:06 gaia kernel: [  559.147511] Already setup the GSI :16
> Jul  2 00:46:06 gaia kernel: [  559.147558] pciback 0000:05:00.0: xen_pciback: MSI-X preparation failed (-6)
>
>
> With pcie_aspm=off, the error log related to pciback goes away.
> But I suspect there are still some problems hidden -- since I don't
> see any AER enabled messages so errors may be hidden.
> I have the xen_pciback built directly into the kernel and assigned the
> SSD to it in the kernel command-line.
> However, the result from pci-assignable-xxx commands are not very consistent:
>
> root@gaia:~# xl pci-assignable-list
> 0000:00:17.0
> 0000:05:00.0
> root@gaia:~# xl pci-assignable-remove 05:00.0
> libxl: error: libxl_pci.c:853:libxl__device_pci_assignable_remove: failed to de-quarantine 0000:05:00.0 <===== Here!!!
> root@gaia:~# xl pci-assignable-add 05:00.0
> libxl: warning: libxl_pci.c:794:libxl__device_pci_assignable_add: 0000:05:00.0 already assigned to pciback <==== Here!!!
> root@gaia:~# xl pci-assignable-remove 05:00.0
> root@gaia:~# xl pci-assignable-list 0000:00:17.0
> root@gaia:~# xl pci-assignable-add 05:00.0
> libxl: warning: libxl_pci.c:814:libxl__device_pci_assignable_add: 0000:05:00.0 not bound to a driver, will not be rebound.
> root@gaia:~# xl pci-assignable-list
> 0000:00:17.0
> 0000:05:00.0
>
>
> After the 'xl pci-assignable-list' appears to be self-consistent, creating VM with the SSD assigned still leads to a guest crash:
> From qemu log:
> [00:06.0] xen_pt_region_update: Error: create new mem mapping failed! (err: 1)
> qemu-system-i386: terminating on signal 1 from pid 1192 (xl)
>
> From the 'xl dmesg' output:
> (XEN) d1: GFN 0xf3078 (0xa2616,0,5,7) -> (0xa2504,0,5,7) not permitted
> (XEN) domain_crash called from p2m.c:1301
> (XEN) Domain 1 reported crashed by domain 0 on cpu#4:
> (XEN) memory_map:fail: dom1 gfn=f3078 mfn=a2504 nr=1 ret:-1
>
>
> Which of the three syndromes are more fundamental?
> 1. The DPC / AER error log
> 2. The inconsistency in 'xl pci-assignable-list' state tracking
> 3. The GFN mapping failure on guest setup
>
> Any suggestions for the next step?
>
>
> Thanks,
> G.R.

--000000000000ef66cb05e2f4f988
Content-Type: text/x-log; charset="US-ASCII"; name="xldmesg_sn570_pt_fail.log"
Content-Disposition: attachment; filename="xldmesg_sn570_pt_fail.log"
Content-Transfer-Encoding: base64
Content-ID: <f_l56d1wq61>
X-Attachment-Id: f_l56d1wq61

KFhFTikgSFZNIGQxdjAgc2F2ZTogQ1BVCihYRU4pIEhWTSBkMXYxIHNhdmU6IENQVQooWEVOKSBI
Vk0gZDEgc2F2ZTogUElDCihYRU4pIEhWTSBkMSBzYXZlOiBJT0FQSUMKKFhFTikgSFZNIGQxdjAg
c2F2ZTogTEFQSUMKKFhFTikgSFZNIGQxdjEgc2F2ZTogTEFQSUMKKFhFTikgSFZNIGQxdjAgc2F2
ZTogTEFQSUNfUkVHUwooWEVOKSBIVk0gZDF2MSBzYXZlOiBMQVBJQ19SRUdTCihYRU4pIEhWTSBk
MSBzYXZlOiBQQ0lfSVJRCihYRU4pIEhWTSBkMSBzYXZlOiBJU0FfSVJRCihYRU4pIEhWTSBkMSBz
YXZlOiBQQ0lfTElOSwooWEVOKSBIVk0gZDEgc2F2ZTogUElUCihYRU4pIEhWTSBkMSBzYXZlOiBS
VEMKKFhFTikgSFZNIGQxIHNhdmU6IEhQRVQKKFhFTikgSFZNIGQxIHNhdmU6IFBNVElNRVIKKFhF
TikgSFZNIGQxdjAgc2F2ZTogTVRSUgooWEVOKSBIVk0gZDF2MSBzYXZlOiBNVFJSCihYRU4pIEhW
TSBkMSBzYXZlOiBWSVJJRElBTl9ET01BSU4KKFhFTikgSFZNIGQxdjAgc2F2ZTogQ1BVX1hTQVZF
CihYRU4pIEhWTSBkMXYxIHNhdmU6IENQVV9YU0FWRQooWEVOKSBIVk0gZDF2MCBzYXZlOiBWSVJJ
RElBTl9WQ1BVCihYRU4pIEhWTSBkMXYxIHNhdmU6IFZJUklESUFOX1ZDUFUKKFhFTikgSFZNIGQx
djAgc2F2ZTogVk1DRV9WQ1BVCihYRU4pIEhWTSBkMXYxIHNhdmU6IFZNQ0VfVkNQVQooWEVOKSBI
Vk0gZDF2MCBzYXZlOiBUU0NfQURKVVNUCihYRU4pIEhWTSBkMXYxIHNhdmU6IFRTQ19BREpVU1QK
KFhFTikgSFZNIGQxdjAgc2F2ZTogQ1BVX01TUgooWEVOKSBIVk0gZDF2MSBzYXZlOiBDUFVfTVNS
CihYRU4pIEhWTTEgcmVzdG9yZTogQ1BVIDAKKGQxKSBIVk0gTG9hZGVyCihkMSkgRGV0ZWN0ZWQg
WGVuIHY0LjE0LjMKKGQxKSBYZW5idXMgcmluZ3MgQDB4ZmVmZmMwMDAsIGV2ZW50IGNoYW5uZWwg
MQooZDEpIFN5c3RlbSByZXF1ZXN0ZWQgU2VhQklPUwooZDEpIENQVSBzcGVlZCBpcyAzNTA1IE1I
egooZDEpIFJlbG9jYXRpbmcgZ3Vlc3QgbWVtb3J5IGZvciBsb3dtZW0gTU1JTyBzcGFjZSBkaXNh
YmxlZAooZDEpIFBDSS1JU0EgbGluayAwIHJvdXRlZCB0byBJUlE1CihkMSkgUENJLUlTQSBsaW5r
IDEgcm91dGVkIHRvIElSUTEwCihkMSkgUENJLUlTQSBsaW5rIDIgcm91dGVkIHRvIElSUTExCihk
MSkgUENJLUlTQSBsaW5rIDMgcm91dGVkIHRvIElSUTUKKGQxKSBwY2kgZGV2IDAxOjMgSU5UQS0+
SVJRMTAKKGQxKSBwY2kgZGV2IDAyOjAgSU5UQS0+SVJRMTEKKGQxKSBwY2kgZGV2IDA0OjAgSU5U
QS0+SVJRNQooZDEpIHBjaSBkZXYgMDU6MCBJTlRBLT5JUlExMAooZDEpIHBjaSBkZXYgMDY6MCBJ
TlRBLT5JUlExMQooZDEpIFJBTSBpbiBoaWdoIG1lbW9yeTsgc2V0dGluZyBoaWdoX21lbSByZXNv
dXJjZSBiYXNlIHRvIDQwZjgwMDAwMAooZDEpIHBjaSBkZXYgMDM6MCBiYXIgMTAgc2l6ZSAwMDIw
MDAwMDA6IDBmMDAwMDAwOAooZDEpIHBjaSBkZXYgMDI6MCBiYXIgMTQgc2l6ZSAwMDEwMDAwMDA6
IDBmMjAwMDAwOAooZDEpIHBjaSBkZXYgMDQ6MCBiYXIgMzAgc2l6ZSAwMDAwNDAwMDA6IDBmMzAw
MDAwMAooZDEpIHBjaSBkZXYgMDQ6MCBiYXIgMTAgc2l6ZSAwMDAwMjAwMDA6IDBmMzA0MDAwMAoo
ZDEpIHBjaSBkZXYgMDM6MCBiYXIgMzAgc2l6ZSAwMDAwMTAwMDA6IDBmMzA2MDAwMAooZDEpIHBj
aSBkZXYgMDY6MCBiYXIgMTAgc2l6ZSAwMDAwMDQwMDA6IDBmMzA3MDAwNAooZDEpIHBjaSBkZXYg
MDU6MCBiYXIgMTAgc2l6ZSAwMDAwMDIwMDA6IDBmMzA3NDAwMAooZDEpIHBjaSBkZXYgMDM6MCBi
YXIgMTQgc2l6ZSAwMDAwMDEwMDA6IDBmMzA3NjAwMAooZDEpIHBjaSBkZXYgMDU6MCBiYXIgMjQg
c2l6ZSAwMDAwMDA4MDA6IDBmMzA3NzAwMAooZDEpIHBjaSBkZXYgMDI6MCBiYXIgMTAgc2l6ZSAw
MDAwMDAxMDA6IDAwMDAwYzAwMQooZDEpIHBjaSBkZXYgMDU6MCBiYXIgMTQgc2l6ZSAwMDAwMDAx
MDA6IDBmMzA3NzgwMAooZDEpIHBjaSBkZXYgMDY6MCBiYXIgMjAgc2l6ZSAwMDAwMDAxMDA6IDBm
MzA3NzkwNAooZDEpIHBjaSBkZXYgMDQ6MCBiYXIgMTQgc2l6ZSAwMDAwMDAwNDA6IDAwMDAwYzEw
MQooZDEpIHBjaSBkZXYgMDU6MCBiYXIgMjAgc2l6ZSAwMDAwMDAwMjA6IDAwMDAwYzE0MQooZDEp
IHBjaSBkZXYgMDE6MSBiYXIgMjAgc2l6ZSAwMDAwMDAwMTA6IDAwMDAwYzE2MQooZDEpIHBjaSBk
ZXYgMDU6MCBiYXIgMTggc2l6ZSAwMDAwMDAwMDg6IDAwMDAwYzE3MQooZDEpIHBjaSBkZXYgMDU6
MCBiYXIgMWMgc2l6ZSAwMDAwMDAwMDQ6IDAwMDAwYzE3OQooWEVOKSBtZW1vcnlfbWFwOmFkZDog
ZG9tMSBnZm49ZjMwNzQgbWZuPWEyNjEwIG5yPTIKKFhFTikgbWVtb3J5X21hcDphZGQ6IGRvbTEg
Z2ZuPWYzMDc3IG1mbj1hMjYxNSBucj0xCihYRU4pIG1lbW9yeV9tYXA6YWRkOiBkb20xIGdmbj1m
MzA3OCBtZm49YTI2MTYgbnI9MQooWEVOKSBpb3BvcnRfbWFwOmFkZDogZG9tMSBncG9ydD1jMTQw
IG1wb3J0PTQwNjAgbnI9MjAKKFhFTikgaW9wb3J0X21hcDphZGQ6IGRvbTEgZ3BvcnQ9YzE3MCBt
cG9ydD00MDkwIG5yPTgKKFhFTikgaW9wb3J0X21hcDphZGQ6IGRvbTEgZ3BvcnQ9YzE3OCBtcG9y
dD00MDgwIG5yPTQKKFhFTikgbWVtb3J5X21hcDphZGQ6IGRvbTEgZ2ZuPWYzMDcwIG1mbj1hMjUw
MCBucj0yCihYRU4pIG1lbW9yeV9tYXA6YWRkOiBkb20xIGdmbj1mMzA3MyBtZm49YTI1MDMgbnI9
MQooWEVOKSBtZW1vcnlfbWFwOmFkZDogZG9tMSBnZm49ZjMwNzggbWZuPWEyNTA0IG5yPTEKKFhF
TikgZDE6IEdGTiAweGYzMDc4ICgweGEyNjE2LDAsNSw3KSAtPiAoMHhhMjUwNCwwLDUsNykgbm90
IHBlcm1pdHRlZAooWEVOKSBkb21haW5fY3Jhc2ggY2FsbGVkIGZyb20gcDJtLmM6MTMwMQooWEVO
KSBEb21haW4gMSByZXBvcnRlZCBjcmFzaGVkIGJ5IGRvbWFpbiAwIG9uIGNwdSMyOgooWEVOKSBt
ZW1vcnlfbWFwOmZhaWw6IGRvbTEgZ2ZuPWYzMDc4IG1mbj1hMjUwNCBucj0xIHJldDotMQooWEVO
KSBtZW1vcnlfbWFwOnJlbW92ZTogZG9tMSBnZm49ZjMwNzggbWZuPWEyNTA0IG5yPTEKCg==
--000000000000ef66cb05e2f4f988
Content-Type: text/x-log; charset="US-ASCII"; name="pciback_dbg_xl-pci_assignable_XXX.log"
Content-Disposition: attachment; 
	filename="pciback_dbg_xl-pci_assignable_XXX.log"
Content-Transfer-Encoding: base64
Content-ID: <f_l56d1wpl0>
X-Attachment-Id: f_l56d1wpl0

cm9vdEBnYWlhOn4jIHhsIHBjaS1hc3NpZ25hYmxlLWFkZCAwNTowMC4wCmxpYnhsOiB3YXJuaW5n
OiBsaWJ4bF9wY2kuYzo4MTQ6bGlieGxfX2RldmljZV9wY2lfYXNzaWduYWJsZV9hZGQ6IDAwMDA6
MDU6MDAuMCBub3QgYm91bmQgdG8gYSBkcml2ZXIsIHdpbGwgbm90IGJlIHJlYm91bmQuCgpbICAz
MjMuNDQ4MTE1XSB4ZW5fcGNpYmFjazogd2FudHMgdG8gc2VpemUgMDAwMDowNTowMC4wClsgIDMy
My40NDgxMzZdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogcHJvYmluZy4uLgpb
ICAzMjMuNDQ4MTM3XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHNlaXppbmcg
ZGV2aWNlClsgIDMyMy40NDgxNjJdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazog
cGNpc3R1Yl9kZXZpY2VfYWxsb2MKWyAgMzIzLjQ0ODE2Ml0gcGNpYmFjayAwMDAwOjA1OjAwLjA6
IHhlbl9wY2liYWNrOiBpbml0aWFsaXppbmcuLi4KWyAgMzIzLjQ0ODE2M10gcGNpYmFjayAwMDAw
OjA1OjAwLjA6IHhlbl9wY2liYWNrOiBpbml0aWFsaXppbmcgY29uZmlnClsgIDMyMy40NDgzNDRd
IHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogZW5hYmxpbmcgZGV2aWNlClsgIDMy
My40NDg0MjVdIHhlbjogcmVnaXN0ZXJpbmcgZ3NpIDE2IHRyaWdnZXJpbmcgMCBwb2xhcml0eSAx
ClsgIDMyMy40NDg0MjhdIEFscmVhZHkgc2V0dXAgdGhlIEdTSSA6MTYKWyAgMzIzLjQ0ODQ5N10g
cGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBzYXZlIHN0YXRlIG9mIGRldmljZQpb
ICAzMjMuNDQ4NjQyXSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHJlc2V0dGlu
ZyAoRkxSLCBEMywgZXRjKSB0aGUgZGV2aWNlClsgIDMyMy40NDg3MDddIHBjaWVwb3J0IDAwMDA6
MDA6MWQuMDogRFBDOiBjb250YWlubWVudCBldmVudCwgc3RhdHVzOjB4MWYxMSBzb3VyY2U6MHgw
MDAwClsgIDMyMy40NDg3MzBdIHBjaWVwb3J0IDAwMDA6MDA6MWQuMDogRFBDOiB1bm1hc2tlZCB1
bmNvcnJlY3RhYmxlIGVycm9yIGRldGVjdGVkClsgIDMyMy40NDg3NjBdIHBjaWVwb3J0IDAwMDA6
MDA6MWQuMDogUENJZSBCdXMgRXJyb3I6IHNldmVyaXR5PVVuY29ycmVjdGVkIChOb24tRmF0YWwp
LCB0eXBlPVRyYW5zYWN0aW9uIExheWVyLCAoUmVjZWl2ZXIgSUQpClsgIDMyMy40NDg3ODZdIHBj
aWVwb3J0IDAwMDA6MDA6MWQuMDogICBkZXZpY2UgWzgwODY6YTMzMF0gZXJyb3Igc3RhdHVzL21h
c2s9MDAyMDAwMDAvMDAwMTAwMDAKWyAgMzIzLjQ0ODgxM10gcGNpZXBvcnQgMDAwMDowMDoxZC4w
OiAgICBbMjFdIEFDU1Zpb2wgICAgICAgICAgICAgICAgKEZpcnN0KQpbICAzMjQuNjkwOTc5XSBw
Y2liYWNrIDAwMDA6MDU6MDAuMDogbm90IHJlYWR5IDEwMjNtcyBhZnRlciBGTFI7IHdhaXRpbmcK
WyAgMzI1LjczMDcwNl0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IG5vdCByZWFkeSAyMDQ3bXMgYWZ0
ZXIgRkxSOyB3YWl0aW5nClsgIDMyNy45OTc2MzhdIHBjaWJhY2sgMDAwMDowNTowMC4wOiBub3Qg
cmVhZHkgNDA5NW1zIGFmdGVyIEZMUjsgd2FpdGluZwpbICAzMzIuMjY0MjUxXSBwY2liYWNrIDAw
MDA6MDU6MDAuMDogbm90IHJlYWR5IDgxOTFtcyBhZnRlciBGTFI7IHdhaXRpbmcKWyAgMzQwLjU4
NDMyMF0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IG5vdCByZWFkeSAxNjM4M21zIGFmdGVyIEZMUjsg
d2FpdGluZwpbICAzNTcuMDEwODk2XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogbm90IHJlYWR5IDMy
NzY3bXMgYWZ0ZXIgRkxSOyB3YWl0aW5nClsgIDM5MS4xNDM5NTFdIHBjaWJhY2sgMDAwMDowNTow
MC4wOiBub3QgcmVhZHkgNjU1MzVtcyBhZnRlciBGTFI7IGdpdmluZyB1cApbICAzOTIuMjQ5MjUy
XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHJlc2V0IGRldmljZQpbICAzOTIu
MjQ5MzkyXSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHhlbl9wY2lia19lcnJv
cl9kZXRlY3RlZChidXM6NSxkZXZmbjowKQpbICAzOTIuMjQ5MzkzXSBwY2liYWNrIDAwMDA6MDU6
MDAuMDogeGVuX3BjaWJhY2s6IGRldmljZSBpcyBub3QgZm91bmQvYXNzaWduZWQKWyAgMzkyLjM5
NzA3NF0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiB4ZW5fcGNpYmtfZXJyb3Jf
cmVzdW1lKGJ1czo1LGRldmZuOjApClsgIDM5Mi4zOTcwODBdIHBjaWJhY2sgMDAwMDowNTowMC4w
OiB4ZW5fcGNpYmFjazogZGV2aWNlIGlzIG5vdCBmb3VuZC9hc3NpZ25lZApbICAzOTIuMzk3Mjg0
XSBwY2llcG9ydCAwMDAwOjAwOjFkLjA6IEFFUjogZGV2aWNlIHJlY292ZXJ5IHN1Y2Nlc3NmdWwK
CmxpYnhsOiBlcnJvcjogbGlieGxfcGNpLmM6ODM1OmxpYnhsX19kZXZpY2VfcGNpX2Fzc2lnbmFi
bGVfYWRkOiBmYWlsZWQgdG8gcXVhcmFudGluZSAwMDAwOjA1OjAwLjAKCnJvb3RAZ2FpYTp+IyB4
bCBwY2ktYXNzaWduYWJsZS1yZW1vdmUgMDU6MDAuMApsaWJ4bDogZXJyb3I6IGxpYnhsX3BjaS5j
Ojg1MzpsaWJ4bF9fZGV2aWNlX3BjaV9hc3NpZ25hYmxlX3JlbW92ZTogZmFpbGVkIHRvIGRlLXF1
YXJhbnRpbmUgMDAwMDowNTowMC4wCnJvb3RAZ2FpYTp+IyB4bCBwY2ktYXNzaWduYWJsZS1hZGQg
MDU6MDAuMApsaWJ4bDogd2FybmluZzogbGlieGxfcGNpLmM6Nzk0OmxpYnhsX19kZXZpY2VfcGNp
X2Fzc2lnbmFibGVfYWRkOiAwMDAwOjA1OjAwLjAgYWxyZWFkeSBhc3NpZ25lZCB0byBwY2liYWNr
CnJvb3RAZ2FpYTp+IyB4bCBwY2ktYXNzaWduYWJsZS1yZW1vdmUgMDU6MDAuMApbICA2MDMuOTI4
MDM5XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHJlbW92aW5nClsgIDYwMy45
MjgwNDFdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogZm91bmQgZGV2aWNlIHRv
IHJlbW92ZSAKWyAgNjAzLjkyODA0Ml0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNr
OiBwY2lzdHViX2RldmljZV9yZWxlYXNlClsgIDYwNC4wMzMzNzJdIHBjaWVwb3J0IDAwMDA6MDA6
MWQuMDogRFBDOiBjb250YWlubWVudCBldmVudCwgc3RhdHVzOjB4MWYxMSBzb3VyY2U6MHgwMDAw
ClsgIDYwNC4wMzM1MTJdIHBjaWVwb3J0IDAwMDA6MDA6MWQuMDogRFBDOiB1bm1hc2tlZCB1bmNv
cnJlY3RhYmxlIGVycm9yIGRldGVjdGVkClsgIDYwNC4wMzM2MzFdIHBjaWVwb3J0IDAwMDA6MDA6
MWQuMDogUENJZSBCdXMgRXJyb3I6IHNldmVyaXR5PVVuY29ycmVjdGVkIChOb24tRmF0YWwpLCB0
eXBlPVRyYW5zYWN0aW9uIExheWVyLCAoUmVxdWVzdGVyIElEKQpbICA2MDQuMDMzNzU4XSBwY2ll
cG9ydCAwMDAwOjAwOjFkLjA6ICAgZGV2aWNlIFs4MDg2OmEzMzBdIGVycm9yIHN0YXR1cy9tYXNr
PTAwMTAwMDAwLzAwMDEwMDAwClsgIDYwNC4wMzM4NTZdIHBjaWVwb3J0IDAwMDA6MDA6MWQuMDog
ICAgWzIwXSBVbnN1cFJlcSAgICAgICAgICAgICAgIChGaXJzdCkKWyAgNjA0LjAzMzkzOV0gcGNp
ZXBvcnQgMDAwMDowMDoxZC4wOiBBRVI6ICAgVExQIEhlYWRlcjogMzQwMDAwMDAgMDUwMDAwMTAg
MDAwMDAwMDAgODg0NTg4NDUKWyAgNjA0LjAzNDA1OV0gcGNpIDAwMDA6MDU6MDAuMDogQUVSOiBj
YW4ndCByZWNvdmVyIChubyBlcnJvcl9kZXRlY3RlZCBjYWxsYmFjaykKWyAgNjA0LjAzNDQyMV0g
eGVuX3BjaWJhY2s6IHJlbW92ZWQgMDAwMDowNTowMC4wIGZyb20gc2VpemUgbGlzdApbICA2MDQu
MTgyNTk3XSBwY2llcG9ydCAwMDAwOjAwOjFkLjA6IEFFUjogZGV2aWNlIHJlY292ZXJ5IHN1Y2Nl
c3NmdWwKCnJvb3RAZ2FpYTp+IyB4bCBwY2ktYXNzaWduYWJsZS1hZGQgMDU6MDAuMApsaWJ4bDog
d2FybmluZzogbGlieGxfcGNpLmM6ODE0OmxpYnhsX19kZXZpY2VfcGNpX2Fzc2lnbmFibGVfYWRk
OiAwMDAwOjA1OjAwLjAgbm90IGJvdW5kIHRvIGEgZHJpdmVyLCB3aWxsIG5vdCBiZSByZWJvdW5k
LgpbICA2NjcuNTgyMDUxXSB4ZW5fcGNpYmFjazogd2FudHMgdG8gc2VpemUgMDAwMDowNTowMC4w
ClsgIDY2Ny41ODIxMzBdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogcHJvYmlu
Zy4uLgpbICA2NjcuNTgyMTM0XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IHNl
aXppbmcgZGV2aWNlClsgIDY2Ny41ODIyMjhdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNp
YmFjazogcGNpc3R1Yl9kZXZpY2VfYWxsb2MKWyAgNjY3LjU4MjIzMV0gcGNpYmFjayAwMDAwOjA1
OjAwLjA6IHhlbl9wY2liYWNrOiBpbml0aWFsaXppbmcuLi4KWyAgNjY3LjU4MjIzNV0gcGNpYmFj
ayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBpbml0aWFsaXppbmcgY29uZmlnClsgIDY2Ny41
ODI1NDhdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogZW5hYmxpbmcgZGV2aWNl
ClsgIDY2Ny41ODI1OTldIHBjaWJhY2sgMDAwMDowNTowMC4wOiBlbmFibGluZyBkZXZpY2UgKDAw
MDAgLT4gMDAwMikKWyAgNjY3LjU4MjkxMl0geGVuOiByZWdpc3RlcmluZyBnc2kgMTYgdHJpZ2dl
cmluZyAwIHBvbGFyaXR5IDEKWyAgNjY3LjU4MjkyM10gQWxyZWFkeSBzZXR1cCB0aGUgR1NJIDox
NgpbICA2NjcuNTgzMDYxXSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IE1TSS1Y
IHByZXBhcmF0aW9uIGZhaWxlZCAoLTYpClsgIDY2Ny41ODMxNDhdIHBjaWJhY2sgMDAwMDowNTow
MC4wOiB4ZW5fcGNpYmFjazogc2F2ZSBzdGF0ZSBvZiBkZXZpY2UKWyAgNjY3LjU4MzU2OV0gcGNp
YmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiByZXNldHRpbmcgKEZMUiwgRDMsIGV0Yykg
dGhlIGRldmljZQpbICA2NjcuNjg5NjU2XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJh
Y2s6IHJlc2V0IGRldmljZQoKcm9vdEBnYWlhOn4jIHhsIHBjaS1hc3NpZ25hYmxlLXJlbW92ZSAw
NTowMC4wClsgIDcyMC45NTc5ODhdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazog
cmVtb3ZpbmcKWyAgNzIwLjk1Nzk5Nl0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNr
OiBmb3VuZCBkZXZpY2UgdG8gcmVtb3ZlIApbICA3MjAuOTU3OTk5XSBwY2liYWNrIDAwMDA6MDU6
MDAuMDogeGVuX3BjaWJhY2s6IHBjaXN0dWJfZGV2aWNlX3JlbGVhc2UKWyAgNzIxLjA2NTIyMl0g
cGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBNU0ktWCByZWxlYXNlIGZhaWxlZCAo
LTE2KQpbICA3MjEuMDY1NjY3XSB4ZW5fcGNpYmFjazogcmVtb3ZlZCAwMDAwOjA1OjAwLjAgZnJv
bSBzZWl6ZSBsaXN0Cgpyb290QGdhaWE6fiMgeGwgcGNpLWFzc2lnbmFibGUtYWRkIDA1OjAwLjAK
bGlieGw6IHdhcm5pbmc6IGxpYnhsX3BjaS5jOjgxNDpsaWJ4bF9fZGV2aWNlX3BjaV9hc3NpZ25h
YmxlX2FkZDogMDAwMDowNTowMC4wIG5vdCBib3VuZCB0byBhIGRyaXZlciwgd2lsbCBub3QgYmUg
cmVib3VuZC4KClsgIDc2My44ODg2MzFdIHhlbl9wY2liYWNrOiB3YW50cyB0byBzZWl6ZSAwMDAw
OjA1OjAwLjAKWyAgNzYzLjg4ODY5MF0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNr
OiBwcm9iaW5nLi4uClsgIDc2My44ODg2OTFdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNp
YmFjazogc2VpemluZyBkZXZpY2UKWyAgNzYzLjg4ODcxNl0gcGNpYmFjayAwMDAwOjA1OjAwLjA6
IHhlbl9wY2liYWNrOiBwY2lzdHViX2RldmljZV9hbGxvYwpbICA3NjMuODg4NzE3XSBwY2liYWNr
IDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IGluaXRpYWxpemluZy4uLgpbICA3NjMuODg4NzE3
XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IGluaXRpYWxpemluZyBjb25maWcK
WyAgNzYzLjg4ODgwNF0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBlbmFibGlu
ZyBkZXZpY2UKWyAgNzYzLjg4ODg4NV0geGVuOiByZWdpc3RlcmluZyBnc2kgMTYgdHJpZ2dlcmlu
ZyAwIHBvbGFyaXR5IDEKWyAgNzYzLjg4ODg4OV0gQWxyZWFkeSBzZXR1cCB0aGUgR1NJIDoxNgpb
ICA3NjMuODg4OTQ5XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6IE1TSS1YIHBy
ZXBhcmF0aW9uIGZhaWxlZCAoLTYpClsgIDc2My44ODg5NzddIHBjaWJhY2sgMDAwMDowNTowMC4w
OiB4ZW5fcGNpYmFjazogc2F2ZSBzdGF0ZSBvZiBkZXZpY2UKWyAgNzYzLjg4OTEyNl0gcGNpYmFj
ayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiByZXNldHRpbmcgKEZMUiwgRDMsIGV0YykgdGhl
IGRldmljZQpbICA3NjMuOTk0MjA2XSBwY2liYWNrIDAwMDA6MDU6MDAuMDogeGVuX3BjaWJhY2s6
IHJlc2V0IGRldmljZQoKcm9vdEBnYWlhOn4jIHhsIHBjaS1hc3NpZ25hYmxlLXJlbW92ZSAwNTow
MC4wClsgIDgxOS40OTEwMDBdIHBjaWJhY2sgMDAwMDowNTowMC4wOiB4ZW5fcGNpYmFjazogcmVt
b3ZpbmcKWyAgODE5LjQ5MTAwMl0gcGNpYmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBm
b3VuZCBkZXZpY2UgdG8gcmVtb3ZlIApbICA4MTkuNDkxMDAzXSBwY2liYWNrIDAwMDA6MDU6MDAu
MDogeGVuX3BjaWJhY2s6IHBjaXN0dWJfZGV2aWNlX3JlbGVhc2UKWyAgODE5LjU5NjExM10gcGNp
YmFjayAwMDAwOjA1OjAwLjA6IHhlbl9wY2liYWNrOiBNU0ktWCByZWxlYXNlIGZhaWxlZCAoLTE2
KQpbICA4MTkuNTk2NDY2XSB4ZW5fcGNpYmFjazogcmVtb3ZlZCAwMDAwOjA1OjAwLjAgZnJvbSBz
ZWl6ZSBsaXN0Cgo=
--000000000000ef66cb05e2f4f988--


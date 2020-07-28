Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D9F23044B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 09:41:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0KF5-0000ij-O8; Tue, 28 Jul 2020 07:41:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMc3=BH=3mdeb.com=norbert.kaminski@srs-us1.protection.inumbo.net>)
 id 1k0KF4-0000ie-75
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 07:41:42 +0000
X-Inumbo-ID: c5f41410-d0a5-11ea-a869-12813bfff9fa
Received: from 7.mo179.mail-out.ovh.net (unknown [46.105.61.94])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5f41410-d0a5-11ea-a869-12813bfff9fa;
 Tue, 28 Jul 2020 07:41:40 +0000 (UTC)
Received: from player770.ha.ovh.net (unknown [10.108.57.53])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id E617E16FF90
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 09:41:38 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
 (Authenticated sender: norbert.kaminski@3mdeb.com)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 8B15E14D53567;
 Tue, 28 Jul 2020 07:41:33 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001336571aa-5fee-4d5d-b215-046d926df4aa,44753483405F3E1C42F8196D1C7200706683A5BB)
 smtp.auth=norbert.kaminski@3mdeb.com
From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
To: xen-devel@lists.xenproject.org
Subject: fwupd support under Xen - firmware updates with the UEFI capsule
Message-ID: <497f1524-b57e-0ea1-5899-62f677bfae91@3mdeb.com>
Date: Tue, 28 Jul 2020 09:41:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------178149245AA07C14C2986652"
Content-Language: en-US
X-Ovh-Tracer-Id: 15470427670647445866
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedriedugdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvuffkffgfgggtsegrtderredtfeejnecuhfhrohhmpefpohhrsggvrhhtucfmrghmihhnshhkihcuoehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnheptedtheejgeeileektedvteefhfduffdtgefggfejgeeufffhudehtdevieelfeefnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpghhithhhuhgsrdgtohhmpdefmhguvggsrdgtohhmnecukfhppedtrddtrddtrddtpdekhedrvddvvddruddujedrvddvvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepnhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: andrew.cooper3@citrix.com, Maciej Pijanowski <maciej.pijanowski@3mdeb.com>,
 piotr.krol@3mdeb.com, marmarek@invisiblethingslab.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------178149245AA07C14C2986652
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello all,

I'm trying to add support for the firmware updates with the UEFI capsule in
Qubes OS. I've got the troubles with reading ESRT (EFI System Resource 
Table)
in the dom0, which is based on the EFI memory map. The EFI_MEMMAP is not
enabled despite the loaded drivers (CONFIG_EFI, CONFIG_EFI_ESRT) and kernel
cmdline parameters (add_efi_memmap):

```
[    3.451249] efi: EFI_MEMMAP is not enabled.
```

The fwupd bases on the ESRT entries, which provide the system firmware 
GUID.
The GUID is checked using LVFS metadata, which contains information 
about updates.
When efi_memmap is not enabled, there are no ESRT entries in the sysfs, 
and fwupd
has no information about the system firmware GUID.  It is therefore not 
possible to
check whether updates are available for the BIOS.

This is how the ESRT entries looks in the Ubuntu:

```
ubuntu@ubuntu:/sys/firmware/efi/esrt$ ll
total 0
drwxr-xr-x 3 root root    0 Jul 27 13:14 ./
drwxr-xr-x 6 root root    0 Jul 27 13:13 ../
drwxr-xr-x 3 root root    0 Jul 27 13:17 entries/
-r-------- 1 root root 4096 Jul 27 13:17 fw_resource_count
-r-------- 1 root root 4096 Jul 27 13:17 fw_resource_count_max
-r-------- 1 root root 4096 Jul 27 13:17 fw_resource_version
ubuntu@ubuntu:/sys/firmware/efi/esrt/entries/entry0$ ll
total 0
drwxr-xr-x 2 root root    0 Jul 27 13:17 ./
drwxr-xr-x 3 root root    0 Jul 27 13:17 ../
-r-------- 1 root root 4096 Jul 27 13:17 capsule_flags
-r-------- 1 root root 4096 Jul 27 13:17 fw_class
-r-------- 1 root root 4096 Jul 27 13:17 fw_type
-r-------- 1 root root 4096 Jul 27 13:17 fw_version
-r-------- 1 root root 4096 Jul 27 13:17 last_attempt_status
-r-------- 1 root root 4096 Jul 27 13:17 last_attempt_version
-r-------- 1 root root 4096 Jul 27 13:17 lowest_supported_fw_version
ubuntu@ubuntu:/sys/firmware/efi/esrt/entries/entry0$ sudo cat fw_class
34578c72-11dc-4378-bc7f-b643866f598c
```

This is the source code of the ESRT driver, which provides those 
directories:

https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/drivers/firmware/efi/esrt.c 


EFI_MEMMAP dependency is in the 248th line:

https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/drivers/firmware/efi/esrt.c#L248

I need to pass ESRT to the dom0. What would be the best way to do that?

Ps. Marek Marczykowski-Górecki (Qubes /Project lead) /found some more 
information,
where the problem lays:

/EFI_MEMMAP is not enabled on EFI_PARAVIRT (which I believe is the case 
on Xen dom0):/

/https://github.com/torvalds/linux/blob/92ed301919932f777713b9172e525674157e983d/drivers/firmware/efi/memmap.c#L110/

/My reading the source code says the Xen side to extract this info 
exists, but
Linux doesn't use it specifically, EFI config table address is get here:/

/https://github.com/torvalds/linux/blob/master/arch/x86/xen/efi.c#L56-L63/

/But then nothing uses efi_systab_xen.tables.
efi_config_parse_tables() function should be called on those addresses:
/

/https://github.com/torvalds/linux/blob/master/drivers/firmware/efi/efi.c#L542
/

/But I don't think it is called in PV dom0 boot path (not fully sure 
about that yet)./


Best Regards,
Norbert Kamiński
Junior Embedded Systems Engineer
GPG key ID: 9E9F90AFE10F466A
3mdeb.com


--------------178149245AA07C14C2986652
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello all,
      <br>
      <br>
      I'm trying to add support for the firmware updates with the UEFI
      capsule in
      <br>
      Qubes OS. I've got the troubles with reading ESRT (EFI System
      Resource Table)
      <br>
      in the dom0, which is based on the EFI memory map. The EFI_MEMMAP
      is not
      <br>
      enabled despite the loaded drivers (CONFIG_EFI, CONFIG_EFI_ESRT)
      and kernel
      <br>
      cmdline parameters (add_efi_memmap):
      <br>
      <br>
      ```
      <br>
      [    3.451249] efi: EFI_MEMMAP is not enabled.
      <br>
      ```
      <br>
      <br>
      The fwupd bases on the ESRT entries, which provide the system
      firmware GUID.
      <br>
      The GUID is checked using LVFS metadata, which contains
      information about updates.
      <br>
      When efi_memmap is not enabled, there are no ESRT entries in the
      sysfs, and fwupd
      <br>
      has no information about the system firmware GUID.  It is
      therefore not possible to
      <br>
      check whether updates are available for the BIOS.
      <br>
      <br>
      This is how the ESRT entries looks in the Ubuntu:
      <br>
      <br>
      ```
      <br>
      ubuntu@ubuntu:/sys/firmware/efi/esrt$ ll
      <br>
      total 0
      <br>
      drwxr-xr-x 3 root root    0 Jul 27 13:14 ./
      <br>
      drwxr-xr-x 6 root root    0 Jul 27 13:13 ../
      <br>
      drwxr-xr-x 3 root root    0 Jul 27 13:17 entries/
      <br>
      -r-------- 1 root root 4096 Jul 27 13:17 fw_resource_count
      <br>
      -r-------- 1 root root 4096 Jul 27 13:17 fw_resource_count_max
      <br>
      -r-------- 1 root root 4096 Jul 27 13:17 fw_resource_version
      <br>
      ubuntu@ubuntu:/sys/firmware/efi/esrt/entries/entry0$ ll
      <br>
      total 0
      <br>
      drwxr-xr-x 2 root root    0 Jul 27 13:17 ./
      <br>
      drwxr-xr-x 3 root root    0 Jul 27 13:17 ../
      <br>
      -r-------- 1 root root 4096 Jul 27 13:17 capsule_flags
      <br>
      -r-------- 1 root root 4096 Jul 27 13:17 fw_class
      <br>
      -r-------- 1 root root 4096 Jul 27 13:17 fw_type
      <br>
      -r-------- 1 root root 4096 Jul 27 13:17 fw_version
      <br>
      -r-------- 1 root root 4096 Jul 27 13:17 last_attempt_status
      <br>
      -r-------- 1 root root 4096 Jul 27 13:17 last_attempt_version
      <br>
      -r-------- 1 root root 4096 Jul 27 13:17
      lowest_supported_fw_version
      <br>
      ubuntu@ubuntu:/sys/firmware/efi/esrt/entries/entry0$ sudo cat
      fw_class
      <br>
      34578c72-11dc-4378-bc7f-b643866f598c
      <br>
      ```
      <br>
      <br>
      This is the source code of the ESRT driver, which provides those
      directories:
      <br>
      <br>
      <a class="moz-txt-link-freetext"
href="https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/drivers/firmware/efi/esrt.c">https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/drivers/firmware/efi/esrt.c</a>
      <br>
      <br>
      EFI_MEMMAP dependency is in the 248th line:
      <br>
      <br>
      <a class="moz-txt-link-freetext"
href="https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/drivers/firmware/efi/esrt.c#L248">https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/drivers/firmware/efi/esrt.c#L248</a></p>
    <p>I need to pass ESRT to the dom0. What would be the best way to do
      that?</p>
    <p>Ps. Marek Marczykowski-Górecki (Qubes <em class="role
        half-bottom">Project lead) </em><span class="role half-bottom"></span><span
        class="role half-bottom">found some more information,<br>
        where the problem lays:</span></p>
    <p><em class="role half-bottom">EFI_MEMMAP is not enabled on
        EFI_PARAVIRT (which I believe is the case on Xen dom0):</em></p>
    <p><em class="role half-bottom"><a class="moz-txt-link-freetext" href="https://github.com/torvalds/linux/blob/92ed301919932f777713b9172e525674157e983d/drivers/firmware/efi/memmap.c#L110">https://github.com/torvalds/linux/blob/92ed301919932f777713b9172e525674157e983d/drivers/firmware/efi/memmap.c#L110</a></em></p>
    <p><em class="role half-bottom">My reading the source code says the
        Xen side to extract this info exists, but <br>
        Linux doesn't use it specifically, EFI config table address is
        get here:</em></p>
    <p><em class="role half-bottom"><a class="moz-txt-link-freetext" href="https://github.com/torvalds/linux/blob/master/arch/x86/xen/efi.c#L56-L63">https://github.com/torvalds/linux/blob/master/arch/x86/xen/efi.c#L56-L63</a></em></p>
    <p><em class="role half-bottom">But then nothing uses
        efi_systab_xen.tables. <br>
        efi_config_parse_tables() function should be called on those
        addresses: <br>
      </em></p>
    <p><em class="role half-bottom"><a class="moz-txt-link-freetext" href="https://github.com/torvalds/linux/blob/master/drivers/firmware/efi/efi.c#L542">https://github.com/torvalds/linux/blob/master/drivers/firmware/efi/efi.c#L542</a><br>
      </em></p>
    <p><em class="role half-bottom">But I don't think it is called in PV
        dom0 boot path (not fully sure about that yet).</em></p>
    <p><br>
      Best Regards,
      <br>
      Norbert Kamiński
      <br>
      Junior Embedded Systems Engineer
      <br>
      GPG key ID: 9E9F90AFE10F466A
      <br>
      3mdeb.com
    </p>
  </body>
</html>

--------------178149245AA07C14C2986652--


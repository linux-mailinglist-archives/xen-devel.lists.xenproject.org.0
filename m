Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1FD369041
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 12:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116060.221470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsxN-0007hs-4a; Fri, 23 Apr 2021 10:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116060.221470; Fri, 23 Apr 2021 10:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsxN-0007hS-18; Fri, 23 Apr 2021 10:22:41 +0000
Received: by outflank-mailman (input) for mailman id 116060;
 Fri, 23 Apr 2021 10:22:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YHlh=JU=list.ru=valor@srs-us1.protection.inumbo.net>)
 id 1lZsxL-0007gv-OL
 for xen-devel@lists.xen.org; Fri, 23 Apr 2021 10:22:40 +0000
Received: from smtp36.i.mail.ru (unknown [94.100.177.96])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 796a99cc-ef37-4de2-bf7d-3da3cf806460;
 Fri, 23 Apr 2021 10:22:37 +0000 (UTC)
Received: by smtp36.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1lZsxH-0002dK-FO; Fri, 23 Apr 2021 13:22:35 +0300
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
X-Inumbo-ID: 796a99cc-ef37-4de2-bf7d-3da3cf806460
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail3;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Cc:To:From:References:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=FgzuYzveHfgDiRmpu14dVa4tC6zz3tdUhrDe7LeebVw=;
	b=AwOgrKydjXoO5dSV4yi7BdRLEKEfGBpXJuzmi5W/Qz60Gbj2MGd3whXrk4OF4mR4L35YajZyvCjs3EuzloUWhFNw0BvFGhO6kui7qgaKX4UoVWoKl8Pa6azPQ81vkhss5e+SEINeIVrOZWjtJb/VRj2KUdwUW46oTtTL6bOE3Qs=;
Subject: Fwd: [BUG] Windows is frozen after restore from snapshot
References: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru>
From: Sergey Kovalev <valor@list.ru>
To: xen-devel@lists.xen.org
Cc: zaytsevgu@gmail.com
X-Forwarded-Message-Id: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru>
Message-ID: <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
Date: Fri, 23 Apr 2021 13:22:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp36.i.mail.ru; auth=pass smtp.auth=valor@list.ru smtp.mailfrom=valor@list.ru
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9203E2ABA940B7548F5BB1D231581C270E5D52311C6CD930F182A05F538085040BBA653FF584691B923390E41C51DC3537C5491697FDD0F38C07E61312F23B3F4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70043D879A87EF1BCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371005780D56A98C20EA1F7E6F0F101C67CDEEF6D7F21E0D1D9295C2E9FA3191EE1B59CA4C82EFA658F78FA424D9502CF54F62EC466A4B22E1F6B57BC7E64490618DEB871D839B73339E8FC8737B5C22498424CA1AAF98A6958941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B68424CA1AAF98A6958941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD269176DF2183F8FC7C0287EE14F2A8630337B076A6E789B0E97A8DF7F3B2552694A1E7802607F20496D49FD398EE364050F33AC447995A7AD18AD7EC71F1DB88427C4224003CC8364764FCD328C77E6096CE2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F79006377870F476E0DB9443EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A5A5AFD6085112A9D461A8B0219E5F8AA32770F8F87B085582D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA751098AAFFB0A1231D8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34A9A0A0BF1A2CAC62EA6EDFC063BF2FD9096CD9767523C0F220692F36B91914C009152201A81279B91D7E09C32AA3244CF2E9079A8573FB001E6FB7A11CE9FC0764EE5813BBCA3A9D729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMA4lh0BuVjMw3MQdBa5Bdg==
X-Mailru-Sender: 6C3E74F07C41AE94CB3BE32A189147468D5125A9A80EED180AC2A19F178796C7739DF2B2D2CF89AEE54CE59283E19BE8E66B5C1DBFD5D09DD72DCFCE6FA85F85A74E2CAFD6E5C6FC67EA787935ED9F1B
X-Mras: Ok

# Abstract

After `xl save win win.mem` and then `xl restore win.hvm win.mem`
the Windows 10 VM remain frozen for about a minute. After the
minute it becomes responsive.

During the freeze the OS remains semi-responsive: on `Ctrl+Shift+Esc`
press the wait cursor appears (blue circle indicator).

This is an intermittent fault been reproduced only twice.

# Technical notes

It have been noticed that there were no timer interrupts during
the freeze.

zaytsevgu@gmail.com has debugged the received Xen state file and
noticed that the flag HPET_TN_PERIODIC been set after unfreeze.

Based on that he provided two Python scripts: one to check the
value and one to patch it.

Both "broken" state files we have been detected and patched
successfully.

# Other information

## Target machine

```bash
$ uname -a
Linux localhost 5.4.0-66-generic #74~18.04.2-Ubuntu SMP
Fri Feb 5 11:17:31 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
```

## Xen version

Build from source on tag RELEASE-4.12.4

## OS version

* Windows 10 build 1803 x64
* Hibernation, sleep and other disabled with powershell commands:
```
powercfg /hibernate off
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0
powercfg /change monitor-timeout-ac 0
powercfg /change monitor-timeout-dc 0
powercfg /change disk-timeout-ac 0
powercfg /change disk-timeout-dc 0
```

## Configuration file

Build with envsubst from template:

```
name = "$VM_NAME"
type = "hvm"

vcpus = 2
maxvcpus = 2

memory = 2048
maxmem = 2048

on_poweroff = "destroy"
on_reboot = "destroy"
on_watchdog = "destroy"
on_crash = "destroy"
on_soft_reset = "soft-reset"

nomigrate = 1

disk = [ "format=qcow2, vdev=hda, target=$VM_DISK_IMAGE_PATH" ]

vif = [ "type=ioemu, model=e1000" ]

hdtype = "ahci"

shadow_memory = 16

altp2m = "external"

viridian = [ "defaults" ]

videoram = 128
vga = "stdvga"

vnc = 1
vncunused = 1

soundhw = "hda"

usb = 1
usbdevice = [ "usb-tablet" ]
```

## Check script

The script has been provided by zaytsevgu@gmail.com
(with little refactoring).

It checks that image is broken.

```python
#!/usr/bin/env python3


import logging
from pathlib import Path
import sys
import struct


def check_snapshot_hpet(snapshot: Path) -> bool:
     def get_b32(file):
         data = file.read(4)
         return struct.unpack('>L', data)[0]

     def get_l32(file):
         data = file.read(4)
         return struct.unpack('<L', data)[0]

     def get_l64(file):
         data = file.read(8)
         return struct.unpack('<Q', data)[0]

     def get_hpet_loc_by_tag9(file):
         while True:
             tag = get_l32(file)
             tlen = get_l32(file)
             if tag == 12:
                 break
             file.seek(tlen, 1)
         _ = get_l64(file) # caps
         _ = [get_l64(file) for i in range(31)]
         timer1_conf = get_l64(file)
         # Basic check
         if timer1_conf & 0xff == 0x34:
             return file.tell() - 8
         return None

     def get_hpet(file):
         _ = get_l32(file)  # x1
         _ = get_l32(file)  # x2
         hdr = file.read(4)
         if hdr != b'XENF':
             return None
         _ = get_b32(file)  # version
         get_b32(file)
         get_b32(file)
         _ = get_l32(file)  # dmt
         _ = get_l32(file)  # page_shift
         _ = get_l32(file)  # xmj
         _ = get_l32(file)  # xmn

         while True:
             tag_type = get_l32(file)
             rlen = get_l32(file)
             if tag_type == 9:
                 break
             else:
                 file.seek(rlen, 1)
         return get_hpet_loc_by_tag9(file)

     original = open(snapshot, 'rb')

     header = original.read(0x1000)
     xl_offset = header.index(b'LibxlFmt')
     original.seek(xl_offset)
     magic = original.read(8)
     if magic != b'LibxlFmt':
         logging.error('Invalid snapshot format')
         raise RuntimeError

     _ = get_b32(original)  # version
     _ = get_b32(original)  # options
     record_type = get_l32(original)
     _ = get_l32(original)  # blen
     if record_type != 1:
         logging.error('Invalid snapshot record type')
         raise RuntimeError
     hpet_flag_byte_offset = get_hpet(original)
     if hpet_flag_byte_offset is not None:
         original.close()
         return False
     else:
         original.close()
         return True


if check_snapshot_hpet(sys.argv[1]):
     print('The image is good! :)')
     sys.exit(0)
else:
     print('The image is so bad... :(')
     sys.exit(1)
```

The image could be fixed with a little addition:
```python
hpet_new = hpet[0] ^ 0x8
```
, on `hpet_flag_byte_offset`

## Patch script

```python
import sys
import struct
import io

def get_b32(file):
     data = file.read(4)
     return struct.unpack(">L", data)[0]

def get_l32(file):
     data = file.read(4)
     return struct.unpack("<L", data)[0]

def get_l64(file):
     data = file.read(8)
     return struct.unpack("<Q", data)[0]


def get_hpet_loc_by_tag9(file, rlen):
     while True:
         tag = get_l32(file)
         tlen = get_l32(file)
         if tag == 12:
             break
         file.seek(tlen, 1)
     caps = get_l64(file)
     [get_l64(file) for i in range(31)]
     timer1_conf = get_l64(file)
     print(hex(timer1_conf))
     if timer1_conf & 0xff == 0x34: #VERY DUMMY CHECK
         return file.tell() - 8
     return None

def get_hpet(file):
     x1 = get_l32(file)
     x2 = get_l32(file)
     hdr = file.read(4)
     # print(hdr)
     if hdr != b"XENF":
         return None
     version = get_b32(file)
     get_b32(file)
     get_b32(file)
     dmt = get_l32(file)
     page_shift = get_l32(file)
     xmj = get_l32(file)
     xmn = get_l32(file)

     while True:
         tag_type = get_l32(file)
         # print(tag_type)
         rlen = get_l32(file)
         if tag_type == 9:
             break
         else:
             file.seek(rlen, 1)
     print("Found tag 9!")
     return get_hpet_loc_by_tag9(file, rlen)


original = open(sys.argv[1], "rb")
new = open(sys.argv[1]+".hpet_enable_periodic", "wb")

header = original.read(0x1000)
xl_offset = header.index(b"LibxlFmt")
print("Found offset to xl data: {:x}".format(xl_offset))
original.seek(xl_offset)
magic = original.read(8)
if magic != b"LibxlFmt":
     print("ERROR INVALID FORMAT")
else:
     version = get_b32(original)
     options = get_b32(original)
     record_type = get_l32(original)
     blen = get_l32(original)
     # print(record_type, blen)
     if record_type != 1:
         0/0
     hpet_flag_byte_offset = get_hpet(original)
     if hpet_flag_byte_offset != None:
         print("Got hpet timer flag!")
         file_size = 0
         original.seek(0, 2)
         file_size = original.tell()
         original.seek(0,0)
         pos = 0
         block_size = 4*1024*1024
         print(hex(hpet_flag_byte_offset))
         while pos != hpet_flag_byte_offset:
             if hpet_flag_byte_offset - pos < block_size:
                 block_size = hpet_flag_byte_offset - pos
             data = original.read(block_size)
             new.write(data)
             pos += block_size
         hpet = original.read(8)
         # print(hpet)
         hpet_new = hpet[0] ^ 0x8
         # print(hpet_new)
         new.write(bytes((hpet_new,)))
         new.write(hpet[1:])
         pos = pos + 8
         block_size = 4*1024*1024
         while pos != file_size:
             if file_size - pos < block_size:
                 block_size = file_size - pos
             data = original.read(block_size)
             new.write(data)
             pos += block_size
     else:
         print("can't find")
original.close()
new.close()
```

-- 
With best regards,
Sergey Kovalev



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0546A5B024E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401249.643060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsot-0005bI-SK; Wed, 07 Sep 2022 11:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401249.643060; Wed, 07 Sep 2022 11:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsot-0005Yj-Ok; Wed, 07 Sep 2022 11:02:11 +0000
Received: by outflank-mailman (input) for mailman id 401249;
 Wed, 07 Sep 2022 11:02:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3bz=ZK=gmail.com=asr7247@srs-se1.protection.inumbo.net>)
 id 1oVsor-0005Yd-Lf
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:02:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83b1adb6-2e9c-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 13:02:07 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id u9so29525240ejy.5
 for <xen-devel@lists.xenproject.org>; Wed, 07 Sep 2022 04:02:07 -0700 (PDT)
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
X-Inumbo-ID: 83b1adb6-2e9c-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=3XynEqfR8DIwjsD7CvLySAYT6uxTQTASBfDS7i4m8IY=;
        b=AguQvW8bDAXzx9Z9IpjxvHjy5T8rBZ/l7YyfSjKDdOBFWVsn0OiMBjNFjlmU7ZsfQn
         GTegBcoEX0m/Gu6FDOTSLRoZqHu/W5+ryQbUZdxKJP6v94xTLC4drO0docNeFNAZuUZl
         NToIMshj/xhJo73WR5m6pk32Jw/aaQ9dh50kl4jH5W8jstztCOdWIpISVO5sy98+tzHC
         JGz2ewCmhIfSXie4wRPUf92NQ/5fYi4LS/cbcUS2niWJT1ferWnT/sAf3qaYwWvM+2mU
         INHmP/tWbvlm7TuwW/0H3ld9cScCMzjnwpfK07HL4QVPmlf2vis4vWBh2STFsAWYdW8u
         26zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3XynEqfR8DIwjsD7CvLySAYT6uxTQTASBfDS7i4m8IY=;
        b=Ap+i04Ri1ZC7vh5yW6SmyFNS9gyzcaYCJq4z6aRkZCVV8AV/b2Afp9nktDKxCQqFXw
         raYjwqFlTqt+c9y6diCxauWEhQW+hKvYjRmln8r/sxgckGnRRGeX+L8/C4i7sV4usItY
         vrXPWKJl0wT0wQGG/caZ68XkL2g2uckB8rlZSUXQAYEcJ5/MOsA7rur4y0xbN6CX+ttI
         qtPsrDYZEmjwjh/7nhhaNy0W1uPXwrRQgYUcc6gSkzvUmOl8mPwkxv7dTlKutZJZikuf
         UdMwv0pFxhWuiwUnkusPTc2Qiv0IgEKYmNV3dkqVOR/YkxU72m653MwKJ8jyqWB6oyWQ
         mFqA==
X-Gm-Message-State: ACgBeo0i6TznfkpZUbtKPR6TEJzs3xc2UFiU3sGX9u2aPyuGYs6iAD6H
	Or9Feg6MNsvRpibIwlTxQO2aNQKCt6omEsFMcRoT88qw2Eg=
X-Google-Smtp-Source: AA6agR6QB5yv0Gvbc7vfU8VmhFzyKThzy1+3wNXMdPGms7/SFC7pmrOkdqVUQX3QkyX0qqThMtHu3h0LrKu+cEjtXII=
X-Received: by 2002:a17:907:6297:b0:72f:9aad:fcb with SMTP id
 nd23-20020a170907629700b0072f9aad0fcbmr1936186ejc.161.1662548526941; Wed, 07
 Sep 2022 04:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <CABg_PyLqrajOuKidSfuzXk8=pAraLfwEQX_mO2-Ofv5kNiWa8w@mail.gmail.com>
 <CABg_Py+cAETgRW5OywNZtdPvtyP3BQw=GiNQOAYT8RQQUt6b0g@mail.gmail.com>
In-Reply-To: <CABg_Py+cAETgRW5OywNZtdPvtyP3BQw=GiNQOAYT8RQQUt6b0g@mail.gmail.com>
From: A Sudheer <asr7247@gmail.com>
Date: Wed, 7 Sep 2022 16:31:54 +0530
Message-ID: <CABg_PyJ4bCWab=tU0pAtxxEE76M1fmjLG9Q5R9yPgDCGvS1=vw@mail.gmail.com>
Subject: Re: USB-C 250GB SSD Passthrough fails to DomU Ubuntu
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000005eca1205e8143e89"

--0000000000005eca1205e8143e89
Content-Type: text/plain; charset="UTF-8"

Hi All,

Is anyone aware if this a general limitation of DomU Or is there a way to
convince DomU to expose USB host controllers with streams support ?

Thanks
Sudheer

On Tue, Aug 30, 2022 at 1:34 PM A Sudheer <asr7247@gmail.com> wrote:

> Few more logs
>
> From Dom0, did passthrough of two USB drives (32GB stick and 250GB USB SDD)
> In DomU, 32GB driver got mounted but 250GB SSD fails to mount.
> In DomU, "lsusb" shows both the drives but "usb-devices" shows only the
> 32GB drive.
>
> *Dom0 log:*
> amd@HOST:~$ sudo xl usb-list vm1
> Devid  Type         BE  state usb-ver ports
> 0      devicemodel  0   0     3       15
>   Port 1: Bus 003 Device 002
>   Port 2: Bus 005 Device 002
>   Port 3:
>   Port 4:
>   Port 5:
>   Port 6:
>   Port 7:
>   Port 8:
>   Port 9:
>   Port 10:
>   Port 11:
>   Port 12:
>   Port 13:
>   Port 14:
>   Port 15:
> HOST:~$
>
> *DomU Log:*
> amd@VM1:~$ lsusb
> Bus 003 Device 003: ID 0781:558c SanDisk Corp. Extreme Portable SSD
> Bus 003 Device 002: ID 0781:5581 SanDisk Corp. Ultra
> Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 002: ID 0627:0001 Adomax Technology Co., Ltd QEMU USB Tablet
> Bus 001 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> amd@VM1:~$
>
> *amd@VM1:~$ usb-devices*
>
> T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=12  MxCh= 2
> D:  Ver= 1.10 Cls=09(hub  ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1d6b ProdID=0001 Rev=05.18
> S:  Manufacturer=Linux 5.18.0-4460-amd+ uhci_hcd
> S:  Product=UHCI Host Controller
> S:  SerialNumber=0000:00:01.2
> C:  #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=0mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
> E:  Ad=81(I) Atr=03(Int.) MxPS=   2 Ivl=255ms
>
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 8 #Cfgs=  1
> P:  Vendor=0627 ProdID=0001 Rev=00.00
> S:  Manufacturer=QEMU
> S:  Product=QEMU USB Tablet
> S:  SerialNumber=42
> C:  #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=100mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
> E:  Ad=81(I) Atr=03(Int.) MxPS=   8 Ivl=10ms
>
> T:  Bus=02 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=480 MxCh=15
> D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=1d6b ProdID=0002 Rev=05.18
> S:  Manufacturer=Linux 5.18.0-4460-amd+ xhci-hcd
> S:  Product=xHCI Host Controller
> S:  SerialNumber=0000:00:04.0
> C:  #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=0mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
> E:  Ad=81(I) Atr=03(Int.) MxPS=   4 Ivl=256ms
>
> T:  Bus=03 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=5000 MxCh=15
> D:  Ver= 3.00 Cls=09(hub  ) Sub=00 Prot=03 MxPS= 9 #Cfgs=  1
> P:  Vendor=1d6b ProdID=0003 Rev=05.18
> S:  Manufacturer=Linux 5.18.0-4460-amd+ xhci-hcd
> S:  Product=xHCI Host Controller
> S:  SerialNumber=0000:00:04.0
> C:  #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=0mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
> E:  Ad=81(I) Atr=03(Int.) MxPS=   4 Ivl=256ms
>
> T:  Bus=03 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=0781 ProdID=5581 Rev=01.00
> S:  Manufacturer= USB
> *S:  Product= SanDisk 3.2Gen1*
> S:
>  SerialNumber=040143504c9a3bd4596082500826a11868845df4396ebc5cb2e33dd3071e3fd5505f000000000000000000003ca6a60b000d7c18815581071b2a7c33
> C:  #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=896mA
> I:  If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
> E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> amd@VM1:~$
>
> *amd@VM1:~$ sudo dmesg <for 250GB USB-C SSD>*
>
> [  247.071742] usb 3-2: new SuperSpeed USB device number 3 using xhci_hcd
> [  247.097304] usb 3-2: New USB device found, idVendor=0781,
> idProduct=558c, bcdDevice=10.12
> [  247.097314] usb 3-2: New USB device strings: Mfr=2, Product=3,
> SerialNumber=1
> [  247.097318] usb 3-2: Product: Extreme SSD
> [  247.097321] usb 3-2: Manufacturer: SanDisk
> [  247.097323] usb 3-2: SerialNumber: 31393430475A343030363932
> [  247.101909] usb 3-2: USB controller 0000:00:04.0 does not support
> streams, which are required by the UAS driver.
> [  247.101915] usb 3-2: Please try an other USB controller if you wish to
> use UAS.
> [  247.101918] usb-storage 3-2:1.0: USB Mass Storage device detected
> [  247.102710] scsi host3: usb-storage 3-2:1.0
> [  269.131522] usb 3-2: reset SuperSpeed USB device number 3 using xhci_hcd
>
> *DomU dmesg log while adding USB controller and USB 32GB disk*
>
> [   94.494852] pci 0000:00:04.0: [1033:0194] type 00 class 0x0c0330
> [   94.496278] pci 0000:00:04.0: reg 0x10: [mem 0x00000000-0x00003fff
> 64bit]
> [   94.502161] pci 0000:00:04.0: BAR 0: assigned [mem
> 0xf1800000-0xf1803fff 64bit]
> [   94.502981] pci 0000:00:04.0: enabling device (0000 -> 0002)
> [   94.504005] xen: --> pirq=24 -> irq=32 (gsi=32)
> [   94.514634] xhci_hcd 0000:00:04.0: xHCI Host Controller
> [   94.514650] xhci_hcd 0000:00:04.0: new USB bus registered, assigned bus
> number 2
> [   94.517840] xhci_hcd 0000:00:04.0: hcc params 0x00080001 hci version
> 0x100 quirks 0x0000000000000014
> [   94.523559] usb usb2: New USB device found, idVendor=1d6b,
> idProduct=0002, bcdDevice= 5.18
> [   94.523571] usb usb2: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [   94.523575] usb usb2: Product: xHCI Host Controller
> [   94.523579] usb usb2: Manufacturer: Linux 5.18.0-4460-amd+ xhci-hcd
> [   94.523581] usb usb2: SerialNumber: 0000:00:04.0
> [   94.523974] hub 2-0:1.0: USB hub found
> [   94.524850] hub 2-0:1.0: 15 ports detected
> [   94.529968] xhci_hcd 0000:00:04.0: xHCI Host Controller
> [   94.529981] xhci_hcd 0000:00:04.0: new USB bus registered, assigned bus
> number 3
> [   94.529988] xhci_hcd 0000:00:04.0: Host supports USB 3.0 SuperSpeed
> [   94.530354] usb usb3: We don't know the algorithms for LPM for this
> host, disabling LPM.
> [   94.530400] usb usb3: New USB device found, idVendor=1d6b,
> idProduct=0003, bcdDevice= 5.18
> [   94.530404] usb usb3: New USB device strings: Mfr=3, Product=2,
> SerialNumber=1
> [   94.530407] usb usb3: Product: xHCI Host Controller
> [   94.530410] usb usb3: Manufacturer: Linux 5.18.0-4460-amd+ xhci-hcd
> [   94.530412] usb usb3: SerialNumber: 0000:00:04.0
> [   94.530653] hub 3-0:1.0: USB hub found
> [   94.531482] hub 3-0:1.0: 15 ports detected
> [  157.522609] usb 3-1: new SuperSpeed USB device number 2 using xhci_hcd
> [  157.548225] usb 3-1: New USB device found, idVendor=0781,
> idProduct=5581, bcdDevice= 1.00
> [  157.548236] usb 3-1: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [  157.548239] usb 3-1: Product:  SanDisk 3.2Gen1
> [  157.548242] usb 3-1: Manufacturer:  USB
> [  157.548244] usb 3-1: SerialNumber:
> 040143504c9a3bd4596082500826a11868845df4396ebc5cb2e33dd3071e3fd5505f000000000000000000003ca6a60b000d7c18815581071b2a7c33
> [  157.571419] usb-storage 3-1:1.0: USB Mass Storage device detected
> [  157.571981] scsi host2: usb-storage 3-1:1.0
> [  157.572125] usbcore: registered new interface driver usb-storage
> [  157.577381] usbcore: registered new interface driver uas
> [  158.581138] scsi 2:0:0:0: Direct-Access      USB      SanDisk 3.2Gen1
> 1.00 PQ: 0 ANSI: 6
> [  158.581550] sd 2:0:0:0: Attached scsi generic sg0 type 0
> [  158.584622] sd 2:0:0:0: [sda] 60088320 512-byte logical blocks: (30.8
> GB/28.7 GiB)
> [  158.590171] sd 2:0:0:0: [sda] Write Protect is off
> [  158.590181] sd 2:0:0:0: [sda] Mode Sense: 43 00 00 00
> [  158.593387] sd 2:0:0:0: [sda] Write cache: disabled, read cache:
> enabled, doesn't support DPO or FUA
> [  158.614589]  sda: sda1
> [  158.627564] sd 2:0:0:0: [sda] Attached SCSI removable disk
>
>
> On Tue, Aug 30, 2022 at 11:12 AM A Sudheer <asr7247@gmail.com> wrote:
>
>> Hi All
>>
>> On XEN-4.16 with Ubuntu 22.04 Dom0 and HVM-DomU, I tried to do a USB mass
>> storage device passthrough to DomU.
>> I followed the PVUSB method mentioned in
>> https://wiki.xenproject.org/wiki/Xen_USB_Passthrough.
>>
>> I am able to do passthrough for USB 2.0 and 3.x version 32/64 GB mass
>> storage devices to DomU.
>> Passthrough failed for "SanDisk 250GB SSD USB-C, USB 3.1" with below
>> error. Able to access the SSD in Dom0.
>> Can someone help with what could be missing here.
>>
>> *Commands used:*
>> host$ sudo xl usbctrl-attach vm1 version=3 ports=6
>> host$ sudo xl usbdev-attach vm1 hostbus=3 hostaddr=2
>>
>> *Error Log in DomU*
>> VM1:~$ sudo dmesg
>> [  152.841566] usb 2-1: new SuperSpeed USB device number 2 using xhci_hcd
>> [  152.867164] usb 2-1: New USB device found, idVendor=0781,
>> idProduct=558c, bcdDevice=10.12
>> [  152.867173] usb 2-1: New USB device strings: Mfr=2, Product=3,
>> SerialNumber=1
>> [  152.867177] usb 2-1: Product: Extreme SSD
>> [  152.867179] usb 2-1: Manufacturer: SanDisk
>> [  152.867182] usb 2-1: SerialNumber: 31393430475A343030363932
>> [  152.899103] *usb 2-1: USB controller 0000:00:04.0 does not support
>> streams, which are required by the UAS driver.*
>> [  152.899110] usb 2-1: Please try an other USB controller if you wish to
>> use UAS.
>> [  152.899113] usb-storage 2-1:1.0: USB Mass Storage device detected
>> [  152.902033] scsi host2: usb-storage 2-1:1.0
>> [  152.902174] usbcore: registered new interface driver usb-storage
>> [  152.908928] usbcore: registered new interface driver uas
>> [  174.933399] usb 2-1: reset SuperSpeed USB device number 2 using
>> xhci_hcd
>>
>> Thanks
>> Sudheer
>>
>

--0000000000005eca1205e8143e89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br>Is anyone aware if this a general limitati=
on of DomU Or is there a way to convince DomU to expose USB host controller=
s with streams support ?<br><br>Thanks<br>Sudheer<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 30, =
2022 at 1:34 PM A Sudheer &lt;<a href=3D"mailto:asr7247@gmail.com">asr7247@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Few more logs<div><br></div><div>From Dom0, did=
 passthrough of two USB drives (32GB stick and 250GB USB SDD)</div><div>In =
DomU, 32GB driver got mounted but 250GB SSD fails to mount.</div><div>In Do=
mU, &quot;lsusb&quot; shows both the drives but &quot;usb-devices&quot;=C2=
=A0shows only the 32GB drive.</div><div><br></div><div><b>Dom0 log:</b></di=
v><div>amd@HOST:~$ sudo xl usb-list vm1<br>Devid =C2=A0Type =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BE =C2=A0state usb-ver ports<br>0 =C2=A0 =C2=A0 =C2=A0devicem=
odel =C2=A00 =C2=A0 0 =C2=A0 =C2=A0 3 =C2=A0 =C2=A0 =C2=A0 15<br>=C2=A0 Por=
t 1: Bus 003 Device 002<br>=C2=A0 Port 2: Bus 005 Device 002<br>=C2=A0 Port=
 3:<br>=C2=A0 Port 4:<br>=C2=A0 Port 5:<br>=C2=A0 Port 6:<br>=C2=A0 Port 7:=
<br>=C2=A0 Port 8:<br>=C2=A0 Port 9:<br>=C2=A0 Port 10:<br>=C2=A0 Port 11:<=
br>=C2=A0 Port 12:<br>=C2=A0 Port 13:<br>=C2=A0 Port 14:<br>=C2=A0 Port 15:=
<br>HOST:~$<br></div><div><br></div><div><b><u>DomU Log:</u></b></div><div>=
amd@VM1:~$ lsusb<br>Bus 003 Device 003: ID 0781:558c SanDisk Corp. Extreme =
Portable SSD<br>Bus 003 Device 002: ID 0781:5581 SanDisk Corp. Ultra<br>Bus=
 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub<br>Bus 002 Devi=
ce 001: ID 1d6b:0002 Linux Foundation 2.0 root hub<br>Bus 001 Device 002: I=
D 0627:0001 Adomax Technology Co., Ltd QEMU USB Tablet<br>Bus 001 Device 00=
1: ID 1d6b:0001 Linux Foundation 1.1 root hub<br>amd@VM1:~$<br></div><div><=
br></div><div><b>amd@VM1:~$ usb-devices</b><br><br>T: =C2=A0Bus=3D01 Lev=3D=
00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D =C2=A01 Spd=3D12 =C2=A0MxCh=3D 2<br=
>D: =C2=A0Ver=3D 1.10 Cls=3D09(hub =C2=A0) Sub=3D00 Prot=3D00 MxPS=3D64 #Cf=
gs=3D =C2=A01<br>P: =C2=A0Vendor=3D1d6b ProdID=3D0001 Rev=3D05.18<br>S: =C2=
=A0Manufacturer=3DLinux 5.18.0-4460-amd+ uhci_hcd<br>S: =C2=A0Product=3DUHC=
I Host Controller<br>S: =C2=A0SerialNumber=3D0000:00:01.2<br>C: =C2=A0#Ifs=
=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA<br>I: =C2=A0If#=3D 0 Alt=3D 0 #EPs=3D =
1 Cls=3D09(hub =C2=A0) Sub=3D00 Prot=3D00 Driver=3Dhub<br>E: =C2=A0Ad=3D81(=
I) Atr=3D03(Int.) MxPS=3D =C2=A0 2 Ivl=3D255ms<br><br>T: =C2=A0Bus=3D01 Lev=
=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D =C2=A02 Spd=3D12 =C2=A0MxCh=3D 0=
<br>D: =C2=A0Ver=3D 2.00 Cls=3D00(&gt;ifc ) Sub=3D00 Prot=3D00 MxPS=3D 8 #C=
fgs=3D =C2=A01<br>P: =C2=A0Vendor=3D0627 ProdID=3D0001 Rev=3D00.00<br>S: =
=C2=A0Manufacturer=3DQEMU<br>S: =C2=A0Product=3DQEMU USB Tablet<br>S: =C2=
=A0SerialNumber=3D42<br>C: =C2=A0#Ifs=3D 1 Cfg#=3D 1 Atr=3Da0 MxPwr=3D100mA=
<br>I: =C2=A0If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID =C2=A0) Sub=3D00 Prot=
=3D00 Driver=3Dusbhid<br>E: =C2=A0Ad=3D81(I) Atr=3D03(Int.) MxPS=3D =C2=A0 =
8 Ivl=3D10ms<br><br>T: =C2=A0Bus=3D02 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00=
 Dev#=3D =C2=A01 Spd=3D480 MxCh=3D15<br>D: =C2=A0Ver=3D 2.00 Cls=3D09(hub =
=C2=A0) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D =C2=A01<br>P: =C2=A0Vendor=3D=
1d6b ProdID=3D0002 Rev=3D05.18<br>S: =C2=A0Manufacturer=3DLinux 5.18.0-4460=
-amd+ xhci-hcd<br>S: =C2=A0Product=3DxHCI Host Controller<br>S: =C2=A0Seria=
lNumber=3D0000:00:04.0<br>C: =C2=A0#Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA=
<br>I: =C2=A0If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub =C2=A0) Sub=3D00 Prot=
=3D00 Driver=3Dhub<br>E: =C2=A0Ad=3D81(I) Atr=3D03(Int.) MxPS=3D =C2=A0 4 I=
vl=3D256ms<br><br>T: =C2=A0Bus=3D03 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 D=
ev#=3D =C2=A01 Spd=3D5000 MxCh=3D15<br>D: =C2=A0Ver=3D 3.00 Cls=3D09(hub =
=C2=A0) Sub=3D00 Prot=3D03 MxPS=3D 9 #Cfgs=3D =C2=A01<br>P: =C2=A0Vendor=3D=
1d6b ProdID=3D0003 Rev=3D05.18<br>S: =C2=A0Manufacturer=3DLinux 5.18.0-4460=
-amd+ xhci-hcd<br>S: =C2=A0Product=3DxHCI Host Controller<br>S: =C2=A0Seria=
lNumber=3D0000:00:04.0<br>C: =C2=A0#Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA=
<br>I: =C2=A0If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub =C2=A0) Sub=3D00 Prot=
=3D00 Driver=3Dhub<br>E: =C2=A0Ad=3D81(I) Atr=3D03(Int.) MxPS=3D =C2=A0 4 I=
vl=3D256ms<br><br>T: =C2=A0Bus=3D03 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 D=
ev#=3D =C2=A02 Spd=3D5000 MxCh=3D 0<br>D: =C2=A0Ver=3D 3.20 Cls=3D00(&gt;if=
c ) Sub=3D00 Prot=3D00 MxPS=3D 9 #Cfgs=3D =C2=A01<br>P: =C2=A0Vendor=3D0781=
 ProdID=3D5581 Rev=3D01.00<br>S: =C2=A0Manufacturer=3D USB<br><b>S: =C2=A0P=
roduct=3D SanDisk 3.2Gen1</b><br>S: =C2=A0SerialNumber=3D040143504c9a3bd459=
6082500826a11868845df4396ebc5cb2e33dd3071e3fd5505f000000000000000000003ca6a=
60b000d7c18815581071b2a7c33<br>C: =C2=A0#Ifs=3D 1 Cfg#=3D 1 Atr=3D80 MxPwr=
=3D896mA<br>I: =C2=A0If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3D08(stor.) Sub=3D06 P=
rot=3D50 Driver=3Dusb-storage<br>E: =C2=A0Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D=
1024 Ivl=3D0ms<br>E: =C2=A0Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D1024 Ivl=3D0ms<=
br>amd@VM1:~$<br></div><div><b><br></b></div><div><b>amd@VM1:~$ sudo dmesg =
&lt;for 250GB USB-C SSD&gt;</b><br><br>[ =C2=A0247.071742] usb 3-2: new Sup=
erSpeed USB device number 3 using xhci_hcd<br>[ =C2=A0247.097304] usb 3-2: =
New USB device found, idVendor=3D0781, idProduct=3D558c, bcdDevice=3D10.12<=
br>[ =C2=A0247.097314] usb 3-2: New USB device strings: Mfr=3D2, Product=3D=
3, SerialNumber=3D1<br>[ =C2=A0247.097318] usb 3-2: Product: Extreme SSD<br=
>[ =C2=A0247.097321] usb 3-2: Manufacturer: SanDisk<br>[ =C2=A0247.097323] =
usb 3-2: SerialNumber: 31393430475A343030363932<br>[ =C2=A0247.101909] usb =
3-2: USB controller 0000:00:04.0 does not support streams, which are requir=
ed by the UAS driver.<br>[ =C2=A0247.101915] usb 3-2: Please try an other U=
SB controller if you wish to use UAS.<br>[ =C2=A0247.101918] usb-storage 3-=
2:1.0: USB Mass Storage device detected<br>[ =C2=A0247.102710] scsi host3: =
usb-storage 3-2:1.0<br>[ =C2=A0269.131522] usb 3-2: reset SuperSpeed USB de=
vice number 3 using xhci_hcd<br></div><div><br></div><div><b>DomU dmesg log=
 while adding USB controller and USB 32GB disk</b></div><div><b><br></b></d=
iv><div>[ =C2=A0 94.494852] pci 0000:00:04.0: [1033:0194] type 00 class 0x0=
c0330<br>[ =C2=A0 94.496278] pci 0000:00:04.0: reg 0x10: [mem 0x00000000-0x=
00003fff 64bit]<br>[ =C2=A0 94.502161] pci 0000:00:04.0: BAR 0: assigned [m=
em 0xf1800000-0xf1803fff 64bit]<br>[ =C2=A0 94.502981] pci 0000:00:04.0: en=
abling device (0000 -&gt; 0002)<br>[ =C2=A0 94.504005] xen: --&gt; pirq=3D2=
4 -&gt; irq=3D32 (gsi=3D32)<br>[ =C2=A0 94.514634] xhci_hcd 0000:00:04.0: x=
HCI Host Controller<br>[ =C2=A0 94.514650] xhci_hcd 0000:00:04.0: new USB b=
us registered, assigned bus number 2<br>[ =C2=A0 94.517840] xhci_hcd 0000:0=
0:04.0: hcc params 0x00080001 hci version 0x100 quirks 0x0000000000000014<b=
r>[ =C2=A0 94.523559] usb usb2: New USB device found, idVendor=3D1d6b, idPr=
oduct=3D0002, bcdDevice=3D 5.18<br>[ =C2=A0 94.523571] usb usb2: New USB de=
vice strings: Mfr=3D3, Product=3D2, SerialNumber=3D1<br>[ =C2=A0 94.523575]=
 usb usb2: Product: xHCI Host Controller<br>[ =C2=A0 94.523579] usb usb2: M=
anufacturer: Linux 5.18.0-4460-amd+ xhci-hcd<br>[ =C2=A0 94.523581] usb usb=
2: SerialNumber: 0000:00:04.0<br>[ =C2=A0 94.523974] hub 2-0:1.0: USB hub f=
ound<br>[ =C2=A0 94.524850] hub 2-0:1.0: 15 ports detected<br>[ =C2=A0 94.5=
29968] xhci_hcd 0000:00:04.0: xHCI Host Controller<br>[ =C2=A0 94.529981] x=
hci_hcd 0000:00:04.0: new USB bus registered, assigned bus number 3<br>[ =
=C2=A0 94.529988] xhci_hcd 0000:00:04.0: Host supports USB 3.0 SuperSpeed<b=
r>[ =C2=A0 94.530354] usb usb3: We don&#39;t know the algorithms for LPM fo=
r this host, disabling LPM.<br>[ =C2=A0 94.530400] usb usb3: New USB device=
 found, idVendor=3D1d6b, idProduct=3D0003, bcdDevice=3D 5.18<br>[ =C2=A0 94=
.530404] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, SerialNumb=
er=3D1<br>[ =C2=A0 94.530407] usb usb3: Product: xHCI Host Controller<br>[ =
=C2=A0 94.530410] usb usb3: Manufacturer: Linux 5.18.0-4460-amd+ xhci-hcd<b=
r>[ =C2=A0 94.530412] usb usb3: SerialNumber: 0000:00:04.0<br>[ =C2=A0 94.5=
30653] hub 3-0:1.0: USB hub found<br>[ =C2=A0 94.531482] hub 3-0:1.0: 15 po=
rts detected<br>[ =C2=A0157.522609] usb 3-1: new SuperSpeed USB device numb=
er 2 using xhci_hcd<br>[ =C2=A0157.548225] usb 3-1: New USB device found, i=
dVendor=3D0781, idProduct=3D5581, bcdDevice=3D 1.00<br>[ =C2=A0157.548236] =
usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3<br>=
[ =C2=A0157.548239] usb 3-1: Product: =C2=A0SanDisk 3.2Gen1<br>[ =C2=A0157.=
548242] usb 3-1: Manufacturer: =C2=A0USB<br>[ =C2=A0157.548244] usb 3-1: Se=
rialNumber: 040143504c9a3bd4596082500826a11868845df4396ebc5cb2e33dd3071e3fd=
5505f000000000000000000003ca6a60b000d7c18815581071b2a7c33<br>[ =C2=A0157.57=
1419] usb-storage 3-1:1.0: USB Mass Storage device detected<br>[ =C2=A0157.=
571981] scsi host2: usb-storage 3-1:1.0<br>[ =C2=A0157.572125] usbcore: reg=
istered new interface driver usb-storage<br>[ =C2=A0157.577381] usbcore: re=
gistered new interface driver uas<br>[ =C2=A0158.581138] scsi 2:0:0:0: Dire=
ct-Access =C2=A0 =C2=A0 =C2=A0USB =C2=A0 =C2=A0 =C2=A0SanDisk 3.2Gen1 1.00 =
PQ: 0 ANSI: 6<br>[ =C2=A0158.581550] sd 2:0:0:0: Attached scsi generic sg0 =
type 0<br>[ =C2=A0158.584622] sd 2:0:0:0: [sda] 60088320 512-byte logical b=
locks: (30.8 GB/28.7 GiB)<br>[ =C2=A0158.590171] sd 2:0:0:0: [sda] Write Pr=
otect is off<br>[ =C2=A0158.590181] sd 2:0:0:0: [sda] Mode Sense: 43 00 00 =
00<br>[ =C2=A0158.593387] sd 2:0:0:0: [sda] Write cache: disabled, read cac=
he: enabled, doesn&#39;t support DPO or FUA<br>[ =C2=A0158.614589] =C2=A0sd=
a: sda1<br>[ =C2=A0158.627564] sd 2:0:0:0: [sda] Attached SCSI removable di=
sk<br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Aug 30, 2022 at 11:12 AM A Sudheer &lt;<=
a href=3D"mailto:asr7247@gmail.com" target=3D"_blank">asr7247@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr">Hi All<br><br>On XEN-4.16 with Ubuntu 22.04 Dom0 and HVM-DomU,=
 I tried to do a USB mass storage device passthrough to DomU.<br>I followed=
 the PVUSB method mentioned in <a href=3D"https://wiki.xenproject.org/wiki/=
Xen_USB_Passthrough" target=3D"_blank">https://wiki.xenproject.org/wiki/Xen=
_USB_Passthrough</a>.<br><br>I am able to do passthrough for USB 2.0 and 3.=
x version 32/64 GB mass storage devices to DomU.=C2=A0<br>Passthrough faile=
d for &quot;SanDisk 250GB SSD USB-C, USB 3.1&quot; with below error. Able t=
o access the SSD in Dom0.<div>Can someone help with what could be missing h=
ere.<br><br><b>Commands=C2=A0used:</b></div><div><span style=3D"color:rgb(2=
3,43,77);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,=
Roboto,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Hel=
vetica Neue&quot;,sans-serif;font-size:14px">host$ sudo xl usbctrl-attach v=
m1 version=3D3 ports=3D6</span></div><div><span style=3D"color:rgb(23,43,77=
);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Roboto,=
Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica =
Neue&quot;,sans-serif;font-size:14px">host$ sudo xl usbdev-attach vm1 hostb=
us=3D3 hostaddr=3D2</span></div><div><font color=3D"#172b4d" face=3D"-apple=
-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen, Ubuntu, Fira Sans, D=
roid Sans, Helvetica Neue, sans-serif"><span style=3D"font-size:14px"><br><=
/span></font></div><div><font color=3D"#172b4d" face=3D"-apple-system, Blin=
kMacSystemFont, Segoe UI, Roboto, Oxygen, Ubuntu, Fira Sans, Droid Sans, He=
lvetica Neue, sans-serif"><span style=3D"font-size:14px"><b>Error Log in Do=
mU</b></span></font></div><div>VM1:~$ sudo dmesg<br>[ =C2=A0152.841566] usb=
 2-1: new SuperSpeed USB device number 2 using xhci_hcd<br>[ =C2=A0152.8671=
64] usb 2-1: New USB device found, idVendor=3D0781, idProduct=3D558c, bcdDe=
vice=3D10.12<br>[ =C2=A0152.867173] usb 2-1: New USB device strings: Mfr=3D=
2, Product=3D3, SerialNumber=3D1<br>[ =C2=A0152.867177] usb 2-1: Product: E=
xtreme SSD<br>[ =C2=A0152.867179] usb 2-1: Manufacturer: SanDisk<br>[ =C2=
=A0152.867182] usb 2-1: SerialNumber: 31393430475A343030363932<br>[ =C2=A01=
52.899103] <b>usb 2-1: USB controller 0000:00:04.0 does not support streams=
, which are required by the UAS driver.</b><br>[ =C2=A0152.899110] usb 2-1:=
 Please try an other USB controller if you wish to use UAS.<br>[ =C2=A0152.=
899113] usb-storage 2-1:1.0: USB Mass Storage device detected<br>[ =C2=A015=
2.902033] scsi host2: usb-storage 2-1:1.0<br>[ =C2=A0152.902174] usbcore: r=
egistered new interface driver usb-storage<div>[ =C2=A0152.908928] usbcore:=
 registered new interface driver uas<br></div><div>[ =C2=A0174.933399] usb =
2-1: reset SuperSpeed USB device number 2 using xhci_hcd<br></div><div><br>=
</div><div>Thanks</div><div>Sudheer</div></div></div>
</blockquote></div>
</blockquote></div>

--0000000000005eca1205e8143e89--


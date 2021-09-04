Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3510400BD4
	for <lists+xen-devel@lfdr.de>; Sat,  4 Sep 2021 17:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178747.324836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMXLB-0002Gd-1z; Sat, 04 Sep 2021 15:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178747.324836; Sat, 04 Sep 2021 15:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMXLA-0002Dh-V2; Sat, 04 Sep 2021 15:12:20 +0000
Received: by outflank-mailman (input) for mailman id 178747;
 Sat, 04 Sep 2021 15:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iNAo=N2=unixindia.com=bhasker@srs-us1.protection.inumbo.net>)
 id 1mMXL9-0001n1-DE
 for xen-devel@lists.xenproject.org; Sat, 04 Sep 2021 15:12:19 +0000
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02e1509f-60cd-4cfd-943a-dd85528f12ed;
 Sat, 04 Sep 2021 15:12:13 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z1so2674159ioh.7
 for <xen-devel@lists.xenproject.org>; Sat, 04 Sep 2021 08:12:13 -0700 (PDT)
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
X-Inumbo-ID: 02e1509f-60cd-4cfd-943a-dd85528f12ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unixindia.com; s=mail;
        h=mime-version:from:date:message-id:subject:to;
        bh=pWt61Hm0SnYMak2zE6TxuNgLfbDZ8EXWGBHuDC9vfNo=;
        b=g88JVThzb2JAnZfM/5MOidhBsqJY+bJvMZgZqXlMWGinkwCFeq6kzUINkKBYJAYZU7
         mYr+f+5Z3gDw+R8VI+K8mdd+Su2OJdYP9clU+oUBjVYw7jyUmY2XBhJe77jtxFoTNOBN
         u42zDC4CPdplnPvdfsOfplyVgUF5p/OzvORvBNJS1uX2yCjbjevnMc2Su6WhxxBQO9hP
         loQVTTSEjLS6GHfh0tcsjbuS3oT2yAaC5zrH1SYWiLrl5PY3xs4bUg+j7tBXCuiHuZs2
         TYCs7RkwHEyklYsItJ0DaTjznHKhm9pJPypxk+DDmuoA4YLPUeEfG9jT2jYmxtVx4gjZ
         R/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pWt61Hm0SnYMak2zE6TxuNgLfbDZ8EXWGBHuDC9vfNo=;
        b=fkPPAmN2Bf4JlMwdCXsI3agwEGYMlTb0cq7nRhUMfJu1Uq6mAaYq2z2WhQqeZRjMV3
         GSGvAGPs6pDLZvwKvpUEwRqqoayjCaVpRsJFkXRn/oS6xYX/Pf9klouEUFj1wB1d9A8s
         RD1Y1tJLTowayLUskZGHVx8hUl5iRg5iVpj0G6RWcyfIv7wxMDvWsUMMsJt6bGp/QCBx
         RIQls3VMJ4cWgnABw5hKavo4AyVvcTPIYGUFPHul5s+iJr/COl2Vw0z5xp2j+i+oGc2q
         nJgD6mDnxpyfQcILb9f+HK3POPty766s5WG+Er0gy6H1DJ0869pdyD5/yqfbFUZ3EHF6
         bi6g==
X-Gm-Message-State: AOAM5331kJ12gHtiq8zcB/WKWXphhgrliELyRmu5Ovg65k2V/3ii4P/w
	wPPHQvZkxozjmPJuvw/hx7lruCUGwY1qY0Cvl8dEX1JwTud3wpVvsfQ=
X-Google-Smtp-Source: ABdhPJwSvIUeRvrvCIQfenu9f5WaY1Iqrvp5MotteTEVGvNe+xr2GDWj0n4ors9QO4Fx1DXafKJtLkQjLOyQDeZ51BI=
X-Received: by 2002:a05:6638:4195:: with SMTP id az21mr3666596jab.40.1630768332265;
 Sat, 04 Sep 2021 08:12:12 -0700 (PDT)
MIME-Version: 1.0
From: Bhasker C V <bhasker@unixindia.com>
Date: Sat, 4 Sep 2021 16:12:01 +0100
Message-ID: <CAPLCSGCkdZMph=iRrqf3G5kT881mN5kYaG=qXrMtWS=fTn2O=g@mail.gmail.com>
Subject: Help with Network SR-IOV (PF still in reset state. Is the PF
 interface up?)
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000027f14e05cb2cd71c"

--00000000000027f14e05cb2cd71c
Content-Type: text/plain; charset="UTF-8"

I run  xen-4.14.3-pre from debian

I created 6 vfs for my igb card
06:00.0 Ethernet controller: Intel Corporation I350 Gigabit Network
Connection (rev 01)
I got these
07:10.0 Ethernet controller: Intel Corporation I350 Ethernet Controller
Virtual Function (rev 01)
07:10.1 Ethernet controller: Intel Corporation I350 Ethernet Controller
Virtual Function (rev 01)
07:10.4 Ethernet controller: Intel Corporation I350 Ethernet Controller
Virtual Function (rev 01)
07:10.5 Ethernet controller: Intel Corporation I350 Ethernet Controller
Virtual Function (rev 01)
07:11.0 Ethernet controller: Intel Corporation I350 Ethernet Controller
Virtual Function (rev 01)
07:11.1 Ethernet controller: Intel Corporation I350 Ethernet Controller
Virtual Function (rev 01)

bcv@bcvibmb1:~$ sudo xl pci-assignable-list
0000:07:10.1

However the guest is not able to see the link up.
bcv@utils:~$ sudo ethtool  enp0s0f1



Settings for enp0s0f1:

        Supported ports: [ ]
...

        Link detected: no

I see this error on the guest

[    6.134890] igbvf 0000:00:00.1: Xen PCI mapped GSI0 to IRQ19

[    6.149577] igbvf 0000:00:00.1: PF still in reset state. Is the PF
interface up?

[    6.149595] igbvf 0000:00:00.1: Assigning random MAC address.



[    6.151552] igbvf 0000:00:00.1: PF still resetting

[    6.153807] igbvf 0000:00:00.1: Intel(R) I350 Virtual Function

[    6.153822] igbvf 0000:00:00.1: Address: 32:91:70:c5:62:bd


and thiis on the host:
[  390.776779] xen-blkback: backend/vbd/3/51713: using 1 queues, protocol 1
(x86_64-abi) persistent grants


[  395.849996] pciback 0000:07:10.1: xen-pciback: Driver tried to write to
a read-only configuration space field at offset 0x1d6, size 2. This may be
harmless, but if you have problems with your device:

[  395.849996] 1) see permissive attribute in sysfs



[  395.849996] 2) report problems to the xen-devel mailing list along with
details of your device obtained from lspci.


[  396.103595] pciback 0000:07:10.1: enabling device (0000 -> 0002)




However if I pass through 07:10.4 it works fine. The host still reports
this  above error but all works well in the guest.


Please could someone help ? I have been using  KVM these years and just
moved to xen and hence new to xen.


Regards
Bhasker C V

--00000000000027f14e05cb2cd71c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5JIHJ1bsKgIHhlbi00LjE0LjMtcHJlIGZyb20gZGViaWFuPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGNyZWF0ZWQgNiB2ZnMgZm9yIG15IGlnYiBjYXJkIDxi
cj48L2Rpdj48ZGl2PjA2OjAwLjAgRXRoZXJuZXQgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRp
b24gSTM1MCBHaWdhYml0IE5ldHdvcmsgQ29ubmVjdGlvbiAocmV2IDAxKTwvZGl2PjxkaXY+SSBn
b3QgdGhlc2U8L2Rpdj48ZGl2PjA3OjEwLjAgRXRoZXJuZXQgY29udHJvbGxlcjogSW50ZWwgQ29y
cG9yYXRpb24gSTM1MCBFdGhlcm5ldCBDb250cm9sbGVyIFZpcnR1YWwgRnVuY3Rpb24gKHJldiAw
MSk8YnI+MDc6MTAuMSBFdGhlcm5ldCBjb250cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiBJMzUw
IEV0aGVybmV0IENvbnRyb2xsZXIgVmlydHVhbCBGdW5jdGlvbiAocmV2IDAxKTxicj4wNzoxMC40
IEV0aGVybmV0IGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIEkzNTAgRXRoZXJuZXQgQ29u
dHJvbGxlciBWaXJ0dWFsIEZ1bmN0aW9uIChyZXYgMDEpPGJyPjA3OjEwLjUgRXRoZXJuZXQgY29u
dHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gSTM1MCBFdGhlcm5ldCBDb250cm9sbGVyIFZpcnR1
YWwgRnVuY3Rpb24gKHJldiAwMSk8YnI+MDc6MTEuMCBFdGhlcm5ldCBjb250cm9sbGVyOiBJbnRl
bCBDb3Jwb3JhdGlvbiBJMzUwIEV0aGVybmV0IENvbnRyb2xsZXIgVmlydHVhbCBGdW5jdGlvbiAo
cmV2IDAxKTxicj4wNzoxMS4xIEV0aGVybmV0IGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9u
IEkzNTAgRXRoZXJuZXQgQ29udHJvbGxlciBWaXJ0dWFsIEZ1bmN0aW9uIChyZXYgMDEpPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5iY3ZAYmN2aWJtYjE6fiQgc3VkbyB4bCBwY2ktYXNzaWduYWJs
ZS1saXN0PGJyPjAwMDA6MDc6MTAuMTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SG93ZXZlciB0
aGUgZ3Vlc3QgaXMgbm90IGFibGUgdG8gc2VlIHRoZSBsaW5rIHVwLiA8YnI+PC9kaXY+PGRpdj5i
Y3ZAdXRpbHM6fiQgc3VkbyBldGh0b29sIMKgZW5wMHMwZjEgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPlNldHRpbmdzIGZvciBlbnAwczBmMTogwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAgU3VwcG9ydGVkIHBvcnRzOiBbIF0gwqAgPGJy
PjwvZGl2PjxkaXY+Li4uwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqDCoCA8YnI+wqAgwqAgwqAgwqAgTGluayBkZXRlY3RlZDogbm8gwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+SSBzZWUgdGhpcyBlcnJvciBvbiB0aGUgZ3Vlc3Q8YnI+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5bIMKgIMKgNi4xMzQ4OTBdIGlnYnZmIDAwMDA6MDA6MDAuMTogWGVuIFBDSSBtYXBw
ZWQgR1NJMCB0byBJUlExOSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+WyDCoCDCoDYuMTQ5NTc3XSBpZ2J2ZiAw
MDAwOjAwOjAwLjE6IFBGIHN0aWxsIGluIHJlc2V0IHN0YXRlLiBJcyB0aGUgUEYgaW50ZXJmYWNl
IHVwPyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+WyDCoCDCoDYu
MTQ5NTk1XSBpZ2J2ZiAwMDAwOjAwOjAwLjE6IEFzc2lnbmluZyByYW5kb20gTUFDIGFkZHJlc3Mu
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgPGJyPlsgwqAgwqA2LjE1MTU1Ml0gaWdidmYgMDAwMDowMDowMC4xOiBQRiBzdGlsbCBy
ZXNldHRpbmcgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPlsgwqAgwqA2LjE1MzgwN10g
aWdidmYgMDAwMDowMDowMC4xOiBJbnRlbChSKSBJMzUwIFZpcnR1YWwgRnVuY3Rpb24gwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgPGJyPlsgwqAgwqA2LjE1MzgyMl0gaWdidmYgMDAwMDowMDowMC4xOiBBZGRyZXNzOiAzMjo5
MTo3MDpjNTo2MjpiZCDCoCDCoCA8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5hbmQgdGhpaXMgb24gdGhlIGhvc3Q6PC9kaXY+PGRpdj5bIMKgMzkwLjc3Njc3OV0g
eGVuLWJsa2JhY2s6IGJhY2tlbmQvdmJkLzMvNTE3MTM6IHVzaW5nIDEgcXVldWVzLCBwcm90b2Nv
bCAxICh4ODZfNjQtYWJpKSBwZXJzaXN0ZW50IGdyYW50cyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj5bIMKgMzk1Ljg0OTk5Nl0gcGNp
YmFjayAwMDAwOjA3OjEwLjE6IHhlbi1wY2liYWNrOiBEcml2ZXIgdHJpZWQgdG8gd3JpdGUgdG8g
YSByZWFkLW9ubHkgY29uZmlndXJhdGlvbiBzcGFjZSBmaWVsZCBhdCBvZmZzZXQgMHgxZDYsIHNp
emUgMi4gVGhpcyBtYXkgYmUgaGFybWxlc3MsIGJ1dCBpZiB5b3UgaGF2ZSBwcm9ibGVtcyB3aXRo
IHlvdXIgZGV2aWNlOiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj5bIMKgMzk1Ljg0OTk5
Nl0gMSkgc2VlIHBlcm1pc3NpdmUgYXR0cmlidXRlIGluIHN5c2ZzIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIDxicj5bIMKgMzk1Ljg0OTk5Nl0gMikgcmVwb3J0IHByb2JsZW1zIHRvIHRoZSB4ZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0IGFsb25nIHdpdGggZGV0YWlscyBvZiB5b3VyIGRldmljZSBvYnRh
aW5lZCBmcm9tIGxzcGNpLiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxi
cj5bIMKgMzk2LjEwMzU5NV0gcGNpYmFjayAwMDAwOjA3OjEwLjE6IGVuYWJsaW5nIGRldmljZSAo
MDAwMCAtJmd0OyAwMDAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIDxicj48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkhvd2V2ZXIgaWYgSSBwYXNzIHRocm91Z2gg
MDc6MTAuNCBpdCB3b3JrcyBmaW5lLiBUaGUgaG9zdCBzdGlsbCByZXBvcnRzIHRoaXPCoCBhYm92
ZSBlcnJvciBidXQgYWxsIHdvcmtzIHdlbGwgaW4gdGhlIGd1ZXN0LiA8YnI+PC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5QbGVhc2UgY291bGQgc29tZW9uZSBoZWxwID8g
SSBoYXZlIGJlZW4gdXNpbmfCoCBLVk0gdGhlc2UgeWVhcnMgYW5kIGp1c3QgbW92ZWQgdG8geGVu
IGFuZCBoZW5jZSBuZXcgdG8geGVuLiA8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5SZWdhcmRzPC9kaXY+PGRpdj5CaGFza2VyIEMgViA8YnI+PC9kaXY+PC9kaXY+
DQo=
--00000000000027f14e05cb2cd71c--


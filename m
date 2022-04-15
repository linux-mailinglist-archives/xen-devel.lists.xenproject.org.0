Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E20F50288E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 12:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305713.520807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfJcr-00023E-EE; Fri, 15 Apr 2022 10:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305713.520807; Fri, 15 Apr 2022 10:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfJcr-00020s-BJ; Fri, 15 Apr 2022 10:56:29 +0000
Received: by outflank-mailman (input) for mailman id 305713;
 Fri, 15 Apr 2022 10:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4CzB=UZ=gmail.com=marco.cacre@srs-se1.protection.inumbo.net>)
 id 1nfJcq-00020i-Hc
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 10:56:28 +0000
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b26dca8a-bcaa-11ec-8fbe-03012f2f19d4;
 Fri, 15 Apr 2022 12:56:27 +0200 (CEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso5203678otj.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Apr 2022 03:56:27 -0700 (PDT)
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
X-Inumbo-ID: b26dca8a-bcaa-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=/JhnDXHdpjHE4vq5NzzLKIxK+4k+ZM9QlgHgrpe5rT8=;
        b=SgYSfpKAvXyYjX6d7KmiNgvn6/TXipPIVBwJdEJzRTDgoYCnLwF3/HVm5JYEFTGUXy
         vqArY/bomVfSp0/AqJo4H53DpKi5H/NY1ZYvTDSht7JsYIcy7D9RcQLm/fc3FZ6wym7w
         Lxv/WoP8Uar+CHkHZ4rtyGhiOSkPMjS4MIarZfa/GfBJ5vg9mgVlDUHWmt7a0aOyt/Ll
         S2B3sccijh4ntsguH+Iyu1FjUPxoZQdbYa47NzRtmQNQ1yc3S0rmmEvMBacvf1ZovAbd
         n9T7/oGa11uivhms2mmN79apik9DrELpFnR7gCCRKgchhHgMAB7hdeCchIgIRXOfrDbF
         2h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/JhnDXHdpjHE4vq5NzzLKIxK+4k+ZM9QlgHgrpe5rT8=;
        b=WSqYpHYH+BVChu7WJQmLcchRUeG/pkiPKkeR1jGJjScS/baPX6KUujPAD2yUYepeCA
         vuLMLkpny3bbb4qWl9X3On5hyNSdu5qAfw7J0Pkfq8oJ+7tos0D67SHfmW0SbNjEPb45
         Ibap092x4zewlD1q976S12Ai4J1JsFoKWPq2qJ+m5j0Ie+uUYaxR00TCLWMokk6J0BdP
         /0DWQ3GDVvi8+5ekbB++IvPBoMnaCEFk3bwjhNPxpeSIKJNolrXHl9l3tcJeAxg6VZHN
         Zn491vRfBtBV4GGKRW2NlWPT7f0gfGPv94HazS8X8sxlHtIj8Z3YQQL0NWwXLz4ik/Fx
         bWYA==
X-Gm-Message-State: AOAM53007JsVNo83UfIEgRDkeugE4mHpfQL3cMEuQhwBTfB/UnvJ23UK
	4H/rHnttyznBoUlduSkFH7al/ez1rx5Y80p9cGinsphD
X-Google-Smtp-Source: ABdhPJxjIuDdOYPYcL2P7mB9geSE9jqILWHfe+UGYpZ8PsiuBbw0eYjx0l32Q20Vs52H4JyO4cwzI3zYy3lTHvnSH4Q=
X-Received: by 2002:a9d:6c47:0:b0:604:a6f3:f55c with SMTP id
 g7-20020a9d6c47000000b00604a6f3f55cmr99679otq.175.1650020186080; Fri, 15 Apr
 2022 03:56:26 -0700 (PDT)
MIME-Version: 1.0
From: Marco Cacre <marco.cacre@gmail.com>
Date: Fri, 15 Apr 2022 12:56:15 +0200
Message-ID: <CAGHctbYx6sspA__OmKyumU+WkhzEsDpLstyhRDM9Kbc696Co7Q@mail.gmail.com>
Subject: Problem creating domU guest on arm64
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000010498605dcaf43ab"

--00000000000010498605dcaf43ab
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm facing always the same problem (described below) trying to create a Xen
guest domain on rockpro64 (arm64).

I have successfully built uboot, xen (4.14.4) and dom0 linux kernel with
xen tool stack, these two last starting from buildroot (with linux kernel
version 5.15.33 and xen toolstack version 4.14.4)

These are the process of Xen:

177 root    /usr/sbin/xenwatchdogd 30 15
203 root    /usr/sbin/xenstored --pid-file /var/run/xen/xenstored.pid
208 root    /usr/sbin/xenconsoled --pid-file=/var/run/xen/xenconsoled.pid
214 root    /usr/lib/xen/bin/qemu-system-i386 -xen-domid 0 -xen-attach
-name dom0 -nographic -M xenpv -daemonize -monitor /dev/null
-serial/dev/nul -parallel/dev/null -pidfile/var/run/xen/qemu-dom0.pid

and the drivers loaded as a module:
# lsmod
Module                  Size  Used by    Tainted: G
xen_netback            65536  0
xen_blkback            49152  0

Xen and dom0 Image boot up successfully, at the end:
================================================
>xl list
Name                                        ID  Mem VCPUs State Time(s)
Domain-0                                    0  1024    2    r-----    4000.3

# uname -a
Linux rockpro64 5.15.33 #3 SMP PREEMPT Fri Apr 15 11:01:37 CEST 2022
aarch64 GNU/Linux
================================================

when I try to create a domU domain I have problem with disk backend, I have
made several attempts trying with different domU linux and I always get the
following error :

================================================
Parsing config from ./alpine_xen_domu.config

libxl: error: libxl_aoutils.c:539:async_exec_timeout: killing execution of
/etc/xen/scripts/block add because of timeout
libxl: error: libxl_create.c:1608:domcreate_launch_dm: Domain 2:unable to
add disk devices
libxl: error: libxl_aoutils.c:539:async_exec_timeout: killing execution of
/etc/xen/scripts/block remove because of timeout
libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
2:Non-existant domain
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 2:Unable
to destroy guest
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 2:Destruction
of domain failed
================================================

The last try was with alpine domU linux with the following config:
================================================

# Alpine Linux PV DomU
# Kernel paths for install
kernel = "/home/xen/vmlinuz-virt"
ramdisk = "/home/xen/initramfs-virt"
extra="modules=loop,squashfs console=hvc0"
# Path to HDD and iso file
disk = [ 'format=raw, vdev=xvda, access=w, target=/data/a1.img',
        'format=raw, vdev=xvdc, access=r, devtype=cdrom,
target=/home/xen/alpine-virt-3.15.3-armv7.iso'  ]
# Network configuration
vif = ['bridge=br0']
# DomU settings

memory = 512

name = "alpine-a1"

vcpus = 1

maxvcpus = 1
================================================

thanks a lot in advance
Best regards
Marco

--00000000000010498605dcaf43ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgYWxsLDxicj48YnI+SSYjMzk7bSBmYWNpbmcgYWx3YXlzIHRoZSBz
YW1lIHByb2JsZW0gKGRlc2NyaWJlZCBiZWxvdykgdHJ5aW5nIHRvIGNyZWF0ZSBhIFhlbiBndWVz
dCBkb21haW4gb24gcm9ja3BybzY0IChhcm02NCkuPGJyPjxicj5JIGhhdmUgc3VjY2Vzc2Z1bGx5
IGJ1aWx0IHVib290LCB4ZW4gKDQuMTQuNCkgYW5kIGRvbTAgbGludXgga2VybmVsIHdpdGggeGVu
IHRvb2wgc3RhY2ssIHRoZXNlIHR3byBsYXN0IHN0YXJ0aW5nIGZyb20gYnVpbGRyb290ICh3aXRo
IGxpbnV4IGtlcm5lbCB2ZXJzaW9uIDUuMTUuMzMgYW5kIHhlbiB0b29sc3RhY2sgdmVyc2lvbiA0
LjE0LjQpPGJyPjxicj5UaGVzZSBhcmUgdGhlIHByb2Nlc3Mgb2YgWGVuOjxicj48YnI+MTc3IHJv
b3QgwqAgwqAvdXNyL3NiaW4veGVud2F0Y2hkb2dkIDMwIDE1PGJyPjIwMyByb290IMKgIMKgL3Vz
ci9zYmluL3hlbnN0b3JlZCAtLXBpZC1maWxlIC92YXIvcnVuL3hlbi94ZW5zdG9yZWQucGlkPGJy
PjIwOCByb290IMKgIMKgL3Vzci9zYmluL3hlbmNvbnNvbGVkIC0tcGlkLWZpbGU9L3Zhci9ydW4v
eGVuL3hlbmNvbnNvbGVkLnBpZDxicj4yMTQgcm9vdCDCoCDCoC91c3IvbGliL3hlbi9iaW4vcWVt
dS1zeXN0ZW0taTM4NiAteGVuLWRvbWlkIDAgLXhlbi1hdHRhY2ggLW5hbWUgZG9tMCAtbm9ncmFw
aGljIC1NIHhlbnB2IC1kYWVtb25pemUgLW1vbml0b3IgL2Rldi9udWxsIC1zZXJpYWwvZGV2L251
bCAtcGFyYWxsZWwvZGV2L251bGwgLXBpZGZpbGUvdmFyL3J1bi94ZW4vcWVtdS1kb20wLnBpZDxi
cj48YnI+YW5kIHRoZSBkcml2ZXJzIGxvYWRlZCBhcyBhIG1vZHVsZTo8YnI+IyBsc21vZDxicj5N
b2R1bGUgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTaXplIMKgVXNlZCBieSDCoCDCoFRhaW50
ZWQ6IEc8YnI+eGVuX25ldGJhY2sgwqAgwqAgwqAgwqAgwqAgwqA2NTUzNiDCoDA8YnI+eGVuX2Js
a2JhY2sgwqAgwqAgwqAgwqAgwqAgwqA0OTE1MiDCoDA8YnI+PGJyPlhlbiBhbmQgZG9tMCBJbWFn
ZSBib290IHVwIHN1Y2Nlc3NmdWxseSwgYXQgdGhlIGVuZDo8YnI+PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PGJyPiZndDt4bCBsaXN0PGJyPk5hbWUgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBJ
RCDCoE1lbSBWQ1BVcyBTdGF0ZSBUaW1lKHMpPGJyPkRvbWFpbi0wIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMCDCoDEwMjQgwqAgwqAyIMKgIMKg
ci0tLS0tIMKgIMKgNDAwMC4zPGJyPjxicj4jIHVuYW1lIC1hPGJyPkxpbnV4IHJvY2twcm82NCA1
LjE1LjMzICMzIFNNUCBQUkVFTVBUIEZyaSBBcHIgMTUgMTE6MDE6MzcgQ0VTVCAyMDIyIGFhcmNo
NjQgR05VL0xpbnV4PGJyPj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PTxicj48YnI+d2hlbiBJIHRyeSB0byBjcmVhdGUgYSBkb21VIGRvbWFpbiBJIGhhdmUg
cHJvYmxlbSB3aXRoIGRpc2sgYmFja2VuZCwgSSBoYXZlIG1hZGUgc2V2ZXJhbCBhdHRlbXB0cyB0
cnlpbmcgd2l0aCBkaWZmZXJlbnQgZG9tVSBsaW51eCBhbmQgSSBhbHdheXMgZ2V0IHRoZSBmb2xs
b3dpbmcgZXJyb3IgOjxicj48YnI+PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PGJyPlBhcnNpbmcgY29uZmlnIGZyb20gLi9hbHBpbmVfeGVuX2RvbXUuY29u
ZmlnPGJyPjxicj5saWJ4bDogZXJyb3I6IGxpYnhsX2FvdXRpbHMuYzo1Mzk6YXN5bmNfZXhlY190
aW1lb3V0OiBraWxsaW5nIGV4ZWN1dGlvbiBvZiAvZXRjL3hlbi9zY3JpcHRzL2Jsb2NrIGFkZCBi
ZWNhdXNlIG9mIHRpbWVvdXQ8YnI+bGlieGw6IGVycm9yOiBsaWJ4bF9jcmVhdGUuYzoxNjA4OmRv
bWNyZWF0ZV9sYXVuY2hfZG06IERvbWFpbiAyOnVuYWJsZSB0byBhZGQgZGlzayBkZXZpY2VzPGJy
PmxpYnhsOiBlcnJvcjogbGlieGxfYW91dGlscy5jOjUzOTphc3luY19leGVjX3RpbWVvdXQ6IGtp
bGxpbmcgZXhlY3V0aW9uIG9mIC9ldGMveGVuL3NjcmlwdHMvYmxvY2sgcmVtb3ZlIGJlY2F1c2Ug
b2YgdGltZW91dDxicj5saWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjExODI6bGlieGxfX2Rl
c3Ryb3lfZG9taWQ6IERvbWFpbiAyOk5vbi1leGlzdGFudCBkb21haW48YnI+bGlieGw6IGVycm9y
OiBsaWJ4bF9kb21haW4uYzoxMTM2OmRvbWFpbl9kZXN0cm95X2NhbGxiYWNrOiBEb21haW4gMjpV
bmFibGUgdG8gZGVzdHJveSBndWVzdDxicj5saWJ4bDogZXJyb3I6IGxpYnhsX2RvbWFpbi5jOjEw
NjM6ZG9tYWluX2Rlc3Ryb3lfY2I6IERvbWFpbiAyOkRlc3RydWN0aW9uIG9mIGRvbWFpbiBmYWls
ZWQ8YnI+PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PGJy
Pjxicj5UaGUgbGFzdCB0cnkgd2FzIHdpdGggYWxwaW5lIGRvbVUgbGludXggd2l0aCB0aGUgZm9s
bG93aW5nIGNvbmZpZzo8YnI+PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PGJyPjxicj4jIEFscGluZSBMaW51eCBQViBEb21VPGJyPiMgS2VybmVsIHBhdGhz
IGZvciBpbnN0YWxsPGJyPmtlcm5lbCA9ICZxdW90Oy9ob21lL3hlbi92bWxpbnV6LXZpcnQmcXVv
dDs8YnI+cmFtZGlzayA9ICZxdW90Oy9ob21lL3hlbi9pbml0cmFtZnMtdmlydCZxdW90Ozxicj5l
eHRyYT0mcXVvdDttb2R1bGVzPWxvb3Asc3F1YXNoZnMgY29uc29sZT1odmMwJnF1b3Q7PGJyPiMg
UGF0aCB0byBIREQgYW5kIGlzbyBmaWxlPGJyPmRpc2sgPSBbICYjMzk7Zm9ybWF0PXJhdywgdmRl
dj14dmRhLCBhY2Nlc3M9dywgdGFyZ2V0PS9kYXRhL2ExLmltZyYjMzk7LDxicj7CoCDCoCDCoCDC
oCAmIzM5O2Zvcm1hdD1yYXcsIHZkZXY9eHZkYywgYWNjZXNzPXIsIGRldnR5cGU9Y2Ryb20sIHRh
cmdldD0vaG9tZS94ZW4vYWxwaW5lLXZpcnQtMy4xNS4zLWFybXY3LmlzbyYjMzk7IMKgXTxicj4j
IE5ldHdvcmsgY29uZmlndXJhdGlvbiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj52aWYgPSBbJiMzOTticmlkZ2U9YnIwJiMzOTtd
PGJyPiMgRG9tVSBzZXR0aW5ncyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxi
cj5tZW1vcnkgPSA1MTIgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8
YnI+bmFtZSA9ICZxdW90O2FscGluZS1hMSZxdW90OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoDxicj52Y3B1cyA9IDEgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqA8YnI+bWF4dmNwdXMgPSAxPGJyPj09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PTxicj48YnI+dGhhbmtzIGEgbG90IGluIGFkdmFuY2U8YnI+QmVz
dCByZWdhcmRzPGZvbnQgY29sb3I9IiM4ODg4ODgiPjxicj5NYXJjbzwvZm9udD48YnI+PC9kaXY+
DQo=
--00000000000010498605dcaf43ab--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971181B43F
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 12:44:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ8On-0005Fb-S2; Mon, 13 May 2019 10:41:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQ8Om-0005FW-UF
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:41:36 +0000
X-Inumbo-ID: ae5e054a-756b-11e9-895c-03eacf7663b8
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ae5e054a-756b-11e9-895c-03eacf7663b8;
 Mon, 13 May 2019 10:41:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2083374;
 Mon, 13 May 2019 03:41:35 -0700 (PDT)
Received: from [10.37.12.148] (unknown [10.37.12.148])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 298653F703;
 Mon, 13 May 2019 03:41:33 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
 <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
 <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
 <20190503134133.GC5900@zion.uk.xensource.com>
 <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
 <20190503141952.GD5900@zion.uk.xensource.com>
 <CAOcoXZZau01-5Tmab9eCcYKJavzrT_9KdNa_dR+QN5zKmmXMoA@mail.gmail.com>
 <4fb5058d-9810-7a1b-91f4-db31bad82a85@arm.com>
 <CAOcoXZbDdX3rXL+nzEwUCT47UUbCDqJPZ7SP-dYn9SYdkm=isg@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3da722b8-54fb-ebe0-3469-6e0ef80346f8@arm.com>
Date: Mon, 13 May 2019 11:41:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOcoXZbDdX3rXL+nzEwUCT47UUbCDqJPZ7SP-dYn9SYdkm=isg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Andrii_Anisov@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA1LzEzLzE5IDExOjI5IEFNLCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4+PiBhYXJjaDY0LXBv
a3ktbGludXgtZ2NjICAgLURCVUlMRF9JRCAtZm5vLXN0cmljdC1hbGlhc2luZyAtc3RkPWdudTk5
Cj4+PiAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVzIC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVt
ZW50Cj4+PiAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1Xbm8tdW51c2VkLWxvY2FsLXR5
cGVkZWZzICAgLU8yCj4+PiAtZm9taXQtZnJhbWUtcG9pbnRlcgo+Pj4gLURfX1hFTl9JTlRFUkZB
Q0VfVkVSU0lPTl9fPV9fWEVOX0xBVEVTVF9JTlRFUkZBQ0VfVkVSU0lPTl9fIC1NTUQgLU1GCj4+
PiAuaGFuZGxlcmVnLm8uZCAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJD
RSAgIC1XZXJyb3IKPj4+IC1XbWlzc2luZy1wcm90b3R5cGVzIC1JLi9pbmNsdWRlCj4+PiAtSS9o
b21lL2Mvdy9yY2FyX2gzX3VidW50dTE2MDRfeW9jdG8vYnVpbGQvdG1wL3dvcmsvYWFyY2g2NC1w
b2t5LWxpbnV4L3hlbi80LjEyLjAuMCtnaXRBVVRPSU5DK2ZkMmEzNGM5NjUtcjAvZ2l0L3Rvb2xz
L2xpYnMvdG9vbGNvcmUvLi4vLi4vLi4vdG9vbHMvaW5jbHVkZQo+Pj4gICAgLWMgLW8gaGFuZGxl
cmVnLm8gaGFuZGxlcmVnLmMKPj4KPj4gLi4uIHRoaXMgbG9va3MgbGlrZSBhIHRvb2wgYnVpbGRp
bmcgZXJyb3Igd2hlbiBJIG9ubHkgdG91Y2ggdGhlCj4+IGh5cGVydmlzb3IgcGFydC4gQXJlIHlv
dSBjZXJ0YWluIHRoaXMgaXMgbXkgcGF0Y2ggYW5kIG5vdCBhbm90aGVyIGVycm9yCj4+IGluIFhl
biA0LjEyIChvciBhbnkgcGF0Y2ggeW91IGhhdmUgb24gdG9wKT8KPiAKPiBKdWxpZW4sIHlvdSBh
cmUgcmlnaHQsIGl0IHdhcyBsb2NhbCBlbnZpcm9ubWVudCBidWlsZCBpc3N1ZSAoc29ycnkgZm9y
IHRoYXQpLgo+IFhlbiBHQ0MgY292ZXJhZ2UgZmVhdHVyZSB3b3JrcyB3ZWxsIHdpdGggQWFyY2g2
NCB3aXRoIHRoaXMgcGF0Y2guCj4gQ2hlY2tlZCBib3RoIGNvbW1hbmRzLCB4ZW5jb3YgcmVhZCBh
bmQgeGVuY292IHJlc2V0IC0gYm90aCB3b3JrIHdlbGwKPiAobm8gY3Jhc2hlcyBhbnltb3JlKS4K
PiAKPiBQbGVhc2UgYWxzbyBub3RlIHRoYXQgdXNlIGNhc2UgbWVudGlvbmVkIGluIFhlbiBkb2N1
bWVudGF0aW9uCj4gKHhlbmNvdl9zcGxpdCkgaXMgYWxzbyBvayB3aXRoIGdlbmVyYXRlZCBjb3Zl
cmFnZS5kYXQgaW5wdXQ6Cj4geGVuLmdpdC94ZW4kIHNzaCByb290QGhvc3QgeGVuY292IHJlYWQg
PiBjb3ZlcmFnZS5kYXQKPiB4ZW4uZ2l0L3hlbiQgLi4vdG9vbHMveGVuY292X3NwbGl0IGNvdmVy
YWdlLmRhdCAtLW91dHB1dC1kaXI9Lwo+IHhlbi5naXQveGVuJCBnZW5pbmZvIC4gLW8gY292Lmlu
Zm8KPiB4ZW4uZ2l0L3hlbiQgZ2VuaHRtbCBjb3YuaW5mbyAtbyBjb3YvCj4geGVuLmdpdC94ZW4k
ICRCUk9XU0VSIGNvdi9pbmRleC5odG1sCj4gCj4gLS0tLS0tLS0KPiBNaW5vciBvYnNlcnZhdGlv
biBhYm91dCBjb3ZlcmFnZSBidWlsZCBwcm9jZWR1cmUuIERvY3VtZW50YXRpb24gc3RhdGVzOgo+
ICJUbyBidWlsZCB3aXRoIGNvdmVyYWdlIHN1cHBvcnQsIGVuYWJsZSBDT05GSUdfQ09WRVJBR0Ug
aW4gS2NvbmZpZy4iCj4gSG93ZXZlciwgdG8gYnVpbGQgaXQgcHJvcGVybHksIGl0IG5lZWRzIHRv
IGVuYWJsZSBjb3ZlcmFnZSBmZWF0dXJlIGluCj4gdHdvIHBsYWNlcyAtIG1haW4geGVuIG1ha2Ug
Y29tbWFuZCBsaW5lIGFuZCBoeXBlcnZpc29yIC5jb25maWcgZmlsZS4KPiBJcyBpdCBleHBlY3Rl
ZCB3YXkgdG8gYnVpbGQgeGVuIHdpdGggY292ZXJhZ2UgZmVhdHVyZT8gSWYgeWVzLAo+IHByb2Jh
Ymx5IHdlIHNob3VsZCBpbXByb3ZlIChvciBhdCBsZWFzdCBkb2N1bWVudCkgaXQgc29tZSBkYXku
Li4KCldoYXQgaXMgcmVxdWlyZSBvbiB0aGUgbWFrZSBjb21tYW5kIGxpbmU/CgpBcyB1c3VhbCwg
cGF0Y2hlcyBhcmUgd2VsY29tZWQgOykuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

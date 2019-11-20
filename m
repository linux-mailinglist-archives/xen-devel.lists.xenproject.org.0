Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB9B1035A4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 08:53:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXKkf-0008Rt-7T; Wed, 20 Nov 2019 07:50:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXKkd-0008Ro-OJ
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 07:50:11 +0000
X-Inumbo-ID: 5fb3fc02-0b6a-11ea-a30a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fb3fc02-0b6a-11ea-a30a-12813bfff9fa;
 Wed, 20 Nov 2019 07:50:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4ADCCB33E;
 Wed, 20 Nov 2019 07:50:08 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191119165809.GE1425@perard.uk.xensource.com>
 <20191119175855.1716278-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b28ae29d-74d5-757d-b78a-ade4bba5dfb6@suse.com>
Date: Wed, 20 Nov 2019 08:50:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191119175855.1716278-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH] xen/arch/x86/Makefile: Remove $(guard)
 use from $(TARGET).efi target
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAxODo1OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gRm9sbG93aW5nIHRo
ZSBwYXRjaCA2NWQxMDQ5ODRjMDQgKCJ4ODY6IGZpeCByYWNlIHRvIGJ1aWxkCj4gYXJjaC94ODYv
ZWZpL3JlbG9jcy1kdW1teS5vIiksIHRoZSBlcnJvciBtZXNzYWdlCj4gICBubTogJ2VmaS9yZWxv
Y3MtZHVtbXkubyc6IE5vIHN1Y2ggZmlsZSIKPiBzdGFydGVkIHRvIGFwcGVhciBvbiBzeXN0ZW0g
d2hpY2ggY2FuJ3QgYnVpbGQgdGhlIC5lZmkgdGFyZ2V0LiBUaGlzIGlzCj4gYmVjYXVzZSByZWxv
Y3MtZHVtbXkubyBpc24ndCBidWlsdCBhbnltb3JlLgo+IFRoZSBlcnJvciBpcyBwcmludGVkIGJ5
IHRoZSBldmFsdWF0aW9uIG9mIFZJUlRfQkFTRSBhbmQgQUxUX0JBU0Ugd2hpY2gKPiBhcmVuJ3Qg
dXNlIGFueXdheS4KPiAKPiBCdXQsIHdlIGRvbid0IG5lZWQgdGhhdCBmaWxlIGFzIHdlIGRvbid0
IHdhbnQgdG8gYnVpbGQgYCQoVEFSR0VUKS5lZmknCj4gYW55d2F5LiAgT24gc3VjaCBzeXN0ZW0s
ICQoZ3VhcmQpIGV2YWx1YXRlIHRvIHRoZSBzaGVsbCBidWlsdGluICc6JywKPiB3aGljaCBwcmV2
ZW50IGFueSBvZiB0aGUgc2hlbGwgY29tbWFuZHMgaW4gYCQoVEFSR0VUKS5lZmknIGZyb20gYmVl
bgo+IGV4ZWN1dGVkLgo+IAo+IEV2ZW4gaWYgJChndWFyZCkgaXMgZXZhbHVhdGVkIG9wb24gdXNl
LCBpdCBkZXBlbmRzIG9uICQoWEVOX0JVSUxEX1BFKQo+IHdoaWNoIGlzIGV2YWx1YXRlZCBhdCB0
aGUgYXNzaWdubWVudC4gU28sIHdlIGNhbiByZXBsYWNlICQoZ3VhcmQpIGluCj4gJChUQVJHRVQp
LmVmaSBieSBoYXZpbmcgdHdvIGRpZmZlcmVudCBydWxlcyBkZXBlbmRpbmcgb24KPiAkKFhFTl9C
VUlMRF9QRSkgaW5zdGVhZC4KPiAKPiBUaGUgY2hhbmdlIHdpdGggdGhpcyBwYXRjaCBpcyB0aGF0
IG5vbmUgb2YgdGhlIGRlcGVuZGVuY3kgb2YKPiAkKFRBUkdFVCkuZWZpIHdpbGwgYmUgYnVpbHQg
aWYgdGhlIGxpbmtlciBkb2Vzbid0IHN1cHBvcnQgUEUKPiBhbmQgVklSVF9CQVNFIGFuZCBBTFRf
QkFTRSBkb24ndCBnZXQgZXZhbHVhdGVkIGFueW1vcmUsIHNvIG5tIHdpbGwgbm90Cj4gY29tcGxh
aW4gYWJvdXQgdGhlIG1pc3NpbmcgcmVsb2NzLWR1bW15Lm8gZmlsZSBhbnltb3JlLgo+IAo+IFNp
bmNlIHByZWxpbmstZWZpLm8gaXNuJ3QgYnVpbHQgb24gc3lzdGVtIHRoYXQgY2FuJ3QgYnVpbGQK
PiAkKFRBUkdFVCkuZWZpIGFueW1vcmUsIHdlIGNhbiByZW1vdmUgdGhlICQoZ3VhcmQpIHZhcmlh
YmxlIGV2ZXJ5d2hlcmUuCgpBbmQgaW5kZWVkIHRoZSBuZWVkIGZvciBpdCBoYWQgZGlzYXBwZWFy
ZWQgd2l0aCAxOGNkNDk5N2QyICgieDg2L2VmaToKbW92ZSB0aGUgbG9naWMgdG8gZGV0ZWN0IFBF
IGJ1aWxkIHN1cHBvcnQiKS4KCj4gUmVwb3J0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpBbHNvIENjLWluZyBKw7xyZ2VuLCBhcyB0aGlzIGFkZHJlc3NlcyBhIChjb3NtZXRpYykgcmVn
cmVzc2lvbiBmcm9tCjY1ZDEwNDk4NGMgKCJ4ODY6IGZpeCByYWNlIHRvIGJ1aWxkIGFyY2gveDg2
L2VmaS9yZWxvY3MtZHVtbXkubyIpLgoKPiBAQCAtMTc4LDggKzE3OCw2IEBAIENGTEFHUy0kKFhF
Tl9CVUlMRF9FRkkpICs9IC1EWEVOX0JVSUxEX0VGSQo+ICAKPiAgJChUQVJHRVQpLmVmaTogVklS
VF9CQVNFID0gMHgkKHNoZWxsICQoTk0pIGVmaS9yZWxvY3MtZHVtbXkubyB8IHNlZCAtbiAncywg
QSBWSVJUX1NUQVJUJCQsLHAnKQo+ICAkKFRBUkdFVCkuZWZpOiBBTFRfQkFTRSA9IDB4JChzaGVs
bCAkKE5NKSBlZmkvcmVsb2NzLWR1bW15Lm8gfCBzZWQgLW4gJ3MsIEEgQUxUX1NUQVJUJCQsLHAn
KQo+IC0jIERvbid0IHVzZSAkKHdpbGRjYXJkIC4uLikgaGVyZSAtIGF0IGxlYXN0IG1ha2UgMy44
MCBleHBhbmRzIHRoaXMgdG9vIGVhcmx5IQo+IC0kKFRBUkdFVCkuZWZpOiBndWFyZCA9ICQoaWYg
JChmaWx0ZXIgeSwkKFhFTl9CVUlMRF9QRSkpLCw6KQoKSXQgaXMgcGFydGljdWxhcmx5IHRlbGxp
bmcgdGhhdCB0aGUgY29tbWVudCBoZXJlIGhhZCBiZWVuIHN0YWxlCmFzIG9mIHRoYXQgZWFybGll
ciBjaGFuZ2UgZnJvbSBSb2dlciwgYXMgdGhlIChzaGVsbCBsZXZlbCkKd2lsZGNhcmQgdXNlIHdh
cyB0aGUgd2hvbGUgcmVhc29uIGZvciBuZWVkaW5nICQoZ3VhcmQpIGhlcmUuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

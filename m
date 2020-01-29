Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2294714CE17
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 17:16:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwpzM-0000X3-Pm; Wed, 29 Jan 2020 16:14:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c1nS=3S=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1iwpzL-0000Wy-Gc
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 16:14:47 +0000
X-Inumbo-ID: 776c5cc0-42b2-11ea-ad98-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 776c5cc0-42b2-11ea-ad98-bc764e2007e4;
 Wed, 29 Jan 2020 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580314486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f779P0wnKaXYjI5mJU6xjU03x1vHo0GQfrDE1o6lQnQ=;
 b=KBGINyr7MeST/8ZXs84sB8Tkl3orkMeVLVyxviLEsnDFZ36Nl7p7wBTmgkG2XubLmjiybJ
 Vk4sOsjTxjzFdkyfCae1qMjnjYvTd0n626inzUw58KRXYHA8Day7LXtNop9i5Zb7zccJrR
 eEWc0A0GTXAJ3CYv+iag2+k9yMMoevo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-sB1C5B1TMXCaV9nrbBDviQ-1; Wed, 29 Jan 2020 11:14:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6098D800D4C;
 Wed, 29 Jan 2020 16:14:40 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-32.ams2.redhat.com
 [10.36.116.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 406175D9C5;
 Wed, 29 Jan 2020 16:14:36 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-4-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <edaa36a9-e4a0-8255-67b5-ebe51fae87ce@redhat.com>
Date: Wed, 29 Jan 2020 17:14:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200129121235.1814563-4-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: sB1C5B1TMXCaV9nrbBDviQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH 3/5] OvmfPkg/IndustryStandard/Xen: Apply
 EDK2 coding style to XEN_VCPU_TIME_INFO
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
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Liming Gao <liming.gao@intel.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMjkvMjAgMTM6MTIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdlIGFyZSBnb2luZyB0
byB1c2UgbmV3IGZpZWxkcyBmcm9tIHRoZSBYZW4gaGVhZGVycy4gQXBwbHkgdGhlIEVESzIKPiBj
b2Rpbmcgc3R5bGUgc28gdGhhdCB0aGUgY29kZSB0aGF0IGlzIGdvaW5nIHRvIHVzZSBpdCBkb2Vz
bid0IGxvb2sgb3V0Cj4gb2YgcGxhY2UuCj4gCj4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5v
Y29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTI0OTAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3ZtZlBrZy9JbmNsdWRl
L0luZHVzdHJ5U3RhbmRhcmQvWGVuL3hlbi5oIHwgMTcgKysrKysrKysrLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKClRoaXMgaXMgaGln
aGx5IGFwcHJlY2lhdGVkLiBDb21tZW50cyBiZWxvdzoKCj4gCj4gZGlmZiAtLWdpdCBhL092bWZQ
a2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi94ZW4uaCBiL092bWZQa2cvSW5jbHVkZS9J
bmR1c3RyeVN0YW5kYXJkL1hlbi94ZW4uaAo+IGluZGV4IGU1NWQ5MzI2MzI4NS4uYWM5MTU1MDg5
OTAyIDEwMDY0NAo+IC0tLSBhL092bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi94
ZW4uaAo+ICsrKyBiL092bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi94ZW4uaAo+
IEBAIC0xODMsMTAgKzE4MywxMCBAQCBzdHJ1Y3QgdmNwdV90aW1lX2luZm8gewo+ICAgICAgICog
VGhlIGNvcnJlY3Qgd2F5IHRvIGludGVyYWN0IHdpdGggdGhlIHZlcnNpb24gbnVtYmVyIGlzIHNp
bWlsYXIgdG8KPiAgICAgICAqIExpbnV4J3Mgc2VxbG9jazogc2VlIHRoZSBpbXBsZW1lbnRhdGlv
bnMgb2YgcmVhZF9zZXFiZWdpbi9yZWFkX3NlcXJldHJ5Lgo+ICAgICAgICovCj4gLSAgICBVSU5U
MzIgdmVyc2lvbjsKPiArICAgIFVJTlQzMiBWZXJzaW9uOwo+ICAgICAgVUlOVDMyIHBhZDA7Cj4g
LSAgICBVSU5UNjQgdHNjX3RpbWVzdGFtcDsgICAvKiBUU0MgYXQgbGFzdCB1cGRhdGUgb2YgdGlt
ZSB2YWxzLiAgKi8KPiAtICAgIFVJTlQ2NCBzeXN0ZW1fdGltZTsgICAgIC8qIFRpbWUsIGluIG5h
bm9zZWNzLCBzaW5jZSBib290LiAgICAqLwo+ICsgICAgVUlOVDY0IFRTQ1RpbWVzdGFtcDsgICAv
KiBUU0MgYXQgbGFzdCB1cGRhdGUgb2YgdGltZSB2YWxzLiAgKi8KCigxKSBTaG91bGQgYmUgIlRz
Y1RpbWVzdGFtcCIuIEFjcm9ueW1zIGFyZSBkZS1jYXBpdGFsaXplZCB3aGVuIGNvbXBvc2VkCmlu
dG8gbG9uZ2VyIGlkZW50aWZpZXJzLCB0byBtYWludGFpbiBhIGNvbnNpc3RlbnQgQ2FtZWxDYXNl
LgoKPiArICAgIFVJTlQ2NCBTeXN0ZW1UaW1lOyAgICAgLyogVGltZSwgaW4gbmFub3NlY3MsIHNp
bmNlIGJvb3QuICAgICovCj4gICAgICAvKgo+ICAgICAgICogQ3VycmVudCBzeXN0ZW0gdGltZToK
PiAgICAgICAqICAgc3lzdGVtX3RpbWUgKwo+IEBAIC0xOTQsMTEgKzE5NCwxMSBAQCBzdHJ1Y3Qg
dmNwdV90aW1lX2luZm8gewo+ICAgICAgICogQ1BVIGZyZXF1ZW5jeSAoSHopOgo+ICAgICAgICog
ICAoKDEwXjkgPDwgMzIpIC8gdHNjX3RvX3N5c3RlbV9tdWwpID4+IHRzY19zaGlmdAo+ICAgICAg
ICovCj4gLSAgICBVSU5UMzIgdHNjX3RvX3N5c3RlbV9tdWw7Cj4gLSAgICBJTlQ4ICAgdHNjX3No
aWZ0Owo+ICsgICAgVUlOVDMyIFRTQ1RvU3lzdGVtTXVsdGlwbGllcjsKPiArICAgIElOVDggICBU
U0NTaGlmdDsKCigyKSBEaXR0byAoYm90aCBmaWVsZHMpLgoKPiAgICAgIElOVDggICBwYWQxWzNd
Owo+ICB9OyAvKiAzMiBieXRlcyAqLwo+IC10eXBlZGVmIHN0cnVjdCB2Y3B1X3RpbWVfaW5mbyB2
Y3B1X3RpbWVfaW5mb190Owo+ICt0eXBlZGVmIHN0cnVjdCB2Y3B1X3RpbWVfaW5mbyBYRU5fVkNQ
VV9USU1FX0lORk87Cj4gIAo+ICBzdHJ1Y3QgdmNwdV9pbmZvIHsKPiAgICAgIC8qCj4gQEAgLTIz
NCw3ICsyMzQsNyBAQCBzdHJ1Y3QgdmNwdV9pbmZvIHsKPiAgI2VuZGlmIC8qIFhFTl9IQVZFX1BW
X1VQQ0FMTF9NQVNLICovCj4gICAgICB4ZW5fdWxvbmdfdCBldnRjaG5fcGVuZGluZ19zZWw7Cj4g
ICAgICBzdHJ1Y3QgYXJjaF92Y3B1X2luZm8gYXJjaDsKPiAtICAgIHN0cnVjdCB2Y3B1X3RpbWVf
aW5mbyB0aW1lOwo+ICsgICAgc3RydWN0IHZjcHVfdGltZV9pbmZvIFRpbWU7Cj4gIH07IC8qIDY0
IGJ5dGVzICh4ODYpICovCj4gICNpZm5kZWYgX19YRU5fXwo+ICB0eXBlZGVmIHN0cnVjdCB2Y3B1
X2luZm8gdmNwdV9pbmZvX3Q7Cj4gQEAgLTI1MCw3ICsyNTAsNyBAQCB0eXBlZGVmIHN0cnVjdCB2
Y3B1X2luZm8gdmNwdV9pbmZvX3Q7Cj4gICAqIG9mIHRoaXMgc3RydWN0dXJlIHJlbWFpbmluZyBj
b25zdGFudC4KPiAgICovCj4gIHN0cnVjdCBzaGFyZWRfaW5mbyB7Cj4gLSAgICBzdHJ1Y3QgdmNw
dV9pbmZvIHZjcHVfaW5mb1tYRU5fTEVHQUNZX01BWF9WQ1BVU107Cj4gKyAgICBzdHJ1Y3QgdmNw
dV9pbmZvIFZjcHVJbmZvW1hFTl9MRUdBQ1lfTUFYX1ZDUFVTXTsKClllcywgdGhpcyBpcyBhIGdv
b2QgZXhhbXBsZS4gIlZjcHUiIGFuZCBub3QgIlZDUFUiIG9yICJWQ3B1Ii4KCj4gIAo+ICAgICAg
LyoKPiAgICAgICAqIEEgZG9tYWluIGNhbiBjcmVhdGUgImV2ZW50IGNoYW5uZWxzIiBvbiB3aGlj
aCBpdCBjYW4gc2VuZCBhbmQgcmVjZWl2ZQo+IEBAIC0yOTksNiArMjk5LDcgQEAgc3RydWN0IHNo
YXJlZF9pbmZvIHsKPiAgfTsKPiAgI2lmbmRlZiBfX1hFTl9fCj4gIHR5cGVkZWYgc3RydWN0IHNo
YXJlZF9pbmZvIHNoYXJlZF9pbmZvX3Q7Cj4gK3R5cGVkZWYgc3RydWN0IHNoYXJlZF9pbmZvIFhF
Tl9TSEFSRURfSU5GTzsKPiAgI2VuZGlmCj4gIAo+ICAvKiBUdXJuIGEgcGxhaW4gbnVtYmVyIGlu
dG8gYSBDIFVJTlROIGNvbnN0YW50LiAqLwo+IAoKQXNzdW1pbmcgdGhlIE9WTUYgcGxhdGZvcm1z
IGNvbnRpbnVlIHRvIGJ1aWxkIGF0IHRoaXMgc3RhZ2UgaW50byB0aGUKc2VyaWVzLCBhbmQgcHJv
dmlkZWQgdGhhdCAoMSkgYW5kICgyKSBhcmUgZml4ZWQ6CgpSZXZpZXdlZC1ieTogTGFzemxvIEVy
c2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D8DCB40B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 06:55:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGFaW-0005I6-Az; Fri, 04 Oct 2019 04:53:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGFaU-0005Hv-I3
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 04:53:06 +0000
X-Inumbo-ID: da335338-e662-11e9-973e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da335338-e662-11e9-973e-12813bfff9fa;
 Fri, 04 Oct 2019 04:53:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 045BEAFC3;
 Fri,  4 Oct 2019 04:53:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191003205623.20839-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4231baf5-7a0b-b06c-9e4c-377636b5c1c9@suse.com>
Date: Fri, 4 Oct 2019 06:53:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003205623.20839-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 0/4] docs/sphinx
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 StefanoStabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Rich Persaud <persaur@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTAuMTkgMjI6NTYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVmFyaW91cyBwaWVjZXMg
b2YgU3BoaW54IGRvY3VtZW50YXRpb24gaW1wcm92ZW1lbnRzIGludGVuZGVkIGZvciBpbmNsdXNp
b24KPiBpbnRvIFhlbiA0LjEzLiAgUmVuZGVyZWQgcmVzdWx0cyBjYW4gYmUgdmlld2VkIGF0Cj4g
Cj4gICAgaHR0cHM6Ly9hbmRyZXdjb29wLXhlbi5yZWFkdGhlZG9jcy5pby9lbi9kb2NzLWRldmVs
L2luZGV4Lmh0bWwKPiAKPiB3aXRoCj4gCj4gICAgaHR0cHM6Ly9hbmRyZXdjb29wLXhlbi5yZWFk
dGhlZG9jcy5pby9lbi9kb2NzLWRldmVsL2FkbWluLWd1aWRlL2ludHJvZHVjdGlvbi5odG1sCj4g
ICAgaHR0cHM6Ly9hbmRyZXdjb29wLXhlbi5yZWFkdGhlZG9jcy5pby9lbi9kb2NzLWRldmVsL2ds
b3NzYXJ5Lmh0bWwKPiAgICBodHRwczovL2FuZHJld2Nvb3AteGVuLnJlYWR0aGVkb2NzLmlvL2Vu
L2RvY3MtZGV2ZWwvbWlzYy90ZWNoLWRlYnQuaHRtbAo+IAo+IGJlaW5nIHRoZSBub3RhYmxlIGFk
ZGl0aW9ucyBmcm9tIHRoaXMgc2VyaWVzLgo+IAo+IEFuZHJldyBDb29wZXIgKDQpOgo+ICAgIGRv
Y3Mvc3BoaW54OiBMaWNlbnNlIGNvbnRlbnQgd2l0aCBDQy1CWS00LjAKPiAgICBkb2NzL3NwaGlu
eDogSW5kZW50IGNsZWFudXAKPiAgICBkb2NzL3NwaGlueDogSW50cm9kdWN0aW9uCj4gICAgZG9j
cy9zcGhpbng6IFRlY2huaWNhbCBEZWJ0Cj4gCj4gICBDT1BZSU5HICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAzICsKPiAgIGRvY3MvUkVBRE1FLnNvdXJjZSAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMzIgKysrKysrKysKPiAgIGRvY3MvYWRtaW4tZ3VpZGUvaW5kZXgucnN0
ICAgICAgICAgICAgICAgfCAgIDUgKy0KPiAgIGRvY3MvYWRtaW4tZ3VpZGUvaW50cm9kdWN0aW9u
LnJzdCAgICAgICAgfCAgNDAgKysrKysrKysrKwo+ICAgZG9jcy9hZG1pbi1ndWlkZS9taWNyb2Nv
ZGUtbG9hZGluZy5yc3QgICB8ICAgMiArCj4gICBkb2NzL2FkbWluLWd1aWRlL3hlbi1vdmVydmll
dy5kcmF3aW8uc3ZnIHwgIDk3ICsrKysrKysrKysrKysrKysrKysrKysrCj4gICBkb2NzL2NvbmYu
cHkgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEyICsrLQo+ICAgZG9jcy9nbG9zc2Fy
eS5yc3QgICAgICAgICAgICAgICAgICAgICAgICB8ICA1MiArKysrKysrKysrKysrCj4gICBkb2Nz
L2d1ZXN0LWd1aWRlL2luZGV4LnJzdCAgICAgICAgICAgICAgIHwgICA2ICstCj4gICBkb2NzL2d1
ZXN0LWd1aWRlL3g4Ni9oeXBlcmNhbGwtYWJpLnJzdCAgIHwgIDUyICsrKysrKystLS0tLS0KPiAg
IGRvY3MvZ3Vlc3QtZ3VpZGUveDg2L2luZGV4LnJzdCAgICAgICAgICAgfCAgIDYgKy0KPiAgIGRv
Y3MvaHlwZXJ2aXNvci1ndWlkZS9jb2RlLWNvdmVyYWdlLnJzdCAgfCAgIDYgKy0KPiAgIGRvY3Mv
aHlwZXJ2aXNvci1ndWlkZS9pbmRleC5yc3QgICAgICAgICAgfCAgIDYgKy0KPiAgIGRvY3MvaW5k
ZXgucnN0ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzggKysrKysrKy0tCj4gICBkb2Nz
L21pc2MvdGVjaC1kZWJ0LnJzdCAgICAgICAgICAgICAgICAgIHwgMTMwICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgIDE1IGZpbGVzIGNoYW5nZWQsIDQ0NCBpbnNlcnRpb25zKCsp
LCA0MyBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL1JFQURNRS5zb3Vy
Y2UKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2FkbWluLWd1aWRlL2ludHJvZHVjdGlvbi5y
c3QKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2FkbWluLWd1aWRlL3hlbi1vdmVydmlldy5k
cmF3aW8uc3ZnCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9nbG9zc2FyeS5yc3QKPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL21pc2MvdGVjaC1kZWJ0LnJzdAo+IAoKRm9yIHRoZSBzZXJp
ZXM6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

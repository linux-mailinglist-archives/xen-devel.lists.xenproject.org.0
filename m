Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2517CD12DA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 17:34:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIDuu-0006AU-BK; Wed, 09 Oct 2019 15:30:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8w+b=YC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIDus-0006AP-9j
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 15:30:18 +0000
X-Inumbo-ID: b22c14ba-eaa9-11e9-97f1-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b22c14ba-eaa9-11e9-97f1-12813bfff9fa;
 Wed, 09 Oct 2019 15:30:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D978F337;
 Wed,  9 Oct 2019 08:30:16 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06C943F6C4;
 Wed,  9 Oct 2019 08:30:15 -0700 (PDT)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191004004745.26522-1-stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <39153cd6-efe5-1b5d-baba-b567c151a5f3@arm.com>
Date: Wed, 9 Oct 2019 16:30:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004004745.26522-1-stewart.hildebrand@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: platform: fix Raspberry Pi
 compatible string
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3Rld2FydCwKClNvcnJ5IGZvciB0aGUgZGVsYXkgaW4gYW5zd2VyLgoKT24gMDQvMTAvMjAx
OSAwMTo0NywgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+IEJvdGggdXBzdHJlYW0gWzFdIGFu
ZCBkb3duc3RyZWFtIFsyXSBMaW51eCBrZXJuZWxzIHVzZSAiYnJjbSxiY20yNzExIgo+IGFzIHRo
ZSBjb21wYXRpYmxlIHN0cmluZyBmb3IgUmFzcGJlcnJ5IFBpIDQuIEFkZCB0aGlzIHN0cmluZyB0
byBvdXIKPiBwbGF0Zm9ybSBjb21wYXRpYmxlIGxpc3QuCgpEaWQgdGhlIFJQSSBmb3VuZGF0aW9u
IHJlbGVhc2VkIGFueSBrZXJuZWwgd2l0aCB0aGUgb2xkIGJpbmRpbmc/CgpJZiBzbywgSSBhbSBv
ayBpZiB3ZSBkb24ndCBzdXBwb3J0IHRoZSBjb21wYXRpYmxlIGluIFhlbiAod2UgZG9uJ3QgaGF2
ZSBhIApyZWxlYXNlIHdpdGggaXQgeWV0ISksIGJ1dCBpdCB3b3VsZCBiZSB3b3J0aCBtZW50aW9u
aW5nIGluIHRoZSBjb21taXQgbWVzc2FnZSAKdGhhdCB0aGlzIGlzIGdvaW5nIHRvIGJyZWFrIGZv
ciBzb21lIHVzZXJzIChUQkQpIHNvIHRoZXkgbmVlZCB0byB1cGdyYWRlLgoKQEp1ZXJnZW46IEkg
d291bGQgbGlrZSB0byBjb25zaWRlciB0aGlzIHBhdGNoIGZvciBYZW4gNC4xMy4gVGhpcyBpcyBs
aW1pdGVkIHRvIApSUEk0IGFuZCB3b3VsZCBhdm9pZCB1cyB0byBzaGlwIGl0IHdpdGggYSBjb21w
YXRpYmxlIHRoYXQgaXMgZ29pbmcgdG8gZGlzYXBwZWFyLgoKPiAKPiBUaGUgYnJjbSxiY20yODM4
IGNvbnZlbnRpb24gaXMgYWJhbmRvbmVkLiBSZW1vdmUgaXQuCj4gCj4gUmVuYW1lIHRoZSB2YXJp
YWJsZXMgd2l0aGluIHRoZSBmaWxlIHRvIGEgcnBpNF8qIHByZWZpeCBzaW5jZSB0aGUgZmlsZQo+
IGlzIG1lYW50IHRvIGNvdmVyIHRoZSBSYXNwYmVycnkgUGkgNCBwbGF0Zm9ybS4KPiAKPiBbMV0g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTE2NTQwNy8KPiBbMl0gaHR0cHM6
Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2NvbW1pdC81M2ZkZDdiOGM4Y2I5Yzg3MTkw
Y2FhYjRmZDQ1OWY4OWUxYjRhN2Y4Cj4gCj4gU2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJy
YW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29tPgo+IC0tLQo+ICAgeGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1waS5jIHwgMTIgKysrKysrLS0tLS0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMgYi94
ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMKPiBpbmRleCBlMjJkMmIz
MTg0Li5iNjk3ZmEyYzZjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvYnJj
bS1yYXNwYmVycnktcGkuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvYnJjbS1yYXNw
YmVycnktcGkuYwo+IEBAIC0xOSwxMyArMTksMTMgQEAKPiAgIAo+ICAgI2luY2x1ZGUgPGFzbS9w
bGF0Zm9ybS5oPgo+ICAgCj4gLXN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBicmNtX2JjbTI4Mzhf
ZHRfY29tcGF0W10gX19pbml0Y29uc3QgPQo+ICtzdGF0aWMgY29uc3QgY2hhciAqY29uc3QgcnBp
NF9kdF9jb21wYXRbXSBfX2luaXRjb25zdCA9Cj4gICB7Cj4gLSAgICAiYnJjbSxiY20yODM4IiwK
PiArICAgICJicmNtLGJjbTI3MTEiLAo+ICAgICAgIE5VTEwKPiAgIH07Cj4gICAKPiAtc3RhdGlj
IGNvbnN0IHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggYnJjbV9iY20yODM4X2JsYWNrbGlzdF9kZXZb
XSBfX2luaXRjb25zdCA9Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX21hdGNoIHJw
aTRfYmxhY2tsaXN0X2RldltdIF9faW5pdGNvbnN0ID0KPiAgIHsKPiAgICAgICAvKgo+ICAgICAg
ICAqIFRoZSBhdXggU1BJcyBzaGFyZSBhbiBJUlEgYW5kIGEgcGFnZSB3aXRoIHRoZSBhdXggVUFS
VC4KPiBAQCAtNDAsOSArNDAsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRj
aCBicmNtX2JjbTI4MzhfYmxhY2tsaXN0X2RldltdIF9faW5pdGNvbnN0ID0KPiAgICAgICB7IC8q
IHNlbnRpbmVsICovIH0sCj4gICB9Owo+ICAgCj4gLVBMQVRGT1JNX1NUQVJUKGJyY21fYmNtMjgz
OCwgIlJhc3BiZXJyeSBQaSA0IikKPiAtICAgIC5jb21wYXRpYmxlICAgICA9IGJyY21fYmNtMjgz
OF9kdF9jb21wYXQsCj4gLSAgICAuYmxhY2tsaXN0X2RldiAgPSBicmNtX2JjbTI4MzhfYmxhY2ts
aXN0X2RldiwKPiArUExBVEZPUk1fU1RBUlQocnBpNCwgIlJhc3BiZXJyeSBQaSA0IikKPiArICAg
IC5jb21wYXRpYmxlICAgICA9IHJwaTRfZHRfY29tcGF0LAo+ICsgICAgLmJsYWNrbGlzdF9kZXYg
ID0gcnBpNF9ibGFja2xpc3RfZGV2LAo+ICAgUExBVEZPUk1fRU5ECj4gICAKPiAgIC8qCj4gCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs

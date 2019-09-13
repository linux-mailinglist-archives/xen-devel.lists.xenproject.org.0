Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7DEB2778
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 23:46:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8tKq-0001uL-QG; Fri, 13 Sep 2019 21:42:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wm3/=XI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i8tKp-0001uG-IW
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 21:42:31 +0000
X-Inumbo-ID: 618f3e36-d66f-11e9-b299-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 618f3e36-d66f-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 21:42:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C4A11000;
 Fri, 13 Sep 2019 14:42:27 -0700 (PDT)
Received: from [10.37.12.92] (unknown [10.37.12.92])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69F893F71F;
 Fri, 13 Sep 2019 14:42:26 -0700 (PDT)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20190913191147.2323-1-stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cdff00f6-be00-0b9a-924f-d3c6ffd84a22@arm.com>
Date: Fri, 13 Sep 2019 22:42:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913191147.2323-1-stewart.hildebrand@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: platform: additional Raspberry Pi
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzEzLzE5IDg6MTEgUE0sIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToKPiBVcHN0
cmVhbSBMaW51eCBrZXJuZWwgd2lsbCB1c2UgImJyY20sYmNtMjcxMSIgYXMgdGhlIGNvbXBhdGli
bGUgc3RyaW5nCj4gZm9yIFJhc3BiZXJyeSBQaSA0IFsxXS4gQWRkIHRoaXMgc3RyaW5nIHRvIG91
ciBwbGF0Zm9ybSBjb21wYXRpYmxlIGxpc3QKPiBmb3IgY29tcGF0aWJpbGl0eSB3aXRoIHRoZSB1
cHN0cmVhbSBrZXJuZWwuCgpUaGlzIHJhaXNlcyBhIGZldyBxdWVzdGlvbnM6CiAgICAxKSBXaHkg
c3VjaCBkaXNjcmVwYW5jaWVzIGluIG5hbWluZz8KICAgIDIpIElzIHRoZSBwYXRjaCBbMV0gbWVy
Z2VkPyBJZiBzbywgd2hpY2ggdmVyc2lvbj8KICAgIDMpIEJvdGggdXBzdHJlYW0gYW5kIG5vbi11
cHN0cmVhbSBzZWVtIHRvIGhhdmUgdGhlIGNvbXBhdGlibGUgCiJyYXNwYmVycnlwaSw0LW1vZGVs
LWIiLCBzbyB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIGNoZWNrIHRoYXQgaW5zdGVhZD8KCj4gCj4g
WzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEwOTI2MjEvCj4gCj4gU2ln
bmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVy
d29ya3MuY29tPgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJhc3BiZXJy
eS1waS5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1waS5jIGIveGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1waS5jCj4gaW5kZXggZTIyZDJiMzE4
NC4uYTk1YTNkYjgzZiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20t
cmFzcGJlcnJ5LXBpLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJl
cnJ5LXBpLmMKPiBAQCAtMjEsNiArMjEsNyBAQAo+ICAgCj4gICBzdGF0aWMgY29uc3QgY2hhciAq
Y29uc3QgYnJjbV9iY20yODM4X2R0X2NvbXBhdFtdIF9faW5pdGNvbnN0ID0KPiAgIHsKPiArICAg
ICJicmNtLGJjbTI3MTEiLAoKSWYgYSBuZXcgY29tcGF0aWJsZSBpcyBhZGRlZCwgdGhlbiB5b3Ug
bGlrZWx5IG5lZWQgdG8gcmVuYW1lIHRoZSAKZGlmZmVyZW50IHN0cnVjdHVyZSB3aXRoaW4gdGhp
cyBmaWxlLgoKPiAgICAgICAiYnJjbSxiY20yODM4IiwKPiAgICAgICBOVUxMCj4gICB9Owo+IAoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EB8BC0C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 16:51:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxY5R-0003el-2D; Tue, 13 Aug 2019 14:47:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxY5P-0003ef-EI
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 14:47:43 +0000
X-Inumbo-ID: 4deff2de-bdd9-11e9-ad06-877682099aa3
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4deff2de-bdd9-11e9-ad06-877682099aa3;
 Tue, 13 Aug 2019 14:47:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 464B4344;
 Tue, 13 Aug 2019 07:47:42 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAF2E3F706;
 Tue, 13 Aug 2019 07:47:40 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-4-sstabellini@kernel.org> <87d0h9gmwb.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <81216c46-b1b8-8278-367f-66f9c83aaef4@arm.com>
Date: Tue, 13 Aug 2019 15:47:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87d0h9gmwb.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/7] xen/arm: early_print_info print
 reserved_mem
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzEzLzE5IDM6MjggUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IFN0
ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6Cj4gCj4+IEltcHJvdmUgZWFybHlfcHJpbnRfaW5mbyB0
byBhbHNvIHByaW50IHRoZSBiYW5rcyBzYXZlZCBpbgo+PiBib290aW5mby5yZXNlcnZlZF9tZW0u
IFByaW50IHRoZW0gcmlnaHQgYWZ0ZXIgUkVTVkQsIGluY3JlYXNpbmcgdGhlIHNhbWUKPj4gaW5k
ZXguCj4+Cj4+IFNpbmNlIHdlIGFyZSBhdCBpdCwgYWxzbyBzd2l0Y2ggdGhlIGV4aXN0aW5nIFJF
U1ZEIHByaW50IHRvIHVzZSB1bnNpZ25lZAo+PiBpbnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiBSZXZpZXdlZC1ieTogVm9s
b2R5bXlyIEJhYmNodWsgPHZvbG9keW15ci5iYWJjaHVrQGVwYW0uY29tPgo+IAo+IEJ1dCwgcGxl
YXNlIHNlZSBOSVQgYmVsb3cuCj4gCj4+IC0tLQo+PiBDaGFuZ2VzIGluIHY1Ogo+PiAtIHN3aXRj
aCB0byB1bnNpZ25lZAo+Pgo+PiBDaGFuZ2VzIGluIHY0Ogo+PiAtIG5ldyBwYXRjaAo+PiAtLS0K
Pj4gICB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIHwgMTEgKysrKysrKysrLS0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKPj4gaW5k
ZXggMGIwZTIyYTNkMC4uMzIxNTNlNjIwNyAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL2Jv
b3RmZHQuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4+IEBAIC0zMzcsOSArMzM3
LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IGVhcmx5X3NjYW5fbm9kZShjb25zdCB2b2lkICpmZHQs
Cj4+ICAgc3RhdGljIHZvaWQgX19pbml0IGVhcmx5X3ByaW50X2luZm8odm9pZCkKPj4gICB7Cj4+
ICAgICAgIHN0cnVjdCBtZW1pbmZvICptaSA9ICZib290aW5mby5tZW07Cj4+ICsgICAgc3RydWN0
IG1lbWluZm8gKm1lbV9yZXN2ID0gJmJvb3RpbmZvLnJlc2VydmVkX21lbTsKPj4gICAgICAgc3Ry
dWN0IGJvb3Rtb2R1bGVzICptb2RzID0gJmJvb3RpbmZvLm1vZHVsZXM7Cj4+ICAgICAgIHN0cnVj
dCBib290Y21kbGluZXMgKmNtZHMgPSAmYm9vdGluZm8uY21kbGluZXM7Cj4+IC0gICAgaW50IGks
IG5yX3JzdmQ7Cj4+ICsgICAgdW5zaWduZWQgaW50IGksIGosIG5yX3JzdmQ7Cj4+ICAgCj4+ICAg
ICAgIGZvciAoIGkgPSAwOyBpIDwgbWktPm5yX2JhbmtzOyBpKysgKQo+PiAgICAgICAgICAgcHJp
bnRrKCJSQU06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsCj4+IEBAIC0zNjEsOSArMzYy
LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlYXJseV9wcmludF9pbmZvKHZvaWQpCj4+ICAgICAg
ICAgICAgICAgY29udGludWU7Cj4+ICAgICAgICAgICAvKiBmZHRfZ2V0X21lbV9yc3YgcmV0dXJu
cyBsZW5ndGggKi8KPj4gICAgICAgICAgIGUgKz0gczsKPj4gLSAgICAgICAgcHJpbnRrKCIgUkVT
VkRbJWRdOiAlIlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4iLAo+PiArICAgICAgICBwcmludGso
IiBSRVNWRFsldV06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgaSwgcywgZSk7Cj4gTklUOiBJIHNlZSBubyByZWFzb24sIHdoeSB0aGlzIHBy
aW50ayBpcyBzcGxpdCBpbnRvIHR3byBsaW5lcywgYXMgbmljZWx5IGZpdHMKPiBpbnRvIG9uZSBs
aW5lLgoKTm90IG1lbnRpb25pbmcgdGhlIHdyb25nIGluZGVudGF0aW9uIGluIHByZXR0eSBtdWNo
IGFsbCB0aGlzIGZ1bmN0aW9uIAo7KS4gSSB3b3VsZCBwcmVmZXIgaWYgd2UgdGFrZSBjYXJlIG9m
IHRoZSBpbmRlbnRhdGlvbiBpc3N1ZXMgaW4gYSBwYXRjaCAKYmVmb3JlIHRoaXMgb25lLgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==

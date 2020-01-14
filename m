Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C675139EEF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 02:30:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irAz6-0000FW-6b; Tue, 14 Jan 2020 01:27:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MmA+=3D=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1irAz4-0000FR-Gi
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 01:27:06 +0000
X-Inumbo-ID: f96239b8-366c-11ea-a985-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f96239b8-366c-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 01:27:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B269D2084D;
 Tue, 14 Jan 2020 01:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578965225;
 bh=4qfyS69CK4zv4VtJA07qc5AzA/p1hVsZpLEHVG5Dz5c=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=su+2ssAL1BN5RszVL1pdui+dK/W8IQb3pVHFCssjsSUBa0voqSkqMNPmpNxfoIud2
 b+zh3fWzpsXmEEinLFZHEEG3QSgZW+732PYATFbHqSuhb9DedLmMqyhYoCSNldWL1a
 jxtafBbBUGgiv5KS3TdqMXaAdwo2WJ8rW05rWJ0I=
Date: Mon, 13 Jan 2020 17:27:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <20200113215709.16107-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2001131726480.6687@sstabellini-ThinkPad-T480s>
References: <20200113215709.16107-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] docs/misc: pvcalls: Verbatim block should
 be indented with 4 spaces
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMyBKYW4gMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSBkaWFncmFtIGlzIG9ubHkgaW5kZW50ZWQgd2l0aCAyIHNwYWNlcy4gU28gcGFuZG9jCj4g
d2lsbCB0cnkgdG8gYmFkbHkgaW50ZXJwcmV0IGl0IGFuZCBub3QgZGlzcGxheSBpdCBjb3JyZWN0
bHkuCj4gCj4gRml4IGl0IGJ5IGluZGVudGluZyBhbGwgdGhlIGJsb2NrIGJ5IDQgc3BhY2VzIChp
LmUgYW4gZXh0cmEgMiBzcGFjZXMpLgo+IAo+IEZpeGVzOiBkNjYxNjExZDA4ICgiZG9jcy9tYXJr
ZG93bjogU3dpdGNoIHRvIHVzaW5nIHBhbmRvYywgYW5kIGZpeCB1bmRlcnNjb3JlIGVzY2FwaW5n
IikKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKQWNrZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KClRoYW5rcyEK
Cj4gLS0tCj4gIGRvY3MvbWlzYy9wdmNhbGxzLnBhbmRvYyB8IDM2ICsrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwg
MTggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9wdmNhbGxzLnBhbmRv
YyBiL2RvY3MvbWlzYy9wdmNhbGxzLnBhbmRvYwo+IGluZGV4IDBjNDhiMjk4NDIuLjcyOWNmOTdi
ZGYgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9taXNjL3B2Y2FsbHMucGFuZG9jCj4gKysrIGIvZG9jcy9t
aXNjL3B2Y2FsbHMucGFuZG9jCj4gQEAgLTg2NywyNCArODY3LDI0IEBAIGFuZCB0aGUgc2Vjb25k
IGhhbGYgdG8gdGhlICoqb3V0KiogYXJyYXkuIFRoZXkgYXJlIHVzZWQgYXMgY2lyY3VsYXIKPiAg
YnVmZmVycyBmb3IgdHJhbnNmZXJyaW5nIGRhdGEsIGFuZCwgdG9nZXRoZXIsIHRoZXkgYXJlIHRo
ZSBkYXRhIHJpbmcuCj4gIAo+ICAKPiAtICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKyAg
ICAgICAgICAgICAgICAgSW5kZXhlcyBwYWdlCj4gLSAgfCBDb21tYW5kIHJpbmc6ICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+IC0gIHwgQDA6
IHhlbl9wdmNhbGxzX2Nvbm5lY3Q6ICB8ICAgICAgICAgICAgICAgICB8QDAgcHZjYWxsc19kYXRh
X2ludGY6IHwKPiAtICB8IEA0NDogcmVmICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0+K0A3NjogcmluZ19vcmRlciA9IDEgICB8Cj4gLSAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgIHxAODA6IHJlZlswXSsgICAgICAgICAgfAo+IC0gICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rICAgICAgICAgICAgICAgICB8QDg0OiByZWZbMV0rICAg
ICAgICAgIHwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgfCAgICAgICAgICB8Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgIHwgICAgICAgICAgfAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2IChkYXRhIHJpbmcpCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLSstLS0tLS0tLS0tLSsK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IEAwLT40MDk4OiBpbiAgICAgfAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgcmVmWzBdICAgICAgICAgICB8Cj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8LS0tLS0tLS0tLS0tLS0tLS0t
LXwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIEA0MDk5LT44MTk2OiBvdXQgfAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgcmVmWzFdICAgICAgICAgICB8Cj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0t
LS0tLSsKPiArICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKyAgICAgICAgICAg
ICAgICAgSW5kZXhlcyBwYWdlCj4gKyAgICAgICAgfCBDb21tYW5kIHJpbmc6ICAgICAgICAgICAg
IHwgICAgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+ICsgICAgICAgIHwg
QDA6IHhlbl9wdmNhbGxzX2Nvbm5lY3Q6ICB8ICAgICAgICAgICAgICAgICB8QDAgcHZjYWxsc19k
YXRhX2ludGY6IHwKPiArICAgICAgICB8IEA0NDogcmVmICArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0+K0A3NjogcmluZ19vcmRlciA9IDEgICB8Cj4gKyAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgIHxAODA6IHJlZlswXSsgICAgICAg
ICAgfAo+ICsgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rICAgICAgICAgICAg
ICAgICB8QDg0OiByZWZbMV0rICAgICAgICAgIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgfCAgICAgICAgICB8Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgICAgIHwgICAgICAgICAgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2IChkYXRhIHJpbmcpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLSstLS0tLS0tLS0tLSsK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIEAwLT40MDk4OiBpbiAgICAgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgcmVmWzBdICAgICAgICAgICB8Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
LS0tLS0tLS0tLS0tLS0tLS0tLXwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIEA0MDk5LT44MTk2OiBvdXQgfAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgcmVm
WzFdICAgICAgICAgICB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLSsKPiAgCj4gIAo+ICAjIyMj
IEluZGV4ZXMgUGFnZSBTdHJ1Y3R1cmUKPiAtLSAKPiAyLjE3LjEKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33FF606F9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 15:57:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjOer-0007Fz-2g; Fri, 05 Jul 2019 13:53:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8AU=VC=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hjOep-0007Fu-JI
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 13:53:47 +0000
X-Inumbo-ID: 4eb9deda-9f2c-11e9-940d-473452cd8001
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4eb9deda-9f2c-11e9-940d-473452cd8001;
 Fri, 05 Jul 2019 13:53:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AD3993091754;
 Fri,  5 Jul 2019 13:53:44 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-244.ams2.redhat.com
 [10.36.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A33468C79;
 Fri,  5 Jul 2019 13:53:43 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-5-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <addb73b0-accb-e586-0d82-4f1a8181b33c@redhat.com>
Date: Fri, 5 Jul 2019 15:53:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-5-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 05 Jul 2019 13:53:45 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 04/35] OvmfPkg: Introduce XenPlatformPei
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW50aG9ueSwKCk9uIDA3LzA0LzE5IDE2OjQyLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBJ
bnRyb2R1Y2UgWGVuUGxhdGZvcm1QZWksIGEgY29weSBvZiBPdm1mUGtnL1BsYXRmb3JtUGVpIHdp
dGhvdXQgc29tZQo+IG9mIFFFTVUgc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24sIFhlbiBkb2VzIG5v
dCBzdXBwb3J0IFFlbXVGd0NmZy4KPiAKPiBUaGlzIG5ldyBtb2R1bGUgd2lsbCBiZSBhZGp1c3Rl
ZCB0byBhY2NvbW1vZGF0ZSBYZW4gUFZILgo+IAo+IGZ3X2NmZyBkZXBlbmRlbnRzIHRoYXQgaGF2
ZSBiZWVuIHJlbW92ZWQsIHdoaWNoIGFyZSBkeW5hbWljYWxseSBza2lwcGVkCj4gd2hlbiBydW5u
aW5nIFBsYXRmb3JtUGVpIG9uIFhlbjoKPiAtIEdldEZpcnN0Tm9uQWRkcmVzcygpOiBjb250cm9s
bGluZyB0aGUgNjQtYml0IFBDSSBNTUlPIGFwZXJ0dXJlIHZpYSB0aGUKPiAoZXhwZXJpbWVudGFs
KSAib3B0L292bWYvWC1QY2lNbWlvNjRNYiIgZmlsZQo+IC0gR2V0Rmlyc3ROb25BZGRyZXNzKCk6
IGhvbm9yaW5nIHRoZSBob3RwbHVnIERJTU0gYXJlYQo+ICgiZXRjL3Jlc2VydmVkLW1lbW9yeS1l
bmQiKSBpbiB0aGUgcGxhY2VtZW50IG9mIHRoZSA2NC1iaXQgUENJIE1NSU8KPiBhcGVydHVyZQo+
IC0gTm9leGVjRHhlSW5pdGlhbGl6YXRpb24oKSBpcyByZW1vdmVkLCBzbyBQY2RQcm9wZXJ0aWVz
VGFibGVFbmFibGUgYW5kCj4gUGNkU2V0TnhGb3JTdGFjayBhcmUgbGVmdCBjb25zdGFudCBGQUxT
RSAobm90IHNldCBkeW5hbWljYWxseSBmcm9tCj4gZndfY2ZnICJvcHQvb3ZtZi9QY2RYeHh4IikK
PiAtIE1heENwdUNvdW50SW5pdGlhbGl6YXRpb24oKSwgUHVibGlzaFBlaU1lbW9yeSgpOiB0aGUg
bWF4IENQVSBjb3VudCBpcwo+IG5vdCB0YWtlbiBmcm9tIHRoZSBRZW11RndDZmdJdGVtU21wQ3B1
Q291bnQgZndfY2ZnIGtleTsKPiBQY2RDcHVNYXhMb2dpY2FsUHJvY2Vzc29yTnVtYmVyIGlzIHVz
ZWQgaW50YWN0IGFuZAo+IFBjZENwdUFwSW5pdFRpbWVPdXRJbk1pY3JvU2Vjb25kcyBpcyBuZXZl
ciBjaGFuZ2VkIG9yIHVzZWQuCj4gLSBJbml0aWFsaXplWGVuUGxhdGZvcm0oKSwgUzNWZXJpZmlj
YXRpb24oKTogUzMgaXMgYXNzdW1lZCBkaXNhYmxlZCAobm90Cj4gY29uc3VsdGluZyAiZXRjL3N5
c3RlbS1zdGF0ZXMiIHZpYSBRZW11RndDZmdTM0VuYWJsZWQoKSkuCj4gLSBJbnN0YWxsRmVhdHVy
ZUNvbnRyb2xDYWxsYmFjaygpOiB0aGUgZmVhdHVyZSBjb250cm9sIE1TUiBpcyBub3Qgc2V0Cj4g
ZnJvbSAiZXRjL21zcl9mZWF0dXJlX2NvbnRyb2wiCj4gKGFsc28gcmVtb3ZlZCBGZWF0dXJlQ29u
dHJvbC5jIGFzIHRoZXJlIGlzIG5vdGhpbmcgYmVlbiBleGVjdXRlZCkKPiAKPiBBbHNvIHJlbW92
ZWQ6Cj4gLSBTTVJBTS9UU0VHLXJlbGF0ZWQgbG93IG1lbSBzaXplIGFkanVzdGluZyAoUGNkU21t
U21yYW1SZXF1aXJlIGlzCj4gYXNzdW1lZCBGQUxTRSkgaW4gUHVibGlzaFBlaU1lbW9yeSgpLAo+
IC0gUWVtdUluaXRpYWxpemVSYW0oKSBlbnRpcmVseSwKPiAKPiBYZW4gcmVsYXRlZCBjaGFuZ2Vz
Ogo+IC0gSGF2ZSByZW1vdmVkIHRoZSBtb2R1bGUgdmFyaWFibGUgbVhlbiwgYXMgaXQgc2hvdWxk
IGJlIGFsd2F5cyB0cnVlLgo+IC0gSGF2ZSB0aGUgcGxhdGZvcm0gUEVJIGluaXRpYWxpemF0aW9u
IGZhaWxzIGlmIFhlbiBoYXMgbm90IGJlZW4KPiAgIGRldGVjdGVkLgo+IAo+IFJlZjogaHR0cHM6
Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5Cj4gU2lnbmVkLW9m
Zi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4gLS0tCj4gCj4gTm90ZXM6
Cj4gICAgIHYzOgo+ICAgICAgIC0gZml4IGNvZGluZyBzdHlsZSBpbiBuZXcgY29kZQo+ICAgICAg
ICAgKHVzZSBERUJVR194eHgsIGFkZCBBU1NFUlQgYmVmb3JlIENwdURlYWRMb29wKQo+ICAgICAg
IC0gcmViYXNlZCwgU1BEWAoKSW4gbXkgdjIgcmV2aWV3IGF0CjxodHRwOi8vbWlkLm1haWwtYXJj
aGl2ZS5jb20vOTk0ZDAxZjMtYmFlNy1jNDQ3LTZlMjgtNWE2MWE4NDQ2NGFjQHJlZGhhdC5jb20+
LApwb2ludCAoMiksIEkgbWVhbnQgdGhhdCB5b3Ugc2hvdWxkIHBsZWFzZSByZXBsYWNlICphbGwq
IEVGSV9EX3h4eCBtYWNyb3MKd2l0aCBERUJVR194eHggbWFjcm9zLCBpbiBuZXcgY29kZS4KCkJ5
ICJuZXcgY29kZSIgSSBkaWRuJ3QgbWVhbiBjb2RlIHRoYXQgeW91IHdyb3RlIGFmcmVzaCwgYnV0
IHNpbXBseQpzb3VyY2UgY29kZSB0aGF0IGFwcGVhcmVkIGFzIG5ldyAtLSBpLmUuLCBhcyBhbiBh
ZGRpdGlvbiAtLSBpbiB0aGUKcGF0Y2guIFRoYXQgaXMsIGFsbCB0aGUgRUZJX0RfeHh4IG1hY3Jv
cyB0aGF0IHlvdSBpbmhlcml0IGZyb20KUGxhdGZvcm1QZWkgYnkgdmlydHVlIG9mIGNvcHlpbmcg
c2hvdWxkIGJlIHJlcGxhY2VkIGFzIHdlbGwuCgpUaGlzIHYzIHBhdGNoIGNvbnRpbnVlcyB0byBh
ZGQgMTIgaW5zdGFuY2VzIG9mIEVGSV9EX3h4eCwgYnkgbXkgY291bnQuClBsZWFzZSByZXBsYWNl
IGFsbCBvZiB0aG9zZSwgd2l0aCBERUJVR194eHguCgpUaGUgcmVzdCBvZiB0aGUgdXBkYXRlcyBp
biB2MyBhcmUgZ29vZCwgYW5kIHN1ZmZpY2llbnQuCgpUaGFua3MKTGFzemxvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

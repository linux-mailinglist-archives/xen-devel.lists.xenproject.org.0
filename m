Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97FD10C12C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 01:58:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia86V-0000X3-9V; Thu, 28 Nov 2019 00:56:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ia86T-0000Wo-Q6
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 00:56:17 +0000
X-Inumbo-ID: d8d84f38-1179-11ea-83b8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8d84f38-1179-11ea-83b8-bc764e2007e4;
 Thu, 28 Nov 2019 00:56:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFE6F2158A;
 Thu, 28 Nov 2019 00:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574902561;
 bh=Bpiyg5V6eOQvT7ggDjtfQ5yuPUTc9IVhVjJBUQaER7U=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=EmHEIYNcYPd3Iv5FUQIJaYjD1dLepZmN4pOpSJNObEmwzd3A1X7nNVubKVp7rp871
 G5iDESCEMqk48F+97bulaWVqr6sv3/NEiJN6YQ53ow13ApleQmPiJpuXxmYsM5IeGo
 xoXLxPIQQWtrHAeFgbm37gxiS0eT6xPOMslh5Udc=
Date: Wed, 27 Nov 2019 16:56:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@xenproject.org>
In-Reply-To: <2e4b36afaa73277d246d7e84037db1532a136ec7.1569525222.git.lars.kurth@citrix.com>
Message-ID: <alpine.DEB.2.21.1911271549140.27669@sstabellini-ThinkPad-T480s>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <2e4b36afaa73277d246d7e84037db1532a136ec7.1569525222.git.lars.kurth@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 6/6] Added Resolving Disagreement
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
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyNiBTZXAgMjAxOSwgTGFycyBLdXJ0aCB3cm90ZToKPiBGcm9tOiBMYXJzIEt1cnRo
IDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+Cj4gCj4gVGhpcyBndWlkZSBwcm92aWRlcyBCZXN0IFBy
YWN0aWNlIG9uIGlkZW50aWZ5aW5nIGFuZCByZXNvbHZpbmcKPiBjb21tb24gY2xhc3NlcyBvZiBk
aXNhZ3JlZW1lbnQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNp
dHJpeC5jb20+Cj4gLS0KPiBDYzogbWluaW9zLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4g
Q2M6IHhlbi1hcGlAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDYzogd2luLXB2LWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCj4gQ2M6IG1pcmFnZW9zLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4gQ2M6IGNvbW1pdHRlcnNAeGVucHJvamVjdC5vcmcKPiAtLS0KPiAgcmVzb2x2aW5nLWRpc2Fn
cmVlbWVudC5tZCB8IDE0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNDYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcmVzb2x2aW5nLWRpc2FncmVlbWVudC5tZAo+IAo+IGRpZmYgLS1naXQgYS9yZXNv
bHZpbmctZGlzYWdyZWVtZW50Lm1kIGIvcmVzb2x2aW5nLWRpc2FncmVlbWVudC5tZAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uMTlhZWRiZQo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9yZXNvbHZpbmctZGlzYWdyZWVtZW50Lm1kCj4gQEAgLTAsMCArMSwxNDYgQEAKPiAr
IyBSZXNvbHZpbmcgRGlzYWdyZWVtZW50Cj4gKwo+ICtUaGlzIGd1aWRlIHByb3ZpZGVzIEJlc3Qg
UHJhY3RpY2Ugb24gcmVzb2x2aW5nIGRpc2FncmVlbWVudCwgc3VjaCBhcwo+ICsqIEdyYWNlZnVs
bHkgYWNjZXB0IGNvbnN0cnVjdGl2ZSBjcml0aWNpc20KPiArKiBGb2N1cyBvbiB3aGF0IGlzIGJl
c3QgZm9yIHRoZSBjb21tdW5pdHkKPiArKiBSZXNvbHZlIGRpZmZlcmVuY2VzIGluIG9waW5pb24g
ZWZmZWN0aXZlbHkKPiArCj4gKyMjIFRoZW9yeTogUGF1bCBHcmFoYW0ncyBoaWVyYXJjaHkgb2Yg
ZGlzYWdyZWVtZW50Cj4gK1BhdWwgR3JhaGFtIHByb3Bvc2VkIGEgKipkaXNhZ3JlZW1lbnQgaGll
cmFyY2h5KiogaW4gYSAyMDA4IGVzc2F5IAo+ICsqKltIb3cgdG8gRGlzYWdyZWVdKGh0dHA6Ly93
d3cucGF1bGdyYWhhbS5jb20vZGlzYWdyZWUuaHRtbCkqKiwgcHV0dGluZyB0eXBlcyBvZgo+ICth
cmd1bWVudHMgaW50byBhIHNldmVuLXBvaW50IGhpZXJhcmNoeSBhbmQgb2JzZXJ2aW5nIHRoYXQg
Km1vdmluZyB1cCB0aGUKPiArZGlzYWdyZWVtZW50IGhpZXJhcmNoeSBtYWtlcyBwZW9wbGUgbGVz
cyBtZWFuLCBhbmQgd2lsbCBtYWtlIG1vc3Qgb2YgdGhlbSBoYXBwaWVyKi4KPiArR3JhaGFtIGFs
c28gc3VnZ2VzdGVkIHRoYXQgdGhlIGhpZXJhcmNoeSBjYW4gYmUgdGhvdWdodCBvZiBhcyBhIHB5
cmFtaWQsIGFzIHRoZSAKPiAraGlnaGVzdCBmb3JtcyBvZiBkaXNhZ3JlZW1lbnQgYXJlIHJhcmVy
Lgo+ICsKPiArfCAhW0dyYWhhbSdzIEhpZXJhcmNoeSBvZiBEaXNhZ3JlZW1lbl0oaHR0cHM6Ly91
cGxvYWQud2lraW1lZGlhLm9yZy93aWtpcGVkaWEvY29tbW9ucy9hL2EzL0dyYWhhbSUyN3NfSGll
cmFyY2h5X29mX0Rpc2FncmVlbWVudC1lbi5zdmcpIHwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeIERpc2FncmVlbWVudAoKVGhpcyBpcyBhIE5JVCBidXQgaW4gYSBmZXcgcGxhY2VzIGlu
IHRoaXMgc2VyaWVzIHlvdSBnbyBvdmVyIHRoZQpvcmlnaW5hbCBsaW5lIGxlbmd0aC4KCgo+ICt8
ICpBIHJlcHJlc2VudGF0aW9uIG9mIEdyYWhhbSdzIGhpZXJhcmNoeSBvZiBkaXNhZ3JlZW1lbnQg
ZnJvbSBbTG91ZGFjcmlzXShodHRwOi8vd3d3LmNyZWF0ZWRlYmF0ZS5jb20vdXNlci92aWV3cHJv
ZmlsZS9Mb3VkYWNyaXMpIG1vZGlmaWVkIGJ5IFtSb2NrZXQwMDBdKGh0dHBzOi8vZW4ud2lraXBl
ZGlhLm9yZy93aWtpL1VzZXI6Um9ja2V0MDAwKSogfAo+ICsKPiArSW4gdGhlIGNvbnRleHQgb2Yg
dGhlIFhlbiBQcm9qZWN0IHdlIHN0cml2ZSB0byAqKm9ubHkgdXNlIHRoZSB0b3AgaGFsZioqIG9m
IHRoZSBoaWVyYXJjaHkuCj4gKyoqTmFtZS1jYWxsaW5nKiogYW5kICoqQWQgaG9taW5lbSoqIGFy
Z3VtZW50cyBhcmUgbm90IGFjY2VwdGFibGUgd2l0aGluIHRoZSBYZW4KPiArUHJvamVjdC4KPiAr
Cj4gKyMjIElzc3VlOiBTY29wZSBjcmVlcAo+ICsKPiArT25lIHRoaW5nIHdoaWNoIG9jY2FzaW9u
YWxseSBoYXBwZW5zIGR1cmluZyBjb2RlIHJldmlldyBpcyB0aGF0IGEgY29kZSByZXZpZXdlcgo+
ICthc2tzIG9yIGFwcGVhcnMgdG8gYXNrIHRoZSBhdXRob3Igb2YgcGF0Y2ggdG8gaW1wbGVtZW50
IGFkZGl0aW9uYWwgZnVuY3Rpb25hbGl0eS4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXiBhIHBhdGNoICAgICAgICAgICAgICAgICAgICAgIF4gZnVuY3Rpb25hbGl0aWVz
IAoKCj4gK1RoaXMgY291bGQgdGFrZSBmb3IgZXhhbXBsZSB0aGUgZm9ybSBvZgo+ICs+IERvIHlv
dSB0aGluayBpdCB3b3VsZCBiZSB1c2VmdWwgZm9yIHRoZSBjb2RlIHRvIGRvIFhYWD8gCj4gKz4g
SSBjYW4gaW1hZ2luZSBhIHVzZXIgd2FudGluZyB0byBkbyBZWVkgKGFuZCBYWFggd291bGQgZW5h
YmxlIHRoaXMpCj4gKwo+ICtUaGF0IHBvdGVudGlhbGx5IGFkZHMgYWRkaXRpb25hbCB3b3JrIGZv
ciB0aGUgY29kZSBhdXRob3IsIHdoaWNoIHRoZXkgbWF5IG5vdCBoYXZlCj4gK3RoZSB0aW1lIHRv
IHBlcmZvcm0uIEl0IGlzIGdvb2QgcHJhY3RpY2UgZm9yIGF1dGhvcnMgdG8gY29uc2lkZXIgc3Vj
aCBhIHJlcXVlc3QgaW4gdGVybXMgb2YKPiArKiBVc2VmdWxuZXNzIHRvIHRoZSB1c2VyCj4gKyog
Q29kZSBjaHVybiwgY29tcGxleGl0eSBvciBpbXBhY3Qgb24gb3RoZXIgc3lzdGVtIHByb3BlcnRp
ZXMKPiArKiBFeHRyYSB0aW1lIHRvIGltcGxlbWVudCBhbmQgcmVwb3J0IGJhY2sgdG8gdGhlIHJl
dmlld2VyCj4gKwo+ICtJZiB5b3UgYmVsaWV2ZSB0aGF0IHRoZSBpbXBhY3QvY29zdCBpcyB0b28g
aGlnaCwgcmVwb3J0IGJhY2sgdG8gdGhlIHJldmlld2VyLiBUbyByZXNvbHZlCj4gK3RoaXMsIGl0
IGlzIGFkdmlzYWJsZSB0bwo+ICsqIFJlcG9ydCB5b3VyIGZpbmRpbmdzCj4gKyogQW5kIHRoZW4g
Y2hlY2sgd2hldGhlciB0aGlzIHdhcyBtZXJlbHkgYW4gaW50ZXJlc3Rpbmcgc3VnZ2VzdGlvbiwg
b3Igc29tZXRoaW5nIHRoZQo+ICtyZXZpZXdlciBmZWVscyBtb3JlIHN0cm9uZ2x5IGFib3V0Cj4g
Kwo+ICtJbiB0aGUgbGF0dGVyIGNhc2UsIHRoZXJlIGFyZSB0eXBpY2FsbHkgc2V2ZXJhbCBjb21t
b24gb3V0Y29tZXMKPiArKiBUaGUgKiphdXRob3IgYW5kIHJldmlld2VyIGFncmVlKiogdGhhdCB0
aGUgc3VnZ2VzdGlvbiBzaG91bGQgYmUgaW1wbGVtZW50ZWQKPiArKiBUaGUgKiphdXRob3IgYW5k
IHJldmlld2VyIGFncmVlKiogdGhhdCBpdCBtYXkgbWFrZSBzZW5zZSB0byBkZWZlciBpbXBsZW1l
bnRhdGlvbgo+ICsqIFRoZSAqKmF1dGhvciBhbmQgcmV2aWV3ZXIgYWdyZWUqKiB0aGF0IGl0IG1h
a2VzIG5vIHNlbnNlIHRvIGltcGxlbWVudCB0aGUgc3VnZ2VzdGlvbgo+ICsKPiArVGhlIGF1dGhv
ciBvZiBhIHBhdGNoIHdvdWxkIHR5cGljYWxseSBzdWdnZXN0IHRoZWlyIHByZWZlcnJlZCBvdXRj
b21lLCBmb3IgZXhhbXBsZQo+ICs+IEkgYW0gbm90IHN1cmUgaXQgaXMgd29ydGggdG8gaW1wbGVt
ZW50IFhYWAo+ICs+IERvIHlvdSB0aGluayB0aGlzIGNvdWxkIGJlIGRvbmUgYXMgYSBzZXBhcmF0
ZSBwYXRjaCBpbiBmdXR1cmU/Cj4gKwo+ICtJbiBjYXNlcywgd2hlcmUgbm8gYWdyZWVtZW50IGNh
biBiZSBmb3VuZCwgdGhlIGJlc3QgYXBwcm9hY2ggd291bGQgYmUgdG8gZ2V0IGFuCj4gK2luZGVw
ZW5kZW50IG9waW5pb24gZnJvbSBhbm90aGVyIG1haW50YWluZXIgb3IgdGhlIHByb2plY3QncyBs
ZWFkZXJzaGlwIHRlYW0uCgpJIHRoaW5rIHdlIHNob3VsZCBtZW50aW9uIHNvbWV3aGVyZSBoZXJl
IHRoYXQgaXQgaXMgcmVjb21tZW5kZWQgZm9yCnJldmlld2VycyB0byBiZSBleHBsaWNpdCBhYm91
dCB3aGV0aGVyIGEgcmVxdWVzdCBpcyBvcHRpb25hbCBvciB3aGV0aGVyCml0IGlzIGEgcmVxdWly
ZW1lbnQuCgpGb3IgaW5zdGFuY2U6ICJJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgaWYgWCBhbHNv
IGRpZCBZIiBkb2Vzbid0IHNheSBpZgppdCBpcyBvcHRpb25hbCAoZnV0dXJlIHdvcmspIG9yIGl0
IGlzIGFjdHVhbGx5IHJlcXVpcmVkIGFzIHBhcnQgb2YgdGhpcwpzZXJpZXMuIE1vcmUgZXhwbGlj
aXQgd29yZCBjaG9pY2VzIGFyZSBwcmVmZXJhYmxlLCBzdWNoIGFzOgoKIkkgdGhpbmsgaXQgd291
bGQgYmUgZ29vZCBpZiBYIGFsc28gZGlkIFksIG5vdCBhIHJlcXVpcmVtZW50IGJ1dCBnb29kIHRv
CmhhdmUuIgoKIkkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCBpZiBYIGFsc28gZGlkIFkgYW5kIGl0
IHNob3VsZCBiZSBwYXJ0IG9mIHRoaXMKc2VyaWVzLiIKCkl0IGhlbHBzIG1ha2UgdGhlIGNvbW11
bmljYXRpb24gd2l0aCB0aGUgYXV0aG9yIG1vcmUgZWZmZWN0aXZlLAplc3BlY2lhbGx5IGluIHRo
aXMga2luZCBvZiBzaXR1YXRpb25zLgoKCj4gKyMjIElzc3VlOiBbQmlrZXNoZWRkaW5nXShodHRw
czovL2VuLndpa3Rpb25hcnkub3JnL3dpa2kvYmlrZXNoZWRkaW5nKQo+ICsKPiArT2NjYXNpb25h
bGx5IGRpc2N1c3Npb25zIGFib3V0IHVuaW1wb3J0YW50IGJ1dCBlYXN5LXRvLWdyYXNwIGlzc3Vl
cyBjYW4gbGVhZCB0bwo+ICtwcm9sb25nZWQgYW5kIHVucHJvZHVjdGl2ZSBkaXNjdXNzaW9uLiBU
aGUgYmVzdCB3YXkgdG8gYXBwcm9hY2ggdGhpcyBpcyB0bwogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeIGRpc2N1c3Npb25zCgoKPiArdHJ5IGFuZCAqKmFudGljaXBhdGUqKiBiaWtlc2hl
ZGRpbmcgYW5kIGhpZ2hsaWdodCBpdCBhcyBzdWNoIHVwZnJvbnQuIEhvd2V2ZXIsIHRoZQo+ICtm
b3JtYXQgb2YgYSBjb2RlIHJldmlldyBkb2VzIG5vdCBhbHdheXMgbGVuZCBpdHNlbGYgd2VsbCB0
byB0aGlzIGFwcHJvYWNoLCBleGNlcHQKPiArZm9yIGhpZ2hsaWdodGluZyBpdCBpbiB0aGUgY292
ZXIgbGV0dGVyIG9mIGEgcGF0Y2ggc2VyaWVzLgo+ICsKPiArSG93ZXZlciwgdHlwaWNhbGx5IEJp
a2VzaGVkZGluZyBpc3N1ZXMgYXJlIGZhaXJseSBlYXN5IHRvIHJlY29nbml6ZSBpbiBhIGNvZGUg
cmV2aWV3LAo+ICthcyB5b3Ugd2lsbCB2ZXJ5IHF1aWNrbHkgZ2V0IGRpZmZlcmVudCByZXZpZXdl
cnMgcHJvdmlkaW5nIGRpZmZlcmluZyBvcGluaW9ucy4gSW4gdGhpcyBjYXNlCj4gK2l0IGlzIGJl
c3QgZm9yIHRoZSBhdXRob3Igb3IgYSByZXZpZXdlciB0byBjYWxsIG91dCB0aGUgcG90ZW50aWFs
IGJpa2VzaGVkZGluZyBpc3N1ZSB1c2luZwo+ICtzb21ldGhpbmcgbGlrZQo+ICsKPiArPiBMb29r
cyB3ZSBoYXZlIGEgYmlrZXNoZWRkaW5nIGlzc3VlIGhlcmUKPiArPiBJIHRoaW5rIHdlIHNob3Vs
ZCBjYWxsIGEgcXVpY2sgdm90ZSB0byBzZXR0bGUgdGhlIGlzc3VlCj4gKwo+ICtPdXIgZ292ZXJu
YW5jZSBwcm92aWRlcyB0aGUgbWVjaGFuaXNtcyBvZiBbaW5mb3JtYWwgdm90ZXNdKGh0dHBzOi8v
eGVucHJvamVjdC5vcmcvZGV2ZWxvcGVycy9nb3Zlcm5hbmNlLyNpbmZvcm1hbC12b3Rlcy1vci1z
dXJ2ZXlzKSBvcgo+ICtbbGF6eSB2b3RpbmddKGh0dHBzOi8veGVucHJvamVjdC5vcmcvZGV2ZWxv
cGVycy9nb3Zlcm5hbmNlLyNsYXp5Y29uc2Vuc3VzKSB3aGljaCBsZW5kCj4gK3RoZW1zZWx2ZXMg
d2VsbCB0byByZXNvbHZlIHN1Y2ggaXNzdWVzLgo+ICsKPiArIyMgSXNzdWU6IFNtYWxsIGZ1bmN0
aW9uYWwgaXNzdWVzCj4gKwo+ICtUaGUgbW9zdCBjb21tb24gYXJlYSBvZiBkaXNhZ3JlZW1lbnRz
IHdoaWNoIGhhcHBlbiBpbiBjb2RlIHJldmlld3MsIGFyZSBkaWZmZXJpbmcKPiArb3BpbmlvbnMg
b24gd2hldGhlciBzbWFsbCBmdW5jdGlvbmFsIGlzc3VlcyBpbiBhIHBhdGNoIHNlcmllcyBoYXZl
IHRvIGJlIHJlc29sdmVkIG9yCj4gK25vdCBiZWZvcmUgdGhlIGNvZGUgaXMgcmVhZHkgdG8gYmUg
c3VibWl0dGVkLiBTdWNoIGRpc2FncmVlbWVudHMgYXJlIHR5cGljYWxseSBjYXVzZWQKPiArYnkg
ZGlmZmVyZW50IGV4cGVjdGF0aW9ucyByZWxhdGVkIHRvIHRoZSBsZXZlbCBvZiBwZXJmZWN0aW9u
IGEgcGF0Y2ggc2VyaWVzIG5lZWRzIHRvIGZ1bGZpbAo+ICtiZWZvcmUgaXQgY2FuIGJlIGNvbnNp
ZGVyZWQgcmVhZHkgdG8gYmUgY29tbWl0dGVkLgo+ICsKPiArVG8gZXhwbGFpbiB0aGlzIGJldHRl
ciwgSSBhbSBnb2luZyB0byB1c2UgdGhlIGFuYWxvZ3kgb2Ygc29tZSBidWlsZGluZyB3b3JrIHRo
YXQgaGFzCj4gK2JlZW4gcGVyZm9ybWVkIGF0IHlvdXIgaG91c2UuIExldCdzIHNheSB0aGF0IHlv
dSBoYXZlIGEgbmV3IGJhdGhyb29tIGluc3RhbGxlZC4KPiArQmVmb3JlIHBheWluZyB5b3VyIGJ1
aWxkZXIgdGhlIGxhc3QgaW5zdGFsbWVudCwgeW91IHBlcmZvcm0gYW4gaW5zcGVjdGlvbiBhbmQg
eW91IGZpbmQKPiAraXNzdWVzIHN1Y2ggYXMKPiArKiBUaGUgc2VhbHMgYXJvdW5kIHRoZSBiYXRo
dHViIGFyZSBub3QgcGVyZmVjdGx5IGV2ZW50CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeIGV2ZW4KCj4gKyogV2hlbiB5b3Ugb3BlbiB0aGUgdGFw
LCB0aGUgcGx1bWJpbmcgaW5pdGlhbGx5IG1ha2VzIHNvbWUgbG91ZCBub2lzZQo+ICsqIFRoZSBz
aG93ZXIgbWl4ZXIgaGFzIGJlZW4gaW5zdGFsbGVkIHRoZSB3cm9uZyB3YXkgYXJvdW5kCj4gKwo+
ICtJbiBhbGwgdGhlc2UgY2FzZXMsIHRoZSBiYXRocm9vbSBpcyBwZXJmZWN0bHkgZnVuY3Rpb25h
bCwgYnV0IG5vdCBwZXJmZWN0LiBBdCB0aGlzIHBvaW50Cj4gK3lvdSBoYXZlIHRoZSBjaG9pY2Ug
dG8gdHJ5IGFuZCBnZXQgYWxsIHRoZSBpc3N1ZXMgYWRkcmVzc2VkLCB3aGljaCBpbiB0aGUgZXhh
bXBsZSBvZgo+ICt0aGUgc2hvd2VyIG1peGVyIG1heSByZXF1aXJlIHNpZ25pZmljYW50IHJlLXdv
cmsgYW5kIHBvdGVudGlhbGx5IHB1c2gtYmFjayBmcm9tIHlvdXIKPiArYnVpbGRlci4gWW91IG1h
eSBoYXZlIHRvIHJlZmVyIHRvIHRoZSBpbml0aWFsIHN0YXRlbWVudCBvZiB3b3JrLCBidXQgaXQg
dHVybnMgb3V0IGl0IGRvZXMKPiArbm90IGNvbnRhaW4gc3VmZmljaWVudCBpbmZvcm1hdGlvbiB0
byBhc2NlcnRhaW4gd2hldGhlciB5b3VyIGJ1aWxkZXIgaGFkIGNvbW1pdHRlZCB0bwo+ICt0aGUg
bGV2ZWwgb2YgcXVhbGl0eSB5b3Ugd2VyZSBleHBlY3RpbmcuCj4gKwo+ICtTaW1pbGFyIHNpdHVh
dGlvbnMgaGFwcGVuIGluIGNvZGUgcmV2aWV3cyB2ZXJ5IGZyZXF1ZW50bHkgYW5kIGNhbiBsZWFk
IHRvIGEgbG9uZwo+ICtkaXNjdXNzaW9uIGJlZm9yZSBpdCBjYW4gYmUgcmVzb2x2ZWQuIFRoZSBt
b3N0IGltcG9ydGFudCB0aGluZyBpcyB0byAqKmlkZW50aWZ5KioKPiArYSBkaXNhZ3JlZW1lbnQg
YXMgc3VjaCBlYXJseSBhbmQgdGhlbiBjYWxsIGl0IG91dC4gVGlwcyBvbiBob3cgdG8gZG8gdGhp
cywgY2FuIGJlIGZvdW5kCj4gK1toZXJlXShjb21tdW5pY2F0aW9uLXByYWN0aWNlLm1kI01pc3Vu
ZGVyc3RhbmRpbmdzKS4KPiArCj4gK0F0IHRoaXMgcG9pbnQsIHlvdSB3aWxsIHVuZGVyc3RhbmQg
d2h5IHlvdSBoYXZlIHRoZSBkaXNhZ3JlZW1lbnQsIGJ1dCBub3QgbmVjZXNzYXJpbHkKPiArYWdy
ZWVtZW50IG9uIGhvdyB0byBtb3ZlIGZvcndhcmQuIEFuIGVhc3kgZml4IHdvdWxkIGJlIHRvIGFn
cmVlIHRvIHN1Ym1pdCB0aGUgY2hhbmdlCj4gK2FzIGl0IGlzIGFuZCBmaXggaXQgaW4gZnV0dXJl
LiBJbiBhIGNvcnBvcmF0ZSBzb2Z0d2FyZSBlbmdpbmVlcmluZyBlbnZpcm9ubWVudCB0aGlzIGlz
IHRoZQo+ICttb3N0IGxpa2VseSBvdXRjb21lLCBidXQgaW4gb3BlbiBzb3VyY2UgY29tbXVuaXRp
ZXMgYWRkaXRpb25hbCBjb25jZXJucyBoYXZlIHRvIGJlCj4gK2NvbnNpZGVyZWQuCj4gKyogQ29k
ZSByZXZpZXdlcnMgZnJlcXVlbnRseSBoYXZlIGJlZW4gaW4gdGhpcyBzaXR1YXRpb24gYmVmb3Jl
IHdpdGggdGhlIG1vc3QgY29tbW9uCj4gKyAgb3V0Y29tZSB0aGF0IHRoZSBpc3N1ZSBpcyB0aGVu
IG5ldmVyIGZpeGVkLiBCeSBhY2NlcHRpbmcgdGhlIGNoYW5nZSwgdGhlIHJldmlld2Vycwo+ICsg
IGhhdmUgbm8gbGV2ZXJhZ2UgdG8gZml4IHRoZSBpc3N1ZSBhbmQgbWF5IGhhdmUgdG8gc3BlbmQg
ZWZmb3J0IGZpeGluZyB0aGUgaXNzdWUKPiArICB0aGVtc2VsdmVzIGluIGZ1dHVyZSBhcyBpdCBt
YXkgaW1wYWN0IHRoZSBwcm9kdWN0IHRoZXkgYnVpbHQgb24gdG9wIG9mIHRoZSBjb2RlLgo+ICsq
IENvbnZlcnNlbHksIGEgcmV2aWV3ZXIgbWF5IGJlIGFza2luZyB0aGUgYXV0aG9yIHRvIG1ha2Ug
dG9vIG1hbnkgY2hhbmdlcyBvZiB0aGlzCj4gKyAgdHlwZSB3aGljaCB1bHRpbWF0ZWx5IG1heSBs
ZWFkIHRoZSBhdXRob3IgdG8gbm90IGNvbnRyaWJ1dGUgdG8gdGhlIHByb2plY3QgYWdhaW4uCj4g
KyogQW4gYXV0aG9yLCB3aGljaCBjb25zaXN0ZW50bHkgZG9lcyBub3QgYWRkcmVzcyAqKmFueSoq
IG9mIHRoZXNlIGlzc3VlcyBtYXkgZW5kIHVwCj4gKyAgZ2V0dGluZyBhIGJhZCByZXB1dGF0aW9u
IGFuZCBtYXkgZmluZCBmdXR1cmUgY29kZSByZXZpZXdzIG1vcmUgZGlmZmljdWx0Lgo+ICsqIEFu
IGF1dGhvciB3aGljaCBhbHdheXMgYWRkcmVzc2VzICoqYWxsKiogb2YgdGhlc2UgaXNzdWVzIG1h
eSBlbmQgdXAgZ2V0dGluZyBpbnRvCj4gKyAgZGlmZmljdWx0aWVzIHdpdGggdGhlaXIgZW1wbG95
ZXIsIGFzIHRoZXkgYXJlIHRvbyBzbG93IGdldHRpbmcgY29kZSB1cHN0cmVhbWVkLgo+ICsKPiAr
Tm9uZSBvZiB0aGVzZSBvdXRjb21lcyBhcmUgZ29vZCwgc28gdWx0aW1hdGVseSBhIGJhbGFuY2Ug
aGFzIGJlZW4gZm91bmQuIEF0IHRoZSBlbmQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiB5b3UgbWVhbiAiaGFzIHRvIGJlIGZvdW5k
PyIKCgo+ICtvZiB0aGUgZGF5LCB0aGUgc29sdXRpb24gc2hvdWxkIGZvY3VzIG9uIHdoYXQgaXMg
YmVzdCBmb3IgdGhlIGNvbW11bml0eSwgd2hpY2ggbWF5Cj4gK21lYW4gYXNraW5nIGZvciBhbiBp
bmRlcGVuZGVudCBvcGluaW9uIGFzIG91dGxpbmVkIGluIHRoZSBuZXh0IHNlY3Rpb24uCgpJIHRo
aW5rIHRoZXJlIGlzIHNvbWV0aGluZyBlbHNlIHdlIHNob3VsZCBzYXkgb24gdGhpcyB0b3BpYy4g
VGhlcmUgaXMgYQpjYXRlZ29yeSBvZiB0aGluZ3Mgd2hpY2ggY291bGQgYmUgZG9uZSBpbiBtdWx0
aXBsZSB3YXlzIGFuZCBpdCBpcyBub3QKb3ZlcnRseSBvYnZpb3VzIHdoaWNoIG9uZSBpcyBiZXN0
LiBJdCBpcyBkb25lIHRvIHRoZSBtYWludGFpbmVyIGFuZCB0aGUKYXV0aG9yIHBlcnNvbmFsIHN0
eWxlcy4gSXQgaXMgZWFzeSB0byBkaXNhZ3JlZSBvbiB0aGF0LgoKSSB0aGluayBhIGdvb2QgcmVj
b21tZW5kYXRpb24gd291bGQgYmUgZm9yIHRoZSBjb250cmlidXRvciB0byB0cnkgdG8KZm9sbG93
IHRoZSBtYWludGFpbmVycyByZXF1ZXN0cywgZXZlbiBpZiB0aGV5IGNvdWxkIGJlIGNvbnNpZGVy
ZWQKInN0eWxlIiwgdHJ1c3RpbmcgdGhlaXIgZXhwZXJpZW5jZSBvbiB0aGUgbWF0dGVyLiBBbmQg
YSBnb29kCnJlY29tbWVuZGF0aW9uIGZvciB0aGUgbWFpbnRhaW5lciB3b3VsZCBiZSB0byB0cnkg
dG8gbGV0IHRoZSBjb250cmlidXRvcgpoYXZlIGZyZWVkb20gb2YgaW1wbGVtZW50YXRpb24gY2hv
aWNlIG9uIHRoaW5ncyB0aGF0IGRvbid0IG1ha2UgYQpzaWduaWZpY2FudCBkaWZmZXJlbmNlLgoK
Cj4gKyMjIFJlc29sdXRpb246IEFza2luZyBmb3IgYW4gaW5kZXBlbmRlbnQgb3Bpbmlvbgo+ICsK
PiArTW9zdCBkaXNhZ3JlZW1lbnRzIGNhbiBiZSBzZXR0bGVkIGJ5Cj4gKyogQXNraW5nIGFub3Ro
ZXIgbWFpbnRhaW5lciBvciBjb21taXR0ZXIgdG8gcHJvdmlkZSBhbiBpbmRlcGVuZGVudCBvcGlu
aW9uIG9uIHRoZQo+ICsgIHNwZWNpZmljIGlzc3VlIGluIHB1YmxpYyB0byBoZWxwIHJlc29sdmUg
aXQKPiArKiBGYWlsaW5nIHRoaXMgYW4gaXNzdWUgY2FuIGJlIGVzY2FsYXRlZCB0byB0aGUgcHJv
amVjdCBsZWFkZXJzaGlwIHRlYW0sIHdoaWNoIGlzCj4gKyAgZXhwZWN0ZWQgdG8gYWN0IGFzIHJl
ZmVyZWUgYW5kIG1ha2UgYSBkZWNpc2lvbiBvbiBiZWhhbGYgb2YgdGhlIGNvbW11bml0eQo+ICsK
PiArSWYgeW91IGZlZWwgdW5jb21mb3J0YWJsZSB3aXRoIHRoaXMgYXBwcm9hY2gsIHlvdSBtYXkg
YWxzbyBjb250YWN0Cj4gK21lZGlhdGlvbkB4ZW5wcm9qZWN0Lm9yZyB0byBnZXQgYWR2aWNlLiBT
ZWUgb3VyIFtDb21tdW5pY2F0aW9uIEd1aWRlXShjb21tdW5pY2F0aW9uLWd1aWRlLm1kKQo+ICtm
b3IgbW9yZSBpbmZvcm1hdGlvbi4KPiArCj4gKyMjIERlY2lzaW9uIG1ha2luZyBhbmQgY29uZmxp
Y3QgcmVzb2x1dGlvbiBpbiBvdXIgZ292ZXJuYW5jZQo+ICsKPiArT3VyIFtnb3Zlcm5hbmNlXSho
dHRwczovL3hlbnByb2plY3Qub3JnL2RldmVsb3BlcnMvZ292ZXJuYW5jZS8jZGVjaXNpb25zKSBj
b250YWlucwo+ICtzZXZlcmFsIHByb3ZlbiBtZWNoYW5pc21zIHRvIGhlbHAgd2l0aCBkZWNpc2lv
biBtYWtpbmcgYW5kIGNvbmZsaWN0IHJlc29sdXRpb24uCj4gKwo+ICtTZWUKPiArKiBbRXhwcmVz
c2luZyBhZ3JlZW1lbnQgYW5kIGRpc2FncmVlbWVudF0oaHR0cHM6Ly94ZW5wcm9qZWN0Lm9yZy9k
ZXZlbG9wZXJzL2dvdmVybmFuY2UvI2V4cHJlc3NpbmdvcGluaW9uKQo+ICsqIFtMYXp5IGNvbnNl
bnN1cyAvIExhenkgdm90aW5nXShodHRwczovL3hlbnByb2plY3Qub3JnL2RldmVsb3BlcnMvZ292
ZXJuYW5jZS8jbGF6eWNvbnNlbnN1cykKPiArKiBbSW5mb3JtYWwgdm90ZXMgb3Igc3VydmV5c10o
aHR0cHM6Ly94ZW5wcm9qZWN0Lm9yZy9kZXZlbG9wZXJzL2dvdmVybmFuY2UvI2luZm9ybWFsLXZv
dGVzLW9yLXN1cnZleXMpCj4gKyogW0xlYWRlcnNoaXAgdGVhbSBkZWNpc2lvbnNdKGh0dHBzOi8v
eGVucHJvamVjdC5vcmcvZGV2ZWxvcGVycy9nb3Zlcm5hbmNlLyNsZWFkZXJzaGlwKQo+ICsqIFtD
b25mbGljdCByZXNvbHV0aW9uXShodHRwczovL3hlbnByb2plY3Qub3JnL2RldmVsb3BlcnMvZ292
ZXJuYW5jZS8jY29uZmxpY3QpCj4gLS0gCj4gMi4xMy4wCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E94E6CE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 13:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heHO2-0007WG-Iv; Fri, 21 Jun 2019 11:07:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YUw3=UU=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1heHO1-0007WB-52
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 11:07:17 +0000
X-Inumbo-ID: ba40063c-9414-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ba40063c-9414-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 11:07:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4A869C05001F;
 Fri, 21 Jun 2019 11:07:10 +0000 (UTC)
Received: from redhat.com (ovpn-112-66.ams2.redhat.com [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A44119C4F;
 Fri, 21 Jun 2019 11:07:07 +0000 (UTC)
Date: Fri, 21 Jun 2019 12:07:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190621110704.GI11706@redhat.com>
References: <20190621105441.3025-1-anthony.perard@citrix.com>
 <20190621105441.3025-2-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190621105441.3025-2-anthony.perard@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 21 Jun 2019 11:07:10 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 1/2] Revert xen/io/ring.h of "Clean up a
 few header guard symbols"
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6NTQ6NDBBTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhpcyByZXZlcnRzIGNoYW5nZXMgdG8gaW5jbHVkZS9ody94ZW4vaW8vcmluZy5o
IGZyb20gY29tbWl0Cj4gMzc2NzdkN2RiMzlhM2MyNTBhZDY2MWQwMGZiN2MzYjU5ZDA0N2IxZi4K
PiAKPiBGb2xsb3dpbmcgMzc2NzdkN2RiMyAiQ2xlYW4gdXAgYSBmZXcgaGVhZGVyIGd1YXJkIHN5
bWJvbHMiLCBRRU1VIHN0YXJ0Cj4gdG8gZmFpbCB0byBidWlsZDoKPiAKPiBJbiBmaWxlIGluY2x1
ZGVkIGZyb20gfi94ZW4vdG9vbHMvLi4vdG9vbHMvaW5jbHVkZS94ZW4vaW8vYmxraWYuaDozMTow
LAo+ICAgICAgICAgICAgICAgICAgZnJvbSB+L3hlbi90b29scy9xZW11LXhlbi1kaXIvaHcvYmxv
Y2sveGVuX2Jsa2lmLmg6NSwKPiAgICAgICAgICAgICAgICAgIGZyb20gfi94ZW4vdG9vbHMvcWVt
dS14ZW4tZGlyL2h3L2Jsb2NrL3hlbi1ibG9jay5jOjIyOgo+IH4veGVuL3Rvb2xzLy4uL3Rvb2xz
L2luY2x1ZGUveGVuL2lvL3JpbmcuaDo2ODowOiBlcnJvcjogIl9fQ09OU1RfUklOR19TSVpFIiBy
ZWRlZmluZWQgWy1XZXJyb3JdCj4gICNkZWZpbmUgX19DT05TVF9SSU5HX1NJWkUoX3MsIF9zeikg
XAo+IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSB+L3hlbi90b29scy9xZW11LXhlbi1kaXIvaHcv
YmxvY2sveGVuX2Jsa2lmLmg6NDowLAo+ICAgICAgICAgICAgICAgICAgZnJvbSB+L3hlbi90b29s
cy9xZW11LXhlbi1kaXIvaHcvYmxvY2sveGVuLWJsb2NrLmM6MjI6Cj4gfi94ZW4vdG9vbHMvcWVt
dS14ZW4tZGlyL2luY2x1ZGUvaHcveGVuL2lvL3JpbmcuaDo2NjowOiBub3RlOiB0aGlzIGlzIHRo
ZSBsb2NhdGlvbiBvZiB0aGUgcHJldmlvdXMgZGVmaW5pdGlvbgo+ICAjZGVmaW5lIF9fQ09OU1Rf
UklOR19TSVpFKF9zLCBfc3opIFwKPiAKPiBUaGUgaXNzdWUgaXMgdGhhdCBzb21lIHB1YmxpYyB4
ZW4gaGVhZGVycyBoYXZlIGJlZW4gaW1wb3J0ZWQgKGJ5Cj4gZjY1ZWFkYjYzOSAieGVuOiBpbXBv
cnQgcmluZy5oIGZyb20geGVuIikgYnV0IG5vdCBhbGwuIFdpdGggdGhlIGNoYW5nZQo+IGluIHRo
ZSBndWFyZHMgc3ltYm9sZSwgdGhlIHJpbmcuaCBoZWFkZXIgc3RhcnQgdG8gYmUgaW1wb3J0ZWQg
dHdpY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0
LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjM6Cj4gICAgIC0gbmV3IHBhdGNoLCByZXBs
YWNlICJ4ZW46IEZpeCBidWlsZCB3aXRoIHB1YmxpYyBoZWFkZXJzIiBmcm9tIHByZXZpb3VzCj4g
ICAgICAgcGF0Y2ggc2VyaWVzIHZlcnNpb24KPiAgICAgLSBSZXZlcnQgcHJvYmxlbWF0aWMgY2hh
bmdlIGluc3RlYWQuCj4gCj4gIGluY2x1ZGUvaHcveGVuL2lvL3JpbmcuaCB8IDYgKysrLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpSZXZpZXdl
ZC1ieTogRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KCgpSZWdhcmRz
LApEYW5pZWwKLS0gCnw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBzOi8v
d3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fAp8OiBodHRwczovL2xpYnZpcnQub3Jn
ICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5jb20gOnwK
fDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmluc3Rh
Z3JhbS5jb20vZGJlcnJhbmdlIDp8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs

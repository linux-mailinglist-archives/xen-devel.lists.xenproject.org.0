Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9944A09A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 14:17:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdD0N-0006ys-Nr; Tue, 18 Jun 2019 12:14:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C0HW=UR=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1hdD0L-0006yn-T6
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 12:14:25 +0000
X-Inumbo-ID: 9c18aebc-91c2-11e9-8236-d7f1d5e940f1
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c18aebc-91c2-11e9-8236-d7f1d5e940f1;
 Tue, 18 Jun 2019 12:14:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AF2C620264;
 Tue, 18 Jun 2019 12:14:13 +0000 (UTC)
Received: from redhat.com (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDFD81001DCB;
 Tue, 18 Jun 2019 12:14:11 +0000 (UTC)
Date: Tue, 18 Jun 2019 13:14:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190618121408.GM28525@redhat.com>
References: <20190618112341.513-1-anthony.perard@citrix.com>
 <20190618112341.513-2-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618112341.513-2-anthony.perard@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 18 Jun 2019 12:14:13 +0000 (UTC)
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v2 1/4] xen: Fix build with
 public headers
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTI6MjM6MzhQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gRm9sbG93aW5nIDM3Njc3ZDdkYjMgIkNsZWFuIHVwIGEgZmV3IGhlYWRlciBndWFy
ZCBzeW1ib2xzIiwgUUVNVSBzdGFydAo+IHRvIGZhaWwgdG8gYnVpbGQ6Cj4gCj4gSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIH4veGVuL3Rvb2xzLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2lvL2Jsa2lmLmg6
MzE6MCwKPiAgICAgICAgICAgICAgICAgIGZyb20gfi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3
L2Jsb2NrL3hlbl9ibGtpZi5oOjUsCj4gICAgICAgICAgICAgICAgICBmcm9tIH4veGVuL3Rvb2xz
L3FlbXUteGVuLWRpci9ody9ibG9jay94ZW4tYmxvY2suYzoyMjoKPiB+L3hlbi90b29scy8uLi90
b29scy9pbmNsdWRlL3hlbi9pby9yaW5nLmg6Njg6MDogZXJyb3I6ICJfX0NPTlNUX1JJTkdfU0la
RSIgcmVkZWZpbmVkIFstV2Vycm9yXQo+ICAjZGVmaW5lIF9fQ09OU1RfUklOR19TSVpFKF9zLCBf
c3opIFwKPiAKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gfi94ZW4vdG9vbHMvcWVtdS14ZW4tZGly
L2h3L2Jsb2NrL3hlbl9ibGtpZi5oOjQ6MCwKPiAgICAgICAgICAgICAgICAgIGZyb20gfi94ZW4v
dG9vbHMvcWVtdS14ZW4tZGlyL2h3L2Jsb2NrL3hlbi1ibG9jay5jOjIyOgo+IH4veGVuL3Rvb2xz
L3FlbXUteGVuLWRpci9pbmNsdWRlL2h3L3hlbi9pby9yaW5nLmg6NjY6MDogbm90ZTogdGhpcyBp
cyB0aGUgbG9jYXRpb24gb2YgdGhlIHByZXZpb3VzIGRlZmluaXRpb24KPiAgI2RlZmluZSBfX0NP
TlNUX1JJTkdfU0laRShfcywgX3N6KSBcCj4gCj4gVGhlIGlzc3VlIGlzIHRoYXQgc29tZSBwdWJs
aWMgeGVuIGhlYWRlcnMgaGF2ZSBiZWVuIGltcG9ydGVkIChieQo+IGY2NWVhZGI2MzkgInhlbjog
aW1wb3J0IHJpbmcuaCBmcm9tIHhlbiIpIGJ1dCBub3QgYWxsLiBXaXRoIHRoZSBjaGFuZ2UKPiBp
biB0aGUgZ3VhcmRzIHN5bWJvbGUsIHRoZSByaW5nLmggaGVhZGVyIHN0YXJ0IHRvIGJlIGltcG9y
dGVkIHR3aWNlLgoKQWgsIHNvIHRoZSBpbmNsdWRlL2h3L3hlbi9pby9yaW5nLmggZmlsZSBpbiB0
cmVlIGlzIGEgY29weSBvZgovdXNyL2luY2x1ZGUveGVuL2lvL3JpbmcuaCBmcm9tIHhlbi1kZXZl
bC4gIFByZXZpb3VzbHkgYm90aAp0aGVzZSB1c2VkICIjaWZuZGVmIF9fWEVOX1BVQkxJQ19JT19S
SU5HX0hfXyIuIEFmdGVyCnRoZSBoZWFkZXIgZ3VhcmQgY2xlYW51cCBpbiAzNzY3N2Q3ZGIzLCBv
dXIgbG9jYWwgY29weSB1c2VkIGEKZGlmZmVyZW50IGhlYWRlciBndWFyZCBmcm9tIHRoZSBpbnN0
YWxsZWQgY29weSAmIHRodXMgd2UncmUKbm90IHByb3RlY3RlZCBmcm9tIGR1YWwgaW5jbHVzaW9u
LgoKSU1ITyB0aGUgcmlnaHQgc29sdXRpb25zIGhlcmUgYXJlIGVpdGhlcgoKIC0gRG9uJ3QgY29w
eSBwdWJsaWMgWGVuIGhlYWRlcnMgaW50byBvdXIgdHJlZQogLSBLZWVwIG91ciBYZW4gaGVhZGVy
IGNvcGllcyBpZGVudGljYWwgdG8gdGhlIG9yaWdpbmFscwoKSW1wb3J0aW5nIHB1YmxpYyBoZWFk
ZXJzIGFuZCB0aGVuIGNoYW5naW5nIHRoZW0gbG9jYWxseSBpcyB0aGUgd29yc3QKdGhpbmcgdG8g
ZG8uIFdpdGggdGhhdCBpbiBtaW5kIEkgdGhpbmsgd2Ugc2hvdWxkIHJldmVydCB0aGUgcGFydCBv
Zgpjb21taXQgMzc2NzdkN2RiMyB0aGF0IHRvdWNoZWQgdGhlIGltcG9ydGVkIFhlbiBoZWFkZXJz
LgoKClJlZ2FyZHMsCkRhbmllbAotLSAKfDogaHR0cHM6Ly9iZXJyYW5nZS5jb20gICAgICAtby0g
ICAgaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8Cnw6IGh0dHBzOi8v
bGlidmlydC5vcmcgICAgICAgICAtby0gICAgICAgICAgICBodHRwczovL2ZzdG9wMTM4LmJlcnJh
bmdlLmNvbSA6fAp8OiBodHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAtby0gICAgaHR0cHM6
Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFuZ2UgOnwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=

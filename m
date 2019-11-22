Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007A5107523
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 16:46:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYB5R-0000rC-0C; Fri, 22 Nov 2019 15:43:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Q7nr=ZO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iYB5Q-0000r6-0m
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 15:43:08 +0000
X-Inumbo-ID: c68d9944-0d3e-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c68d9944-0d3e-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 15:43:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4A154B42D;
 Fri, 22 Nov 2019 15:43:05 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>,
 Oleksandr Grytsov <al1img@gmail.com>
References: <20191121181300.6497-1-al1img@gmail.com>
 <20191121181300.6497-2-al1img@gmail.com>
 <20191122151846.GG1425@perard.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <673d7677-57c6-8d08-8b7d-d8728b90035e@suse.com>
Date: Fri, 22 Nov 2019 16:43:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191122151846.GG1425@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/3] libxl: introduce new backend type
 VINPUT
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
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wl@xen.org,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMTkgMTY6MTgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIFRodSwgTm92IDIx
LCAyMDE5IGF0IDA4OjEyOjU4UE0gKzAyMDAsIE9sZWtzYW5kciBHcnl0c292IHdyb3RlOgo+PiBG
cm9tOiBPbGVrc2FuZHIgR3J5dHNvdiA8b2xla3NhbmRyX2dyeXRzb3ZAZXBhbS5jb20+Cj4+Cj4+
IFRoZXJlIGFyZSB0d28ga2luZCBvZiBWS0JEIGRldmljZXM6IHdpdGggUUVNVSBiYWNrZW5kIGFu
ZCB1c2VyIHNwYWNlIFBWCj4+IGJhY2tlbmQuIEluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gdGhl
eSBjYW4ndCBiZSBkaXN0aW5ndWlzaGVkIGFzIGJvdGggdXNlCj4+IFZLQkQgYmFja2VuZCB0eXBl
LiBBcyByZXN1bHQsIHVzZXIgc3BhY2UgUFYgS0JEIGJhY2tlbmQgaXMgc3RhcnRlZCBhbmQKPj4g
c3RvcHBlZCBhcyBRRU1VIGJhY2tlbmQuIFRoaXMgY29tbWl0IGFkZHMgbmV3IGRldmljZSBraW5k
IFZJTlBVVCB0byBiZQo+PiB1c2VkIGFzIGJhY2tlbmQgdHlwZSBmb3IgdXNlciBzcGFjZSBQViBL
QkQgYmFja2VuZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtz
YW5kcl9ncnl0c292QGVwYW0uY29tPgo+PiBBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Cj4gCj4gVGhhdCBwYXRjaCByZW1vdmVzIHRoZSAiYmFja2VuZC10
eXBlIiBub2RlIGZyb20geGVuc3RvcmUgYnV0IGl0IHdhc24ndAo+IHBhcnQgb2YgdGhlIGFwaSAo
a2JkaWYuaCkgYW5kIHFlbXUgZG9lc24ndCByZWFkLCBpdCBzbyBJIGd1ZXNzIHRoYXQncwo+IGZp
bmU6Cj4gCj4gQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

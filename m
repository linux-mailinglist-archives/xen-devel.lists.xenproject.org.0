Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F20CAE7521
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 16:30:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP6we-0000dr-9f; Mon, 28 Oct 2019 15:28:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vp8f=YV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iP6wd-0000dk-8P
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 15:28:35 +0000
X-Inumbo-ID: 9a63628c-f997-11e9-94fa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a63628c-f997-11e9-94fa-12813bfff9fa;
 Mon, 28 Oct 2019 15:28:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67721AFBD;
 Mon, 28 Oct 2019 15:28:33 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <a9c29042189f2f862ffc0ad9af732afb254bbb83.1572045542.git.ppircalabu@bitdefender.com>
 <20191028143313.GA1162@perard.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6e9c4e1b-ef36-52ff-5401-7fd5269ab370@suse.com>
Date: Mon, 28 Oct 2019 16:28:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028143313.GA1162@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] tools/ocaml: Fix build error with Arch Linux
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMTkgMTU6MzMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIFNhdCwgT2N0IDI2
LCAyMDE5IGF0IDAyOjIxOjEwQU0gKzAzMDAsIFBldHJlIFBpcmNhbGFidSB3cm90ZToKPj4gZ2Nj
IChHQ0MpIDkuMi4wIGNvbXBsYWluczoKPj4KPj4geGVudG9vbGxvZ19zdHVicy5jOiBJbiBmdW5j
dGlvbiDigJhzdHViX3h0bF9vY2FtbF92bWVzc2FnZeKAmToKPj4geGVudG9vbGxvZ19zdHVicy5j
OjkzOjE2OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gZGlzY2FyZHMg4oCYY29uc3TigJkgcXVhbGlm
aWVyIGZyb20gcG9pbnRlciB0YXJnZXQgdHlwZSBbLVdlcnJvcj1kaXNjYXJkZWQtcXVhbGlmaWVy
c10KPj4gICAgIDkzIHwgIHZhbHVlICpmdW5jID0gY2FtbF9uYW1lZF92YWx1ZSh4dGwtPnZtZXNz
YWdlX2NiKSA7Cj4+ICAgICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAK
PiBIaSBQZXRyZSwKPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaCwgaXQgbG9va3MgZmluZS4gSG93
ZXZlciBpdCB3b3VsZCBiZSBuaWNlIHRvIGFkZAo+IHNvbWUgbW9yZSBjb250ZXh0IG9uIHdoeSBn
Y2MgY29tcGxhaW5zLiBBIHF1aWNrIHNlYXJjaCBzZWVtcyB0byBsZWFkIHRvCj4gaHR0cHM6Ly9n
aXRodWIuY29tL29jYW1sL29jYW1sL2NvbW1pdC80ZjAzYTE0NjdkMjljZjU4N2RmNWExOTE4MzBm
MTUyNTUwNmVlMGUzCj4gICAgICAiTWFrZSBjYW1sX25hbWVkX3ZhbHVlIHJldHVybiBhIGNvbnN0
IHZhbHVlKiIKPiB3aGljaCBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiBjYW1sX25hbWVkX3ZhbHVl
Lgo+IAo+IFdpdGggdGhlIGNvbW1pdCBtZXNzYWdlIGNoYW5nZWQ6Cj4gUmV2aWV3ZWQtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IENDIErDvHJnZW4s
IEkgdGhpbmsgaXQgd291bGQgYmUgbmljZSB0byBoYXZlIHRoZSBidWlsZCBmaXggaW4gdGhlCj4g
cmVsZWFzZS4KPiAKPiBDaGVlcnMuCj4gCj4gCj4+IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNh
bGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A2016EADB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 17:09:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6cij-0007KP-6J; Tue, 25 Feb 2020 16:06:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6cih-0007KK-E2
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 16:06:03 +0000
X-Inumbo-ID: b749ded0-57e8-11ea-932d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b749ded0-57e8-11ea-932d-12813bfff9fa;
 Tue, 25 Feb 2020 16:06:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3FDA5AC1E;
 Tue, 25 Feb 2020 16:06:00 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-147522-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c59dd08d-6f39-a117-e427-ae7271882a5e@suse.com>
Date: Tue, 25 Feb 2020 17:06:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <osstest-147522-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 147522: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDIuMjAyMCAxNDozNSwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGZsaWdo
dCAxNDc1MjIgeGVuLXVuc3RhYmxlIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NzUyMi8KPiAKPiBSZWdyZXNzaW9ucyA6LSgK
PiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNs
dWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hbWQ2NC1pMzg2LXFl
bXV0LXJoZWw2aHZtLWFtZCAxMiBndWVzdC1zdGFydC9yZWRoYXQucmVwZWF0IGZhaWwgUkVHUi4g
dnMuIDE0NzI5OAoKVGhpcyBpcyBhIHJlY3VycmluZyBmYWlsdXJlIChhdCBsZWFzdCB0aGUgbGFz
dCB0aHJlZSBmbGlnaHRzKSwgYnV0CmdvaW5nIHRocm91Z2ggdGhlIGxvZ3MgSSBjYW4ndCByZWFs
bHkgc2VlIGEgcmVhc29uLiBUaGUgcG9pbnQgaW4KdGltZSB3aGVuIHRoZSBoaWNrdXAgb2NjdXJz
IGxvb2tzIHRvIGJlIGRpZmZlcmVudC4gSW4gZmxpZ2h0IDE0NzM5MgppcyB3YXMgZHVyaW5nIGd1
ZXN0IHNodXRkb3duLCBhcHBhcmVudGx5IHNvbWV3aGVyZSBpbiBzeXNmcyBjb2RlIGFzCmludm9r
ZWQgZnJvbSBVU0IgY29kZSwgd2hpbGUgaW4gdGhlIG90aGVyIHR3byBjYXNlcyB0aGluZ3Mgc3Rv
cHBlZAppbiB0aGUgbWlkZGxlIG9mIGEga2VybmVsIGJvb3QgbG9nIGxpbmUgKGFuZCBpbiB0aGlz
IGNhc2UgQ1BVMCBvZgp0aGUgZ3Vlc3Qgd2FzIGluIFZQRl9ibG9ja2VkX2luX3hlbiBzdGF0ZSwg
c3VnZ2VzdGluZyB0aGF0IGEKcmVxdWVzdCB0byBxZW11IGRpZG4ndCBnZXQgcmVwbGllZCB0bywg
b3IgdGhlIHJlcGx5IHdhcyBub3QKcHJvY2Vzc2VkIGNvcnJlY3RseSkuCgpEb2VzIGFueW9uZSBl
bHNlIGhhdmUgYW4gaWRlYT8gT3RoZXJ3aXNlIHdlIG1heSBuZWVkIHRvIGhhdmUgdG8Kd2FpdCBm
b3IgdGhlIGJpc2VjdG9yIHRvIGhhdmUgYSBnbywgYWxiZWl0IGl0cyBtaWxlYWdlIG1heSB2YXJ5
CndpdGggdGhlIGlzc3VlIGxvb2tpbmcgdG8gYXBwZWFyIGF0IHJhbmRvbSBwb2ludHMuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

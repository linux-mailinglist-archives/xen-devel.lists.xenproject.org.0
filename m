Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBE87C0A8
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 14:04:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsnHn-0005Ll-6J; Wed, 31 Jul 2019 12:00:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsnHm-0005Lf-04
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 12:00:50 +0000
X-Inumbo-ID: d522cd16-b38a-11e9-ab8d-87d82330bc80
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d522cd16-b38a-11e9-ab8d-87d82330bc80;
 Wed, 31 Jul 2019 12:00:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4557F344;
 Wed, 31 Jul 2019 05:00:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFB193F71F;
 Wed, 31 Jul 2019 05:00:45 -0700 (PDT)
To: Andre Przywara <andre.przywara@arm.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
References: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
 <6f94e7b0f1cfe98a640d7f9ff59f18f299fd0d7d.1564371527.git.stewart.hildebrand@dornerworks.com>
 <20190729170643.4ac19952@donnerap.cambridge.arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <28ba4890-65c4-8940-8dc4-03cbff91c02c@arm.com>
Date: Wed, 31 Jul 2019 13:00:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729170643.4ac19952@donnerap.cambridge.arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] ns16550: Add compatible string for
 Raspberry Pi 4
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyOS8wNy8yMDE5IDE3OjA2LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBPbiBNb24s
IDI5IEp1bCAyMDE5IDA5OjE5OjE5IC0wNDAwCj4gU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0
LmhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29tPiB3cm90ZToKPiAKPiBIaSwKPiAKPj4gUGVyIHRo
ZSBCQ00yODM1IHBlcmlwaGVyYWxzIGRhdGFzaGVldCBbMV0gcGFnZSAxMDoKPj4gIlRoZSBVQVJU
IGNvcmUgaXMgYnVpbGQgdG8gZW11bGF0ZSAxNjU1MCBiZWhhdmlvdXIgLi4uIFRoZSBpbXBsZW1l
bnRlZAo+PiBVQVJUIGlzIG5vdCBhIDE2NjUwIGNvbXBhdGlibGUgVUFSVCBIb3dldmVyIGFzIGZh
ciBhcyBwb3NzaWJsZSB0aGUKPj4gZmlyc3QgOCBjb250cm9sIGFuZCBzdGF0dXMgcmVnaXN0ZXJz
IGFyZSBsYWlkIG91dCBsaWtlIGEgMTY1NTAgVUFSVC4gQWwKPj4gMTY1NTAgcmVnaXN0ZXIgYml0
cyB3aGljaCBhcmUgbm90IHN1cHBvcnRlZCBjYW4gYmUgd3JpdHRlbiBidXQgd2lsbCBiZQo+PiBp
Z25vcmVkIGFuZCByZWFkIGJhY2sgYXMgMC4gQWxsIGNvbnRyb2wgYml0cyBmb3Igc2ltcGxlIFVB
UlQgcmVjZWl2ZS8KPj4gdHJhbnNtaXQgb3BlcmF0aW9ucyBhcmUgYXZhaWxhYmxlLiIKPj4KPj4g
QWRkaXRpb25hbGx5LCBMaW51eCB1c2VzIHRoZSA4MjUwLzE2NTUwIGRyaXZlciBmb3IgdGhlIGF1
eCBVQVJUIFsyXS4KPj4KPj4gVW5mb3J0dW5hdGVseSB0aGUgYnJjbSxiY20yODM1LWF1eC11YXJ0
IGRldmljZSB0cmVlIGJpbmRpbmcgZG9lc24ndAo+PiBoYXZlIHRoZSByZWctc2hpZnQgYW5kIHJl
Zy1pby13aWR0aCBwcm9wZXJ0aWVzIFszXS4gVGh1cywgdGhlIHJlZy1zaGlmdAo+PiBhbmQgcmVn
LWlvLXdpZHRoIHByb3BlcnRpZXMgYXJlIGluaGVyZW50IHByb3BlcnRpZXMgb2YgdGhpcyBVQVJU
Lgo+Pgo+PiBUaGFua3MgdG8gQW5kcmUgUHJ6eXdhcmEgZm9yIGNvbnRyaWJ1dGluZyB0aGUgcmVn
LXNoaWZ0IGFuZAo+PiByZWctaW8td2lkdGggc2V0dGluZyBzbmlwcGV0Lgo+Pgo+PiBJbiBteSB0
ZXN0aW5nLCBJIGhhdmUgcmVsaWVkIG9uIGVuYWJsZV91YXJ0PTEgYmVpbmcgc2V0IGluIGNvbmZp
Zy50eHQsCj4+IGEgY29uZmlndXJhdGlvbiBmaWxlIHJlYWQgYnkgdGhlIFJhc3BiZXJyeSBQaSdz
IGZpcm13YXJlLiBXaXRoCj4+IGVuYWJsZV91YXJ0PTEsIHRoZSBmaXJtd2FyZSBwZXJmb3JtcyBV
QVJUIGluaXRpYWxpemF0aW9uLgo+Pgo+PiBbMV0gaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkub3Jn
L2RvY3VtZW50YXRpb24vaGFyZHdhcmUvcmFzcGJlcnJ5cGkvYmNtMjgzNS9CQ00yODM1LUFSTS1Q
ZXJpcGhlcmFscy5wZGYKPj4gWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvdHJlZS9kcml2ZXJzL3R0eS9zZXJpYWwvODI1
MC84MjUwX2JjbTI4MzVhdXguYwo+PiBbM10gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9icmNtLGJjbTI4MzUtYXV4LXVh
cnQudHh0Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5o
aWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQW5kcmUgUHJ6eXdh
cmEgPGFuZHJlLnByenl3YXJhQGFybS5jb20+Cj4gVGVzdGVkLWJ5OiBBbmRyZSBQcnp5d2FyYSA8
YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

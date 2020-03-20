Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416CD18D3FE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 17:17:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFKFE-0002UC-Tx; Fri, 20 Mar 2020 16:11:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFKFD-0002U2-EV
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 16:11:35 +0000
X-Inumbo-ID: 77620366-6ac5-11ea-bdbb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77620366-6ac5-11ea-bdbb-12813bfff9fa;
 Fri, 20 Mar 2020 16:11:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B61A9AE3A;
 Fri, 20 Mar 2020 16:11:32 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <4c5af3e1-836f-4104-99a8-79755c8034e1@suse.com>
Date: Fri, 20 Mar 2020 17:11:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2] x86emul: suppress "not built" warning for
 test harness for run targets
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHJ1biogdGFyZ2V0cyBjYW4gYmUgdXNlZCB0byB0ZXN0IHdoYXRldmVyIHRoZSB0b29sIGNo
YWluIGlzIGNhcGFibGUKb2YgYnVpbGRpbmcsIGFzIGxvbmcgYXMgYXQgbGVhc3QgdGhlIG1haW4g
aGFybmVzcyBzb3VyY2UgZmlsZSBidWlsZHMuCkRvbid0IHByb2JlIHRoZSB0b29scyBjaGFpbiwg
aW4gcGFydGljdWxhciB0byBhdm9pZCBpc3N1aW5nIHRoZSB3YXJuaW5nLAppbiB0aGlzIGNhc2Uu
IFdoaWxlIGxvb2tpbmcgaW50byB0aGlzIEkgYWxzbyBub3RpY2VkIHRoZSB3b3JkaW5nIG9mIHRo
ZQpyZXNwZWN0aXZlIGNvbW1lbnQgaXNuJ3QgcXVpdGUgcmlnaHQsIHdoaWNoIHRoZXJlZm9yZSBn
ZXRzIGFsdGVyZWQgYXQKdGhlIHNhbWUgdGltZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnYyOiBBbHNvIHN1cHByZXNzIHRoZSBjb21waWxlci9h
c3NlbWJsZXIgcHJvYmluZyBpbiB0aGlzIGNhc2UuCgotLS0gYS90b29scy90ZXN0cy94ODZfZW11
bGF0b3IvTWFrZWZpbGUKKysrIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL01ha2VmaWxlCkBA
IC05NywxMSArOTcsMTMgQEAgYXZ4NTEyZHEtb3BtYXNrLXZlY3MgOj0gMSAyCiBhdng1MTJidy1v
cG1hc2stdmVjcyA6PSA0IDgKIAogIyBTdXBwcmVzcyBidWlsZGluZyBieSBkZWZhdWx0IG9mIHRo
ZSBoYXJuZXNzIGlmIHRoZSBjb21waWxlciBjYW4ndCBkZWFsCi0jIHdpdGggYW55IG9mIHRoZSBl
eHRlbnNpb25zIHVzZWQuICBEb24ndCBhbHRlciB0aGUgInJ1biIgdGFyZ2V0IGRlcGVuZGVuY2ll
cworIyB3aXRoIHNvbWUgb2YgdGhlIGV4dGVuc2lvbnMgdXNlZC4gIERvbid0IGFsdGVyIHRoZSAi
cnVuIiB0YXJnZXQgZGVwZW5kZW5jaWVzCiAjIHRob3VnaCwgYXMgdGhpcyB0YXJnZXQgbmVlZHMg
dG8gYmUgc3BlY2lmaWVkIG1hbnVhbGx5LCBhbmQgdGhpbmdzIG1heSB3b3JrCiAjIHBhcnRpYWxs
eSBldmVuIHdpdGggb2xkZXIgY29tcGlsZXJzLgogVEFSR0VULXkgOj0gJChUQVJHRVQpCiAKK2lm
ZXEgKCQoZmlsdGVyIHJ1biUsJChNQUtFQ01ER09BTFMpKSwpCisKIGRlZmluZSBzaW1kLWNoZWNr
LWNjCiBUQVJHRVQtJChzaGVsbCBlY2hvICdpbnQgaTsnIHwgJChDQykgLXggYyAtYyAtbyAvZGV2
L251bGwgLW0kKDEpIC0gfHwgZWNobyB5KSA6PQogZW5kZWYKQEAgLTExNiw2ICsxMTgsOCBAQCBp
ZmVxICgkKFRBUkdFVC15KSwpCiAkKHdhcm5pbmcgVGVzdCBoYXJuZXNzIG5vdCBidWlsdCwgdXNl
IG5ld2VyIGNvbXBpbGVyIHRoYW4gIiQoQ0MpIiAodmVyc2lvbiAkKHNoZWxsICQoQ0MpIC1kdW1w
dmVyc2lvbikpIGFuZCBhbiAie2V2ZXh9IiBjYXBhYmxlIGFzc2VtYmxlcikKIGVuZGlmCiAKK2Vu
ZGlmCisKIGFsbDogJChUQVJHRVQteSkKIAogIyBGb3IgQVZYIGFuZCBsYXRlciwgaGF2ZSB0aGUg
Y29tcGlsZXIgYXZvaWQgWE1NMCB0byB3aWRlbiBjb3ZlcmFnZSBvZgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

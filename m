Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A320C14EF6B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:18:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixY14-0007ed-9F; Fri, 31 Jan 2020 15:15:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dp7M=3U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ixY12-0007eW-Iw
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:15:28 +0000
X-Inumbo-ID: 82e36d42-443c-11ea-8bd7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82e36d42-443c-11ea-8bd7-12813bfff9fa;
 Fri, 31 Jan 2020 15:15:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A8F34ACA3;
 Fri, 31 Jan 2020 15:15:26 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200131142557.2896-1-jgross@suse.com>
 <20200131145544.wzm7537gpzmx3bov@debian>
 <20200131145832.wx7idhgeqo7qfcoc@debian>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <29f20c35-c8be-a4d8-f238-311f21f71ed5@suse.com>
Date: Fri, 31 Jan 2020 16:15:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200131145832.wx7idhgeqo7qfcoc@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] tools/xenstore: don't apply write limiting
 for privileged domain
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAgMTU6NTgsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBKYW4gMzEsIDIwMjAg
YXQgMDI6NTU6NDRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPj4gT24gRnJpLCBKYW4gMzEsIDIw
MjAgYXQgMDM6MjU6NTdQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IFhlbnN0b3Jl
IHdyaXRlIGxpbWl0aW5nIHNob3VsZCBub3QgYmUgYXBwbGllZCB0byBkb20wLiBVbmZvcnR1bmF0
ZWx5Cj4+PiB3cml0ZSBsaW1pdGluZyBpcyBkaXNhYmxlZCBvbmx5IGZvciBjb25uZWN0aW9ucyB2
aWEgc29ja2V0cy4gV2hlbgo+Pj4gcnVubmluZyBpbiBhIHN0dWJkb20gWGVuc3RvcmUgd2lsbCBh
cHBseSB3cml0ZSBsaW1pdGluZyB0byBkb20wLCB0b28uCj4+PiBDaGFuZ2UgdGhhdCBieSB0ZXN0
aW5nIGZvciB0aGUgZG9tYWluIHRvIGJlIHByaXZpbGVnZWQgYXMgd2VsbC4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Cj4+IEFja2VkLWJ5
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+Pgo+Pj4gLS0tCj4+PiAgIHRvb2xzL3hlbnN0b3JlL3hl
bnN0b3JlZF9kb21haW4uYyB8IDQgKystLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfZG9tYWluLmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMK
Pj4+IGluZGV4IDFhODMwOTc5NTIuLmM3YzZjNTc0ZGYgMTAwNjQ0Cj4+PiAtLS0gYS90b29scy94
ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMKPj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0
b3JlZF9kb21haW4uYwo+Pj4gQEAgLTkxOCw4ICs5MTgsOCBAQCB2b2lkIHdybF9hcHBseV9kZWJp
dF9hY3R1YWwoc3RydWN0IGRvbWFpbiAqZG9tYWluKQo+Pj4gICB7Cj4+PiAgIAlzdHJ1Y3Qgd3Js
X3RpbWVzdGFtcHQgbm93Owo+Pj4gICAKPj4+IC0JaWYgKCFkb21haW4pCj4+PiAtCQkvKiBzb2Nr
ZXRzIGVzY2FwZSB0aGUgd3JpdGUgcmF0ZSBsaW1pdCAqLwo+Pj4gKwlpZiAoIWRvbWFpbiB8fCAh
ZG9taWRfaXNfdW5wcml2aWxlZ2VkKGRvbWFpbi0+ZG9taWQpKQo+Pj4gKwkJLyogc29ja2V0cyBh
bmQgZG9tMCBlc2NhcGUgdGhlIHdyaXRlIHJhdGUgbGltaXQgKi8KPiAKPiBBY3R1YWxseSBJIHRo
aW5rIGNoYW5naW5nIGRvbTAgdG8gInByaXZpbGVnZWQgZG9tYWluIiBtYWtlcyBtb3JlIHNlbnNl
Cj4gaGVyZSBiZWNhdXNlIHlvdSdyZSBhbGxvd2VkIHRvIHNwZWNpZnkgYSBub24tMCBkb21haW4g
SUQgYXMgcHJpdmlsZWdlZAo+IGRvbWlkLgo+IAo+IElmIHlvdSBhZ3JlZSBJIGNhbiBmaXggaXQg
d2hpbGUgY29tbWl0dGluZy4KClllcywgc3VyZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

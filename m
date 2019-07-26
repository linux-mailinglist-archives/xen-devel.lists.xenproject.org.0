Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8090B766BE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:59:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzlZ-0002mr-Ed; Fri, 26 Jul 2019 12:56:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XdPt=VX=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hqzlY-0002mj-0g
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:56:08 +0000
X-Inumbo-ID: bb2d3f8f-afa4-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bb2d3f8f-afa4-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:56:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1564145766; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=2MBOQtgGmBP1EBMX2L+K2e99lDzNKDKzSP1DDJsnVAA=;
 b=kP/QAcu7yopWjABUpcV4K3GyhzD9t2W4k7FjHgzP7AjtXJn5GoCqYpd3qSZSNrRcZLTSAFVi
 kWZYdK5F9MD3Y6ORUdpijQ3EVPseZ+u5Wnf3PqPblaQnQudys1Xtcj47KpsjlXxJV1ugJm9w
 HUoFWRu7Mf4GhbJXHbILOh6W39o=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mxa.mailgun.org with ESMTP id 5d3af865.7fd19dcaa7f0-smtp-out-n01;
 Fri, 26 Jul 2019 12:56:05 -0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id g17so54351891wrr.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 05:56:04 -0700 (PDT)
X-Gm-Message-State: APjAAAXM68DEYVKZ0G/VE7cqmrCcG6Xm5WLBaisvMrzR18HDV7tSpmOD
 Suf2pF2SbMvy7KH3cEJJtnkwJ+6vkXLU8/GTKLI=
X-Google-Smtp-Source: APXvYqzajrZtOJqjJAyR959GzbtBBSBCZvpNes8DNu4nKBxIEY0NtEiAqt5wjwbnYj9u2Dyq/Rk85QonX0LZL5viYA4=
X-Received: by 2002:adf:9486:: with SMTP id 6mr70881696wrr.242.1564145764114; 
 Fri, 26 Jul 2019 05:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190726101057.21324-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190726101057.21324-1-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 26 Jul 2019 06:55:27 -0600
X-Gmail-Original-Message-ID: <CABfawhncHLf=TTU8kHvFqCQxdjKOXuRaNT-stOi3wM7NLu3WWg@mail.gmail.com>
Message-ID: <CABfawhncHLf=TTU8kHvFqCQxdjKOXuRaNT-stOi3wM7NLu3WWg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH RFC] x86/shim: Refresh pvshim_defconfig
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgNDoxMSBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+ICogQWRkIGEgZGVwZW5kZW5jeSBzbyB0aGUgc2hp
bSBnZXRzIHJlYnVpbHQgd2hlbiBwdnNoaW1fZGVmY29uZmlnIGNoYW5nZXMuCj4gKiBEZWZhdWx0
IHRvIHRoZSBOVUxMIHNjaGVkdWxlciBub3cgdGhhdCBpdCB3b3JrcyB3aXRoIHZjcHUgb25saW5l
L29mZmxpbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+
Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4g
Q0M6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4KPiBUaGlzIHBhdGNoIGRl
cGVuZHMgb24gRGFyaW8ncyBzZXJpZXMsIGFuZCBjYW50IGdvIGluIHVudGlsIHRoZW4uCj4KPiBB
bHNvIFJGQy4KPgo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+Cj4gQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPgo+IEkgdHJp
ZWQgdHVybmluZyBvZmYgTUVNX0FDQ0VTUywgYnV0IEkgY2FuJ3QgZ2V0IEtjb25maWcgdG8gYWN0
dWFsbHkgdHVybiBpdAo+IG9mZiBpbiB0aGUgYnVpbGQuICBXaGF0IGlzIHRoZSBkZWFsIHdpdGgg
TUVNX0FDQ0VTU19BTFdBWVNfT04gPyAgSXQgbWFrZXMgaXQKPiBpbXBvc3NpYmxlIHRvIHR1cm4g
TUVNX0FDQ0VTUyBvZmYsIGJlY2F1ZSBpdCBpcyBzZWxlY3RlZCBieSB4ODYsIHdoaWNoIGxlYXZl
cwo+IE1FTV9BQ0NFU1MgZW5hYmxlZCBhbmQgdW5tb2RpZmlhYmxlLgoKV2UgbmV2ZXIgbWFkZSBp
dCBjb25maWd1cmFibGUgdG8gaGF2ZSBNRU1fQUNDRVNTIGJlIGRpc2FibGVkIG9uIHg4Ni4KVGhl
IG9wdGlvbiBvbmx5IGV4aXN0cyBiZWNhdXNlIHdoZW4gSSBzdGFydGVkIG1vdmluZyB2bV9ldmVu
dCB0bwpjb21tb24gY29kZSBpdCBoYWQgdG8gYmUgZGlzYWJsZWQgZm9yIEFSTSBhdCBmaXJzdC4g
VGhlbiBpdCBsb29rcyBsaWtlClN0ZWZhbm8gZGlkIG1ha2UgaXQgY29uZmlndXJhYmxlIGZvciBB
Uk0gc28gdGhlcmUgaXQgY2FuIGFjdHVhbGx5IGJlCmRpc2FibGVkLgoKVGFtYXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

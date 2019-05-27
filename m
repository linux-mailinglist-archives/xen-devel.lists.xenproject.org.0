Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E452ACD4
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 03:47:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hV4fY-0005rw-Rq; Mon, 27 May 2019 01:43:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzIa=T3=intel.com=farrah.chen@srs-us1.protection.inumbo.net>)
 id 1hV4fX-0005rr-J9
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 01:43:19 +0000
X-Inumbo-ID: cac718b0-8020-11e9-9441-e3822bf55857
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cac718b0-8020-11e9-9441-e3822bf55857;
 Mon, 27 May 2019 01:43:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 18:43:13 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga007.jf.intel.com with ESMTP; 26 May 2019 18:43:13 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 26 May 2019 18:43:13 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 26 May 2019 18:43:12 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.33]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.70]) with mapi id 14.03.0415.000;
 Mon, 27 May 2019 09:43:11 +0800
From: "Chen, Farrah" <farrah.chen@intel.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [Xen-devel] Compiling Xen error on RedHat8.0
Thread-Index: AdUR8RM5qkBjzIyFQfa26WrS1bY2pv//0gQA//tefXA=
Date: Mon, 27 May 2019 01:43:10 +0000
Message-ID: <1B925CC0CD9F3341B32D442251E7E1DC3E299425@SHSMSX104.ccr.corp.intel.com>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E298BE7@SHSMSX104.ccr.corp.intel.com>
 <20190524104044.GA11433@perard.uk.xensource.com>
In-Reply-To: <20190524104044.GA11433@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiN2MyYjkxM2MtM2RjYS00YzIxLWEzYjMtMDlmZGRlMDMzMzFlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiS3J6R1FWYjYyUjl4NEp6clhraWRHYzBDSHRhdGh3ZUJ1cFJsdmpTUDYxTjZrYjRNc1J1ODhcL0pzK3VGaVwvY2hJIn0=
x-ctpclassification: CTP_NT
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] Compiling Xen error on RedHat8.0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Hao,
 Xudong" <xudong.hao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW50aG9ueSwKCkJvdGggIiBQWVRIT049L3Vzci9iaW4vcHl0aG9uMiAiIGFuZCBzb2Z0bGlu
ayAicHl0aG9uLWNvbmZpZyIgdG8gInB5dGhvbjItY29uZmlnIiB3b3JrIHdlbGwsIHRoYW5rcyBh
IGxvdCEKCgpUaGFua3MsCkZhbgoKCgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBB
bnRob255IFBFUkFSRCBbbWFpbHRvOmFudGhvbnkucGVyYXJkQGNpdHJpeC5jb21dIApTZW50OiBG
cmlkYXksIE1heSAyNCwgMjAxOSA2OjQxIFBNClRvOiBDaGVuLCBGYXJyYWggPGZhcnJhaC5jaGVu
QGludGVsLmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSGFvLCBYdWRv
bmcgPHh1ZG9uZy5oYW9AaW50ZWwuY29tPgpTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gQ29tcGls
aW5nIFhlbiBlcnJvciBvbiBSZWRIYXQ4LjAKCk9uIEZyaSwgTWF5IDI0LCAyMDE5IGF0IDA1OjI4
OjUwQU0gKzAwMDAsIENoZW4sIEZhcnJhaCB3cm90ZToKPiBIaSwKCkhpLAoKPiBEbyB5b3UgaGF2
ZSBhbnkgYWR2aWNlIG9uIGJ1aWxkaW5nIFhlbiBvbiBSZWRIYXQ4PyBUaGFua3MgYSBsb3QhCgpJ
ZiB5b3UncmUgYnVpbGRpbmcgYSByZWxlYXNlIG9mIFhlbiwgdGhlbiB5b3UgY291bGQgdHJ5IHNl
dHRpbmcKUFlUSE9OPS91c3IvYmluL3B5dGhvbjIgZXZlcnl3aGVyZSwgdGhhdCBpcyB3aGVuIHN0
YXJ0aW5nIGNvbmZpZ3VyZSBhbmQgbWFrZSwgc29tZXRoaW5nIGxpa2U6CgokIC4vY29uZmlndXJl
IFBZVEhPTj0vdXNyL2Jpbi9weXRob24yIC4uLgokIG1ha2UgUFlUSE9OPS91c3IvYmluL3B5dGhv
bjIgLi4uCgpJZiB5b3UgYXJlIGJ1aWxkaW5nIGZyb20gdGhlIHVuc3RhYmxlIHRyZWUsIEkgdGhp
bmsgd2UgZml4ZWQgbW9zdCBvZiB0aG9zZSBidWdzIHJlbGF0aW5nIHRvIHB5dGhvbjIvcHl0aG9u
My4KCklzIHRoYXQgaGVscD8KCkFib3V0IHRoZSBzb2Z0IGxpbmsgInB5dGhvbiIgdG8gInB5dGhv
bjIiLCB5b3Ugd291bGQgbmVlZCBhIHNvZnRsaW5rICJweXRob24tY29uZmlnIiB0byAicHl0aG9u
Mi1jb25maWciIGFzIHdlbGwgYW5kIHRoZSAiY2hlY2tpbmcgZm9yIFB5QXJnX1BhcnNlVHVwbGUi
IGlzIG1vcmUgbGlrZWx5IHRvIHN1Y2NlZWQuCgpDaGVlcnMsCgotLQpBbnRob255IFBFUkFSRAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976F7A3ED4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 22:12:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3nDd-0004Sw-Ad; Fri, 30 Aug 2019 20:10:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=69lB=W2=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i3nDc-0004Sq-9P
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 20:10:00 +0000
X-Inumbo-ID: 24cc6ea0-cb62-11e9-ae8f-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24cc6ea0-cb62-11e9-ae8f-12813bfff9fa;
 Fri, 30 Aug 2019 20:09:59 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i3nDZ-0007hP-V6; Fri, 30 Aug 2019 20:09:57 +0000
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@citrix.com>)
 id 1i3nDZ-0003Pk-Nr; Fri, 30 Aug 2019 20:09:57 +0000
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 30 Aug 2019 21:09:50 +0100
Message-Id: <cover.0973801f3e11049e3c1e08a3b512e24b1f52038c.1567195654.git-series.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
Subject: [Xen-devel] [PATCH v3 0/3] Allow get_maintainer.pl /
 add_maintainers.pl scripts to be called outside of xen.git
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlLWNhc2U6IEFsbG93IHVzaW5nIGJvdGggc2NyaXB0cyBvbiB4ZW4gcmVwb3NpdG9yaWVzIHN1
Y2ggYXMKbWluaS1vcy5naXQsIG9zc3Rlc3QuZ2l0LAoKQXNzdW1wdGlvbnM6IHRoZSByZXBvc2l0
b3J5IGNvbnRhaW5zIGEgTUFJTlRBSU5FUlMgZmlsZSB0aGF0CmZvbGxvd3MgdGhlIHNhbWUgY29u
dmVudGlvbnMgYXMgdGhlIGZpbGUgaW4geGVuLmdpdAoKQSBzdWdnZXN0ZWQgdGVtcGxhdGUgZm9y
IHNpc3RlciByZXBvc2l0b3JpZXMgb2YgWGVuCgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpUaGlzIGZpbGUgZm9sbG93cyB0aGUgc2FtZSBj
b252ZW50aW9ucyBhcyBvdXRsaW5lZCBpbgp4ZW4uZ2l0Ok1BSU5UQUlORVJTLiBQbGVhc2UgcmVm
ZXIgdG8gdGhlIGZpbGUgaW4geGVuLmdpdApmb3IgbW9yZSBpbmZvcm1hdGlvbi4KClRIRSBSRVNU
Ck06CU1BSU5UQUlORVIxIDxtYWludGFpbmVyMUBlbWFpbC5jb20+Ck06ICAgICAgTUFJTlRBSU5F
UjIgPG1haW50YWluZXIyQGVtYWlsLmNvbT4KTDoJeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnClM6CVN1cHBvcnRlZApGOgkqLwpWOgl4ZW4tbWFpbnRhaW5lcnMtMQo9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKQ2hhbmdlcyBpbiB2
MjoKKiBSZW1vdmUgZGVidWcgbWVzc2FnZQoKQ2hhbmdlcyBpbiB2MzoKKiBTcGxpdCBwYXRjaAoq
IGFkZF9tYWludGFpbmVycy5wbDogZG8gbm90IGlzc3VlIGEgd2FybmluZwoqIGFkZF9tYWludGFp
bmVycy5wbDogaW50cm9kdWNlIHByb2Nlc3NpbmcgbG9naWMgZm9yIFY6IHRhZwoqIE1BSU5UQUlO
RVJTOiBBZGQgVjogdGFnIHRvIGZpbGUKCkxhcnMgS3VydGggKDMpOgogIFJlbW92ZSBoYXJkY29k
aW5nIGZyb20gc2NyaXB0cy9hZGRfbWFpbnRhaW5lcnMucGwKICBBZGQgViBzZWN0aW9uIGVudHJ5
IHRvIGFsbG93IGlkZW50aWZpY2F0aW9uIG9mIFhlbiBNQUlOVEFJTkVSUyBmaWxlCiAgQWRkIGxv
Z2ljIHRvIHVzZSBWIHNlY3Rpb24gZW50cnkgaW4gVEhFIFJFU1QgZm9yIGlkZW50aWZ5aW5nIHhl
biB0cmVlcwoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgIHwgIDQgKysrLQogc2NyaXB0cy9h
ZGRfbWFpbnRhaW5lcnMucGwgfCAgNCArLS0KIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgIHwg
NTggKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5n
ZWQsIDQyIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6IDZjOTYz
OWE3MmYwY2EzYTk0MzBlZjc1ZjM3NTg3NzE4MjI4MWZkZWYKLS0gCmdpdC1zZXJpZXMgMC45LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

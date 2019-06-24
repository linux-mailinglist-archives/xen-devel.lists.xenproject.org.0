Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD25052E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 11:09:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfKul-0005DI-Jw; Mon, 24 Jun 2019 09:05:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gS1f=UX=abilixsoft.eu=r.ivanov@srs-us1.protection.inumbo.net>)
 id 1hfKsv-0005Bg-8m
 for xen-devel@lists.xen.org; Mon, 24 Jun 2019 09:03:33 +0000
X-Inumbo-ID: eeb04018-965e-11e9-9413-0791bfc62686
Received: from Shared9.abilixsoft.eu (unknown [185.246.168.6])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eeb04018-965e-11e9-9413-0791bfc62686;
 Mon, 24 Jun 2019 09:03:29 +0000 (UTC)
Received: from [10.255.255.147] (unknown [213.91.182.188])
 by Shared9.abilixsoft.eu (Postfix) with ESMTPSA id 8649644E54
 for <xen-devel@lists.xen.org>; Mon, 24 Jun 2019 12:03:27 +0300 (EEST)
To: xen-devel@lists.xen.org
From: Radoslav Ivanov <r.ivanov@abilixsoft.eu>
Message-ID: <ec033b4c-b111-0fe7-d2cb-7e49d4c4c15a@abilixsoft.eu>
Date: Mon, 24 Jun 2019 12:03:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Mon, 24 Jun 2019 09:05:25 +0000
Subject: [Xen-devel] xl list wrong repot data
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpJJ20gZmFjaW5nIGEgcHJvYmxlbSB3aXRoIGB4bCBsaXN0YCBvdXRwdXQgLSBhcyBJ
J20gZmV0Y2hpbmcgdGhlIG91dHB1dCAKb2YgdGhpcyBjb21tYW5kIG9uY2UgaW4gYSBtaW51dGUs
IGdhdGhlcmluZyB0aGUgc3VtIG9mIHRoZSBsYXN0IGNvbHVtbiAKdG8gY2FsY3VsYXRlIENQVXMv
cyB1c2FnZSBJJ20gaGF2aW5nIGEgYGRhdGEganVtcHNgIGZyb20gMzUyMjQyLjIgdG8gCjk0NDUz
MjE1NTMuMiBhbmQgdGhlbiBnb2VzIGJhY2sgdG8gdGhlIHByZXZpb3VzIHZhbHVlLsKgIFRoaXMg
YGJsdXJzYCB0aGUgCmF2ZXJhZ2UgY3B1IHVzYWdlIG9mIHRoZSBoeXBlcnZpc29yLgoKSGVyZSBp
cyBhbiBvdXRwdXQgb2YgYHhsIGluZm9gIChjb21tb24gaXMgdGhlIHhsIHZlcnNpb24gNC44LjUp
IG9uIHR3byAKb2YgdGhlIGh5cGVydmlzb3JzICh0aGUgZmlyc3Qgb25lIHN0aWxsIGhhcyB0aGUg
cHJvYmxlbSkgdGhlIHNlY29uZCBoYWQgCmFuIGtlcm5lbCB1cGRhdGUgYW5kIHRoZSBvZGQgZGF0
YSBjb2xsZWN0aW9uIGlzIGdvbmUgYnV0IGl0IGFsc28gZ290IApsZXNzIFZNcyBvbiBpdCAtIHNv
IGtlcm5lbCBpc24ndCBuZWNlc3NhcmlseSB0aGUgcmVhc29uLgoKaHR0cHM6Ly9wYXN0ZWJpbi5j
b20vSjhxUzRwc3AKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

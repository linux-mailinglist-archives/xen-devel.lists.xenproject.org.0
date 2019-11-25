Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2C5108F91
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 15:08:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZEzU-0007dM-EM; Mon, 25 Nov 2019 14:05:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZEzS-0007d9-IL
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 14:05:22 +0000
X-Inumbo-ID: 9d1b2ca2-0f8c-11ea-b08b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d1b2ca2-0f8c-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 14:05:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0D86FB47A;
 Mon, 25 Nov 2019 14:05:19 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-144289-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6278a67e-bd65-39d6-0322-32e8e7538457@suse.com>
Date: Mon, 25 Nov 2019 15:05:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <osstest-144289-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 144289: tolerable FAIL
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxNDo1OCwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGZsaWdo
dCAxNDQyODkgeGVuLXVuc3RhYmxlIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NDI4OS8KPiAKPiBGYWlsdXJlcyA6LS8gYnV0
IG5vIHJlZ3Jlc3Npb25zLgo+IAo+IFRlc3RzIHdoaWNoIGFyZSBmYWlsaW5nIGludGVybWl0dGVu
dGx5IChub3QgYmxvY2tpbmcpOgo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXJ0ZHMgIDE3IGd1ZXN0
LXNhdmVyZXN0b3JlLjIgZmFpbCBpbiAxNDQyODMgcGFzcyBpbiAxNDQyODkKPiAgdGVzdC1hbWQ2
NC1hbWQ2NC1saWJ2aXJ0LXhzbSAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgICBmYWlsIHBh
c3MgaW4gMTQ0MjgzCgpPdGhlciB0aGFuIHRoZSBzaGVsbCBwcm9tcHQgbm90IGFwcGVhcmluZywg
SSBjYW4ndCBzZWUgYW55CmluZGljYXRpb24gb2Ygd2hhdCBtYXkgaGF2ZSBnb25lIHdyb25nIGhl
cmUgZm9yIHdoaWNoIHJlYXNvbi4KSG93ZXZlciwgSSBmaW5kCgoKTm92IDI1IDA4OjI2OjUwLjQ3
MjA1NyBbICAgIDQuNTY4NTU0XSBCRVJUOiBFcnJvciByZWNvcmRzIGZyb20gcHJldmlvdXMgYm9v
dDoKTm92IDI1IDA4OjI2OjUwLjQ3MjA2NiBbICAgIDQuNTczNDM4XSBbSGFyZHdhcmUgRXJyb3Jd
OiBldmVudCBzZXZlcml0eTogZmF0YWwKTm92IDI1IDA4OjI2OjUwLjQ4NDA2MiBbICAgIDQuNTc4
MzE0XSBbSGFyZHdhcmUgRXJyb3JdOiAgRXJyb3IgMCwgdHlwZTogZmF0YWwKTm92IDI1IDA4OjI2
OjUwLjQ4NDA3MiBbICAgIDQuNTgzMTkyXSBbSGFyZHdhcmUgRXJyb3JdOiAgIHNlY3Rpb25fdHlw
ZTogUENJZSBlcnJvcgpOb3YgMjUgMDg6MjY6NTAuNDk2MDU2IFsgICAgNC41ODg1MDddIFtIYXJk
d2FyZSBFcnJvcl06ICAgcG9ydF90eXBlOiA0LCByb290IHBvcnQKTm92IDI1IDA4OjI2OjUwLjQ5
NjA2NiBbICAgIDQuNTkzNzMwXSBbSGFyZHdhcmUgRXJyb3JdOiAgIHZlcnNpb246IDEuMTYKTm92
IDI1IDA4OjI2OjUwLjQ5NjA3MiBbICAgIDQuNTk4MDg5XSBbSGFyZHdhcmUgRXJyb3JdOiAgIGNv
bW1hbmQ6IDB4MDAxMCwgc3RhdHVzOiAweDAwMDAKTm92IDI1IDA4OjI2OjUwLjUwODA2MiBbICAg
IDQuNjA0MDEyXSBbSGFyZHdhcmUgRXJyb3JdOiAgIGRldmljZV9pZDogMDAwMDowMDowMi4yCk5v
diAyNSAwODoyNjo1MC41MDgwNzIgWyAgICA0LjYwOTIzNl0gW0hhcmR3YXJlIEVycm9yXTogICBz
bG90OiAwCk5vdiAyNSAwODoyNjo1MC41MjAwNTkgWyAgICA0LjYxMzA3MV0gW0hhcmR3YXJlIEVy
cm9yXTogICBzZWNvbmRhcnlfYnVzOiAweDAwCk5vdiAyNSAwODoyNjo1MC41MjAwNjggWyAgICA0
LjYxNzk0NV0gW0hhcmR3YXJlIEVycm9yXTogICB2ZW5kb3JfaWQ6IDB4ODA4NiwgZGV2aWNlX2lk
OiAweDZmMDYKTm92IDI1IDA4OjI2OjUwLjUzMjA1OCBbICAgIDQuNjI0Mjk1XSBbSGFyZHdhcmUg
RXJyb3JdOiAgIGNsYXNzX2NvZGU6IDA0MDYwMApOb3YgMjUgMDg6MjY6NTAuNTMyMDY3IFsgICAg
NC42MjkwOTBdIFtIYXJkd2FyZSBFcnJvcl06ICAgYnJpZGdlOiBzZWNvbmRhcnlfc3RhdHVzOiAw
eDAwMDAsIGNvbnRyb2w6IDB4MDAwMAoKKGNsb3NlIHRvIHRoZSB0b3Agb2YgdGhlIHJlY29yZGVk
IHNlcmlhbCBsb2cpIGNvbmNlcm5pbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=

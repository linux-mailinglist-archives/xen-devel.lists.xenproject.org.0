Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E4816C3C7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 15:23:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6b4v-0005aY-V3; Tue, 25 Feb 2020 14:20:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3lsx=4N=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6b4t-0005aT-Rr
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 14:20:51 +0000
X-Inumbo-ID: 05303a5e-57da-11ea-9315-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05303a5e-57da-11ea-9315-12813bfff9fa;
 Tue, 25 Feb 2020 14:20:49 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p3so16409300edx.7
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2020 06:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qgCtRzIg++f0viVcOq4Zt0cBi/X4oXW3lRb/MCYMewM=;
 b=FnhXwKYr8qIefBzN2unAilFhxbnRJ8ovmsQRmWLFbEWkFVzoTH18SawRZ269SLqOk+
 5iFg8TjAfxWQMHl38CvAynfLHxGG0TR52T1AuhwweGoYmCeI5/1IRIZJhhCzGyjEaEwX
 SA7mvtLz42V/h0aGkSvZoE6r4QfSiJmOmn1xiLUXBnRITH3q7p1dbriYdPwdKqVblzKb
 GYmFBE0lBiusp7RjlVtC5lvL8ePy3/F5t7SPEtiJQssO3q7ROtrlP6E+oqixUZUDGfsd
 YIyStOP6emiA7cNGW0ywyXd/YtYKcgxDsuUVOSyMx6IiQkP/PxQIk1K/nzihq7Jh9EGo
 WQMg==
X-Gm-Message-State: APjAAAUc7r277oyZyl0PEeDBDIHH2w2gpBdMFaCxSXqQs9MM9Ta7bRjt
 eXjFYBnzRqU1wtgBJfP6jMk=
X-Google-Smtp-Source: APXvYqx3BvjNAaacrQMSPjb/7W0Y8rB0GTBhr/D0DvitTZjfwBE085Us1RWRJpOMOMOObxKNGYo0Ew==
X-Received: by 2002:a17:906:4f93:: with SMTP id
 o19mr54227312eju.52.1582640448669; 
 Tue, 25 Feb 2020 06:20:48 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id c19sm1207218edu.76.2020.02.25.06.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 06:20:48 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20200225132558.26152-1-julien@xen.org>
 <109eaf78-6c13-665d-ef71-d8131d15ade1@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3a4a2a6a-f6ae-f66e-6c90-264f27163d85@xen.org>
Date: Tue, 25 Feb 2020 14:20:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <109eaf78-6c13-665d-ef71-d8131d15ade1@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/grant-table: Remove outdated warning in
 gnttab_grow_table()
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
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNS8wMi8yMDIwIDEzOjI5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDI1LzAyLzIw
MjAgMTM6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT25lIG9mIHRoZSB3YXJuaW5nIG1lc3Nh
Z2UgaW4gZ250dGFiX2dyb3dfdGFibGUoKSByZWZlcnMgdG8gYSBmdW5jdGlvbgo+PiB3YXMgcmVt
b3ZlZCBpbiBjb21taXQgNjQyNWY5MWM3MiAieGVuL2dudHRhYjogRm9sZCBncmFudF90YWJsZV97
Y3JlYXRlLAo+PiBzZXRfbGltaXRzfSgpIGludG8gZ3JhbnRfdGFibGVfaW5pdCgpIi4KPj4KPj4g
U2luY2UgdGhlIGNvbW1pdCwgZ3QtPmFjdGl2ZSB3aWxsIGJlIGFsbG9jYXRlZCB3aGlsZSBpbml0
aWFsaXppbmcgdGhlCj4+IGdyYW50IHRhYmxlIGF0IGRvbWFpbiBjcmVhdGlvbi4gVGhlcmVmb3Jl
IGd0LWFjdGl2ZSB3aWxsIGFsd2F5cyBiZQo+PiB2YWxpZC4KPj4KPj4gUmF0aGVyIHRoYW4gcmVw
bGFjaW5nIHRoZSB3YXJuaW5nIGJ5IGFub3RoZXIgb25lLCB3ZSBjYW4gbm93IGRvd25ncmFkZQo+
PiB0aGUgY2hlY2sgdG8gYW4gQVNTRVJUKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVEJILCBJJ2QgZHJvcCB0aGUgYXNzZXJ0LsKg
IEFzIHlvdSBpZGVudGlmeSwgaXRzIG5vdCBoZWxwZnVsLCBhbmQgdGhlcmUKPiBpcyBubyBjaGFu
Y2Ugd2UncmUgbW92aW5nIGJhY2sgdG8gYSBzZW1pLW5vdC1pbml0aWFsaXNlZC15ZXQgd29ybGQu
CgpJIHdpbGwgZHJvcCB0aGUgQVNTRVJUIHRoZW4gYW5kIHJlc2VuZCB0aGUgcGF0Y2guCgo+IAo+
IEVpdGhlciB3YXksIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKQ2hlZXJzLAoKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

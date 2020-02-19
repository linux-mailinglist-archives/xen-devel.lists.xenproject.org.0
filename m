Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0504164AF4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:49:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4SVX-0003s5-4f; Wed, 19 Feb 2020 16:47:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gcDT=4H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4SVV-0003ru-U6
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:47:29 +0000
X-Inumbo-ID: 83cb3884-5337-11ea-83ca-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83cb3884-5337-11ea-83ca-12813bfff9fa;
 Wed, 19 Feb 2020 16:47:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a5so1428690wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 08:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FVg7pUWcf3mM8K/jTWPIcFC5ky3/7llmvl9wxbAxi8M=;
 b=ULIXAtAkCxIE1rvQYrMMMhXPHrg3wxTm3alSUCoSy4F072qUIHm+z8XDLKbrw2PNR+
 9ItTL8lcoCJEE7rWcs5DvCDNV5WgLnOGXhfixEeF/ia6U1NysFuikdROCXlSj1IFepVz
 w6eRp2NAJMz8i1jTEP1cAtMWzYGmVysR8NwJFbeCJ36dF8J6ofsHSG6bZDriGMNEXb/k
 K3pxmjC7tm1KU79i6FfB05XzOPW7xHH2TFiMTjXgkC2FVju9WW3gDRb6rNNzjNh0oLlh
 r9//ReNIf+wRJefu+in+lSfrlVa8uVJrHHvIUvqvQylLVS9PCHP4BQZtHWrVHLp3Ljiy
 EJDg==
X-Gm-Message-State: APjAAAXyyhpbwa8bzD+pJDvpjVQ/wRWStPVJ/X/7SebVidsVoB1vI6n/
 EA9hA75RzCu+ukU0UxB2rPk=
X-Google-Smtp-Source: APXvYqyeFSzpj/JyapJMYhBxCpccFWoQ2bmjhVcro0i3VPBwyLa8staAixOPg+XzAsyjM/cLG2t32g==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr10926613wmi.58.1582130848412; 
 Wed, 19 Feb 2020 08:47:28 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id o4sm411980wrx.25.2020.02.19.08.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 08:47:27 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200219081126.29534-1-jgross@suse.com>
 <20200219081126.29534-4-jgross@suse.com>
 <ac088c1e-0326-b72a-e1bf-582493e4e712@xen.org>
Message-ID: <f614ddb8-6e49-d302-f20c-2011abd9646d@xen.org>
Date: Wed, 19 Feb 2020 16:47:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ac088c1e-0326-b72a-e1bf-582493e4e712@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v5 3/8] xen: add basic hypervisor filesystem
 support
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS8wMi8yMDIwIDE2OjI2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4gCj4gT24gMTkv
MDIvMjAyMCAwODoxMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gK2ludCBoeXBmc193cml0ZV9i
b29sKHN0cnVjdCBoeXBmc19lbnRyeV9sZWFmICpsZWFmLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIHVhZGRy
LCB1bnNpZ25lZCAKPj4gbG9uZyB1bGVuKQo+PiArewo+PiArwqDCoMKgIHVuaW9uIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgIGNoYXIgYnVmWzhdOwo+PiArwqDCoMKgwqDCoMKgwqAgdWludDhfdCB1ODsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHVpbnQxNl90IHUxNjsKPj4gK8KgwqDCoMKgwqDCoMKgIHVpbnQz
Ml90IHUzMjsKPj4gK8KgwqDCoMKgwqDCoMKgIHVpbnQ2NF90IHU2NDsKPj4gK8KgwqDCoCB9IHU7
Cj4+ICsKPj4gK8KgwqDCoCBBU1NFUlQobGVhZi0+ZS50eXBlID09IFhFTl9IWVBGU19UWVBFX1VJ
TlQgJiYgbGVhZi0+ZS5zaXplIDw9IDgpOwo+IAo+IFNob3VsZG4ndCB0aGlzIGJlIFhFTl9IWVBG
U1dfVFlQRV9CT09MPyBCdXQgdGhlbiwgd2h5IGFyZSB3ZSBhbGxvd2luZyBhIAo+IGJvb2xlYW4g
cGFyYW1ldGVyIHRvIGJlIGhlbGQgaW4gYSA2NC1iaXQgdmFsdWU/Cj4gCj4gSUhNTywgYSBib29s
ZWFuIHNob3VsZCByZWFsbHkgYmUgaG9sZCBpbiBhIGJvb2wgYW5kIG5vdGhpbmcgZWxzZS4KCkFm
dGVyIHNlbmRpbmcgbXkgZS1tYWlsLCBJIHJlYWxpemVkIHRoZSBzaXplIG9mIHRoZSBib29sIGlz
IAppbXBsZW1lbnRhdGlvbiBkZWZpbmVkLiBIb3dldmVyLCBJIHRoaW5rIG15IHBvaW50IHN0YW5k
cywgaXQgd291bGQgYmUgCmJldHRlciB0byBoYXZlIGEgZml4ZWQgc2l6ZSBmb3IgYm9vbCAoaS5l
IDEpIGFuZCBkZW55IGFsbCB0aGUgb3RoZXIgdXNlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

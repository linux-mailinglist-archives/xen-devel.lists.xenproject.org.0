Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2048512818F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 18:41:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMF1-0000Wr-2x; Fri, 20 Dec 2019 17:39:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DXd/=2K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iiMEz-0000Wl-Br
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 17:39:05 +0000
X-Inumbo-ID: 9cf7fbf3-234f-11ea-93b3-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cf7fbf3-234f-11ea-93b3-12813bfff9fa;
 Fri, 20 Dec 2019 17:39:04 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id v28so9010916edw.12
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 09:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LcmqCW0w1OhKu9sse5rZBbIsadS7CMjySWh+9403rPE=;
 b=jnFao3V6rRGR5Nvi1No47HbcH8r84BVXX/Kw2vMnZUY+pfr9vfN00kyK5Az/KeD5NO
 VIzgTXzmyHHkVjAjqtsPTTlHZzPa3xyd+29BSYWx5xFfjrPDO/FBEcfldNCURy0GpHWv
 Fb4vsLBPJvuV89ZY1vKZMRsWm8Ba3XjhOj45qxeLhwZcczkZsAMx/Fnqjf1bq6CfjYhd
 F3JvY5MiN/rHauPisDAqrDeVNhNPAaM7QDzd/qTA20kONE1u6n7HRVvNNkfF9GvYkRLJ
 3q+1JJyKrMsBk87RoDRqZehTmmd226dNlC/PogBU/RLxqWBeNcjy3znRDdBTOvmFzPKN
 x7jA==
X-Gm-Message-State: APjAAAWI/azQg56KccYqGRTASyaa09AQBRBnVR18W0JvyBopcykUeUkO
 na9yCf5UT8G4ptUc7vWYURw=
X-Google-Smtp-Source: APXvYqwt8LkPjmnBWOzWOGJotQIA1eFvjdIDAOOleTIMvNClK5bDcRTWjveZkyiGcGoIq6RaPlZxzQ==
X-Received: by 2002:a17:906:229b:: with SMTP id
 p27mr17382371eja.21.1576863543486; 
 Fri, 20 Dec 2019 09:39:03 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id i21sm1017531edj.33.2019.12.20.09.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2019 09:39:02 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191220173502.15615-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <630a4aeb-a122-352e-59d6-1ca065a22b66@xen.org>
Date: Fri, 20 Dec 2019 17:39:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191220173502.15615-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] libxc/migration: Drop unimplemneted domain
 types
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
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMjAvMTIvMjAxOSAxNzozNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiB4
ODYgUFZIIGlzIGNvbXBsZXRlbHkgb2Jzb2xldGUgLSBpdCB3YXMgaW50ZW5kZWQgZm9yIGxlZ2Fj
eSBQVkggYmVmb3JlIHRoYXQKPiBpZGVhIHdhcyBhYmFuZG9uZWQuICBUaGVyZSB3YXMgYW4gUkZD
IHNlcmllcyBmb3IgQVJNIGluIDIwMTUsIGJ1dCB0aGVyZSBpcwo+IHBsZW50eSBvZiBvdXRzdGFu
ZGluZyB3b3JrIHdoaWNoIGhhc24ndCBiZWVuIGRvbmUgeWV0Lgo+IAo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLiAgTmV3IHR5cGVzIGNhbiBiZSAocmUpaW50cm9kdWNlZCB3aXRoIHRoZSBjb2RlIHdo
aWNoCj4gYWN0dWFsbHkgaW1wbGVtZW50cyB0aGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz4KCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C869C17C2CD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 17:20:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAFg1-00048d-QG; Fri, 06 Mar 2020 16:18:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BnZ=4X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jAFg0-00048Y-61
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 16:18:16 +0000
X-Inumbo-ID: 15391a58-5fc6-11ea-b74d-bc764e2007e4
Received: from mail-ed1-f67.google.com (unknown [209.85.208.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15391a58-5fc6-11ea-b74d-bc764e2007e4;
 Fri, 06 Mar 2020 16:18:15 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id cq8so3176894edb.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 08:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iZiVguGygBRwGUYVi1wV86HtJA0E0BgSi95wcd4f0KQ=;
 b=bTvJiCkM3YQAz0GOUUkcr7WJvUd5SPs48hEf/JjrAsTNM6rAr931xZyTnnzXIV5Xmv
 26TxmjXMlL1Efxi+6PAmrtxhyR/fHt8LR1SiFa8X0YA87VN4MFOdlEnz0HQEQ0JUquR/
 SScF/e5NYy0FgvwM5EEETs8118oiVKAvyrjdOGDEpOnrfeYaTb+EXYyiajUz/R1x0YYM
 Bf4x/xDI8GNrcbhQdhkirSj9CG2UOqeiF4Z53SASapaL2qoIZHR4xHusS0PqUBnnpveG
 0Rbw7F5gck1IzHdwqNXb+x7y9nNfMDqqNcHLjbWyzeUjq4z/U6SaAGbRyT9KFLuYzLQ9
 fdCw==
X-Gm-Message-State: ANhLgQ2b/MZE+bZcw2Lj7bkbuTuxICbFOjAND/S/HZtsm9c1J63EX7fi
 uVxDFVjkTc+dS7kqq+Edw+0=
X-Google-Smtp-Source: ADFU+vuaUeGTo53e4QVrAO8fTWtZsxVJqrbsoDmeSx4YY/Wvuth9dO1Nd6OXVA3KKnEuOwuEf/yK6Q==
X-Received: by 2002:a17:906:4d0c:: with SMTP id
 r12mr3812870eju.178.1583511494881; 
 Fri, 06 Mar 2020 08:18:14 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id r23sm2561966edx.24.2020.03.06.08.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 08:18:14 -0800 (PST)
To: Paul Durrant <xadimgnik@gmail.com>, pdurrant@amzn.com,
 xen-devel@lists.xenproject.org
References: <20200305173041.5141-1-pdurrant@amzn.com>
 <20200305173041.5141-3-pdurrant@amzn.com>
 <982fbada-6b29-aafd-4faa-14b60b2cc900@xen.org>
 <01cd01d5f3b1$78b69410$6a23bc30$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <75aa7c0b-b297-abd7-ae7b-f75312e9dd5e@xen.org>
Date: Fri, 6 Mar 2020 16:18:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <01cd01d5f3b1$78b69410$6a23bc30$@xen.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [EXTERNAL][PATCH v6 2/2] docs/designs: Add a design
 document for migration of xenstore data
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDA2LzAzLzIwMjAgMTI6MTksIFBhdWwgRHVycmFudCB3cm90ZToKPj4+ICsK
Pj4+ICtgPHBhdGg+YCBhbmQgYDx2YWx1ZXw+YCBzaG91bGQgYmUgc3VpdGFibGUgdG8gZm9ybXVs
YXRlIGEgYFdSSVRFYCBvcGVyYXRpb24KPj4+ICt0byB0aGUgcmVjZWl2aW5nIHhlbnN0b3JlZCBh
bmQgdGhlIGA8cGVybS1hcy1zdHJpbmc+fCtgIGxpc3Qgc2hvdWxkIGJlCj4+PiArc2ltaWxhcmx5
IHN1aXRhYmxlIHRvIGZvcm11bGF0ZSBhIHN1YnNlcXVlbnQgYFNFVF9QRVJNU2Agb3BlcmF0aW9u
Lgo+Pj4gK2A8cGVybS1jb3VudD5gIHNwZWNpZmllcyB0aGUgbnVtYmVyIG9mIGVudHJpZXMgaW4g
dGhlIGA8cGVybS1hcy1zdHJpbmc+fCtgCj4+PiArbGlzdCBhbmQgYDx2YWx1ZXw+YCBtdXN0IGJl
IHBsYWNlZCBhdCB0aGUgZW5kIGJlY2F1c2UgaXQgbWF5IGNvbnRhaW4gTlVMCj4+PiArb2N0ZXRz
Lgo+Pgo+PiBXaGF0IGlzIHRoZSBzaXplIG9mIDxwZXJtLWNvdW50Pj8gQWxzbywgd2UgbWF5IHdh
bnQgcGVybS1jb3VudCB0byBiZQo+PiBhbGlnbmVkIHRvIGl0cyBzaXplIHNvIHdlIGRvbid0IGhh
dmUgdG8gd29ycnkgb2YgdW5hbGlnbmVkIGFjY2Vzcy4KPj4KPj4gSG93IGFib3V0IG1vdmluZyA8
cGVybS1jb3VudD4gYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgZGF0YSBibG9iPwo+Pgo+IAo+IE5v
dCBzdXJlIHdlIHJlYWxseSBuZWVkIHRvIGNhcmUgYWJvdXQgYWxpZ25tZW50Li4uIEknbGwgbGVh
dmUgYXMtaXMgZm9yIHRoZSBtb21lbnQuCgpXZWxsLCB5b3UgYXJlIGp1c3QgZ29pbmcgdG8gbWFr
ZSB0aGUgc29mdHdhcmUgbW9yZSBjb21wbGV4IGJlY2F1c2UgeW91IAp3aWxsIGhhdmUgdG8gZG8g
bXVsdGlwbGUgbWVtb3J5IGFjY2VzcyB0byByZWFkIHRoZSBmaWVsZCAodW5hbGlnbiBhY2Nlc3Mg
CmFyZSBub3Qgc3VwcG9ydGVkIGV2ZXJ5d2hlcmUpLiBUaGUgZmFjdCB0aGF0IGZpZWxkIGlzIGp1
c3QgYWZ0ZXIgYSAKZmxleGlibGUgc2l6ZSBmaWVsZCBpcyBnb2luZyB0byBtYWtlIHRoZSBjb2Rl
IG11Y2ggd29yc2UuCgpSZS1vcmRlcmluZyB0aGUgZmllbGRzIGluIHRoZSBzdHJlYW0gaXMgZ29p
bmcgdG8gYmUgc28gbXVjaCBlYXNpZXIgdG8gCmRvLiBTbyBJIHdvdWxkIHN0cm9uZ2x5IHJlY29t
bWVuZCB0byByZXdvcmsgeW91ciBzdHJlYW0gaGVyZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

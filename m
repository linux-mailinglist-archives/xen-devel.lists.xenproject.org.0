Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05510AFCC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 13:52:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZwlh-0002xN-P2; Wed, 27 Nov 2019 12:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aWg5=ZT=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZwlg-0002oX-7R
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 12:50:04 +0000
X-Inumbo-ID: 6e0ac196-1114-11ea-a3b1-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e0ac196-1114-11ea-a3b1-12813bfff9fa;
 Wed, 27 Nov 2019 12:50:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a15so26537854wrf.9
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 04:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3+TA3yUNeIZm2xEuP4bDOJrbMcXsfYOlSWMSuFpstIo=;
 b=bKpSO/WmuiDNfFy5WaY4AJyp0AYJnQUjkyHRdO73Xltd+COmZaxxlah7WGgB8fCjuN
 OnPcs8YUgYqspvsN71qfud6FhaI15C71oATTsXpSL377TP+IN1qOjZhORh2/OpTGpBuS
 X/wP4xHcfmksinoVyvDEb9ywE/xCvcMiclQuFcw3KTqkf79qeJ5FR3Jkx6VYmw5lwRAx
 uqoOuw0+WnKMU1HcYrgEQNWHPqL12+i7htXJEoShgp5va8W8JbGynrmp0ZsNB7HYANDj
 ljp74kqQ26aw4DKEHI2vTfs3z2k34Yl+6qg/LkzTI6ng/tq7M7+9sWnAoSCGApjil2QT
 go6Q==
X-Gm-Message-State: APjAAAWR/xeyTGeBYsQTb7K53EHCMpo2B+CcMwMFwbJAFcGjuNejhVI/
 A69wv89QM1MnNalHt0mPTKg=
X-Google-Smtp-Source: APXvYqwjipTurwArDm5FVV+saO2uVF7AxJN9/rwyGE7ajGpdsmFkP9v8TgL7B+4VqCfnGjZshgeyiA==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr34592014wrs.183.1574859002860; 
 Wed, 27 Nov 2019 04:50:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id b14sm6662564wmj.18.2019.11.27.04.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 04:50:02 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20191126133023.48592-1-julien@xen.org>
 <8dd862df-433d-5b58-eacb-79a6b325ec2f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f1b6e591-7546-ab7e-8cce-bf7da1d72e37@xen.org>
Date: Wed, 27 Nov 2019 12:50:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <8dd862df-433d-5b58-eacb-79a6b325ec2f@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Update path to the livepatch
 documentation
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCtKdWVyZ2VuKQoKSGksCgpPbiAyNi8xMS8yMDE5IDE0OjA1LCBKYW4gQmV1bGljaCB3cm90ZToK
PiBPbiAyNi4xMS4yMDE5IDE0OjMwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENvbW1pdCBkNjYx
NjExZDA4ICJkb2NzL21hcmtkb3duOiBTd2l0Y2ggdG8gdXNpbmcgcGFuZG9jLCBhbmQgZml4Cj4+
IHVuZGVyc2NvcmUgZXNjYXBpbmciIGNvbnZlcnRlZCB0aGUgbGl2ZXBhdGNoIGRvY3VtZW50YXRp
b24gZnJvbSBtYXJrZG93bgo+PiB0byBwYW5kb2MuCj4+Cj4+IFVwZGF0ZSBNQUlOVEFJTkVSUyB0
byByZWZsZWN0IHRoZSBjaGFuZ2Ugc28gdGhlIGNvcnJlY3QgbWFpbnRhaW5lcnMgYXJlCj4+IEND
ZWQgdG8gdGhlIHBhdGNoZXMuCj4+Cj4+IEZpeGVzOiBkNjYxNjExZDA4ICgiZG9jcy9tYXJrZG93
bjogU3dpdGNoIHRvIHVzaW5nIHBhbmRvYywgYW5kIGZpeCB1bmRlcnNjb3JlIGVzY2FwaW5nIikK
Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KPiAKPiBBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQEp1ZXJnZW46IFRoaXMgaXMg
anVzdCBhbiB1cGRhdGUgdG8gTUFJTlRBSU5FUlMgZmlsZS4gV291bGQgeW91IGJlIGhhcHB5IAp0
byB0YWtlIGl0IGZvciBYZW4gNC4xMz8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

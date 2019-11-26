Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C21410A231
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:34:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZdka-0006H7-UI; Tue, 26 Nov 2019 16:31:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rzNk=ZS=gmail.com=nicolescu.roxana1996@srs-us1.protection.inumbo.net>)
 id 1iZdkZ-0006H0-Hl
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:31:39 +0000
X-Inumbo-ID: 384dfdfc-106a-11ea-83b8-bc764e2007e4
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 384dfdfc-106a-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 16:31:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id u18so3894961wmc.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 08:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=ve6GTrocjfTzd9GPyKJzE/b9uw2XsIad0ts6ezvOPAs=;
 b=cjiU2GPZwkeRVExMtw96QMwPBpNiwuKIoSiEpVGUAmDkI4KrhZ0sl7qxXoADb/QbxB
 p+RW1ebT1aGV06Km/DaX/UbXADNaMCQAxwOh0vDXz5yXWMHmOtpqPmBlB35acPyciHew
 GA3ZRNAqzjOIBGtV2LoOODFrzF9WgnuxNPJaXCZFICnWb/PfNkrprg7L6Lmyrz2ylHSu
 Mn2vHEPW58N6LqbVR9JfmUl0j+gAtrl3YTuEwurzlcgrwDG1zt4jszV5L61WmLFn2Idi
 wJuXxSjohI3Hbx9b1OTTTtMRuQfYKmSUQ1WbDnn2dMqZBeFyBZxK/18WYRCwkpdPHCOh
 Cj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=ve6GTrocjfTzd9GPyKJzE/b9uw2XsIad0ts6ezvOPAs=;
 b=Vs/PAIDQvG21dfNeU1GFC5YLDx5JFImzQrTaRpobvlEORywm1jqPKfKiqMvAErJ05L
 8drPw7nj0K7mVad4Uoc4WkIxIhPWDr6zKylLj5ChtfPdoEi4ACgqzfveBCDu+I566Lc8
 5BoaoHGM6FNk1sefvGMgWcPsPZ/MXYiyswZzYkH0mgiWfhfc/jmuhhM7eDJozw1UpGEl
 snPz8tz+TZ0lmMxlEx3V79/d5lWEUVQi3KIGOKP1FoOK+34rd6fH20TRKBvJ4eYDE+Y1
 mq8FCz8fx9vueUJJCUqvkJ3oXIZtE19T+mQDyON0qNL95zwe+9UEVAqxZbGnmXyoi6pB
 r7uQ==
X-Gm-Message-State: APjAAAUNBjPGGl9fcshn3BYwI3po4ABeJTGIE6T5/H84E7rasu2Z68Ji
 nlC3/MLQw1LBstpKdVg1Y7G/ieW1vRU=
X-Google-Smtp-Source: APXvYqzvI3cqy74Ltuh29sjMINfjwOJ+5s3rjfbZjFFyhJeQThYPZ8FZ4l47nqJQ1NyAnwTQzAcbYA==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr5464279wmc.9.1574785898027;
 Tue, 26 Nov 2019 08:31:38 -0800 (PST)
Received: from [172.19.2.96] ([141.85.233.142])
 by smtp.gmail.com with ESMTPSA id b15sm15108743wrx.77.2019.11.26.08.31.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Nov 2019 08:31:37 -0800 (PST)
To: xen-devel@lists.xenproject.org, jbeulich@novell.com
From: Roxana Nicolescu <nicolescu.roxana1996@gmail.com>
Message-ID: <38114655-3f61-f409-4e40-54a152f2513f@gmail.com>
Date: Tue, 26 Nov 2019 18:31:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Block Tap driver
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

SGVsbG8sCgoKSSBhbSBkb2luZyBhIGJpdCBvZiByZXNlYXJjaCBvbiBibG9jayB0YXAsIGFuZCBJ
IGNhbm5vdCBmaW5kIHRoZSBzb3VyY2UgCmNvZGUgb2YgYSBibGt0YXAgZHJpdmVyIG1vZHVsZSBp
biB0aGUgbGludXgga2VybmVsLgoKSSBzZWUgaW4gdGhlIGxpbnV4IHRyZWUgc29tZSByZWZlcmVu
Y2VzIHRvIGNvbW1pdHMgcmVsYXRlZCB0byBibGt0YXAsIApidXQgSSBhbSBzdHVjayB3aXRoIGZp
bmRpbmcgdGhlIGFjdHVhbCBjb2RlLgoKSXQgd291bGQgYmUgcmVhbGx5IGhlbHBmdWwgdG8gcHJv
dmlkZSBtZSBzb21lIGRpcmVjdGlvbnMgYmVjYXVzZSBJIGFtIApjb21wbGV0ZWx5IGxvc3QuCgpJ
IGFsc28gbm90aWNlZCB0aGF0IGJsa3RhcDIgZnJvbSB0b29scyB3YXMgcmVtb3ZlZCBhbmQgYWRk
ZWQgYWdhaW4gCmxhdGVyLiBXaGF0IGlzIHRoZSByZWFzb24gZm9yIHRoYXQ/CgpUaGFuayB5b3Ug
dmVyeSBtdWNoIQoKCkJlc3QsCgpSb3hhbmEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

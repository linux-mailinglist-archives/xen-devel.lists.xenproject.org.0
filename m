Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98265144B16
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:16:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8LD-0005Db-QL; Wed, 22 Jan 2020 05:14:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5LH-0006BY-75
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:02:03 +0000
X-Inumbo-ID: 0a32a49a-3cbb-11ea-9fd7-bc764e2007e4
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a32a49a-3cbb-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 02:01:01 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id c8so2392787ybk.9
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YDCfakVRsGQ2w2+SKZNkRsX90q9kmlt7RK176EMU/gs=;
 b=desEvJYQ+HfWlM4rzUxa7kBLkMZezSGne1bdF+6nuRm2mPvLp2peWMh/knxizY+qox
 XLOkjkk95fhXfQd234KRWiJwhgvn8hmq2cOILfWvhyA2ocpzU0AiRGrZJBxwhJfx4qRL
 APnLO2GAJycmWyA/sN+o8tTaGsy8lI67PhpDb5QP96pk9gA/4/vl14vHmSIpfr/Vhke3
 eUhQxbNuFrMj5BHGpdglVUiqNQQ0QL6l11A+Rh7ms9PQhs8I2fixT27kY1zfoedWHEku
 DWpuKvc9V/2BrrODDzdY1NsTM98GiLWn2jLxZV6cCOvSXojEWASiFqFHVGxb4rJwG7nS
 sdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YDCfakVRsGQ2w2+SKZNkRsX90q9kmlt7RK176EMU/gs=;
 b=AR6G3r/BXAN9E5pkmUflnlf/nlBmza6ceiLjtyd1cDbDUm18DXYt94Odyg2QTxVLAW
 0t0Oj30busyP8opvSpr4JxPlhMVY0Nv1ZxSFe7sljN23AdJ0Z56Ou0irYzLwnlLJq97d
 TUxE+sIUn+gUpBoiaUmAA1M/YR+N2A1hImdSsETNcWpLcQWQ9ynWJCZQxcGE8MQUjseA
 2ytGFFKX9rHW2qGloR5Mi3rP3IpOuAf1lXbTN3rc8t+V37gmcMERuklmF7cdDOyxQAUK
 xHuXTKt1m1JDek5TGoqWYZlbS1C54Vop5Hlx0R3KhO+ZqzgShYyHEIzdSqyGr3iie6Fw
 kKVg==
X-Gm-Message-State: APjAAAWmaYv2UZPg6Lv4zhuQ0wvSyQVrb1vzTlc3fc/L/Wu+1t5rQ0MY
 YnndWVul9E6suX/uUjfAyTvIUZQvFcMRnA==
X-Google-Smtp-Source: APXvYqyW9Q4JHuggN7AqXx9KPJH9UM+SHeyOxIMFAD16KHhhla5XDXpFLJviKxRID0Dhk4fOqsSMRA==
X-Received: by 2002:a25:868e:: with SMTP id z14mr5847894ybk.413.1579658460765; 
 Tue, 21 Jan 2020 18:01:00 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:01:00 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:58 -0600
Message-Id: <65b894a039c4097a25a8d0b19e56646574159b14.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 19/23] riscv: Add the lib directory
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKQWRkIHRo
ZSBsaWIgZGlyZWN0b3J5IHdpdGggZmluZF9uZXh0X2JpdCBzdXBwb3J0LgoKVGhpcyB3YXMgdGFr
ZW4gZnJvbSBMaW51eAoKU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIu
ZnJhbmNpc0B3ZGMuY29tPgotLS0KIHhlbi9hcmNoL3Jpc2N2L2xpYi9NYWtlZmlsZSAgICAgICAg
fCAgIDEgKwogeGVuL2FyY2gvcmlzY3YvbGliL2ZpbmRfbmV4dF9iaXQuYyB8IDI4NCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyODUgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3Jpc2N2L2xpYi9NYWtlZmlsZQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3Jpc2N2L2xpYi9maW5kX25leHRfYml0LmMKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUgYi94ZW4vYXJjaC9yaXNjdi9saWIvTWFr
ZWZpbGUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNmZhZTZhMWYxMAot
LS0gL2Rldi9udWxsCisrKyBiL3hlbi9hcmNoL3Jpc2N2L2xpYi9NYWtlZmlsZQpAQCAtMCwwICsx
IEBACitvYmoteSArPSBmaW5kX25leHRfYml0Lm8KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3Jpc2N2
L2xpYi9maW5kX25leHRfYml0LmMgYi94ZW4vYXJjaC9yaXNjdi9saWIvZmluZF9uZXh0X2JpdC5j
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmFkYWEyNWYzMmIKLS0tIC9k
ZXYvbnVsbAorKysgYi94ZW4vYXJjaC9yaXNjdi9saWIvZmluZF9uZXh0X2JpdC5jCkBAIC0wLDAg
KzEsMjg0IEBACisvKiBmaW5kX25leHRfYml0LmM6IGZhbGxiYWNrIGZpbmQgbmV4dCBiaXQgaW1w
bGVtZW50YXRpb24KKyAqCisgKiBDb3B5cmlnaHQgKEMpIDIwMDQgUmVkIEhhdCwgSW5jLiBBbGwg
UmlnaHRzIFJlc2VydmVkLgorICogV3JpdHRlbiBieSBEYXZpZCBIb3dlbGxzIChkaG93ZWxsc0By
ZWRoYXQuY29tKQorICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2Fu
IHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiBhcyBwdWJsaXNoZWQgYnkgdGhlIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24KKyAqIDIgb2YgdGhlIExpY2Vu
c2UsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKi8KKyNpbmNsdWRl
IDx4ZW4vYml0b3BzLmg+CisjaW5jbHVkZSA8YXNtL2JpdG9wcy5oPgorI2luY2x1ZGUgPGFzbS90
eXBlcy5oPgorI2luY2x1ZGUgPGFzbS9ieXRlb3JkZXIuaD4KKworI2RlZmluZSBCSVRPUF9XT1JE
KG5yKQkJKChucikgLyBCSVRTX1BFUl9MT05HKQorCisjaWZuZGVmIGZpbmRfbmV4dF9iaXQKKy8q
CisgKiBGaW5kIHRoZSBuZXh0IHNldCBiaXQgaW4gYSBtZW1vcnkgcmVnaW9uLgorICovCit1bnNp
Z25lZCBsb25nIGZpbmRfbmV4dF9iaXQoY29uc3QgdW5zaWduZWQgbG9uZyAqYWRkciwgdW5zaWdu
ZWQgbG9uZyBzaXplLAorCQkJICAgIHVuc2lnbmVkIGxvbmcgb2Zmc2V0KQoreworCWNvbnN0IHVu
c2lnbmVkIGxvbmcgKnAgPSBhZGRyICsgQklUT1BfV09SRChvZmZzZXQpOworCXVuc2lnbmVkIGxv
bmcgcmVzdWx0ID0gb2Zmc2V0ICYgfihCSVRTX1BFUl9MT05HLTEpOworCXVuc2lnbmVkIGxvbmcg
dG1wOworCisJaWYgKG9mZnNldCA+PSBzaXplKQorCQlyZXR1cm4gc2l6ZTsKKwlzaXplIC09IHJl
c3VsdDsKKwlvZmZzZXQgJT0gQklUU19QRVJfTE9ORzsKKwlpZiAob2Zmc2V0KSB7CisJCXRtcCA9
ICoocCsrKTsKKwkJdG1wICY9ICh+MFVMIDw8IG9mZnNldCk7CisJCWlmIChzaXplIDwgQklUU19Q
RVJfTE9ORykKKwkJCWdvdG8gZm91bmRfZmlyc3Q7CisJCWlmICh0bXApCisJCQlnb3RvIGZvdW5k
X21pZGRsZTsKKwkJc2l6ZSAtPSBCSVRTX1BFUl9MT05HOworCQlyZXN1bHQgKz0gQklUU19QRVJf
TE9ORzsKKwl9CisJd2hpbGUgKHNpemUgJiB+KEJJVFNfUEVSX0xPTkctMSkpIHsKKwkJaWYgKCh0
bXAgPSAqKHArKykpKQorCQkJZ290byBmb3VuZF9taWRkbGU7CisJCXJlc3VsdCArPSBCSVRTX1BF
Ul9MT05HOworCQlzaXplIC09IEJJVFNfUEVSX0xPTkc7CisJfQorCWlmICghc2l6ZSkKKwkJcmV0
dXJuIHJlc3VsdDsKKwl0bXAgPSAqcDsKKworZm91bmRfZmlyc3Q6CisJdG1wICY9ICh+MFVMID4+
IChCSVRTX1BFUl9MT05HIC0gc2l6ZSkpOworCWlmICh0bXAgPT0gMFVMKQkJLyogQXJlIGFueSBi
aXRzIHNldD8gKi8KKwkJcmV0dXJuIHJlc3VsdCArIHNpemU7CS8qIE5vcGUuICovCitmb3VuZF9t
aWRkbGU6CisJcmV0dXJuIHJlc3VsdCArIGZmcyh0bXApOworfQorRVhQT1JUX1NZTUJPTChmaW5k
X25leHRfYml0KTsKKyNlbmRpZgorCisjaWZuZGVmIGZpbmRfbmV4dF96ZXJvX2JpdAorLyoKKyAq
IFRoaXMgaW1wbGVtZW50YXRpb24gb2YgZmluZF97Zmlyc3QsbmV4dH1femVyb19iaXQgd2FzIHN0
b2xlbiBmcm9tCisgKiBMaW51cycgYXNtLWFscGhhL2JpdG9wcy5oLgorICovCit1bnNpZ25lZCBs
b25nIGZpbmRfbmV4dF96ZXJvX2JpdChjb25zdCB1bnNpZ25lZCBsb25nICphZGRyLCB1bnNpZ25l
ZCBsb25nIHNpemUsCisJCQkJIHVuc2lnbmVkIGxvbmcgb2Zmc2V0KQoreworCWNvbnN0IHVuc2ln
bmVkIGxvbmcgKnAgPSBhZGRyICsgQklUT1BfV09SRChvZmZzZXQpOworCXVuc2lnbmVkIGxvbmcg
cmVzdWx0ID0gb2Zmc2V0ICYgfihCSVRTX1BFUl9MT05HLTEpOworCXVuc2lnbmVkIGxvbmcgdG1w
OworCisJaWYgKG9mZnNldCA+PSBzaXplKQorCQlyZXR1cm4gc2l6ZTsKKwlzaXplIC09IHJlc3Vs
dDsKKwlvZmZzZXQgJT0gQklUU19QRVJfTE9ORzsKKwlpZiAob2Zmc2V0KSB7CisJCXRtcCA9ICoo
cCsrKTsKKwkJdG1wIHw9IH4wVUwgPj4gKEJJVFNfUEVSX0xPTkcgLSBvZmZzZXQpOworCQlpZiAo
c2l6ZSA8IEJJVFNfUEVSX0xPTkcpCisJCQlnb3RvIGZvdW5kX2ZpcnN0OworCQlpZiAofnRtcCkK
KwkJCWdvdG8gZm91bmRfbWlkZGxlOworCQlzaXplIC09IEJJVFNfUEVSX0xPTkc7CisJCXJlc3Vs
dCArPSBCSVRTX1BFUl9MT05HOworCX0KKwl3aGlsZSAoc2l6ZSAmIH4oQklUU19QRVJfTE9ORy0x
KSkgeworCQlpZiAofih0bXAgPSAqKHArKykpKQorCQkJZ290byBmb3VuZF9taWRkbGU7CisJCXJl
c3VsdCArPSBCSVRTX1BFUl9MT05HOworCQlzaXplIC09IEJJVFNfUEVSX0xPTkc7CisJfQorCWlm
ICghc2l6ZSkKKwkJcmV0dXJuIHJlc3VsdDsKKwl0bXAgPSAqcDsKKworZm91bmRfZmlyc3Q6CisJ
dG1wIHw9IH4wVUwgPDwgc2l6ZTsKKwlpZiAodG1wID09IH4wVUwpCS8qIEFyZSBhbnkgYml0cyB6
ZXJvPyAqLworCQlyZXR1cm4gcmVzdWx0ICsgc2l6ZTsJLyogTm9wZS4gKi8KK2ZvdW5kX21pZGRs
ZToKKwlyZXR1cm4gcmVzdWx0ICsgZmZ6KHRtcCk7Cit9CitFWFBPUlRfU1lNQk9MKGZpbmRfbmV4
dF96ZXJvX2JpdCk7CisjZW5kaWYKKworI2lmbmRlZiBmaW5kX2ZpcnN0X2JpdAorLyoKKyAqIEZp
bmQgdGhlIGZpcnN0IHNldCBiaXQgaW4gYSBtZW1vcnkgcmVnaW9uLgorICovCit1bnNpZ25lZCBs
b25nIGZpbmRfZmlyc3RfYml0KGNvbnN0IHVuc2lnbmVkIGxvbmcgKmFkZHIsIHVuc2lnbmVkIGxv
bmcgc2l6ZSkKK3sKKwljb25zdCB1bnNpZ25lZCBsb25nICpwID0gYWRkcjsKKwl1bnNpZ25lZCBs
b25nIHJlc3VsdCA9IDA7CisJdW5zaWduZWQgbG9uZyB0bXA7CisKKwl3aGlsZSAoc2l6ZSAmIH4o
QklUU19QRVJfTE9ORy0xKSkgeworCQlpZiAoKHRtcCA9ICoocCsrKSkpCisJCQlnb3RvIGZvdW5k
OworCQlyZXN1bHQgKz0gQklUU19QRVJfTE9ORzsKKwkJc2l6ZSAtPSBCSVRTX1BFUl9MT05HOwor
CX0KKwlpZiAoIXNpemUpCisJCXJldHVybiByZXN1bHQ7CisKKwl0bXAgPSAoKnApICYgKH4wVUwg
Pj4gKEJJVFNfUEVSX0xPTkcgLSBzaXplKSk7CisJaWYgKHRtcCA9PSAwVUwpCQkvKiBBcmUgYW55
IGJpdHMgc2V0PyAqLworCQlyZXR1cm4gcmVzdWx0ICsgc2l6ZTsJLyogTm9wZS4gKi8KK2ZvdW5k
OgorCXJldHVybiByZXN1bHQgKyBmZnModG1wKTsKK30KK0VYUE9SVF9TWU1CT0woZmluZF9maXJz
dF9iaXQpOworI2VuZGlmCisKKyNpZm5kZWYgZmluZF9maXJzdF96ZXJvX2JpdAorLyoKKyAqIEZp
bmQgdGhlIGZpcnN0IGNsZWFyZWQgYml0IGluIGEgbWVtb3J5IHJlZ2lvbi4KKyAqLwordW5zaWdu
ZWQgbG9uZyBmaW5kX2ZpcnN0X3plcm9fYml0KGNvbnN0IHVuc2lnbmVkIGxvbmcgKmFkZHIsIHVu
c2lnbmVkIGxvbmcgc2l6ZSkKK3sKKwljb25zdCB1bnNpZ25lZCBsb25nICpwID0gYWRkcjsKKwl1
bnNpZ25lZCBsb25nIHJlc3VsdCA9IDA7CisJdW5zaWduZWQgbG9uZyB0bXA7CisKKwl3aGlsZSAo
c2l6ZSAmIH4oQklUU19QRVJfTE9ORy0xKSkgeworCQlpZiAofih0bXAgPSAqKHArKykpKQorCQkJ
Z290byBmb3VuZDsKKwkJcmVzdWx0ICs9IEJJVFNfUEVSX0xPTkc7CisJCXNpemUgLT0gQklUU19Q
RVJfTE9ORzsKKwl9CisJaWYgKCFzaXplKQorCQlyZXR1cm4gcmVzdWx0OworCisJdG1wID0gKCpw
KSB8ICh+MFVMIDw8IHNpemUpOworCWlmICh0bXAgPT0gfjBVTCkJLyogQXJlIGFueSBiaXRzIHpl
cm8/ICovCisJCXJldHVybiByZXN1bHQgKyBzaXplOwkvKiBOb3BlLiAqLworZm91bmQ6CisJcmV0
dXJuIHJlc3VsdCArIGZmeih0bXApOworfQorRVhQT1JUX1NZTUJPTChmaW5kX2ZpcnN0X3plcm9f
Yml0KTsKKyNlbmRpZgorCisjaWZkZWYgX19CSUdfRU5ESUFOCisKKy8qIGluY2x1ZGUvbGludXgv
Ynl0ZW9yZGVyIGRvZXMgbm90IHN1cHBvcnQgInVuc2lnbmVkIGxvbmciIHR5cGUgKi8KK3N0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyBleHQyX3N3YWJwKGNvbnN0IHVuc2lnbmVkIGxvbmcgKiB4
KQoreworI2lmIEJJVFNfUEVSX0xPTkcgPT0gNjQKKwlyZXR1cm4gKHVuc2lnbmVkIGxvbmcpIF9f
c3dhYjY0cCgodTY0ICopIHgpOworI2VsaWYgQklUU19QRVJfTE9ORyA9PSAzMgorCXJldHVybiAo
dW5zaWduZWQgbG9uZykgX19zd2FiMzJwKCh1MzIgKikgeCk7CisjZWxzZQorI2Vycm9yIEJJVFNf
UEVSX0xPTkcgbm90IGRlZmluZWQKKyNlbmRpZgorfQorCisvKiBpbmNsdWRlL2xpbnV4L2J5dGVv
cmRlciBkb2Vzbid0IHN1cHBvcnQgInVuc2lnbmVkIGxvbmciIHR5cGUgKi8KK3N0YXRpYyBpbmxp
bmUgdW5zaWduZWQgbG9uZyBleHQyX3N3YWIoY29uc3QgdW5zaWduZWQgbG9uZyB5KQoreworI2lm
IEJJVFNfUEVSX0xPTkcgPT0gNjQKKwlyZXR1cm4gKHVuc2lnbmVkIGxvbmcpIF9fc3dhYjY0KCh1
NjQpIHkpOworI2VsaWYgQklUU19QRVJfTE9ORyA9PSAzMgorCXJldHVybiAodW5zaWduZWQgbG9u
ZykgX19zd2FiMzIoKHUzMikgeSk7CisjZWxzZQorI2Vycm9yIEJJVFNfUEVSX0xPTkcgbm90IGRl
ZmluZWQKKyNlbmRpZgorfQorCisjaWZuZGVmIGZpbmRfbmV4dF96ZXJvX2JpdF9sZQordW5zaWdu
ZWQgbG9uZyBmaW5kX25leHRfemVyb19iaXRfbGUoY29uc3Qgdm9pZCAqYWRkciwgdW5zaWduZWQK
KwkJbG9uZyBzaXplLCB1bnNpZ25lZCBsb25nIG9mZnNldCkKK3sKKwljb25zdCB1bnNpZ25lZCBs
b25nICpwID0gYWRkcjsKKwl1bnNpZ25lZCBsb25nIHJlc3VsdCA9IG9mZnNldCAmIH4oQklUU19Q
RVJfTE9ORyAtIDEpOworCXVuc2lnbmVkIGxvbmcgdG1wOworCisJaWYgKG9mZnNldCA+PSBzaXpl
KQorCQlyZXR1cm4gc2l6ZTsKKwlwICs9IEJJVE9QX1dPUkQob2Zmc2V0KTsKKwlzaXplIC09IHJl
c3VsdDsKKwlvZmZzZXQgJj0gKEJJVFNfUEVSX0xPTkcgLSAxVUwpOworCWlmIChvZmZzZXQpIHsK
KwkJdG1wID0gZXh0Ml9zd2FicChwKyspOworCQl0bXAgfD0gKH4wVUwgPj4gKEJJVFNfUEVSX0xP
TkcgLSBvZmZzZXQpKTsKKwkJaWYgKHNpemUgPCBCSVRTX1BFUl9MT05HKQorCQkJZ290byBmb3Vu
ZF9maXJzdDsKKwkJaWYgKH50bXApCisJCQlnb3RvIGZvdW5kX21pZGRsZTsKKwkJc2l6ZSAtPSBC
SVRTX1BFUl9MT05HOworCQlyZXN1bHQgKz0gQklUU19QRVJfTE9ORzsKKwl9CisKKwl3aGlsZSAo
c2l6ZSAmIH4oQklUU19QRVJfTE9ORyAtIDEpKSB7CisJCWlmICh+KHRtcCA9ICoocCsrKSkpCisJ
CQlnb3RvIGZvdW5kX21pZGRsZV9zd2FwOworCQlyZXN1bHQgKz0gQklUU19QRVJfTE9ORzsKKwkJ
c2l6ZSAtPSBCSVRTX1BFUl9MT05HOworCX0KKwlpZiAoIXNpemUpCisJCXJldHVybiByZXN1bHQ7
CisJdG1wID0gZXh0Ml9zd2FicChwKTsKK2ZvdW5kX2ZpcnN0OgorCXRtcCB8PSB+MFVMIDw8IHNp
emU7CisJaWYgKHRtcCA9PSB+MFVMKQkvKiBBcmUgYW55IGJpdHMgemVybz8gKi8KKwkJcmV0dXJu
IHJlc3VsdCArIHNpemU7IC8qIE5vcGUuIFNraXAgZmZ6ICovCitmb3VuZF9taWRkbGU6CisJcmV0
dXJuIHJlc3VsdCArIGZmeih0bXApOworCitmb3VuZF9taWRkbGVfc3dhcDoKKwlyZXR1cm4gcmVz
dWx0ICsgZmZ6KGV4dDJfc3dhYih0bXApKTsKK30KK0VYUE9SVF9TWU1CT0woZmluZF9uZXh0X3pl
cm9fYml0X2xlKTsKKyNlbmRpZgorCisjaWZuZGVmIGZpbmRfbmV4dF9iaXRfbGUKK3Vuc2lnbmVk
IGxvbmcgZmluZF9uZXh0X2JpdF9sZShjb25zdCB2b2lkICphZGRyLCB1bnNpZ25lZAorCQlsb25n
IHNpemUsIHVuc2lnbmVkIGxvbmcgb2Zmc2V0KQoreworCWNvbnN0IHVuc2lnbmVkIGxvbmcgKnAg
PSBhZGRyOworCXVuc2lnbmVkIGxvbmcgcmVzdWx0ID0gb2Zmc2V0ICYgfihCSVRTX1BFUl9MT05H
IC0gMSk7CisJdW5zaWduZWQgbG9uZyB0bXA7CisKKwlpZiAob2Zmc2V0ID49IHNpemUpCisJCXJl
dHVybiBzaXplOworCXAgKz0gQklUT1BfV09SRChvZmZzZXQpOworCXNpemUgLT0gcmVzdWx0Owor
CW9mZnNldCAmPSAoQklUU19QRVJfTE9ORyAtIDFVTCk7CisJaWYgKG9mZnNldCkgeworCQl0bXAg
PSBleHQyX3N3YWJwKHArKyk7CisJCXRtcCAmPSAofjBVTCA8PCBvZmZzZXQpOworCQlpZiAoc2l6
ZSA8IEJJVFNfUEVSX0xPTkcpCisJCQlnb3RvIGZvdW5kX2ZpcnN0OworCQlpZiAodG1wKQorCQkJ
Z290byBmb3VuZF9taWRkbGU7CisJCXNpemUgLT0gQklUU19QRVJfTE9ORzsKKwkJcmVzdWx0ICs9
IEJJVFNfUEVSX0xPTkc7CisJfQorCisJd2hpbGUgKHNpemUgJiB+KEJJVFNfUEVSX0xPTkcgLSAx
KSkgeworCQl0bXAgPSAqKHArKyk7CisJCWlmICh0bXApCisJCQlnb3RvIGZvdW5kX21pZGRsZV9z
d2FwOworCQlyZXN1bHQgKz0gQklUU19QRVJfTE9ORzsKKwkJc2l6ZSAtPSBCSVRTX1BFUl9MT05H
OworCX0KKwlpZiAoIXNpemUpCisJCXJldHVybiByZXN1bHQ7CisJdG1wID0gZXh0Ml9zd2FicChw
KTsKK2ZvdW5kX2ZpcnN0OgorCXRtcCAmPSAofjBVTCA+PiAoQklUU19QRVJfTE9ORyAtIHNpemUp
KTsKKwlpZiAodG1wID09IDBVTCkJCS8qIEFyZSBhbnkgYml0cyBzZXQ/ICovCisJCXJldHVybiBy
ZXN1bHQgKyBzaXplOyAvKiBOb3BlLiAqLworZm91bmRfbWlkZGxlOgorCXJldHVybiByZXN1bHQg
KyBmZnModG1wKTsKKworZm91bmRfbWlkZGxlX3N3YXA6CisJcmV0dXJuIHJlc3VsdCArIGZmcyhl
eHQyX3N3YWIodG1wKSk7Cit9CitFWFBPUlRfU1lNQk9MKGZpbmRfbmV4dF9iaXRfbGUpOworI2Vu
ZGlmCisKKyNlbmRpZiAvKiBfX0JJR19FTkRJQU4gKi8KLS0gCjIuMjUuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=

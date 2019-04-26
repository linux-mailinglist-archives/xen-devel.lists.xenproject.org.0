Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAE9B48F
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2019 23:23:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hKUkL-00060p-UC; Sat, 27 Apr 2019 21:20:33 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.106])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <test-bounces@lists.fedoraproject.org>)
 id 1hKUkK-00060k-8W
 for xen-devel@lists.xensource.com; Sat, 27 Apr 2019 21:20:32 +0000
Received: from [46.226.52.196] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 1B/42-23323-E97C4CC5;
 Sat, 27 Apr 2019 21:20:30 +0000
Authentication-Results: mx.messagelabs.com; spf=softfail 
 (server-6.tower-284.messagelabs.com: transitioning domain of 
 lists.fedoraproject.org does not designate 67.231.153.155 as permitted 
 sender) smtp.mailfrom=lists.fedoraproject.org; dkim=pass (good 
 signature) header.i=@onbmc.com header.s=mail; dkim=fail (bad signature) 
 header.i=@fedoraproject.org header.s=bastion; dmarc=none (no record) 
 header.from=fedoraproject.org
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSe0hTcRT2tzu3W7j6ORWPyx4M7eldXrMwCiq
 MqH8kJAzCqGu7ucU2bXeiZslcWrbSDAJ1uZVSihbaez4i1FxhGZWRmVlUvot8YO+gurtXi/77
 Dt93zvedwyEJZbFMRbIZFtZsYgxq2Uxp7FDpGcp5ry0xcrJjcczr02Py9Wizu7BRvhXt8NWbk
 lIydvvqLv92o9SSoAxbQb7cis4F2NEMUolrEThGSTuayeNhBE25LRIvATgano+1y0RiCMHI9U
 KpWORI4OyROrlY5CJ4aX3nK7asgMbj1wQsxVHwtqFDKuJNcCrXSXgbpPgxAbW2CzKRiIeuCru
 vSPQSMPrcLhMnJYL73aBcxLPgyfC3qVAcDDSXCliB48DWUi5oAvAG6HZPIC+W8c62lnHBORCf
 QDDq2SiahUNHv0eYPwOvgdzmRiSucEoC7ga70Dwbh0L9SKEgCsIU9Fy5JRfNaHB2Ncmm17x5p
 xmJeCHkd74QbgH4rQRy8p8JIgJnwcTJ11N3ASg5801owBiD63wDvwHJO++E6s55RSjKwVcEXg
 J1jcsdQvMyuHGtDDkEZ39oL+2XnkNEDYpJMuuTdRYjozdQdGQkRdNRFL16FUVHr9AwB6gkDZt
 GpbOchaI1TDqn4TKNewxajYm1XEX8k2hT207Wo8Gq5FYUQkrUQYojBW2JyllJKdpMHcPpdpnT
 DCzXikJJUg2Ksrs8529mk9mMvXoD/2nTNJB+6kAF5n9NqeBSGSOnTxap+4giy/IGnYRSakoxs
 apgRZ+HF2GvSJdm+jti+l870VxVgAL5+Pgo/VJZs1Fv+Z9/j4JJpA5QbPcm8dObLH+d3vMhJH
 wIbXWrN4SF+UeprMjqf9DFfPaE11zKvhxSXDSnaveHuJa649a9K7sjNAOh85f/+pLVG3use2v
 lxKecoldlEV1rv/foL+a7I1w3KvocH99kh21bV04vOLxln+pn3em1KPppws6ipkhq3OYzUPnQ
 E/vo0I8HtT3fXSgnb//RsISbNbfjF02mfB0JW9P3dJnxhFrK6Rh6KWHmmD9K/8hqqgMAAA==
X-Env-Sender: test-bounces@lists.fedoraproject.org
X-Msg-Ref: server-6.tower-284.messagelabs.com!1556400027!7580251!1
X-Originating-IP: [67.231.153.155]
X-SpamReason: No, hits=0.8 required=7.0 tests=newsletters: ,
 DATE_IN_PAST_24_48,UNPARSEABLE_RELAY
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11345 invoked from network); 27 Apr 2019 21:20:29 -0000
Received: from mx0b-00030c01.pphosted.com (HELO mx0b-00030c01.pphosted.com)
 (67.231.153.155)
 by server-6.tower-284.messagelabs.com with AES256-GCM-SHA384 encrypted SMTP;
 27 Apr 2019 21:20:29 -0000
Received: from pps.filterd (m0122214.ppops.net [127.0.0.1])
 by mx0a-00030c01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3RL9Bic004004; Sat, 27 Apr 2019 16:20:22 -0500
Received: from chu1x9dlp01.cust.transunion.com ([66.175.240.251])
 by mx0a-00030c01.pphosted.com with ESMTP id 2s4jh9hfdq-98
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Apr 2019 16:20:22 -0500
X-AuditID: 0adc1a49-a3cf09e000000b23-df-5cc4c795f637
Received: from cho1w9mx02.corp.transunion.com (chu1w9ap03.cust.transunion.com
 [10.220.26.59])
 by chu1x9dlp01.cust.transunion.com (Symantec Messaging Gateway) with SMTP id
 7F.30.02851.597C4CC5; Sat, 27 Apr 2019 16:20:21 -0500 (CDT)
Received: from cho3w9mx10.corp.transunion.com (10.216.40.175) by
 cho1w9mx02.corp.transunion.com (10.219.26.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1591.10; Sat, 27 Apr 2019 16:20:21 -0500
Received: from Pickup by CHO3W9MX10.corp.transunion.com with Microsoft SMTP
 Server id 15.1.1591.10; Sat, 27 Apr 2019 21:17:48 +0000
X-Original-To: bzinfra@transunion-qa-mail.onbmc.com
Delivered-To: bzinfra@transunion-qa-mail.onbmc.com
DKIM-Filter: OpenDKIM Filter v2.11.0 chi4-smtp-1.onbmc.com 5A10F4371B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onbmc.com; s=mail;
 t=1556296389; bh=fSZ0RgK2W6U1RGpEIyvDb4nmJurxsGH/8eIc3i2J14M=;
 h=Subject:From:To:Date:In-Reply-To:References:CC:Reply-To:List-Id:
 List-Archive:List-Help:List-Post:List-Subscribe:List-Unsubscribe:
 From;
 b=eyM/zWIT+vbcc/mjW3umPUzXw5jQmmwD5/0CriZ2IVCVGJgddIQp5yh9oIoz1f+Bg
 GPZdESE04PcCn4RLL4Xg+1C+bDiBwNJmIASyZGFZUam4S99PMhRr1Z7FdwhT9PAwlX
 9Po5z+Wclhk+fs+UWuEQgyPMmc6hihN7e4u2ld8U=
DKIM-Filter: OpenDKIM Filter v2.11.0 bastion01.phx2.fedoraproject.org
 D1E296149F84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fedoraproject.org;
 s=bastion; t=1556296385;
 bh=e3V+Tzz+1KWnq+rirYifUTwvtY1l5c6/FQy5D8foAyc=;
 h=Subject:From:To:Date:In-Reply-To:References:CC:Reply-To:List-Id:
 List-Archive:List-Help:List-Post:List-Subscribe:List-Unsubscribe:
 From;
 b=bJ11vgPpWV4Rl0ncKpVK1w3xet/d3lmYFvMrkCimJhmRxrASH1S3R1gWZWC2Q1SA/
 FFF8Mi2tTulSF2sXQaBQkBaQGseZSX9NZyVhvnZmp3HvCVp9gQMTZ2XjfTUriRStPG
 vRegIaxqf+SOyB5r+16Au5AHg83rhtyNYCL5tCag=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 mailman01.phx2.fedoraproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_PASS autolearn=disabled version=3.4.0
Message-ID: <60eb4374d39aa140f82d94dc4dbf40548be87be1.camel@fedoraproject.org>
From: Adam Williamson <adamwill@fedoraproject.org>
To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>, Konrad Rzeszutek Wilk <konrad@kernel.org>
Date: Fri, 26 Apr 2019 09:32:47 -0700
In-Reply-To: <1499372357.22465.108.camel@fedoraproject.org>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <CACJDEmq4rp7C3EMD2j7+5yi5R_Na_6ejuZhH4aY2=d+g6dBNbQ@mail.gmail.com>
 <1499372357.22465.108.camel@fedoraproject.org>
Organization: Fedora Project
User-Agent: Evolution 3.32.1 (3.32.1-1.fc30) 
Message-ID-Hash: OCZUL7EDONHKNRVOVRIZBOLANMJNJHHF
X-Message-ID-Hash: OCZUL7EDONHKNRVOVRIZBOLANMJNJHHF
X-MailFrom: adamwill@fedoraproject.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop;
 banned-address; member-moderation; header-match-config-1;
 header-match-config-2; header-match-config-3;
 header-match-test.lists.fedoraproject.org-0; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Archived-At: <https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org/message/OCZUL7EDONHKNRVOVRIZBOLANMJNJHHF/>
List-Archive: <https://lists.fedoraproject.org/archives/list/test@lists.fedoraproject.org/>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=60
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=187 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904260113
X-CrossPremisesHeadersFilteredBySendConnector: cho1w9mx02.corp.transunion.com
X-OrganizationHeadersPreserved: cho1w9mx02.corp.transunion.com
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRmVeSWpSXmKPExsXCdUfKWnfq8SMxBp2njCyWLX7KaPG/8Qqb
 ReuSK+wW96a8Z3dg8di0qpPN48uWd4we2/t2sXt8fHqLJYAlissmJTUnsyy1SN8ugSvjz50m
 1oI9ohVNvR3sDYwLhLsYOTkkBEwkrr8/ydbFyMUhJPCCUeJL4ydmCKeFSeLfoyNQTiujxLJD
 t5hAWoQEDCV2v/3LCNFuLLGrezMriM0iYCTxcOcZFgjbTWJiy1ywZhaB68wSBzpms4MkGAVm
 Mko8bqyDKAqSuLaoixWi6AmzxLw7S4C6OYCmxkrsOScNsYBX4vSU42wQ4RKJSWcTQMK8An4S
 TQcXgo0UFnCUuLH9I9g9bEA3NB38wAIyUkSgj1Hi8+wWJohdqhJnnhxlA7E5BawlWg7sYoT4
 bCqTROvi88wgCX4BGYkdL/vAikQFdCVubdzDDrHNUGLutd1sMB9vO3wA6ns1iY5LN9lBBkkI
 PGSSaOy4ClbELFAj8WDeU6gGCYkZs3+ANQgICEjMW7KTCeQbIaAnV16Sm8BoOAvIYxbQlFi/
 S38WWLO2xNbNcxhngW0WlDg58wnLAkbmVYzyyRmlhhWWKTkFBoZ6yaXFJXolRYl5xaV5mfl5
 esn5uZsYIYnFcwfjzjb/Q4wCHIxKPLwKqyaFC7EmlhVX5h5ilOZgURLnjf3xKlpIID2xJDU7
 NbUgtSi+qDQntfgQIxMHp1QD40KtTQc9pnvXRbTNTZvB9Oiv6BPD2tyiawyyfm2/licvVA1e
 scNGimNiVutthQ4G6V/H6/f8SJj7OEdOtqbrZPk06bUpIR8vK1a8C5U7vC6p9qtpHXNG1MEP
 geuutsz3qDxfc9RPZ38ls92ui51MvEdPf/7yrz46yPR8X0DE1bU6i7ZEp04OVWIpzkg01GIu
 Kk4EAIR+8sYNAwAA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-27_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904270151
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>
Cc: "Xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE3LTA3LTA2IGF0IDEzOjE5IC0wNzAwLCBBZGFtIFdpbGxpYW1zb24gd3JvdGU6
DQo+IE9uIFRodSwgMjAxNy0wNy0wNiBhdCAxNTo1OSAtMDQwMCwgS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIHdyb3RlOg0KPiA+ID4gPiBJIHdvdWxkIHByZWZlciBmb3IgaXQgdG8gcmVtYWluIGFzIGl0
IGlzLg0KPiA+ID4gDQo+ID4gPiBUaGlzIGlzIG9ubHkgcHJhY3RpY2FsIGlmIGl0J3MgZ29pbmcg
dG8gYmUgdGVzdGVkLCBhbmQgdGVzdGVkIHJlZ3VsYXJseQ0KPiA+ID4gLSBub3QgKm9ubHkqIG9u
IHRoZSBmaW5hbCByZWxlYXNlIGNhbmRpZGF0ZSwgcmlnaHQgYmVmb3JlIHdlIHNpZ24gb2ZmDQo+
ID4gPiBvbiB0aGUgcmVsZWFzZS4gSXQgbmVlZHMgdG8gYmUgdGVzdGVkIHJlZ3VsYXJseSB0aHJv
dWdob3V0IHRoZSByZWxlYXNlDQo+ID4gPiBjeWNsZSwgb24gdGhlIGNvbXBvc2VzIHRoYXQgYXJl
ICJub21pbmF0ZWQgZm9yIHRlc3RpbmciLg0KPiA+IA0KPiA+IFJpZ2h0LCB3aGljaCBpcyB3aHkg
SSBhbSBoYXBweSB0aGF0IHlvdSBoYXZlIHBvaW50ZWQgbWUgdG8gdGhlIHJpZ2h0DQo+ID4gcGxh
Y2Ugc28gSSBjYW4gYmUgdXAtdG8tZGF0ZS4NCj4gDQo+IEdyZWF0LCB0aGFua3MuIFNvIGxldCdz
IGxlYXZlIGl0IGFzIGl0IGlzIGZvciBub3csIGJ1dCB3ZSdsbCBrZWVwIGFuDQo+IGV5ZSBvbiB0
aGlzIGR1cmluZyBGMjcgY3ljbGUuIElmIHdlIGdldCB0bywgc2F5LCBCZXRhIGFuZCB0aGVyZSBh
cmUgbm8NCj4gcmVzdWx0cyBmb3IgdGhlIHRlc3QsIHRoYXQncyBnb25uYSBiZSBhIHByb2JsZW0u
IFRoYW5rcyENCg0KU28sIGZvciBGZWRvcmEgMzAsIHRoaXMgd2FzIG5vdCB0ZXN0ZWQgdGhyb3Vn
aG91dCB0aGUgd2hvbGUgY3ljbGUuIEkNCnRoaW5rIHdlIGNhbiBjb25zaWRlciB0aGUgcHJvcG9z
YWwgdG8gcmVtb3ZlIHRoZSBjcml0ZXJpb24gYWN0aXZlDQphZ2Fpbi4NCi0tIA0KQWRhbSBXaWxs
aWFtc29uDQpGZWRvcmEgUUEgQ29tbXVuaXR5IE1vbmtleQ0KSVJDOiBhZGFtdyB8IFR3aXR0ZXI6
IEFkYW1XX0ZlZG9yYSB8IFhNUFA6IGFkYW13IEFUIGhhcHB5YXNzYXNzaW4gLiBuZXQNCmh0dHBz
Oi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwLTNBX193d3cuaGFwcHlh
c3Nhc3Npbi5uZXQmZD1Ed0lHYVEmYz03Z24wUGxBbXJhVjN6ci1rMzg1S2hLQXo5TlR4MGR3b2Nr
ajV2SXNyNVN3JnI9RjhEZ0lMSC12bklHZHhqdjkzVVA5dm5yOGV1NjBDRTBENTltWEw1YVphVSZt
PXpVbUI1a25HTmtrZGprQkp5aTcyb2VjNmtNZExjRTNFQ1M5TWRlVFNoYVEmcz1fZ3BWWUVseTQ4
ZGNfZEk1dnhJdktqNVdaQ3Nvd1piOWstR09WLWQ1aUhFJmU9DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwp0ZXN0IG1haWxpbmcgbGlzdCAtLSB0ZXN0QGxp
c3RzLmZlZG9yYXByb2plY3Qub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gdGVz
dC1sZWF2ZUBsaXN0cy5mZWRvcmFwcm9qZWN0Lm9yZwpGZWRvcmEgQ29kZSBvZiBDb25kdWN0OiBo
dHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dldGZl
ZG9yYS5vcmdfY29kZS0yRG9mLTJEY29uZHVjdC5odG1sJmQ9RHdJR2FRJmM9N2duMFBsQW1yYVYz
enItazM4NUtoS0F6OU5UeDBkd29ja2o1dklzcjVTdyZyPUY4RGdJTEgtdm5JR2R4anY5M1VQOXZu
cjhldTYwQ0UwRDU5bVhMNWFaYVUmbT16VW1CNWtuR05ra2Rqa0JKeWk3Mm9lYzZrTWRMY0UzRUNT
OU1kZVRTaGFRJnM9VzM4dXIxdmF0bHdOeG5kMmlHSVhPc2JEVm9rUlFsSG8tTUpsVk1ZbUt3dyZl
PQpMaXN0IEd1aWRlbGluZXM6IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91
cmw/dT1odHRwcy0zQV9fZmVkb3JhcHJvamVjdC5vcmdfd2lraV9NYWlsaW5nLTVGbGlzdC01Rmd1
aWRlbGluZXMmZD1Ed0lHYVEmYz03Z24wUGxBbXJhVjN6ci1rMzg1S2hLQXo5TlR4MGR3b2NrajV2
SXNyNVN3JnI9RjhEZ0lMSC12bklHZHhqdjkzVVA5dm5yOGV1NjBDRTBENTltWEw1YVphVSZtPXpV
bUI1a25HTmtrZGprQkp5aTcyb2VjNmtNZExjRTNFQ1M5TWRlVFNoYVEmcz1TcnlGbDU1OG9DbUZf
QlpnQ1F6UFdJMjU5b1l2UXpROURXektnVFByYURZJmU9Ckxpc3QgQXJjaGl2ZXM6IGh0dHBzOi8v
dXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fbGlzdHMuZmVkb3Jh
cHJvamVjdC5vcmdfYXJjaGl2ZXNfbGlzdF90ZXN0LTQwbGlzdHMuZmVkb3JhcHJvamVjdC5vcmcm
ZD1Ed0lHYVEmYz03Z24wUGxBbXJhVjN6ci1rMzg1S2hLQXo5TlR4MGR3b2NrajV2SXNyNVN3JnI9
RjhEZ0lMSC12bklHZHhqdjkzVVA5dm5yOGV1NjBDRTBENTltWEw1YVphVSZtPXpVbUI1a25HTmtr
ZGprQkp5aTcyb2VjNmtNZExjRTNFQ1M5TWRlVFNoYVEmcz11V1NKMFE4dllrT3VIcmtQWFN3NWpH
TURYV0dUWm1uZF9oSDBMYnc4MUpNJmU9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs

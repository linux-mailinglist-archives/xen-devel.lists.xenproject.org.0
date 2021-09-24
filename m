Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF99416B00
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:30:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194874.347226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcqY-00055C-T5; Fri, 24 Sep 2021 04:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194874.347226; Fri, 24 Sep 2021 04:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcqY-00051u-Pq; Fri, 24 Sep 2021 04:30:02 +0000
Received: by outflank-mailman (input) for mailman id 194874;
 Fri, 24 Sep 2021 04:30:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTcqX-0004ux-97
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:30:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13cd8dfa-1cf0-11ec-baa7-12813bfff9fa;
 Fri, 24 Sep 2021 04:29:59 +0000 (UTC)
Received: from AM5PR0301CA0025.eurprd03.prod.outlook.com
 (2603:10a6:206:14::38) by AM7PR08MB5479.eurprd08.prod.outlook.com
 (2603:10a6:20b:104::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 04:29:46 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::86) by AM5PR0301CA0025.outlook.office365.com
 (2603:10a6:206:14::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 04:29:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:29:46 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Fri, 24 Sep 2021 04:29:43 +0000
Received: from 02980e9bd565.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F156BAF8-02A0-447F-BB18-DB787B447883.1; 
 Fri, 24 Sep 2021 04:29:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02980e9bd565.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:29:33 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com (2603:10a6:102:132::14)
 by PAXPR08MB6477.eurprd08.prod.outlook.com (2603:10a6:102:12d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 04:29:31 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be]) by PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be%6]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:29:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 13cd8dfa-1cf0-11ec-baa7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3/But/Psy4Wob6vpKoPsMIkVP5NEP9GBQsgC6TY/NY=;
 b=2Ew83vGHVygIT7i3KIj0MQSMasmvK+Q2le+UYVmMqN8o92SnBZobNORYFWhLoIjZqrt/hCdlifaRsMdSIvfhMG2kkR/sldaSXCKYgjwtF4gbj+Hl0HMbQrppnhyQXNw3bPKyWnHu5EfBtPGr9tpzPlvHrgVsNpLXGqRda6W7pwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJzuc2vJMhaSmWrAyt1qRCOfmJIAsEyqDZmMvBfUmqV0s4PCT4PERPBQadcHQtcepdJEnOOMJIP8wsbKEGECyNOJS/T76oYKCQohb/WofAv+2voslHwPTyZWYLDe/85oj1ZS07QJarEIEQ9APezpfdeL9YCDK0ebhDwMYJww/eqdES+XSd3xQoy95D7yNCi7r4BybUZ+39DM6hoON1uwJD6EQstwG2KwEiyn9m2LjaJfxTIcv+EGH5upyLLxKtL5+AZVLCXFunMH0B7Mb88pmHScgw2gQf/kifRhmKMrbVkWBQmwT7TEJ0c466KctDoT8JQNTvtncYOOJfV18qZlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=v3/But/Psy4Wob6vpKoPsMIkVP5NEP9GBQsgC6TY/NY=;
 b=iD302siRU0eH1MbT92gPTsdVNZFLYjTey6zP5f+xYvm0VdTZNk0t9cHDuLdeZuGqauSh5WYdshfBa+pTJoN8cBNV3wPAdBFyjIo9tvd5ZIun9iRoBdzTEoxaQXGsPrNTjQVrvueVDYKl2c9EQNPEJIYXSBlTKfxeDO1QrLdwctCPNajCPrivcYKTzVC0uDbkovrEl88+AQXkhJ2hwdYn1/zxuE9LClViNvWFCFTzz+8WBeBeF+kg2Zbr0VaQrF/2x7YlptGIfEht/rqe994fybZmRKc3xkAauEHy4YrJfo3Q1fCzyWwunFyybchSwYhmHqWIo1YmMz96PJ6ykIIjJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3/But/Psy4Wob6vpKoPsMIkVP5NEP9GBQsgC6TY/NY=;
 b=2Ew83vGHVygIT7i3KIj0MQSMasmvK+Q2le+UYVmMqN8o92SnBZobNORYFWhLoIjZqrt/hCdlifaRsMdSIvfhMG2kkR/sldaSXCKYgjwtF4gbj+Hl0HMbQrppnhyQXNw3bPKyWnHu5EfBtPGr9tpzPlvHrgVsNpLXGqRda6W7pwM=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH 10/37] xen/x86: use helpers to access/update mem_hotplug
Thread-Topic: [PATCH 10/37] xen/x86: use helpers to access/update mem_hotplug
Thread-Index: AQHXsHMVa+NLaHkUKUKV++B1/dWC4quyVkOAgABCPlA=
Date: Fri, 24 Sep 2021 04:29:31 +0000
Message-ID:
 <PAXPR08MB686434EC55F63DA87FAFEC4D9EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-11-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231730580.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231730580.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D6EFDF62BC87D44985BF2C264832F7EB.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 03e64f84-aceb-43a6-1fd2-08d97f13f048
x-ms-traffictypediagnostic: PAXPR08MB6477:|AM7PR08MB5479:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB5479261AF26400FAFE0A50869EA49@AM7PR08MB5479.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JgYHosk3pGnCOzHYvqvGNi2C58KU+RQgxbphy0Z2kKXkrPlFk4mi3CnRMpRwvkLpgazDJbuJA/ftDMkRMMfZP//6k8g0oRFtAEaGgsIWl3kyx4L0XMkxlAnxjVLGWCwDYXk/AVSGvIkxS3PK0dWKBMj2q2Q3NtbOKabk3lLEKid+77KiFuulK1pkqFhA+CcDIH8jZ53lHLqjgk7fLv8Nqjeh5orV9HOxVkCloOPY1PkZZEvqoWb67CvW/dNLpcjN/Yo9ExQ5quXuGfr5AT5BZU32Dm9DOE9plwWZdyobU0Gda7Uw5Z8eEXQq1WliTZDWaJ8v85kXWgk/x8HAiwV0LcpfAo8O0WyKYv8Y0X/U238C1xXGwlso13SEs79//zT9CUPt5IZS1CAQgEn+VKhN6Yvawg6E6afX8ll/NTdAIayTPT6H+Dj/t3Papel5ssLKsH0Skj4XxhIIP2dwcWhT4eMgPp6nFJIh6hTeUe+6gLgHumygJyfd1ljeXnGIHOS5DNsJAWU2Btz/FhL4JcxV++2JcDNhHm2aeLTF7fPM4AmZ8AjOFxPf1OS7nJLh/h9F59ofGjrJvl7YUDFH/HW1N7l8EHMYaXucwnFTiCmvwmRP6WhhnpNLNSn/kg9AIdblb2syds8c3OWPOurRTF8R4Z2tWSR8ZJa8UVRa0wH4cN/PceTtcWF2dEOOJIgxIZDQ5O1IncQJ5RcpRp1EJ4gpjQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6864.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(66556008)(66476007)(8676002)(186003)(76116006)(38100700002)(66446008)(316002)(8936002)(86362001)(55016002)(66946007)(508600001)(54906003)(15650500001)(83380400001)(52536014)(6916009)(122000001)(7696005)(4326008)(71200400001)(38070700005)(26005)(9686003)(33656002)(6506007)(5660300002)(2906002)(53546011);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6477
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c70609cc-d4a2-4afe-ff29-08d97f13e790
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BKZ99xN3Su6SRw+2PZNcUN2mfyAda8Tb8X2uWBWKhlxvkufA0M3bXX30E/AVvdplsKWHBrTAV7NEG7IwG0EBHaMkGp2gh1n7DtRNjOPO+n/zai0pcQIysneegFbqiUIXp/T+1PEAxu3O5eufoZtMBeL8PmPmTiD/Qby5o1bdNtRsc06DkFdZjy+IQXOTUM02HfBkQs2p7vq/Xf1j0PKRiPu66y1K5CS2IHTInWGUhhXVN6f/b2lBI3QdspzIxOOPS+9+j07j3aT+KLLhnmaHVbQwXhLoHPEScKwpWuKnxTwIJA4Z2B4YDJMlvD8GzdkdvSWXCJNSgXPgnN+eoS1OYpJmvqKlTPDM3SabKBgAYKD3hG7YrGMdyyOcbNwXkHhs3GssY8knP5K0D2xReEY590uL188Eoa22Xxiy9DcWvnrWEcasOaeWW6H0H1VUd+Laf5AFtDtSKUoWJlr69gzYh+tPhgeFvOhByAXTN03w+qb8daulZaCOO3uv0/+WOJsnaMyNWa62f3ZP1ptCUyyCKdqT7QFQk4LQxSnvGQ12A3DJJ7nx98wuRSDATKBmE+93UdYGJ6ylwQoMBglqdUqL8p1HtSHV5f9J+wg8+jG5+DxPcnMnWdkovln5SoI99egr+PiLoNe6NvZrABnCKcrzX04wWF3CN4qKo2Vg3uMMxg4KjrNGK7t+gG6zCHIIX58XHuh4cxiwLClhMCwLzve+xg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(33656002)(36860700001)(336012)(5660300002)(8936002)(82310400003)(8676002)(6506007)(15650500001)(186003)(52536014)(47076005)(53546011)(26005)(70586007)(70206006)(86362001)(83380400001)(81166007)(2906002)(508600001)(7696005)(356005)(4326008)(316002)(55016002)(54906003)(9686003)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:29:46.1401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e64f84-aceb-43a6-1fd2-08d97f13f048
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5479

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4ZW4t
ZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IFN0ZWZh
bm8gU3RhYmVsbGluaQ0KPiBTZW50OiAyMDIxxOo51MIyNMjVIDg6MzINCj4gVG86IFdlaSBDaGVu
IDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
OyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZzsNCj4gQmVydHJhbmQgTWFy
cXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgamJldWxpY2hAc3VzZS5jb207DQo+IGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb207IHJvZ2VyLnBhdUBjaXRyaXguY29tOyB3bEB4ZW4ub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMTAvMzddIHhlbi94ODY6IHVzZSBoZWxwZXJzIHRvIGFj
Y2Vzcy91cGRhdGUNCj4gbWVtX2hvdHBsdWcNCj4gDQo+ICt4ODYgbWFpbnRhaW5lcnMNCj4gDQo+
IA0KPiBPbiBUaHUsIDIzIFNlcCAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBXZSB3YW50IHRv
IGFic3RyYWN0IGNvZGUgZnJvbSBhY3BpX251bWFfbWVtb3J5X2FmZmluaXR5X2luaXQuDQo+ID4g
QnV0IG1lbV9ob3RwbHVnIGlzIGNvdXBsZWQgd2l0aCB4ODYuIEluIHRoaXMgcGF0Y2gsIHdlIHVz
ZQ0KPiA+IGhlbHBlcnMgdG8gcmVwYWNlIG1lbV9ob3RwbHVnIGRpcmVjdCBhY2Nlc3NpbmcuIFRo
aXMgd2lsbA0KPiAgICAgICAgICAgICAgXiByZXBsYWNlDQo+IA0KPiA+IGFsbG93IG1vc3QgY29k
ZSBjYW4gYmUgY29tbW9uLg0KPiAgICAgICAgICAgICAgICAgICBeIHRvIGJlDQo+IA0KPiBJIHRo
aW5rIHRoaXMgcGF0Y2ggY291bGQgYmUgbWVyZ2VkIHdpdGggdGhlIHByZXZpb3VzIHBhdGNoDQo+
IA0KDQpPaywgSSB3aWxsIGRvIGl0LCBhbmQgZml4IGFib3ZlIHR5cG9zDQoNCj4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gIHhl
bi9hcmNoL3g4Ni9zcmF0LmMgfCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvc3JhdC5jIGIveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+IGluZGV4IDJmMDhmYTQ2NjAuLjMz
MzRlZGU3YTUgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiBAQCAtMzkxLDggKzM5MSw4IEBAIGFjcGlfbnVtYV9t
ZW1vcnlfYWZmaW5pdHlfaW5pdChjb25zdCBzdHJ1Y3QNCj4gYWNwaV9zcmF0X21lbV9hZmZpbml0
eSAqbWEpDQo+ID4gIAltZW1ibGtfbm9kZWlkW251bV9ub2RlX21lbWJsa3NdID0gbm9kZTsNCj4g
PiAgCWlmIChtYS0+ZmxhZ3MgJiBBQ1BJX1NSQVRfTUVNX0hPVF9QTFVHR0FCTEUpIHsNCj4gPiAg
CQlfX3NldF9iaXQobnVtX25vZGVfbWVtYmxrcywgbWVtYmxrX2hvdHBsdWcpOw0KPiA+IC0JCWlm
IChlbmQgPiBtZW1faG90cGx1ZykNCj4gPiAtCQkJbWVtX2hvdHBsdWcgPSBlbmQ7DQo+ID4gKwkJ
aWYgKGVuZCA+IG1lbV9ob3RwbHVnX2JvdW5kYXJ5KCkpDQo+ID4gKwkJCW1lbV9ob3RwbHVnX3Vw
ZGF0ZV9ib3VuZGFyeShlbmQpOw0KPiA+ICAJfQ0KPiA+ICAJbnVtX25vZGVfbWVtYmxrcysrOw0K
PiA+ICB9DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0KDQo=


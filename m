Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E026EDF4C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 11:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525937.817475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prF20-0007ca-JV; Tue, 25 Apr 2023 09:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525937.817475; Tue, 25 Apr 2023 09:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prF20-0007ZD-FR; Tue, 25 Apr 2023 09:32:16 +0000
Received: by outflank-mailman (input) for mailman id 525937;
 Tue, 25 Apr 2023 09:32:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xGP=AQ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prF1y-0007Z7-Mt
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 09:32:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eed9138-e34c-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 11:32:12 +0200 (CEST)
Received: from DB9PR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::19) by AS8PR08MB6134.eurprd08.prod.outlook.com
 (2603:10a6:20b:291::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 09:32:08 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::ea) by DB9PR01CA0014.outlook.office365.com
 (2603:10a6:10:1d8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34 via Frontend
 Transport; Tue, 25 Apr 2023 09:32:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.18 via Frontend Transport; Tue, 25 Apr 2023 09:32:08 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Tue, 25 Apr 2023 09:32:08 +0000
Received: from c00b1b0e3600.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CDC6313B-9F18-413A-B21E-83DE98492892.1; 
 Tue, 25 Apr 2023 09:31:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c00b1b0e3600.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Apr 2023 09:31:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9425.eurprd08.prod.outlook.com (2603:10a6:20b:5eb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 09:31:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 09:31:54 +0000
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
X-Inumbo-ID: 0eed9138-e34c-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLDGvAkRP281Y3BToysipj4WgL+Mh3vkMqKfKo3cS+A=;
 b=n33eRVKuqCK+C7DtznIlnQWHiMuJeGjMlboToR+IM2eWc92D+qM2xwisSaNsv2tDF6AJuY76UczeXF/B+L9fUKrBEN9FgCsn0RIetbs0ypEWUE6Stmj0e6oT73yEoFmoE2ZoFjcyehubNzu8DkFmuiDZ8+hEkOsI2jKk8JUdHVk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+S/MPiYdpIFK04hhMTy4gIVFWnHn7af2zDtp0nlx9E4ypKkm7tQNr0I5MDISGWgL9Z8nv34zSFzANE3NBzMLtIorFtGlHqrjiO639+HOUnASdS4gNPiXbhVvob6De5QxCD7yDNedzwpJah/6mHoWgS+t/uDTK/IlnYRHAJlto7gHR34xH8SmQj6XxCMKBWubLfzFLeELVYH6YxLZtQfQjPWLq7xR7VvpKP179BD+HU2ZtC43nv8K3ztw0PTPcozE4FmYKNjQpL9GW7r7qlal1QlkYHVJPeRq8GSrfj4g5OutCvOI0oWe6M3ESauPwcf+M4KiU6MttBenBGn1ymqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLDGvAkRP281Y3BToysipj4WgL+Mh3vkMqKfKo3cS+A=;
 b=ew4n5fY+ppSfUYxDe7/1/764Jp/Qz9lpSo8TzW6L5fB2byzxsPVf7/Teqt/j9S/Xkw2fKSZFkPYkzLj9Qn1h5sBN5fPBxphbeu+5VCS3+b2t9E7/+tC9zl7dsk7SI57tnZuND+uMwP6W8ozfdGaQgPkn2TggaEM51ytVtA/mmlcO6gvxpTwVhcOYIqEf80SWhgIRHjDgduqxZp7lp6wtC0BBSvYP/iqGWOMFQqjYBmF/mw9VkX2xWcM2/YdK0SkEo4fUzLY43ci0qltSVZ6LabSai1LHGWWMJCgzW02eZBu+uw9VfCsm24gIt2EeBIchlO/Ii4mQRYVUybjZLqXoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLDGvAkRP281Y3BToysipj4WgL+Mh3vkMqKfKo3cS+A=;
 b=n33eRVKuqCK+C7DtznIlnQWHiMuJeGjMlboToR+IM2eWc92D+qM2xwisSaNsv2tDF6AJuY76UczeXF/B+L9fUKrBEN9FgCsn0RIetbs0ypEWUE6Stmj0e6oT73yEoFmoE2ZoFjcyehubNzu8DkFmuiDZ8+hEkOsI2jKk8JUdHVk=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 03/17] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH v4 03/17] xen/arm: implement node distance helpers for
 Arm
Thread-Index: AQHZd0uatmvJ8yLEu0+BYdIuaJgbea87s6sAgAANHMA=
Date: Tue, 25 Apr 2023 09:31:54 +0000
Message-ID:
 <AS8PR08MB799137BF5927B402E7B0069392649@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-4-Henry.Wang@arm.com>
 <7d2c221b-745b-109e-af1f-2b78504b2e0e@suse.com>
In-Reply-To: <7d2c221b-745b-109e-af1f-2b78504b2e0e@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 69CFC7BB08AD8546970C9F34FFF82DFE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9425:EE_|DBAEUR03FT059:EE_|AS8PR08MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ddbefb-b2e1-43be-948f-08db456ff09c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KpGm5JPjWvDi/1TE9C/RviXWX/opB3PSozGYxrrRSX46bG8Itzq9dQCTbRlYxM0FE31P8HZtjOXJ2soUZ+eqVkPMliI7JY3aoW8cTtrBbxDgnNlB6V02HlwRAOpKR36Fdrp6ZPNBfiIdyFLM3U9qEv9gmikR0rmhS57jtFnR3+4YvofGmy0O2g/3zVmYm7HT57eqfYTSg/0QAEmbZ+Z8orPgmBQWotTy+/Og+9DCYQJ9xbZlMAxjojsgI8TTcFuX+eYgkxKIJDK50QYERUEXQASyd3jkFrjIr7q1RPEpGhwjlD9/4+uT0ue9YwY7Kz9Ebu6WTqNTd95q76K9hXUjzAxxLoB+ujLN3bXrO9o5t9ezTAk7c2aDdF9rL4vD5hglV/jp/Bin2THHKNZfEZ6gte//Gcmx3WAk8F3zRE5ObkR48ntlbM2OkwB5MaNqo1aaxZ0encfl2BBUpYncnVoXeS/TL49do0opj6IMcROefnlP85owne/fYCyB2dxe6rOwtqJdXYIMjkp29+Q+yD+FVzAf4h+xvd2m+TkF1HZuyGji+s5ZUJv6gcgAKnnHe8Kn1iuGtPTxNZD5C+F16Na9HtLuNiGHGVFr+5dSwUcEMBFpL63SKrelnnoJ+Sh+DHaG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199021)(38100700002)(122000001)(6506007)(9686003)(53546011)(26005)(55016003)(186003)(8936002)(83380400001)(33656002)(2906002)(8676002)(52536014)(5660300002)(478600001)(54906003)(7696005)(71200400001)(38070700005)(316002)(4326008)(6916009)(66556008)(76116006)(64756008)(41300700001)(66446008)(66946007)(86362001)(66476007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9425
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aaf9ad94-d9ab-4b88-ce52-08db456fe880
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F9SyNl3Kg0rsqXKaPcJ8xW5w4rNrmPWwZJlmmvRlTZ7uvfEff8TGjsbYJWLV4NDxLR7QqlbBIMC+Rt41050+nUN5YMTF/LMUs49I+lYf9lapZBzY5ftJ37bNonHSSwJ0PDrnS5UYWGFQwsLMW1SMKlfiZXWL8RLMLYn7Pc4ekp8Rrf9OGSZGF9TFdV35u2UG0G5oNxv5nMQ3XbP7ddj3rBaprE2aBGA7VlK0Qi+3NzlNsRVJ/9K1+DJJ5RWh3sg7VQqKTcP7NtnMQ3iI4CvwFjaz6rBBp25dIOT32wYHwUjZ0L0OGnG1I87AbPATSprmnK48E+sLNmc/9fL3EOtQmK48ZT8grJH+1julLm/sqIre9Qy/hGLfrymX5V8/isB1ZoHZhqTHycQgF/bUcxkwQL6+oqFc4zqZ8asqwsdZvrRsh+VwNi5/tw8Z5YBniIP6kbkX9OyuJ4Y32hj2UE9KneKJWu8PA31xlyCXNxUdmoO8WIuykkcvAL/abDzxgdxuKywRRtvXR0+dcz5OWRYrhF8pK3/p1YNDij0Utt4KFJUeVv/N0dCL4g4A8bcP0TDSfKeacTGPWuD9Rd/6SNyuGQLLcfbxrS3KVHfxhyjyEb4+JhiZYqw+r6wRn0IZDz/+DuyTSw2paHryt/+ioscXyxnFlIasGScZWbKq8WnaGkFFl7Yz/Yhnl1YKhtts6hrIGOynvR/fSlI5u+/OyWe9kw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(2906002)(70206006)(70586007)(316002)(4326008)(6862004)(52536014)(5660300002)(8936002)(8676002)(41300700001)(33656002)(82310400005)(86362001)(55016003)(40460700003)(40480700001)(356005)(186003)(9686003)(26005)(53546011)(81166007)(478600001)(7696005)(36860700001)(83380400001)(47076005)(336012)(6506007)(54906003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 09:32:08.3380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ddbefb-b2e1-43be-948f-08db456ff09c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwMy8xN10g
eGVuL2FybTogaW1wbGVtZW50IG5vZGUgZGlzdGFuY2UgaGVscGVycyBmb3INCj4gQXJtDQo+IA0K
PiBPbiAyNS4wNC4yMDIzIDA5OjU2LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9h
cmNoL2FybS9udW1hLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gQEAgLTI4
LDYgKzI4LDEyIEBAIGVudW0gZHRfbnVtYV9zdGF0dXMgew0KPiA+DQo+ID4gIHN0YXRpYyBlbnVt
IGR0X251bWFfc3RhdHVzIF9fcm9fYWZ0ZXJfaW5pdCBkZXZpY2VfdHJlZV9udW1hID0NCj4gRFRf
TlVNQV9ERUZBVUxUOw0KPiA+DQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBjaGFyIF9fcm9fYWZ0ZXJf
aW5pdA0KPiA+ICtub2RlX2Rpc3RhbmNlX21hcFtNQVhfTlVNTk9ERVNdW01BWF9OVU1OT0RFU10g
PSB7DQo+ID4gKyAgICBbMCAuLi4gTUFYX05VTU5PREVTIC0gMV0gPSB7IFswIC4uLiBNQVhfTlVN
Tk9ERVMgLSAxXSA9DQo+IE5VTUFfTk9fRElTVEFOQ0UgfQ0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAr
DQo+IA0KPiBOaXQ6IEEgc3RyYXkgMm5kIGJsYW5rIGxpbmUgaGFzIGFwcGVhcmVkIGhlcmUuDQoN
CldpbGwgZml4IHRoaXMgaW4gdjUuDQoNCj4gDQo+ID4gKyAgICAvKiBOVU1BIGRlZmluZXMgTlVN
QV9OT19ESVNUQU5DRSBhcyB1bnJlYWNoYWJsZSBhbmQgMC05IGFyZQ0KPiB1bmRlZmluZWQgKi8N
Cj4gPiArICAgIGlmICggZGlzdGFuY2UgPj0gTlVNQV9OT19ESVNUQU5DRSB8fCBkaXN0YW5jZSA8
PQ0KPiBOVU1BX0RJU1RBTkNFX1VERl9NQVggfHwNCj4gPiArICAgICAgICAgKGZyb20gPT0gdG8g
JiYgZGlzdGFuY2UgIT0gTlVNQV9MT0NBTF9ESVNUQU5DRSkgKQ0KPiA+ICsgICAgew0KPiA+ICsg
ICAgICAgIHByaW50ayhLRVJOX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAgICAgIk5VTUE6IGlu
dmFsaWQgZGlzdGFuY2U6IGZyb209JSJQUkl1OCIgdG89JSJQUkl1OCINCj4gZGlzdGFuY2U9JSJQ
Ukl1MzIiXG4iLA0KPiA+ICsgICAgICAgICAgICAgICBmcm9tLCB0bywgZGlzdGFuY2UpOw0KPiA+
ICsgICAgICAgIHJldHVybjsNCj4gPiArICAgIH0NCj4gDQo+IEkgYXBwcmVjaWF0ZSB0aGUgY2hl
Y2tpbmcgdGhhdCBub2RlLWxvY2FsIHJlZmVyZW5jZXMgYXJlDQo+IE5VTUFfTE9DQUxfRElTVEFO
Q0UsDQo+IGJ1dCBpZiB0aGV5J3JlIHdyb25nbHkgcGFzc2VkIGludG8gaGVyZSwgc2hvdWxkbid0
IHRoZSByZXN1bHRpbmcgYXJyYXkgc3RpbGwNCj4gaGF2ZSBOVU1BX0xPQ0FMX0RJU1RBTkNFIG9u
IGl0cyBkaWFnb25hbCwgYXQgbGVhc3QgYXMgZmFyIGFzIHByZXNlbnQgbm9kZXMNCj4gZ28/DQoN
CkFwb2xvZ2llcyBpbiBhZHZhbmNlIHRvIGFzayBtb3JlIHNwZWNpZmljIGRldGFpbHMgZnJvbSB5
b3UgYXMgSSBhbSBub3Qgc3VyZQ0KaWYgSSBjYW4gY29ycmVjdGx5IHVuZGVyc3RhbmQgdGhlICJp
ZiB0aGV5J3JlIHdyb25nbHkgcGFzc2VkIGludG8gaGVyZSIgY2FzZS4gRG8geW91DQptZWFuIHdl
IGFyZSBhbHdheXMgZ3VhcmFudGVlZCB0aGF0IGlmIGZyb20gPT0gdG8sIHRoZSBkaXN0YW5jZSB3
aWxsIGFsd2F5cyBiZQ0KTlVNQV9MT0NBTF9ESVNUQU5DRSBzbyB0aGUgKGZyb20gPT0gdG8gJiYg
ZGlzdGFuY2UgIT0gTlVNQV9MT0NBTF9ESVNUQU5DRSkNCmNoZWNrIGlzIHJlZHVuZGFudCBhbmQg
Y2FuIGJlIHJlbW92ZWQ/IFRoYW5rcy4NCg0KPiANCj4gPiArICAgIG5vZGVfZGlzdGFuY2VfbWFw
W2Zyb21dW3RvXSA9IGRpc3RhbmNlOw0KPiA+ICt9DQoNClsuLi5dDQoNCj4gPiArICAgIC8qDQo+
ID4gKyAgICAgKiBDaGVjayB3aGV0aGVyIHRoZSBub2RlcyBhcmUgaW4gdGhlIG1hdHJpeCByYW5n
ZS4NCj4gPiArICAgICAqIFdoZW4gYW55IG5vZGUgaXMgb3V0IG9mIHJhbmdlLCBleGNlcHQgZnJv
bSBhbmQgdG8gbm9kZXMgYXJlIHRoZQ0KPiA+ICsgICAgICogc2FtZSwgd2UgdHJlYXQgdGhlbSBh
cyB1bnJlYWNoYWJsZS4NCj4gDQo+IEkgdGhpbmsgdGhpcyAiZXhjZXB0IC4uLiIgcGFydCBpcyBz
bGlnaHRseSBjb25mdXNpbmcsIGFzIGl0IGRvZXNuJ3QgY29tbWVudA0KPiB0aGUgc3Vic2VxdWVu
dCBjb2RlLCBidXQgaW5zdGVhZCByZWZlcnMgdG8gdGhlIGZpcnN0IGNoZWNrIGluIHRoZSBmdW5j
dGlvbi4NCj4gSWYgeW91IHdhbnQgdG8ga2VlcCBpdCwgbWF5IEkgc3VnZ2VzdCB0byBhZGQgc29t
ZXRoaW5nIGxpa2UgIihzZWUgYWJvdmUpIg0KPiBiZWZvcmUgdGhlIGNvbW1hPw0KDQpTdXJlLCBJ
IHdpbGwgYWRkICIoc2VlIGFib3ZlKSIgaW4gdjUuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoN
Cj4gDQo+IEphbg0K


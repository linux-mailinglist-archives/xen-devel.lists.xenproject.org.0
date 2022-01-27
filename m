Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B4A49DDEE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 10:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261358.452442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD13y-0006Hg-1X; Thu, 27 Jan 2022 09:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261358.452442; Thu, 27 Jan 2022 09:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD13x-0006Fo-Tr; Thu, 27 Jan 2022 09:27:29 +0000
Received: by outflank-mailman (input) for mailman id 261358;
 Thu, 27 Jan 2022 09:27:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nD13w-0006FP-Ac
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 09:27:28 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe05::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57521676-7f53-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 10:27:27 +0100 (CET)
Received: from AM6PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:20b:2e::42)
 by AM8PR08MB6323.eurprd08.prod.outlook.com (2603:10a6:20b:354::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 27 Jan
 2022 09:27:25 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::44) by AM6PR05CA0029.outlook.office365.com
 (2603:10a6:20b:2e::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 09:27:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 09:27:24 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 27 Jan 2022 09:27:24 +0000
Received: from 7c1d755e4d63.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5865D43E-CF78-4380-8901-6A876DD55D9B.1; 
 Thu, 27 Jan 2022 09:27:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c1d755e4d63.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 09:27:19 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB8PR08MB4187.eurprd08.prod.outlook.com (2603:10a6:10:a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 09:27:15 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 09:27:15 +0000
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
X-Inumbo-ID: 57521676-7f53-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9StqRPKe9C0ovEdHmfCHPIqa19prN36+omMW4Wnpe/E=;
 b=SrWjPzIQnDq/+ZzDMNMaf/QHMscVXN6a5xF3XKePlCRbrkw1+8RdSn3RglIgLEP+CyhnEtJoiiOrf18UrSYqaGdN6YqZHWeu0mtqNuq6tBq2oSk+G0vrtKmhAPwZzotoitxpR7Fj7CWiykHWy7fr2M4e+jKX7wh5lGZgEoEZxI8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCIkc3ovlA5w9LMgxQhSUbVxYxa326RGbUhxQMnXUDJpoRlLyDjTHm9CW3oPWicODbhDeeaEO0wPwbZK5Kj9hQyGR12UDtpeEKS/Kh5TZPRG7HVb4Y33KGPTIkX6GgsXQnhp2MfNoR28rLl70QMcGXOI76CVU2FBah0eURSb8KgPMFvkmyEGJ48Pol8ldMN867CgKBynMlJIyRqp+fC25jZf4PyodianBGKZa/1nuVVecN9XNQmBo+KdsZOtFM4Nj3DnikORKllDZyGpShZx3nv1hbp7dYzTEnt98HFpd2oQVtQ3b6vNIcaykrDg2QfjlhT6WtFPJg5GT0SkF30DdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9StqRPKe9C0ovEdHmfCHPIqa19prN36+omMW4Wnpe/E=;
 b=evfj7Bhw0MzRurZ6YJxXtguslt8REHurqAz6cbznH6vUA/yGXcOXn2RYq+iuVx/RLUuoxhQZ1PwA63IVVd7ELhrFqydiEcZSCeuXZqCSnkKlifiHQy8NYpc0zDOVwenzjZkJlSn2x3URM0hJGZHUPw4HURLmjotZl3PzU6F2S7/DkyEaw8ygJcHgx3FmovxZFylr0fw0gkvVEgkkQK2rrU5zNj9lpCfGBf+pI5q9et6/QlvcH52IxbXcfcq4Qo379d8YaApdPimN+NwOPWTuZnpVbyyTmmoEJFQ03Hg/PU4/3fK8TwgJPEDam8AIL8W01zey/jSR2U9P3vjk7/Xo0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9StqRPKe9C0ovEdHmfCHPIqa19prN36+omMW4Wnpe/E=;
 b=SrWjPzIQnDq/+ZzDMNMaf/QHMscVXN6a5xF3XKePlCRbrkw1+8RdSn3RglIgLEP+CyhnEtJoiiOrf18UrSYqaGdN6YqZHWeu0mtqNuq6tBq2oSk+G0vrtKmhAPwZzotoitxpR7Fj7CWiykHWy7fr2M4e+jKX7wh5lGZgEoEZxI8=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820 map
Thread-Topic: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820 map
Thread-Index:
 AQHXsHMWLK2Lk+nkCEuQGshEHTFFNqxzJoSAgAQcdmCAAAZJgIAADE6ggAAIWICAAAEtwA==
Date: Thu, 27 Jan 2022 09:27:15 +0000
Message-ID:
 <PAXPR08MB742087826533A5127BE073469E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-13-wei.chen@arm.com>
 <b6c16f31-b233-1493-aebb-716e087f5ca1@suse.com>
 <PAXPR08MB74209CAE2D594D22DFF14DDA9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <d4bb30f9-92a4-47ef-05bd-0ae1dacb3642@suse.com>
 <PAXPR08MB7420131F1D61587D251C05239E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <9ed21543-c299-12fc-a445-ed146fb59412@suse.com>
In-Reply-To: <9ed21543-c299-12fc-a445-ed146fb59412@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 06E64D65C1C6304985AAB2FFE1F62433.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 517ea070-56bc-4239-0ae5-08d9e1773a94
x-ms-traffictypediagnostic:
	DB8PR08MB4187:EE_|AM5EUR03FT004:EE_|AM8PR08MB6323:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB632356FB5E03DBC0AFA51F409E219@AM8PR08MB6323.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oj74yLNJ3KIa5JJrAGcDP2BV2kZ/mD94++Uttq4PZOJ9kKFNdYXn9nuLJho9yboWU7sUtmAF2d8YZ7ulAtf/N7z7GlxCYYqF2/TgNf35d64J6pheOK6mOhBjMnyrISZfVL7nY+nGr28aXltATVIK2xqo6ZedrKlwDd0csAfz+OHBzal9btLUU6lm3meoeEoneqDcGC3QbMwGeOJ3zkqQMrnIIRbAlAIT9a27MSnG/O7wtULdQmF014CkaGwFePh6aX0RX9Z9C8iejVD8jQc8Yk9VbIyXeYIFslUOIQU7Ui48Fwgj1nw5q7lxKNVFtHfEH26QevA9hsu9QhY3ZNjcDuJQjI19t1GKZMGb+seVmAHKzDYRDi2VSjnOC3bw4J5/oltxn8QFxcQUX7G7JKfrAvbAFYq2E5xv2g7ysC8tGO8qvJGAQ8mk4NsV7XHA1mHGMfRstu2yxVFS58PjpA1rN/VC+LkozfmqJZu/hIJg565PEix6G3eSZOKhuz1n+hlIqvScpf5m8xZe5EBBTjQg1auOtCxK9tE2Kv6hgPRDiI0/zy2LjmVRILksnL7D5EIN8MrWw358JDBmr2XRss0kGakWnsnm/uIzRfXvjHa3V62TBj/18V6pnVNLYujYSOQS8fOqcltxIJjxbR1KAq4TnMilIHC9c5hHWJyUpV8bBFkdgH+pZpsW4V0jwnjrnOwM494QpM7aAdqiIWarRNd16g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(38100700002)(66556008)(64756008)(8676002)(66476007)(66446008)(2906002)(33656002)(8936002)(66946007)(5660300002)(4326008)(55016003)(26005)(52536014)(76116006)(54906003)(86362001)(9686003)(6916009)(83380400001)(508600001)(38070700005)(316002)(71200400001)(7696005)(122000001)(6506007)(53546011)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4187
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e6646f7-32de-429b-4441-08d9e17734e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uBk15Y41a6VXApKvBxbIPiC2BuKRpknvGHCDB0i/v5bqUsYeIo1LLecnWhH1GdBnK57H0SrUdRAUoKjeFVhB8sNR9tSwO+Al4kHM2eJwCq1Bg6LfAP9vSvRfuhuuoOZ/PwMspDozu1Nk7nSwNpHsOnvlKMiQEdf9L7Vu9t2cAXOesvXId+/T4XVgtf7GK5r1c2TBFCgasfvSf/WiKeK6OruYjoRTm4s0pjAXE3WgBpULR/DcHaQD2lmGbrmvyygTQpzRyr12PJD1DKiDqEG8FLYxQiigwA4FS1kq+vVO6+F3fMcDmLh+EDYqcj0JLDFdCZM+ne/6YFEeW+uCGmjBR274P6CPzp5wkwPLsserYUyZB/0cXH4NtZQiPLKAHM0yZc98M+EHJ4XA3Y8K0Sm0/KB9nS/SaS54Y8O9AFcNyk4KgeQMDOj+CcC6Zev/d5mPIh/uPks2Neg2FV9qD2+rr4as3UW2j4AzdQrpAXS7jUhP2DAMEolubnehw58AI1bSs2IbfY96rpceDAI7N2pCEuJsGV6A2loTiK/t27+Ovu32y9W71TlUqnL+LNzKV0v0RDmibiYQKw72qM5VIYXNnB7vDK/BJPghaj978trzMMvsrR3fUnGjOPHNRWBvYxMj5WiOmPbEU9FMFjxRmO4ZVXbayWIgxv48Cc33tZgOd6QOf5xde/7TYH2DbJsPQFEZ7oqrBikHy7oTvE3Osd+vhxf0Ta46Tu1rCgIlGfxLRd2VgTnaQIiSri274m3jV1czZYxusItUWICNyHS5imGskA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(40470700004)(36840700001)(7696005)(26005)(6506007)(40460700003)(316002)(86362001)(336012)(47076005)(8676002)(53546011)(6862004)(186003)(36860700001)(2906002)(4326008)(8936002)(33656002)(81166007)(9686003)(356005)(82310400004)(55016003)(54906003)(70206006)(52536014)(83380400001)(508600001)(5660300002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:27:24.9305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 517ea070-56bc-4239-0ae5-08d9e1773a94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6323

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyN+aXpSAxNzoyMg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDEyLzM3XSB4ZW4veDg2OiBkZWNvdXBsZSBub2Rlc19jb3Zlcl9tZW1vcnkg
ZnJvbSBFODIwDQo+IG1hcA0KPiANCj4gT24gMjcuMDEuMjAyMiAxMDowMywgV2VpIENoZW4gd3Jv
dGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2Vu
dDogMjAyMuW5tDHmnIgyN+aXpSAxNjowOQ0KPiA+Pg0KPiA+PiBPbiAyNy4wMS4yMDIyIDA5OjAz
LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQo+ID4+Pj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAwOjU5DQo+ID4+Pj4NCj4gPj4+
PiBPbiAyMy4wOS4yMDIxIDE0OjAyLCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+Pj4gV2Ugd2lsbCBy
ZXVzZSBub2Rlc19jb3Zlcl9tZW1vcnkgZm9yIEFybSB0byBjaGVjayBpdHMgYm9vdG1lbQ0KPiA+
Pj4+PiBpbmZvLiBTbyB3ZSBpbnRyb2R1Y2UgdHdvIGFyY2ggaGVscGVycyB0byBnZXQgbWVtb3J5
IG1hcCdzDQo+ID4+Pj4+IGVudHJ5IG51bWJlciBhbmQgc3BlY2lmaWVkIGVudHJ5J3MgcmFuZ2U6
DQo+ID4+Pj4+ICAgICBhcmNoX2dldF9tZW1vcnlfYmFua19udW1iZXINCj4gPj4+Pj4gICAgIGFy
Y2hfZ2V0X21lbW9yeV9iYW5rX3JhbmdlDQo+ID4+Pj4NCj4gPj4+PiBJJ20gc29ycnksIGJ1dCBw
ZXJzb25hbGx5IEkgc2VlIG5vIHdheSBmb3IgeW91IHRvIGludHJvZHVjZSB0aGUgdGVybQ0KPiA+
Pj4+ICJtZW1vcnkgYmFuayIgaW50byB4ODYgY29kZS4NCj4gPj4+DQo+ID4+PiBJbiBteSBsYXRl
c3QgY2hhbmdlcywgSSBoYXZlIHVwZGF0ZWQgdGhlc2UgdHdvIGhlbHBlcnMgdG86DQo+ID4+PiB1
aW50MzJfdCBfX2luaXQgYXJjaF9tZW1pbmZvX2dldF9ucl9iYW5rKHZvaWQpDQo+ID4+PiBfX2lu
aXQgYXJjaF9tZW1pbmZvX2dldF9yYW1fYmFua19yYW5nZSguLi4pDQo+ID4+PiBJIGFtIHNvcnJ5
LCBJIGZvcmdvdCB0byBjaGFuZ2UgdGhlIGNvbW1pdCBsb2cgYWNjb3JkaW5nbHkuDQo+ID4+PiBJ
IHdpbGwgdXBkYXRlIGl0IGluIG5leHQgdmVyc2lvbi4NCj4gPj4NCj4gPj4gSSdtIHNvcnJ5IGZv
ciB0aGUgYW1iaWd1aXR5IG9mIG15IGVhcmxpZXIgcmVwbHksIGJ1dCBteSBvYmplY3Rpb24gd2Fz
DQo+ID4+IGFnYWluc3QgImJhbmsiLCBub3QgIm1lbW9yeSIuIEFzIGFuIGFzaWRlLCB5b3UgYWxz
byBkb24ndCB3YW50IHRoZQ0KPiA+DQo+ID4gSG93IGFib3V0IGFyY2hfbWVtaW5mb19nZXRfbnJf
bWFwLyBhcmNoX21lbWluZm9fZ2V0X21hcF9yYW5nZT8NCj4gPiBJIGFtIHNvcnJ5LCBJIGFtIG5v
dCB2ZXJ5IGZhbWlsaWFyIHdpdGggZTgyMCBtYXAsIGNvdWxkIHlvdQ0KPiA+IGdpdmUgbWUgc29t
ZSBzdWdnZXN0aW9ucz8NCj4gDQo+IEZpcnN0IG9mIGFsbCBJIGRvbid0IHRoaW5rIHlvdSBuZWVk
IGEgImdldF9uciIgZnVuY3Rpb24gYXQgYWxsLCB3aGljaA0KPiBlbGltaW5hdGVzIHRoZSBuZWVk
IHRvIGZpbmQgYSBnb29kIG5hbWUgZm9yIGl0LiBUaGUgImdldF9yYW5nZSIgZnVuY3Rpb24NCj4g
Y2FuIGVhc2lseSBwcm92aWRlIGJhY2sgYSB1bmlxdWUgaW5kaWNhdG9yIHdoZW4gdGhlIHBhc3Nl
ZCBpbiBpbmRleCBpcw0KPiBiZXlvbmQgdGhlIG51bWJlciBvZiByZWdpb25zLiBGb3IgdGhpcyBm
dW5jdGlvbidzIG5hbWUsIGhvdyBhYm91dA0KPiBhcmNoX2dldF9tZW1vcnlfbWFwKCkgb3IgYXJj
aF9nZXRfbWVtb3J5X21hcF9ibG9jaygpIG9yDQo+IGFyY2hfZ2V0X21lbW9yeV9tYXBfcmFuZ2Uo
KSAoaW4gb3JkZXIgb2YgbXkgcGVyc29uYWwgcHJlZmVyZW5jZSk/DQo+IA0KDQpUaGFua3MsIEkg
d2lsbCB0cnkgdG8gdXNlIGFyY2hfZ2V0X21lbW9yeV9tYXAgZm9yIHg4NiBhbmQgYXJtLg0KDQo+
IEphbg0KDQo=


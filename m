Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E6D4CCD59
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 06:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283951.483063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ0eO-0003HE-4I; Fri, 04 Mar 2022 05:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283951.483063; Fri, 04 Mar 2022 05:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ0eO-0003E6-0P; Fri, 04 Mar 2022 05:38:48 +0000
Received: by outflank-mailman (input) for mailman id 283951;
 Fri, 04 Mar 2022 05:38:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mOd5=TP=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nQ0eL-0003Dz-O2
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 05:38:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a0626a5-9b7d-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 06:38:43 +0100 (CET)
Received: from DBBPR09CA0009.eurprd09.prod.outlook.com (2603:10a6:10:c0::21)
 by PAXPR08MB6622.eurprd08.prod.outlook.com (2603:10a6:102:153::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 05:38:40 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::90) by DBBPR09CA0009.outlook.office365.com
 (2603:10a6:10:c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Fri, 4 Mar 2022 05:38:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Fri, 4 Mar 2022 05:38:40 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Fri, 04 Mar 2022 05:38:40 +0000
Received: from 18f8c9b9f68e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0324454F-ED44-442B-AE3F-92CCB94F1C3A.1; 
 Fri, 04 Mar 2022 05:38:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18f8c9b9f68e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Mar 2022 05:38:30 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PR2PR08MB4857.eurprd08.prod.outlook.com (2603:10a6:101:1c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 4 Mar
 2022 05:38:24 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa%4]) with mapi id 15.20.5038.014; Fri, 4 Mar 2022
 05:38:24 +0000
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
X-Inumbo-ID: 5a0626a5-9b7d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k76k4ujfYmUlE3//lAUTcg7jG/wESpqtfiKW+HWvlJ8=;
 b=ylXojTDxlM5CN8Xss88NLO0FslpTncJ+5Qa1mVHTYlO386r+mG29PxuxRxIxB/MqUULIuKlbvUyFPCBWWj6g9dtlMrhi+8r3Cy6hxkR26g5QFoBrrUjDxh0IM4z6R2Nd2QfDUnn36ccl5WtmCS6FWezHbTEpFiDepjm+Zurwhus=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIT0qKCl+tRJYFmA682ISxj9sn7xexy6UugmLkh1lp8u6Vn08+KF/tEM1QmgAJ4/DaLfYCvbVgP9wTuOTlvTVwfsttoOwrqim8g1/Vu+uAXtfcwuGz0zdjcmB/6aHEsM/E8aeLjEwLf279PqCSm38fnzETwJ1A55c25feX29bWDUQN+DzAV0OFqbIvqFGG1QpnFTyJPngJreIDoMoQW2DNfSx2Ti/0kKlc0hYnUUMFfkt3Ii+uLeHH7hlWr1nG+VFAeBmpejsmCVOw+2ffGPpIy7Oq476tqZraoMyRdLVcJ/UW7uhTTomCYrR/l/arUqSExccl7PiDZ8tTVMd72yBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k76k4ujfYmUlE3//lAUTcg7jG/wESpqtfiKW+HWvlJ8=;
 b=CKtCW8npwMkROxC/dfUMQMwiEteeVg6wIFrPKg7EKx3WZAHAn3c2Me8ee40LACB1PoN3+tGVoUJqHvTSrxa1tv1l75ETGecGcFyj042hgvjr03K1ZNwE+poOXascZhkV0gOgTNGeMDGOdbhdg06/87mbbgFCSkaIZ+cbmWC+Cw1q6iaiZq6A+q1rUJP/XoGFahnjOaj2n6WZe6B/QJ5s5mYy5JoRxEZ7jLy0hNl22iU/F73qGlEbCnEYpsjQw2+AJ2YriNT355EpAF9VgolYzbI4ZXWZXB9JDqvzCFYgfdBumt+STXdAFboBQCR6qDi1B6PttjDWhqBgNYeSBA7d9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k76k4ujfYmUlE3//lAUTcg7jG/wESpqtfiKW+HWvlJ8=;
 b=ylXojTDxlM5CN8Xss88NLO0FslpTncJ+5Qa1mVHTYlO386r+mG29PxuxRxIxB/MqUULIuKlbvUyFPCBWWj6g9dtlMrhi+8r3Cy6hxkR26g5QFoBrrUjDxh0IM4z6R2Nd2QfDUnn36ccl5WtmCS6FWezHbTEpFiDepjm+Zurwhus=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index:
 AdgpQxtXwh7LkfydTgiYk9bhMgU+ogBRt1sAAKse4VAAPag1gAAckyvAACYrsoAAFEbkAA==
Date: Fri, 4 Mar 2022 05:38:24 +0000
Message-ID:
 <PAXPR08MB7420DAE8A51AF70882B7A8519E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <04db7e8b-2f04-41d7-1deb-d8bda3625c04@xen.org>
 <PAXPR08MB7420BF1299A1577B98211C1A9E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <1f0bba54-158b-d171-6f99-0c29e0547f8a@xen.org>
 <PAXPR08MB742067028155B11528C5CCA39E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <d860bbdb-c0ef-d4c4-51aa-b248a858e177@xen.org>
In-Reply-To: <d860bbdb-c0ef-d4c4-51aa-b248a858e177@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 384E887B958872428E23651BBB321FA8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7ee4bfee-fa9c-47e5-fc26-08d9fda13cd7
x-ms-traffictypediagnostic:
	PR2PR08MB4857:EE_|DB5EUR03FT048:EE_|PAXPR08MB6622:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB662282DA0E08D084306836F79E059@PAXPR08MB6622.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UiKpzEisX/L1ihJxU885WEzSJ4Ge5bzdKSqonVgjCVDHan1EE9Q/3SCcCPu+1Riia6/aL/AXylo5MX9sLzlYwdYPz4i+oVdZZiPvSR2TrN4e8fwHoM6PFRLg/aI8DQNE1FDTS40KagF64jzfWUFrT2j9vIMxCy/nm/SFcz5UQrceTa8AoN/5Xihf4mwXVLUF9Sj44etqr5eEClfWsjdi3OpBm+Cm8WsiVXFdv0tMYABPa+865Zlx4hoo9aS7kuMBglfHjOzWvWoZaI6GtI8bS8VX+oewmjODIFJfTWu3FiXS53J7FCzL/WndpM0uWm8dncm14W3/M2FoYkwJe5paJiX4mN+E7RCflykuGiwd9b/rJjuCojaEmzSGidWTS5x/UfG3fiA7zH7krhea4ULt9M1MzKLrFoUIG+mdI4XxPlMb2R7FPiuC5SlQg5RV84PIFfW9QpSZa20rzAZFO1M24Jyz9AorhAaEZEWauxGDWyUIzzAnQLBokiS/ohxJO2GtHZimbmEpyDfEzIIthaD5QgbTTnZROLb9If8wpfHxLL5SL+PeKIYBYKBzvBkB7fICsnjkdgtMYVNb3kFKbZDE2NIoGyFcVjxQMa4RtMgNJH9OGu9QUyCh1xA1FtE8zEvbF5I/GQDu/yVZfaHhHq/hxBjWq3//d2aMuEAwOYGjM9OcYyHNo8zseDX0KP+4ErrGK3DgZ85CibjY8GbUK6D3wZajox0Vhhm32wTLjQid3GVOkJdRPlBuKTwNYU3D+12RKfEj5kHDUJI+KT79nQj/SZO6pLF9QMCSr5nWMNCEMfw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(5660300002)(83380400001)(54906003)(53546011)(26005)(55016003)(6506007)(52536014)(186003)(7696005)(8936002)(9686003)(66556008)(66476007)(66446008)(71200400001)(122000001)(316002)(38100700002)(64756008)(86362001)(33656002)(508600001)(38070700005)(76116006)(66946007)(966005)(8676002)(4326008)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4857
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c667aa75-643a-43fb-f47f-08d9fda1338c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1XB2MXBQnhr3hCpRpXUWlAINSgULmnG3NuCM0kAdtEOgApNnpEkBHVf5bDMNI1Tcw9Sqzhg9c4i4rvr592B/tZErihPmvhI7FjE6mQmnyKWdPmcgqTNN8DcXmy/NC4b9HqWsYBYn4PJ6vmUSyoJvVTawtk4HDF/IBGlIV3DbFivlEHZnodAoj8MtYfmd/+Jnj/BBJFAnt/iNR/PR1oWRO40bes4+jXbBfXiEQtXRgGJmb9WKVS+SdZO9qBljHMBUX3EhUFpJGyW9FsZ3zcQnIKw4KRKdkrL36HHg2YqImam5Go7en9kbSy2eo2Pb602uKZC/9gJOAQsW043HlaaBr5pqW4a2Qx7o0oB6a6PmOMzUZdejg1hCqJFi1rwO8lg+EsUUjK/e79CSHiouU0ne4+drBqdMbbVrtN8GuFVIDI8GMC6H/fuGMABDvJXCMJuKHdMLM+ceLrIwZ7/rayJQuzhloBaZfAJ0S58+yKNyfe40C0h3jig7VxteWJ+o/WXrQpEpu37CgXhaL8+EnMmyNfdmHLKEAiOyXZv4DvYZBGgBXwJYr2tDZ0ib+zzWJZgOoPbNm+c3Y4s9/1FWuELu/09AitFyB5NzWpk+I9JD8A/GD6ZgiSwTqgWdJrwdwuEv2o7wjmoiss3AGLfDmlGdctfV29sNT0qhJpB416rNpcCH7oXxVgDte+5RNM7ROE+8aNdfIlEP1rOdX6UwmvG3MbuGGt6z/0IsdZwJfl8IsLe/X6x1B9JPMqd8kiX2jjnuVQw+wS7nQJoZEfMupaIB3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(40460700003)(82310400004)(33656002)(86362001)(81166007)(356005)(966005)(54906003)(110136005)(5660300002)(8936002)(52536014)(316002)(4326008)(8676002)(70586007)(70206006)(2906002)(83380400001)(36860700001)(47076005)(6506007)(7696005)(508600001)(9686003)(26005)(336012)(186003)(55016003)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 05:38:40.1829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee4bfee-fa9c-47e5-fc26-08d9fda13cd7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6622

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQz5pyINOaXpSAzOjUxDQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgUGVubnkg
WmhlbmcNCj4gPFBlbm55LlpoZW5nQGFybS5jb20+OyBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFy
bS5jb20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFByb3Bvc2FsIGZvciBQb3J0
aW5nIFhlbiB0byBBcm12OC1SNjQgLSBEcmFmdEENCj4gDQo+IEhpIFdlaSwNCj4gDQo+IE9uIDAz
LzAzLzIwMjIgMDI6MDYsIFdlaSBDaGVuIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBT
ZW50OiAyMDIy5bm0M+aciDLml6UgMjA6MDANCj4gPj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBh
cm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBTdGVmYW5vDQo+ID4+
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4+IENjOiBCZXJ0cmFuZCBN
YXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBQZW5ueSBaaGVuZw0KPiA+PiA8UGVu
bnkuWmhlbmdAYXJtLmNvbT47IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT47IG5kIDxu
ZEBhcm0uY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogUHJvcG9zYWwgZm9yIFBvcnRpbmcgWGVuIHRv
IEFybXY4LVI2NCAtIERyYWZ0QQ0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiAwMS8wMy8yMDIy
IDA3OjUxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+IEhpIEp1bGllbiwNCj4gPj4NCj4gPj4gSGkg
V2VpLA0KPiA+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJv
bTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPj4+PiBTZW50OiAyMDIy5bm0Muac
iDI25pelIDQ6NTUNCj4gPj4+PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+ID4+IFN0ZWZhbm8NCj4gPj4+PiBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+Pj4+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBQZW5ueSBaaGVuZw0KPiA+Pj4+IDxQZW5ueS5a
aGVuZ0Bhcm0uY29tPjsgSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPjsgbmQNCj4gPG5k
QGFybS5jb20+DQo+ID4+Pj4gU3ViamVjdDogUmU6IFByb3Bvc2FsIGZvciBQb3J0aW5nIFhlbiB0
byBBcm12OC1SNjQgLSBEcmFmdEENCj4gPj4+Pj4gIyMjIDEuMi4gWGVuIENoYWxsZW5nZXMgd2l0
aCBQTVNBIFZpcnR1YWxpemF0aW9uDQo+ID4+Pj4+IFhlbiBpcyBQTVNBIHVuYXdhcmUgVHlwZS0x
IEh5cGVydmlzb3IsIGl0IHdpbGwgbmVlZCBtb2RpZmljYXRpb25zIHRvDQo+ID4+IHJ1bg0KPiA+
Pj4+PiB3aXRoIGFuIE1QVSBhbmQgaG9zdCBtdWx0aXBsZSBndWVzdCBPU2VzLg0KPiA+Pj4+Pg0K
PiA+Pj4+PiAtIE5vIE1NVSBhdCBFTDI6DQo+ID4+Pj4+ICAgICAgICAtIE5vIEVMMiBTdGFnZSAx
IGFkZHJlc3MgdHJhbnNsYXRpb24NCj4gPj4+Pj4gICAgICAgICAgICAtIFhlbiBwcm92aWRlcyBm
aXhlZCBBUk02NCB2aXJ0dWFsIG1lbW9yeSBsYXlvdXQgYXMgYmFzaXMNCj4gb2YNCj4gPj4+PiBF
TDINCj4gPj4+Pj4gICAgICAgICAgICAgIHN0YWdlIDEgYWRkcmVzcyB0cmFuc2xhdGlvbiwgd2hp
Y2ggaXMgbm90IGFwcGxpY2FibGUgb24NCj4gPj4gTVBVDQo+ID4+Pj4gc3lzdGVtLA0KPiA+Pj4+
PiAgICAgICAgICAgICAgd2hlcmUgdGhlcmUgaXMgbm8gdmlydHVhbCBhZGRyZXNzaW5nLiBBcyBh
IHJlc3VsdCwgYW55DQo+ID4+Pj4gb3BlcmF0aW9uDQo+ID4+Pj4+ICAgICAgICAgICAgICBpbnZv
bHZpbmcgdHJhbnNpdGlvbiBmcm9tIFBBIHRvIFZBLCBsaWtlIGlvcmVtYXAsIG5lZWRzDQo+ID4+
Pj4gbW9kaWZpY2F0aW9uDQo+ID4+Pj4+ICAgICAgICAgICAgICBvbiBNUFUgc3lzdGVtLg0KPiA+
Pj4+PiAgICAgICAgLSBYZW4ncyBydW4tdGltZSBhZGRyZXNzZXMgYXJlIHRoZSBzYW1lIGFzIHRo
ZSBsaW5rIHRpbWUNCj4gPj4gYWRkcmVzc2VzLg0KPiA+Pj4+PiAgICAgICAgICAgIC0gRW5hYmxl
IFBJQyAocG9zaXRpb24taW5kZXBlbmRlbnQgY29kZSkgb24gYSByZWFsLXRpbWUNCj4gPj4gdGFy
Z2V0DQo+ID4+Pj4+ICAgICAgICAgICAgICBwcm9jZXNzb3IgcHJvYmFibHkgdmVyeSByYXJlLg0K
PiA+Pj4+DQo+ID4+Pj4gQXNpZGUgdGhlIGFzc2VtYmx5IGJvb3QgY29kZSBhbmQgVUVGSSBzdHVi
LCBYZW4gYWxyZWFkeSBydW5zIGF0IHRoZQ0KPiA+PiBzYW1lDQo+ID4+Pj4gYWRkcmVzcyBhcyBp
dCB3YXMgbGlua2VkLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gQnV0IHRoZSBkaWZmZXJlbmNlIGlz
IHRoYXQsIGJhc2Ugb24gTU1VLCB3ZSBjYW4gdXNlIHRoZSBzYW1lIGxpbmsNCj4gPj4gYWRkcmVz
cw0KPiA+Pj4gZm9yIGFsbCBwbGF0Zm9ybXMuIEJ1dCBvbiBNUFUgc3lzdGVtLCB3ZSBjYW4ndCBk
byBpdCBpbiB0aGUgc2FtZSB3YXkuDQo+ID4+DQo+ID4+IEkgYWdyZWUgdGhhdCB3ZSBjdXJyZW50
bHkgdXNlIHRoZSBzYW1lIGxpbmsgYWRkcmVzcyBmb3IgYWxsIHRoZQ0KPiA+PiBwbGF0Zm9ybXMu
IEJ1dCB0aGlzIGlzIGFsc28gYSBwcm9ibGVtIHdoZW4gdXNpbmcgTU1VIGJlY2F1c2UgRUwyIGhh
cyBhDQo+ID4+IHNpbmdsZSBUVEJSLg0KPiA+Pg0KPiA+PiBBdCB0aGUgbW9tZW50IHdlIGFyZSBz
d2l0Y2hpbmcgcGFnZS10YWJsZXMgd2l0aCB0aGUgTU1VIHdoaWNoIGlzIG5vdA0KPiA+PiBzYWZl
LiBJbnN0ZWFkIHdlIG5lZWQgdG8gdHVybiBvdXQgdGhlIE1NVSBvZmYsIHN3aXRjaCBwYWdlLXRh
YmxlcyBhbmQNCj4gPj4gdGhlbiB0dXJuIG9uIHRoZSBNTVUuIFRoaXMgbWVhbnMgd2UgbmVlZCB0
byBoYXZlIGFuIGlkZW50aXR5IG1hcHBpbmcgb2YNCj4gPj4gWGVuIGluIHRoZSBwYWdlLXRhYmxl
cy4gQXNzdW1pbmcgWGVuIGlzIG5vdCByZWxvY2F0ZWQsIHRoZSBpZGVudGl0eQ0KPiA+PiBtYXBw
aW5nIG1heSBjbGFzaCB3aXRoIFhlbiAob3IgdGhlIHJlc3Qgb2YgdGhlIHZpcnR1YWwgYWRkcmVz
cyBtYXApLg0KPiA+Pg0KPiA+DQo+ID4gSXMgdGhpcyB0aGUgc2FtZSByZWFzb24gd2UgY3JlYXRl
IGEgZHVtbXkgcmVsb2Mgc2VjdGlvbiBmb3IgRUZJIGxvYWRlcj8NCj4gDQo+IFRoZSByZWxvY2F0
aW9ucyBmb3IgdGhlIEVGSSBsb2FkZXIgYXJlIG5lY2Vzc2FyeSBiZWNhdXNlIElJUkMgaXQgaXMN
Cj4gcnVubmluZyB3aXRoIHZpcnQgPT0gcGh5cy4NCj4gDQo+IEJ1dCB0aGlzIGJyaW5ncyB0byBh
bGwgc29ydCBvZiBwcm9ibGVtOg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MTcxMjIxMTQ1NTIxLjI5NTI2LTEtDQo+IGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnLw0KPiANCg0K
SXQncyBpbnRlcmVzdGluZywgSSB3aWxsIGhhdmUgYSBsb29rIGludG8gdGhhdCB0aHJlYWQuDQoN
Cj4gWy4uLl0NCj4gDQo+ID4+Pg0KPiA+Pj4gU29tZSBjYWxsZXJzIHRoYXQgd2FudCB0byBjaGFu
Z2UgYSBtZW1vcnkncyBhdHRyaWJ1dGUgd2lsbCBzZXQgdGhlbS4NCj4gPj4gU29tZXRoaW5nIGxp
a2UNCj4gPj4+IGlvcmVtYXBfbm9jYWNoZS4gSSBhbSBub3Qgc3VyZSBpcyB0aGlzIHdoYXQgeW91
IGhhZCBhc2tlZCA6ICkNCj4gPj4NCj4gPj4gSSBhbSBhIGJpdCBjb25mdXNlZC4gSWYgaW9yZW1h
cF9ub2NhY2hlKCkgY2FuIGNoYW5nZSB0aGUgYXR0cmlidXRlLA0KPiB0aGVuDQo+ID4+IHdoeSB3
b3VsZCBpb3JlbWFwX2F0dHIoKSBub3QgYmUgYWJsZSB0byBkbyBpdD8NCj4gPj4NCj4gPg0KPiA+
IE1NVSBiYXNlZCBpb3JlcG1hcF94eHh4IGNhbiB1c2UgYSBuZXcgVkEgYW5kIG5ldyBQVEUgdG8g
ZG8gdGhpcy4gQnV0IGZvcg0KPiA+IE1QVSwgd2UgY2FuJ3QgZG8gaXQsIGV4Y2VwdCB5b3UgY2hh
bmdlIHRoZSB3aG9sZSBNUFUgcmVnaW9uJ3MgYXR0cmlidXRlLg0KPiA+IFRoZSByZWFzb25zIGFy
ZToNCj4gPiAxLiBGb3IgVjhSIFBNU0EsIG9uZSBwaHlzaWNhbCBhZGRyZXNzIG9ubHkgYmUgZXhp
c3RlZCBvbmUgTVBVIHJlZ2lvbi4NCj4gPiAyLiBUaGVyZSdzIG5vdCBlbm91Z2ggTVBVIHJlZ2lv
bnMgZm9yIHVzIHRvIHNwbGl0IG9uZSBNUFUgcmVnaW9uIHRvDQo+ID4gICAgIG11bHRpcGxlIE1Q
VSByZWdpb25zIChjaGFuZ2VkIHBhZ2VzIHJlZ2lvbiBhbmQgdW5tb2RpZmllZCBwYWdlcw0KPiBy
ZWdpb25zKS4NCj4gDQo+IE9rLiBJIHRoaW5rIHdlIHNob3VsZCBhdCBsZWFzdCBjaGVjayB0aGUg
YXR0cmlidXRlcyByZXF1ZXN0ZWQgbWF0Y2ggdGhlDQo+IG9uZSBpbiB0aGUgTVBVLg0KPiANCg0K
WWVzLCB0aGlzIGlzIHdoYXQgd2Ugd2FudCB0byBkby4NCg0KPiA+DQo+ID4+Pg0KPiA+Pj4+DQo+
ID4+Pj4+ICAgICAgICAgICAgICAgIGlmICggQ0FDSEVfQVRUUl9uZWVkX2NoYW5nZSApDQo+ID4+
Pj4+ICAgICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4gPj4+Pj4gICAgICAgICAgICAg
ICAgcmV0dXJuICh2b2lkICopcGE7DQo+ID4+Pj4+ICAgICAgICAgICAgfQ0KPiA+Pj4+PiAgICAg
ICAgICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVtICppb3JlbWFwX25vY2FjaGUoLi4uKQ0K
PiA+Pj4+PiAgICAgICAgICAgIHsNCj4gPj4+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIGlvcmVt
YXBfYXR0cihzdGFydCwgbGVuLA0KPiBQQUdFX0hZUEVSVklTT1JfTk9DQUNIRSk7DQo+ID4+Pj4+
ICAgICAgICAgICAgfQ0KPiA+Pj4+PiAgICAgICAgICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2lv
bWVtICppb3JlbWFwX2NhY2hlKC4uLikNCj4gPj4+Pj4gICAgICAgICAgICB7DQo+ID4+Pj4+ICAg
ICAgICAgICAgICAgIHJldHVybiBpb3JlbWFwX2F0dHIoc3RhcnQsIGxlbiwgUEFHRV9IWVBFUlZJ
U09SKTsNCj4gPj4+Pj4gICAgICAgICAgICB9DQo+ID4+Pj4+ICAgICAgICAgICAgc3RhdGljIGlu
bGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfd2MoLi4uKQ0KPiA+Pj4+PiAgICAgICAgICAgIHsN
Cj4gPj4+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIGlvcmVtYXBfYXR0cihzdGFydCwgbGVuLCBQ
QUdFX0hZUEVSVklTT1JfV0MpOw0KPiA+Pj4+PiAgICAgICAgICAgIH0NCj4gPj4+Pj4gICAgICAg
ICAgICB2b2lkICppb3JlbWFwKC4uLikNCj4gPj4+Pj4gICAgICAgICAgICB7DQo+ID4+Pj4+ICAg
ICAgICAgICAgICAgIHJldHVybiBpb3JlbWFwX2F0dHIocGEsIGxlbiwgUEFHRV9IWVBFUlZJU09S
X05PQ0FDSEUpOw0KPiA+Pj4+PiAgICAgICAgICAgIH0NCj4gPj4+Pj4NCj4gPj4+Pj4gICAgICAg
ICAgICBgYGANCj4gPj4+Pj4gICAgICAgIDQuIEZvciBgYWx0ZXJuYXRpdmVgLCBpdCBkZXBlbmRz
IG9uIGB2bWFwYCB0b28uDQo+ID4+Pj4NCj4gPj4+PiBUaGUgb25seSByZWFzb24gd2UgZGVwZW5k
IG9uIHZtYXAoKSBpcyBiZWNhdXNlIHRoZSBtYXAgdGhlIHNlY3Rpb25zDQo+ID4+Pj4gKnRleHQg
cmVhZC1vbmx5IGFuZCB3ZSBlbmZvcmNlIFduWC4gRm9yIFZNU0EsIGl0IHdvdWxkIGJlIHBvc3Np
YmxlIHRvDQo+ID4+Pj4gYXZvaWQgdm1hcCgpIHdpdGggc29tZSByZXdvcmsuIEkgZG9uJ3Qga25v
dyBmb3IgUE1TQS4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IEZvciBQTVNBLCB3ZSBzdGlsbCBlbmZv
cmNlIFduWC4gRm9yIHlvdXIgdXNlIGNhc2UsIEkgYXNzdW1lIGl0J3MNCj4gPj4gYWx0ZXJuYXRp
dmUuDQo+ID4+PiBJdCBzdGlsbCBtYXkgaGF2ZSBzb21lIHBvc3NpYmlsaXR5IHRvIGF2b2lkIHZt
YXAoKS4gQnV0IHRoZXJlIG1heSBiZQ0KPiA+PiBzb21lDQo+ID4+PiBzZWN1cml0eSBpc3N1ZXMu
IFdlIGhhZCB0aG91Z2h0IHRvIGRpc2FibGUgTVBVIC0+IHVwZGF0ZSB4ZW4gdGV4dCAtPg0KPiA+
PiBlbmFibGUNCj4gPj4+IE1QVSB0byBjb3B5IFZNU0EgYWx0ZXJuYXRpdmUncyBiZWhhdmlvci4g
VGhlIHByb2JsZW0gd2l0aCB0aGlzLA0KPiBob3dldmVyLA0KPiA+Pj4gaXMgdGhhdCBhdCBzb21l
IHBvaW50LCBhbGwgbWVtb3J5IGlzIFJXWC4gVGhlcmUgbWF5YmUgc29tZSBzZWN1cml0eQ0KPiA+
PiByaXNrLiA+IEJ1dCBiZWNhdXNlIGl0J3MgaW4gaW5pdCBzdGFnZSwgaXQgcHJvYmFibHkgZG9l
c24ndCBtYXR0ZXIgYXMNCj4gbXVjaA0KPiA+PiBhcw0KPiA+PiBJIHRob3VnaHQuDQo+ID4+DQo+
ID4+IEZvciBib290IGNvZGUsIHdlIG5lZWQgdG8gZW5zdXJlIHRoZSBjb2RlIGlzIGNvbXBsaWFu
dCB0byB0aGUgQXJtIEFybS4NCj4gPj4gT3RoZXIgdGhhbiB0aGF0LCBpdCBpcyBPSyB0byBoYXZl
IHRoZSBtZW1vcnkgUldYIGZvciBhIHNob3J0IHBlcmlvZCBvZg0KPiA+PiB0aW1lLg0KPiA+Pg0K
PiA+PiBJbiBmYWN0LCB3aGVuIHdlIG9yaWdpbmFsbHkgYm9vdCBYZW4sIHdlIGRvbid0IGVuZm9y
Y2UgV25YLiBXZSB3aWxsDQo+ID4+IHN0YXJ0IHRvIGVuZm9yY2Ugd2hlbiBpbml0aWFsaXppbmcg
dGhlIG1lbW9yeS4gQnV0IHRoZXJlIGFyZSBubyBibG9ja2VyDQo+ID4+IHRvIGRlbGF5IGl0IChv
dGhlciB0aGFuIHdyaXRpbmcgdGhlIGNvZGUgOikpLg0KPiA+DQo+ID4gQWgsIG9rLCBpdCBzZWVt
cyB3ZSBzdGlsbCBjYW4gaW1wbGVtZW50IGFsdGVybmF0aXZlIG9uIE1QVSBzeXN0ZW0uDQo+ID4g
SSB3aWxsIHVwZGF0ZSBpdCBpbiBuZXcgdmVyc2lvbiBwcm9wb3NhbCwgYnV0IHBsYWNlIGl0IGlu
IFRPRE8sIEkgZG9uJ3QNCj4gPiB3YW50IHRvIGluY2x1ZGUgaXQgYmVmb3JlIHNpbmdsZSBDUFUg
c3VwcG9ydCBiZSBtZXJnZWQuIEJlY2F1c2UgY3VycmVudA0KPiA+IHBhdGNoIHNlcmllcyBpcyBo
dWdlIGVub3VnaCA6ICkNCj4gDQo+IFRoYXQncyBmaW5lIHdpdGggbWUuIEkgYW0gbm90IGV4cGVj
dGluZyB5b3UgdG8gaW1wbGVtZW50IGV2ZXJ5dGhpbmcgd2UNCj4gZGlzY3Vzc2VkIGhlcmUgZnJv
bSBkYXkgMSEgOikNCj4gDQoNCkdyZWF0ISBUaGFua3N+DQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0N
Cj4gSnVsaWVuIEdyYWxsDQo=


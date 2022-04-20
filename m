Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A236750807F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 07:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308778.524569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh2lr-0002cM-RV; Wed, 20 Apr 2022 05:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308778.524569; Wed, 20 Apr 2022 05:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh2lr-0002ZE-Nd; Wed, 20 Apr 2022 05:20:55 +0000
Received: by outflank-mailman (input) for mailman id 308778;
 Wed, 20 Apr 2022 05:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhSL=U6=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nh2lp-0002Yx-Qd
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 05:20:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3e1b63a-c069-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 07:20:51 +0200 (CEST)
Received: from AM6P191CA0053.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::30)
 by DB7PR08MB4217.eurprd08.prod.outlook.com (2603:10a6:10:7d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 05:20:46 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::72) by AM6P191CA0053.outlook.office365.com
 (2603:10a6:209:7f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Wed, 20 Apr 2022 05:20:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Wed, 20 Apr 2022 05:20:46 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Wed, 20 Apr 2022 05:20:46 +0000
Received: from 753e7e94aab8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1342B96E-E41D-4049-B731-89AF7C950345.1; 
 Wed, 20 Apr 2022 05:20:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 753e7e94aab8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Apr 2022 05:20:36 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by DB9PR08MB7400.eurprd08.prod.outlook.com (2603:10a6:10:370::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 05:20:32 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::757a:6418:db32:ef54]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::757a:6418:db32:ef54%5]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 05:20:32 +0000
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
X-Inumbo-ID: a3e1b63a-c069-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCRvPT5tGqVtiSgddC/uOQHw4vYXTqMXlCZj29+Cv04=;
 b=YP1lDhrhSb5T0llu81CLxBa4gbHZp3lNMBiy5fnwJwj15mteVIsKY3ceK4a3PUpk7Q9CrfeRQWDlecsjfyN4fWB1Ke5KUOX7NmrAQXzju/nThpBvY4d+87SsG6vCI7pkfZmHVefMCvJ8YfIiCqV5iJIUjIK5AU3ShIPpW2h9kz4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8854Oz1L/P0mFyLo46uFTq89q/oYz2T2OelvxOOVQrDastDabJ8MHiPRLxcBGzCK1rkH4gomFFl3coikjLQUc8ijPGUaBDaM6A4T+p+T8yrRGniW12ocTRxRtXZm5DAf2mw4oe/7p9F+1oeoTIbFNJWDImL0mFs7XjzRQQpYSi3RdBWEzEkNYBNnRfzq7Vs+goo78JjxtZ7XuBY1nu37/H+Qi5dMKmf7AO5PswTjIJGAC6PTQA+3lv3V92JaJ+pCEplgOR5Ok65oYVYLtm2M+O/gclIP67TiaUwHwESxvpG/CNMKiNgzBDJEYIekLCG1jr1ma+D6/+88+A1gE5ymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCRvPT5tGqVtiSgddC/uOQHw4vYXTqMXlCZj29+Cv04=;
 b=Hkib1xfTbd9261fos459RRLDUjXO46VarsUUtDQo/V9/o3KlFrQZfkMMsStDenVl5s613q+fw6xjMntHTBw0IJLxcfgHA0+Hz30FkiLBrKs/MQHGwWCQg3XoqjTEzbTjr3/sDOZjWeTsiMJsZ2E3l6LIXM0PMD+CU52ZVJgmAqfl6gkEkCWsrvBAC81NQ10dJNawgNbpGDVMMbL+ycZUGOJkeW0/cM9SBcx5njC3vIsjBDrZvPtHzj2x08m4p6TwllEbTapdyRWLeNcXCm13BDcsCPjfh2lEbU1IZaQ4ahnMoUjkks+G69Kio9SSVjy1mjxhVDrj2ldfUX75TGhatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCRvPT5tGqVtiSgddC/uOQHw4vYXTqMXlCZj29+Cv04=;
 b=YP1lDhrhSb5T0llu81CLxBa4gbHZp3lNMBiy5fnwJwj15mteVIsKY3ceK4a3PUpk7Q9CrfeRQWDlecsjfyN4fWB1Ke5KUOX7NmrAQXzju/nThpBvY4d+87SsG6vCI7pkfZmHVefMCvJ8YfIiCqV5iJIUjIK5AU3ShIPpW2h9kz4=
From: Henry Wang <Henry.Wang@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <Julien.Grall@arm.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jiamei Xie <Jiamei.Xie@arm.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: RE: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on Arm
Thread-Topic: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on Arm
Thread-Index: AQHYS3WQHsQlT+jCYUK0AMl/K/Wipqz4VTPg
Date: Wed, 20 Apr 2022 05:20:32 +0000
Message-ID:
 <PA4PR08MB6253F275EE7374EA556A076B92F59@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-3-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1649442065-8332-3-git-send-email-olekstysh@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DF1593E98A87E0469420CBBBDA3D3C45.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f03339e0-419b-4e8d-f98b-08da228d864a
x-ms-traffictypediagnostic:
	DB9PR08MB7400:EE_|VE1EUR03FT008:EE_|DB7PR08MB4217:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB421749806D398C95FEF7321F92F59@DB7PR08MB4217.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m6mQQ9i0b8qgj0h19XHEenmwTMDuo6pD9hl5xPoF3zQEE5W3xUWc6PwdsoeUQH2xEtIYbiJ6PHqakWKeA9+qq8nuL6Y5NvmHLdjMSoci6Vp9qyEJxlG0ZcCBdjyLA+15P3TPhRAm0L97KROTkIt7sHBdCX+lbNYWDTefcT5XU0F2Bun8smQzLN9b7rUyTupXB+/LKonyHMa6K9qi9Zb+koCLt9wiSWN7e3gImhJtMP6v0DknPxAT2vSPMImGZFlTyKJ9qUHHXFENtX+2NESxj3uqe4O2fr7rDpkLGk2LI8bygM+/ccpLshAqlk7S6Yo+7vcPnDsTR1khr/tKDl9jf2zM/88JAeXWDpBlsCoFuRecYWQ3shvSlIbD/I9jS68IwXHrLUIiEajOnB70MRzPMTqO1mtPqsR1vhDbjk7b5kvETiiJG1Eg1yG19Zm9hFOoaXnBhBZspmKlSYOctS+1Ib5e01HjZU2rI6zERCQu1Tvo/okrb2TLXq0otOrB5oGimDkYCMs5cSfS48NfuuEBTSYeT11KSk9h5hTMj0kwsc4z7x0uhf6cWhqks3pT/2MrWhTUhhxmcNag/BowSZxi5YFYX0N98Owov5XTsy8iR6Qy2EKSGoBre/82d7Zg3Fc7keyV/06qtMkRbr/g+kQRE35QTLnvqNtMfwz+euldIzdA02LmWY1CZ0GMWc8rNdy1SXxWdf7sIpcJGRhjV4I9fw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(76116006)(52536014)(66556008)(83380400001)(9686003)(66476007)(33656002)(66446008)(8936002)(5660300002)(66946007)(8676002)(4326008)(64756008)(110136005)(26005)(54906003)(6506007)(7696005)(55016003)(71200400001)(122000001)(38100700002)(38070700005)(2906002)(316002)(86362001)(508600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7400
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7575981-0564-446f-59cd-08da228d7dbc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i8hZVktg4CI7huPmaK6dXdqePMmi3+P5NLzI1aJUgTCzz0BPzDJFt5BQV3qiMO4lN5PHIhiYdsF/DgnnbtT0AzvQu9ODJ+g06EHBBYcdnPE7q8PdbKJoNw0kEqHYdBxehnytzzdSXA3nmlXuQxNXkfzH/TK0IehrB4LEs4rQkIF9xRBbWk8fSJZWoEaNy5sE2c37FdWJwuDuZL2ivU9UhTJNUB5n/XrLvx51m1bPc5xIa/lxG8WbavWJsKOalpFpNl5+Hz1GaIERAyMf1+pNIkeuwNyg3pNNBKnw+NLW0rh3Azj3TcrEs2H0UGgNoTHQjYYjdtifmubcFPp8RFf+hzd+GV9x7gF4OTgsiSNpE8WDTU7VqptYIAcu2xtcqaYv7MEmXBOVHtAeBuOB7G6paPs/+0BD4j+rjDoVtpD+9Qr5gNUaXZPPYYKxPaQ0rwC7WYGW4I21aumkVj72Mwmx5zSpcjR4SXmZbR02wB19h5tuyRWjx/is/EtuD+bkTEhswzqW/YYR52hRhxd+rutY4RgX0pRPqilVN1WPqLKax4MnDyGy04b5CFDXRLwweUnnEJLfqAzfZNJdsvOFs+npVfHzHOShK7r7ExTTBe0yfyuSDdhazrK2LdEkw2PBeZXD+wqS1rgbXTRSYE5nxghuEppQuH685qGCQnZ9MX79JGGxE0swuqWuvWLK/vp2vh4d
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(356005)(52536014)(33656002)(81166007)(5660300002)(2906002)(107886003)(316002)(86362001)(8936002)(40460700003)(83380400001)(110136005)(54906003)(186003)(70206006)(508600001)(4326008)(47076005)(9686003)(70586007)(26005)(6506007)(336012)(7696005)(8676002)(55016003)(82310400005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 05:20:46.4202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f03339e0-419b-4e8d-f98b-08da228d864a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4217

SGkgT2xla3NhbmRyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE9s
ZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc3R5c2hAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBbUEFU
Q0ggVjcgMi8yXSBsaWJ4bDogSW50cm9kdWNlIGJhc2ljIHZpcnRpby1tbWlvIHN1cHBvcnQgb24g
QXJtDQo+IA0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiAN
Cj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGhlbHBlcnMgdG8gYWxsb2NhdGUgVmlydGlvIE1NSU8g
cGFyYW1zDQo+IChJUlEgYW5kIG1lbW9yeSByZWdpb24pIGFuZCBjcmVhdGUgc3BlY2lmaWMgZGV2
aWNlIG5vZGUgaW4NCj4gdGhlIEd1ZXN0IGRldmljZS10cmVlIHdpdGggYWxsb2NhdGVkIHBhcmFt
cy4gSW4gb3JkZXIgdG8gZGVhbA0KPiB3aXRoIG11bHRpcGxlIFZpcnRpbyBkZXZpY2VzLCByZXNl
cnZlIGNvcnJlc3BvbmRpbmcgcmFuZ2VzLg0KPiBGb3Igbm93LCB3ZSByZXNlcnZlIDFNQiBmb3Ig
bWVtb3J5IHJlZ2lvbnMgYW5kIDEwIFNQSXMuDQo+IA0KPiBBcyB0aGVzZSBoZWxwZXJzIHNob3Vs
ZCBiZSB1c2VkIGZvciBldmVyeSBWaXJ0aW8gZGV2aWNlIGF0dGFjaGVkDQo+IHRvIHRoZSBHdWVz
dCwgY2FsbCB0aGVtIGZvciBWaXJ0aW8gZGlzayhzKS4NCj4gDQo+IFBsZWFzZSBub3RlLCB3aXRo
IHN0YXRpY2FsbHkgYWxsb2NhdGVkIFZpcnRpbyBJUlFzIHRoZXJlIGlzDQo+IGEgcmlzayBvZiBh
IGNsYXNoIHdpdGggYSBwaHlzaWNhbCBJUlFzIG9mIHBhc3N0aHJvdWdoIGRldmljZXMuDQo+IEZv
ciB0aGUgZmlyc3QgdmVyc2lvbiwgaXQncyBmaW5lLCBidXQgd2Ugc2hvdWxkIGNvbnNpZGVyIGFs
bG9jYXRpbmcNCj4gdGhlIFZpcnRpbyBJUlFzIGF1dG9tYXRpY2FsbHkuIFRoYW5rZnVsbHksIHdl
IGtub3cgaW4gYWR2YW5jZSB3aGljaA0KPiBJUlFzIHdpbGwgYmUgdXNlZCBmb3IgcGFzc3Rocm91
Z2ggdG8gYmUgYWJsZSB0byBjaG9vc2Ugbm9uLWNsYXNoZWQNCj4gb25lcy4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNv
bT4NCj4gVGVzdGVkLWJ5OiBKaWFtZWkgWGllIDxKaWFtZWkueGllQGFybS5jb20+DQo+IFJldmll
d2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IC0tLQ0KPiBASmlhbWVp
LCBASGVucnkgSSBkZWNpZGVkIHRvIGxlYXZlIHlvdXIgVC1iIGFuZCBSLWIgdGFncyB3aXRoIHRo
ZSBtaW5vcg0KPiBjaGFuZ2UgSSBtYWRlLCBhcmUgeW91IHN0aWxsIGhhcHB5IHdpdGggdGhhdD8N
Cg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlc3BvbnNlLCBqdXN0IGNoZWNrZWQgdGhlIGNvZGUgYW5k
IHllcyBJIGFtIGhhcHB5IHdpdGgNCmtlZXBpbmcgbXkgUmV2aWV3ZWQtYnkuIFRoYW5rcyBmb3Ig
eW91ciBlZmZvcnQgaW4gcmViYXNpbmcgdGhlIHBhdGNoIQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5y
eQ0K


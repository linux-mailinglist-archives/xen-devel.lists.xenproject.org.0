Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EFE6EDB7B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 08:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525724.817091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prBnX-00008y-Q7; Tue, 25 Apr 2023 06:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525724.817091; Tue, 25 Apr 2023 06:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prBnX-00007C-M1; Tue, 25 Apr 2023 06:05:07 +0000
Received: by outflank-mailman (input) for mailman id 525724;
 Tue, 25 Apr 2023 06:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxzM=AQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1prBnW-000073-LW
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 06:05:06 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e958e7c-e32f-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 08:05:03 +0200 (CEST)
Received: from DB6PR0202CA0048.eurprd02.prod.outlook.com (2603:10a6:4:a5::34)
 by DB9PR08MB8357.eurprd08.prod.outlook.com (2603:10a6:10:3db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 06:04:54 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::77) by DB6PR0202CA0048.outlook.office365.com
 (2603:10a6:4:a5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Tue, 25 Apr 2023 06:04:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.20 via Frontend Transport; Tue, 25 Apr 2023 06:04:53 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Tue, 25 Apr 2023 06:04:53 +0000
Received: from 12ea708596bb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9004B26-6C67-4DFB-A90D-43D5988DECA3.1; 
 Tue, 25 Apr 2023 06:04:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12ea708596bb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Apr 2023 06:04:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB7867.eurprd08.prod.outlook.com (2603:10a6:10:39e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 06:04:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 06:04:39 +0000
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
X-Inumbo-ID: 1e958e7c-e32f-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DXQAmi2cw7qAWPFSwO5nYY4M+EiR6g3vt7i7YeNRxw=;
 b=Cn+eCr/t1gQHwchsED7V3Pkkq/WxBYhNYU782Ee9ozyL2Nz5reVJwHZl4VcvpB1peWRuzJv7ORzD3ks+nBzpmmevemfSnXA6TurmyZI59r49Mb8Cz29qf708l2B8pljpSJUl+toXHjwiaYRfuOmg3Zw5qx/LZfl0pUMEkA/XrEQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 632e7ec6c46a1ba6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmJYnnlWtjbpZriVWMfsWwvMl/bpB8Pl5eFli2djydH8I2Djv47PIG0IpQKzYoTCuwAoT1Ea7gZ2Az5qKypHq0Z7xovLR4vEMzb+id0X1BRNK9krWm2rqcKXVgc+NxiUNhwRkdfcuPsyKswd6N3k+R8DIeGB6nwBs/wIwNsLtBAwTBSSAD8/99S8qViiagv0a8JOh/6NAREUs8yoo0/y2dzjwVHGwIYwG3I9gZizSEjEcvRk6C013ubFP9aapGYpspLMiWI6ZmZnraqW9psIXdYITrCZ8V1GSO0ELqggoAqo48Dn78tKQI3WgSg7F2Qt/PZ9YQ13fIDE+YN0HirITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DXQAmi2cw7qAWPFSwO5nYY4M+EiR6g3vt7i7YeNRxw=;
 b=PBrSoIR/MJLvMBoCBqyQpmeB6QM68MHHDYTzXRKciBXoSaIwaL2qr9gOWliQH4sf8aB6RQAy4TH6eeMbnUAz9+X3Yndzes336sEJIyYOzJ5AcGTm+DKY9cZy/RWWZFfGJ0+yVmSg8vqzSyknyjYlSC+DCPIEa3pfWNK1+UJa9d2Rn0ZQOaYfAYb5tHCKR4rZ7CRZ5To26scK6bYCBiSNmjaCd2koLk0KFQz25cV9Nk9lVOyT6kVIRkFkauRvbcs+wzCczREEF4oZTM621J+8/s+O/6Pt6z4dRKVeyVB1PrzGLKhgLPN6hQuKryPiaTffRKhaF7znAWG5EjSX4uHKmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DXQAmi2cw7qAWPFSwO5nYY4M+EiR6g3vt7i7YeNRxw=;
 b=Cn+eCr/t1gQHwchsED7V3Pkkq/WxBYhNYU782Ee9ozyL2Nz5reVJwHZl4VcvpB1peWRuzJv7ORzD3ks+nBzpmmevemfSnXA6TurmyZI59r49Mb8Cz29qf708l2B8pljpSJUl+toXHjwiaYRfuOmg3Zw5qx/LZfl0pUMEkA/XrEQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Index:
 AQHZdnKG11PjGcmQuE2MpJrElBiS3686VJGAgAAo1ICAAAFsAIAADk4AgAACvwCAAANFAIAAAd0AgAACk4CAAAHsAIAAALeAgAAHWYCAAOkjgA==
Date: Tue, 25 Apr 2023 06:04:39 +0000
Message-ID: <C1815EB3-E875-4D49-831A-56E152BF4B61@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
 <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
 <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
 <d49f1df6-ac49-27ef-d55f-b6284c76b055@suse.com>
 <5535FDB0-989E-4536-AF7B-8F0BB561667A@arm.com>
 <bd064b44-3531-a1b0-a7a8-1ad7ae434394@suse.com>
 <300BE89F-CA37-4A28-9CC5-5875E10D4A0C@arm.com>
 <a268313d-03be-9281-3627-c38115d3e5de@suse.com>
 <B534E482-71BF-4C5F-B9A8-3D567367F7AA@arm.com>
 <f9e631e1-02bb-a565-4df4-ccbb66fbaf49@suse.com>
In-Reply-To: <f9e631e1-02bb-a565-4df4-ccbb66fbaf49@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB7867:EE_|DBAEUR03FT051:EE_|DB9PR08MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd35383-b3eb-48ee-0e7f-08db4552fd24
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fdnLf2M0D2npr5GHV4czDGNa7GS966hTnlsKC3sTURB3prPWcAZ7j1832i67ec1H3e9uNpk6fkv91YQsxDSo1ixVrvgC40yXfdEyIh5BS1cBt5wMfY4MfzFhE+lZAXfJWWC7Vl+6jJCscxP3vn8m22pFlFNn05lYYawHzjys0+lveWCr/pAhOXefWjbbV4UyNdZMqJwZycpbR7qRiY+bUnkcf7EtwFnmSyY2qDxfM9O57taZsLxtYxLtsaSFSpWM1MBjAFT76KW/z1Kh6iMlDD8g9TaYZn5LlAgkJ5YGosPlwgiNdDmNYlUguSCOPOmC6fGyq49zE55daI7M5rpZkaAV6ZwuvJ+5VBl9ISEmb9byEQjdkPVLRYwsH2TRd7IoXHJzOiTT0pM/3alYvSSM2WNw8ozRT/BtQn46Icnz/OePuJK7iX2DTbzrP7sKDT7CSeHNGrt4vTUzTvySWPTrXUIjLn8E1w6Nw2zkDC9b2nIOFiZoha+iULc17F3CJf2Y8uhpOF5yDSn0Gl1/PmrBHO5AJvIioc5iwtkzYoriEfWG0EtOg7yOTKDJm3uDKNADh7OdMge58EM42MYyU9bJO2D5kZvvaOyuit5iWtO9zR36GgHJ6zPkkbhd1WUKuf1ZJaIiPklfS5XwJIRkyd8h7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(53546011)(6506007)(26005)(6512007)(38070700005)(2616005)(36756003)(186003)(122000001)(38100700002)(66946007)(478600001)(76116006)(86362001)(6916009)(66556008)(66476007)(66446008)(8676002)(8936002)(54906003)(64756008)(91956017)(5660300002)(71200400001)(6486002)(41300700001)(2906002)(4326008)(33656002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7294551E31C0B140A41CE443AA6F8FFA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7867
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a629474d-3425-4eaa-0970-08db4552f4a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aSrKzY4nok6aq73gFi4YZeVq5yeGOXZaiAsZzXlUKs4JJ23pDuX9gpIwk+mIEIhmdC42V9ygm38Puiqp10WVGQ87525TrF666OUDGulQpABz+T5u43m+OAsMigsqJ919SVTqeyJ33kqgP3VbfuRdy4+l1NKnH/ZY9oOTldjUWhu412ADyQ6F65zrXprbxOLXvetu+6bMxMY/gejzIT73pHYZLnuw8Aw/fmErFa8AKuK/YLWaLX/AnrYuwfhxE8PuFnx3WjC/c2Z6LGspS/Nb7D6tpy4WdrcJChM8LapwksJcv1aiXnVBBWz+FnYXpX8nvbK1E5hdG5MC66vCfD0yW2L5Su8kRkYWA1y8IMrmbthW6L1o6GqUA+mQQD4EIwlRUBr1em9I1X6Hu0DRI+0nhHT6eviOdfDhJ+BJQ0EKMvpTVmt0BuIZVZxU1Y7uYRnnIwOFFyKeUS4ubJ+70zg2cxqzI6zukkPxKLCKvOCSvIdyUVv1EXYpHI+UgpKnP6tEanBQ+Y+mjyVqzNx6Z3twL0Crz0s0LQCMzRJRoRcCoRN8qIl8pyomoig9oLtqMy0gF/QcIEMTA5KOCWj0ElFUHqnMnP6L7CutCFGXKb2VCnqkkCj3XKlwGaSFgatOPzWXWLV0PjXS00fv3iuLimJsIVLTr7QjQqeJEQDkjjbIY2nh9D4nAtaEUjh3XaeHZ8aSjaTtvVgXEAsBhWgYqTbYWQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(54906003)(86362001)(478600001)(40460700003)(36756003)(186003)(6486002)(53546011)(6512007)(6506007)(8936002)(26005)(40480700001)(82310400005)(33656002)(82740400003)(316002)(356005)(336012)(81166007)(41300700001)(36860700001)(4326008)(70206006)(70586007)(8676002)(5660300002)(47076005)(2906002)(6862004)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 06:04:53.9534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd35383-b3eb-48ee-0e7f-08db4552fd24
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8357

DQoNCj4gT24gMjQgQXByIDIwMjMsIGF0IDE3OjEwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjQuMDQuMjAyMyAxNzo0MywgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyNCBBcHIgMjAyMywgYXQgMTY6NDEsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjQuMDQuMjAyMyAxNzozNCwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4+IE9uIDI0IEFwciAyMDIzLCBhdCAxNjoyNSwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDI0LjA0LjIwMjMgMTc6MTgsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4gT2ggb2ssIEkgZG9u4oCZdCBrbm93LCBoZXJlIHdoYXQg
SSBnZXQgaWYgZm9yIGV4YW1wbGUgSSBidWlsZCBhcm0zMjoNCj4+Pj4+PiANCj4+Pj4+PiBhcm0t
bGludXgtZ251ZWFiaWhmLWxkIC1FTCAtVCBhcmNoL2FybS94ZW4ubGRzIC1OIHByZWxpbmsubyBc
DQo+Pj4+Pj4gLi9jb21tb24vc3ltYm9scy1kdW1teS5vIC1vIC4vLnhlbi1zeW1zLjANCj4+Pj4+
PiBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiBwcmVsaW5rLm86IGluIGZ1bmN0aW9uIGBjcmVhdGVf
ZG9tVXMnOg0KPj4+Pj4+ICguaW5pdC50ZXh0KzB4MTM0NjQpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBzdmVfZG9tY3RsX3ZsX3BhcmFtJw0KPj4+Pj4gDQo+Pj4+PiBJbiBwYXJ0aWN1bGFyIHdp
dGggc2VlaW5nIHRoaXM6IFdoYXQgeW91IGNvcGllZCBoZXJlIGlzIGEgYnVpbGQgd2l0aCB0aGUN
Cj4+Pj4+IHNlcmllcyBhcHBsaWVkIG9ubHkgdXAgdG8gdGhpcyBwYXRjaD8gSSBhc2sgYmVjYXVz
ZSB0aGUgcGF0Y2ggaGVyZSBhZGRzIGENCj4+Pj4+IGNhbGwgb25seSBvdXQgb2YgY3JlYXRlX2Rv
bTAoKS4NCj4+Pj4gDQo+Pj4+IE5vIEnigJl2ZSBkbyB0aGUgY2hhbmdlcyBvbiB0b3Agb2YgdGhl
IHNlcmllLCBJ4oCZdmUgdHJpZWQgaXQgbm93LCBvbmx5IHRvIHRoaXMgcGF0Y2ggYW5kIGl0IGJ1
aWxkcyBjb3JyZWN0bHksDQo+Pj4+IEl0IHdhcyBteSBtaXN0YWtlIHRvIGRvbuKAmXQgcmVhZCBj
YXJlZnVsbHkgdGhlIGVycm9yIG91dHB1dC4NCj4+Pj4gDQo+Pj4+IEFueXdheSBJIGd1ZXNzIHRo
aXMgY2hhbmdlIGlzIG5vdCBhcHBsaWNhYmxlIGJlY2F1c2Ugd2UgZG9u4oCZdCBoYXZlIGEgc3lt
Ym9sIHRoYXQgaXMgcGxhaW4gMCBmb3IgZG9tVXMNCj4+Pj4gdG8gYmUgcGxhY2VkIGluc2lkZSBj
cmVhdGVfZG9tVXMuDQo+Pj4gDQo+Pj4gUG9zc2libGUsIGJ1dCB3b3VsZCB5b3UgbWluZCBmaXJz
dCB0ZWxsaW5nIG1lIGluIHdoaWNoIG90aGVyIHBhdGNoKGVzKSB0aGUNCj4+PiBmdXJ0aGVyIHJl
ZmVyZW5jZShzKSBhcmUgYmVpbmcgaW50cm9kdWNlZCwgc28gSSBjb3VsZCB0YWtlIGEgbG9vayB3
aXRob3V0DQo+Pj4gKGFnYWluKSBkaWdnaW5nIHRocm91Z2ggdGhlIGVudGlyZSBzZXJpZXM/DQo+
PiANCj4+IFN1cmUsIHRoZSBvdGhlciByZWZlcmVuY2VzIHRvIHRoZSBmdW5jdGlvbiBhcmUgaW50
cm9kdWNlZCBpbiAieGVuL2FybTogYWRkIHN2ZSBwcm9wZXJ0eSBmb3IgZG9tMGxlc3MgZG9tVXPi
gJ0gcGF0Y2ggMTENCj4gDQo+IFBlcnNvbmFsbHkgSSdtIGluY2xpbmVkIHRvIHN1Z2dlc3QgYWRk
aW5nICIjaWZkZWYgQ09ORklHX0FSTTY0X1NWRSIgdGhlcmUuDQo+IEJ1dCBJIGd1ZXNzIHRoYXQg
bWF5IGFnYWluIGdvIGFnYWluc3QgeW91ciBkZXNpcmUgdG8gbm90IGlnbm9yZSBpbmFwcGxpY2Fi
bGUNCj4gb3B0aW9ucy4gU3RpbGwgSSBjYW4ndCByZXNpc3QgdG8gYXQgbGVhc3QgYXNrIGhvdyBh
biAic3ZlIiBub2RlIG9uIEFybTMyIGlzDQo+IGRpZmZlcmVudCBmcm9tIGFuIGVudGlyZWx5IHVu
a25vd24gb25lLg0KDQpJdCB3b3VsZCBiZSBvayBmb3IgbWUgdG8gdXNlICNpZmRlZiBDT05GSUdf
QVJNNjRfU1ZFIGFuZCBmYWlsIGluIHRoZSAjZWxzZSBicmFuY2gsDQpidXQgSSBoYWQgdGhlIGZl
ZWxpbmcgaW4gdGhlIHBhc3QgdGhhdCBBcm0gbWFpbnRhaW5lcnMgYXJlIG5vdCB2ZXJ5IGhhcHB5
IHdpdGggI2lmZGVmcywgSSBtaWdodA0KYmUgd3Jvbmcgc28gSeKAmWxsIHdhaXQgZm9yIHRoZW0g
dG8gZ2l2ZSBhbiBvcGluaW9uIGFuZCB0aGVuIEkgd2lsbCBiZSBoYXBweSB0byBmb2xsb3cuDQoN
Cj4gDQo+IEphbg0KDQoNCg==


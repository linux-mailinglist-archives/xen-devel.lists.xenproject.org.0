Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD016EC76F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 09:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525169.816196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqyG-0004Sv-5q; Mon, 24 Apr 2023 07:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525169.816196; Mon, 24 Apr 2023 07:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqyG-0004R2-36; Mon, 24 Apr 2023 07:50:48 +0000
Received: by outflank-mailman (input) for mailman id 525169;
 Mon, 24 Apr 2023 07:50:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qjkp=AP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pqqyE-0004Qw-V5
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 07:50:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe13::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7d32504-e274-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 09:50:44 +0200 (CEST)
Received: from DBBPR09CA0026.eurprd09.prod.outlook.com (2603:10a6:10:d4::14)
 by DU0PR08MB7883.eurprd08.prod.outlook.com (2603:10a6:10:3b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 07:50:38 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::d4) by DBBPR09CA0026.outlook.office365.com
 (2603:10a6:10:d4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 07:50:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 07:50:37 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Mon, 24 Apr 2023 07:50:37 +0000
Received: from 175549e814df.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E3BB9576-1ACB-4984-8664-B976C20384B7.1; 
 Mon, 24 Apr 2023 07:50:28 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 175549e814df.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Apr 2023 07:50:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB7308.eurprd08.prod.outlook.com (2603:10a6:20b:443::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 07:50:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 07:50:25 +0000
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
X-Inumbo-ID: b7d32504-e274-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6koWl1EEaDK1bKXULodqi9HRV5gxBShr8+3W08htdeY=;
 b=51UW1+8ccWMi1kD83MJonO2eDWcW+r/R+QZeylsLN9VkPvrh/FbIWPsqYjUKXzoOc0b7Wx4TEKwT2vggRW/2FAslrN6Iflipx/2yGfp/b9tcxdVpesI7TOkiQu9PSuw/5l00lLD9n+xYJigJT++S4KX1S3kbKaWCDQg5UXJ+znE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDfqucf7bhvNbRAndA80AnSCrVuFWSezA0bXxfLPvw3JugnuJ8CzkCJ9z6Mn2BdTQkhwLuBc7RyIBvNxEmtO/qCLr+ZBw/FY01AYHLniaKaOY7AP9GLSs1A57Z/Ji+xV5x4yYqnSuGtTE9ZjhSs/+XFBZ39QU7zdfwW1x+kv3i/kQn38yrkDxI0hQgghdMqToN2+nTHdpVe6CeEOLZM4q9pygXyuyblEJirBq1hslzX1Mjn3QefXUVHiiHt4J+hLNIVMUy/gP7j9gF3LOo/aYVTYRsSd28L4Yu2b6RlTykcxaMte7egP0TWoTqLiJLvaae4S7YATXbLZkiqA2eonlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6koWl1EEaDK1bKXULodqi9HRV5gxBShr8+3W08htdeY=;
 b=WNEZczuXFkBXPTSFw5bVS2TDf5yYVvpZiPUG8E93soc3M6lq70YFdZZOfNVLgYxX+UzYz5zD2QjHd6QEBpq0It+xcKkfd8PCKmCbyKvKtekoDBFV6HYOR+lPpkDsFWRrWxa1ARRSWOyZTLnAtV7oDsSc8DTUSOnL3T3oJbzNOh54DnGnNxmSWLlqT85vl/TWPl+Ms0KQLQMK0kl6Im2hYmjhAnhcEmweYhXZsWf+6okpZdodEeGsZJf/mBHemYRqLrFxW9z3HM+qnbQWG0+IjqK1d7MviC0XM5Gkkhj9TN6gFiEPrXzcddjIqGMTSton7trMdwx5Z0tlhZDPbQHhkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6koWl1EEaDK1bKXULodqi9HRV5gxBShr8+3W08htdeY=;
 b=51UW1+8ccWMi1kD83MJonO2eDWcW+r/R+QZeylsLN9VkPvrh/FbIWPsqYjUKXzoOc0b7Wx4TEKwT2vggRW/2FAslrN6Iflipx/2yGfp/b9tcxdVpesI7TOkiQu9PSuw/5l00lLD9n+xYJigJT++S4KX1S3kbKaWCDQg5UXJ+znE=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 03/17] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH v3 03/17] xen/arm: implement node distance helpers for
 Arm
Thread-Index:
 AQHZc3rmCrt50C+BaEmmIgaK9uo9ea80IxGAgAFPzpCAABDqgIAC3lpQgAG3XoCAAACYQA==
Date: Mon, 24 Apr 2023 07:50:25 +0000
Message-ID:
 <AS8PR08MB79911870174FFEC9385FDDAA92679@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-4-Henry.Wang@arm.com>
 <ac54e04c-58b7-d0c9-2443-bb09258c8bc8@suse.com>
 <AS8PR08MB79912F294EDAC48F835FBB7A92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bdf33169-4e29-8c50-ff76-16d05df81a14@suse.com>
 <AS8PR08MB7991576C75D0D4482595E7E292669@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e06fc93f-293f-a873-c9b9-2d5c941168f9@suse.com>
In-Reply-To: <e06fc93f-293f-a873-c9b9-2d5c941168f9@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 80439627BB49324B9F6D7B7E8E7CF2C0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB7308:EE_|DBAEUR03FT020:EE_|DU0PR08MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 987ba83b-85f6-45c9-c3f6-08db44989803
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fjSDaOAGRp6mKgZYfxRgrKAEsrmEcDD+LBSDThl+SVtpRVh9aRFU8utB9uDBqgjN5E+LVjoJJkkznVzzYktDcp3jeDjtBqgwrnQItdVmaa8hw1l25E9qg/UZCpcE1KLgpabP6Pt6gnUgo6308O94fUYCB+eM56RfDCEF6tT+U/SQkT1K2Wax/daFATbiXIHmnW/BCwfH3c7DbDdOaXxJFw0zhC0UxfegoGxadTJVhT6YOOyqjwXVtwHtlFJmbsTGCHYL6E/YRwf48uKXjoz3JkdWA4f/mKQ4pmRtZ+RmxVwJC5W1zqqt3flO9UJ1GRESLu2RnKWSEtCtEHgYVSaHHpOjRu8/LOYVH5q31KNtI0nUefATNx1cQocfYgn7wW7peODPSO+cHtJMIwQuUhKgVqoPLHMOUv7/Q+oip5tme98EdPiUsvEzqhX0EucshtYzLnXfGrXJViDpgCibecaE3a/7rD4tuYavpKmxH5ANrNbn5wmM74vJl+DuDsP41nHZGjL1qZfoz2TFqPCfWyMxL1j4ZaeSvy32JxwthtEAqOnoYi3r0XU9YFXn//IyR2eqtRX6CMuQNgbKnB1XyGMzQIp0en6OaNgZdwRWsFkUO0aimx9lribWaOgC+YsfKDjo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(7696005)(71200400001)(55016003)(9686003)(6506007)(26005)(186003)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(8936002)(316002)(41300700001)(6916009)(4326008)(478600001)(5660300002)(52536014)(54906003)(38070700005)(38100700002)(122000001)(86362001)(33656002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7308
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91783264-d382-4b04-8e3b-08db44989062
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w4dBveEpy7mSFzXmn8DhhviFRYDsFXKM/bCAudGuTnPlTUh0lHSJnqn17TW6kMOdDTPdfy6m13OiPlaU21LN2y3F6iAkp/uhtCNZ0+ZCSBslRsbyYYZB3FPYZcV10egEXtJX8EYaUSrX3g3cCcKWPL8lbuLAv6/PCWqOFfgQev8VSWJRn5ThvMWWngB9iNqlw3mxCMzJfU6nV/wzBnx9I6V9JtRs+cvoXj1Cu5Dra/rZCG3P+Al+7JOUBSKKdSudqH+UNEFuZD5BM9W4R1PkO9AlNFdACvoG7srk9LiZWLhCbu+AbVZTQhBbCsIb5JPUQ5O2VgcSFPlZBQinWwAo66OY8n3miGbCvwOjl2gLHNp+mRb2wnAknGxwshAtye5cFm5vieIhIsx442u6bKxntsU9QHNYIISe3JPaUpjMeKXRNCoPMlS6fJ8tAMvCRt8tZj3Vn1q7iYp9yxX9/yf0I6Z6b0ahvMJDZnFdXKHeVx1A8Q65hzHLf6cIWT8gZaohmtIWMHtO/EG8zX/DCVanrszLgWvb5wufenIqovPJ69ZAmYk9QIhx0OZ5zuCN3ZA5eFb27ja94fG8HmM1cfagdrH2wi4LsbmEFfA3WgzSGxSUCv+mGIGIZA5rHNDVIS+vfIgQiB+Y5hJl/tso6QABhlN9N+2esKADWWmjdv2w0wg5u6hDkxFhEvrXCa67OJpzG6ymoIKgacuHz/6uEfekZw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(40470700004)(46966006)(36840700001)(8676002)(8936002)(6862004)(54906003)(40460700003)(478600001)(55016003)(4326008)(70206006)(70586007)(40480700001)(356005)(81166007)(316002)(41300700001)(82740400003)(2906002)(52536014)(5660300002)(86362001)(186003)(36860700001)(336012)(26005)(6506007)(9686003)(33656002)(7696005)(47076005)(83380400001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 07:50:37.9002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 987ba83b-85f6-45c9-c3f6-08db44989803
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7883

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMy8xN10g
eGVuL2FybTogaW1wbGVtZW50IG5vZGUgZGlzdGFuY2UgaGVscGVycyBmb3INCj4gQXJtDQo+IA0K
PiA+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uISBJIHRoaW5rIEkgbm93IHVuZGVyc3RhbmQg
OikgV291bGQgdGhpcyBkaWZmDQo+IGJlbG93DQo+ID4gbG9vayBnb29kIHRvIHlvdSB0aGVuPyBB
cHByZWNpYXRlIHlvdXIgcGF0aWVuY2UuDQo+IA0KPiBMb29rcyBsYXJnZWx5IG9rYXksIGJ1dCBw
b3NzaWJseSBvbmUgcGFydCBjYW4gbm93IGJlIG9taXR0ZWQgKHNlZSBiZWxvdykuDQo+IA0KPiA+
IHVuc2lnbmVkIGNoYXIgX19ub2RlX2Rpc3RhbmNlKG5vZGVpZF90IGZyb20sIG5vZGVpZF90IHRv
KQ0KPiA+ICB7DQo+ID4gLSAgICAvKiBXaGVuIE5VTUEgaXMgb2ZmLCBhbnkgZGlzdGFuY2Ugd2ls
bCBiZSB0cmVhdGVkIGFzIHJlbW90ZS4gKi8NCj4gPiArICAgIGlmICggZnJvbSA9PSB0byApDQo+
ID4gKyAgICAgICAgcmV0dXJuIE5VTUFfTE9DQUxfRElTVEFOQ0U7DQo+ID4gKw0KPiA+ICsgICAg
LyogV2hlbiBOVU1BIGlzIG9mZiwgYW55IGRpc3RhbmNlIHdpbGwgYmUgdHJlYXRlZCBhcyB1bnJl
YWNoYWJsZSAoMHhGRikuDQo+ICovDQo+IA0KPiBQbGVhc2UgYXZvaWQgbWVudGlvbmluZyB0aGUg
YWN0dWFsIHZhbHVlIG9mIDB4RkY6IFRoaXMgc2VydmVzIG5vIHJlYWwNCj4gcHVycG9zZSAoYWZh
aWN0KSBhbmQgaXMgbGlhYmxlIHRvIGdvIHN0YWxlIGF0IHNvbWUgcG9pbnQuDQoNCkdvb2QgcG9p
bnQsIEkgd2lsbCBkcm9wIHRoZSAweEZGLg0KDQo+IA0KPiA+ICAgICAgaWYgKCBudW1hX2Rpc2Fi
bGVkKCkgKQ0KPiA+IC0gICAgICAgIHJldHVybiBOVU1BX1JFTU9URV9ESVNUQU5DRTsNCj4gPiAr
ICAgICAgICByZXR1cm4gTlVNQV9OT19ESVNUQU5DRTsNCj4gDQo+IFdpdGggdGhlIGNvZGUgYmVs
b3cgdGhpcyBpcyBub3cgb25seSBhbiBvcHRpbWl6YXRpb24uIE1pZ2h0IGJlIHdvcnRoDQo+IHNh
eWluZyBzbyBpbiB0aGUgY29tbWVudCAoYXNzdW1pbmcgaGF2aW5nIHRoaXMgb3B0aW1pemF0aW9u
IGlzIGRlZW1lZA0KPiB3b3J0aCBpdCkuDQoNClNvdW5kcyBnb29kLCBpZiB5b3UgdGhpbmsgYmVs
b3cgY29tbWVudCBtYWtlcyBzZW5zZSB0byB5b3UsIEkgd2lsbCBhZGQ6DQoiV2hlbiBOVU1BIGlz
IGRpc2FibGVkLCB0aGUgbm9kZSBkaXN0YW5jZSBzaG91bGQgYWx3YXlzIGJlDQpOVU1BX05PX0RJ
U1RBTkNFLCBkaXJlY3RseSByZXR1cm4gaGVyZSBhcyBhbiBvcHRpbWl6YXRpb24uIg0KDQpLaW5k
IHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg0K


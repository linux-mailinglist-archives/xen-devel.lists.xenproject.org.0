Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3EB6E73C4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523187.813006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp22p-0004B5-OK; Wed, 19 Apr 2023 07:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523187.813006; Wed, 19 Apr 2023 07:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp22p-00048o-L4; Wed, 19 Apr 2023 07:15:59 +0000
Received: by outflank-mailman (input) for mailman id 523187;
 Wed, 19 Apr 2023 07:15:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+8i=AK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pp22o-00048g-C8
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:15:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0769f26a-de82-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 09:15:57 +0200 (CEST)
Received: from DUZPR01CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::11) by AS2PR08MB8746.eurprd08.prod.outlook.com
 (2603:10a6:20b:55e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 07:15:50 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::e6) by DUZPR01CA0032.outlook.office365.com
 (2603:10a6:10:468::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Wed, 19 Apr 2023 07:15:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 07:15:49 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Wed, 19 Apr 2023 07:15:49 +0000
Received: from a331d0faefe1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0C3E11AD-592C-4A4C-BDF4-F11910E74BE6.1; 
 Wed, 19 Apr 2023 07:15:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a331d0faefe1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 07:15:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PR3PR08MB5595.eurprd08.prod.outlook.com (2603:10a6:102:83::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 07:15:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 07:15:34 +0000
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
X-Inumbo-ID: 0769f26a-de82-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KK7PKWpjrjn0hXtChFEkJ3JAre4L3RVXSIAdZH3Vf4o=;
 b=GhmU3iWGHygi8IX6ZOGqfTLuT4BlCAouao93v+iBNLzLwwI92dNOnOMNYt/pR/4/60hsPI0HSoDheymOqb4QRcedosLc1UZjT1icRqCh0+gI9g83e7y3JXlI2YEcdNWcxbhYJvOFATU4tsRlGsbbC4J0jOvpkl5v9b8cf61np80=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c64387cdb22c641a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6nYrMOnhxs+l/g+ceDv9S1D1BvUq4HVsW4cTs41pj0vk6T/b6HoSw5Ydr2CzxD8lTfAwQeO0j5MJMuTmmQ59QcbD2EngKdccwh1X9PiirnhEe2wcPl5f+HLO8TxdT6Q9uK/5cX9oQA+FjCMQtIDnQwc9yaDqoNvlHxcZMI+qM1+HiBQSFjRkVsJkk5Tr9XXGOJkVBG5jpLiVRrKBtEI2p++AtL+aeFcgjnDkrdNsiyb8C60mO09Sko4Sz207JUQEnDzQBLAD/2g+v9fzsrNKTji8v8wAADspsw7GBeqwL5MNxrmBdw8jNQQ9iotHHoOz7RVxV7jppisr1Fg3XZK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KK7PKWpjrjn0hXtChFEkJ3JAre4L3RVXSIAdZH3Vf4o=;
 b=fLv3RQMcTz4sVwiSeBfr7LeLA3/CliN6I8xg4C7U5i8R1fC/cyRl3c5tH15i0F19St+EKRR9CbaZ6tl0O9xQs+0be8p5QXvrR2XRbbTADM6yIN0sovkIcPbPr3XX3FSSFSkJrK60TxeaTziIyJOo8s9A9jB/6sZ+QUqbeBbiOpTkR+68VCDhHMaQq5suCgs6JbJWUJxCED6zpJpc6QaXFR1Smp1lGWIJO57au4BYOx0VsS2ATgXldkmivHyYS9Qau5A7vMgV5A6pSLjwVhX9O/GnLwebxueZw19rUZ83hmOhdhF+cDCaiEWJGSmRD1nwR5eHP6P+s664zP6Z0zTxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KK7PKWpjrjn0hXtChFEkJ3JAre4L3RVXSIAdZH3Vf4o=;
 b=GhmU3iWGHygi8IX6ZOGqfTLuT4BlCAouao93v+iBNLzLwwI92dNOnOMNYt/pR/4/60hsPI0HSoDheymOqb4QRcedosLc1UZjT1icRqCh0+gI9g83e7y3JXlI2YEcdNWcxbhYJvOFATU4tsRlGsbbC4J0jOvpkl5v9b8cf61np80=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZbSQ+XccnxtxNG0WbEgpX88e2za8xDZ2AgAE1hQA=
Date: Wed, 19 Apr 2023 07:15:34 +0000
Message-ID: <F30CEF99-693A-4218-AC80-433A183DE866@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
In-Reply-To: <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PR3PR08MB5595:EE_|DBAEUR03FT007:EE_|AS2PR08MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: cca6dc1a-b5a4-4ad9-ba65-08db40a5e75c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +lWxgbOWVj4Vhq48BSZKYAgLaa1H+VPHq31zwpwzyleUmyHGEXifMcOIR80y0AzsAG/U7gX8XHO4COWOU97/iPiWJA80qRexPaOw+57PLlbyfNIOwlyvbJYU0r9BDMkX/i3UrBJ/rPl8g0IiO/ahuD5H5Ov6vxz3y20gASsUl0JpIJr1QdYduWVN1cBgKkdJhNhgZDTe6u9O6j8sN0RwCVyRXkCmk6d77DZQSOFO70r2bn1bC0ZvuWiuybBnnPp812CJmXWE4g5p8NvMdpz7BiLAak9sbyCf5tiqKaRDxdOTKb9ADr/wYq5D/E7lg+/Wvwh835lZZar5I3fAvtCSfaslALYNEbJ1t3NCzhEAjAxGYo8Gx8r1glmLQGt47KxT4X1EdyJbmPzLfdf/3KBjUf21YyAa96L8GuZRkl/fYh6RbtAKlQqoNEo/Dx+OFRLGGJ7Ixon05Ebmofe3WOhaB2i9YpLEOTK3VH8Ku0M/d93w7DxMj/QEwv70Bp8uE4+z6epe+j7IeztxIv1loyyFroUld5KTrbQu6yF3Qwr5Q9MKVgbKuo+NFJyB61aVAakox2/G2U1Ww1MbRwBBi4ZSZia4PrjeFtsDE8X0mKCFeUdKQMsVeE09/2uSMnMTsQ/Lniw8DKnaj7VNV0lrSVAgpA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(451199021)(71200400001)(66446008)(91956017)(66556008)(76116006)(64756008)(66476007)(478600001)(4326008)(37006003)(316002)(5660300002)(8676002)(66946007)(38100700002)(6636002)(41300700001)(122000001)(8936002)(54906003)(83380400001)(2616005)(6486002)(186003)(26005)(6506007)(6512007)(38070700005)(33656002)(2906002)(86362001)(36756003)(6862004)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E74389164BEEC4F9101B62E7F773D99@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5595
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48826e2e-24e4-44b6-2324-08db40a5de54
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qobSk0rW4NwGx3/Ne/n0dk8l+ixB7WgbEG4t05bdEaPMLBdzD1SAzzhkvneZ9/YALfViz94jVA1R96uW6Gk/3lijWNWtSaRsBBcDTDrsFRjJEHD7w+PDiKC/PAowxVvqklYo73JdfwpFDVOfzuXz6hE7fQFDUrxu43H5/9/44ndjXjVYgN6xTaz8zBXkJENDBOHb8qiTy7jV96abhT2/a13w9xOIJFO5Z/f3m2vfHg0ohoAAbju3ASfShyUXS8Frirkxlnr9AePgf4Crpee/gAnPXy+zDNaSuiCaMGpqevLa1VWwwNzrYE5PBngX14pFwpxYVgh+rJc4qtWgzrb/37wmPtX91AV3dhrva0MvwNhxGPaYdYA1ntI1kBAqEuqTvDas/QCD53zU0/BlTlHrOA/lzg5p9efJBfH7zBYPrlBzDBQZxhUe+bJQrLkxZs+x29CAJUzW9+PSgNQo7VmHf75h3IY6XS/SNgogit7W+lp9V5dH+Q4rMnbCASdAu7rEnqI1Rj0qIY/bBLnunX+LxcJ6vs+Dqw1AvkNS3/ZQjoGI3P0l8gFNT0JWmSwFfdfHy25PmTjOfbSCeAuv01zRq2uP/FOpgyFSkte3BsjvKpezyX6YpSDF8wlHlEXQr/OZSD/P4zlq30EvpeKIdklvtQA1B6yI8eqLkjrzI7ylyfI4SkEUHlNcodroD6JKCyVWijejpj/AqF8yKVg2oom0vA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(6486002)(36756003)(83380400001)(336012)(47076005)(356005)(107886003)(26005)(6512007)(6506007)(41300700001)(81166007)(70586007)(8676002)(70206006)(6862004)(8936002)(37006003)(54906003)(6636002)(2616005)(36860700001)(186003)(4326008)(316002)(82740400003)(5660300002)(2906002)(86362001)(82310400005)(33656002)(40460700003)(40480700001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:15:49.8452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca6dc1a-b5a4-4ad9-ba65-08db40a5e75c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8746

SGkgQmVydHJhbmQsDQoNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9z
dmUuYyBiL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KPj4gaW5kZXggNTQ4NTY0ODg1MGEwLi5h
ZDVkYjYyZTE4MDUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvc3ZlLmMNCj4+
ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KPj4gQEAgLTksNiArOSw5IEBADQo+PiAj
aW5jbHVkZSA8eGVuL3NpemVzLmg+DQo+PiAjaW5jbHVkZSA8YXNtL2FybTY0L3N2ZS5oPg0KPj4g
DQo+PiArLyogb3B0X2RvbTBfc3ZlOiBhbGxvdyBEb20wIHRvIHVzZSBTVkUgYW5kIHNldCBtYXhp
bXVtIHZlY3RvciBsZW5ndGguICovDQo+PiAraW50IF9faW5pdGRhdGEgb3B0X2RvbTBfc3ZlOw0K
Pj4gKw0KPj4gZXh0ZXJuIHVuc2lnbmVkIGludCBzdmVfZ2V0X2h3X3ZsKHZvaWQpOw0KPj4gZXh0
ZXJuIHZvaWQgc3ZlX3NhdmVfY3R4KHVpbnQ2NF90ICpzdmVfY3R4LCB1aW50NjRfdCAqcHJlZ3Ms
IGludCBzYXZlX2Zmcik7DQo+PiBleHRlcm4gdm9pZCBzdmVfbG9hZF9jdHgodWludDY0X3QgY29u
c3QgKnN2ZV9jdHgsIHVpbnQ2NF90IGNvbnN0ICpwcmVncywNCj4+IEBAIC0xMTgsMyArMTIxLDIx
IEBAIHZvaWQgc3ZlX3Jlc3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpDQo+PiANCj4+ICAgIHN2
ZV9sb2FkX2N0eChzdmVfY3R4X3pyZWdfZW5kLCB2LT5hcmNoLnZmcC5mcHJlZ3MsIDEpOw0KPj4g
fQ0KPj4gKw0KPj4gK2ludCBfX2luaXQgc3ZlX3Nhbml0aXplX3ZsX3BhcmFtKGludCB2YWwsIHVu
c2lnbmVkIGludCAqb3V0KQ0KPj4gK3sNCj4+ICsgICAgLyoNCj4+ICsgICAgICogTmVnYXRpdmUg
U1ZFIHBhcmFtZXRlciB2YWx1ZSBtZWFucyB0byB1c2UgdGhlIG1heGltdW0gc3VwcG9ydGVkDQo+
PiArICAgICAqIHZlY3RvciBsZW5ndGgsIG90aGVyd2lzZSBpZiBhIHBvc2l0aXZlIHZhbHVlIGlz
IHByb3ZpZGVkLCBjaGVjayBpZiB0aGUNCj4+ICsgICAgICogdmVjdG9yIGxlbmd0aCBpcyBhIG11
bHRpcGxlIG9mIDEyOCBhbmQgbm90IGJpZ2dlciB0aGFuIHRoZSBtYXhpbXVtIHZhbHVlDQo+PiAr
ICAgICAqIDIwNDgNCj4+ICsgICAgICovDQo+PiArICAgIGlmICggdmFsIDwgMCApDQo+PiArICAg
ICAgICAqb3V0ID0gZ2V0X3N5c192bF9sZW4oKTsNCj4+ICsgICAgZWxzZSBpZiAoICgodmFsICUg
U1ZFX1ZMX01VTFRJUExFX1ZBTCkgPT0gMCkgJiYgKHZhbCA8PSBTVkVfVkxfTUFYX0JJVFMpICkN
Cj4+ICsgICAgICAgICpvdXQgPSB2YWw7DQo+IA0KPiBTaG91bGRuJ3QgeW91IGFsc28gY2hlY2sg
aWYgaXQgaXMgbm90IGdyZWF0ZXIgdGhhbiB0aGUgbWF4aW11bSB2ZWN0b3IgbGVuZ3RoID8NCg0K
SSBkb27igJl0IHVuZGVyc3RhbmQsIEkgYW0gY2hlY2tpbmcgdGhhdCB0aGUgdmFsdWUgaXMgYmVs
b3cgb3IgZXF1YWwgdG8gU1ZFX1ZMX01BWF9CSVRTLA0KSWYgeW91IG1lYW4gaWYgaXQgc2hvdWxk
IGJlIGNoZWNrZWQgYWxzbyBhZ2FpbnN0IHRoZSBtYXhpbXVtIHN1cHBvcnRlZCBsZW5ndGggYnkg
dGhlIHBsYXRmb3JtLA0KSSB0aGluayB0aGlzIGlzIG5vdCB0aGUgcmlnaHQgcGxhY2UsIHRoZSBj
aGVjayBpcyBhbHJlYWR5IGluIGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZygpLCBpbnRyb2R1
Y2VkDQppbiBwYXRjaCAjMg0KDQo+IA0KPj4gKyAgICBlbHNlDQo+PiArICAgICAgICByZXR1cm4g
LTE7DQo+PiArDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+
IGluZGV4IGVlYjQ2NjJmMGVlZS4uM2YzMGVmNWMzN2I2IDEwMDY0NA0KPj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMNCj4+IEBAIC0yNiw2ICsyNiw3IEBADQo+PiAjaW5jbHVkZSA8YXNtL3BsYXRmb3JtLmg+DQo+
PiAjaW5jbHVkZSA8YXNtL3BzY2kuaD4NCj4+ICNpbmNsdWRlIDxhc20vc2V0dXAuaD4NCj4+ICsj
aW5jbHVkZSA8YXNtL2FybTY0L3N2ZS5oPg0KPj4gI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+
DQo+PiAjaW5jbHVkZSA8YXNtL2RvbWFpbl9idWlsZC5oPg0KPj4gI2luY2x1ZGUgPHhlbi9ldmVu
dC5oPg0KPj4gQEAgLTYxLDYgKzYyLDIxIEBAIGN1c3RvbV9wYXJhbSgiZG9tMF9tZW0iLCBwYXJz
ZV9kb20wX21lbSk7DQo+PiANCj4+IGludCBfX2luaXQgcGFyc2VfYXJjaF9kb20wX3BhcmFtKGNv
bnN0IGNoYXIgKnMsIGNvbnN0IGNoYXIgKmUpDQo+PiB7DQo+PiArICAgIGxvbmcgbG9uZyB2YWw7
DQo+PiArDQo+PiArICAgIGlmICggIXBhcnNlX3NpZ25lZF9pbnRlZ2VyKCJzdmUiLCBzLCBlLCAm
dmFsKSApDQo+PiArICAgIHsNCj4+ICsjaWZkZWYgQ09ORklHX0FSTTY0X1NWRQ0KPj4gKyAgICAg
ICAgaWYgKCAodmFsID49IElOVF9NSU4pICYmICh2YWwgPD0gSU5UX01BWCkgKQ0KPj4gKyAgICAg
ICAgICAgIG9wdF9kb20wX3N2ZSA9IHZhbDsNCj4+ICsgICAgICAgIGVsc2UNCj4+ICsgICAgICAg
ICAgICBwcmludGsoWEVOTE9HX0lORk8gIidzdmU9JWxsZCcgdmFsdWUgb3V0IG9mIHJhbmdlIVxu
IiwgdmFsKTsNCj4+ICsjZWxzZQ0KPj4gKyAgICAgICAgbm9fY29uZmlnX3BhcmFtKCJBUk02NF9T
VkUiLCAic3ZlIiwgcywgZSk7DQo+PiArI2VuZGlmDQo+IA0KPiBDb3JyZWN0IG1lIGlmIG15IHVu
ZGVyc3RhbmRpbmcgaXMgd3JvbmcgYnV0IGhlcmUgeW91IGp1c3QgaWdub3JlIHRoZSBzdmUNCj4g
cGFyYW1ldGVyIGlmIFNWRSBpcyBub3Qgc3VwcG9ydGVkIGJ5IFhlbiA/DQo+IA0KPiBJIGFtIGEg
Yml0IHdvbmRlcmluZyBpZiB3ZSBzaG91bGQgbm90IGp1c3QgcmVmdXNlIGl0IGhlcmUgYXMgdGhl
IHVzZXIgbWlnaHQNCj4gd3JvbmdseSB0aGluayB0aGF0IGhpcyBwYXJhbWV0ZXIgaGFkIHNvbWUg
ZWZmZWN0Lg0KPiANCj4gT3IgaXMgaXQgYSB1c3VhbCB3YXkgdG8gaGFuZGxlIHRoaXMgY2FzZSA/
DQoNCkphbiBzdWdnZXN0ZWQgdGhpcyBhcHByb2FjaCwgYXMgaXQgc2hvdWxkIGJlIHRoZSBwcmVm
ZXJyZWQgd2F5IHRvIGhhbmRsZSB0aGUgY2FzZSwNCmxvb2tpbmcgaW50byB0aGUgeDg2IGNvZGUg
aXQgc2VlbXMgc28uDQoNCg==


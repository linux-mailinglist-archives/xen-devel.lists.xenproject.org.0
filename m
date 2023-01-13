Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41376697BC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 13:54:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477283.739920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJZE-0004DG-Eb; Fri, 13 Jan 2023 12:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477283.739920; Fri, 13 Jan 2023 12:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJZE-00049q-BS; Fri, 13 Jan 2023 12:53:56 +0000
Received: by outflank-mailman (input) for mailman id 477283;
 Fri, 13 Jan 2023 12:53:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Kou=5K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pGJZD-00049k-CM
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 12:53:55 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2086.outbound.protection.outlook.com [40.107.103.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5481ee68-9341-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 13:53:52 +0100 (CET)
Received: from DB7PR02CA0016.eurprd02.prod.outlook.com (2603:10a6:10:52::29)
 by DU2PR08MB10105.eurprd08.prod.outlook.com (2603:10a6:10:46c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 12:53:50 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::b8) by DB7PR02CA0016.outlook.office365.com
 (2603:10a6:10:52::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Fri, 13 Jan 2023 12:53:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 12:53:49 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132");
 Fri, 13 Jan 2023 12:53:49 +0000
Received: from a4eb5f8d0530.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1D55CA4F-896E-4A48-BD0E-3B7EB780770B.1; 
 Fri, 13 Jan 2023 12:53:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4eb5f8d0530.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 12:53:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9607.eurprd08.prod.outlook.com (2603:10a6:10:449::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 12:53:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 12:53:36 +0000
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
X-Inumbo-ID: 5481ee68-9341-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOCzE38qMEN6kl5i4vxqfCt4TmImBh08mDzsr8cyH/k=;
 b=IfYC3nLuAVlEDnrh7hK0YD3z7J5UIuOKgi1Kr+BDzusr1/iRtlFtAfG4seN0+ELJAETvK27pi4tZEEXfL18cIsAk0MbOdZLCALdoFcBZ1SpecWgXl38J+WTetg/4j1GJRMci8clen+vdUIuwPwNvJi7PSH3cyDm+tnU9kcrpLH8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0104c1567a6cc9d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFo7mQSuazCVK+idQCXgQ4qg+ddui+Zlp1IrO6yuajIwByI2L/vLFy97Mzw1suN8zLJxjVsb6AlSviuuTkwosXJrE3XXU5B9oAs0GW/E27dJj0ZjLRNU+6oNM4PKM6osR7GnfkksNFR25vcuLpOtFg46JIqxMuR0HynWIDG/qjIgdd1xX/JAtYPRmceLsfEJXwkkiSjqVBjNJrUmDIkLbgheJlP04jbEqLb+0fTMoGZcLty0Len08Qt0GC4qNJEm/EQSMNZ45R/B4gVW9bPHOxP47i10CeUY1588F2x7/P5rcIzq/H4erbE0gQi0/qyY5qxGinuOJCcN5L69eE864g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOCzE38qMEN6kl5i4vxqfCt4TmImBh08mDzsr8cyH/k=;
 b=YABHPW+Fjyvd/quSlqlmEzS0SmSJ7rk5awh9Q80ATidxlncanAWQ2KyYRGuzq1exmVOI8FbHsCNdaFBKxRC3I2guZcd8S2zPBEzCKKJwD/Ba5o6kHVAxPemD8bj6fh+HppFEt84RpPk7IDimGpXHw9aRnwz/uLUyc8IruYfCKrvZQtyuuP4/+ughQ3kuLXRKhpAiiuQgZb9R6vof9oHvdgSW58jwIMZn3mcpSh2n8qdglxUz/FP9O3aHOZacH3oC4ccpIYZQhm1Qr3BT4t+tHTKVnbquPynLpKkGZSf2RANG5VswgX47zV6vEThgl+HU6bBpvkpOImv7l+ZZ39catw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOCzE38qMEN6kl5i4vxqfCt4TmImBh08mDzsr8cyH/k=;
 b=IfYC3nLuAVlEDnrh7hK0YD3z7J5UIuOKgi1Kr+BDzusr1/iRtlFtAfG4seN0+ELJAETvK27pi4tZEEXfL18cIsAk0MbOdZLCALdoFcBZ1SpecWgXl38J+WTetg/4j1GJRMci8clen+vdUIuwPwNvJi7PSH3cyDm+tnU9kcrpLH8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 1/8] xen/arm: enable SVE extension for Xen
Thread-Topic: [RFC PATCH 1/8] xen/arm: enable SVE extension for Xen
Thread-Index: AQHZJcp25sHFUmTjSUKVOX9zw5fwA66ZdWWAgAElHQCAAXLngIAAQw0A
Date: Fri, 13 Jan 2023 12:53:35 +0000
Message-ID: <3D8C1980-E88F-497D-AACE-06438743C83B@arm.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>
 <20230111143826.3224-2-luca.fancellu@arm.com>
 <e37e5564-e7b9-c9d2-1360-171c014649c7@xen.org>
 <85F9C725-816A-46EE-AD0C-2725AE13F14C@arm.com>
 <0d736370-5dd9-637d-c6d2-74dfb7e4209e@xen.org>
In-Reply-To: <0d736370-5dd9-637d-c6d2-74dfb7e4209e@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9607:EE_|DBAEUR03FT055:EE_|DU2PR08MB10105:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc9ea40-4e98-46cf-68e2-08daf565379c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NwdW2KzyVznFL+6UyLwAmc5RMT03N2Qw9RXazY+so+Jrq3uzLnVuM/gd8xBIIjtE1k40BilAgWiWLQnR7la+GJojMjiovgB3Lov3EdAXPeiUqxLJGJME9uCsMq6bkB9WULTq+GV6GLYgKpQUEoFf1fiWLl8rL+JmYPDj5N1fNNyGF/Z0H9+8/5smqXHcMWNGudtmPiSK9EbPmgYXpAWYtCijWHh96+fI0qUEibSbU6R9MVgJzdcqaPokYNdv5EVSG8vimwdQvx2AUFaDvTFZ+VhWINNGBWVy1/6kEkXs/Wq/+wPiBuSTsn4iC8FCV33oXB+3ID/IssI6fbSDwkochNHA/chTFvAj6T/OCuMPgQbVjkiXBCSkzRG2qzrw5CXA9pd53FxllSZxMC5sO2IY1qKT20r+/flvCei9qMx/TmK404+HIoBukZRHJJxXpZSXj3hFyPUAkcgnipIO0rLcBMJ7FTv/RS+dPAopPTmmkUDo6zVB9tlvmxZAYhxvPT5EaxcKfYLnA9S7Ku2rnBG+xPH+HlJu5tRgPc+CjxY7s8d51/MqSNPnsxSLBBg/tcgGfVA7wD8pYwn7ZXs++q2d8vSN4VB2LdHWQ18QgsNIedh5a1acUC7FR3rohVb+IZQi9bbpoITiORpmsMYet+sIF8ylIjSmlTGMckj22qOygijYOUpP2uvaVYenpk6GdTMI3zElwArIJ9PXY/FvRO0pVSG0//hZ+KuBxv4wdPyVVaA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199015)(38100700002)(66556008)(86362001)(122000001)(66476007)(38070700005)(66446008)(76116006)(4326008)(33656002)(6486002)(66946007)(2906002)(5660300002)(8676002)(8936002)(91956017)(53546011)(26005)(6512007)(186003)(6506007)(2616005)(64756008)(6916009)(54906003)(316002)(83380400001)(41300700001)(71200400001)(478600001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <795045D60640C34D9C546595BC8AB8B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9607
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54e391e9-1423-4595-32fc-08daf5652ee7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xL5os4dGa4YQ++eP5HVzj7/dVdFyRtjSyvBUwsCVZKC3Pky5xh2jepHXdF3agssKbZwj9v6jpbHHBkmW6Xag2lOio6rhpWnuQ/YlEqHE3nODs/EtqA5OlsCC9rhisAZyTkcr04P/ASUiY4I/1a5KQhFDPT/Dl+qEtw+N4FhmLklDcsld9Yi/mL7Y0B7B5u0nnS+gcMyyBtFTmJ+l/9Rn0X/glCdZHJCgPKiQFvQtu3M8XMbOv0d9d8nrTVtOC4vBxeNWEG6t0aHBkKZU0SK8jZT5UF1HTl5NtDkQdRKbM+07KWLuDvskud1M4pfEINJcS4ya7fVsFlus3cmRHQoFhIXcuE2u9AI7Kj7SJ3WcVQfhnt3+SokVvreCI8r92aifD35z0gOC+1Ub2GB68tgujdcxQu0VGb0+trzsjALS+ogyXUCrtcxPf20CtpGMAAZzWk8WkJfFZ12EinhTS065/NcMPBOAV9aFMt/5ehQhJrEORfJfdrLv0P2T/hHhyDf1I5kzQ6Qh8Vi2M/L+4qVUifz3IjuT/6rtNarncsMHrb4AGHk8IaQqulqZntQiDc9XeE6875GlQX0T+D8uzs6T8pXzjZnTX/nKEymGMMA4P54LJdRkOxvN8hdok33UojKZPTh/mxwQTAAjEBdG3EVUMabdd9v8TiahDo32Tyg0fOfwHEF9yWtDDdQdfALdIZN3sWbVVPZvR3Awm3wWpcH55A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(82740400003)(81166007)(356005)(36860700001)(70206006)(4326008)(70586007)(8676002)(54906003)(41300700001)(33656002)(86362001)(47076005)(8936002)(40480700001)(83380400001)(107886003)(5660300002)(316002)(2616005)(336012)(6512007)(2906002)(40460700003)(82310400005)(6486002)(53546011)(186003)(6506007)(26005)(478600001)(6862004)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 12:53:49.9845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc9ea40-4e98-46cf-68e2-08daf565379c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10105

DQoNCj4gT24gMTMgSmFuIDIwMjMsIGF0IDA4OjUzLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAxMi8wMS8yMDIzIDEwOjQ2LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDExIEphbiAyMDIzLCBhdCAxNzoxNiwgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgTHVjYSwNCj4+PiAN
Cj4+PiBBcyB0aGlzIGlzIGFuIFJGQywgSSB3aWxsIGJlIG1vc3RseSBtYWtpbmcgZ2VuZXJhbCBj
b21tZW50cy4NCj4+IEhpIEp1bGllbiwNCj4+IFRoYW5rIHlvdS4NCj4+PiANCj4+PiBPbiAxMS8w
MS8yMDIzIDE0OjM4LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+Pj4+IGluZGV4IDk5
NTc3YWRiNmM2OS4uOGVhMzg0M2VhOGU4IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
ZG9tYWluLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+Pj4+IEBAIC0xODEs
NiArMTgxLDggQEAgc3RhdGljIHZvaWQgY3R4dF9zd2l0Y2hfdG8oc3RydWN0IHZjcHUgKm4pDQo+
Pj4+ICAgICAgLyogVkdJQyAqLw0KPj4+PiAgICAgIGdpY19yZXN0b3JlX3N0YXRlKG4pOw0KPj4+
PiAgKyAgICBXUklURV9TWVNSRUcobi0+YXJjaC5jcHRyX2VsMiwgQ1BUUl9FTDIpOw0KPj4+IA0K
Pj4+IFNob3VsZG4ndCB0aGlzIG5lZWQgYW4gaXNiKCkgYWZ0ZXJ3YXJkcyBkbyBlbnN1cmUgdGhh
dCBhbnkgcHJldmlvdXNseSB0cmFwcGVkIHdpbGwgYmUgYWNjZXNzaWJsZT8NCj4+IFllcyB5b3Ug
YXJlIHJpZ2h0LCB3b3VsZCBpdCBiZSBvayBmb3IgeW91IGlmIEkgbW92ZSB0aGlzIGJlZm9yZSBn
aWNfcmVzdG9yZV9zdGF0ZSBiZWNhdXNlIGl0IGluc2lkZQ0KPj4gaGFzIGFuIGlzYigpPyBUaGlz
IHRvIGxpbWl0IHRoZSBpc2IoKSB1c2FnZS4gSSBjb3VsZCBwdXQgYWxzbyBhIGNvbW1lbnQgdG8g
ZG9u4oCZdCBmb3JnZXQgaXQuDQo+IA0KPiBJIHdvdWxkIHJhdGhlciBwcmVmZXIgaWYgd2UgZG9u
J3QgcmVseSBvbiBnaWNfcmVzdG9yZV9zdGF0ZSgpIHRvIGhhdmUgYW4gaXNiKCkgYmVjYXVzZSB0
aGlzIGNvdWxkIGNoYW5nZSBpbiB0aGUgZnV0dXJlIChhbHRob3VnaCB1bmxpa2VseSkuDQo+IA0K
PiBMb29raW5nIGF0IHRoZSBjb250ZXh0IHN3aXRjaCBjb2RlLCBJIHRoaW5rIHdlIGNhbiBtb3Zl
IHRoZSBjYWxsIHRvIHJlc3RvcmUgdGhlIGZsb2F0aW5nIHJlZ2lzdGVyIHRvd2FyZHMgdGhlIGVu
ZCBvZiB0aGUgaGVscGVyIGFuZCB1c2Ugb25lIG9mIHRoZSBleGlzdGluZyBpc2IoKSBmb3Igb3Vy
IHB1cnBvc2UuDQoNClNvdW5kcyBnb29kIHRvIG1lDQoNCj4gDQo+IA0KPj4+PiBAQCAtMTIyLDYg
KzEzNyw3IEBAIF9faW5pdGNhbGwodXBkYXRlX3NlcnJvcnNfY3B1X2NhcHMpOw0KPj4+PiAgICB2
b2lkIGluaXRfdHJhcHModm9pZCkNCj4+Pj4gIHsNCj4+Pj4gKyAgICByZWdpc3Rlcl90IGNwdHJf
Yml0cyA9IGdldF9kZWZhdWx0X2NwdHJfZmxhZ3MoKTsNCj4+Pj4gICAgICAvKg0KPj4+PiAgICAg
ICAqIFNldHVwIEh5cCB2ZWN0b3IgYmFzZS4gTm90ZSB0aGV5IG1pZ2h0IGdldCB1cGRhdGVkIHdp
dGggdGhlDQo+Pj4+ICAgICAgICogYnJhbmNoIHByZWRpY3RvciBoYXJkZW5pbmcuDQo+Pj4+IEBA
IC0xMzUsMTcgKzE1MSwxNSBAQCB2b2lkIGluaXRfdHJhcHModm9pZCkNCj4+Pj4gICAgICAvKiBU
cmFwIENQMTUgYzE1IHVzZWQgZm9yIGltcGxlbWVudGF0aW9uIGRlZmluZWQgcmVnaXN0ZXJzICov
DQo+Pj4+ICAgICAgV1JJVEVfU1lTUkVHKEhTVFJfVCgxNSksIEhTVFJfRUwyKTsNCj4+Pj4gIC0g
ICAgLyogVHJhcCBhbGwgY29wcm9jZXNzb3IgcmVnaXN0ZXJzICgwLTEzKSBleGNlcHQgY3AxMCBh
bmQNCj4+Pj4gLSAgICAgKiBjcDExIGZvciBWRlAuDQo+Pj4+IC0gICAgICoNCj4+Pj4gLSAgICAg
KiAvIVwgQWxsIGNvcHJvY2Vzc29ycyBleGNlcHQgY3AxMCBhbmQgY3AxMSBjYW5ub3QgYmUgdXNl
ZCBpbiBYZW4uDQo+Pj4+IC0gICAgICoNCj4+Pj4gLSAgICAgKiBPbiBBUk02NCB0aGUgVENQeCBi
aXRzIHdoaWNoIHdlIHNldCBoZXJlICgwLi45LDEyLDEzKSBhcmUgYWxsDQo+Pj4+IC0gICAgICog
UkVTMSwgaS5lLiB0aGV5IHdvdWxkIHRyYXAgd2hldGhlciB3ZSBkaWQgdGhpcyB3cml0ZSBvciBu
b3QuDQo+Pj4+ICsjaWZkZWYgQ09ORklHX0FSTTY0X1NWRQ0KPj4+PiArICAgIC8qDQo+Pj4+ICsg
ICAgICogRG9uJ3QgdHJhcCBTVkUgbm93LCBYZW4gbWlnaHQgbmVlZCB0byBhY2Nlc3MgWkNSIHJl
ZyBpbiBjcHVmZWF0dXJlIGNvZGUsDQo+Pj4+ICsgICAgICogdHJhcHBpbmcgYWdhaW4gb3Igbm90
IHdpbGwgYmUgaGFuZGxlZCBvbiB2Y3B1IGNyZWF0aW9uL3NjaGVkdWxpbmcgbGF0ZXINCj4+Pj4g
ICAgICAgKi8NCj4+PiANCj4+PiBJbnN0ZWFkIG9mIGVuYWJsZSBieSBkZWZhdWx0IGF0IGJvb3Qs
IGNhbiB3ZSB0cnkgdG8gZW5hYmxlL2Rpc2FibGUgb25seSB3aGVuIHRoaXMgaXMgc3RyaWN0bHkg
bmVlZGVkPw0KPj4gWWVzIHdlIGNvdWxkIHVuLXRyYXAgaW5zaWRlIGNvbXB1dGVfbWF4X3pjcigp
IGp1c3QgYmVmb3JlIGFjY2Vzc2luZyBTVkUgcmVzb3VyY2VzIGFuZCB0cmFwIGl0DQo+PiBhZ2Fp
biB3aGVuIGZpbmlzaGVkLiBXb3VsZCBpdCBiZSBvayBmb3IgeW91IHRoaXMgYXBwcm9hY2g/DQo+
IA0KPiBZZXMuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg0K


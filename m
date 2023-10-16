Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9287CAB26
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617650.960447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOLy-0007qN-Cz; Mon, 16 Oct 2023 14:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617650.960447; Mon, 16 Oct 2023 14:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOLy-0007nl-9s; Mon, 16 Oct 2023 14:13:54 +0000
Received: by outflank-mailman (input) for mailman id 617650;
 Mon, 16 Oct 2023 14:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fsKw=F6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qsOLw-0007nf-RE
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:13:53 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a4ca34f-6c2e-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:13:50 +0200 (CEST)
Received: from AS9PR06CA0231.eurprd06.prod.outlook.com (2603:10a6:20b:45e::28)
 by GV1PR08MB10456.eurprd08.prod.outlook.com (2603:10a6:150:16d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 14:13:46 +0000
Received: from AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::7a) by AS9PR06CA0231.outlook.office365.com
 (2603:10a6:20b:45e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 14:13:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT007.mail.protection.outlook.com (100.127.140.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Mon, 16 Oct 2023 14:13:46 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Mon, 16 Oct 2023 14:13:46 +0000
Received: from d8f9c42fc00b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F85D592C-4B32-466D-BADB-A3BA728818C0.1; 
 Mon, 16 Oct 2023 14:13:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8f9c42fc00b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 14:13:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB6036.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 14:13:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:13:30 +0000
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
X-Inumbo-ID: 3a4ca34f-6c2e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l2iLTh1w+3tqfm+dfdNDd84vd/fBqCZF7spkLjYXao=;
 b=ygRKnhJNGuHgj8XTmbPGH3MKWrw3om7BpFbNFSIJp6pprK6AFZALtE9UyIqA6H0Ebmli75H1tiJ4s2mFRKGW/LMV1X5C9ygcYpXYuVWYGey+WlKsO0DVmUA7WPrT+RB3F82fPk33uug/j0m7Z9W0NyTnGJfn61/ALZt+KA+j+3k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 33ac3e5aee9c0f7f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItORtWpcUnCys1psKUKmALkxRKWkUIhK9fNu7vGiqIWDC7izc+SY9QobpG2bl6ym6fAK7VkVP3dajvJkFEj5KfzDqCvuqHU2gzbJ3irQ/Iv3AuuThIRMT2yTKLC6qbW/ENDQYcA4UDw46rdjERAiCjwFWVxdzlLh6rH3ZZNXaG25bhN4z7+HbX60vMA04uSOreqWNNcFMLrzh9kAQFFrtOZgDtZKs979q5B+K2ac503Hih6iR9t4N7Js+nfto1+kcwLHnEr3SVDcdZOJHvo2DBf4HCQy46R5ZHTudfzyLsNPfLGQ73RmVwiAzU3kvyJEdgGIWnV+aQjvXzn/LSDgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0l2iLTh1w+3tqfm+dfdNDd84vd/fBqCZF7spkLjYXao=;
 b=TQxZ75Rdu2fyS3huK0mtDxBbO5sRqzRvQSz4AY2EYiOpo9IwqUpWbB7TcUv0I+oJ6+CKA+2WtfWgacieQEH/V8bUDm5OYavJJ9loQp6sADN5cbgBMX0in3sZ+Gh4hx8Y+RFfl22Ti91g478B6K+xA6LrYkeOUVYZZgBVrEjymCzF8lXlCR/8SykhmLdWFEy/5QMEmKduDU0xqF1M4pjNlQrMpfSJHe5/Q5toj4c69dGA13NuWnoY1zQ9svDXMkP/iY02yRkzPk+HCHsn7avKka86IQPQ+j5G0BU8OjTFYpr14k+NJIjuOctlzZbQvMc7pjoRTOguxc7lf2n5Pp4AVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l2iLTh1w+3tqfm+dfdNDd84vd/fBqCZF7spkLjYXao=;
 b=ygRKnhJNGuHgj8XTmbPGH3MKWrw3om7BpFbNFSIJp6pprK6AFZALtE9UyIqA6H0Ebmli75H1tiJ4s2mFRKGW/LMV1X5C9ygcYpXYuVWYGey+WlKsO0DVmUA7WPrT+RB3F82fPk33uug/j0m7Z9W0NyTnGJfn61/ALZt+KA+j+3k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	"leo.yan@linaro.org" <leo.yan@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Topic: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Index: AQHaADhLetLGz4GvX0qAhZnpE9HtkrBMcc4AgAADlIA=
Date: Mon, 16 Oct 2023 14:13:30 +0000
Message-ID: <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
 <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
 <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
In-Reply-To: <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB6036:EE_|AM7EUR03FT007:EE_|GV1PR08MB10456:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d900f8-dc7f-4a01-2038-08dbce521c7d
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3NSVavmVypJWOAQ1zL3Cy12VR2t9fl3lABYrGa9wjNf2RymVsM04POpJpYLQwAbv3eZNeFPiDAnZMUW6AAKkp7pVnpRqx/gXtYm1LcQ5Rmn5SS5JDQPRyWl4etVxnFSIxF8u1BLeRf5g485jTshZBdkem666trK5CzxxUChyvtJosM/fHZuImk1MZt/+dzWjGHMRBNo7vOaYdK6z7pV//yAzQz97pKfDFYO4caV9dz/pFQJWfimRB4LbOL+Rx0eEu1JPXdFjad3ubuL0VKMKFSqH/nCtlC8aAVhyc39/wP7XdSUllRoUr0n4v4dTK+vFydZYRpZ6NfPb/AgfelluArsKLOntMvyanSKNyynyP+h259DpamFxleuJ56vBApRUSz5sAW7dPBlZ0YzWWEd7PNnWLRiUIo9Bm2TZiXEcu4iNsnjNNc52dBsRutSMwwPx/MOqE42q739HXFSGomNVgjuc1I2qrM5KUhQ/6ET8Vbk3t8FQgZtHIU3nIUH6i8EbOW4Qhgirr+b+63bH8f8W/D5h2Vt0+GCGtGNKfE+TErpLxEsS6zgQZfBse6eqxFo7JWGNtk5JItaKoaMNlqugEIPnC1bbpno/U83aI6zSL7C3244QZ1cfNrPmjhvxA4K59/AE5aupruYBLAE8lLefQi3JJPpcN7iQq08rbxmwMhU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(2616005)(38070700005)(8676002)(8936002)(6862004)(4326008)(71200400001)(5660300002)(38100700002)(33656002)(83380400001)(122000001)(41300700001)(478600001)(86362001)(6486002)(2906002)(316002)(6636002)(6506007)(6512007)(53546011)(66946007)(36756003)(66556008)(66476007)(66446008)(54906003)(64756008)(91956017)(76116006)(37006003)(147533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <12128A192FEBF34F8AF3FAF8C025CE07@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6036
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53d7ca0e-6eb3-4087-4543-08dbce5212cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QA34en3oZX1XItOR1046IViSWzUkYO+dwGJxnDVOXDklvkY/MeKV2I356o91s5xQE7qMQIDEtWeIeuBZGewqxSoP9Lob83W4iRoLCgh3hFyBRvK3i1ZwzbLRZsMqROol7eip/MRAi6B0G4I2oFhEAp2oV+Udr9oEuDvVMYjv3fG3IX2XKq15zTq6sOCDXZ8/1YL71kQWyz1lOAzkLk3m9HJExt/vb3DAohNxZkuWDbZYAWbDqoI8whzUMN4xALglJowBc+FwLK1/hfJwkc95yr/ozNikCIfc3v+1UPEDFMvOZT/m48U0SJPMQiHnTS2fhMKGpSSpu7Z/1wE/7CaynNCAiX8WDo5DDWkTOjyHVueTJ8RMxhPG7zJIDr4Ujn8cCsjsISJC5+Ot2XU+50bqPGlDH/UtoCg7hXfLk/OREn3agjn16EhccyAzVbCIKBFslYr/mpA6xTquqBMJ8zA0eXGjAsVwS9fEf/X2/bRYJGc/qW6UR6loypMkePkTm1nit07iRYtWemh6N7yvBXFgtMWmUcjjg3pcgG/+rYeM4L3x64T7c/6cRkt5fE4f8h2KPybO7OnahT0XnLxhUlnoau7ezT+fxhgYIgSYfKqdr3ALdZTFDuUOAa+Xeg5XLuGtNE7x1ZvfEx5EYdWKYtLu5FTjnUeVHOjUvt5NpVIIvpBx2aWNFqC+wmhIT4u+HTqjpr+cxJ8A8JcFXtmU2UbKKOgGwEujLjhzJom9ItWYS+k=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(36840700001)(46966006)(6506007)(81166007)(26005)(356005)(2616005)(82740400003)(47076005)(6636002)(37006003)(316002)(70586007)(70206006)(54906003)(53546011)(478600001)(336012)(6486002)(83380400001)(6512007)(36860700001)(8676002)(4326008)(8936002)(6862004)(5660300002)(41300700001)(2906002)(33656002)(40480700001)(36756003)(86362001)(147533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:13:46.3034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d900f8-dc7f-4a01-2038-08dbce521c7d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10456

DQoNCj4gT24gMTYgT2N0IDIwMjMsIGF0IDE1OjAwLCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkNCj4gDQo+ICtMdWNhIGFuZCBSYWh1
bA0KPiANCj4+IE9uIDE2IE9jdCAyMDIzLCBhdCAxNTo1NCwgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4gd3JvdGU6DQo+PiANCj4+IA0KPj4gDQo+PiBPbiAxNi8xMC8yMDIzIDA5OjQ0LCBN
aWNoYWwgT3J6ZWwgd3JvdGU6DQo+Pj4gSGksDQo+PiANCj4+IEhpLA0KPj4gDQo+Pj4gT24gMTMv
MTAvMjAyMyAxNDoyNiwgTGVvIFlhbiB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiBPbiBBRExp
bmsgQVZBIHBsYXRmb3JtIChBbXBlcmUgQWx0cmEgU29DIHdpdGggMzIgQXJtIE5lb3ZlcnNlIE4x
IGNvcmVzKSwNCj4+Pj4gdGhlIHBoeXNpY2FsIG1lbW9yeSByZWdpb25zIGFyZToNCj4+Pj4gDQo+
Pj4+ICBEUkFNIG1lbW9yeSByZWdpb25zOg0KPj4+PiAgICBOb2RlWzBdIFJlZ2lvblswXTogMHgw
MDAwODAwMDAwMDAgLSAweDAwMDBmZmZmZmZmZg0KPj4+PiAgICBOb2RlWzBdIFJlZ2lvblsxXTog
MHgwODAwMDAwMDAwMDAgLSAweDA4MDA3ZmZmZmZmZg0KPj4+PiAgICBOb2RlWzBdIFJlZ2lvblsy
XTogMHgwODAxMDAwMDAwMDAgLSAweDA4MDdmZmZmZmZmZg0KPj4+PiANCj4+Pj4gVGhlIFVFRkkg
bG9hZHMgWGVuIGh5cGVydmlzb3IgYW5kIERUQiBpbnRvIHRoZSBoaWdoIG1lbW9yeSwgdGhlIGtl
cm5lbA0KPj4+PiBhbmQgcmFtZGlzayBpbWFnZXMgYXJlIGxvYWRlZCBpbnRvIHRoZSBsb3cgbWVt
b3J5IHNwYWNlOg0KPj4+PiANCj4+Pj4gIChYRU4pIE1PRFVMRVswXTogMDAwMDA4MDdmNmRmMDAw
MCAtIDAwMDAwODA3ZjZmM2UwMDAgWGVuDQo+Pj4+ICAoWEVOKSBNT0RVTEVbMV06IDAwMDAwODA3
ZjgwNTQwMDAgLSAwMDAwMDgwN2Y4MDU2MDAwIERldmljZSBUcmVlDQo+Pj4+ICAoWEVOKSBNT0RV
TEVbMl06IDAwMDAwMDAwZmE4MzQwMDAgLSAwMDAwMDAwMGZjNWRlMWQ1IFJhbWRpc2sNCj4+Pj4g
IChYRU4pIE1PRFVMRVszXTogMDAwMDAwMDBmYzVkZjAwMCAtIDAwMDAwMDAwZmZiM2Y4MTAgS2Vy
bmVsDQo+Pj4+IA0KPj4+PiBJbiB0aGlzIGNhc2UsIHRoZSBYZW4gYmluYXJ5IGlzIGxvYWRlZCBh
Ym92ZSA4VEIsIHdoaWNoIGV4Y2VlZHMgdGhlDQo+Pj4+IG1heGltdW0gc3VwcG9ydGVkIGlkZW50
aXR5IG1hcCBzcGFjZSBvZiAyVEIgaW4gWGVuLiBDb25zZXF1ZW50bHksIHRoZQ0KPj4+PiBzeXN0
ZW0gZmFpbHMgdG8gYm9vdC4NCj4+Pj4gDQo+Pj4+IFRoaXMgcGF0Y2ggZW5sYXJnZXMgaWRlbnRp
dHkgbWFwIHNwYWNlIHRvIDEwVEIsIGFsbG93aW5nIG1vZHVsZSBsb2FkaW5nDQo+Pj4+IHdpdGhp
biB0aGUgcmFuZ2Ugb2YgWzB4MCAuLiAweDAwMDAwOWZmX2ZmZmZfZmZmZl0uDQo+Pj4+IA0KPj4+
PiBGaXhlczogMWM3OGQ3NmI2NyAoInhlbi9hcm02NDogbW06IEludHJvZHVjZSBoZWxwZXJzIHRv
IHByZXBhcmUvZW5hYmxlL2Rpc2FibGUiKQ0KPj4+IEkgZG9uJ3QgdGhpbmsgYSBmaXhlcyB0YWcg
YXBwbGllcyBoZXJlIGdpdmVuIHRoYXQgMlRCIHdhcyBqdXN0IGEgbnVtYmVyIHdlIGJlbGlldmVk
IGlzIGVub3VnaA0KPj4+IGFuZCBhbGwgb2YgdGhpcyBpcyBwbGF0Zm9ybSBkZXBlbmRlbnQuDQo+
Pj4gVGhpcyBjYW4gYmUgZHJvcHBlZCBvbiBjb21taXQgaWYgY29tbWl0dGVyIGFncmVlcw0KPj4g
WGVuIG1heSBoYXZlIGJvb3RlZCBvbiB0aGF0IHBsYXRmb3JtIGJlZm9yZSBoYW5kLiBTbyB0aGlz
IHdvdWxkIGJlIGNvbnNpZGVyZWQgYSByZWdyZXNzaW9uIGFuZCB0aGVyZWZvcmUgYSB0YWcgd291
bGQgYmUgd2FycmFudC4NCj4+IA0KPj4gQUZBSUNULCB0aGUgY29tbWl0IGlzIG9ubHkgcHJlc2Vu
dCBvbiB0aGUgdXBjb21pbmcgNC4xOC4gU28gdGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgWGVuIDQu
MTcgYm9vdGVkIG91dC1vZi10aGUtYm94IG9uIEFETGluaz8gSWYgdGhlIGFuc3dlciBpcyB5ZXMs
IHRoZW4gd2UgbmVlZCB0byBhZGQgYSBGaXhlcyB0YWcuIEJ1dCB0aGUgY29ycmVjdCBvbmUgd291
bGQgYmUNCj4+IA0KPiANCj4gQFJhaHVsIG9yIEx1Y2E6IGNvdWxkIHlvdSBnaXZlIGFuIGFuc3dl
ciBoZXJlID8NCj4gSSBrbm93IHlvdSB1c2VkIFhlbiBvbiBhbiBBVkEgcGxhdGZvcm0gYnV0IHdh
cyBpdCBib290aW5nIG91dCBvZiB0aGUgYm94ID8NCg0KSSBjYW7igJl0IHNheSBmb3IgWGVuIDQu
MTcsIGJ1dCBvdXIgbmlnaHRseSBqb2IgaGFzIHJ1biBzdWNjZXNzZnVsbHkgb24gQVZBIGZvciB0
aGUgY29tbWl0IDczMDQwNmFiODEwOTQxMTVkOWZiNWNhMDBiYThkNTNjZWMxMjc5YjMNCihkb2Nz
L21pc3JhOiBhZGQgZGV2aWF0aW9ucy5yc3QgdG8gZG9jdW1lbnQgYWRkaXRpb25hbCBkZXZpYXRp
b25zLikNCg0KV2UgYXJlIG5vdCBhcHBseWluZyBhbnkgcGF0Y2ggZm9yIGl0IHRvIHJ1biBvbiBB
VkEuDQoNCj4gDQo+PiDvu78xYzc4ZDc2YjY3ZTEgKCJ4ZW4vYXJtNjQ6IG1tOiBJbnRyb2R1Y2Ug
aGVscGVycyB0byBwcmVwYXJlL2VuYWJsZS9kaXNhYmxlIHRoZSBpZGVudGl0eSBtYXBwaW5nIiku
DQo+PiANCj4+IFdlIHdvdWxkIGFsc28gbmVlZCB0byBjb25zaWRlciBpdCBhcyBhIGNhbmRpZGF0
ZSBmb3IgWGVuIDQuMTggYmVjYXVzZSB3ZSB3b3VsZCByZWdyZXNzIGJvb3Qgb24gQURMaW5rLg0K
PiANCj4gQWNrDQo+IA0KPiBDaGVlcnMNCj4gQmVydHJhbmQNCj4gDQo+PiANCj4+IENoZWVycywN
Cj4+IA0KPj4gLS0NCj4+IEp1bGllbiBHcmFsbA0KPiANCj4gDQoNCg==


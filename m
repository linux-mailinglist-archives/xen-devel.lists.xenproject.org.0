Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C44D62791F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 10:38:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443213.697746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouVuo-0004Ph-DJ; Mon, 14 Nov 2022 09:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443213.697746; Mon, 14 Nov 2022 09:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouVuo-0004Nv-A8; Mon, 14 Nov 2022 09:38:06 +0000
Received: by outflank-mailman (input) for mailman id 443213;
 Mon, 14 Nov 2022 09:38:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CFvb=3O=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouVum-0004Np-SR
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 09:38:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2081.outbound.protection.outlook.com [40.107.105.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 090cfff9-6400-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 10:38:03 +0100 (CET)
Received: from DU2PR04CA0086.eurprd04.prod.outlook.com (2603:10a6:10:232::31)
 by DB9PR08MB8481.eurprd08.prod.outlook.com (2603:10a6:10:3d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.5; Mon, 14 Nov
 2022 09:37:54 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::32) by DU2PR04CA0086.outlook.office365.com
 (2603:10a6:10:232::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Mon, 14 Nov 2022 09:37:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 09:37:53 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Mon, 14 Nov 2022 09:37:53 +0000
Received: from 042fae081247.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E4481CE-9ADC-496A-B011-E57F20568F5C.1; 
 Mon, 14 Nov 2022 09:37:48 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 042fae081247.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 09:37:48 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB7417.eurprd08.prod.outlook.com (2603:10a6:102:2bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.5; Mon, 14 Nov
 2022 09:37:46 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5834.005; Mon, 14 Nov 2022
 09:37:46 +0000
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
X-Inumbo-ID: 090cfff9-6400-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZfr/uLkzzsAP79kZA9Nbzxa2g/WxRWrkxKEHa4UFJw=;
 b=yu2qFOjIZrYJ6mZr/pP5BnMzIh7OVyOEY0o5+prQbuyhRMNzeeRSb/Z3cAQiwxpcS9I9LKxLDPRwJXi/Ae7jxDZJfzkQ5KfctBNTew7UL8DQ2Cfyr5/oG9xVxMtw+vhBTHgLsyjeZcAnMyfdc9U3FI+08W5EJ1VPbM2dbWyIDrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIwD91ukMja7CFH5b2tmGsogoGxaUI6zVruh3/P85k5LGTAu0uycPDuWO6KvE2p0GW56fPi1ZFm5xj9QEmS9cySjrjWxLKZ8AgRYAhu8VF/FyAFaj2EGLj0TW4D+Vt2YAjRE7E8wplKlfEmhtlbHcNhc76Em31x8XTsZGAlWArzBEXf95/Va80c3MzJwMk4ya6hAtinweCbqzvH7dPW9QmV0SUs2BJk4FlhxNUOSI/KMVCjptOJAQxCRM4SOnHNGvd6DHX3cTLq+VLxIxQCKQ/ERdun8eTyzoqP69lhS34bOt8h/1iEH/Bjl3LfC67uAteJLMAhZrS3Fo/NME4DTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZfr/uLkzzsAP79kZA9Nbzxa2g/WxRWrkxKEHa4UFJw=;
 b=MNcAGYpj5pNvCqyGgev9mniU1fY93OdF2KICH7JeAxsK0G/BlDB2Ri5IloOQ5/kN3wIulW25wDDR0l9xqUfky7hvPIh9ss/BIqUXxzx2Qlrm5niC82br8fxh5vl5dVHR2i9HtGZC+mNPnKfspJFt3xcQID8PXQ5MexLXAOwPvX3mPVm1wUnlWl8GTuycy+QMRGftuzvXsQb4avStLCbBKIlyI/ueCCc81gCbcbeGVZsSitrwy4BEvISerGSNJlrbXe3KlZilZtcHSI3a6sKD6JdWLw6ZCvra9j7XwhZc5IKZe0aoXH6BPcD1oiqYtz1vLId3cthQk3W6UoTrLtEuRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZfr/uLkzzsAP79kZA9Nbzxa2g/WxRWrkxKEHa4UFJw=;
 b=yu2qFOjIZrYJ6mZr/pP5BnMzIh7OVyOEY0o5+prQbuyhRMNzeeRSb/Z3cAQiwxpcS9I9LKxLDPRwJXi/Ae7jxDZJfzkQ5KfctBNTew7UL8DQ2Cfyr5/oG9xVxMtw+vhBTHgLsyjeZcAnMyfdc9U3FI+08W5EJ1VPbM2dbWyIDrA=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Thread-Topic: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Thread-Index:
 AQHY9/NBdTAzy3F6U0ar/3rX7ynbh64+D8cAgAABF9CAAAPhgIAAADOQgAASJwCAAAESkA==
Date: Mon, 14 Nov 2022 09:37:46 +0000
Message-ID:
 <PAXPR08MB7420A563C58E6EEBCC12932E9E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221114063451.473711-1-wei.chen@arm.com>
 <3aa067b2-fa49-326a-c5a0-6735bc95951e@suse.com>
 <PAXPR08MB74209231BFD7E8C3004C55A49E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <2beb3d17-99f6-77fe-a5d6-d60e665f01d5@suse.com>
 <PAXPR08MB74205604C48B1D2CBB7A135B9E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <73becaf7-8c94-1261-f504-865cc0425c79@suse.com>
In-Reply-To: <73becaf7-8c94-1261-f504-865cc0425c79@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2B8ADBDB78608C43B21F36703A4DBE7E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|PAXPR08MB7417:EE_|DBAEUR03FT059:EE_|DB9PR08MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: c8638516-3622-4e4e-3826-08dac623e79d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bctTCFcdYILFvZO5bKlX2//whv6cEo+GrT4YQj3UaTjGVINQqbyBrdWulNVV+jzj6XTF1CbUE+eMGBmdaDJlfHUrY7b/MfOjKU/OTRBfxfjsKrFa5f9El/t8qyyoom9UBT+6u4fW8HlfY42kPpxISaF6tfnuN5HQCrJ/4xDGuVkesWHOlq1kwCTHT5ZztrVP2yJuWDjB0jRbcyQci8PUOJeYqsnQaWtO7DcS+s3UGD3oUlzNB1YfiFHTQEAlUmPQ+/ZEu/lgj6GsPAH+lfngeEQJDA/RF994zBuTIsnWQ5PSYQPrRo8pXcktHs5QdePh9Bpyl9oarqzh82GGqrqYnWuy52rilHMxIgu7YPysUqmYNBQv80FWhNMlabe0rrISQeVXLFgwDrVhhRr4nKsT25nCs25cJSQmk1rdCPwsU3fOIa1DRSjJUJ7yW2dgvkHTN9UPXBKASwfAGiYNfniZGp8IJ/L/ufV+26p9ujQk8bExZHgtXdp8I57/ma2HBZvp+oGb/N3RndCS9F2GDrqiI3kSonaOipzbB0oQDOlQX9bwbbIdn6tGkUMegGOuI36MdDqGkBA2QMWIClVgsO4x02hFwK7O3YuTw7zyYUQ+8ahgmECJxJfXfwuMQxcReAoa+az1xodX1UPZxniaGRSKgaqiKrARFrsGxPfhwgYgqIt638Z322xKuvptJDvHxXkqce/tEldD8m/+DxOgaILa4yhNfhllcMIIN28ydGfPKdyOpYovXZl/6Q6N0Cod2INRGRbNi4fTgFeLd1+sDqqnlsKmQafyobovIBcksygahBoi93AAIXodbHSM6hANp3zZzVoq9EGr4dK8HC4pqt25GA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(8676002)(33656002)(38100700002)(122000001)(2906002)(38070700005)(41300700001)(83380400001)(54906003)(64756008)(86362001)(6916009)(76116006)(66946007)(4326008)(186003)(71200400001)(478600001)(966005)(8936002)(5660300002)(316002)(52536014)(55016003)(6506007)(66446008)(7696005)(53546011)(66476007)(66556008)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7417
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd3cdbb9-503d-4675-e398-08dac623e32f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6sisnrd2CeAONmL8wDXBCbxUevpFK0mU2W1FgHP89W4rq/jq83unySUEoRjeW5Dlde6IAezMw4F0Z352h4KN05y+b6kVDpqJgxMofw4XH/qVK3V1xBMyd2DwzOjz07hCL1XehyIaQBWCc3pHR6EuCjjVJIiNtiApQ5wRv7wWOvHYKzHnax25Q86bcSui/7TIghVbNoCKixQ15hk27HAyTJcW4CH3CFFxzAFhe5PfeilLj88Y/jlDI30TeHmD6jEVnU+9VwGDQzjayNwukqKk9XhAUWFSUJPZNzlXi7weq5LixzyUrDAWo5XO/mj+gz96+pbPy+Am46JgioJAgDIO9rMVOPkfzT6tY48Q/zqrUnCnuIRJalv73etI6oBCVCiFG+VEK+ZNZGlH9YdZEBqR1xcTH0DnKU57/WExZ6xRFEpjJtTjdVbzpw/OyvaGgmGU0kU/gqMuoMRFTsOq42EQmMmVmz9j/raRJ54pMH+skJ9Nw25fCxrBRIW6SbuesWCK8O1NriFfHfdcssisztkmaNzPZpaqbEa2peRIGyeQs6FL3QD38w+w+LKPcXm3kGu+N3dqFDAGFTaTDk8oCZmAVx+5NszWRW1s1NM6D+oeLLSbNhXiKaMlpZje/NKEvXxL0KoOhGxlbPG/9LP/7gIgvYmkMmCLLOUEEHmfuHUc7RvezBO9Xwy38moDrQLlmtQECFD8Osg/XCk7I4gRhDsAmVLs+moW+2lRxmBh9hNYqcIy5jYOjXMLC/S57zw3KNhPGz7llhwFs5EkGLnCuW1u5Eyk14ZaL2qZm1jq0Se4C+QUWPArSjVwwSaOIDM08lzkrFahh6x4mdbw6qCVuNZJmw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(40480700001)(36860700001)(83380400001)(316002)(86362001)(82740400003)(356005)(81166007)(6862004)(40460700003)(41300700001)(2906002)(82310400005)(4326008)(52536014)(5660300002)(53546011)(8936002)(7696005)(55016003)(9686003)(26005)(186003)(336012)(70586007)(8676002)(47076005)(6506007)(478600001)(966005)(54906003)(70206006)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 09:37:53.8185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8638516-3622-4e4e-3826-08dac623e79d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8481

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDEx5pyIMTTml6UgMTc6MjkN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogbmQgPG5kQGFybS5jb20+
OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1DQo+
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgR2Vv
cmdlIER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY4IDAvNl0gRGV2aWNlIHRyZWUgYmFzZWQgTlVNQSBzdXBwb3J0IGZvciBBcm0gLQ0KPiBQ
YXJ0IzINCj4gDQo+IE9uIDE0LjExLjIwMjIgMDk6MzMsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEhp
IEphbiwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IDIwMjLlubQxMeaciDE0
5pelIDE2OjIzDQo+ID4+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPj4gQ2M6
IG5kIDxuZEBhcm0uY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT47IFJvZ2VyDQo+IFBhdQ0KPiA+PiBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz47IEdlb3JnZSBEdW5sYXANCj4gPj4gPGdlb3JnZS5kdW5sYXBAY2l0
cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vDQo+ID4+IFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAwLzZdIERldmljZSB0cmVlIGJh
c2VkIE5VTUEgc3VwcG9ydCBmb3IgQXJtIC0NCj4gPj4gUGFydCMyDQo+ID4+DQo+ID4+IE9uIDE0
LjExLjIwMjIgMDk6MTQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gSGkgSmFuLA0KPiA+Pj4NCj4g
Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiAyMDIy5bm0MTHmnIgxNOaXpSAxNjow
NQ0KPiA+Pj4+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPj4+PiBDYzogbmQg
PG5kQGFybS5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsg
Um9nZXINCj4gPj4gUGF1DQo+ID4+Pj4gTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdl
aSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9yZ2UgRHVubGFwDQo+ID4+Pj4gPGdlb3JnZS5kdW5sYXBA
Y2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vDQo+ID4+
Pj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMC82XSBEZXZpY2Ug
dHJlZSBiYXNlZCBOVU1BIHN1cHBvcnQgZm9yIEFybSAtDQo+ID4+Pj4gUGFydCMyDQo+ID4+Pj4+
IFNvIGluIHRoaXMgcGF0Y2ggc2VyaWVzLCB3ZSBpbXBsZW1lbnQgYSBzZXQgb2YgTlVNQSBBUEkg
dG8gdXNlDQo+ID4+Pj4+IGRldmljZSB0cmVlIHRvIGRlc2NyaWJlIHRoZSBOVU1BIGxheW91dC4g
V2UgcmV1c2UgbW9zdCBvZiB0aGUNCj4gPj4+Pj4gY29kZSBvZiB4ODYgTlVNQSB0byBjcmVhdGUg
YW5kIG1haW50YWluIHRoZSBtYXBwaW5nIGJldHdlZW4NCj4gPj4+Pj4gbWVtb3J5IGFuZCBDUFUs
IGNyZWF0ZSB0aGUgbWF0cml4IGJldHdlZW4gYW55IHR3byBOVU1BIG5vZGVzLg0KPiA+Pj4+PiBF
eGNlcHQgQUNQSSBhbmQgc29tZSB4ODYgc3BlY2lmaWVkIGNvZGUsIHdlIGhhdmUgbW92ZWQgb3Ro
ZXINCj4gPj4+Pj4gY29kZSB0byBjb21tb24uIEluIG5leHQgc3RhZ2UsIHdoZW4gd2UgaW1wbGVt
ZW50IEFDUEkgYmFzZWQNCj4gPj4+Pj4gTlVNQSBmb3IgQXJtNjQsIHdlIG1heSBtb3ZlIHRoZSBB
Q1BJIE5VTUEgY29kZSB0byBjb21tb24gdG9vLA0KPiA+Pj4+PiBidXQgaW4gY3VycmVudCBzdGFn
ZSwgd2Uga2VlcCBpdCBhcyB4ODYgb25seS4NCj4gPj4+Pj4NCj4gPj4+Pj4gVGhpcyBwYXRjaCBz
ZXJpcmVzIGhhcyBiZWVuIHRlc3RlZCBhbmQgYm9vdGVkIHdlbGwgb24gb25lDQo+ID4+Pj4+IEFy
bTY0IE5VTUEgbWFjaGluZSBhbmQgb25lIEhQRSB4ODYgTlVNQSBtYWNoaW5lLg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDIyLQ0KPiA+Pj4+IDA2L21zZzAwNDk5Lmh0bWwNCj4gPj4+Pj4gWzJdIGh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMS0NCj4g
Pj4+PiAwOS9tc2cwMTkwMy5odG1sDQo+ID4+Pj4+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+PiB2NyAt
PiB2ODoNCj4gPj4+Pj4gIDEuIFJlYmFzZSBjb2RlIHRvIHJlc29sdmUgbWVyZ2UgY29uZmxpY3Qu
DQo+ID4+Pj4NCj4gPj4+PiBZb3UgbWVudGlvbiB0aGlzIGhlcmUgYnV0IG5vdCBpbiBhbnkgb2Yg
dGhlIHBhdGNoZXMuIFdoaWNoIGxlYXZlcw0KPiA+Pj4+IHJldmlld2VycyBndWVzc2luZyB3aGVy
ZSB0aGUgcmUtYmFzZSBhY3R1YWxseSB3YXM6IFJlLWJhc2VzLCBhdA0KPiA+Pj4+IGxlYXN0IHNv
bWV0aW1lcywgYWxzbyBuZWVkIChyZS0pcmV2aWV3aW5nLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4g
SSBqdXN0IGFwcGxpZWQgdGhlIHY3IHRvIHRoZSBsYXRlc3Qgc3RhZ2luZyBicmFuY2gsIHRoaXMg
d29yayBoYXMgbm90DQo+ID4+PiBHZW5lcmF0ZWQgYW55IG5ldyBjaGFuZ2UgZm9yIHRoaXMgc2Vy
aWVzLiBJIHNob3VsZCBoYXZlIGRlc2NyaWJlZCBpdA0KPiA+Pj4gY2xlYXIgb3Igbm90IG1lbnRp
b25lZCB0aGlzIGluIGNvdmVyIGxldHRlci4gU29ycnkgZm9yIGNvbmZ1c2luZyB5b3UhDQo+ID4+
DQo+ID4+IEJ1dCB5b3UgdGFsayBhYm91dCBhIG1lcmdlIGNvbmZsaWN0LiBBbmQgdGhhdCdzIHdo
YXQgSSByZWZlciB0byB3aGVuDQo+ID4+IHNheWluZyAibWF5IG5lZWQgKHJlLSlyZXZpZXdpbmci
LiBUaGUgc2FtZSBoYXBwZW5lZCBkdXJpbmcgZWFybGllcg0KPiA+PiB2ZXJzaW9ucyBvZiB0aGUg
c2VyaWVzLCBleGNlcHQgdGhlcmUgSSB3YXMgYXdhcmUgb2Ygd2hhdCB5b3UgbmVlZGVkDQo+ID4+
IHRvIHJlLWJhc2Ugb3ZlciBiZWNhdXNlIGl0IHdhcyBjaGFuZ2VzIEkgaGFkIGRvbmUgKGFkZHJl
c3NpbmcNCj4gPj4gb2JzZXJ2YXRpb25zIG1hZGUgd2hpbGUgcmV2aWV3aW5nIHlvdXIgY2hhbmdl
cykuIFRoaXMgdGltZSByb3VuZCBJJ20NCj4gPj4gc2ltcGx5IG5vdCBhd2FyZSBvZiB3aGF0IGNo
YW5nZShzKSB5b3UgbmVlZGVkIHRvIHJlLWJhc2Ugb3ZlciAod2hpY2gNCj4gPj4gaXMgd2h5IEkg
cG9pbnRlZCBvdXQgdGhhdCBpdCBpcyBnZW5lcmFsbHkgaGVscGZ1bCB0byBpbmRpY2F0ZSBvbiBh
DQo+ID4+IHBlci1wYXRjaCBiYXNpcyB3aGVuIG5vbi10cml2aWFsIHJlLWJhc2luZyB3YXMgaW52
b2x2ZWQpLg0KPiA+Pg0KPiA+DQo+ID4gSSBoYWQgdGhvdWdodCBpdCB3YXMgYSBjb2RlIGNvbmZs
aWN0IGJlZm9yZSwgYmVjYXVzZSBvdXIgaW50ZXJuYWwgZ2Vycml0DQo+ID4gc3lzdGVtIG1hcmtl
ZCB0aGF0IHRoaXMgc2VyaWVzIGhhcyBhIG1lcmdlIGNvbmZsaWN0LiBCdXQgdGhlIGFjdHVhbA0K
PiA+IHNpdHVhdGlvbiBpcyBvdXIgZ2Vycml0IHNldHRpbmcgcG9saWN5IHByb2JsZW0uIFRoZXJl
IGFyZSBubyBjb2RlDQo+IGNvbmZsaWN0cw0KPiA+IGluIHRoZXNlIHBhdGNoZXMgdGhlbXNlbHZl
cy4gV2UgYWxzbyBkaWQgbm90IG1vZGlmeSB0aGUgcGF0Y2ggdG8gcmVzb2x2ZQ0KPiA+IHRoZSBn
ZXJyaXQgY29uZmxpY3RzLiBSZWdhcmRsZXNzIG9mIHdoZXRoZXIgaXQgaXMgYSBuZXcgb3Igb2xk
IHZlcnNpb24sDQo+ID4gaWYgSSBtb2RpZnkgdGhlIHBhdGNoLCBJIHdpbGwgcmVtb3ZlIHRoZSBy
ZXZpZXdlZC1ieS4NCj4gDQo+IEknZCBwcmVmZXIgaWYgeW91IGRpZG4ndCB1bmlsYXRlcmFsbHku
IEluc3RlYWQgSSdkIGxpa2UgdG8gc3VnZ2VzdCB0aGF0DQo+IHlvdSBhcHBseSBjb21tb24gc2Vu
c2UgYXMgdG8gd2hldGhlciBtZXJlIHJlLWJhc2luZyBtaWdodCBhY3R1YWxseQ0KPiBpbnZhbGlk
YXRlIHByZXZpb3VzbHkgc3VwcGxpZWQgdGFncy4NCj4gDQoNCkkgd2lsbCBrZWVwIHRoaXMgaW4g
bWluZCBpbiB0aGUgZnV0dXJlLiBTaW5jZSBmb3IgdjggdGhlcmUgaXMgYWN0dWFsbHkgbm8NCmNo
YW5nZSAoZXhjZXB0IHBhdGNoIDUgdG8gZml4IHRoZSBjb21tZW50KSBjb21wYXJlZCB0byBpbiB0
aGUgcmViYXNlDQpjb21wYXJlZCB0byB2Nywgc2hvdWxkIEkgaW52YWxpZGF0ZSB5b3VyIHRhZ3Mg
dGhpcyB0aW1lPw0KDQpUaGFua3MsDQpXZWkgQ2hlbg0KDQo+IEphbg0K


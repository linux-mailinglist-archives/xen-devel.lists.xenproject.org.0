Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7660671A8F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 12:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480513.744973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6bu-0002IJ-Bq; Wed, 18 Jan 2023 11:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480513.744973; Wed, 18 Jan 2023 11:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6bu-0002FR-8I; Wed, 18 Jan 2023 11:28:06 +0000
Received: by outflank-mailman (input) for mailman id 480513;
 Wed, 18 Jan 2023 11:28:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BRoI=5P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pI6bt-0002FL-8G
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 11:28:05 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2adaf81f-9723-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 12:28:02 +0100 (CET)
Received: from AS8PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:20b:310::18)
 by PAWPR08MB9493.eurprd08.prod.outlook.com (2603:10a6:102:2e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 11:27:59 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::48) by AS8PR04CA0013.outlook.office365.com
 (2603:10a6:20b:310::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.20 via Frontend
 Transport; Wed, 18 Jan 2023 11:27:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 11:27:59 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Wed, 18 Jan 2023 11:27:59 +0000
Received: from b74a11de5e96.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B9E75E56-92EC-423F-9279-C9C139F7B6C0.1; 
 Wed, 18 Jan 2023 11:27:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b74a11de5e96.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 11:27:53 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS2PR08MB9413.eurprd08.prod.outlook.com (2603:10a6:20b:597::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 18 Jan
 2023 11:27:51 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 11:27:51 +0000
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
X-Inumbo-ID: 2adaf81f-9723-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QArN9qPQXn/8MkrJvwK66iPWzdS7b226kdQrT4vmHig=;
 b=sN/k5Gbw18gxTNVt3y4N50TC1I0WGg5ewCQiaQrTWXULROpn7AJy35xyDyWKQ6zsfYy2OSfDzVGo62eegYrEISRGiQrugn+sK+x+jmbwUG4qAZbwrcHgQkM8FwjALOd5B8RIak8SxbsdNACkIvNM+lsoScQQCEaDjSS+gorJxBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VH8oLqORIAYnFdOC/pv15Z91FYIKfYRZqM2zKgTOmmfbd5tRtEcc7SeglXO6RH8YxNpHlq3Co5Gf6V1/G0seq2jl197JrPVtFwC4ieeePkD5vN7UWD1oeD/9rkToy/Lyuu9YVn5GGIfwWJY4re5CQAqdTUyic2OYcA9JUqWCDFGR8y3HKDNmq81nElE1dhcKOf+mmUSAKP+bnOEESwnM/AhH+cLZQJJK+JhHp30n9SKhTd7wCAMeQRnYOD9TpaSICtcNnQTzJNLhHZdumPr5CNzX5StX8nmLc3S3/Vi4dMg8VqCWUf1xWm6Ga+rR/U0jEOscGwZ5Z7k+GjFN/leBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QArN9qPQXn/8MkrJvwK66iPWzdS7b226kdQrT4vmHig=;
 b=NZEOCK4sZtyJlVJkuGLSYl5YMsbIvv+/4KXgwJqH7IJQvtVNOaWd1GohiBHahR/hCQE3itMJxVgFwb0lRJMQJYFXGPgzFGaDTVZONxFXIi+LGBwFJC4N+RpkeBeLDK9eirODnuRMam2Ygwa34Q9g0xVZfl1ip+DM8AFMQd0IcNQQ1wVkjp3Su2bWF3I5SMjWHuo8hZeSrjQSjtWNBZTnV33OPU2ThieGlOhqxsXZvVX9RqxC9JVNfcScx+9kM08pdtcCNRFJdBqTCINk/TfLF7ReX9Ye6/+cnqBO3sM5wjuUTcqnTn7rP05RyF5+aUenfkzjixmLKfWHfgXwp4SUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QArN9qPQXn/8MkrJvwK66iPWzdS7b226kdQrT4vmHig=;
 b=sN/k5Gbw18gxTNVt3y4N50TC1I0WGg5ewCQiaQrTWXULROpn7AJy35xyDyWKQ6zsfYy2OSfDzVGo62eegYrEISRGiQrugn+sK+x+jmbwUG4qAZbwrcHgQkM8FwjALOd5B8RIak8SxbsdNACkIvNM+lsoScQQCEaDjSS+gorJxBw=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>
Subject: RE: [PATCH v2 04/40] xen/arm: add an option to define Xen start
 address for Armv8-R
Thread-Topic: [PATCH v2 04/40] xen/arm: add an option to define Xen start
 address for Armv8-R
Thread-Index:
 AQHZJxAXLGszZRVrMECopJok59rQha6jR3wAgAA4E5CAAHUeAIAABBnwgAARHYCAAAZzkA==
Date: Wed, 18 Jan 2023 11:27:51 +0000
Message-ID:
 <PAXPR08MB74203FFE3B863DBA465A335A9EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-5-Penny.Zheng@arm.com>
 <e406484a-aad3-4953-afdb-3159597ec998@xen.org>
 <PAXPR08MB7420A5C7F93F23F14C77C9BA9EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <7ffe5d34-614d-f2aa-cf87-c518917c970a@xen.org>
 <PAXPR08MB7420F43284FEC60BC88496709EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <b13c0904-3503-8894-8b14-64fcc717d50d@xen.org>
In-Reply-To: <b13c0904-3503-8894-8b14-64fcc717d50d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4E2E875935C2634FA5E408E7F090F013.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS2PR08MB9413:EE_|AM7EUR03FT036:EE_|PAWPR08MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be64594-15b5-4cb7-1099-08daf9470ddf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3Mid17kjfb7fRcY1qzxV4WJWfTLfrrkhv2Opp4ER/GighRrsq0GmguaDEJHSo7srjHDxvuF6yKZnN8zLqci6ZO0E8eY/KKLhsN+3uO8nN/UNN5TCyw4HIVs0H41H4IFTcwAdDQpkNhl/fO+2UB5jC57c5kOhA/voy15j5pEJUDu5oQfVLnokZeDAcZN/tcXogjVvSkWZ6F6ZG3702H8Asfz5avukADjI9i3vh+5BBwqrYyrVMnVnk7k9WWQuTZZ9M9ybmtWN74f2iIgOiNcRxKd96qZT1QjsqKhD/q0O9k5iZMUy2BdiJgGNk5Y4DNSg8UhRLKjJ9CinxPjR8cMyrt8U7PsVTlG5oEWu+ZlXxFjXdhpsJRe7GS3h52S2JbkNwTdgsB8UeIQjyevzhFLX44LJW4DYv9f3nQWcL1Oj56UpZsWME+fo1CnjVFNQkiSmxr0pLVD8HG0D7SK5Z5CKGq+eDgIWRsI7yauR4MZWdghMuxNNZTW1qIVPGMX7uHFokY6SUZX3jZ3KqNiea4J2u57HRkV84oexvzPjnD2Td1SxZSJuTt/8wYEYgFNOtPjQfiZ41X8SjDeuQ6T0qEzRt1j2+RRFj7UWOIkDZP7FmbEkcreCsu6sJygUMh5BxUHb7UqNHB2eECcNFsS2xZ2PaJIU59gAUCo4r5QmG1cmBplQl0pXTUbet0DFBs5ASdTIRwgBQ2h/WVBRun0PDykOTA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199015)(71200400001)(478600001)(6506007)(7696005)(122000001)(33656002)(26005)(53546011)(186003)(9686003)(316002)(54906003)(110136005)(4326008)(66946007)(8676002)(66446008)(66556008)(66476007)(64756008)(76116006)(41300700001)(83380400001)(8936002)(52536014)(55016003)(2906002)(5660300002)(38070700005)(38100700002)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9413
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	170273a9-b271-4c11-8528-08daf94708f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qNLKEEOu3/VVmYxeA04dFYE8ZAxu3wKchEEsR3LAaF0BngSWOYcwZv4WnvrocgSL7662E03+3V9qV2KUP+LZQzqe7Br/kg9ukXO3qitsqx54+ONEDXxbsf3odHQZq6GVL8VQz3TCFfnFGFWSWxzVkehOn6WYour9cW1vaWEAB8IqqqCKP6+ipTLzfR15GTnKDu91IZLrzLO4jGbTvTutuyL5+P2F+35qAdQHpH/3irQGzB/+xTT+EmqHgSmK6PICIls3tYydTDLSz3gubtlxRZtRYGZkTu+sLLfy4Wbe+EQ36E+3LwaraIe9gDdmjk/QOVtd8Ec0VhGrOJw6aF08E11V+4P7HivsrZ2yiRWvV41Vz/jv877JevvckvTvhzDfDnbmd9iVcTcNKRHf3ouUNc1e/RCZJI4Ta7pMUhWdisvsb0UTFhINZM0Eb9i8eDYfOwA4mwmqZSdbRUj8qFkudLGaFTvxXz30Ok41F/S7zItY4wbShOUDLOt637+LNh/J/h24FRryOVHjPaLm6Wb1iNLisG7GOjzwkpKcnzZw1qXJe0TGegwf/Y+/WlYTR/5ogf/NXFZn7THfTCgvtbPjWObBdUOI6C4aZ7cNAJlIf8J9y2XHRpxF5/EEPaj0gCMU3duDp0Kxo8C9al0VDYwnzUwcskFPcBESY76D9nXyHxowXh5Pted/NsYsRZncqbWm/mHQi8KIKPA0UbTJcw7dhQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(52536014)(41300700001)(4326008)(8676002)(70206006)(8936002)(70586007)(40460700003)(33656002)(336012)(2906002)(82310400005)(36860700001)(5660300002)(316002)(110136005)(54906003)(40480700001)(55016003)(7696005)(86362001)(9686003)(186003)(478600001)(81166007)(53546011)(26005)(6506007)(356005)(82740400003)(83380400001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 11:27:59.6438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be64594-15b5-4cb7-1099-08daf9470ddf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9493

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1k
ZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
Zg0KPiBKdWxpZW4gR3JhbGwNCj4gU2VudDogMjAyM+W5tDHmnIgxOOaXpSAxOTowMA0KPiBUbzog
V2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJt
LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMNCj4g
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJf
QmFiY2h1a0BlcGFtLmNvbT47DQo+IEppYW1laSBYaWUgPEppYW1laS5YaWVAYXJtLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MiAwNC80MF0geGVuL2FybTogYWRkIGFuIG9wdGlvbiB0byBk
ZWZpbmUgWGVuIHN0YXJ0DQo+IGFkZHJlc3MgZm9yIEFybXY4LVINCj4gDQo+IEhpLA0KPiANCj4g
T24gMTgvMDEvMjAyMyAxMDoyMiwgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiBBbHRob3VnaCBpdCBp
cyB1bmxpa2VseSB0aGF0IHZlbmRvcnMgdXNpbmcgdGhlIEFybXY4LVIgSVAgd2lsbCBkbyBzbywN
Cj4gaXQNCj4gPj4+IGlzIGluZGVlZCBhbiBvcHRpb24uIEluIHRoZSBJRCByZWdpc3RlciwgdGhl
cmUgYXJlIGFsc28gcmVsYXRlZCBiaXRzDQo+IGluDQo+ID4+PiBJRF9BQTY0TU1GUjBfRUwxIChN
U0FfZnJhYykgdG8gaW5kaWNhdGUgdGhpcy4NCj4gPj4+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+PiAg
ICAgeGVuL2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgIHwgIDggKysrKysrKysNCj4gPj4+Pj4g
ICAgIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZyB8IDE2ICsrKysrKysrKysrKystLS0N
Cj4gPj4+Pj4gICAgIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gPj4+Pj4NCj4gPj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmln
IGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPj4+Pj4gaW5kZXggYWNlNzE3OGM5YS4uYzZiNmI2
MTJkMSAxMDA2NDQNCj4gPj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4gPj4+Pj4gQEAgLTE0NSw2ICsxNDUsMTQgQEAg
Y29uZmlnIFRFRQ0KPiA+Pj4+PiAgICAgCSAgVGhpcyBvcHRpb24gZW5hYmxlcyBnZW5lcmljIFRF
RSBtZWRpYXRvcnMgc3VwcG9ydC4gSXQgYWxsb3dzDQo+ID4+Pj4gZ3Vlc3RzDQo+ID4+Pj4+ICAg
ICAJICB0byBhY2Nlc3MgcmVhbCBURUUgdmlhIG9uZSBvZiBURUUgbWVkaWF0b3JzIGltcGxlbWVu
dGVkIGluDQo+ID4+IFhFTi4NCj4gPj4+Pj4NCj4gPj4+Pj4gK2NvbmZpZyBYRU5fU1RBUlRfQURE
UkVTUw0KPiA+Pj4+PiArCWhleCAiWGVuIHN0YXJ0IGFkZHJlc3M6IGtlZXAgZGVmYXVsdCB0byB1
c2UgcGxhdGZvcm0gZGVmaW5lZA0KPiA+Pj4+IGFkZHJlc3MiDQo+ID4+Pj4+ICsJZGVmYXVsdCAw
DQo+ID4+Pj4+ICsJZGVwZW5kcyBvbiBBUk1fVjhSDQo+ID4+Pj4NCj4gPj4+PiBJdCBpcyBzdGls
bCBwcmV0dHkgdW5jbGVhciB0byBtZSB3aGF0IHdvdWxkIGJlIHRoZSBkaWZmZXJlbmNlIGJldHdl
ZW4NCj4gPj4+PiBIQVNfTVBVIGFuZCBBUk1fVjhSLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gSWYg
d2UgZG9uJ3Qgd2FudCB0byBzdXBwb3J0IG5vbi1NUFUgc3VwcG9ydGVkIEFybXY4LVIsIEkgdGhp
bmsgdGhleQ0KPiBhcmUNCj4gPj4gdGhlDQo+ID4+PiBzYW1lLiBJTU8sIG5vbi1NUFUgc3VwcG9y
dGVkIEFybXY4LVIgaXMgbWVhbmluZ2xlc3MgdG8gWGVuLg0KPiA+PiBPT0ksIHdoeSBkbyB5b3Ug
dGhpbmsgdGhpcyBpcyBtZWFuaW5nbGVzcz8NCj4gPg0KPiA+IElmIHRoZXJlIGlzIEFybXY4LVIg
Ym9hcmQgd2l0aG91dCBFTDIgTVBVLCBob3cgY2FuIHdlIHByb3RlY3QgWGVuPw0KPiANCj4gU28g
d2hhdCB5b3UgY2FsbCBFTDIgTVBVIGlzIGFuIE1QVSB0aGF0IGlzIGZvbGxvd2luZyB0aGUgQXJt
DQo+IHNwZWNpZmljYXRpb24uIEluIHRoZW9yeSwgeW91IGNvdWxkIGhhdmUgYSBwcm9wcmlldGFy
eSBtZWNoYW5pc20gZm9yIHRoYXQuDQo+IA0KPiBTbyB0aGUgcXVlc3Rpb24gaXMgd2hldGhlciBh
IHN5c3RlbSBub3QgZm9sbG93aW5nIHRoZSBBcm0gc3BlY2lmaWNhdGlvbg0KPiBpcyBhbGxvd2Vk
Lg0KPiANCg0KSSB0aGluayBubywgdGhlIFBNU0EgaXMgYW4gYXJjaGl0ZWN0dXJhbCBmZWF0dXJl
LCB0aGUgc3BlYyBjb250YWlucyBDUFUgYW5kIE1QVQ0KaW50ZXJmYWNlcy4gVmVuZG9ycyBjYW4g
aGF2ZSB0aGVpciBvd24gaGFyZHdhcmUgaW1wbGVtZW50YXRpb24sIGJ1dCBuZWVkIGZvbGxvdw0K
dGhlIEFybSBzcGVjLg0KDQpCdXQgSSBhZ3JlZSB0aGF0LCBoZXJlIHdlIGNvdWxkIGNoYW5nZSB0
byAiZGVwZW5kcyBvbiBIQVNfTVBVIiB3aGljaCB3aWxsIG1ha2UNCkl0IGVhc2llciB0byB1c2Vk
IGJ5IG90aGVyIEFybSBBcmNoaXRlY3R1cmUgb3Igb3RoZXIgYXJjaGl0ZWN0dXJlIGluIHRoZSBm
dXR1cmUuDQoNCkNoZWVycywNCldlaSBDaGVuDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVs
aWVuIEdyYWxsDQoNCg==

